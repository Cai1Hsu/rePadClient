package org.apache.tools.ant.taskdefs;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PipedOutputStream;
import java.io.PrintStream;
import java.io.StringReader;
import java.util.Arrays;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.filters.util.ChainReaderHelper;
import org.apache.tools.ant.util.ConcatFileInputStream;
import org.apache.tools.ant.util.KeepAliveOutputStream;
import org.apache.tools.ant.util.LazyFileOutputStream;
import org.apache.tools.ant.util.LeadPipeInputStream;
import org.apache.tools.ant.util.LineOrientedOutputStreamRedirector;
import org.apache.tools.ant.util.OutputStreamFunneler;
import org.apache.tools.ant.util.ReaderInputStream;
import org.apache.tools.ant.util.StringUtils;
import org.apache.tools.ant.util.TeeOutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Redirector.class */
public class Redirector {
    private static final String DEFAULT_ENCODING = System.getProperty("file.encoding");
    private static final int STREAMPUMPER_WAIT_INTERVAL = 1000;
    private boolean alwaysLogErr;
    private boolean alwaysLogOut;
    private boolean appendErr;
    private boolean appendOut;
    private boolean appendProperties;
    private PropertyOutputStream baos;
    private boolean createEmptyFilesErr;
    private boolean createEmptyFilesOut;
    private Object errMutex;
    private File[] error;
    private PropertyOutputStream errorBaos;
    private String errorEncoding;
    private Vector errorFilterChains;
    private PrintStream errorPrintStream;
    private String errorProperty;
    private OutputStream errorStream;
    private Object inMutex;
    private File[] input;
    private String inputEncoding;
    private Vector inputFilterChains;
    private InputStream inputStream;
    private String inputString;
    private boolean logError;
    private boolean logInputString;
    private ProjectComponent managingTask;
    private File[] out;
    private Object outMutex;
    private PrintStream outPrintStream;
    private String outputEncoding;
    private Vector outputFilterChains;
    private String outputProperty;
    private OutputStream outputStream;
    private final ThreadGroup threadGroup;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Redirector$PropertyOutputStream.class */
    private class PropertyOutputStream extends ByteArrayOutputStream {
        private boolean closed = false;
        private String property;
        private final Redirector this$0;

        PropertyOutputStream(Redirector redirector, String str) {
            this.this$0 = redirector;
            this.property = str;
        }

