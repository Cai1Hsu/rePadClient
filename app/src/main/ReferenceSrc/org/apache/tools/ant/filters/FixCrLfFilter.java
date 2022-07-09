package org.apache.tools.ant.filters;

import android.support.v4.view.MotionEventCompat;
import java.io.IOException;
import java.io.Reader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.jivesoftware.smackx.packet.DiscoverItems;

/* loaded from: classes.jar:org/apache/tools/ant/filters/FixCrLfFilter.class */
public final class FixCrLfFilter extends BaseParamFilterReader implements ChainableReader {
    private static final char CTRLZ = 26;
    private static final int DEFAULT_TAB_LENGTH = 8;
    private static final int MAX_TAB_LENGTH = 80;
    private static final int MIN_TAB_LENGTH = 2;
    private AddAsisRemove ctrlz;
    private CrLf eol;
    private int tabLength = 8;
    private boolean javafiles = false;
    private boolean fixlast = true;
    private boolean initialized = false;
    private AddAsisRemove tabs = AddAsisRemove.ASIS;

    /* loaded from: classes.jar:org/apache/tools/ant/filters/FixCrLfFilter$AddAsisRemove.class */
    public static class AddAsisRemove extends EnumeratedAttribute {
        private static final AddAsisRemove ASIS = newInstance("asis");
        private static final AddAsisRemove ADD = newInstance("add");
        private static final AddAsisRemove REMOVE = newInstance(DiscoverItems.Item.REMOVE_ACTION);

        public AddAsisRemove newInstance() {
            return newInstance(getValue());
        }

        public static AddAsisRemove newInstance(String str) {
            AddAsisRemove addAsisRemove = new AddAsisRemove();
            addAsisRemove.setValue(str);
            return addAsisRemove;
        }

        public boolean equals(Object obj) {
            return (obj instanceof AddAsisRemove) && getIndex() == ((AddAsisRemove) obj).getIndex();
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"add", "asis", DiscoverItems.Item.REMOVE_ACTION};
        }

        public int hashCode() {
            return getIndex();
        }

