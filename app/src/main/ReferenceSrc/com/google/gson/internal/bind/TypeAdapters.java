package com.google.gson.internal.bind;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonIOException;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSyntaxException;
import com.google.gson.TypeAdapter;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.annotations.SerializedName;
import com.google.gson.internal.LazilyParsedNumber;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.InetAddress;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.sql.Timestamp;
import java.util.BitSet;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class TypeAdapters {
    public static final TypeAdapter<Class> CLASS = new AnonymousClass1();
    public static final TypeAdapterFactory CLASS_FACTORY = newFactory(Class.class, CLASS);
    public static final TypeAdapter<BitSet> BIT_SET = new AnonymousClass2();
    public static final TypeAdapterFactory BIT_SET_FACTORY = newFactory(BitSet.class, BIT_SET);
    public static final TypeAdapter<Boolean> BOOLEAN = new AnonymousClass3();
    public static final TypeAdapter<Boolean> BOOLEAN_AS_STRING = new AnonymousClass4();
    public static final TypeAdapterFactory BOOLEAN_FACTORY = newFactory(Boolean.TYPE, Boolean.class, BOOLEAN);
    public static final TypeAdapter<Number> BYTE = new AnonymousClass5();
    public static final TypeAdapterFactory BYTE_FACTORY = newFactory(Byte.TYPE, Byte.class, BYTE);
    public static final TypeAdapter<Number> SHORT = new AnonymousClass6();
    public static final TypeAdapterFactory SHORT_FACTORY = newFactory(Short.TYPE, Short.class, SHORT);
    public static final TypeAdapter<Number> INTEGER = new AnonymousClass7();
    public static final TypeAdapterFactory INTEGER_FACTORY = newFactory(Integer.TYPE, Integer.class, INTEGER);
    public static final TypeAdapter<Number> LONG = new AnonymousClass8();
    public static final TypeAdapter<Number> FLOAT = new AnonymousClass9();
    public static final TypeAdapter<Number> DOUBLE = new AnonymousClass10();
    public static final TypeAdapter<Number> NUMBER = new AnonymousClass11();
    public static final TypeAdapterFactory NUMBER_FACTORY = newFactory(Number.class, NUMBER);
    public static final TypeAdapter<Character> CHARACTER = new AnonymousClass12();
    public static final TypeAdapterFactory CHARACTER_FACTORY = newFactory(Character.TYPE, Character.class, CHARACTER);
    public static final TypeAdapter<String> STRING = new AnonymousClass13();
    public static final TypeAdapter<BigDecimal> BIG_DECIMAL = new AnonymousClass14();
    public static final TypeAdapter<BigInteger> BIG_INTEGER = new AnonymousClass15();
    public static final TypeAdapterFactory STRING_FACTORY = newFactory(String.class, STRING);
    public static final TypeAdapter<StringBuilder> STRING_BUILDER = new AnonymousClass16();
    public static final TypeAdapterFactory STRING_BUILDER_FACTORY = newFactory(StringBuilder.class, STRING_BUILDER);
    public static final TypeAdapter<StringBuffer> STRING_BUFFER = new AnonymousClass17();
    public static final TypeAdapterFactory STRING_BUFFER_FACTORY = newFactory(StringBuffer.class, STRING_BUFFER);
    public static final TypeAdapter<URL> URL = new AnonymousClass18();
    public static final TypeAdapterFactory URL_FACTORY = newFactory(URL.class, URL);
    public static final TypeAdapter<URI> URI = new AnonymousClass19();
    public static final TypeAdapterFactory URI_FACTORY = newFactory(URI.class, URI);
    public static final TypeAdapter<InetAddress> INET_ADDRESS = new AnonymousClass20();
    public static final TypeAdapterFactory INET_ADDRESS_FACTORY = newTypeHierarchyFactory(InetAddress.class, INET_ADDRESS);
    public static final TypeAdapter<UUID> UUID = new AnonymousClass21();
    public static final TypeAdapterFactory UUID_FACTORY = newFactory(UUID.class, UUID);
    public static final TypeAdapterFactory TIMESTAMP_FACTORY = new AnonymousClass22();
    public static final TypeAdapter<Calendar> CALENDAR = new AnonymousClass23();
    public static final TypeAdapterFactory CALENDAR_FACTORY = newFactoryForMultipleTypes(Calendar.class, GregorianCalendar.class, CALENDAR);
    public static final TypeAdapter<Locale> LOCALE = new AnonymousClass24();
    public static final TypeAdapterFactory LOCALE_FACTORY = newFactory(Locale.class, LOCALE);
    public static final TypeAdapter<JsonElement> JSON_ELEMENT = new AnonymousClass25();
    public static final TypeAdapterFactory JSON_ELEMENT_FACTORY = newTypeHierarchyFactory(JsonElement.class, JSON_ELEMENT);
    public static final TypeAdapterFactory ENUM_FACTORY = newEnumTypeHierarchyFactory();

    private TypeAdapters() {
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass1 extends TypeAdapter<Class> {
        AnonymousClass1() {
        }

        public void write(JsonWriter out, Class value) throws IOException {
            if (value == null) {
                out.nullValue();
                return;
            }
            throw new UnsupportedOperationException("Attempted to serialize java.lang.Class: " + value.getName() + ". Forgot to register a type adapter?");
        }

        @Override // com.google.gson.TypeAdapter
        public Class read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            throw new UnsupportedOperationException("Attempted to deserialize a java.lang.Class. Forgot to register a type adapter?");
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass2 extends TypeAdapter<BitSet> {
        AnonymousClass2() {
        }

        @Override // com.google.gson.TypeAdapter
        public BitSet read(JsonReader in) throws IOException {
            boolean set;
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            BitSet bitset = new BitSet();
            in.beginArray();
            int i = 0;
            JsonToken tokenType = in.peek();
            while (tokenType != JsonToken.END_ARRAY) {
                switch (AnonymousClass32.$SwitchMap$com$google$gson$stream$JsonToken[tokenType.ordinal()]) {
                    case 1:
                        if (in.nextInt() == 0) {
                            set = false;
                            break;
                        } else {
                            set = true;
                            break;
                        }
                    case 2:
                        set = in.nextBoolean();
                        break;
                    case 3:
                        String stringValue = in.nextString();
                        try {
                            if (Integer.parseInt(stringValue) == 0) {
                                set = false;
                                break;
                            } else {
                                set = true;
                                break;
                            }
                        } catch (NumberFormatException e) {
                            throw new JsonSyntaxException("Error: Expecting: bitset number value (1, 0), Found: " + stringValue);
                        }
                    default:
                        throw new JsonSyntaxException("Invalid bitset value type: " + tokenType);
                }
                if (set) {
                    bitset.set(i);
                }
                i++;
                tokenType = in.peek();
            }
            in.endArray();
            return bitset;
        }

        public void write(JsonWriter out, BitSet src) throws IOException {
            if (src == null) {
                out.nullValue();
                return;
            }
            out.beginArray();
            for (int i = 0; i < src.length(); i++) {
                int value = src.get(i) ? 1 : 0;
                out.value(value);
            }
            out.endArray();
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$32 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static /* synthetic */ class AnonymousClass32 {
        static final /* synthetic */ int[] $SwitchMap$com$google$gson$stream$JsonToken = new int[JsonToken.values().length];

        static {
            try {
                $SwitchMap$com$google$gson$stream$JsonToken[JsonToken.NUMBER.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$google$gson$stream$JsonToken[JsonToken.BOOLEAN.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$google$gson$stream$JsonToken[JsonToken.STRING.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$google$gson$stream$JsonToken[JsonToken.NULL.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$google$gson$stream$JsonToken[JsonToken.BEGIN_ARRAY.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$google$gson$stream$JsonToken[JsonToken.BEGIN_OBJECT.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$google$gson$stream$JsonToken[JsonToken.END_DOCUMENT.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$com$google$gson$stream$JsonToken[JsonToken.NAME.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$com$google$gson$stream$JsonToken[JsonToken.END_OBJECT.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
            try {
                $SwitchMap$com$google$gson$stream$JsonToken[JsonToken.END_ARRAY.ordinal()] = 10;
            } catch (NoSuchFieldError e10) {
            }
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$3 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass3 extends TypeAdapter<Boolean> {
        AnonymousClass3() {
        }

        @Override // com.google.gson.TypeAdapter
        public Boolean read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            } else if (in.peek() == JsonToken.STRING) {
                return Boolean.valueOf(Boolean.parseBoolean(in.nextString()));
            } else {
                return Boolean.valueOf(in.nextBoolean());
            }
        }

        public void write(JsonWriter out, Boolean value) throws IOException {
            if (value == null) {
                out.nullValue();
            } else {
                out.value(value.booleanValue());
            }
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$4 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass4 extends TypeAdapter<Boolean> {
        AnonymousClass4() {
        }

        @Override // com.google.gson.TypeAdapter
        public Boolean read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            return Boolean.valueOf(in.nextString());
        }

        public void write(JsonWriter out, Boolean value) throws IOException {
            out.value(value == null ? "null" : value.toString());
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$5 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass5 extends TypeAdapter<Number> {
        AnonymousClass5() {
        }

        @Override // com.google.gson.TypeAdapter
        public Number read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            try {
                int intValue = in.nextInt();
                return Byte.valueOf((byte) intValue);
            } catch (NumberFormatException e) {
                throw new JsonSyntaxException(e);
            }
        }

        public void write(JsonWriter out, Number value) throws IOException {
            out.value(value);
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$6 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass6 extends TypeAdapter<Number> {
        AnonymousClass6() {
        }

        @Override // com.google.gson.TypeAdapter
        public Number read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            try {
                return Short.valueOf((short) in.nextInt());
            } catch (NumberFormatException e) {
                throw new JsonSyntaxException(e);
            }
        }

        public void write(JsonWriter out, Number value) throws IOException {
            out.value(value);
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$7 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass7 extends TypeAdapter<Number> {
        AnonymousClass7() {
        }

        @Override // com.google.gson.TypeAdapter
        public Number read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            try {
                return Integer.valueOf(in.nextInt());
            } catch (NumberFormatException e) {
                throw new JsonSyntaxException(e);
            }
        }

        public void write(JsonWriter out, Number value) throws IOException {
            out.value(value);
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$8 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass8 extends TypeAdapter<Number> {
        AnonymousClass8() {
        }

        @Override // com.google.gson.TypeAdapter
        public Number read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            try {
                return Long.valueOf(in.nextLong());
            } catch (NumberFormatException e) {
                throw new JsonSyntaxException(e);
            }
        }

        public void write(JsonWriter out, Number value) throws IOException {
            out.value(value);
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$9 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass9 extends TypeAdapter<Number> {
        AnonymousClass9() {
        }

        @Override // com.google.gson.TypeAdapter
        public Number read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            return Float.valueOf((float) in.nextDouble());
        }

        public void write(JsonWriter out, Number value) throws IOException {
            out.value(value);
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$10 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass10 extends TypeAdapter<Number> {
        AnonymousClass10() {
        }

        @Override // com.google.gson.TypeAdapter
        public Number read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            return Double.valueOf(in.nextDouble());
        }

        public void write(JsonWriter out, Number value) throws IOException {
            out.value(value);
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$11 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass11 extends TypeAdapter<Number> {
        AnonymousClass11() {
        }

        @Override // com.google.gson.TypeAdapter
        public Number read(JsonReader in) throws IOException {
            JsonToken jsonToken = in.peek();
            switch (AnonymousClass32.$SwitchMap$com$google$gson$stream$JsonToken[jsonToken.ordinal()]) {
                case 1:
                    return new LazilyParsedNumber(in.nextString());
                case 2:
                case 3:
                default:
                    throw new JsonSyntaxException("Expecting number, got: " + jsonToken);
                case 4:
                    in.nextNull();
                    return null;
            }
        }

        public void write(JsonWriter out, Number value) throws IOException {
            out.value(value);
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$12 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass12 extends TypeAdapter<Character> {
        AnonymousClass12() {
        }

        @Override // com.google.gson.TypeAdapter
        public Character read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            String str = in.nextString();
            if (str.length() != 1) {
                throw new JsonSyntaxException("Expecting character, got: " + str);
            }
            return Character.valueOf(str.charAt(0));
        }

        public void write(JsonWriter out, Character value) throws IOException {
            out.value(value == null ? null : String.valueOf(value));
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$13 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass13 extends TypeAdapter<String> {
        AnonymousClass13() {
        }

        @Override // com.google.gson.TypeAdapter
        public String read(JsonReader in) throws IOException {
            JsonToken peek = in.peek();
            if (peek == JsonToken.NULL) {
                in.nextNull();
                return null;
            } else if (peek == JsonToken.BOOLEAN) {
                return Boolean.toString(in.nextBoolean());
            } else {
                return in.nextString();
            }
        }

        public void write(JsonWriter out, String value) throws IOException {
            out.value(value);
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$14 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass14 extends TypeAdapter<BigDecimal> {
        AnonymousClass14() {
        }

        @Override // com.google.gson.TypeAdapter
        public BigDecimal read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            try {
                return new BigDecimal(in.nextString());
            } catch (NumberFormatException e) {
                throw new JsonSyntaxException(e);
            }
        }

        public void write(JsonWriter out, BigDecimal value) throws IOException {
            out.value(value);
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$15 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass15 extends TypeAdapter<BigInteger> {
        AnonymousClass15() {
        }

        @Override // com.google.gson.TypeAdapter
        public BigInteger read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            try {
                return new BigInteger(in.nextString());
            } catch (NumberFormatException e) {
                throw new JsonSyntaxException(e);
            }
        }

        public void write(JsonWriter out, BigInteger value) throws IOException {
            out.value(value);
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$16 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass16 extends TypeAdapter<StringBuilder> {
        AnonymousClass16() {
        }

        @Override // com.google.gson.TypeAdapter
        public StringBuilder read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            return new StringBuilder(in.nextString());
        }

        public void write(JsonWriter out, StringBuilder value) throws IOException {
            out.value(value == null ? null : value.toString());
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$17 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass17 extends TypeAdapter<StringBuffer> {
        AnonymousClass17() {
        }

        @Override // com.google.gson.TypeAdapter
        public StringBuffer read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            return new StringBuffer(in.nextString());
        }

        public void write(JsonWriter out, StringBuffer value) throws IOException {
            out.value(value == null ? null : value.toString());
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$18 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass18 extends TypeAdapter<URL> {
        AnonymousClass18() {
        }

        @Override // com.google.gson.TypeAdapter
        public URL read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            String nextString = in.nextString();
            if ("null".equals(nextString)) {
                return null;
            }
            return new URL(nextString);
        }

        public void write(JsonWriter out, URL value) throws IOException {
            out.value(value == null ? null : value.toExternalForm());
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$19 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass19 extends TypeAdapter<URI> {
        AnonymousClass19() {
        }

        @Override // com.google.gson.TypeAdapter
        public URI read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            try {
                String nextString = in.nextString();
                if ("null".equals(nextString)) {
                    return null;
                }
                return new URI(nextString);
            } catch (URISyntaxException e) {
                throw new JsonIOException(e);
            }
        }

        public void write(JsonWriter out, URI value) throws IOException {
            out.value(value == null ? null : value.toASCIIString());
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$20 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass20 extends TypeAdapter<InetAddress> {
        AnonymousClass20() {
        }

        @Override // com.google.gson.TypeAdapter
        public InetAddress read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            return InetAddress.getByName(in.nextString());
        }

        public void write(JsonWriter out, InetAddress value) throws IOException {
            out.value(value == null ? null : value.getHostAddress());
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$21 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass21 extends TypeAdapter<UUID> {
        AnonymousClass21() {
        }

        @Override // com.google.gson.TypeAdapter
        public UUID read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            return UUID.fromString(in.nextString());
        }

        public void write(JsonWriter out, UUID value) throws IOException {
            out.value(value == null ? null : value.toString());
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$22 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass22 implements TypeAdapterFactory {
        AnonymousClass22() {
        }

        @Override // com.google.gson.TypeAdapterFactory
        public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
            if (typeToken.getRawType() != Timestamp.class) {
                return null;
            }
            TypeAdapter<Date> dateTypeAdapter = gson.getAdapter(Date.class);
            return new AnonymousClass1(dateTypeAdapter);
        }

        /* renamed from: com.google.gson.internal.bind.TypeAdapters$22$1 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass1 extends TypeAdapter<Timestamp> {
            final /* synthetic */ TypeAdapter val$dateTypeAdapter;

            AnonymousClass1(TypeAdapter typeAdapter) {
                AnonymousClass22.this = r1;
                this.val$dateTypeAdapter = typeAdapter;
            }

            @Override // com.google.gson.TypeAdapter
            public Timestamp read(JsonReader in) throws IOException {
                Date date = (Date) this.val$dateTypeAdapter.read(in);
                if (date != null) {
                    return new Timestamp(date.getTime());
                }
                return null;
            }

            public void write(JsonWriter out, Timestamp value) throws IOException {
                this.val$dateTypeAdapter.write(out, value);
            }
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$23 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass23 extends TypeAdapter<Calendar> {
        private static final String DAY_OF_MONTH = "dayOfMonth";
        private static final String HOUR_OF_DAY = "hourOfDay";
        private static final String MINUTE = "minute";
        private static final String MONTH = "month";
        private static final String SECOND = "second";
        private static final String YEAR = "year";

        AnonymousClass23() {
        }

        @Override // com.google.gson.TypeAdapter
        public Calendar read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            in.beginObject();
            int year = 0;
            int month = 0;
            int dayOfMonth = 0;
            int hourOfDay = 0;
            int minute = 0;
            int second = 0;
            while (in.peek() != JsonToken.END_OBJECT) {
                String name = in.nextName();
                int value = in.nextInt();
                if (YEAR.equals(name)) {
                    year = value;
                } else if (MONTH.equals(name)) {
                    month = value;
                } else if (DAY_OF_MONTH.equals(name)) {
                    dayOfMonth = value;
                } else if (HOUR_OF_DAY.equals(name)) {
                    hourOfDay = value;
                } else if ("minute".equals(name)) {
                    minute = value;
                } else if ("second".equals(name)) {
                    second = value;
                }
            }
            in.endObject();
            return new GregorianCalendar(year, month, dayOfMonth, hourOfDay, minute, second);
        }

        public void write(JsonWriter out, Calendar value) throws IOException {
            if (value == null) {
                out.nullValue();
                return;
            }
            out.beginObject();
            out.name(YEAR);
            out.value(value.get(1));
            out.name(MONTH);
            out.value(value.get(2));
            out.name(DAY_OF_MONTH);
            out.value(value.get(5));
            out.name(HOUR_OF_DAY);
            out.value(value.get(11));
            out.name("minute");
            out.value(value.get(12));
            out.name("second");
            out.value(value.get(13));
            out.endObject();
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$24 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass24 extends TypeAdapter<Locale> {
        AnonymousClass24() {
        }

        @Override // com.google.gson.TypeAdapter
        public Locale read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            String locale = in.nextString();
            StringTokenizer tokenizer = new StringTokenizer(locale, "_");
            String language = null;
            String country = null;
            String variant = null;
            if (tokenizer.hasMoreElements()) {
                language = tokenizer.nextToken();
            }
            if (tokenizer.hasMoreElements()) {
                country = tokenizer.nextToken();
            }
            if (tokenizer.hasMoreElements()) {
                variant = tokenizer.nextToken();
            }
            if (country == null && variant == null) {
                return new Locale(language);
            }
            if (variant == null) {
                return new Locale(language, country);
            }
            return new Locale(language, country, variant);
        }

        public void write(JsonWriter out, Locale value) throws IOException {
            out.value(value == null ? null : value.toString());
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$25 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass25 extends TypeAdapter<JsonElement> {
        AnonymousClass25() {
        }

        @Override // com.google.gson.TypeAdapter
        public JsonElement read(JsonReader in) throws IOException {
            switch (AnonymousClass32.$SwitchMap$com$google$gson$stream$JsonToken[in.peek().ordinal()]) {
                case 1:
                    String number = in.nextString();
                    return new JsonPrimitive((Number) new LazilyParsedNumber(number));
                case 2:
                    return new JsonPrimitive(Boolean.valueOf(in.nextBoolean()));
                case 3:
                    return new JsonPrimitive(in.nextString());
                case 4:
                    in.nextNull();
                    return JsonNull.INSTANCE;
                case 5:
                    JsonArray array = new JsonArray();
                    in.beginArray();
                    while (in.hasNext()) {
                        array.add(read(in));
                    }
                    in.endArray();
                    return array;
                case 6:
                    JsonObject object = new JsonObject();
                    in.beginObject();
                    while (in.hasNext()) {
                        object.add(in.nextName(), read(in));
                    }
                    in.endObject();
                    return object;
                default:
                    throw new IllegalArgumentException();
            }
        }

        public void write(JsonWriter out, JsonElement value) throws IOException {
            if (value == null || value.isJsonNull()) {
                out.nullValue();
            } else if (value.isJsonPrimitive()) {
                JsonPrimitive primitive = value.getAsJsonPrimitive();
                if (primitive.isNumber()) {
                    out.value(primitive.getAsNumber());
                } else if (primitive.isBoolean()) {
                    out.value(primitive.getAsBoolean());
                } else {
                    out.value(primitive.getAsString());
                }
            } else if (value.isJsonArray()) {
                out.beginArray();
                Iterator i$ = value.getAsJsonArray().iterator();
                while (i$.hasNext()) {
                    write(out, i$.next());
                }
                out.endArray();
            } else if (value.isJsonObject()) {
                out.beginObject();
                for (Map.Entry<String, JsonElement> e : value.getAsJsonObject().entrySet()) {
                    out.name(e.getKey());
                    write(out, e.getValue());
                }
                out.endObject();
            } else {
                throw new IllegalArgumentException("Couldn't write " + value.getClass());
            }
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    private static final class EnumTypeAdapter<T extends Enum<T>> extends TypeAdapter<T> {
        private final Map<String, T> nameToConstant = new HashMap();
        private final Map<T, String> constantToName = new HashMap();

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.google.gson.TypeAdapter
        public /* bridge */ /* synthetic */ void write(JsonWriter x0, Object x1) throws IOException {
            write(x0, (JsonWriter) ((Enum) x1));
        }

        public EnumTypeAdapter(Class<T> classOfT) {
            T[] enumConstants;
            try {
                for (T constant : classOfT.getEnumConstants()) {
                    String name = constant.name();
                    SerializedName annotation = (SerializedName) classOfT.getField(name).getAnnotation(SerializedName.class);
                    name = annotation != null ? annotation.value() : name;
                    this.nameToConstant.put(name, constant);
                    this.constantToName.put(constant, name);
                }
            } catch (NoSuchFieldException e) {
                throw new AssertionError();
            }
        }

        @Override // com.google.gson.TypeAdapter
        public T read(JsonReader in) throws IOException {
            if (in.peek() == JsonToken.NULL) {
                in.nextNull();
                return null;
            }
            return this.nameToConstant.get(in.nextString());
        }

        public void write(JsonWriter out, T value) throws IOException {
            out.value(value == null ? null : this.constantToName.get(value));
        }
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$26 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass26 implements TypeAdapterFactory {
        AnonymousClass26() {
        }

        @Override // com.google.gson.TypeAdapterFactory
        public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
            Class rawType = typeToken.getRawType();
            if (!Enum.class.isAssignableFrom(rawType) || rawType == Enum.class) {
                return null;
            }
            if (!rawType.isEnum()) {
                Class<? super T> rawType2 = rawType.getSuperclass();
                rawType = (Class<? super Object>) rawType2;
            }
            return new EnumTypeAdapter(rawType);
        }
    }

    public static TypeAdapterFactory newEnumTypeHierarchyFactory() {
        return new AnonymousClass26();
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$27 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass27 implements TypeAdapterFactory {
        final /* synthetic */ TypeToken val$type;
        final /* synthetic */ TypeAdapter val$typeAdapter;

        AnonymousClass27(TypeToken typeToken, TypeAdapter typeAdapter) {
            this.val$type = typeToken;
            this.val$typeAdapter = typeAdapter;
        }

        @Override // com.google.gson.TypeAdapterFactory
        public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
            if (typeToken.equals(this.val$type)) {
                return this.val$typeAdapter;
            }
            return null;
        }
    }

    public static <TT> TypeAdapterFactory newFactory(TypeToken<TT> type, TypeAdapter<TT> typeAdapter) {
        return new AnonymousClass27(type, typeAdapter);
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$28 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass28 implements TypeAdapterFactory {
        final /* synthetic */ Class val$type;
        final /* synthetic */ TypeAdapter val$typeAdapter;

        AnonymousClass28(Class cls, TypeAdapter typeAdapter) {
            this.val$type = cls;
            this.val$typeAdapter = typeAdapter;
        }

        @Override // com.google.gson.TypeAdapterFactory
        public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
            if (typeToken.getRawType() == this.val$type) {
                return this.val$typeAdapter;
            }
            return null;
        }

        public String toString() {
            return "Factory[type=" + this.val$type.getName() + ",adapter=" + this.val$typeAdapter + "]";
        }
    }

    public static <TT> TypeAdapterFactory newFactory(Class<TT> type, TypeAdapter<TT> typeAdapter) {
        return new AnonymousClass28(type, typeAdapter);
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$29 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass29 implements TypeAdapterFactory {
        final /* synthetic */ Class val$boxed;
        final /* synthetic */ TypeAdapter val$typeAdapter;
        final /* synthetic */ Class val$unboxed;

        AnonymousClass29(Class cls, Class cls2, TypeAdapter typeAdapter) {
            this.val$unboxed = cls;
            this.val$boxed = cls2;
            this.val$typeAdapter = typeAdapter;
        }

        @Override // com.google.gson.TypeAdapterFactory
        public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
            Class<? super T> rawType = typeToken.getRawType();
            if (rawType == this.val$unboxed || rawType == this.val$boxed) {
                return this.val$typeAdapter;
            }
            return null;
        }

        public String toString() {
            return "Factory[type=" + this.val$boxed.getName() + "+" + this.val$unboxed.getName() + ",adapter=" + this.val$typeAdapter + "]";
        }
    }

    public static <TT> TypeAdapterFactory newFactory(Class<TT> unboxed, Class<TT> boxed, TypeAdapter<? super TT> typeAdapter) {
        return new AnonymousClass29(unboxed, boxed, typeAdapter);
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$30 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass30 implements TypeAdapterFactory {
        final /* synthetic */ Class val$base;
        final /* synthetic */ Class val$sub;
        final /* synthetic */ TypeAdapter val$typeAdapter;

        AnonymousClass30(Class cls, Class cls2, TypeAdapter typeAdapter) {
            this.val$base = cls;
            this.val$sub = cls2;
            this.val$typeAdapter = typeAdapter;
        }

        @Override // com.google.gson.TypeAdapterFactory
        public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
            Class<? super T> rawType = typeToken.getRawType();
            if (rawType == this.val$base || rawType == this.val$sub) {
                return this.val$typeAdapter;
            }
            return null;
        }

        public String toString() {
            return "Factory[type=" + this.val$base.getName() + "+" + this.val$sub.getName() + ",adapter=" + this.val$typeAdapter + "]";
        }
    }

    public static <TT> TypeAdapterFactory newFactoryForMultipleTypes(Class<TT> base, Class<? extends TT> sub, TypeAdapter<? super TT> typeAdapter) {
        return new AnonymousClass30(base, sub, typeAdapter);
    }

    /* renamed from: com.google.gson.internal.bind.TypeAdapters$31 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass31 implements TypeAdapterFactory {
        final /* synthetic */ Class val$clazz;
        final /* synthetic */ TypeAdapter val$typeAdapter;

        AnonymousClass31(Class cls, TypeAdapter typeAdapter) {
            this.val$clazz = cls;
            this.val$typeAdapter = typeAdapter;
        }

        @Override // com.google.gson.TypeAdapterFactory
        public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
            if (this.val$clazz.isAssignableFrom(typeToken.getRawType())) {
                return this.val$typeAdapter;
            }
            return null;
        }

        public String toString() {
            return "Factory[typeHierarchy=" + this.val$clazz.getName() + ",adapter=" + this.val$typeAdapter + "]";
        }
    }

    public static <TT> TypeAdapterFactory newTypeHierarchyFactory(Class<TT> clazz, TypeAdapter<TT> typeAdapter) {
        return new AnonymousClass31(clazz, typeAdapter);
    }
}
