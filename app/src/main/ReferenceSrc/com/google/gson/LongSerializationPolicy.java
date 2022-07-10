package com.google.gson;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public abstract class LongSerializationPolicy extends Enum<LongSerializationPolicy> {
    public static final LongSerializationPolicy DEFAULT = new AnonymousClass1("DEFAULT", 0);
    public static final LongSerializationPolicy STRING = new AnonymousClass2("STRING", 1);
    private static final /* synthetic */ LongSerializationPolicy[] $VALUES = {DEFAULT, STRING};

    public abstract JsonElement serialize(Long l);

    private LongSerializationPolicy(String str, int i) {
        super(str, i);
    }

    /* synthetic */ LongSerializationPolicy(String x0, int x1, AnonymousClass1 x2) {
        this(x0, x1);
    }

    public static LongSerializationPolicy valueOf(String name) {
        return (LongSerializationPolicy) Enum.valueOf(LongSerializationPolicy.class, name);
    }

    public static LongSerializationPolicy[] values() {
        return (LongSerializationPolicy[]) $VALUES.clone();
    }

    /* renamed from: com.google.gson.LongSerializationPolicy$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass1 extends LongSerializationPolicy {
        AnonymousClass1(String str, int i) {
            super(str, i, null);
        }

        @Override // com.google.gson.LongSerializationPolicy
        public JsonElement serialize(Long value) {
            return new JsonPrimitive((Number) value);
        }
    }

    /* renamed from: com.google.gson.LongSerializationPolicy$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    static class AnonymousClass2 extends LongSerializationPolicy {
        AnonymousClass2(String str, int i) {
            super(str, i, null);
        }

        @Override // com.google.gson.LongSerializationPolicy
        public JsonElement serialize(Long value) {
            return new JsonPrimitive(String.valueOf(value));
        }
    }
}
