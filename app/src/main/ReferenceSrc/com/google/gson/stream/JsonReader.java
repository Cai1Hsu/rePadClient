package com.google.gson.stream;

import android.support.v4.view.MotionEventCompat;
import com.google.gson.internal.JsonReaderInternalAccess;
import com.google.gson.internal.bind.JsonTreeReader;
import java.io.Closeable;
import java.io.EOFException;
import java.io.IOException;
import java.io.Reader;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.commons.net.tftp.TFTP;
import org.apache.http.HttpStatus;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    static /* synthetic */ int access$000(JsonReader x0) {
        return x0.peeked;
    }

    static /* synthetic */ int access$002(JsonReader x0, int x1) {
        x0.peeked = x1;
        return x1;
    }

    static /* synthetic */ int access$100(JsonReader x0) throws IOException {
        return x0.doPeek();
    }

    static /* synthetic */ int access$200(JsonReader x0) {
        return x0.getLineNumber();
    }

    static /* synthetic */ int access$300(JsonReader x0) {
        return x0.getColumnNumber();
    }

    static {
        JsonReaderInternalAccess.INSTANCE = new AnonymousClass1();
    }

    public JsonReader(Reader in) {
        this.stackSize = 0;
        int[] iArr = this.stack;
        int i = this.stackSize;
        this.stackSize = i + 1;
        iArr[i] = 6;
        if (in == null) {
            throw new NullPointerException("in == null");
        }
        this.in = in;
    }

    public final void setLenient(boolean lenient) {
        this.lenient = lenient;
    }

    public final boolean isLenient() {
        return this.lenient;
    }

    public void beginArray() throws IOException {
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        if (p == 3) {
            push(1);
            this.peeked = 0;
            return;
        }
        throw new IllegalStateException("Expected BEGIN_ARRAY but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
    }

    public void endArray() throws IOException {
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        if (p == 4) {
            this.stackSize--;
            this.peeked = 0;
            return;
        }
        throw new IllegalStateException("Expected END_ARRAY but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
    }

    public void beginObject() throws IOException {
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        if (p == 1) {
            push(3);
            this.peeked = 0;
            return;
        }
        throw new IllegalStateException("Expected BEGIN_OBJECT but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
    }

    public void endObject() throws IOException {
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        if (p == 2) {
            this.stackSize--;
            this.peeked = 0;
            return;
        }
        throw new IllegalStateException("Expected END_OBJECT but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
    }

    public boolean hasNext() throws IOException {
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        return (p == 2 || p == 4) ? false : true;
    }

    public JsonToken peek() throws IOException {
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        switch (p) {
            case 1:
                return JsonToken.BEGIN_OBJECT;
            case 2:
                return JsonToken.END_OBJECT;
            case 3:
                return JsonToken.BEGIN_ARRAY;
            case 4:
                return JsonToken.END_ARRAY;
            case 5:
            case 6:
                return JsonToken.BOOLEAN;
            case 7:
                return JsonToken.NULL;
            case 8:
            case 9:
            case 10:
            case 11:
                return JsonToken.STRING;
            case 12:
            case 13:
            case 14:
                return JsonToken.NAME;
            case 15:
            case 16:
                return JsonToken.NUMBER;
            case 17:
                return JsonToken.END_DOCUMENT;
            default:
                throw new AssertionError();
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private int doPeek() throws IOException {
        int peekStack = this.stack[this.stackSize - 1];
        if (peekStack == 1) {
            this.stack[this.stackSize - 1] = 2;
        } else if (peekStack == 2) {
            switch (nextNonWhitespace(true)) {
                case MotionEventCompat.AXIS_GENERIC_13 /* 44 */:
                    break;
                case 59:
                    checkLenient();
                    break;
                case 93:
                    this.peeked = 4;
                    return 4;
                default:
                    throw syntaxError("Unterminated array");
            }
        } else if (peekStack == 3 || peekStack == 5) {
            this.stack[this.stackSize - 1] = 4;
            if (peekStack == 5) {
                switch (nextNonWhitespace(true)) {
                    case MotionEventCompat.AXIS_GENERIC_13 /* 44 */:
                        break;
                    case 59:
                        checkLenient();
                        break;
                    case FTPReply.DATA_CONNECTION_ALREADY_OPEN /* 125 */:
                        this.peeked = 2;
                        return 2;
                    default:
                        throw syntaxError("Unterminated object");
                }
            }
            int c = nextNonWhitespace(true);
            switch (c) {
                case 34:
                    this.peeked = 13;
                    return 13;
                case 39:
                    checkLenient();
                    this.peeked = 12;
                    return 12;
                case FTPReply.DATA_CONNECTION_ALREADY_OPEN /* 125 */:
                    if (peekStack != 5) {
                        this.peeked = 2;
                        return 2;
                    }
                    throw syntaxError("Expected name");
                default:
                    checkLenient();
                    this.pos--;
                    if (isLiteral((char) c)) {
                        this.peeked = 14;
                        return 14;
                    }
                    throw syntaxError("Expected name");
            }
        } else if (peekStack == 4) {
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
        } else if (peekStack == 6) {
            if (this.lenient) {
                consumeNonExecutePrefix();
            }
            this.stack[this.stackSize - 1] = 7;
        } else if (peekStack == 7) {
            if (nextNonWhitespace(false) == -1) {
                this.peeked = 17;
                return 17;
            }
            checkLenient();
            this.pos--;
        } else if (peekStack == 8) {
            throw new IllegalStateException("JsonReader is closed");
        }
        switch (nextNonWhitespace(true)) {
            case 34:
                if (this.stackSize == 1) {
                    checkLenient();
                }
                this.peeked = 9;
                return 9;
            case 39:
                checkLenient();
                this.peeked = 8;
                return 8;
            case MotionEventCompat.AXIS_GENERIC_13 /* 44 */:
            case 59:
                break;
            case 91:
                this.peeked = 3;
                return 3;
            case 93:
                if (peekStack == 1) {
                    this.peeked = 4;
                    return 4;
                }
                break;
            case 123:
                this.peeked = 1;
                return 1;
            default:
                this.pos--;
                if (this.stackSize == 1) {
                    checkLenient();
                }
                int result = peekKeyword();
                if (result == 0) {
                    int result2 = peekNumber();
                    if (result2 == 0) {
                        if (!isLiteral(this.buffer[this.pos])) {
                            throw syntaxError("Expected value");
                        }
                        checkLenient();
                        this.peeked = 10;
                        return 10;
                    }
                    return result2;
                }
                return result;
        }
        if (peekStack == 1 || peekStack == 2) {
            checkLenient();
            this.pos--;
            this.peeked = 7;
            return 7;
        }
        throw syntaxError("Unexpected value");
    }

    private int peekKeyword() throws IOException {
        int peeking;
        String keywordUpper;
        String keyword;
        char c = this.buffer[this.pos];
        if (c == 't' || c == 'T') {
            keyword = "true";
            keywordUpper = "TRUE";
            peeking = 5;
        } else if (c == 'f' || c == 'F') {
            keyword = "false";
            keywordUpper = "FALSE";
            peeking = 6;
        } else if (c != 'n' && c != 'N') {
            return 0;
        } else {
            keyword = "null";
            keywordUpper = "NULL";
            peeking = 7;
        }
        int length = keyword.length();
        for (int i = 1; i < length; i++) {
            if (this.pos + i >= this.limit && !fillBuffer(i + 1)) {
                return 0;
            }
            char c2 = this.buffer[this.pos + i];
            if (c2 != keyword.charAt(i) && c2 != keywordUpper.charAt(i)) {
                return 0;
            }
        }
        if ((this.pos + length < this.limit || fillBuffer(length + 1)) && isLiteral(this.buffer[this.pos + length])) {
            return 0;
        }
        this.pos += length;
        this.peeked = peeking;
        return peeking;
    }

    /* JADX WARN: Code restructure failed: missing block: B:103:?, code lost:
        return 15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:104:?, code lost:
        return 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:11:0x0026, code lost:
        if (r7 != 2) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:12:0x0028, code lost:
        if (r4 == false) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:14:0x002e, code lost:
        if (r12 != Long.MIN_VALUE) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:15:0x0030, code lost:
        if (r8 == false) goto L76;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0032, code lost:
        if (r8 == false) goto L75;
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x0034, code lost:
        r18.peekedLong = r12;
        r18.pos += r5;
        r18.peeked = 15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x0065, code lost:
        if (isLiteral(r3) == false) goto L10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:27:0x0067, code lost:
        return 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x00db, code lost:
        r12 = -r12;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x00df, code lost:
        if (r7 == 2) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x00e2, code lost:
        if (r7 == 4) goto L82;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x00e5, code lost:
        if (r7 != 7) goto L83;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x00e7, code lost:
        r18.peekedNumberLength = r5;
        r18.peeked = 16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x00f3, code lost:
        return 0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int peekNumber() throws IOException {
        char[] buffer = this.buffer;
        int p = this.pos;
        int l = this.limit;
        long value = 0;
        boolean negative = false;
        boolean fitsInLong = true;
        int last = 0;
        int i = 0;
        while (true) {
            if (p + i == l) {
                if (i == buffer.length) {
                    return 0;
                }
                if (fillBuffer(i + 1)) {
                    p = this.pos;
                    l = this.limit;
                }
            }
            char c = buffer[p + i];
            switch (c) {
                case '+':
                    if (last == 5) {
                        last = 6;
                        break;
                    } else {
                        return 0;
                    }
                case MotionEventCompat.AXIS_GENERIC_14 /* 45 */:
                    if (last == 0) {
                        negative = true;
                        last = 1;
                        break;
                    } else if (last == 5) {
                        last = 6;
                        break;
                    } else {
                        return 0;
                    }
                case MotionEventCompat.AXIS_GENERIC_15 /* 46 */:
                    if (last == 2) {
                        last = 3;
                        break;
                    } else {
                        return 0;
                    }
                case TFTP.DEFAULT_PORT /* 69 */:
                case HttpStatus.SC_SWITCHING_PROTOCOLS /* 101 */:
                    if (last == 2 || last == 4) {
                        last = 5;
                        break;
                    } else {
                        return 0;
                    }
                default:
                    if (c >= '0' && c <= '9') {
                        if (last == 1 || last == 0) {
                            value = -(c - '0');
                            last = 2;
                            break;
                        } else if (last == 2) {
                            if (value == 0) {
                                return 0;
                            }
                            long newValue = (10 * value) - (c - '0');
                            fitsInLong &= value > MIN_INCOMPLETE_INTEGER || (value == MIN_INCOMPLETE_INTEGER && newValue < value);
                            value = newValue;
                            break;
                        } else if (last == 3) {
                            last = 4;
                            break;
                        } else if (last != 5 && last != 6) {
                            break;
                        } else {
                            last = 7;
                            break;
                        }
                    }
                    break;
            }
            i++;
        }
    }

    private boolean isLiteral(char c) throws IOException {
        switch (c) {
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
            default:
                return true;
            case '#':
            case MotionEventCompat.AXIS_GENERIC_16 /* 47 */:
            case ';':
            case '=':
            case '\\':
                checkLenient();
                break;
        }
        return false;
    }

    public String nextName() throws IOException {
        String result;
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        if (p == 14) {
            result = nextUnquotedValue();
        } else if (p == 12) {
            result = nextQuotedValue('\'');
        } else if (p == 13) {
            result = nextQuotedValue('\"');
        } else {
            throw new IllegalStateException("Expected a name but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
        }
        this.peeked = 0;
        return result;
    }

    public String nextString() throws IOException {
        String result;
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        if (p == 10) {
            result = nextUnquotedValue();
        } else if (p == 8) {
            result = nextQuotedValue('\'');
        } else if (p == 9) {
            result = nextQuotedValue('\"');
        } else if (p == 11) {
            result = this.peekedString;
            this.peekedString = null;
        } else if (p == 15) {
            result = Long.toString(this.peekedLong);
        } else if (p == 16) {
            result = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        } else {
            throw new IllegalStateException("Expected a string but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
        }
        this.peeked = 0;
        return result;
    }

    public boolean nextBoolean() throws IOException {
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        if (p == 5) {
            this.peeked = 0;
            return true;
        } else if (p == 6) {
            this.peeked = 0;
            return false;
        } else {
            throw new IllegalStateException("Expected a boolean but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
        }
    }

    public void nextNull() throws IOException {
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        if (p == 7) {
            this.peeked = 0;
            return;
        }
        throw new IllegalStateException("Expected null but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
    }

    public double nextDouble() throws IOException {
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        if (p == 15) {
            this.peeked = 0;
            return this.peekedLong;
        }
        if (p == 16) {
            this.peekedString = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        } else if (p == 8 || p == 9) {
            this.peekedString = nextQuotedValue(p == 8 ? '\'' : '\"');
        } else if (p == 10) {
            this.peekedString = nextUnquotedValue();
        } else if (p != 11) {
            throw new IllegalStateException("Expected a double but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
        }
        this.peeked = 11;
        double result = Double.parseDouble(this.peekedString);
        if (!this.lenient && (Double.isNaN(result) || Double.isInfinite(result))) {
            throw new MalformedJsonException("JSON forbids NaN and infinities: " + result + " at line " + getLineNumber() + " column " + getColumnNumber());
        }
        this.peekedString = null;
        this.peeked = 0;
        return result;
    }

    public long nextLong() throws IOException {
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        if (p == 15) {
            this.peeked = 0;
            return this.peekedLong;
        }
        if (p == 16) {
            this.peekedString = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        } else if (p == 8 || p == 9) {
            this.peekedString = nextQuotedValue(p == 8 ? '\'' : '\"');
            try {
                long parseLong = Long.parseLong(this.peekedString);
                this.peeked = 0;
                return parseLong;
            } catch (NumberFormatException e) {
            }
        } else {
            throw new IllegalStateException("Expected a long but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
        }
        this.peeked = 11;
        double asDouble = Double.parseDouble(this.peekedString);
        long result = (long) asDouble;
        if (result != asDouble) {
            throw new NumberFormatException("Expected a long but was " + this.peekedString + " at line " + getLineNumber() + " column " + getColumnNumber());
        }
        this.peekedString = null;
        this.peeked = 0;
        return result;
    }

    private String nextQuotedValue(char quote) throws IOException {
        char[] buffer = this.buffer;
        StringBuilder builder = new StringBuilder();
        do {
            int p = this.pos;
            int l = this.limit;
            int start = p;
            int p2 = p;
            while (p2 < l) {
                int p3 = p2 + 1;
                char c = buffer[p2];
                if (c == quote) {
                    this.pos = p3;
                    builder.append(buffer, start, (p3 - start) - 1);
                    return builder.toString();
                }
                if (c == '\\') {
                    this.pos = p3;
                    builder.append(buffer, start, (p3 - start) - 1);
                    builder.append(readEscapeCharacter());
                    p3 = this.pos;
                    l = this.limit;
                    start = p3;
                } else if (c == '\n') {
                    this.lineNumber++;
                    this.lineStart = p3;
                }
                p2 = p3;
            }
            builder.append(buffer, start, p2 - start);
            this.pos = p2;
        } while (fillBuffer(1));
        throw syntaxError("Unterminated string");
    }

    private String nextUnquotedValue() throws IOException {
        String result;
        StringBuilder builder = null;
        int i = 0;
        while (true) {
            if (this.pos + i < this.limit) {
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
                        break;
                    case '#':
                    case MotionEventCompat.AXIS_GENERIC_16 /* 47 */:
                    case ';':
                    case '=':
                    case '\\':
                        checkLenient();
                        break;
                    default:
                        i++;
                }
            } else if (i < this.buffer.length) {
                if (fillBuffer(i + 1)) {
                }
            } else {
                if (builder == null) {
                    builder = new StringBuilder();
                }
                builder.append(this.buffer, this.pos, i);
                this.pos += i;
                i = 0;
                if (!fillBuffer(1)) {
                }
            }
        }
        if (builder == null) {
            result = new String(this.buffer, this.pos, i);
        } else {
            builder.append(this.buffer, this.pos, i);
            result = builder.toString();
        }
        this.pos += i;
        return result;
    }

    private void skipQuotedValue(char quote) throws IOException {
        char[] buffer = this.buffer;
        do {
            int p = this.pos;
            int l = this.limit;
            int p2 = p;
            while (p2 < l) {
                int p3 = p2 + 1;
                char c = buffer[p2];
                if (c == quote) {
                    this.pos = p3;
                    return;
                }
                if (c == '\\') {
                    this.pos = p3;
                    readEscapeCharacter();
                    p3 = this.pos;
                    l = this.limit;
                } else if (c == '\n') {
                    this.lineNumber++;
                    this.lineStart = p3;
                }
                p2 = p3;
            }
            this.pos = p2;
        } while (fillBuffer(1));
        throw syntaxError("Unterminated string");
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
                    case MotionEventCompat.AXIS_GENERIC_16 /* 47 */:
                    case ';':
                    case '=':
                    case '\\':
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

    public int nextInt() throws IOException {
        int p = this.peeked;
        if (p == 0) {
            p = doPeek();
        }
        if (p == 15) {
            int result = (int) this.peekedLong;
            if (this.peekedLong != result) {
                throw new NumberFormatException("Expected an int but was " + this.peekedLong + " at line " + getLineNumber() + " column " + getColumnNumber());
            }
            this.peeked = 0;
            return result;
        }
        if (p == 16) {
            this.peekedString = new String(this.buffer, this.pos, this.peekedNumberLength);
            this.pos += this.peekedNumberLength;
        } else if (p == 8 || p == 9) {
            this.peekedString = nextQuotedValue(p == 8 ? '\'' : '\"');
            try {
                int result2 = Integer.parseInt(this.peekedString);
                this.peeked = 0;
                return result2;
            } catch (NumberFormatException e) {
            }
        } else {
            throw new IllegalStateException("Expected an int but was " + peek() + " at line " + getLineNumber() + " column " + getColumnNumber());
        }
        this.peeked = 11;
        double asDouble = Double.parseDouble(this.peekedString);
        int result3 = (int) asDouble;
        if (result3 != asDouble) {
            throw new NumberFormatException("Expected an int but was " + this.peekedString + " at line " + getLineNumber() + " column " + getColumnNumber());
        }
        this.peekedString = null;
        this.peeked = 0;
        return result3;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.peeked = 0;
        this.stack[0] = 8;
        this.stackSize = 1;
        this.in.close();
    }

    public void skipValue() throws IOException {
        int count = 0;
        do {
            int p = this.peeked;
            if (p == 0) {
                p = doPeek();
            }
            if (p == 3) {
                push(1);
                count++;
            } else if (p == 1) {
                push(3);
                count++;
            } else if (p == 4) {
                this.stackSize--;
                count--;
            } else if (p == 2) {
                this.stackSize--;
                count--;
            } else if (p == 14 || p == 10) {
                skipUnquotedValue();
            } else if (p == 8 || p == 12) {
                skipQuotedValue('\'');
            } else if (p == 9 || p == 13) {
                skipQuotedValue('\"');
            } else if (p == 16) {
                this.pos += this.peekedNumberLength;
            }
            this.peeked = 0;
        } while (count != 0);
    }

    private void push(int newTop) {
        if (this.stackSize == this.stack.length) {
            int[] newStack = new int[this.stackSize * 2];
            System.arraycopy(this.stack, 0, newStack, 0, this.stackSize);
            this.stack = newStack;
        }
        int[] iArr = this.stack;
        int i = this.stackSize;
        this.stackSize = i + 1;
        iArr[i] = newTop;
    }

    private boolean fillBuffer(int minimum) throws IOException {
        char[] buffer = this.buffer;
        this.lineStart -= this.pos;
        if (this.limit != this.pos) {
            this.limit -= this.pos;
            System.arraycopy(buffer, this.pos, buffer, 0, this.limit);
        } else {
            this.limit = 0;
        }
        this.pos = 0;
        do {
            int total = this.in.read(buffer, this.limit, buffer.length - this.limit);
            if (total == -1) {
                return false;
            }
            this.limit += total;
            if (this.lineNumber == 0 && this.lineStart == 0 && this.limit > 0 && buffer[0] == 65279) {
                this.pos++;
                this.lineStart++;
                minimum++;
            }
        } while (this.limit < minimum);
        return true;
    }

    private int getLineNumber() {
        return this.lineNumber + 1;
    }

    private int getColumnNumber() {
        return (this.pos - this.lineStart) + 1;
    }

    private int nextNonWhitespace(boolean throwOnEof) throws IOException {
        char[] buffer = this.buffer;
        int p = this.pos;
        int l = this.limit;
        while (true) {
            if (p == l) {
                this.pos = p;
                if (fillBuffer(1)) {
                    p = this.pos;
                    l = this.limit;
                } else if (throwOnEof) {
                    throw new EOFException("End of input at line " + getLineNumber() + " column " + getColumnNumber());
                } else {
                    return -1;
                }
            }
            int p2 = p + 1;
            char c = buffer[p];
            if (c == '\n') {
                this.lineNumber++;
                this.lineStart = p2;
                p = p2;
            } else if (c == ' ' || c == '\r') {
                p = p2;
            } else if (c == '\t') {
                p = p2;
            } else if (c == '/') {
                this.pos = p2;
                if (p2 == l) {
                    this.pos--;
                    boolean charsLoaded = fillBuffer(2);
                    this.pos++;
                    if (!charsLoaded) {
                        return c;
                    }
                }
                checkLenient();
                char peek = buffer[this.pos];
                switch (peek) {
                    case MotionEventCompat.AXIS_GENERIC_11 /* 42 */:
                        this.pos++;
                        if (!skipTo("*/")) {
                            throw syntaxError("Unterminated comment");
                        }
                        p = this.pos + 2;
                        l = this.limit;
                        continue;
                    case MotionEventCompat.AXIS_GENERIC_16 /* 47 */:
                        this.pos++;
                        skipToEndOfLine();
                        p = this.pos;
                        l = this.limit;
                        continue;
                    default:
                        return c;
                }
            } else if (c == '#') {
                this.pos = p2;
                checkLenient();
                skipToEndOfLine();
                p = this.pos;
                l = this.limit;
            } else {
                this.pos = p2;
                return c;
            }
        }
    }

    private void checkLenient() throws IOException {
        if (!this.lenient) {
            throw syntaxError("Use JsonReader.setLenient(true) to accept malformed JSON");
        }
    }

    private void skipToEndOfLine() throws IOException {
        char c;
        do {
            if (this.pos < this.limit || fillBuffer(1)) {
                char[] cArr = this.buffer;
                int i = this.pos;
                this.pos = i + 1;
                c = cArr[i];
                if (c == '\n') {
                    this.lineNumber++;
                    this.lineStart = this.pos;
                    return;
                }
            } else {
                return;
            }
        } while (c != '\r');
    }

    private boolean skipTo(String toFind) throws IOException {
        while (true) {
            if (this.pos + toFind.length() <= this.limit || fillBuffer(toFind.length())) {
                if (this.buffer[this.pos] == '\n') {
                    this.lineNumber++;
                    this.lineStart = this.pos + 1;
                } else {
                    for (int c = 0; c < toFind.length(); c++) {
                        if (this.buffer[this.pos + c] == toFind.charAt(c)) {
                        }
                    }
                    return true;
                }
                this.pos++;
            } else {
                return false;
            }
        }
    }

    public String toString() {
        return getClass().getSimpleName() + " at line " + getLineNumber() + " column " + getColumnNumber();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    private char readEscapeCharacter() throws IOException {
        int i;
        if (this.pos == this.limit && !fillBuffer(1)) {
            throw syntaxError("Unterminated escape sequence");
        }
        char[] cArr = this.buffer;
        int i2 = this.pos;
        this.pos = i2 + 1;
        char escaped = cArr[i2];
        switch (escaped) {
            case '\n':
                this.lineNumber++;
                this.lineStart = this.pos;
                break;
            case 'b':
                return '\b';
            case HttpStatus.SC_PROCESSING /* 102 */:
                return '\f';
            case 'n':
                return '\n';
            case 'r':
                return '\r';
            case 't':
                return '\t';
            case 'u':
                if (this.pos + 4 > this.limit && !fillBuffer(4)) {
                    throw syntaxError("Unterminated escape sequence");
                }
                char result = 0;
                int i3 = this.pos;
                int end = i3 + 4;
                while (i3 < end) {
                    char c = this.buffer[i3];
                    char result2 = (char) (result << 4);
                    if (c >= '0' && c <= '9') {
                        i = c - '0';
                    } else if (c >= 'a' && c <= 'f') {
                        i = (c - 'a') + 10;
                    } else if (c >= 'A' && c <= 'F') {
                        i = (c - 'A') + 10;
                    } else {
                        throw new NumberFormatException("\\u" + new String(this.buffer, this.pos, 4));
                    }
                    result = (char) (i + result2);
                    i3++;
                }
                this.pos += 4;
                return result;
        }
        return escaped;
    }

    private IOException syntaxError(String message) throws IOException {
        throw new MalformedJsonException(message + " at line " + getLineNumber() + " column " + getColumnNumber());
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

    /* renamed from: com.google.gson.stream.JsonReader$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass1 extends JsonReaderInternalAccess {
        AnonymousClass1() {
        }

        @Override // com.google.gson.internal.JsonReaderInternalAccess
        public void promoteNameToValue(JsonReader reader) throws IOException {
            if (reader instanceof JsonTreeReader) {
                ((JsonTreeReader) reader).promoteNameToValue();
                return;
            }
            int p = JsonReader.access$000(reader);
            if (p == 0) {
                p = JsonReader.access$100(reader);
            }
            if (p == 13) {
                JsonReader.access$002(reader, 9);
            } else if (p == 12) {
                JsonReader.access$002(reader, 8);
            } else if (p == 14) {
                JsonReader.access$002(reader, 10);
            } else {
                throw new IllegalStateException("Expected a name but was " + reader.peek() + "  at line " + JsonReader.access$200(reader) + " column " + JsonReader.access$300(reader));
            }
        }
    }
}
