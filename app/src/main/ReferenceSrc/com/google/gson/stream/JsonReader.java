package com.google.gson.stream;

import android.support.v4.view.MotionEventCompat;
import com.google.gson.internal.JsonReaderInternalAccess;
import com.google.gson.internal.bind.JsonTreeReader;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
import org.apache.commons.io.IOUtils;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.commons.net.tftp.TFTP;
import org.apache.http.HttpStatus;

/* loaded from: classes.jar:com/google/gson/stream/JsonReader.class */
public class JsonReader implements Closeable {
    private static final long MIN_INCOMPLETE_INTEGER = -922337203685477580L;
    private static final char[] NON_EXECUTE_PREFIX = ")]}'\n".toCharArray();
    private static final int NUMBER_CHAR_DECIMAL = 3;
    private static final int NUMBER_CHAR_DIGIT = 2;
    private static final int NUMBER_CHAR_EXP_DIGIT = 7;
    private static final int NUMBER_CHAR_EXP_E = 5;
    private static final int NUMBER_CHAR_EXP_SIGN = 6;
    private static final int NUMBER_CHAR_FRACTION_DIGIT = 4;
    private static final int NUMBER_CHAR_NONE = 0;
    private static final int NUMBER_CHAR_SIGN = 1;
    private static final int PEEKED_BEGIN_ARRAY = 3;
    private static final int PEEKED_BEGIN_OBJECT = 1;
    private static final int PEEKED_BUFFERED = 11;
    private static final int PEEKED_DOUBLE_QUOTED = 9;
    private static final int PEEKED_DOUBLE_QUOTED_NAME = 13;
    private static final int PEEKED_END_ARRAY = 4;
    private static final int PEEKED_END_OBJECT = 2;
    private static final int PEEKED_EOF = 17;
    private static final int PEEKED_FALSE = 6;
    private static final int PEEKED_LONG = 15;
    private static final int PEEKED_NONE = 0;
    private static final int PEEKED_NULL = 7;
    private static final int PEEKED_NUMBER = 16;
    private static final int PEEKED_SINGLE_QUOTED = 8;
    private static final int PEEKED_SINGLE_QUOTED_NAME = 12;
    private static final int PEEKED_TRUE = 5;
    private static final int PEEKED_UNQUOTED = 10;
    private static final int PEEKED_UNQUOTED_NAME = 14;
    private final Reader in;
    private long peekedLong;
    private int peekedNumberLength;
    private String peekedString;
    private int stackSize;
    private boolean lenient = false;
    private final char[] buffer = new char[1024];
    private int pos = 0;
    private int limit = 0;
    private int lineNumber = 0;
    private int lineStart = 0;
    private int peeked = 0;
    private int[] stack = new int[32];

    static {
        JsonReaderInternalAccess.INSTANCE = new JsonReaderInternalAccess() { // from class: com.google.gson.stream.JsonReader.1
            @Override // com.google.gson.internal.JsonReaderInternalAccess
            public void promoteNameToValue(JsonReader jsonReader) throws IOException {
                if (jsonReader instanceof JsonTreeReader) {
                    ((JsonTreeReader) jsonReader).promoteNameToValue();
                    return;
                }
                int i = jsonReader.peeked;
                int i2 = i;
                if (i == 0) {
                    i2 = jsonReader.doPeek();
                }
                if (i2 == 13) {
                    jsonReader.peeked = 9;
                } else if (i2 == 12) {
                    jsonReader.peeked = 8;
                } else if (i2 != 14) {
                    throw new IllegalStateException("Expected a name but was " + jsonReader.peek() + "  at line " + jsonReader.getLineNumber() + " column " + jsonReader.getColumnNumber());
                } else {
                    jsonReader.peeked = 10;
                }
            }
        };
    }

    public JsonReader(Reader reader) {
        this.stackSize = 0;
        int[] iArr = this.stack;
        int i = this.stackSize;
        this.stackSize = i + 1;
        iArr[i] = 6;
        if (reader == null) {
            throw new NullPointerException("in == null");
        }
        this.in = reader;
    }

    private void checkLenient() throws IOException {
        if (!this.lenient) {
            throw syntaxError("Use JsonReader.setLenient(true) to accept malformed JSON");
        }
    }

