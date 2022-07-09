package org.apache.tools.ant.taskdefs;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.io.Writer;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.filters.util.ChainReaderHelper;
import org.apache.tools.ant.taskdefs.FixCRLF;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.FileList;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.FilterChain;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.Intersect;
import org.apache.tools.ant.types.resources.LogOutputResource;
import org.apache.tools.ant.types.resources.Resources;
import org.apache.tools.ant.types.resources.Restrict;
import org.apache.tools.ant.types.resources.StringResource;
import org.apache.tools.ant.types.resources.selectors.Exists;
import org.apache.tools.ant.types.resources.selectors.Not;
import org.apache.tools.ant.types.resources.selectors.ResourceSelector;
import org.apache.tools.ant.types.selectors.SelectorUtils;
import org.apache.tools.ant.util.ConcatResourceInputStream;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.ReaderInputStream;
import org.apache.tools.ant.util.ResourceUtils;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Concat.class */
public class Concat extends Task implements ResourceCollection {
    private static final int BUFFER_SIZE = 8192;
    private boolean append;
    private boolean binary;
    private Resource dest;
    private String encoding;
    private String eolString;
    private Vector filterChains;
    private TextElement footer;
    private TextElement header;
    private String outputEncoding;
    private Resources rc;
    private String resourceName;
    private StringBuffer textBuffer;
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final ResourceSelector EXISTS = new Exists();
    private static final ResourceSelector NOT_EXISTS = new Not(EXISTS);
    private boolean forceOverwrite = true;
    private boolean force = false;
    private boolean fixLastLine = false;
    private Writer outputWriter = null;
    private boolean ignoreEmpty = true;
    private ReaderFactory resourceReaderFactory = new ReaderFactory(this) { // from class: org.apache.tools.ant.taskdefs.Concat.1
        private final Concat this$0;

        {
            this.this$0 = this;
        }

        @Override // org.apache.tools.ant.taskdefs.Concat.ReaderFactory
        public Reader getReader(Object obj) throws IOException {
            InputStream inputStream = ((Resource) obj).getInputStream();
            return new BufferedReader(this.this$0.encoding == null ? new InputStreamReader(inputStream) : new InputStreamReader(inputStream, this.this$0.encoding));
        }
    };
    private ReaderFactory identityReaderFactory = new ReaderFactory(this) { // from class: org.apache.tools.ant.taskdefs.Concat.2
        private final Concat this$0;

        {
            this.this$0 = this;
        }

        @Override // org.apache.tools.ant.taskdefs.Concat.ReaderFactory
        public Reader getReader(Object obj) {
            return (Reader) obj;
        }
    };

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Concat$ConcatResource.class */
    private final class ConcatResource extends Resource {
        private ResourceCollection c;
        private final Concat this$0;

        private ConcatResource(Concat concat, ResourceCollection resourceCollection) {
            this.this$0 = concat;
            this.c = resourceCollection;
        }

        ConcatResource(Concat concat, ResourceCollection resourceCollection, AnonymousClass1 anonymousClass1) {
            this(concat, resourceCollection);
        }

