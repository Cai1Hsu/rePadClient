package org.bson;

import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.logging.Logger;
import org.bson.util.ClassMap;

/* loaded from: classes.jar:org/bson/BSON.class */
public class BSON {
    public static final byte ARRAY = 4;
    public static final byte BINARY = 5;
    public static final byte BOOLEAN = 8;
    public static final byte B_BINARY = 2;
    public static final byte B_FUNC = 1;
    public static final byte B_GENERAL = 0;
    public static final byte B_UUID = 3;
    public static final byte CODE = 13;
    public static final byte CODE_W_SCOPE = 15;
    public static final byte DATE = 9;
    public static final byte EOO = 0;
    private static final int GLOBAL_FLAG = 256;
    public static final byte MAXKEY = Byte.MAX_VALUE;
    public static final byte MINKEY = -1;
    public static final byte NULL = 10;
    public static final byte NUMBER = 1;
    public static final byte NUMBER_INT = 16;
    public static final byte NUMBER_LONG = 18;
    public static final byte OBJECT = 3;
    public static final byte OID = 7;
    public static final byte REF = 12;
    public static final byte REGEX = 11;
    public static final byte STRING = 2;
    public static final byte SYMBOL = 14;
    public static final byte TIMESTAMP = 17;
    public static final byte UNDEFINED = 6;
    static final Logger LOGGER = Logger.getLogger("org.bson.BSON");
    private static boolean _encodeHooks = false;
    private static boolean _decodeHooks = false;
    static ClassMap<List<Transformer>> _encodingHooks = new ClassMap<>();
    static ClassMap<List<Transformer>> _decodingHooks = new ClassMap<>();
    @Deprecated
    protected static Charset _utf8 = Charset.forName("UTF-8");
    static ThreadLocal<BSONEncoder> _staticEncoder = new ThreadLocal<BSONEncoder>() { // from class: org.bson.BSON.1
        @Override // java.lang.ThreadLocal
        public BSONEncoder initialValue() {
            return new BasicBSONEncoder();
        }
    };
    static ThreadLocal<BSONDecoder> _staticDecoder = new ThreadLocal<BSONDecoder>() { // from class: org.bson.BSON.2
        @Override // java.lang.ThreadLocal
        public BSONDecoder initialValue() {
            return new BasicBSONDecoder();
        }
    };

    /* loaded from: classes.jar:org/bson/BSON$RegexFlag.class */
    private enum RegexFlag {
        CANON_EQ(128, 'c', "Pattern.CANON_EQ"),
        UNIX_LINES(1, 'd', "Pattern.UNIX_LINES"),
        GLOBAL(256, 'g', null),
        CASE_INSENSITIVE(2, 'i', null),
        MULTILINE(8, 'm', null),
        DOTALL(32, 's', "Pattern.DOTALL"),
        LITERAL(16, 't', "Pattern.LITERAL"),
        UNICODE_CASE(64, 'u', "Pattern.UNICODE_CASE"),
        COMMENTS(4, 'x', null);
        
        private static final Map<Character, RegexFlag> byCharacter = new HashMap();
        public final char flagChar;
        public final int javaFlag;
        public final String unsupported;

        static {
            RegexFlag[] values;
            for (RegexFlag regexFlag : values()) {
                byCharacter.put(Character.valueOf(regexFlag.flagChar), regexFlag);
            }
        }

        RegexFlag(int i, char c, String str) {
            this.javaFlag = i;
            this.flagChar = c;
            this.unsupported = str;
        }

        public static RegexFlag getByCharacter(char c) {
            return byCharacter.get(Character.valueOf(c));
        }
    }

    private static boolean _anyHooks() {
        return _encodeHooks || _decodeHooks;
    }

    private static void _warnUnsupportedRegex(String str) {
        LOGGER.info("flag " + str + " not supported by db.");
    }

    public static void addDecodingHook(Class cls, Transformer transformer) {
        _decodeHooks = true;
        List<Transformer> list = _decodingHooks.get(cls);
        CopyOnWriteArrayList copyOnWriteArrayList = list;
        if (list == null) {
            copyOnWriteArrayList = new CopyOnWriteArrayList();
            _decodingHooks.put(cls, copyOnWriteArrayList);
        }
        copyOnWriteArrayList.add(transformer);
    }

    public static void addEncodingHook(Class cls, Transformer transformer) {
        _encodeHooks = true;
        List<Transformer> list = _encodingHooks.get(cls);
        CopyOnWriteArrayList copyOnWriteArrayList = list;
        if (list == null) {
            copyOnWriteArrayList = new CopyOnWriteArrayList();
            _encodingHooks.put(cls, copyOnWriteArrayList);
        }
        copyOnWriteArrayList.add(transformer);
    }