    private void consumeNonExecutePrefix() throws IOException {
        nextNonWhitespace(true);
        this.pos--;
        if (this.pos + NON_EXECUTE_PREFIX.length <= this.limit || fillBuffer(NON_EXECUTE_PREFIX.length)) {
            for (int i = 0; i < NON_EXECUTE_PREFIX.length; i++) {
                if (this.buffer[this.pos + i] != NON_EXECUTE_PREFIX[i]) {
                    return;
                }
            }
            this.pos += NON_EXECUTE_PREFIX.length;
        }
    }

    public int doPeek() throws IOException {
        int i = 4;
        int i2 = this.stack[this.stackSize - 1];
        if (i2 == 1) {
            this.stack[this.stackSize - 1] = 2;
        } else if (i2 != 2) {
            if (i2 == 3 || i2 == 5) {
                this.stack[this.stackSize - 1] = 4;
                if (i2 == 5) {
                    switch (nextNonWhitespace(true)) {
                        case MotionEventCompat.AXIS_GENERIC_13 /* 44 */:
                            break;
                        case 59:
                            checkLenient();
                            break;
                        case FTPReply.DATA_CONNECTION_ALREADY_OPEN /* 125 */:
                            this.peeked = 2;
                            i = 2;
                            break;
                        default:
                            throw syntaxError("Unterminated object");
                    }
                }
                int nextNonWhitespace = nextNonWhitespace(true);
                switch (nextNonWhitespace) {
                    case 34:
                        i = 13;
                        this.peeked = 13;
                        break;
                    case 39:
                        checkLenient();
                        i = 12;
                        this.peeked = 12;
                        break;
                    case FTPReply.DATA_CONNECTION_ALREADY_OPEN /* 125 */:
                        if (i2 == 5) {
                            throw syntaxError("Expected name");
                        }
                        this.peeked = 2;
                        i = 2;
                        break;
                    default:
                        checkLenient();
                        this.pos--;
                        if (!isLiteral((char) nextNonWhitespace)) {
                            throw syntaxError("Expected name");
                        }
                        i = 14;
                        this.peeked = 14;
                        break;
                }
            } else if (i2 == 4) {
                this.stack[this.stackSize - 1] = 5;
                switch (nextNonWhitespace(true)) {
                    case 58:
                        break;
                    case 59:
                    case 60:
                    default:
                        throw syntaxError("Expected ':'");
                    case 61:
                        checkLenient();
                        if ((this.pos < this.limit || fillBuffer(1)) && this.buffer[this.pos] == '>') {
                            this.pos++;
                            break;
                        }
                        break;
                }
            } else if (i2 == 6) {
                if (this.lenient) {
                    consumeNonExecutePrefix();
                }
                this.stack[this.stackSize - 1] = 7;
            } else if (i2 == 7) {
                if (nextNonWhitespace(false) == -1) {
                    i = 17;
                    this.peeked = 17;
                } else {
                    checkLenient();
                    this.pos--;
                }
            } else if (i2 == 8) {
                throw new IllegalStateException("JsonReader is closed");
            }
            return i;
        } else {
            switch (nextNonWhitespace(true)) {
                case MotionEventCompat.AXIS_GENERIC_13 /* 44 */:
                    break;
                case 59:
                    checkLenient();
                    break;
                case 93:
                    this.peeked = 4;
                    return i;
                default:
                    throw syntaxError("Unterminated array");
            }
        }
        switch (nextNonWhitespace(true)) {
            case 34:
                if (this.stackSize == 1) {
                    checkLenient();
                }
                i = 9;
                this.peeked = 9;
                return i;
            case 39:
                checkLenient();
                i = 8;
                this.peeked = 8;
                return i;
            case MotionEventCompat.AXIS_GENERIC_13 /* 44 */:
            case 59:
                if (i2 == 1 && i2 != 2) {
                    throw syntaxError("Unexpected value");
                }
                checkLenient();
                this.pos--;
                this.peeked = 7;
                i = 7;
                return i;
            case 91:
                i = 3;
                this.peeked = 3;
                return i;
            case 93:
                if (i2 == 1) {
                    this.peeked = 4;
                    return i;
                }
                if (i2 == 1) {
                    break;
                }
                checkLenient();
                this.pos--;
                this.peeked = 7;
                i = 7;
                return i;
            case 123:
                this.peeked = 1;
                i = 1;
                return i;
            default:
                this.pos--;
                if (this.stackSize == 1) {
                    checkLenient();
                }
                i = peekKeyword();
                if (i == 0) {
                    int peekNumber = peekNumber();
                    i = peekNumber;
                    if (peekNumber == 0) {
                        if (!isLiteral(this.buffer[this.pos])) {
                            throw syntaxError("Expected value");
                        }
                        checkLenient();
                        i = 10;
                        this.peeked = 10;
                    }
                }
                return i;
        }
    }

