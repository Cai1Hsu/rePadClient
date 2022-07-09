package org.apache.commons.io;

import java.io.Serializable;

/* loaded from: classes.jar:org/apache/commons/io/IOCase.class */
public final class IOCase implements Serializable {
    public static final IOCase SYSTEM;
    private static final long serialVersionUID = -6343169151696340687L;
    private final String name;
    private final transient boolean sensitive;
    public static final IOCase SENSITIVE = new IOCase("Sensitive", true);
    public static final IOCase INSENSITIVE = new IOCase("Insensitive", false);

    static {
        boolean z = true;
        if (FilenameUtils.isSystemWindows()) {
            z = false;
        }
        SYSTEM = new IOCase("System", z);
    }

    private IOCase(String str, boolean z) {
        this.name = str;
        this.sensitive = z;
    }

    public static IOCase forName(String str) {
        IOCase iOCase;
        if (SENSITIVE.name.equals(str)) {
            iOCase = SENSITIVE;
        } else if (INSENSITIVE.name.equals(str)) {
            iOCase = INSENSITIVE;
        } else if (!SYSTEM.name.equals(str)) {
            throw new IllegalArgumentException("Invalid IOCase name: " + str);
        } else {
            iOCase = SYSTEM;
        }
        return iOCase;
    }

    private Object readResolve() {
        return forName(this.name);
    }

    public int checkCompareTo(String str, String str2) {
        if (str == null || str2 == null) {
            throw new NullPointerException("The strings must not be null");
        }
        return this.sensitive ? str.compareTo(str2) : str.compareToIgnoreCase(str2);
    }

    public boolean checkEndsWith(String str, String str2) {
        int length = str2.length();
        return str.regionMatches(!this.sensitive, str.length() - length, str2, 0, length);
    }

    public boolean checkEquals(String str, String str2) {
        if (str == null || str2 == null) {
            throw new NullPointerException("The strings must not be null");
        }
        return this.sensitive ? str.equals(str2) : str.equalsIgnoreCase(str2);
    }

    public int checkIndexOf(String str, int i, String str2) {
        int length = str.length() - str2.length();
        if (length >= i) {
            while (i <= length) {
                if (checkRegionMatches(str, i, str2)) {
                    break;
                }
                i++;
            }
        }
        i = -1;
        return i;
    }

    public boolean checkRegionMatches(String str, int i, String str2) {
        return str.regionMatches(!this.sensitive, i, str2, 0, str2.length());
    }

    public boolean checkStartsWith(String str, String str2) {
        return str.regionMatches(!this.sensitive, 0, str2, 0, str2.length());
    }

    public String getName() {
        return this.name;
    }

    public boolean isCaseSensitive() {
        return this.sensitive;
    }

    public String toString() {
        return this.name;
    }
}
