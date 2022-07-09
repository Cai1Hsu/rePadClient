package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.util.Iterator;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.filters.ChainableReader;
import org.apache.tools.ant.types.RedirectorElement;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.FileProvider;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/VerifyJar.class */
public class VerifyJar extends AbstractJarSignerTask {
    public static final String ERROR_NO_FILE = "Not found :";
    public static final String ERROR_NO_VERIFY = "Failed to verify ";
    private static final String VERIFIED_TEXT = "jar verified.";
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private boolean certificates = false;
    private BufferingOutputFilter outputCache = new BufferingOutputFilter(null);

    /* renamed from: org.apache.tools.ant.taskdefs.VerifyJar$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/VerifyJar$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter.class */
    private static class BufferingOutputFilter implements ChainableReader {
        private BufferingOutputFilterReader buffer;

        private BufferingOutputFilter() {
        }

        BufferingOutputFilter(AnonymousClass1 anonymousClass1) {
            this();
        }

        @Override // org.apache.tools.ant.filters.ChainableReader
        public Reader chain(Reader reader) {
            this.buffer = new BufferingOutputFilterReader(reader);
            return this.buffer;
        }

        public void clear() {
            if (this.buffer != null) {
                this.buffer.clear();
            }
        }

        public String toString() {
            return this.buffer.toString();
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader.class */
    private static class BufferingOutputFilterReader extends Reader {
        private StringBuffer buffer = new StringBuffer();
        private Reader next;

        public BufferingOutputFilterReader(Reader reader) {
            this.next = reader;
        }

        public void clear() {
            this.buffer = new StringBuffer();
        }

        @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            this.next.close();
        }

        @Override // java.io.Reader
        public int read(char[] cArr, int i, int i2) throws IOException {
            int read = this.next.read(cArr, i, i2);
            this.buffer.append(cArr, i, i2);
            return read;
        }

        public String toString() {
            return this.buffer.toString();
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void verifyOneJar(File file) {
        if (!file.exists()) {
            throw new BuildException(new StringBuffer().append(ERROR_NO_FILE).append(file).toString());
        }
        ExecTask createJarSigner = createJarSigner();
        setCommonOptions(createJarSigner);
        bindToKeystore(createJarSigner);
        addValue(createJarSigner, "-verify");
        if (this.certificates) {
            addValue(createJarSigner, "-certs");
        }
        addValue(createJarSigner, file.getPath());
        log(new StringBuffer().append("Verifying JAR: ").append(file.getAbsolutePath()).toString());
        this.outputCache.clear();
        BuildException e = null;
        try {
            createJarSigner.execute();
        } catch (BuildException e2) {
            e = e2;
        }
        String bufferingOutputFilter = this.outputCache.toString();
        if (e != null) {
            if (bufferingOutputFilter.indexOf("zip file closed") < 0) {
                throw e;
            }
            log("You are running jarsigner against a JVM with a known bug that manifests as an IllegalStateException.", 1);
        }
        if (bufferingOutputFilter.indexOf(VERIFIED_TEXT) >= 0) {
            return;
        }
        throw new BuildException(new StringBuffer().append(ERROR_NO_VERIFY).append(file).toString());
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Class cls;
        if ((this.jar != null) || hasResources()) {
            beginExecution();
            RedirectorElement redirector = getRedirector();
            redirector.setAlwaysLog(true);
            redirector.createOutputFilterChain().add(this.outputCache);
            try {
                Iterator it = createUnifiedSourcePath().iterator();
                while (it.hasNext()) {
                    Resource resource = (Resource) it.next();
                    if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                        cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                        class$org$apache$tools$ant$types$resources$FileProvider = cls;
                    } else {
                        cls = class$org$apache$tools$ant$types$resources$FileProvider;
                    }
                    verifyOneJar(((FileProvider) resource.as(cls)).getFile());
                }
                return;
            } finally {
                endExecution();
            }
        }
        throw new BuildException(AbstractJarSignerTask.ERROR_NO_SOURCE);
    }

    public void setCertificates(boolean z) {
        this.certificates = z;
    }
}