    private boolean fillBuffer(int i) throws IOException {
        boolean z;
        char[] cArr = this.buffer;
        this.lineStart -= this.pos;
        if (this.limit != this.pos) {
            this.limit -= this.pos;
            System.arraycopy(cArr, this.pos, cArr, 0, this.limit);
        } else {
            this.limit = 0;
        }
        this.pos = 0;
        while (true) {
            int read = this.in.read(cArr, this.limit, cArr.length - this.limit);
            z = false;
            if (read == -1) {
                break;
            }
            this.limit += read;
            int i2 = i;
            if (this.lineNumber == 0) {
                i2 = i;
                if (this.lineStart == 0) {
                    i2 = i;
                    if (this.limit > 0) {
                        i2 = i;
                        if (cArr[0] == 65279) {
                            this.pos++;
                            this.lineStart++;
                            i2 = i + 1;
                        }
                    }
                }
            }
            i = i2;
            if (this.limit >= i2) {
                z = true;
                break;
            }
        }
        return z;
    }

    public int getColumnNumber() {
        return (this.pos - this.lineStart) + 1;
    }

    public int getLineNumber() {
        return this.lineNumber + 1;
    }

    private boolean isLiteral(char c) throws IOException {
        boolean z;
        switch (c) {
            case '#':
            case '/':
            case ';':
            case '=':
            case IOUtils.DIR_SEPARATOR_WINDOWS /* 92 */:
                checkLenient();
            case '\t':
            case '\n':
            case '\f':
            case '\r':
            case ' ':
            case MotionEventCompat.AXIS_GENERIC_13 /* 44 */:
            case ':':
            case '[':
            case ']':
            case '{':
            case FTPReply.DATA_CONNECTION_ALREADY_OPEN /* 125 */:
                z = false;
                break;
            default:
                z = true;
                break;
        }
        return z;
    }

