package com.google.zxing.client.result;

/* loaded from: classes.jar:com/google/zxing/client/result/ParsedResult.class */
public abstract class ParsedResult {
    private final ParsedResultType type;

    protected ParsedResult(ParsedResultType parsedResultType) {
        this.type = parsedResultType;
    }

    public static void maybeAppend(String str, StringBuilder sb) {
        if (str == null || str.length() <= 0) {
            return;
        }
        if (sb.length() > 0) {
            sb.append('\n');
        }
        sb.append(str);
    }

    public static void maybeAppend(String[] strArr, StringBuilder sb) {
        if (strArr != null) {
            for (String str : strArr) {
                if (str != null && str.length() > 0) {
                    if (sb.length() > 0) {
                        sb.append('\n');
                    }
                    sb.append(str);
                }
            }
        }
    }

    public abstract String getDisplayResult();

    public ParsedResultType getType() {
        return this.type;
    }

    public String toString() {
        return getDisplayResult();
    }
}