        /* JADX WARN: Code restructure failed: missing block: B:10:0x0052, code lost:
            if (r8.this$0.footer == null) goto L11;
         */
        @Override // org.apache.tools.ant.types.Resource
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public InputStream getInputStream() throws IOException {
            MultiReader multiReader;
            ConcatResourceInputStream readerInputStream;
            if (this.this$0.binary) {
                ConcatResourceInputStream concatResourceInputStream = new ConcatResourceInputStream(this.c);
                concatResourceInputStream.setManagingComponent(this);
                readerInputStream = concatResourceInputStream;
            } else {
                Reader filteredReader = this.this$0.getFilteredReader(new MultiReader(this.this$0, this.c.iterator(), this.this$0.resourceReaderFactory, null));
                if (this.this$0.header == null) {
                    multiReader = filteredReader;
                }
                int i = 1;
                if (this.this$0.header != null) {
                    i = 1 + 1;
                }
                int i2 = i;
                if (this.this$0.footer != null) {
                    i2 = i + 1;
                }
                Reader[] readerArr = new Reader[i2];
                int i3 = 0;
                if (this.this$0.header != null) {
                    readerArr[0] = new StringReader(this.this$0.header.getValue());
                    if (this.this$0.header.getFiltering()) {
                        readerArr[0] = this.this$0.getFilteredReader(readerArr[0]);
                    }
                    i3 = 0 + 1;
                }
                int i4 = i3 + 1;
                readerArr[i3] = filteredReader;
                if (this.this$0.footer != null) {
                    readerArr[i4] = new StringReader(this.this$0.footer.getValue());
                    if (this.this$0.footer.getFiltering()) {
                        readerArr[i4] = this.this$0.getFilteredReader(readerArr[i4]);
                    }
                }
                multiReader = new MultiReader(this.this$0, Arrays.asList(readerArr).iterator(), this.this$0.identityReaderFactory, null);
                readerInputStream = this.this$0.outputEncoding == null ? new ReaderInputStream(multiReader) : new ReaderInputStream(multiReader, this.this$0.outputEncoding);
            }
            return readerInputStream;
        }