        @Override // java.io.ByteArrayOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            synchronized (this.this$0.outMutex) {
                if (!this.closed && (!this.this$0.appendOut || !this.this$0.appendProperties)) {
                    this.this$0.setPropertyFromBAOS(this, this.property);
                    this.closed = true;
                }
            }
        }
    }

    public Redirector(ProjectComponent projectComponent) {
        this.logError = false;
        this.baos = null;
        this.errorBaos = null;
        this.appendOut = false;
        this.appendErr = false;
        this.alwaysLogOut = false;
        this.alwaysLogErr = false;
        this.createEmptyFilesOut = true;
        this.createEmptyFilesErr = true;
        this.outputStream = null;
        this.errorStream = null;
        this.inputStream = null;
        this.outPrintStream = null;
        this.errorPrintStream = null;
        this.outputEncoding = DEFAULT_ENCODING;
        this.errorEncoding = DEFAULT_ENCODING;
        this.inputEncoding = DEFAULT_ENCODING;
        this.appendProperties = true;
        this.threadGroup = new ThreadGroup("redirector");
        this.logInputString = true;
        this.inMutex = new Object();
        this.outMutex = new Object();
        this.errMutex = new Object();
        this.managingTask = projectComponent;
    }

    public Redirector(Task task) {
        this((ProjectComponent) task);
    }

    private void errorStreams() {
        if (this.error != null && this.error.length > 0) {
            this.errorStream = foldFiles(this.error, new StringBuffer("Error ").append(this.appendErr ? "appended" : "redirected").append(" to ").toString(), 3, this.appendErr, this.createEmptyFilesErr);
        } else if (!this.logError && this.outputStream != null && this.errorProperty == null) {
            OutputStreamFunneler outputStreamFunneler = new OutputStreamFunneler(this.outputStream, 0L);
            try {
                this.outputStream = new LineOrientedOutputStreamRedirector(outputStreamFunneler.getFunnelInstance());
                this.errorStream = new LineOrientedOutputStreamRedirector(outputStreamFunneler.getFunnelInstance());
            } catch (IOException e) {
                throw new BuildException("error splitting output/error streams", e);
            }
        }
        if (this.errorProperty == null) {
            this.errorBaos = null;
            return;
        }
        if (this.errorBaos == null) {
            this.errorBaos = new PropertyOutputStream(this, this.errorProperty);
            this.managingTask.log(new StringBuffer().append("Error redirected to property: ").append(this.errorProperty).toString(), 3);
        }
        OutputStream keepAliveOutputStream = new KeepAliveOutputStream(this.errorBaos);
        OutputStream outputStream = keepAliveOutputStream;
        if (this.error != null) {
            outputStream = this.error.length == 0 ? keepAliveOutputStream : new TeeOutputStream(this.errorStream, keepAliveOutputStream);
        }
        this.errorStream = outputStream;
    }

    private OutputStream foldFiles(File[] fileArr, String str, int i, boolean z, boolean z2) {
        LazyFileOutputStream lazyFileOutputStream = new LazyFileOutputStream(fileArr[0], z, z2);
        this.managingTask.log(new StringBuffer().append(str).append(fileArr[0]).toString(), i);
        char[] cArr = new char[str.length()];
        Arrays.fill(cArr, ' ');
        String str2 = new String(cArr);
        for (int i2 = 1; i2 < fileArr.length; i2++) {
            this.outputStream = new TeeOutputStream(this.outputStream, new LazyFileOutputStream(fileArr[i2], z, z2));
            this.managingTask.log(new StringBuffer().append(str2).append(fileArr[i2]).toString(), i);
        }
        return lazyFileOutputStream;
    }

    private void outStreams() {
        if (this.out != null && this.out.length > 0) {
            this.outputStream = foldFiles(this.out, new StringBuffer("Output ").append(this.appendOut ? "appended" : "redirected").append(" to ").toString(), 3, this.appendOut, this.createEmptyFilesOut);
        }
        if (this.outputProperty == null) {
            this.baos = null;
            return;
        }
        if (this.baos == null) {
            this.baos = new PropertyOutputStream(this, this.outputProperty);
            this.managingTask.log(new StringBuffer().append("Output redirected to property: ").append(this.outputProperty).toString(), 3);
        }
        OutputStream keepAliveOutputStream = new KeepAliveOutputStream(this.baos);
        if (this.outputStream != null) {
            keepAliveOutputStream = new TeeOutputStream(this.outputStream, keepAliveOutputStream);
        }
        this.outputStream = keepAliveOutputStream;
    }

    public void setPropertyFromBAOS(ByteArrayOutputStream byteArrayOutputStream, String str) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new StringReader(Execute.toString(byteArrayOutputStream)));
        StringBuffer stringBuffer = new StringBuffer();
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                this.managingTask.getProject().setNewProperty(str, stringBuffer.toString());
                return;
            }
            if (stringBuffer.length() != 0) {
                stringBuffer.append(StringUtils.LINE_SEP);
            }
            stringBuffer.append(readLine);
        }
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:95:0x015a -> B:31:0x00bd). Please submit an issue!!! */
    public void complete() throws IOException {
        System.out.flush();
        System.err.flush();
        synchronized (this.inMutex) {
            if (this.inputStream != null) {
                this.inputStream.close();
            }
        }
        synchronized (this.outMutex) {
            this.outputStream.flush();
            this.outputStream.close();
        }
        synchronized (this.errMutex) {
            this.errorStream.flush();
            this.errorStream.close();
        }
        synchronized (this) {
            while (this.threadGroup.activeCount() > 0) {
                try {
                    this.managingTask.log(new StringBuffer().append("waiting for ").append(this.threadGroup.activeCount()).append(" Threads:").toString(), 4);
                    Thread[] threadArr = new Thread[this.threadGroup.activeCount()];
                    this.threadGroup.enumerate(threadArr);
                    for (int i = 0; i < threadArr.length && threadArr[i] != null; i++) {
                        try {
                            this.managingTask.log(threadArr[i].toString(), 4);
                        } catch (NullPointerException e) {
                        }
                    }
                    wait(1000L);
                } catch (InterruptedException e2) {
                    Thread[] threadArr2 = new Thread[this.threadGroup.activeCount()];
                    this.threadGroup.enumerate(threadArr2);
                    for (int i2 = 0; i2 < threadArr2.length && threadArr2[i2] != null; i2++) {
                        threadArr2[i2].interrupt();
                    }
                }
            }
        }
        setProperties();
        synchronized (this.inMutex) {
            this.inputStream = null;
        }
        synchronized (this.outMutex) {
            this.outputStream = null;
            this.outPrintStream = null;
        }
        synchronized (this.errMutex) {
            this.errorStream = null;
            this.errorPrintStream = null;
        }
    }

    public ExecuteStreamHandler createHandler() throws BuildException {
        createStreams();
        return new PumpStreamHandler(getOutputStream(), getErrorStream(), getInputStream(), this.input == null && this.inputString == null);
    }

    public void createStreams() {
        synchronized (this.outMutex) {
            outStreams();
            if (this.alwaysLogOut || this.outputStream == null) {
                OutputStream logOutputStream = new LogOutputStream(this.managingTask, 2);
                if (this.outputStream != null) {
                    logOutputStream = new TeeOutputStream(logOutputStream, this.outputStream);
                }
                this.outputStream = logOutputStream;
            }
            if ((this.outputFilterChains != null && this.outputFilterChains.size() > 0) || !this.outputEncoding.equalsIgnoreCase(this.inputEncoding)) {
                try {
                    LeadPipeInputStream leadPipeInputStream = new LeadPipeInputStream();
                    leadPipeInputStream.setManagingComponent(this.managingTask);
                    InputStreamReader inputStreamReader = new InputStreamReader(leadPipeInputStream, this.inputEncoding);
                    InputStreamReader inputStreamReader2 = inputStreamReader;
                    if (this.outputFilterChains != null) {
                        inputStreamReader2 = inputStreamReader;
                        if (this.outputFilterChains.size() > 0) {
                            ChainReaderHelper chainReaderHelper = new ChainReaderHelper();
                            chainReaderHelper.setProject(this.managingTask.getProject());
                            chainReaderHelper.setPrimaryReader(inputStreamReader);
                            chainReaderHelper.setFilterChains(this.outputFilterChains);
                            inputStreamReader2 = chainReaderHelper.getAssembledReader();
                        }
                    }
                    Thread thread = new Thread(this.threadGroup, new StreamPumper(new ReaderInputStream(inputStreamReader2, this.outputEncoding), this.outputStream, true), "output pumper");
                    thread.setPriority(10);
                    this.outputStream = new PipedOutputStream(leadPipeInputStream);
                    thread.start();
                } catch (IOException e) {
                    throw new BuildException("error setting up output stream", e);
                }
            }
        }
        synchronized (this.errMutex) {
            errorStreams();
            if (this.alwaysLogErr || this.errorStream == null) {
                OutputStream logOutputStream2 = new LogOutputStream(this.managingTask, 1);
                if (this.errorStream != null) {
                    logOutputStream2 = new TeeOutputStream(logOutputStream2, this.errorStream);
                }
                this.errorStream = logOutputStream2;
            }
            if ((this.errorFilterChains != null && this.errorFilterChains.size() > 0) || !this.errorEncoding.equalsIgnoreCase(this.inputEncoding)) {
                try {
                    LeadPipeInputStream leadPipeInputStream2 = new LeadPipeInputStream();
                    leadPipeInputStream2.setManagingComponent(this.managingTask);
                    InputStreamReader inputStreamReader3 = new InputStreamReader(leadPipeInputStream2, this.inputEncoding);
                    InputStreamReader inputStreamReader4 = inputStreamReader3;
                    if (this.errorFilterChains != null) {
                        inputStreamReader4 = inputStreamReader3;
                        if (this.errorFilterChains.size() > 0) {
                            ChainReaderHelper chainReaderHelper2 = new ChainReaderHelper();
                            chainReaderHelper2.setProject(this.managingTask.getProject());
                            chainReaderHelper2.setPrimaryReader(inputStreamReader3);
                            chainReaderHelper2.setFilterChains(this.errorFilterChains);
                            inputStreamReader4 = chainReaderHelper2.getAssembledReader();
                        }
                    }
                    Thread thread2 = new Thread(this.threadGroup, new StreamPumper(new ReaderInputStream(inputStreamReader4, this.errorEncoding), this.errorStream, true), "error pumper");
                    thread2.setPriority(10);
                    this.errorStream = new PipedOutputStream(leadPipeInputStream2);
                    thread2.start();
                } catch (IOException e2) {
                    throw new BuildException("error setting up error stream", e2);
                }
            }
        }
        synchronized (this.inMutex) {
            if (this.input != null && this.input.length > 0) {
                this.managingTask.log(new StringBuffer().append("Redirecting input from file").append(this.input.length == 1 ? "" : "s").toString(), 3);
                try {
                    this.inputStream = new ConcatFileInputStream(this.input);
                    ((ConcatFileInputStream) this.inputStream).setManagingComponent(this.managingTask);
                } catch (IOException e3) {
                    throw new BuildException(e3);
                }
            } else if (this.inputString != null) {
                StringBuffer stringBuffer = new StringBuffer("Using input ");
                if (this.logInputString) {
                    stringBuffer.append('\"').append(this.inputString).append('\"');
                } else {
                    stringBuffer.append("string");
                }
                this.managingTask.log(stringBuffer.toString(), 3);
                this.inputStream = new ByteArrayInputStream(this.inputString.getBytes());
            }
            if (this.inputStream != null && this.inputFilterChains != null && this.inputFilterChains.size() > 0) {
                ChainReaderHelper chainReaderHelper3 = new ChainReaderHelper();
                chainReaderHelper3.setProject(this.managingTask.getProject());
                try {
                    chainReaderHelper3.setPrimaryReader(new InputStreamReader(this.inputStream, this.inputEncoding));
                    chainReaderHelper3.setFilterChains(this.inputFilterChains);
                    this.inputStream = new ReaderInputStream(chainReaderHelper3.getAssembledReader(), this.inputEncoding);
                } catch (IOException e4) {
                    throw new BuildException("error setting up input stream", e4);
                }
            }
        }
    }

    public OutputStream getErrorStream() {
        OutputStream outputStream;
        synchronized (this.errMutex) {
            outputStream = this.errorStream;
        }
        return outputStream;
    }

    public InputStream getInputStream() {
        InputStream inputStream;
        synchronized (this.inMutex) {
            inputStream = this.inputStream;
        }
        return inputStream;
    }

    public OutputStream getOutputStream() {
        OutputStream outputStream;
        synchronized (this.outMutex) {
            outputStream = this.outputStream;
        }
        return outputStream;
    }

    protected void handleErrorFlush(String str) {
        synchronized (this.errMutex) {
            if (this.errorPrintStream == null) {
                this.errorPrintStream = new PrintStream(this.errorStream);
            }
            this.errorPrintStream.print(str);
            this.errorPrintStream.flush();
        }
    }

    protected void handleErrorOutput(String str) {
        synchronized (this.errMutex) {
            if (this.errorPrintStream == null) {
                this.errorPrintStream = new PrintStream(this.errorStream);
            }
            this.errorPrintStream.print(str);
        }
    }

    protected void handleFlush(String str) {
        synchronized (this.outMutex) {
            if (this.outPrintStream == null) {
                this.outPrintStream = new PrintStream(this.outputStream);
            }
            this.outPrintStream.print(str);
            this.outPrintStream.flush();
        }
    }

    protected int handleInput(byte[] bArr, int i, int i2) throws IOException {
        int defaultInput;
        synchronized (this.inMutex) {
            defaultInput = this.inputStream == null ? this.managingTask.getProject().defaultInput(bArr, i, i2) : this.inputStream.read(bArr, i, i2);
        }
        return defaultInput;
    }

    protected void handleOutput(String str) {
        synchronized (this.outMutex) {
            if (this.outPrintStream == null) {
                this.outPrintStream = new PrintStream(this.outputStream);
            }
            this.outPrintStream.print(str);
        }
    }

    public void setAlwaysLog(boolean z) {
        synchronized (this.outMutex) {
            this.alwaysLogOut = z;
        }
        synchronized (this.errMutex) {
            this.alwaysLogErr = z;
        }
    }

    public void setAppend(boolean z) {
        synchronized (this.outMutex) {
            this.appendOut = z;
        }
        synchronized (this.errMutex) {
            this.appendErr = z;
        }
    }

    public void setAppendProperties(boolean z) {
        synchronized (this.outMutex) {
            this.appendProperties = z;
        }
    }

    public void setCreateEmptyFiles(boolean z) {
        synchronized (this.outMutex) {
            this.createEmptyFilesOut = z;
        }
        synchronized (this.outMutex) {
            this.createEmptyFilesErr = z;
        }
    }

    public void setError(File file) {
        setError(file == null ? null : new File[]{file});
    }

    public void setError(File[] fileArr) {
        synchronized (this.errMutex) {
            if (fileArr == null) {
                this.error = null;
            } else {
                this.error = (File[]) fileArr.clone();
            }
        }
    }

    public void setErrorEncoding(String str) {
        if (str == null) {
            throw new IllegalArgumentException("errorEncoding must not be null");
        }
        synchronized (this.errMutex) {
            this.errorEncoding = str;
        }
    }

    public void setErrorFilterChains(Vector vector) {
        synchronized (this.errMutex) {
            this.errorFilterChains = vector;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:7:0x0013, code lost:
        if (r4.equals(r3.errorProperty) == false) goto L8;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void setErrorProperty(String str) {
        synchronized (this.errMutex) {
            if (str != null) {
            }
            this.errorProperty = str;
            this.errorBaos = null;
        }
    }

    public void setInput(File file) {
        setInput(file == null ? null : new File[]{file});
    }

    public void setInput(File[] fileArr) {
        synchronized (this.inMutex) {
            if (fileArr == null) {
                this.input = null;
            } else {
                this.input = (File[]) fileArr.clone();
            }
        }
    }

    public void setInputEncoding(String str) {
        if (str == null) {
            throw new IllegalArgumentException("inputEncoding must not be null");
        }
        synchronized (this.inMutex) {
            this.inputEncoding = str;
        }
    }

    public void setInputFilterChains(Vector vector) {
        synchronized (this.inMutex) {
            this.inputFilterChains = vector;
        }
    }

    void setInputStream(InputStream inputStream) {
        synchronized (this.inMutex) {
            this.inputStream = inputStream;
        }
    }

    public void setInputString(String str) {
        synchronized (this.inMutex) {
            this.inputString = str;
        }
    }

    public void setLogError(boolean z) {
        synchronized (this.errMutex) {
            this.logError = z;
        }
    }

    public void setLogInputString(boolean z) {
        this.logInputString = z;
    }

    public void setOutput(File file) {
        setOutput(file == null ? null : new File[]{file});
    }

    public void setOutput(File[] fileArr) {
        synchronized (this.outMutex) {
            if (fileArr == null) {
                this.out = null;
            } else {
                this.out = (File[]) fileArr.clone();
            }
        }
    }

    public void setOutputEncoding(String str) {
        if (str == null) {
            throw new IllegalArgumentException("outputEncoding must not be null");
        }
        synchronized (this.outMutex) {
            this.outputEncoding = str;
        }
    }

    public void setOutputFilterChains(Vector vector) {
        synchronized (this.outMutex) {
            this.outputFilterChains = vector;
        }
    }

    public void setOutputProperty(String str) {
        if (str == null || !str.equals(this.outputProperty)) {
            synchronized (this.outMutex) {
                this.outputProperty = str;
                this.baos = null;
            }
        }
    }

    public void setProperties() {
        synchronized (this.outMutex) {
            if (this.baos != null) {
                try {
                    this.baos.close();
                } catch (IOException e) {
                }
            }
        }
        synchronized (this.errMutex) {
            if (this.errorBaos != null) {
                try {
                    this.errorBaos.close();
                } catch (IOException e2) {
                }
            }
        }
    }
}
