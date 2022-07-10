package com.google.zxing.client.result;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public abstract class ParsedResult {
    private final ParsedResultType type;

    public abstract String getDisplayResult();

    public ParsedResult(ParsedResultType type) {
        this.type = type;
    }

    public ParsedResultType getType() {
        return this.type;
    }

    public String toString() {
        return getDisplayResult();
    }

    public static void maybeAppend(String value, StringBuilder result) {
        if (value != null && value.length() > 0) {
            if (result.length() > 0) {
                result.append('\n');
            }
            result.append(value);
        }
    }

    public static void maybeAppend(String[] value, StringBuilder result) {
        if (value != null) {
            for (String s : value) {
                if (s != null && s.length() > 0) {
                    if (result.length() > 0) {
                        result.append('\n');
                    }
                    result.append(s);
                }
            }
        }
    }
}
