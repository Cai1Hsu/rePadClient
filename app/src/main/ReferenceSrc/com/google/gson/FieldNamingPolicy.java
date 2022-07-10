package com.google.gson;

import java.lang.reflect.Field;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public abstract class FieldNamingPolicy extends Enum<FieldNamingPolicy> implements FieldNamingStrategy {
    public static final FieldNamingPolicy IDENTITY = new AnonymousClass1("IDENTITY", 0);
    public static final FieldNamingPolicy UPPER_CAMEL_CASE = new AnonymousClass2("UPPER_CAMEL_CASE", 1);
    public static final FieldNamingPolicy UPPER_CAMEL_CASE_WITH_SPACES = new AnonymousClass3("UPPER_CAMEL_CASE_WITH_SPACES", 2);
    public static final FieldNamingPolicy LOWER_CASE_WITH_UNDERSCORES = new AnonymousClass4("LOWER_CASE_WITH_UNDERSCORES", 3);
    public static final FieldNamingPolicy LOWER_CASE_WITH_DASHES = new AnonymousClass5("LOWER_CASE_WITH_DASHES", 4);
    private static final /* synthetic */ FieldNamingPolicy[] $VALUES = {IDENTITY, UPPER_CAMEL_CASE, UPPER_CAMEL_CASE_WITH_SPACES, LOWER_CASE_WITH_UNDERSCORES, LOWER_CASE_WITH_DASHES};

    private FieldNamingPolicy(String str, int i) {
        super(str, i);
    }

    /* synthetic */ FieldNamingPolicy(String x0, int x1, AnonymousClass1 x2) {
        this(x0, x1);
    }

    static /* synthetic */ String access$100(String x0) {
        return upperCaseFirstLetter(x0);
    }

    static /* synthetic */ String access$200(String x0, String x1) {
        return separateCamelCase(x0, x1);
    }

    public static FieldNamingPolicy valueOf(String name) {
        return (FieldNamingPolicy) Enum.valueOf(FieldNamingPolicy.class, name);
    }

    public static FieldNamingPolicy[] values() {
        return (FieldNamingPolicy[]) $VALUES.clone();
    }

    /* renamed from: com.google.gson.FieldNamingPolicy$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass1 extends FieldNamingPolicy {
        AnonymousClass1(String str, int i) {
            super(str, i, null);
        }

        @Override // com.google.gson.FieldNamingStrategy
        public String translateName(Field f) {
            return f.getName();
        }
    }

    /* renamed from: com.google.gson.FieldNamingPolicy$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass2 extends FieldNamingPolicy {
        AnonymousClass2(String str, int i) {
            super(str, i, null);
        }

        @Override // com.google.gson.FieldNamingStrategy
        public String translateName(Field f) {
            return FieldNamingPolicy.access$100(f.getName());
        }
    }

    /* renamed from: com.google.gson.FieldNamingPolicy$3 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass3 extends FieldNamingPolicy {
        AnonymousClass3(String str, int i) {
            super(str, i, null);
        }

        @Override // com.google.gson.FieldNamingStrategy
        public String translateName(Field f) {
            return FieldNamingPolicy.access$100(FieldNamingPolicy.access$200(f.getName(), " "));
        }
    }

    /* renamed from: com.google.gson.FieldNamingPolicy$4 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass4 extends FieldNamingPolicy {
        AnonymousClass4(String str, int i) {
            super(str, i, null);
        }

        @Override // com.google.gson.FieldNamingStrategy
        public String translateName(Field f) {
            return FieldNamingPolicy.access$200(f.getName(), "_").toLowerCase();
        }
    }

    /* renamed from: com.google.gson.FieldNamingPolicy$5 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass5 extends FieldNamingPolicy {
        AnonymousClass5(String str, int i) {
            super(str, i, null);
        }

        @Override // com.google.gson.FieldNamingStrategy
        public String translateName(Field f) {
            return FieldNamingPolicy.access$200(f.getName(), "-").toLowerCase();
        }
    }

    private static String separateCamelCase(String name, String separator) {
        StringBuilder translation = new StringBuilder();
        for (int i = 0; i < name.length(); i++) {
            char character = name.charAt(i);
            if (Character.isUpperCase(character) && translation.length() != 0) {
                translation.append(separator);
            }
            translation.append(character);
        }
        return translation.toString();
    }

    private static String upperCaseFirstLetter(String name) {
        StringBuilder fieldNameBuilder = new StringBuilder();
        int index = 0;
        char firstCharacter = name.charAt(0);
        while (index < name.length() - 1 && !Character.isLetter(firstCharacter)) {
            fieldNameBuilder.append(firstCharacter);
            index++;
            firstCharacter = name.charAt(index);
        }
        if (index == name.length()) {
            return fieldNameBuilder.toString();
        }
        if (!Character.isUpperCase(firstCharacter)) {
            String modifiedTarget = modifyString(Character.toUpperCase(firstCharacter), name, index + 1);
            return fieldNameBuilder.append(modifiedTarget).toString();
        }
        return name;
    }

    private static String modifyString(char firstCharacter, String srcString, int indexOfSubstring) {
        return indexOfSubstring < srcString.length() ? firstCharacter + srcString.substring(indexOfSubstring) : String.valueOf(firstCharacter);
    }
}
