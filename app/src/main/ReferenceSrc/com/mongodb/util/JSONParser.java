package com.mongodb.util;

import android.support.v4.view.MotionEventCompat;
import org.apache.commons.io.IOUtils;
import org.apache.commons.net.tftp.TFTP;
import org.apache.http.HttpStatus;
import org.bson.BSONCallback;

/* compiled from: JSON.java */
/* loaded from: classes.dex */
class JSONParser {
    BSONCallback _callback;
    int pos;
    String s;

    public JSONParser(String s) {
        this(s, null);
    }

    public JSONParser(String s, BSONCallback callback) {
        this.pos = 0;
        this.s = s;
        this._callback = callback == null ? new JSONCallback() : callback;
    }

    public Object parse() {
        return parse(null);
    }

    protected Object parse(String name) {
        char current = get();
        switch (current) {
            case '\"':
            case '\'':
                Object value = parseString(true);
                return value;
            case '+':
            case MotionEventCompat.AXIS_GENERIC_14 /* 45 */:
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                Object value2 = parseNumber();
                return value2;
            case 'N':
                read('N');
                read('a');
                read('N');
                Object value3 = Double.valueOf(Double.NaN);
                return value3;
            case '[':
                Object value4 = parseArray(name);
                return value4;
            case HttpStatus.SC_PROCESSING /* 102 */:
                read('f');
                read('a');
                read('l');
                read('s');
                read('e');
                return false;
            case 'n':
                read('n');
                read('u');
                read('l');
                read('l');
                return null;
            case 't':
                read('t');
                read('r');
                read('u');
                read('e');
                return true;
            case '{':
                Object value5 = parseObject(name);
                return value5;
            default:
                throw new JSONParseException(this.s, this.pos);
        }
    }

    public Object parseObject() {
        return parseObject(null);
    }

    protected Object parseObject(String name) {
        if (name != null) {
            this._callback.objectStart(name);
        } else {
            this._callback.objectStart();
        }
        read('{');
        get();
        while (get() != '}') {
            String key = parseString(false);
            read(':');
            Object value = parse(key);
            doCallback(key, value);
            char current = get();
            if (current != ',') {
                break;
            }
            read(',');
        }
        read('}');
        return this._callback.objectDone();
    }

    protected void doCallback(String name, Object value) {
        if (value == null) {
            this._callback.gotNull(name);
        } else if (value instanceof String) {
            this._callback.gotString(name, (String) value);
        } else if (value instanceof Boolean) {
            this._callback.gotBoolean(name, ((Boolean) value).booleanValue());
        } else if (value instanceof Integer) {
            this._callback.gotInt(name, ((Integer) value).intValue());
        } else if (value instanceof Long) {
            this._callback.gotLong(name, ((Long) value).longValue());
        } else if (value instanceof Double) {
            this._callback.gotDouble(name, ((Double) value).doubleValue());
        }
    }

    public void read(char ch) {
        if (!check(ch)) {
            throw new JSONParseException(this.s, this.pos);
        }
        this.pos++;
    }

    public char read() {
        if (this.pos >= this.s.length()) {
            throw new IllegalStateException("string done");
        }
        String str = this.s;
        int i = this.pos;
        this.pos = i + 1;
        return str.charAt(i);
    }

    public void readHex() {
        if (this.pos < this.s.length() && ((this.s.charAt(this.pos) >= '0' && this.s.charAt(this.pos) <= '9') || ((this.s.charAt(this.pos) >= 'A' && this.s.charAt(this.pos) <= 'F') || (this.s.charAt(this.pos) >= 'a' && this.s.charAt(this.pos) <= 'f')))) {
            this.pos++;
            return;
        }
        throw new JSONParseException(this.s, this.pos);
    }

    public boolean check(char ch) {
        return get() == ch;
    }

    public void skipWS() {
        while (this.pos < this.s.length() && Character.isWhitespace(this.s.charAt(this.pos))) {
            this.pos++;
        }
    }

