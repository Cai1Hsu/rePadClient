package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.Iterator;
import org.apache.http.auth.AUTH;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.Resources;
import org.apache.tools.ant.types.resources.URLProvider;
import org.apache.tools.ant.types.resources.URLResource;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Get.class */
public class Get extends Task {
    private static final int BIG_BUFFER_SIZE = 102400;
    private static final int DOTS_PER_LINE = 50;
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final String HTTP = "http";
    private static final String HTTPS = "https";
    private static final int NUMBER_RETRIES = 3;
    private static final int REDIRECT_LIMIT = 25;
    static Class class$org$apache$tools$ant$types$resources$URLProvider;
    private File destination;
    private Resources sources = new Resources();
    private boolean verbose = false;
    private boolean useTimestamp = false;
    private boolean ignoreErrors = false;
    private String uname = null;
    private String pword = null;
    private long maxTime = 0;
    private int numberRetries = 3;
    private boolean skipExisting = false;
    private boolean httpUseCaches = true;
    private Mapper mapperElement = null;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Get$Base64Converter.class */
    protected static class Base64Converter extends org.apache.tools.ant.util.Base64Converter {
        protected Base64Converter() {
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Get$DownloadProgress.class */
    public interface DownloadProgress {
        void beginDownload();

        void endDownload();

        void onTick();
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Get$GetThread.class */
    private class GetThread extends Thread {
        private URLConnection connection;
        private final File dest;
        private final boolean hasTimestamp;
        private final int logLevel;
        private final DownloadProgress progress;
        private final URL source;
        private final Get this$0;
        private final long timestamp;
        private boolean success = false;
        private IOException ioexception = null;
        private BuildException exception = null;
        private InputStream is = null;
        private OutputStream os = null;
        private int redirections = 0;

        GetThread(Get get, URL url, File file, boolean z, long j, DownloadProgress downloadProgress, int i) {
            this.this$0 = get;
            this.source = url;
            this.dest = file;
            this.hasTimestamp = z;
            this.timestamp = j;
            this.progress = downloadProgress;
            this.logLevel = i;
        }

        private boolean downloadFile() throws FileNotFoundException, IOException {
            int read;
            boolean z = false;
            for (int i = 0; i < this.this$0.numberRetries; i++) {
                try {
                    this.is = this.connection.getInputStream();
                    break;
                } catch (IOException e) {
                    this.this$0.log(new StringBuffer().append("Error opening connection ").append(e).toString(), this.logLevel);
                }
            }
            if (this.is == null) {
                this.this$0.log(new StringBuffer().append("Can't get ").append(this.source).append(" to ").append(this.dest).toString(), this.logLevel);
                if (!this.this$0.ignoreErrors) {
                    throw new BuildException(new StringBuffer().append("Can't get ").append(this.source).append(" to ").append(this.dest).toString(), this.this$0.getLocation());
                }
            } else {
                this.os = new FileOutputStream(this.dest);
                this.progress.beginDownload();
                try {
                    byte[] bArr = new byte[Get.BIG_BUFFER_SIZE];
                    while (!isInterrupted() && (read = this.is.read(bArr)) >= 0) {
                        this.os.write(bArr, 0, read);
                        this.progress.onTick();
                    }
                    boolean z2 = !isInterrupted();
                    FileUtils.close(this.os);
                    FileUtils.close(this.is);
                    if (!z2) {
                        this.dest.delete();
                    }
                    this.progress.endDownload();
                    z = true;
                } catch (Throwable th) {
                    FileUtils.close(this.os);
                    FileUtils.close(this.is);
                    if (0 == 0) {
                        this.dest.delete();
                    }
                    throw th;
                }
            }
            return z;
        }

        private boolean get() throws IOException, BuildException {
            boolean z;
            this.connection = openConnection(this.source);
            if (this.connection == null) {
                z = false;
            } else {
                boolean downloadFile = downloadFile();
                z = downloadFile;
                if (downloadFile) {
                    z = downloadFile;
                    if (this.this$0.useTimestamp) {
                        updateTimeStamp();
                        z = downloadFile;
                    }
                }
            }
            return z;
        }

        private URLConnection openConnection(URL url) throws IOException {
            URLConnection openConnection = url.openConnection();
            if (this.hasTimestamp) {
                openConnection.setIfModifiedSince(this.timestamp);
            }
            if (this.this$0.uname != null || this.this$0.pword != null) {
                openConnection.setRequestProperty(AUTH.WWW_AUTH_RESP, new StringBuffer().append("Basic ").append(new Base64Converter().encode(new StringBuffer().append(this.this$0.uname).append(":").append(this.this$0.pword).toString().getBytes())).toString());
            }
            if (openConnection instanceof HttpURLConnection) {
                ((HttpURLConnection) openConnection).setInstanceFollowRedirects(false);
                ((HttpURLConnection) openConnection).setUseCaches(this.this$0.httpUseCaches);
            }
            try {
                openConnection.connect();
                URLConnection uRLConnection = openConnection;
                if (openConnection instanceof HttpURLConnection) {
                    HttpURLConnection httpURLConnection = (HttpURLConnection) openConnection;
                    int responseCode = httpURLConnection.getResponseCode();
                    if (responseCode == 301 || responseCode == 302 || responseCode == 303) {
                        String headerField = httpURLConnection.getHeaderField("Location");
                        this.this$0.log(new StringBuffer().append(url).append(responseCode == 301 ? " permanently" : "").append(" moved to ").append(headerField).toString(), this.logLevel);
                        URL url2 = new URL(url, headerField);
                        uRLConnection = !redirectionAllowed(url, url2) ? null : openConnection(url2);
                    } else {
                        long lastModified = httpURLConnection.getLastModified();
                        if (responseCode == 304 || (lastModified != 0 && this.hasTimestamp && this.timestamp >= lastModified)) {
                            this.this$0.log("Not modified - so not downloaded", this.logLevel);
                            uRLConnection = null;
                        } else {
                            uRLConnection = openConnection;
                            if (responseCode == 401) {
                                if (!this.this$0.ignoreErrors) {
                                    throw new BuildException("HTTP Authorization failure");
                                }
                                this.this$0.log("HTTP Authorization failure", this.logLevel);
                                uRLConnection = null;
                            }
                        }
                    }
                }
                return uRLConnection;
            } catch (NullPointerException e) {
                throw new BuildException(new StringBuffer().append("Failed to parse ").append(this.source.toString()).toString(), e);
            }
        }

        private boolean redirectionAllowed(URL url, URL url2) {
            boolean z = false;
            if (url.getProtocol().equals(url2.getProtocol()) || ("http".equals(url.getProtocol()) && Get.HTTPS.equals(url2.getProtocol()))) {
                this.redirections++;
                if (this.redirections <= 25) {
                    z = true;
                } else if (!this.this$0.ignoreErrors) {
                    throw new BuildException("More than 25 times redirected, giving up");
                } else {
                    this.this$0.log("More than 25 times redirected, giving up", this.logLevel);
                }
            } else {
                String stringBuffer = new StringBuffer().append("Redirection detected from ").append(url.getProtocol()).append(" to ").append(url2.getProtocol()).append(". Protocol switch unsafe, not allowed.").toString();
                if (!this.this$0.ignoreErrors) {
                    throw new BuildException(stringBuffer);
                }
                this.this$0.log(stringBuffer, this.logLevel);
            }
            return z;
        }

        private void updateTimeStamp() {
            long lastModified = this.connection.getLastModified();
            if (this.this$0.verbose) {
                this.this$0.log(new StringBuffer().append("last modified = ").append(new Date(lastModified).toString()).append(lastModified == 0 ? " - using current time instead" : "").toString(), this.logLevel);
            }
            if (lastModified != 0) {
                Get.FILE_UTILS.setFileLastModified(this.dest, lastModified);
            }
        }

        void closeStreams() {
            interrupt();
            FileUtils.close(this.os);
            FileUtils.close(this.is);
            if (this.success || !this.dest.exists()) {
                return;
            }
            this.dest.delete();
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            try {
                this.success = get();
            } catch (IOException e) {
                this.ioexception = e;
            } catch (BuildException e2) {
                this.exception = e2;
            }
        }

        boolean wasSuccessful() throws IOException, BuildException {
            if (this.ioexception != null) {
                throw this.ioexception;
            }
            if (this.exception == null) {
                return this.success;
            }
            throw this.exception;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Get$NullProgress.class */
    public static class NullProgress implements DownloadProgress {
        @Override // org.apache.tools.ant.taskdefs.Get.DownloadProgress
        public void beginDownload() {
        }

        @Override // org.apache.tools.ant.taskdefs.Get.DownloadProgress
        public void endDownload() {
        }

        @Override // org.apache.tools.ant.taskdefs.Get.DownloadProgress
        public void onTick() {
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Get$VerboseProgress.class */
    public static class VerboseProgress implements DownloadProgress {
        private int dots = 0;
        PrintStream out;

        public VerboseProgress(PrintStream printStream) {
            this.out = printStream;
        }

        @Override // org.apache.tools.ant.taskdefs.Get.DownloadProgress
        public void beginDownload() {
            this.dots = 0;
        }

        @Override // org.apache.tools.ant.taskdefs.Get.DownloadProgress
        public void endDownload() {
            this.out.println();
            this.out.flush();
        }

        @Override // org.apache.tools.ant.taskdefs.Get.DownloadProgress
        public void onTick() {
            this.out.print(".");
            int i = this.dots;
            this.dots = i + 1;
            if (i > 50) {
                this.out.flush();
                this.dots = 0;
            }
        }
    }

    private void checkAttributes() {
        Class cls;
        if (this.sources.size() == 0) {
            throw new BuildException("at least one source is required", getLocation());
        }
        Iterator it = this.sources.iterator();
        while (it.hasNext()) {
            Resource resource = (Resource) it.next();
            if (class$org$apache$tools$ant$types$resources$URLProvider == null) {
                cls = class$("org.apache.tools.ant.types.resources.URLProvider");
                class$org$apache$tools$ant$types$resources$URLProvider = cls;
            } else {
                cls = class$org$apache$tools$ant$types$resources$URLProvider;
            }
            if (resource.as(cls) == null) {
                throw new BuildException("Only URLProvider resources are supported", getLocation());
            }
        }
        if (this.destination == null) {
            throw new BuildException("dest attribute is required", getLocation());
        }
        if (this.destination.exists() && this.sources.size() > 1 && !this.destination.isDirectory()) {
            throw new BuildException("The specified destination is not a directory", getLocation());
        }
        if (this.destination.exists() && !this.destination.canWrite()) {
            throw new BuildException(new StringBuffer().append("Can't write to ").append(this.destination.getAbsolutePath()).toString(), getLocation());
        }
        if (this.sources.size() <= 1 || this.destination.exists()) {
            return;
        }
        this.destination.mkdirs();
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public void add(ResourceCollection resourceCollection) {
        this.sources.add(resourceCollection);
    }

    public void add(FileNameMapper fileNameMapper) {
        createMapper().add(fileNameMapper);
    }

    public Mapper createMapper() throws BuildException {
        if (this.mapperElement != null) {
            throw new BuildException(Expand.ERROR_MULTIPLE_MAPPERS, getLocation());
        }
        this.mapperElement = new Mapper(getProject());
        return this.mapperElement;
    }

    public boolean doGet(int i, DownloadProgress downloadProgress) throws IOException {
        boolean z;
        Class cls;
        checkAttributes();
        Iterator it = this.sources.iterator();
        if (it.hasNext()) {
            Resource resource = (Resource) it.next();
            if (class$org$apache$tools$ant$types$resources$URLProvider == null) {
                cls = class$("org.apache.tools.ant.types.resources.URLProvider");
                class$org$apache$tools$ant$types$resources$URLProvider = cls;
            } else {
                cls = class$org$apache$tools$ant$types$resources$URLProvider;
            }
            z = doGet(((URLProvider) resource.as(cls)).getURL(), this.destination, i, downloadProgress);
        } else {
            z = false;
        }
        return z;
    }

    public boolean doGet(URL url, File file, int i, DownloadProgress downloadProgress) throws IOException {
        boolean wasSuccessful;
        if (!file.exists() || !this.skipExisting) {
            NullProgress nullProgress = downloadProgress;
            if (downloadProgress == null) {
                nullProgress = new NullProgress();
            }
            log(new StringBuffer().append("Getting: ").append(url).toString(), i);
            log(new StringBuffer().append("To: ").append(file.getAbsolutePath()).toString(), i);
            boolean z = false;
            long j = 0;
            if (this.useTimestamp) {
                z = false;
                j = 0;
                if (file.exists()) {
                    j = file.lastModified();
                    if (this.verbose) {
                        log(new StringBuffer().append("local file date : ").append(new Date(j).toString()).toString(), i);
                    }
                    z = true;
                }
            }
            GetThread getThread = new GetThread(this, url, file, z, j, nullProgress, i);
            getThread.setDaemon(true);
            getProject().registerThreadTask(getThread, this);
            getThread.start();
            try {
                getThread.join(this.maxTime * 1000);
            } catch (InterruptedException e) {
                log("interrupted waiting for GET to finish", 3);
            }
            if (getThread.isAlive()) {
                String stringBuffer = new StringBuffer().append("The GET operation took longer than ").append(this.maxTime).append(" seconds, stopping it.").toString();
                if (this.ignoreErrors) {
                    log(stringBuffer);
                }
                getThread.closeStreams();
                if (!this.ignoreErrors) {
                    throw new BuildException(stringBuffer);
                }
                wasSuccessful = false;
            } else {
                wasSuccessful = getThread.wasSuccessful();
            }
        } else {
            log(new StringBuffer().append("Destination already exists (skipping): ").append(file.getAbsolutePath()).toString(), i);
            wasSuccessful = true;
        }
        return wasSuccessful;
    }

    /* JADX WARN: Can't wrap try/catch for region: R(11:5|(1:7)(1:28)|8|(1:47)(2:10|(6:49|12|(1:14)|15|(1:17)|18)(3:29|(3:42|31|55)(3:48|32|(3:45|34|56)(3:50|35|(3:44|37|57)(2:51|38)))|52))|19|(1:21)|40|22|53|52|3) */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x00ba, code lost:
        r8 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x00bb, code lost:
        log(new java.lang.StringBuffer().append("Error getting ").append(r0).append(" to ").append(r9).toString());
     */
    /* JADX WARN: Code restructure failed: missing block: B:25:0x00e2, code lost:
        if (r6.ignoreErrors == false) goto L46;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x00f1, code lost:
        throw new org.apache.tools.ant.BuildException(r8, getLocation());
     */
    @Override // org.apache.tools.ant.Task
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void execute() throws BuildException {
        Class cls;
        checkAttributes();
        Iterator it = this.sources.iterator();
        while (it.hasNext()) {
            Resource resource = (Resource) it.next();
            if (class$org$apache$tools$ant$types$resources$URLProvider == null) {
                cls = class$("org.apache.tools.ant.types.resources.URLProvider");
                class$org$apache$tools$ant$types$resources$URLProvider = cls;
            } else {
                cls = class$org$apache$tools$ant$types$resources$URLProvider;
            }
            URL url = ((URLProvider) resource.as(cls)).getURL();
            File file = this.destination;
            if (this.destination.isDirectory()) {
                if (this.mapperElement == null) {
                    String path = url.getPath();
                    String str = path;
                    if (path.endsWith("/")) {
                        str = path.substring(0, path.length() - 1);
                    }
                    int lastIndexOf = str.lastIndexOf("/");
                    String str2 = str;
                    if (lastIndexOf > -1) {
                        str2 = str.substring(lastIndexOf + 1);
                    }
                    file = new File(this.destination, str2);
                } else {
                    String[] mapFileName = this.mapperElement.getImplementation().mapFileName(url.toString());
                    if (mapFileName == null) {
                        log(new StringBuffer().append("skipping ").append(resource).append(" - mapper can't handle it").toString(), 1);
                    } else if (mapFileName.length == 0) {
                        log(new StringBuffer().append("skipping ").append(resource).append(" - mapper returns no file name").toString(), 1);
                    } else if (mapFileName.length > 1) {
                        log(new StringBuffer().append("skipping ").append(resource).append(" - mapper returns multiple file").append(" names").toString(), 1);
                    } else {
                        file = new File(this.destination, mapFileName[0]);
                    }
                }
            }
            VerboseProgress verboseProgress = null;
            if (this.verbose) {
                verboseProgress = new VerboseProgress(System.out);
            }
            doGet(url, file, 2, verboseProgress);
        }
    }

    public void setDest(File file) {
        this.destination = file;
    }

    public void setHttpUseCaches(boolean z) {
        this.httpUseCaches = z;
    }

    public void setIgnoreErrors(boolean z) {
        this.ignoreErrors = z;
    }

    public void setMaxTime(long j) {
        this.maxTime = j;
    }

    public void setPassword(String str) {
        this.pword = str;
    }

    public void setRetries(int i) {
        this.numberRetries = i;
    }

    public void setSkipExisting(boolean z) {
        this.skipExisting = z;
    }

    public void setSrc(URL url) {
        add(new URLResource(url));
    }

    public void setUseTimestamp(boolean z) {
        this.useTimestamp = z;
    }

    public void setUsername(String str) {
        this.uname = str;
    }

    public void setVerbose(boolean z) {
        this.verbose = z;
    }
}
