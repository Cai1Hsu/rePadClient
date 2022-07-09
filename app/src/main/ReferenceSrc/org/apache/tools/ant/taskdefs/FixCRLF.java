package org.apache.tools.ant.taskdefs;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Enumeration;
import java.util.NoSuchElementException;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.filters.ChainableReader;
import org.apache.tools.ant.filters.FixCrLfFilter;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.FilterChain;
import org.apache.tools.ant.types.FilterSetCollection;
import org.apache.tools.ant.util.FileUtils;
import org.jivesoftware.smackx.packet.DiscoverItems;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/FixCRLF.class */
public class FixCRLF extends MatchingTask implements ChainableReader {
    public static final String ERROR_FILE_AND_SRCDIR = "<fixcrlf> error: srcdir and file are mutually exclusive";
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final String FIXCRLF_ERROR = "<fixcrlf> error: ";
    private File file;
    private File srcDir;
    private boolean preserveLastModified = false;
    private File destDir = null;
    private FixCrLfFilter filter = new FixCrLfFilter();
    private Vector fcv = null;
    private String encoding = null;
    private String outputEncoding = null;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/FixCRLF$AddAsisRemove.class */
    public static class AddAsisRemove extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"add", "asis", DiscoverItems.Item.REMOVE_ACTION};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/FixCRLF$CrLf.class */
    public static class CrLf extends EnumeratedAttribute {
        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"asis", "cr", "lf", "crlf", Os.FAMILY_MAC, Os.FAMILY_UNIX, Os.FAMILY_DOS};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/FixCRLF$OneLiner.class */
    protected class OneLiner implements Enumeration {
        private static final char CTRLZ = 26;
        private static final int INBUFLEN = 8192;
        private static final int LINEBUFLEN = 200;
        private static final int LOOKING = 1;
        private static final int NOTJAVA = 0;
        private static final int UNDEF = -1;
        private StringBuffer eofStr;
        private StringBuffer eolStr;
        private StringBuffer line;
        private boolean reachedEof;
        private BufferedReader reader;
        private File srcFile;
        private int state;
        private final FixCRLF this$0;

        /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/FixCRLF$OneLiner$BufferLine.class */
        class BufferLine {
            private int column;
            private String eolStr;
            private String line;
            private int lookahead = -1;
            private int next;
            private final OneLiner this$1;

            public BufferLine(OneLiner oneLiner, String str, String str2) throws BuildException {
                this.this$1 = oneLiner;
                this.next = 0;
                this.column = 0;
                this.next = 0;
                this.column = 0;
                this.line = str;
                this.eolStr = str2;
            }

            public char getChar(int i) {
                return this.line.charAt(i);
            }

            public int getColumn() {
                return this.column;
            }

            public String getEol() {
                return this.eolStr;
            }

            public int getEolLength() {
                return this.eolStr.length();
            }

            public String getLineString() {
                return this.line;
            }

            public int getLookahead() {
                return this.lookahead;
            }

            public int getNext() {
                return this.next;
            }

            public char getNextChar() {
                return getChar(this.next);
            }

            public char getNextCharInc() {
                int i = this.next;
                this.next = i + 1;
                return getChar(i);
            }

            public int getState() {
                return this.this$1.getState();
            }

            public int incColumn() {
                int i = this.column;
                this.column = i + 1;
                return i;
            }

            public int length() {
                return this.line.length();
            }

            public void setColumn(int i) {
                this.column = i;
            }

            public void setLookahead(int i) {
                this.lookahead = i;
            }

            public void setNext(int i) {
                this.next = i;
            }

            public void setState(int i) {
                this.this$1.setState(i);
            }

            public String substring(int i) {
                return this.line.substring(i);
            }

            public String substring(int i, int i2) {
                return this.line.substring(i, i2);
            }
        }

        public OneLiner(FixCRLF fixCRLF, File file) throws BuildException {
            this.this$0 = fixCRLF;
            this.state = this.this$0.filter.getJavafiles() ? 1 : 0;
            this.eolStr = new StringBuffer(200);
            this.eofStr = new StringBuffer();
            this.line = new StringBuffer();
            this.reachedEof = false;
            this.srcFile = file;
            try {
                this.reader = new BufferedReader(fixCRLF.encoding == null ? new FileReader(file) : new InputStreamReader(new FileInputStream(file), fixCRLF.encoding), 8192);
                nextLine();
            } catch (IOException e) {
                throw new BuildException(new StringBuffer().append(file).append(": ").append(e.getMessage()).toString(), e, fixCRLF.getLocation());
            }
        }

        public void close() throws IOException {
            if (this.reader != null) {
                this.reader.close();
            }
        }

        public String getEofStr() {
            return this.eofStr.substring(0);
        }

        public int getState() {
            return this.state;
        }

        @Override // java.util.Enumeration
        public boolean hasMoreElements() {
            return !this.reachedEof;
        }

        @Override // java.util.Enumeration
        public Object nextElement() throws NoSuchElementException {
            if (!hasMoreElements()) {
                throw new NoSuchElementException("OneLiner");
            }
            BufferLine bufferLine = new BufferLine(this, this.line.toString(), this.eolStr.substring(0));
            nextLine();
            return bufferLine;
        }

        /* JADX WARN: Removed duplicated region for block: B:33:0x00ae A[Catch: IOException -> 0x00d7, TRY_LEAVE, TryCatch #0 {IOException -> 0x00d7, blocks: (B:3:0x0018, B:11:0x0031, B:14:0x004b, B:16:0x0055, B:23:0x0082, B:28:0x0094, B:31:0x00a2, B:33:0x00ae, B:35:0x00c7, B:40:0x010c, B:42:0x0120, B:43:0x0127, B:45:0x0149, B:47:0x0154, B:51:0x0165, B:52:0x0172, B:55:0x0182, B:57:0x0193, B:58:0x01a0), top: B:59:0x0018 }] */
        /* JADX WARN: Removed duplicated region for block: B:66:? A[RETURN, SYNTHETIC] */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        protected void nextLine() throws BuildException {
            int i;
            this.eolStr = new StringBuffer();
            this.line = new StringBuffer();
            try {
                int read = this.reader.read();
                while (read != -1 && read != 13 && read != 10) {
                    this.line.append((char) read);
                    read = this.reader.read();
                }
                if (read == -1 && this.line.length() == 0) {
                    this.reachedEof = true;
                    return;
                }
                int i2 = 0;
                switch ((char) read) {
                    case '\n':
                        i2 = 0 + 1;
                        this.eolStr.append('\n');
                        break;
                    case 11:
                    case '\f':
                        break;
                    case '\r':
                        int i3 = 0 + 1;
                        this.eolStr.append('\r');
                        this.reader.mark(2);
                        i2 = i3;
                        switch (this.reader.read()) {
                            case -1:
                                break;
                            case 10:
                                i2 = i3 + 1;
                                this.eolStr.append('\n');
                                break;
                            case 13:
                                if (((char) this.reader.read()) != '\n') {
                                    this.reader.reset();
                                    i2 = i3;
                                    break;
                                } else {
                                    i2 = i3 + 2;
                                    this.eolStr.append("\r\n");
                                    break;
                                }
                            default:
                                this.reader.reset();
                                i2 = i3;
                                break;
                        }
                    default:
                        i2 = 0;
                        break;
                }
                if (i2 != 0) {
                    return;
                }
                int length = this.line.length();
                do {
                    i = length - 1;
                    if (i >= 0) {
                        length = i;
                    }
                    if (i < this.line.length() - 1) {
                        return;
                    }
                    this.eofStr.append(this.line.toString().substring(i + 1));
                    if (i >= 0) {
                        this.line.setLength(i + 1);
                        return;
                    }
                    this.line.setLength(0);
                    this.reachedEof = true;
                    return;
                } while (this.line.charAt(i) == 26);
                if (i < this.line.length() - 1) {
                }
            } catch (IOException e) {
                throw new BuildException(new StringBuffer().append(this.srcFile).append(": ").append(e.getMessage()).toString(), e, this.this$0.getLocation());
            }
        }

        public void setState(int i) {
            this.state = i;
        }
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[]}, finally: {[SGET, INVOKE, IF, INVOKE, IF] complete} */
    private void processFile(String str) throws BuildException {
        File file = new File(this.srcDir, str);
        long lastModified = file.lastModified();
        File file2 = this.destDir == null ? this.srcDir : this.destDir;
        if (this.fcv == null) {
            FilterChain filterChain = new FilterChain();
            filterChain.add(this.filter);
            this.fcv = new Vector(1);
            this.fcv.add(filterChain);
        }
        File createTempFile = FILE_UTILS.createTempFile("fixcrlf", "", null, true, false);
        try {
            try {
                FILE_UTILS.copyFile(file, createTempFile, (FilterSetCollection) null, this.fcv, false, false, this.encoding, this.outputEncoding == null ? this.encoding : this.outputEncoding, getProject());
                File file3 = new File(file2, str);
                boolean z = true;
                if (file3.exists()) {
                    log(new StringBuffer().append("destFile ").append(file3).append(" exists").toString(), 4);
                    z = !FILE_UTILS.contentEquals(file3, createTempFile);
                    log(new StringBuffer().append(file3).append(z ? " is being written" : " is not written, as the contents are identical").toString(), 4);
                }
                if (z) {
                    FILE_UTILS.rename(createTempFile, file3);
                    if (this.preserveLastModified) {
                        log(new StringBuffer().append("preserved lastModified for ").append(file3).toString(), 4);
                        FILE_UTILS.setFileLastModified(file3, lastModified);
                    }
                }
                if (createTempFile == null) {
                    return;
                }
            } catch (IOException e) {
                throw new BuildException(new StringBuffer().append("error running fixcrlf on file ").append(file).toString(), e);
            }
        } finally {
            if (createTempFile != null && createTempFile.exists()) {
                FILE_UTILS.tryHardToDelete(createTempFile);
            }
        }
    }

    private void validate() throws BuildException {
        if (this.file != null) {
            if (this.srcDir != null) {
                throw new BuildException(ERROR_FILE_AND_SRCDIR);
            }
            this.fileset.setFile(this.file);
            this.srcDir = this.file.getParentFile();
        }
        if (this.srcDir == null) {
            throw new BuildException("<fixcrlf> error: srcdir attribute must be set!");
        }
        if (!this.srcDir.exists()) {
            throw new BuildException(new StringBuffer().append("<fixcrlf> error: srcdir does not exist: '").append(this.srcDir).append("'").toString());
        }
        if (!this.srcDir.isDirectory()) {
            throw new BuildException(new StringBuffer().append("<fixcrlf> error: srcdir is not a directory: '").append(this.srcDir).append("'").toString());
        }
        if (this.destDir == null) {
            return;
        }
        if (!this.destDir.exists()) {
            throw new BuildException(new StringBuffer().append("<fixcrlf> error: destdir does not exist: '").append(this.destDir).append("'").toString());
        }
        if (this.destDir.isDirectory()) {
            return;
        }
        throw new BuildException(new StringBuffer().append("<fixcrlf> error: destdir is not a directory: '").append(this.destDir).append("'").toString());
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public final Reader chain(Reader reader) {
        return this.filter.chain(reader);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        validate();
        String str = this.encoding == null ? "default" : this.encoding;
        StringBuffer append = new StringBuffer().append("options: eol=").append(this.filter.getEol().getValue()).append(" tab=").append(this.filter.getTab().getValue()).append(" eof=").append(this.filter.getEof().getValue()).append(" tablength=").append(this.filter.getTablength()).append(" encoding=").append(str).append(" outputencoding=");
        if (this.outputEncoding != null) {
            str = this.outputEncoding;
        }
        log(append.append(str).toString(), 3);
        for (String str2 : super.getDirectoryScanner(this.srcDir).getIncludedFiles()) {
            processFile(str2);
        }
    }

    public void setCr(AddAsisRemove addAsisRemove) {
        log("DEPRECATED: The cr attribute has been deprecated,", 1);
        log("Please use the eol attribute instead", 1);
        String value = addAsisRemove.getValue();
        CrLf crLf = new CrLf();
        if (value.equals(DiscoverItems.Item.REMOVE_ACTION)) {
            crLf.setValue("lf");
        } else if (value.equals("asis")) {
            crLf.setValue("asis");
        } else {
            crLf.setValue("crlf");
        }
        setEol(crLf);
    }

    public void setDestdir(File file) {
        this.destDir = file;
    }

    public void setEncoding(String str) {
        this.encoding = str;
    }

    public void setEof(AddAsisRemove addAsisRemove) {
        this.filter.setEof(FixCrLfFilter.AddAsisRemove.newInstance(addAsisRemove.getValue()));
    }

    public void setEol(CrLf crLf) {
        this.filter.setEol(FixCrLfFilter.CrLf.newInstance(crLf.getValue()));
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setFixlast(boolean z) {
        this.filter.setFixlast(z);
    }

    public void setJavafiles(boolean z) {
        this.filter.setJavafiles(z);
    }

    public void setOutputEncoding(String str) {
        this.outputEncoding = str;
    }

    public void setPreserveLastModified(boolean z) {
        this.preserveLastModified = z;
    }

    public void setSrcdir(File file) {
        this.srcDir = file;
    }

    public void setTab(AddAsisRemove addAsisRemove) {
        this.filter.setTab(FixCrLfFilter.AddAsisRemove.newInstance(addAsisRemove.getValue()));
    }

    public void setTablength(int i) throws BuildException {
        try {
            this.filter.setTablength(i);
        } catch (IOException e) {
            throw new BuildException(e.getMessage(), e);
        }
    }
}
