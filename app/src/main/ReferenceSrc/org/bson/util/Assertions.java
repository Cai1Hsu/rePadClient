package org.bson.util;

@Deprecated
/* loaded from: classes.jar:org/bson/util/Assertions.class */
public class Assertions {

    /* loaded from: classes.jar:org/bson/util/Assertions$NullArgumentException.class */
    static class NullArgumentException extends IllegalArgumentException {
        private static final long serialVersionUID = 6178592463723624585L;

        NullArgumentException(String str) {
            super(str + " should not be null!");
        }
    }

    private Assertions() {
    }

    public static void isTrue(String str, boolean z) throws IllegalArgumentException {
        if (!z) {
            throw new IllegalStateException(str);
        }
    }

    public static void isTrueArgument(String str, boolean z) {
        if (!z) {
            throw new IllegalArgumentException("state should be: " + str);
        }
    }

    public static <T> T notNull(String str, T t) throws IllegalArgumentException {
        if (t == null) {
            throw new NullArgumentException(str);
        }
        return t;
    }
}