    private int nextNonWhitespace(boolean z) throws IOException {
        char c;
        char[] cArr = this.buffer;
        int i = this.pos;
        int i2 = this.limit;
        while (true) {
            int i3 = i2;
            int i4 = i3;
            int i5 = i;
            if (i == i3) {
                this.pos = i;
                if (fillBuffer(1)) {
                    i5 = this.pos;
                    i4 = this.limit;
                } else if (z) {
                    throw new EOFException("End of input at line " + getLineNumber() + " column " + getColumnNumber());
                } else {
                    c = 65535;
                }
            }
            i = i5 + 1;
            char c2 = cArr[i5];
            if (c2 == '\n') {
                this.lineNumber++;
                this.lineStart = i;
                i2 = i4;
            } else if (c2 == ' ' || c2 == '\r') {
                i2 = i4;
            } else if (c2 == '\t') {
                i2 = i4;
            } else if (c2 == '/') {
                this.pos = i;
                if (i == i4) {
                    this.pos--;
                    boolean fillBuffer = fillBuffer(2);
                    this.pos++;
                    if (!fillBuffer) {
                        c = c2;
                    }
                }
                checkLenient();
                switch (cArr[this.pos]) {
                    case MotionEventCompat.AXIS_GENERIC_11 /* 42 */:
                        this.pos++;
                        if (!skipTo("*/")) {
                            throw syntaxError("Unterminated comment");
                        }
                        i = this.pos + 2;
                        i2 = this.limit;
                        continue;
                    case '/':
                        this.pos++;
                        skipToEndOfLine();
                        i = this.pos;
                        i2 = this.limit;
                        continue;
                    default:
                        c = c2;
                        break;
                }
            } else if (c2 == '#') {
                this.pos = i;
                checkLenient();
                skipToEndOfLine();
                i = this.pos;
                i2 = this.limit;
            } else {
                this.pos = i;
                c = c2;
            }
        }
        return c;
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x00c2, code lost:
        r0.append(r0, r12, r10 - r12);
        r6.pos = r10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private String nextQuotedValue(char c) throws IOException {
        int i;
        int i2;
        char[] cArr = this.buffer;
        StringBuilder sb = new StringBuilder();
        do {
            int i3 = this.pos;
            int i4 = this.limit;
            int i5 = i3;
            while (true) {
                int i6 = i5;
                if (i3 >= i4) {
                    break;
                }
                int i7 = i3 + 1;
                char c2 = cArr[i3];
                if (c2 == c) {
                    this.pos = i7;
                    sb.append(cArr, i6, (i7 - i6) - 1);
                    return sb.toString();
                }
                if (c2 == '\\') {
                    this.pos = i7;
                    sb.append(cArr, i6, (i7 - i6) - 1);
                    sb.append(readEscapeCharacter());
                    i3 = this.pos;
                    i = this.limit;
                    i2 = i3;
                } else {
                    i = i4;
                    i3 = i7;
                    i2 = i6;
                    if (c2 == '\n') {
                        this.lineNumber++;
                        this.lineStart = i7;
                        i = i4;
                        i3 = i7;
                        i2 = i6;
                    }
                }
                i4 = i;
                i5 = i2;
            }
        } while (fillBuffer(1));
        throw syntaxError("Unterminated string");
    }

    private String nextUnquotedValue() throws IOException {
        StringBuilder sb;
        int i;
        String sb2;
        StringBuilder sb3 = null;
        int i2 = 0;
        while (true) {
            if (this.pos + i2 < this.limit) {
                sb = sb3;
                i = i2;
                switch (this.buffer[this.pos + i2]) {
                    case '\t':
                    case '\n':
                    case '\f':
                    case '\r':
                    case ' ':
                    case MotionEventCompat.AXIS_GENERIC_13 /* 44 */:
                    case ':':
                    case '[':
                    case ']':
                    case '{':
                    case FTPReply.DATA_CONNECTION_ALREADY_OPEN /* 125 */:
                        break;
                    case '#':
                    case '/':
                    case ';':
                    case '=':
                    case IOUtils.DIR_SEPARATOR_WINDOWS /* 92 */:
                        checkLenient();
                        i = i2;
                        sb = sb3;
                        break;
                    default:
                        i2++;
                }
            } else if (i2 < this.buffer.length) {
                sb = sb3;
                i = i2;
                if (fillBuffer(i2 + 1)) {
                }
            } else {
                sb = sb3;
                if (sb3 == null) {
                    sb = new StringBuilder();
                }
                sb.append(this.buffer, this.pos, i2);
                this.pos += i2;
                i = 0;
                i2 = 0;
                sb3 = sb;
                if (!fillBuffer(1)) {
                }
            }
        }
        if (sb == null) {
            sb2 = new String(this.buffer, this.pos, i);
        } else {
            sb.append(this.buffer, this.pos, i);
            sb2 = sb.toString();
        }
        this.pos += i;
        return sb2;
    }

    private int peekKeyword() throws IOException {
        int i;
        String str;
        String str2;
        char c = this.buffer[this.pos];
        if (c == 't' || c == 'T') {
            str2 = "true";
            str = "TRUE";
            i = 5;
        } else if (c == 'f' || c == 'F') {
            str2 = "false";
            str = "FALSE";
            i = 6;
        } else if (c != 'n' && c != 'N') {
            i = 0;
            return i;
        } else {
            str2 = "null";
            str = "NULL";
            i = 7;
        }
        int length = str2.length();
        int i2 = 1;
        while (true) {
            if (i2 < length) {
                if (this.pos + i2 >= this.limit && !fillBuffer(i2 + 1)) {
                    i = 0;
                    break;
                }
                char c2 = this.buffer[this.pos + i2];
                if (c2 != str2.charAt(i2) && c2 != str.charAt(i2)) {
                    i = 0;
                    break;
                }
                i2++;
            } else if ((this.pos + length < this.limit || fillBuffer(length + 1)) && isLiteral(this.buffer[this.pos + length])) {
                i = 0;
            } else {
                this.pos += length;
                this.peeked = i;
            }
        }
        return i;
    }

    /* JADX WARN: Code restructure failed: missing block: B:13:0x0045, code lost:
        if (r13 != true) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x004a, code lost:
        if (r12 == false) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0053, code lost:
        if (r9 != Long.MIN_VALUE) goto L20;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0058, code lost:
        if (r11 == false) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x005d, code lost:
        if (r11 == false) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:22:0x0060, code lost:
        r5.peekedLong = r9;
        r5.pos += r14;
        r7 = 15;
        r5.peeked = 15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x00dc, code lost:
        if (isLiteral(r0) == false) goto L12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00df, code lost:
        r7 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x0236, code lost:
        r9 = -r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x0241, code lost:
        if (r13 == true) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x0247, code lost:
        if (r13 == true) goto L89;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x024e, code lost:
        if (r13 != true) goto L90;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x0251, code lost:
        r5.peekedNumberLength = r14;
        r7 = 16;
        r5.peeked = 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x0263, code lost:
        r7 = 0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int peekNumber() throws IOException {
        int i;
        boolean z;
        boolean z2;
        boolean z3;
        long j;
        char[] cArr = this.buffer;
        int i2 = this.pos;
        int i3 = this.limit;
        long j2 = 0;
        boolean z4 = false;
        boolean z5 = true;
        boolean z6 = false;
        int i4 = 0;
        while (true) {
            int i5 = i3;
            int i6 = i2;
            if (i2 + i4 == i3) {
                if (i4 == cArr.length) {
                    i = 0;
                } else if (fillBuffer(i4 + 1)) {
                    i6 = this.pos;
                    i5 = this.limit;
                }
            }
            char c = cArr[i6 + i4];
            switch (c) {
                case '+':
                    if (!z6) {
                        i = 0;
                        break;
                    } else {
                        z = true;
                        z2 = z5;
                        z3 = z4;
                        j = j2;
                        break;
                    }
                case MotionEventCompat.AXIS_GENERIC_14 /* 45 */:
                    if (z6) {
                        if (!z6) {
                            i = 0;
                            break;
                        } else {
                            z = true;
                            z2 = z5;
                            z3 = z4;
                            j = j2;
                            break;
                        }
                    } else {
                        z3 = true;
                        z = true;
                        j = j2;
                        z2 = z5;
                        break;
                    }
                case '.':
                    if (!z6) {
                        i = 0;
                        break;
                    } else {
                        z = true;
                        z2 = z5;
                        z3 = z4;
                        j = j2;
                        break;
                    }
                case TFTP.DEFAULT_PORT /* 69 */:
                case HttpStatus.SC_SWITCHING_PROTOCOLS /* 101 */:
                    if (!z6 && !z6) {
                        i = 0;
                        break;
                    } else {
                        z = true;
                        z2 = z5;
                        z3 = z4;
                        j = j2;
                        break;
                    }
                default:
                    if (c >= '0' && c <= '9') {
                        if (!z6 && z6) {
                            if (!z6) {
                                if (!z6) {
                                    if (!z6) {
                                        z2 = z5;
                                        z = z6;
                                        z3 = z4;
                                        j = j2;
                                        if (!z6) {
                                            break;
                                        }
                                    }
                                    z = true;
                                    z2 = z5;
                                    z3 = z4;
                                    j = j2;
                                    break;
                                } else {
                                    z = true;
                                    z2 = z5;
                                    z3 = z4;
                                    j = j2;
                                    break;
                                }
                            } else if (j2 != 0) {
                                j = (10 * j2) - (c - '0');
                                z2 = z5 & (j2 > MIN_INCOMPLETE_INTEGER || (j2 == MIN_INCOMPLETE_INTEGER && j < j2));
                                z = z6;
                                z3 = z4;
                                break;
                            } else {
                                i = 0;
                                break;
                            }
                        } else {
                            j = -(c - '0');
                            z = true;
                            z2 = z5;
                            z3 = z4;
                            break;
                        }
                    }
                    break;
            }
            i4++;
            z5 = z2;
            i3 = i5;
            z6 = z;
            z4 = z3;
            i2 = i6;
            j2 = j;
        }
        return i;
    }

    private void push(int i) {
        if (this.stackSize == this.stack.length) {
            int[] iArr = new int[this.stackSize * 2];
            System.arraycopy(this.stack, 0, iArr, 0, this.stackSize);
            this.stack = iArr;
        }
        int[] iArr2 = this.stack;
        int i2 = this.stackSize;
        this.stackSize = i2 + 1;
        iArr2[i2] = i;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private char readEscapeCharacter() throws IOException {
        char c;
        int i;
        if (this.pos != this.limit || fillBuffer(1)) {
            char[] cArr = this.buffer;
            int i2 = this.pos;
            this.pos = i2 + 1;
            char c2 = cArr[i2];
            switch (c2) {
                case '\n':
                    this.lineNumber++;
                    this.lineStart = this.pos;
                    c = c2;
                    break;
                case 'b':
                    c = '\b';
                    break;
                case HttpStatus.SC_PROCESSING /* 102 */:
                    c = '\f';
                    break;
                case 'n':
                    c = '\n';
                    break;
                case 'r':
                    c = '\r';
                    break;
                case 't':
                    c = '\t';
                    break;
                case 'u':
                    if (this.pos + 4 > this.limit && !fillBuffer(4)) {
                        throw syntaxError("Unterminated escape sequence");
                    }
                    char c3 = 0;
                    int i3 = this.pos;
                    for (int i4 = i3; i4 < i3 + 4; i4++) {
                        char c4 = this.buffer[i4];
                        char c5 = (char) (c3 << 4);
                        if (c4 >= '0' && c4 <= '9') {
                            i = c4 - '0';
                        } else if (c4 >= 'a' && c4 <= 'f') {
                            i = (c4 - 'a') + 10;
                        } else if (c4 < 'A' || c4 > 'F') {
                            throw new NumberFormatException("\\u" + new String(this.buffer, this.pos, 4));
                        } else {
                            i = (c4 - 'A') + 10;
                        }
                        c3 = (char) (i + c5);
                    }
                    this.pos += 4;
                    c = c3;
                    break;
                    break;
                default:
                    c = c2;
                    break;
            }
            return c;
        }
        throw syntaxError("Unterminated escape sequence");
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x0079, code lost:
        r4.pos = r7;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void skipQuotedValue(char c) throws IOException {
        int i;
        char[] cArr = this.buffer;
        do {
            int i2 = this.pos;
            int i3 = this.limit;
            while (true) {
                int i4 = i3;
                if (i2 >= i4) {
                    break;
                }
                int i5 = i2 + 1;
                char c2 = cArr[i2];
                if (c2 == c) {
                    this.pos = i5;
                    return;
                }
                if (c2 == '\\') {
                    this.pos = i5;
                    readEscapeCharacter();
                    i2 = this.pos;
                    i = this.limit;
                } else {
                    i = i4;
                    i2 = i5;
                    if (c2 == '\n') {
                        this.lineNumber++;
                        this.lineStart = i5;
                        i = i4;
                        i2 = i5;
                    }
                }
                i3 = i;
            }
        } while (fillBuffer(1));
        throw syntaxError("Unterminated string");
    }

    private boolean skipTo(String str) throws IOException {
        boolean z;
        loop0: while (true) {
            if (this.pos + str.length() > this.limit && !fillBuffer(str.length())) {
                z = false;
                break;
            }
            if (this.buffer[this.pos] != '\n') {
                for (int i = 0; i < str.length(); i++) {
                    if (this.buffer[this.pos + i] == str.charAt(i)) {
                    }
                }
                z = true;
                break loop0;
            }
            this.lineNumber++;
            this.lineStart = this.pos + 1;
            this.pos++;
        }
        return z;
    }

    private void skipToEndOfLine() throws IOException {
        char c;
        do {
            if (this.pos >= this.limit && !fillBuffer(1)) {
                return;
            }
            char[] cArr = this.buffer;
            int i = this.pos;
            this.pos = i + 1;
            c = cArr[i];
            if (c == '\n') {
                this.lineNumber++;
                this.lineStart = this.pos;
                return;
            }
        } while (c != '\r');
    }

    private void skipUnquotedValue() throws IOException {
        do {
            int i = 0;
            while (this.pos + i < this.limit) {
                switch (this.buffer[this.pos + i]) {
                    case '\t':
                    case '\n':
                    case '\f':
                    case '\r':
                    case ' ':
                    case MotionEventCompat.AXIS_GENERIC_13 /* 44 */:
                    case ':':
                    case '[':
                    case ']':
                    case '{':
                    case FTPReply.DATA_CONNECTION_ALREADY_OPEN /* 125 */:
                        this.pos += i;
                        return;
                    case '#':
                    case '/':
                    case ';':
                    case '=':
                    case IOUtils.DIR_SEPARATOR_WINDOWS /* 92 */:
                        checkLenient();
                        this.pos += i;
                        return;
                    default:
                        i++;
                }
            }
            this.pos += i;
        } while (fillBuffer(1));
    }

    private IOException syntaxError(String str) throws IOException {
        throw new MalformedJsonException(str + " at line " + getLineNumber() + " column " + getColumnNumber());
    }

    public void beginArray() throws IOException {
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        if (i2 == 3) {
            push(1);
            this.peeked = 0;
            return;
        }
        throw new IllegalStateException("Expected BEGIN_ARRAY but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
    }

    public void beginObject() throws IOException {
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        if (i2 == 1) {
            push(3);
            this.peeked = 0;
            return;
        }
        throw new IllegalStateException("Expected BEGIN_OBJECT but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.peeked = 0;
        this.stack[0] = 8;
        this.stackSize = 1;
        this.in.close();
    }

    public void endArray() throws IOException {
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        if (i2 == 4) {
            this.stackSize--;
            this.peeked = 0;
            return;
        }
        throw new IllegalStateException("Expected END_ARRAY but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
    }

    public void endObject() throws IOException {
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        if (i2 == 2) {
            this.stackSize--;
            this.peeked = 0;
            return;
        }
        throw new IllegalStateException("Expected END_OBJECT but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
    }

    public boolean hasNext() throws IOException {
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        return (i2 == 2 || i2 == 4) ? false : true;
    }

    public final boolean isLenient() {
        return this.lenient;
    }

    public boolean nextBoolean() throws IOException {
        boolean z = false;
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        if (i2 == 5) {
            this.peeked = 0;
            z = true;
        } else if (i2 != 6) {
            throw new IllegalStateException("Expected a boolean but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
        } else {
            this.peeked = 0;
        }
        return z;
    }

    public double nextDouble() throws IOException {
        double parseDouble;
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        if (i2 == 15) {
            this.peeked = 0;
            parseDouble = this.peekedLong;
        } else {
            if (i2 == 16) {
                this.peekedString = new String(this.buffer, this.pos, this.peekedNumberLength);
                this.pos += this.peekedNumberLength;
            } else if (i2 == 8 || i2 == 9) {
                this.peekedString = nextQuotedValue(i2 == 8 ? '\'' : '\"');
            } else if (i2 == 10) {
                this.peekedString = nextUnquotedValue();
            } else if (i2 != 11) {
                throw new IllegalStateException("Expected a double but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
            }
            this.peeked = 11;
            parseDouble = Double.parseDouble(this.peekedString);
            if (!this.lenient && (Double.isNaN(parseDouble) || Double.isInfinite(parseDouble))) {
                throw new MalformedJsonException("JSON forbids NaN and infinities: " + parseDouble + " at line " + getLineNumber() + " column " + getColumnNumber());
            }
            this.peekedString = null;
            this.peeked = 0;
        }
        return parseDouble;
    }

    public int nextInt() throws IOException {
        int parseInt;
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        if (i2 == 15) {
            parseInt = (int) this.peekedLong;
            if (this.peekedLong != parseInt) {
                throw new NumberFormatException("Expected an int but was " + this.peekedLong + " at line " + getLineNumber() + " column " + getColumnNumber());
            }
            this.peeked = 0;
        } else {
            if (i2 == 16) {
                this.peekedString = new String(this.buffer, this.pos, this.peekedNumberLength);
                this.pos += this.peekedNumberLength;
            } else if (i2 != 8 && i2 != 9) {
                throw new IllegalStateException("Expected an int but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
            } else {
                this.peekedString = nextQuotedValue(i2 == 8 ? '\'' : '\"');
                try {
                    parseInt = Integer.parseInt(this.peekedString);
                    this.peeked = 0;
                } catch (NumberFormatException e) {
                }
            }
            this.peeked = 11;
            double parseDouble = Double.parseDouble(this.peekedString);
            parseInt = (int) parseDouble;
            if (parseInt != parseDouble) {
                throw new NumberFormatException("Expected an int but was " + this.peekedString + " at line " + getLineNumber() + " column " + getColumnNumber());
            }
            this.peekedString = null;
            this.peeked = 0;
        }
        return parseInt;
    }

    public long nextLong() throws IOException {
        long parseLong;
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        if (i2 == 15) {
            this.peeked = 0;
            parseLong = this.peekedLong;
        } else {
            if (i2 == 16) {
                this.peekedString = new String(this.buffer, this.pos, this.peekedNumberLength);
                this.pos += this.peekedNumberLength;
            } else if (i2 != 8 && i2 != 9) {
                throw new IllegalStateException("Expected a long but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
            } else {
                this.peekedString = nextQuotedValue(i2 == 8 ? '\'' : '\"');
                try {
                    parseLong = Long.parseLong(this.peekedString);
                    this.peeked = 0;
                } catch (NumberFormatException e) {
                }
            }
            this.peeked = 11;
            double parseDouble = Double.parseDouble(this.peekedString);
            parseLong = (long) parseDouble;
            if (parseLong != parseDouble) {
                throw new NumberFormatException("Expected a long but was " + this.peekedString + " at line " + getLineNumber() + " column " + getColumnNumber());
            }
            this.peekedString = null;
            this.peeked = 0;
        }
        return parseLong;
    }

    public String nextName() throws IOException {
        String nextQuotedValue;
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        if (i2 == 14) {
            nextQuotedValue = nextUnquotedValue();
        } else if (i2 == 12) {
            nextQuotedValue = nextQuotedValue('\'');
        } else if (i2 != 13) {
            throw new IllegalStateException("Expected a name but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
        } else {
            nextQuotedValue = nextQuotedValue('\"');
        }
        this.peeked = 0;
        return nextQuotedValue;
    }

    public void nextNull() throws IOException {
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        if (i2 == 7) {
            this.peeked = 0;
            return;
        }
        throw new IllegalStateException("Expected null but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
    }

    public String nextString() throws IOException {
        String str;
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        if (i2 == 10) {
            str = nextUnquotedValue();
        } else if (i2 == 8) {
            str = nextQuotedValue('\'');
        } else if (i2 == 9) {
            str = nextQuotedValue('\"');
        } else if (i2 == 11) {
            str = this.peekedString;
            this.peekedString = null;
        } else if (i2 == 15) {
            str = Long.toString(this.peekedLong);
        } else if (i2 != 16) {
            throw new IllegalStateException("Expected a string but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
        } else {
            str = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        }
        this.peeked = 0;
        return str;
    }

    public JsonToken peek() throws IOException {
        JsonToken jsonToken;
        int i = this.peeked;
        int i2 = i;
        if (i == 0) {
            i2 = doPeek();
        }
        switch (i2) {
            case 1:
                jsonToken = JsonToken.BEGIN_OBJECT;
                break;
            case 2:
                jsonToken = JsonToken.END_OBJECT;
                break;
            case 3:
                jsonToken = JsonToken.BEGIN_ARRAY;
                break;
            case 4:
                jsonToken = JsonToken.END_ARRAY;
                break;
            case 5:
            case 6:
                jsonToken = JsonToken.BOOLEAN;
                break;
            case 7:
                jsonToken = JsonToken.NULL;
                break;
            case 8:
            case 9:
            case 10:
            case 11:
                jsonToken = JsonToken.STRING;
                break;
            case 12:
            case 13:
            case 14:
                jsonToken = JsonToken.NAME;
                break;
            case 15:
            case 16:
                jsonToken = JsonToken.NUMBER;
                break;
            case 17:
                jsonToken = JsonToken.END_DOCUMENT;
                break;
            default:
                throw new AssertionError();
        }
        return jsonToken;
    }

    public final void setLenient(boolean z) {
        this.lenient = z;
    }

    public void skipValue() throws IOException {
        int i;
        int i2 = 0;
        do {
            int i3 = this.peeked;
            int i4 = i3;
            if (i3 == 0) {
                i4 = doPeek();
            }
            if (i4 == 3) {
                push(1);
                i = i2 + 1;
            } else if (i4 == 1) {
                push(3);
                i = i2 + 1;
            } else if (i4 == 4) {
                this.stackSize--;
                i = i2 - 1;
            } else if (i4 == 2) {
                this.stackSize--;
                i = i2 - 1;
            } else if (i4 == 14 || i4 == 10) {
                skipUnquotedValue();
                i = i2;
            } else if (i4 == 8 || i4 == 12) {
                skipQuotedValue('\'');
                i = i2;
            } else if (i4 == 9 || i4 == 13) {
                skipQuotedValue('\"');
                i = i2;
            } else {
                i = i2;
                if (i4 == 16) {
                    this.pos += this.peekedNumberLength;
                    i = i2;
                }
            }
            this.peeked = 0;
            i2 = i;
        } while (i != 0);
    }

    public String toString() {
        return getClass().getSimpleName() + " at line " + getLineNumber() + " column " + getColumnNumber();
    }
}