        @Override // org.apache.tools.ant.types.Resource
        public String getName() {
            return this.this$0.resourceName == null ? new StringBuffer().append("concat (").append(String.valueOf(this.c)).append(")").toString() : this.this$0.resourceName;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Concat$MultiReader.class */
    private final class MultiReader extends Reader {
        private ReaderFactory factory;
        private char[] lastChars;
        private int lastPos;
        private boolean needAddSeparator;
        private Reader reader;
        private Iterator readerSources;
        private final Concat this$0;

        private MultiReader(Concat concat, Iterator it, ReaderFactory readerFactory) {
            this.this$0 = concat;
            this.reader = null;
            this.lastPos = 0;
            this.lastChars = new char[this.this$0.eolString.length()];
            this.needAddSeparator = false;
            this.readerSources = it;
            this.factory = readerFactory;
        }

        MultiReader(Concat concat, Iterator it, ReaderFactory readerFactory, AnonymousClass1 anonymousClass1) {
            this(concat, it, readerFactory);
        }

        private void addLastChar(char c) {
            for (int length = this.lastChars.length - 2; length >= 0; length--) {
                this.lastChars[length] = this.lastChars[length + 1];
            }
            this.lastChars[this.lastChars.length - 1] = c;
        }

        private Reader getReader() throws IOException {
            if (this.reader == null && this.readerSources.hasNext()) {
                this.reader = this.factory.getReader(this.readerSources.next());
                Arrays.fill(this.lastChars, (char) 0);
            }
            return this.reader;
        }

        private boolean isFixLastLine() {
            return this.this$0.fixLastLine && this.this$0.textBuffer == null;
        }

        private boolean isMissingEndOfLine() {
            boolean z;
            int i = 0;
            while (true) {
                if (i >= this.lastChars.length) {
                    z = false;
                    break;
                } else if (this.lastChars[i] != this.this$0.eolString.charAt(i)) {
                    z = true;
                    break;
                } else {
                    i++;
                }
            }
            return z;
        }

        private void nextReader() throws IOException {
            close();
            this.reader = null;
        }

        @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            if (this.reader != null) {
                this.reader.close();
            }
        }

        @Override // java.io.Reader
        public int read() throws IOException {
            char c;
            if (!this.needAddSeparator) {
                while (true) {
                    c = 65535;
                    if (getReader() == null) {
                        break;
                    }
                    c = getReader().read();
                    if (c != -1) {
                        addLastChar((char) c);
                        break;
                    }
                    nextReader();
                    if (isFixLastLine() && isMissingEndOfLine()) {
                        this.needAddSeparator = true;
                        this.lastPos = 0;
                    }
                }
            } else {
                String str = this.this$0.eolString;
                int i = this.lastPos;
                this.lastPos = i + 1;
                char charAt = str.charAt(i);
                c = charAt;
                if (this.lastPos >= this.this$0.eolString.length()) {
                    this.lastPos = 0;
                    this.needAddSeparator = false;
                    c = charAt;
                }
            }
            return c;
        }

        @Override // java.io.Reader
        public int read(char[] cArr, int i, int i2) throws IOException {
            int i3;
            int i4 = i;
            int i5 = 0;
            while (true) {
                if (getReader() != null || this.needAddSeparator) {
                    if (!this.needAddSeparator) {
                        int read = getReader().read(cArr, i4, i2);
                        if (read != -1 && read != 0) {
                            if (isFixLastLine()) {
                                for (int i6 = read; i6 > read - this.lastChars.length && i6 > 0; i6--) {
                                    addLastChar(cArr[(i4 + i6) - 1]);
                                }
                            }
                            int i7 = i2 - read;
                            i4 += read;
                            int i8 = i5 + read;
                            i5 = i8;
                            i2 = i7;
                            if (i7 == 0) {
                                i3 = i8;
                                break;
                            }
                        } else {
                            nextReader();
                            if (isFixLastLine() && isMissingEndOfLine()) {
                                this.needAddSeparator = true;
                                this.lastPos = 0;
                            }
                        }
                    } else {
                        String str = this.this$0.eolString;
                        int i9 = this.lastPos;
                        this.lastPos = i9 + 1;
                        cArr[i4] = str.charAt(i9);
                        if (this.lastPos >= this.this$0.eolString.length()) {
                            this.lastPos = 0;
                            this.needAddSeparator = false;
                        }
                        int i10 = i2 - 1;
                        i4++;
                        int i11 = i5 + 1;
                        i5 = i11;
                        i2 = i10;
                        if (i10 == 0) {
                            i3 = i11;
                            break;
                        }
                    }
                } else {
                    i3 = -1;
                    if (i5 != 0) {
                        i3 = i5;
                    }
                }
            }
            return i3;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Concat$ReaderFactory.class */
    private interface ReaderFactory {
        Reader getReader(Object obj) throws IOException;
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Concat$TextElement.class */
    public static class TextElement extends ProjectComponent {
        private String value = "";
        private boolean trimLeading = false;
        private boolean trim = false;
        private boolean filtering = true;
        private String encoding = null;

        public boolean getFiltering() {
            return this.filtering;
        }

        public void addText(String str) {
            this.value = new StringBuffer().append(this.value).append(getProject().replaceProperties(str)).toString();
        }

        /* JADX WARN: Code restructure failed: missing block: B:24:0x0085, code lost:
            if (r0 == '\r') goto L25;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public String getValue() {
            if (this.value == null) {
                this.value = "";
            }
            if (this.value.trim().length() == 0) {
                this.value = "";
            }
            if (this.trimLeading) {
                char[] charArray = this.value.toCharArray();
                StringBuffer stringBuffer = new StringBuffer(charArray.length);
                boolean z = true;
                int i = 0;
                while (true) {
                    int i2 = i;
                    if (i2 >= charArray.length) {
                        break;
                    }
                    int i3 = i2 + 1;
                    char c = charArray[i2];
                    boolean z2 = z;
                    if (z) {
                        if (c == ' ') {
                            i = i3;
                        } else if (c == '\t') {
                            i = i3;
                        } else {
                            z2 = false;
                        }
                    }
                    stringBuffer.append(c);
                    if (c != '\n') {
                        z = z2;
                    }
                    z = true;
                    i = i3;
                }
                this.value = stringBuffer.toString();
            }
            if (this.trim) {
                this.value = this.value.trim();
            }
            return this.value;
        }

        public void setEncoding(String str) {
            this.encoding = str;
        }

        public void setFile(File file) throws BuildException {
            BufferedReader bufferedReader;
            if (!file.exists()) {
                throw new BuildException(new StringBuffer().append("File ").append(file).append(DirectoryScanner.DOES_NOT_EXIST_POSTFIX).toString());
            }
            BufferedReader bufferedReader2 = null;
            BufferedReader bufferedReader3 = null;
            try {
                try {
                    if (this.encoding == null) {
                        bufferedReader = new BufferedReader(new FileReader(file));
                    } else {
                        bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(file), this.encoding));
                    }
                    bufferedReader2 = bufferedReader;
                    bufferedReader3 = bufferedReader;
                    this.value = FileUtils.safeReadFully(bufferedReader);
                    FileUtils.close(bufferedReader);
                } catch (IOException e) {
                    BufferedReader bufferedReader4 = bufferedReader2;
                    bufferedReader3 = bufferedReader2;
                    throw new BuildException(e);
                }
            } catch (Throwable th) {
                FileUtils.close(bufferedReader3);
                throw th;
            }
        }

        public void setFiltering(boolean z) {
            this.filtering = z;
        }

        public void setTrim(boolean z) {
            this.trim = z;
        }

        public void setTrimLeading(boolean z) {
            this.trimLeading = z;
        }
    }

    public Concat() {
        reset();
    }

    public Reader getFilteredReader(Reader reader) {
        if (this.filterChains != null) {
            ChainReaderHelper chainReaderHelper = new ChainReaderHelper();
            chainReaderHelper.setBufferSize(8192);
            chainReaderHelper.setPrimaryReader(reader);
            chainReaderHelper.setFilterChains(this.filterChains);
            chainReaderHelper.setProject(getProject());
            reader = chainReaderHelper.getAssembledReader();
        }
        return reader;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v23, types: [org.apache.tools.ant.types.resources.StringResource] */
    private ResourceCollection getResources() {
        Restrict restrict;
        if (this.rc == null) {
            restrict = new StringResource(getProject(), this.textBuffer.toString());
        } else {
            if (this.dest != null) {
                Intersect intersect = new Intersect();
                intersect.setProject(getProject());
                intersect.add(this.rc);
                intersect.add(this.dest);
                if (intersect.size() > 0) {
                    throw new BuildException(new StringBuffer().append("Destination resource ").append(this.dest).append(" was specified as an input resource.").toString());
                }
            }
            Restrict restrict2 = new Restrict();
            restrict2.add(NOT_EXISTS);
            restrict2.add(this.rc);
            Iterator it = restrict2.iterator();
            while (it.hasNext()) {
                log(new StringBuffer().append(it.next()).append(DirectoryScanner.DOES_NOT_EXIST_POSTFIX).toString(), 0);
            }
            restrict = new Restrict();
            restrict.add(EXISTS);
            restrict.add(this.rc);
        }
        return restrict;
    }

    private boolean isUpToDate(ResourceCollection resourceCollection) {
        boolean z = false;
        if (this.dest != null) {
            if (!this.forceOverwrite) {
                Iterator it = resourceCollection.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        z = true;
                        break;
                    } else if (SelectorUtils.isOutOfDate((Resource) it.next(), this.dest, FILE_UTILS.getFileTimestampGranularity())) {
                        z = false;
                        break;
                    }
                }
            } else {
                z = false;
            }
        }
        return z;
    }

    private void sanitizeText() {
        if (this.textBuffer == null || !"".equals(this.textBuffer.toString().trim())) {
            return;
        }
        this.textBuffer = null;
    }

    private void validate() {
        sanitizeText();
        if (this.binary) {
            if (this.textBuffer != null) {
                throw new BuildException("Nested text is incompatible with binary concatenation");
            }
            if (this.encoding != null || this.outputEncoding != null) {
                throw new BuildException("Setting input or output encoding is incompatible with binary concatenation");
            }
            if (this.filterChains != null) {
                throw new BuildException("Setting filters is incompatible with binary concatenation");
            }
            if (this.fixLastLine) {
                throw new BuildException("Setting fixlastline is incompatible with binary concatenation");
            }
            if (this.header != null || this.footer != null) {
                throw new BuildException("Nested header or footer is incompatible with binary concatenation");
            }
        }
        if (this.dest == null || this.outputWriter == null) {
            if (this.rc == null && this.textBuffer == null) {
                throw new BuildException("At least one resource must be provided, or some text.");
            }
            if (this.rc != null && this.textBuffer != null) {
                throw new BuildException("Cannot include inline text when using resources.");
            }
            return;
        }
        throw new BuildException("Cannot specify both a destination resource and an output writer");
    }

    public void add(ResourceCollection resourceCollection) {
        synchronized (this) {
            if (this.rc == null) {
                this.rc = new Resources();
                this.rc.setProject(getProject());
                this.rc.setCache(true);
            }
        }
        this.rc.add(resourceCollection);
    }

    public void addFilelist(FileList fileList) {
        add(fileList);
    }

    public void addFileset(FileSet fileSet) {
        add(fileSet);
    }

    public void addFilterChain(FilterChain filterChain) {
        if (this.filterChains == null) {
            this.filterChains = new Vector();
        }
        this.filterChains.addElement(filterChain);
    }

    public void addFooter(TextElement textElement) {
        this.footer = textElement;
    }

    public void addHeader(TextElement textElement) {
        this.header = textElement;
    }

    public void addText(String str) {
        if (this.textBuffer == null) {
            this.textBuffer = new StringBuffer(str.length());
        }
        this.textBuffer.append(str);
    }

    public Path createPath() {
        Path path = new Path(getProject());
        add(path);
        return path;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        validate();
        if (!this.binary || this.dest != null) {
            ResourceCollection resources = getResources();
            if (isUpToDate(resources)) {
                log(new StringBuffer().append(this.dest).append(" is up-to-date.").toString(), 3);
                return;
            } else if (resources.size() == 0 && this.ignoreEmpty) {
                return;
            } else {
                try {
                    ResourceUtils.copyResource(new ConcatResource(this, resources, null), this.dest == null ? new LogOutputResource(this, 1) : this.dest, null, null, true, false, this.append, null, null, getProject(), this.force);
                    return;
                } catch (IOException e) {
                    throw new BuildException(new StringBuffer().append("error concatenating content to ").append(this.dest).toString(), e);
                }
            }
        }
        throw new BuildException("dest|destfile attribute is required for binary concatenation");
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        return false;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public Iterator iterator() {
        validate();
        return Collections.singletonList(new ConcatResource(this, getResources(), null)).iterator();
    }

    public void reset() {
        this.append = false;
        this.forceOverwrite = true;
        this.dest = null;
        this.encoding = null;
        this.outputEncoding = null;
        this.fixLastLine = false;
        this.filterChains = null;
        this.footer = null;
        this.header = null;
        this.binary = false;
        this.outputWriter = null;
        this.textBuffer = null;
        this.eolString = StringUtils.LINE_SEP;
        this.rc = null;
        this.ignoreEmpty = true;
        this.force = false;
    }

    public void setAppend(boolean z) {
        this.append = z;
    }

    public void setBinary(boolean z) {
        this.binary = z;
    }

    public void setDest(Resource resource) {
        this.dest = resource;
    }

    public void setDestfile(File file) {
        setDest(new FileResource(file));
    }

    public void setEncoding(String str) {
        this.encoding = str;
        if (this.outputEncoding == null) {
            this.outputEncoding = str;
        }
    }

    public void setEol(FixCRLF.CrLf crLf) {
        String value = crLf.getValue();
        if (value.equals("cr") || value.equals(Os.FAMILY_MAC)) {
            this.eolString = "\r";
        } else if (value.equals("lf") || value.equals(Os.FAMILY_UNIX)) {
            this.eolString = "\n";
        } else if (!value.equals("crlf") && !value.equals(Os.FAMILY_DOS)) {
        } else {
            this.eolString = "\r\n";
        }
    }

    public void setFixLastLine(boolean z) {
        this.fixLastLine = z;
    }

    public void setForce(boolean z) {
        this.forceOverwrite = z;
    }

    public void setForceReadOnly(boolean z) {
        this.force = z;
    }

    public void setIgnoreEmpty(boolean z) {
        this.ignoreEmpty = z;
    }

    public void setOutputEncoding(String str) {
        this.outputEncoding = str;
    }

    public void setOverwrite(boolean z) {
        setForce(z);
    }

    public void setResourceName(String str) {
        this.resourceName = str;
    }

    public void setWriter(Writer writer) {
        this.outputWriter = writer;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        return 1;
    }
}
