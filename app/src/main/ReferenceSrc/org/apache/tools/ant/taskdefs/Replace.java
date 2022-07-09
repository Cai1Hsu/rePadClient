package org.apache.tools.ant.taskdefs;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Replace.class */
public class Replace extends MatchingTask {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private int fileCount;
    private int replaceCount;
    private Union resources;
    private File sourceFile = null;
    private NestedString token = null;
    private NestedString value = new NestedString(this);
    private Resource propertyResource = null;
    private Resource replaceFilterResource = null;
    private Properties properties = null;
    private ArrayList replacefilters = new ArrayList();
    private File dir = null;
    private boolean summary = false;
    private String encoding = null;
    private boolean preserveLastModified = false;
    private boolean failOnNoReplacements = false;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Replace$FileInput.class */
    private class FileInput {
        private static final int BUFF_SIZE = 4096;
        private Reader reader;
        private final Replace this$0;
        private StringBuffer outputBuffer = new StringBuffer();
        private char[] buffer = new char[4096];

        FileInput(Replace replace, File file) throws IOException {
            this.this$0 = replace;
            if (replace.encoding == null) {
                this.reader = new BufferedReader(new FileReader(file));
            } else {
                this.reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), replace.encoding));
            }
        }

        void close() throws IOException {
            this.reader.close();
        }

        void closeQuietly() {
            FileUtils.close(this.reader);
        }

        StringBuffer getOutputBuffer() {
            return this.outputBuffer;
        }

        boolean readChunk() throws IOException {
            boolean z = false;
            int read = this.reader.read(this.buffer);
            if (read >= 0) {
                this.outputBuffer.append(new String(this.buffer, 0, read));
                z = true;
            }
            return z;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Replace$FileOutput.class */
    private class FileOutput {
        private StringBuffer inputBuffer;
        private final Replace this$0;
        private Writer writer;

        FileOutput(Replace replace, File file) throws IOException {
            this.this$0 = replace;
            if (replace.encoding == null) {
                this.writer = new BufferedWriter(new FileWriter(file));
            } else {
                this.writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), replace.encoding));
            }
        }

        void close() throws IOException {
            this.writer.close();
        }

        void closeQuietly() {
            FileUtils.close(this.writer);
        }

        void flush() throws IOException {
            process();
            this.writer.flush();
        }

        boolean process() throws IOException {
            this.writer.write(this.inputBuffer.toString());
            this.inputBuffer.delete(0, this.inputBuffer.length());
            return false;
        }

        void setInputBuffer(StringBuffer stringBuffer) {
            this.inputBuffer = stringBuffer;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Replace$NestedString.class */
    public class NestedString {
        private final Replace this$0;
        private boolean expandProperties = false;
        private StringBuffer buf = new StringBuffer();

        public NestedString(Replace replace) {
            this.this$0 = replace;
        }

        public void addText(String str) {
            this.buf.append(str);
        }

        public String getText() {
            String stringBuffer = this.buf.toString();
            String str = stringBuffer;
            if (this.expandProperties) {
                str = this.this$0.getProject().replaceProperties(stringBuffer);
            }
            return str;
        }

        public void setExpandProperties(boolean z) {
            this.expandProperties = z;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Replace$Replacefilter.class */
    public class Replacefilter {
        private StringBuffer inputBuffer;
        private StringBuffer outputBuffer = new StringBuffer();
        private String property;
        private String replaceValue;
        private final Replace this$0;
        private NestedString token;
        private NestedString value;

        public Replacefilter(Replace replace) {
            this.this$0 = replace;
        }

        private int replace() {
            String token = getToken();
            int indexOf = this.inputBuffer.indexOf(token);
            int i = -1;
            int length = token.length();
            int length2 = this.replaceValue.length();
            while (indexOf >= 0) {
                this.inputBuffer.replace(indexOf, indexOf + length, this.replaceValue);
                i = indexOf + length2;
                indexOf = this.inputBuffer.indexOf(token, i);
                Replace.access$304(this.this$0);
            }
            return i;
        }

        public NestedString createReplaceToken() {
            if (this.token == null) {
                this.token = new NestedString(this.this$0);
            }
            return this.token;
        }

        public NestedString createReplaceValue() {
            if (this.value == null) {
                this.value = new NestedString(this.this$0);
            }
            return this.value;
        }

        void flush() {
            replace();
            this.outputBuffer.append(this.inputBuffer);
            this.inputBuffer.delete(0, this.inputBuffer.length());
        }

        StringBuffer getOutputBuffer() {
            return this.outputBuffer;
        }

        public String getProperty() {
            return this.property;
        }

        public String getReplaceValue() {
            return this.property != null ? this.this$0.properties.getProperty(this.property) : this.value != null ? this.value.getText() : this.this$0.value != null ? this.this$0.value.getText() : "";
        }

        public String getToken() {
            return this.token.getText();
        }

        public String getValue() {
            return this.value.getText();
        }

        boolean process() {
            boolean z = false;
            String token = getToken();
            if (this.inputBuffer.length() > token.length()) {
                int max = Math.max(this.inputBuffer.length() - token.length(), replace());
                this.outputBuffer.append(this.inputBuffer.substring(0, max));
                this.inputBuffer.delete(0, max);
                z = true;
            }
            return z;
        }

        void setInputBuffer(StringBuffer stringBuffer) {
            this.inputBuffer = stringBuffer;
        }

        public void setProperty(String str) {
            this.property = str;
        }

        public void setToken(String str) {
            createReplaceToken().addText(str);
        }

        public void setValue(String str) {
            createReplaceValue().addText(str);
        }

        public void validate() throws BuildException {
            if (this.token == null) {
                throw new BuildException("token is a mandatory for replacefilter.");
            }
            if ("".equals(this.token.getText())) {
                throw new BuildException("The token must not be an empty string.");
            }
            if (this.value != null && this.property != null) {
                throw new BuildException("Either value or property can be specified, but a replacefilter element cannot have both.");
            }
            if (this.property != null) {
                if (this.this$0.propertyResource == null) {
                    throw new BuildException("The replacefilter's property attribute can only be used with the replacetask's propertyFile/Resource attribute.");
                }
                if (this.this$0.properties == null || this.this$0.properties.getProperty(this.property) == null) {
                    throw new BuildException(new StringBuffer().append("property \"").append(this.property).append("\" was not found in ").append(this.this$0.propertyResource.getName()).toString());
                }
            }
            this.replaceValue = getReplaceValue();
        }
    }

    static int access$304(Replace replace) {
        int i = replace.replaceCount + 1;
        replace.replaceCount = i;
        return i;
    }

    private StringBuffer buildFilterChain(StringBuffer stringBuffer) {
        int size = this.replacefilters.size();
        for (int i = 0; i < size; i++) {
            Replacefilter replacefilter = (Replacefilter) this.replacefilters.get(i);
            replacefilter.setInputBuffer(stringBuffer);
            stringBuffer = replacefilter.getOutputBuffer();
        }
        return stringBuffer;
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private Replacefilter createPrimaryfilter() {
        Replacefilter replacefilter = new Replacefilter(this);
        this.replacefilters.add(0, replacefilter);
        return replacefilter;
    }

    private void flushFilterChain() {
        int size = this.replacefilters.size();
        for (int i = 0; i < size; i++) {
            ((Replacefilter) this.replacefilters.get(i)).flush();
        }
    }

    private void logFilterChain(String str) {
        int size = this.replacefilters.size();
        for (int i = 0; i < size; i++) {
            Replacefilter replacefilter = (Replacefilter) this.replacefilters.get(i);
            log(new StringBuffer().append("Replacing in ").append(str).append(": ").append(replacefilter.getToken()).append(" --> ").append(replacefilter.getReplaceValue()).toString(), 3);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v7, types: [java.io.IOException] */
    /* JADX WARN: Type inference failed for: r2v9, types: [java.lang.Throwable] */
    private void processFile(File file) throws BuildException {
        FileOutput fileOutput;
        FileInput fileInput;
        Object e;
        File file2;
        Throwable th;
        int i;
        if (!file.exists()) {
            throw new BuildException(new StringBuffer().append("Replace: source file ").append(file.getPath()).append(" doesn't exist").toString(), getLocation());
        }
        FileInput fileInput2 = null;
        FileOutput fileOutput2 = null;
        File file3 = null;
        FileUtils fileUtils = null;
        File file4 = null;
        try {
            try {
                fileInput = new FileInput(this, file);
                File file5 = null;
                File file6 = null;
                try {
                    file2 = FILE_UTILS.createTempFile("rep", ".tmp", file.getParentFile(), false, true);
                    file5 = file2;
                    file6 = file2;
                    fileOutput = new FileOutput(this, file2);
                    try {
                        i = this.replaceCount;
                        logFilterChain(file.getPath());
                        fileOutput.setInputBuffer(buildFilterChain(fileInput.getOutputBuffer()));
                        while (fileInput.readChunk()) {
                            if (processFilterChain()) {
                                fileOutput.process();
                            }
                        }
                        flushFilterChain();
                        fileOutput.flush();
                        fileInput.close();
                        fileInput2 = null;
                        fileInput = null;
                    } catch (IOException e2) {
                        e = e2;
                    } catch (Throwable th2) {
                        th = th2;
                        fileInput2 = fileInput;
                        fileOutput2 = fileOutput;
                    }
                    try {
                        fileOutput.close();
                        File file7 = file2;
                        if (this.replaceCount != i) {
                            this.fileCount++;
                            long lastModified = file.lastModified();
                            FILE_UTILS.rename(file2, file);
                            if (this.preserveLastModified) {
                                file4 = file2;
                                fileUtils = FILE_UTILS;
                                fileUtils.setFileLastModified(file, lastModified);
                            }
                            file7 = null;
                        }
                        if (0 != 0) {
                            throw new NullPointerException();
                        }
                        if (0 != 0) {
                            throw new NullPointerException();
                        }
                        if (file7 == null || file7.delete()) {
                            return;
                        }
                        file7.deleteOnExit();
                    } catch (IOException e3) {
                        e = e3;
                        FileInput fileInput3 = fileInput;
                        FileInput fileInput4 = fileInput;
                        FileInput fileInput5 = fileInput;
                        fileInput2 = fileInput;
                        fileOutput2 = fileOutput;
                        file3 = file2;
                        throw new BuildException(new StringBuffer().append("IOException in ").append(file).append(" - ").append(e.getClass().getName()).append(":").append(e.getMessage()).toString(), e, getLocation());
                    } catch (Throwable th3) {
                        th = th3;
                        fileOutput2 = fileOutput;
                        if (fileInput2 != null) {
                            fileInput2.closeQuietly();
                        }
                        if (fileOutput2 != null) {
                            fileOutput2.closeQuietly();
                        }
                        if (file2 != null && !file2.delete()) {
                            file2.deleteOnExit();
                        }
                        throw th;
                    }
                } catch (IOException e4) {
                    e = e4;
                    fileOutput = null;
                    file2 = file6;
                } catch (Throwable th4) {
                    th = th4;
                    fileInput2 = fileInput;
                    fileOutput2 = null;
                    file2 = file5;
                }
            } catch (IOException unused) {
                fileOutput = null;
                fileInput = null;
                e = fileUtils;
                file2 = file4;
            }
        } catch (Throwable th5) {
            th = th5;
            file2 = file3;
        }
    }

    private boolean processFilterChain() {
        boolean z;
        int size = this.replacefilters.size();
        int i = 0;
        while (true) {
            if (i >= size) {
                z = true;
                break;
            } else if (!((Replacefilter) this.replacefilters.get(i)).process()) {
                z = false;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private void stringReplace(StringBuffer stringBuffer, String str, String str2) {
        int indexOf = stringBuffer.indexOf(str);
        int length = str.length();
        int length2 = str2.length();
        while (indexOf >= 0) {
            stringBuffer.replace(indexOf, indexOf + length, str2);
            indexOf = stringBuffer.indexOf(str, indexOf + length2);
        }
    }

    public void addConfigured(ResourceCollection resourceCollection) {
        if (!resourceCollection.isFilesystemOnly()) {
            throw new BuildException("only filesystem resources are supported");
        }
        if (this.resources == null) {
            this.resources = new Union();
        }
        this.resources.add(resourceCollection);
    }

    public NestedString createReplaceToken() {
        if (this.token == null) {
            this.token = new NestedString(this);
        }
        return this.token;
    }

    public NestedString createReplaceValue() {
        return this.value;
    }

    public Replacefilter createReplacefilter() {
        Replacefilter replacefilter = new Replacefilter(this);
        this.replacefilters.add(replacefilter);
        return replacefilter;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Class cls;
        ArrayList arrayList = (ArrayList) this.replacefilters.clone();
        Properties properties = this.properties == null ? null : (Properties) this.properties.clone();
        if (this.token != null) {
            StringBuffer stringBuffer = new StringBuffer(this.value.getText());
            stringReplace(stringBuffer, "\r\n", "\n");
            stringReplace(stringBuffer, "\n", StringUtils.LINE_SEP);
            StringBuffer stringBuffer2 = new StringBuffer(this.token.getText());
            stringReplace(stringBuffer2, "\r\n", "\n");
            stringReplace(stringBuffer2, "\n", StringUtils.LINE_SEP);
            Replacefilter createPrimaryfilter = createPrimaryfilter();
            createPrimaryfilter.setToken(stringBuffer2.toString());
            createPrimaryfilter.setValue(stringBuffer.toString());
        }
        try {
            if (this.replaceFilterResource != null) {
                Properties properties2 = getProperties(this.replaceFilterResource);
                for (Object obj : properties2.keySet()) {
                    String obj2 = obj.toString();
                    Replacefilter createReplacefilter = createReplacefilter();
                    createReplacefilter.setToken(obj2);
                    createReplacefilter.setValue(properties2.getProperty(obj2));
                }
            }
            validateAttributes();
            if (this.propertyResource != null) {
                this.properties = getProperties(this.propertyResource);
            }
            validateReplacefilters();
            this.fileCount = 0;
            this.replaceCount = 0;
            if (this.sourceFile != null) {
                processFile(this.sourceFile);
            }
            if (this.dir != null) {
                for (String str : super.getDirectoryScanner(this.dir).getIncludedFiles()) {
                    processFile(new File(this.dir, str));
                }
            }
            if (this.resources != null) {
                Iterator it = this.resources.iterator();
                while (it.hasNext()) {
                    Resource resource = (Resource) it.next();
                    if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                        cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                        class$org$apache$tools$ant$types$resources$FileProvider = cls;
                    } else {
                        cls = class$org$apache$tools$ant$types$resources$FileProvider;
                    }
                    processFile(((FileProvider) resource.as(cls)).getFile());
                }
            }
            if (this.summary) {
                log(new StringBuffer().append("Replaced ").append(this.replaceCount).append(" occurrences in ").append(this.fileCount).append(" files.").toString(), 2);
            }
            if (!this.failOnNoReplacements || this.replaceCount != 0) {
                return;
            }
            throw new BuildException("didn't replace anything");
        } finally {
            this.replacefilters = arrayList;
            this.properties = properties;
        }
    }

    public Properties getProperties(File file) throws BuildException {
        return getProperties(new FileResource(getProject(), file));
    }

    public Properties getProperties(Resource resource) throws BuildException {
        Properties properties = new Properties();
        InputStream inputStream = null;
        InputStream inputStream2 = null;
        try {
            try {
                InputStream inputStream3 = resource.getInputStream();
                inputStream2 = inputStream3;
                inputStream = inputStream3;
                properties.load(inputStream3);
                FileUtils.close(inputStream3);
                return properties;
            } catch (IOException e) {
                InputStream inputStream4 = inputStream2;
                InputStream inputStream5 = inputStream2;
                InputStream inputStream6 = inputStream2;
                InputStream inputStream7 = inputStream2;
                inputStream = inputStream2;
                throw new BuildException(new StringBuffer().append("Property resource (").append(resource.getName()).append(") cannot be loaded.").toString());
            }
        } catch (Throwable th) {
            FileUtils.close(inputStream);
            throw th;
        }
    }

    public void setDir(File file) {
        this.dir = file;
    }

    public void setEncoding(String str) {
        this.encoding = str;
    }

    public void setFailOnNoReplacements(boolean z) {
        this.failOnNoReplacements = z;
    }

    public void setFile(File file) {
        this.sourceFile = file;
    }

    public void setPreserveLastModified(boolean z) {
        this.preserveLastModified = z;
    }

    public void setPropertyFile(File file) {
        setPropertyResource(new FileResource(file));
    }

    public void setPropertyResource(Resource resource) {
        this.propertyResource = resource;
    }

    public void setReplaceFilterFile(File file) {
        setReplaceFilterResource(new FileResource(getProject(), file));
    }

    public void setReplaceFilterResource(Resource resource) {
        this.replaceFilterResource = resource;
    }

    public void setSummary(boolean z) {
        this.summary = z;
    }

    public void setToken(String str) {
        createReplaceToken().addText(str);
    }

    public void setValue(String str) {
        createReplaceValue().addText(str);
    }

    public void validateAttributes() throws BuildException {
        if (this.sourceFile == null && this.dir == null && this.resources == null) {
            throw new BuildException("Either the file or the dir attribute or nested resources must be specified", getLocation());
        }
        if (this.propertyResource != null && !this.propertyResource.isExists()) {
            throw new BuildException(new StringBuffer().append("Property file ").append(this.propertyResource.getName()).append(DirectoryScanner.DOES_NOT_EXIST_POSTFIX).toString(), getLocation());
        }
        if (this.token == null && this.replacefilters.size() == 0) {
            throw new BuildException("Either token or a nested replacefilter must be specified", getLocation());
        }
        if (this.token != null && "".equals(this.token.getText())) {
            throw new BuildException("The token attribute must not be an empty string.", getLocation());
        }
    }

    public void validateReplacefilters() throws BuildException {
        int size = this.replacefilters.size();
        for (int i = 0; i < size; i++) {
            ((Replacefilter) this.replacefilters.get(i)).validate();
        }
    }
}