    public char get() {
        skipWS();
        if (this.pos < this.s.length()) {
            return this.s.charAt(this.pos);
        }
        return (char) 65535;
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x003a  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00d7 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0065 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String parseString(boolean needQuote) {
        char quot = 0;
        if (check('\'')) {
            quot = '\'';
        } else if (check('\"')) {
            quot = '\"';
        } else if (needQuote) {
            throw new JSONParseException(this.s, this.pos);
        }
        if (quot > 0) {
            read(quot);
        }
        StringBuilder buf = new StringBuilder();
        int start = this.pos;
        while (this.pos < this.s.length()) {
            char current = this.s.charAt(this.pos);
            if (quot > 0) {
                if (current == quot) {
                    buf.append(this.s.substring(start, this.pos));
                    if (quot > 0) {
                        read(quot);
                    }
                    return buf.toString();
                }
                if (current != '\\') {
                    this.pos++;
                    char x = get();
                    char special = 0;
                    switch (x) {
                        case '\"':
                            special = '\"';
                            buf.append(this.s.substring(start, this.pos - 1));
                            if (special != 0) {
                                this.pos++;
                                buf.append(special);
                            }
                            start = this.pos;
                            break;
                        case '\\':
                            special = IOUtils.DIR_SEPARATOR_WINDOWS;
                            buf.append(this.s.substring(start, this.pos - 1));
                            if (special != 0) {
                            }
                            start = this.pos;
                            break;
                        case 'b':
                            special = '\b';
                            buf.append(this.s.substring(start, this.pos - 1));
                            if (special != 0) {
                            }
                            start = this.pos;
                            break;
                        case 'n':
                            special = '\n';
                            buf.append(this.s.substring(start, this.pos - 1));
                            if (special != 0) {
                            }
                            start = this.pos;
                            break;
                        case 'r':
                            special = '\r';
                            buf.append(this.s.substring(start, this.pos - 1));
                            if (special != 0) {
                            }
                            start = this.pos;
                            break;
                        case 't':
                            special = '\t';
                            buf.append(this.s.substring(start, this.pos - 1));
                            if (special != 0) {
                            }
                            start = this.pos;
                            break;
                        case 'u':
                            buf.append(this.s.substring(start, this.pos - 1));
                            this.pos++;
                            int tempPos = this.pos;
                            readHex();
                            readHex();
                            readHex();
                            readHex();
                            int codePoint = Integer.parseInt(this.s.substring(tempPos, tempPos + 4), 16);
                            buf.append((char) codePoint);
                            start = this.pos;
                            break;
                        default:
                            buf.append(this.s.substring(start, this.pos - 1));
                            if (special != 0) {
                            }
                            start = this.pos;
                            break;
                    }
                } else {
                    this.pos++;
                }
            } else {
                if (current != ':') {
                    if (current == ' ') {
                    }
                    if (current != '\\') {
                    }
                }
                buf.append(this.s.substring(start, this.pos));
                if (quot > 0) {
                }
                return buf.toString();
            }
        }
        buf.append(this.s.substring(start, this.pos));
        if (quot > 0) {
        }
        return buf.toString();
    }

    public Number parseNumber() {
        get();
        int start = this.pos;
        boolean isDouble = false;
        if (check('-') || check('+')) {
            this.pos++;
        }
        while (this.pos < this.s.length()) {
            switch (this.s.charAt(this.pos)) {
                case MotionEventCompat.AXIS_GENERIC_15 /* 46 */:
                    isDouble = true;
                    parseFraction();
                    break;
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9':
                    this.pos++;
                    break;
                case TFTP.DEFAULT_PORT /* 69 */:
                case HttpStatus.SC_SWITCHING_PROTOCOLS /* 101 */:
                    isDouble = true;
                    parseExponent();
                    break;
            }
        }
        try {
            if (isDouble) {
                return Double.valueOf(this.s.substring(start, this.pos));
            }
            Long val = Long.valueOf(this.s.substring(start, this.pos));
            if (val.longValue() <= 2147483647L && val.longValue() >= -2147483648L) {
                return Integer.valueOf(val.intValue());
            }
            return val;
        } catch (NumberFormatException e) {
            throw new JSONParseException(this.s, start, e);
        }
    }

    public void parseFraction() {
        this.pos++;
        while (this.pos < this.s.length()) {
            switch (this.s.charAt(this.pos)) {
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9':
                    this.pos++;
                    break;
                case TFTP.DEFAULT_PORT /* 69 */:
                case HttpStatus.SC_SWITCHING_PROTOCOLS /* 101 */:
                    parseExponent();
                    break;
                default:
                    return;
            }
        }
    }

    public void parseExponent() {
        this.pos++;
        if (check('-') || check('+')) {
            this.pos++;
        }
        while (this.pos < this.s.length()) {
            switch (this.s.charAt(this.pos)) {
                case '0':
                case '1':
                case '2':
                case '3':
                case '4':
                case '5':
                case '6':
                case '7':
                case '8':
                case '9':
                    this.pos++;
                default:
                    return;
            }
        }
    }

    public Object parseArray() {
        return parseArray(null);
    }

    protected Object parseArray(String name) {
        if (name != null) {
            this._callback.arrayStart(name);
        } else {
            this._callback.arrayStart();
        }
        read('[');
        char current = get();
        int i = 0;
        while (true) {
            if (current == ']') {
                break;
            }
            int i2 = i + 1;
            String elemName = String.valueOf(i);
            Object elem = parse(elemName);
            doCallback(elemName, elem);
            current = get();
            if (current == ',') {
                read(',');
                i = i2;
            } else if (current != ']') {
                throw new JSONParseException(this.s, this.pos);
            }
        }
        read(']');
        return this._callback.arrayDone();
    }
}