    public static Object applyDecodingHooks(Object obj) {
        Object obj2 = obj;
        if (_anyHooks()) {
            if (obj == null) {
                obj2 = obj;
            } else {
                List<Transformer> list = _decodingHooks.get(obj.getClass());
                obj2 = obj;
                if (list != null) {
                    Iterator<Transformer> it = list.iterator();
                    while (true) {
                        obj2 = obj;
                        if (!it.hasNext()) {
                            break;
                        }
                        obj = it.next().transform(obj);
                    }
                }
            }
        }
        return obj2;
    }

    public static Object applyEncodingHooks(Object obj) {
        Object obj2;
        if (!_anyHooks()) {
            obj2 = obj;
        } else {
            obj2 = obj;
            if (_encodingHooks.size() != 0) {
                obj2 = obj;
                if (obj != null) {
                    List<Transformer> list = _encodingHooks.get(obj.getClass());
                    obj2 = obj;
                    if (list != null) {
                        Iterator<Transformer> it = list.iterator();
                        while (true) {
                            obj2 = obj;
                            if (!it.hasNext()) {
                                break;
                            }
                            obj = it.next().transform(obj);
                        }
                    }
                }
            }
        }
        return obj2;
    }

    public static void clearAllHooks() {
        clearEncodingHooks();
        clearDecodingHooks();
    }

    public static void clearDecodingHooks() {
        _decodeHooks = false;
        _decodingHooks.clear();
    }

    public static void clearEncodingHooks() {
        _encodeHooks = false;
        _encodingHooks.clear();
    }

    public static BSONObject decode(byte[] bArr) {
        return _staticDecoder.get().readObject(bArr);
    }

    public static byte[] encode(BSONObject bSONObject) {
        BSONEncoder bSONEncoder = _staticEncoder.get();
        try {
            return bSONEncoder.encode(bSONObject);
        } finally {
            bSONEncoder.done();
        }
    }

    public static List<Transformer> getDecodingHooks(Class cls) {
        return _decodingHooks.get(cls);
    }

    public static List<Transformer> getEncodingHooks(Class cls) {
        return _encodingHooks.get(cls);
    }

    public static boolean hasDecodeHooks() {
        return _decodeHooks;
    }

    public static int regexFlag(char c) {
        int i;
        RegexFlag byCharacter = RegexFlag.getByCharacter(c);
        if (byCharacter == null) {
            throw new IllegalArgumentException("unrecognized flag [" + c + "]");
        }
        if (byCharacter.unsupported != null) {
            _warnUnsupportedRegex(byCharacter.unsupported);
            i = 0;
        } else {
            i = byCharacter.javaFlag;
        }
        return i;
    }

    public static int regexFlags(String str) {
        int i = 0;
        if (str == null || str.length() == 0) {
            i = 0;
        } else {
            String lowerCase = str.toLowerCase();
            for (int i2 = 0; i2 < lowerCase.length(); i2++) {
                RegexFlag byCharacter = RegexFlag.getByCharacter(lowerCase.charAt(i2));
                if (byCharacter == null) {
                    throw new IllegalArgumentException("unrecognized flag [" + lowerCase.charAt(i2) + "] " + ((int) lowerCase.charAt(i2)));
                }
                i |= byCharacter.javaFlag;
                if (byCharacter.unsupported != null) {
                    _warnUnsupportedRegex(byCharacter.unsupported);
                }
            }
        }
        return i;
    }

    public static String regexFlags(int i) {
        StringBuilder sb = new StringBuilder();
        RegexFlag[] values = RegexFlag.values();
        int length = values.length;
        int i2 = 0;
        while (i2 < length) {
            RegexFlag regexFlag = values[i2];
            int i3 = i;
            if ((regexFlag.javaFlag & i) > 0) {
                sb.append(regexFlag.flagChar);
                i3 = i - regexFlag.javaFlag;
            }
            i2++;
            i = i3;
        }
        if (i > 0) {
            throw new IllegalArgumentException("some flags could not be recognized.");
        }
        return sb.toString();
    }

    public static void removeDecodingHook(Class cls, Transformer transformer) {
        getDecodingHooks(cls).remove(transformer);
    }

    public static void removeDecodingHooks(Class cls) {
        _decodingHooks.remove(cls);
    }

    public static void removeEncodingHook(Class cls, Transformer transformer) {
        getEncodingHooks(cls).remove(transformer);
    }

    public static void removeEncodingHooks(Class cls) {
        _encodingHooks.remove(cls);
    }

    public static int toInt(Object obj) {
        int i;
        if (obj == null) {
            throw new NullPointerException("can't be null");
        }
        if (obj instanceof Number) {
            i = ((Number) obj).intValue();
        } else if (!(obj instanceof Boolean)) {
            throw new IllegalArgumentException("can't convert: " + obj.getClass().getName() + " to int");
        } else {
            i = ((Boolean) obj).booleanValue() ? 1 : 0;
        }
        return i;
    }
}