        AddAsisRemove resolve() throws IllegalStateException {
            AddAsisRemove addAsisRemove;
            if (equals(ASIS)) {
                addAsisRemove = ASIS;
            } else if (equals(ADD)) {
                addAsisRemove = ADD;
            } else if (!equals(REMOVE)) {
                throw new IllegalStateException(new StringBuffer().append("No replacement for ").append(this).toString());
            } else {
                addAsisRemove = REMOVE;
            }
            return addAsisRemove;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/FixCrLfFilter$AddEofFilter.class */
    private static class AddEofFilter extends SimpleFilterReader {
        private int lastChar = -1;

        public AddEofFilter(Reader reader) {
            super(reader);
        }

        @Override // org.apache.tools.ant.filters.FixCrLfFilter.SimpleFilterReader, java.io.Reader
        public int read() throws IOException {
            int read = super.read();
            if (read != -1) {
                this.lastChar = read;
            } else if (this.lastChar != 26) {
                this.lastChar = 26;
                read = this.lastChar;
            }
            return read;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/FixCrLfFilter$AddTabFilter.class */
    private static class AddTabFilter extends SimpleFilterReader {
        private int columnNumber = 0;
        private int tabLength;

        public AddTabFilter(Reader reader, int i) {
            super(reader);
            this.tabLength = 0;
            this.tabLength = i;
        }

        @Override // org.apache.tools.ant.filters.FixCrLfFilter.SimpleFilterReader, java.io.Reader
        public int read() throws IOException {
            int read = super.read();
            switch (read) {
                case 9:
                    this.columnNumber = (((this.columnNumber + this.tabLength) - 1) / this.tabLength) * this.tabLength;
                    break;
                case 10:
                case 13:
                    this.columnNumber = 0;
                    break;
                case 32:
                    this.columnNumber++;
                    if (!editsBlocked()) {
                        int i = (((this.columnNumber + this.tabLength) - 1) / this.tabLength) * this.tabLength;
                        int i2 = 1;
                        int i3 = 0;
                        while (true) {
                            int read2 = super.read();
                            if (read2 != -1) {
                                switch (read2) {
                                    case 9:
                                        this.columnNumber = i;
                                        i3++;
                                        i2 = 0;
                                        i += this.tabLength;
                                        break;
                                    case 32:
                                        int i4 = this.columnNumber + 1;
                                        this.columnNumber = i4;
                                        if (i4 == i) {
                                            i3++;
                                            i2 = 0;
                                            i += this.tabLength;
                                            break;
                                        } else {
                                            i2++;
                                            break;
                                        }
                                    default:
                                        push(read2);
                                        break;
                                }
                            }
                        }
                        while (i2 > 0) {
                            push(' ');
                            this.columnNumber--;
                            i2--;
                        }
                        for (int i5 = i3; i5 > 0; i5--) {
                            push('\t');
                            this.columnNumber -= this.tabLength;
                        }
                        read = super.read();
                        switch (read) {
                            case 9:
                                this.columnNumber += this.tabLength;
                                break;
                            case 32:
                                this.columnNumber++;
                                break;
                        }
                    }
                    break;
                default:
                    this.columnNumber++;
                    break;
            }
            return read;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/FixCrLfFilter$CrLf.class */
    public static class CrLf extends EnumeratedAttribute {
        private static final CrLf ASIS = newInstance("asis");
        private static final CrLf CR = newInstance("cr");
        private static final CrLf CRLF = newInstance("crlf");
        private static final CrLf DOS = newInstance(Os.FAMILY_DOS);
        private static final CrLf LF = newInstance("lf");
        private static final CrLf MAC = newInstance(Os.FAMILY_MAC);
        private static final CrLf UNIX = newInstance(Os.FAMILY_UNIX);

        public CrLf newInstance() {
            return newInstance(getValue());
        }

        public static CrLf newInstance(String str) {
            CrLf crLf = new CrLf();
            crLf.setValue(str);
            return crLf;
        }

        public boolean equals(Object obj) {
            return (obj instanceof CrLf) && getIndex() == ((CrLf) obj).getIndex();
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"asis", "cr", "lf", "crlf", Os.FAMILY_MAC, Os.FAMILY_UNIX, Os.FAMILY_DOS};
        }

        public int hashCode() {
            return getIndex();
        }

        CrLf resolve() {
            CrLf crLf;
            if (equals(ASIS)) {
                crLf = ASIS;
            } else if (equals(CR) || equals(MAC)) {
                crLf = CR;
            } else if (equals(CRLF) || equals(DOS)) {
                crLf = CRLF;
            } else if (!equals(LF) && !equals(UNIX)) {
                throw new IllegalStateException(new StringBuffer().append("No replacement for ").append(this).toString());
            } else {
                crLf = LF;
            }
            return crLf;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/FixCrLfFilter$MaskJavaTabLiteralsFilter.class */
    private static class MaskJavaTabLiteralsFilter extends SimpleFilterReader {
        private static final int IN_CHAR_CONST = 2;
        private static final int IN_MULTI_COMMENT = 5;
        private static final int IN_SINGLE_COMMENT = 4;
        private static final int IN_STR_CONST = 3;
        private static final int JAVA = 1;
        private static final int TRANS_FROM_MULTI = 8;
        private static final int TRANS_TO_COMMENT = 6;
        private boolean editsBlocked = false;
        private int state = 1;

        public MaskJavaTabLiteralsFilter(Reader reader) {
            super(reader);
        }

        @Override // org.apache.tools.ant.filters.FixCrLfFilter.SimpleFilterReader
        public boolean editsBlocked() {
            return this.editsBlocked || super.editsBlocked();
        }

        @Override // org.apache.tools.ant.filters.FixCrLfFilter.SimpleFilterReader, java.io.Reader
        public int read() throws IOException {
            int read = super.read();
            this.editsBlocked = this.state == 2 || this.state == 3;
            switch (this.state) {
                case 1:
                    switch (read) {
                        case 34:
                            this.state = 3;
                            break;
                        case 39:
                            this.state = 2;
                            break;
                        case 47:
                            this.state = 6;
                            break;
                    }
                case 2:
                    switch (read) {
                        case 39:
                            this.state = 1;
                            break;
                    }
                case 3:
                    switch (read) {
                        case 34:
                            this.state = 1;
                            break;
                    }
                case 4:
                    switch (read) {
                        case 10:
                        case 13:
                            this.state = 1;
                            break;
                    }
                case 5:
                    switch (read) {
                        case MotionEventCompat.AXIS_GENERIC_11 /* 42 */:
                            this.state = 8;
                            break;
                    }
                case 6:
                    switch (read) {
                        case 34:
                            this.state = 3;
                            break;
                        case 39:
                            this.state = 2;
                            break;
                        case MotionEventCompat.AXIS_GENERIC_11 /* 42 */:
                            this.state = 5;
                            break;
                        case 47:
                            this.state = 4;
                            break;
                        default:
                            this.state = 1;
                            break;
                    }
                case 8:
                    switch (read) {
                        case 47:
                            this.state = 1;
                            break;
                    }
            }
            return read;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/FixCrLfFilter$NormalizeEolFilter.class */
    private static class NormalizeEolFilter extends SimpleFilterReader {
        private char[] eol;
        private boolean fixLast;
        private int normalizedEOL = 0;
        private boolean previousWasEOL;

        public NormalizeEolFilter(Reader reader, String str, boolean z) {
            super(reader);
            this.eol = null;
            this.eol = str.toCharArray();
            this.fixLast = z;
        }

        /* JADX WARN: Code restructure failed: missing block: B:29:0x00fa, code lost:
            if (r0 != 10) goto L30;
         */
        @Override // org.apache.tools.ant.filters.FixCrLfFilter.SimpleFilterReader, java.io.Reader
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public int read() throws IOException {
            int i;
            boolean z;
            int i2;
            int read = super.read();
            if (this.normalizedEOL == 0) {
                switch (read) {
                    case -1:
                        z = true;
                        i2 = 0;
                        if (this.fixLast) {
                            z = true;
                            i2 = 0;
                            if (!this.previousWasEOL) {
                                i2 = 1;
                                z = true;
                                break;
                            }
                        }
                        break;
                    case 10:
                        i2 = 1;
                        z = false;
                        break;
                    case 13:
                        int read2 = super.read();
                        int read3 = super.read();
                        if (read2 == 13) {
                            z = false;
                            i2 = 1;
                            break;
                        }
                        if (read2 != 13) {
                            if (read2 != 10) {
                                push(read3);
                                push(read2);
                                z = false;
                                i2 = 1;
                                break;
                            } else {
                                push(read3);
                                z = false;
                                i2 = 1;
                                break;
                            }
                        } else {
                            i2 = 2;
                            push(read3);
                            z = false;
                            break;
                        }
                    case 26:
                        int read4 = super.read();
                        if (read4 != -1) {
                            push(read4);
                            z = false;
                            i2 = 0;
                            break;
                        } else {
                            z = true;
                            i2 = 0;
                            if (this.fixLast) {
                                z = true;
                                i2 = 0;
                                if (!this.previousWasEOL) {
                                    i2 = 1;
                                    push(read);
                                    z = true;
                                    break;
                                }
                            }
                        }
                        break;
                    default:
                        i2 = 0;
                        z = false;
                        break;
                }
                if (i2 > 0) {
                    while (i2 > 0) {
                        push(this.eol);
                        this.normalizedEOL += this.eol.length;
                        i2--;
                    }
                    this.previousWasEOL = true;
                    i = read();
                } else {
                    i = read;
                    if (!z) {
                        this.previousWasEOL = false;
                        i = read;
                    }
                }
            } else {
                this.normalizedEOL--;
                i = read;
            }
            return i;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/FixCrLfFilter$RemoveEofFilter.class */
    private static class RemoveEofFilter extends SimpleFilterReader {
        private int lookAhead;

        public RemoveEofFilter(Reader reader) {
            super(reader);
            this.lookAhead = -1;
            try {
                this.lookAhead = reader.read();
            } catch (IOException e) {
                this.lookAhead = -1;
            }
        }

        @Override // org.apache.tools.ant.filters.FixCrLfFilter.SimpleFilterReader, java.io.Reader
        public int read() throws IOException {
            int i = -1;
            int read = super.read();
            if (read != -1 || this.lookAhead != 26) {
                i = this.lookAhead;
                this.lookAhead = read;
            }
            return i;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/FixCrLfFilter$RemoveTabFilter.class */
    private static class RemoveTabFilter extends SimpleFilterReader {
        private int columnNumber = 0;
        private int tabLength;

        public RemoveTabFilter(Reader reader, int i) {
            super(reader);
            this.tabLength = 0;
            this.tabLength = i;
        }

        @Override // org.apache.tools.ant.filters.FixCrLfFilter.SimpleFilterReader, java.io.Reader
        public int read() throws IOException {
            int read = super.read();
            switch (read) {
                case 9:
                    int i = this.tabLength - (this.columnNumber % this.tabLength);
                    int i2 = i;
                    if (!editsBlocked()) {
                        int i3 = i;
                        while (i3 > 1) {
                            push(' ');
                            i3--;
                        }
                        i2 = i3;
                        read = 32;
                    }
                    this.columnNumber += i2;
                    break;
                case 10:
                case 13:
                    this.columnNumber = 0;
                    break;
                case 11:
                case 12:
                default:
                    this.columnNumber++;
                    break;
            }
            return read;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/filters/FixCrLfFilter$SimpleFilterReader.class */
    private static class SimpleFilterReader extends Reader {
        private static final int PREEMPT_BUFFER_LENGTH = 16;
        private Reader in;
        private int[] preempt = new int[16];
        private int preemptIndex = 0;

        public SimpleFilterReader(Reader reader) {
            this.in = reader;
        }

        @Override // java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
        public void close() throws IOException {
            this.in.close();
        }

        public boolean editsBlocked() {
            return (this.in instanceof SimpleFilterReader) && ((SimpleFilterReader) this.in).editsBlocked();
        }

        @Override // java.io.Reader
        public void mark(int i) throws IOException {
            this.in.mark(i);
        }

        @Override // java.io.Reader
        public boolean markSupported() {
            return this.in.markSupported();
        }

        public void push(char c) {
            push((int) c);
        }

        public void push(int i) {
            try {
                int[] iArr = this.preempt;
                int i2 = this.preemptIndex;
                this.preemptIndex = i2 + 1;
                iArr[i2] = i;
            } catch (ArrayIndexOutOfBoundsException e) {
                int[] iArr2 = new int[this.preempt.length * 2];
                System.arraycopy(this.preempt, 0, iArr2, 0, this.preempt.length);
                this.preempt = iArr2;
                push(i);
            }
        }

        public void push(String str) {
            push(str.toCharArray());
        }

        public void push(char[] cArr) {
            push(cArr, 0, cArr.length);
        }

        public void push(char[] cArr, int i, int i2) {
            for (int i3 = (i + i2) - 1; i3 >= i; i3--) {
                push(cArr[i3]);
            }
        }

        @Override // java.io.Reader
        public int read() throws IOException {
            int read;
            if (this.preemptIndex > 0) {
                int[] iArr = this.preempt;
                int i = this.preemptIndex - 1;
                this.preemptIndex = i;
                read = iArr[i];
            } else {
                read = this.in.read();
            }
            return read;
        }

        @Override // java.io.Reader
        public int read(char[] cArr) throws IOException {
            return read(cArr, 0, cArr.length);
        }

        @Override // java.io.Reader
        public int read(char[] cArr, int i, int i2) throws IOException {
            int i3;
            int i4 = i;
            int i5 = i2;
            int i6 = 0;
            int i7 = 0;
            while (true) {
                i3 = i7;
                if (i5 <= 0) {
                    break;
                }
                i7 = read();
                i3 = i7;
                if (i7 == -1) {
                    break;
                }
                cArr[i4] = (char) i7;
                i6++;
                i5--;
                i4++;
            }
            int i8 = i6;
            if (i6 == 0) {
                i8 = i6;
                if (i3 == -1) {
                    i8 = -1;
                }
            }
            return i8;
        }

        @Override // java.io.Reader
        public boolean ready() throws IOException {
            return this.in.ready();
        }

        @Override // java.io.Reader
        public void reset() throws IOException {
            this.in.reset();
        }

        @Override // java.io.Reader
        public long skip(long j) throws IOException {
            return this.in.skip(j);
        }
    }

    public FixCrLfFilter() {
        if (Os.isFamily(Os.FAMILY_MAC) && !Os.isFamily(Os.FAMILY_UNIX)) {
            this.ctrlz = AddAsisRemove.REMOVE;
            setEol(CrLf.MAC);
        } else if (Os.isFamily(Os.FAMILY_DOS)) {
            this.ctrlz = AddAsisRemove.ASIS;
            setEol(CrLf.DOS);
        } else {
            this.ctrlz = AddAsisRemove.REMOVE;
            setEol(CrLf.UNIX);
        }
    }

    public FixCrLfFilter(Reader reader) throws IOException {
        super(reader);
        if (Os.isFamily(Os.FAMILY_MAC) && !Os.isFamily(Os.FAMILY_UNIX)) {
            this.ctrlz = AddAsisRemove.REMOVE;
            setEol(CrLf.MAC);
        } else if (Os.isFamily(Os.FAMILY_DOS)) {
            this.ctrlz = AddAsisRemove.ASIS;
            setEol(CrLf.DOS);
        } else {
            this.ctrlz = AddAsisRemove.REMOVE;
            setEol(CrLf.UNIX);
        }
    }

    private static String calculateEolString(CrLf crLf) {
        return crLf == CrLf.ASIS ? System.getProperty("line.separator") : (crLf == CrLf.CR || crLf == CrLf.MAC) ? "\r" : (crLf == CrLf.CRLF || crLf == CrLf.DOS) ? "\r\n" : "\n";
    }

    private void initInternalFilters() {
        this.in = this.ctrlz == AddAsisRemove.REMOVE ? new RemoveEofFilter(this.in) : this.in;
        this.in = new NormalizeEolFilter(this.in, calculateEolString(this.eol), getFixlast());
        if (this.tabs != AddAsisRemove.ASIS) {
            if (getJavafiles()) {
                this.in = new MaskJavaTabLiteralsFilter(this.in);
            }
            this.in = this.tabs == AddAsisRemove.ADD ? new AddTabFilter(this.in, getTablength()) : new RemoveTabFilter(this.in, getTablength());
        }
        this.in = this.ctrlz == AddAsisRemove.ADD ? new AddEofFilter(this.in) : this.in;
        this.initialized = true;
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        try {
            FixCrLfFilter fixCrLfFilter = new FixCrLfFilter(reader);
            fixCrLfFilter.setJavafiles(getJavafiles());
            fixCrLfFilter.setEol(getEol());
            fixCrLfFilter.setTab(getTab());
            fixCrLfFilter.setTablength(getTablength());
            fixCrLfFilter.setEof(getEof());
            fixCrLfFilter.setFixlast(getFixlast());
            fixCrLfFilter.initInternalFilters();
            return fixCrLfFilter;
        } catch (IOException e) {
            throw new BuildException(e);
        }
    }

    public AddAsisRemove getEof() {
        return this.ctrlz.newInstance();
    }

    public CrLf getEol() {
        return this.eol.newInstance();
    }

    public boolean getFixlast() {
        return this.fixlast;
    }

    public boolean getJavafiles() {
        return this.javafiles;
    }

    public AddAsisRemove getTab() {
        return this.tabs.newInstance();
    }

    public int getTablength() {
        return this.tabLength;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        int read;
        synchronized (this) {
            if (!this.initialized) {
                initInternalFilters();
            }
            read = this.in.read();
        }
        return read;
    }

    public void setEof(AddAsisRemove addAsisRemove) {
        this.ctrlz = addAsisRemove.resolve();
    }

    public void setEol(CrLf crLf) {
        this.eol = crLf.resolve();
    }

    public void setFixlast(boolean z) {
        this.fixlast = z;
    }

    public void setJavafiles(boolean z) {
        this.javafiles = z;
    }

    public void setTab(AddAsisRemove addAsisRemove) {
        this.tabs = addAsisRemove.resolve();
    }

    public void setTablength(int i) throws IOException {
        if (i < 2 || i > MAX_TAB_LENGTH) {
            throw new IOException("tablength must be between 2 and 80");
        }
        this.tabLength = i;
    }
}
