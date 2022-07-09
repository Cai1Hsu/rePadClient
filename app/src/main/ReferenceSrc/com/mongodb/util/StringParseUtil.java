package com.mongodb.util;

import org.apache.http.HttpStatus;

@Deprecated
/* loaded from: classes.dex */
public final class StringParseUtil {
    public static boolean parseBoolean(String s, boolean d) {
        if (s != null) {
            String s2 = s.trim();
            if (s2.length() != 0) {
                char c = s2.charAt(0);
                if (c == 't' || c == 'T' || c == 'y' || c == 'Y') {
                    return true;
                }
                if (c != 'f' && c != 'F' && c != 'n' && c != 'N') {
                    return d;
                }
                return false;
            }
            return d;
        }
        return d;
    }

    public static int parseInt(String s, int def) {
        return parseInt(s, def, null, true);
    }

    public static Number parseIntRadix(String s, int radix) {
        if (s == null) {
            return Double.valueOf(Double.NaN);
        }
        String s2 = s.trim();
        if (s2.length() == 0) {
            return Double.valueOf(Double.NaN);
        }
        int i = 0;
        if (s2.charAt(0) == '-') {
            i = 1;
        }
        while (i < s2.length() && Character.digit(s2.charAt(i), radix) != -1) {
            i++;
        }
        try {
            return Long.valueOf(s2.substring(0, i), radix);
        } catch (Exception e) {
            return Double.valueOf(Double.NaN);
        }
    }

    public static int parseInt(String s, int def, int[] lastIdx, boolean allowNegative) {
        boolean useLastIdx = lastIdx != null && lastIdx.length > 0;
        if (useLastIdx) {
            lastIdx[0] = -1;
        }
        if (s != null) {
            String s2 = s.trim();
            if (s2.length() != 0) {
                int firstDigit = -1;
                int i = 0;
                while (true) {
                    if (i >= s2.length()) {
                        break;
                    } else if (!Character.isDigit(s2.charAt(i))) {
                        i++;
                    } else {
                        firstDigit = i;
                        break;
                    }
                }
                if (firstDigit >= 0) {
                    int lastDigit = firstDigit + 1;
                    while (lastDigit < s2.length() && Character.isDigit(s2.charAt(lastDigit))) {
                        lastDigit++;
                    }
                    if (allowNegative && firstDigit > 0 && s2.charAt(firstDigit - 1) == '-') {
                        firstDigit--;
                    }
                    if (useLastIdx) {
                        lastIdx[0] = lastDigit;
                    }
                    return Integer.parseInt(s2.substring(firstDigit, lastDigit));
                }
                return def;
            }
            return def;
        }
        return def;
    }

    public static Number parseNumber(String s, Number def) {
        if (s != null) {
            String s2 = s.trim();
            if (s2.length() != 0) {
                int firstDigit = -1;
                int i = 0;
                while (true) {
                    if (i >= s2.length()) {
                        break;
                    } else if (!Character.isDigit(s2.charAt(i))) {
                        i++;
                    } else {
                        firstDigit = i;
                        break;
                    }
                }
                if (firstDigit >= 0) {
                    int lastDigit = firstDigit + 1;
                    while (lastDigit < s2.length() && Character.isDigit(s2.charAt(lastDigit))) {
                        lastDigit++;
                    }
                    boolean isDouble = false;
                    if (firstDigit > 0 && s2.charAt(firstDigit - 1) == '.') {
                        firstDigit--;
                        isDouble = true;
                    }
                    if (firstDigit > 0 && s2.charAt(firstDigit - 1) == '-') {
                        firstDigit--;
                    }
                    if (lastDigit < s2.length() && s2.charAt(lastDigit) == '.') {
                        while (true) {
                            lastDigit++;
                            if (lastDigit >= s2.length() || !Character.isDigit(s2.charAt(lastDigit))) {
                                break;
                            }
                        }
                        isDouble = true;
                    }
                    if (lastDigit < s2.length() && s2.charAt(lastDigit) == 'E') {
                        while (true) {
                            lastDigit++;
                            if (lastDigit >= s2.length() || !Character.isDigit(s2.charAt(lastDigit))) {
                                break;
                            }
                        }
                        isDouble = true;
                    }
                    String actual = s2.substring(firstDigit, lastDigit);
                    if (isDouble || actual.length() > 17) {
                        return Double.valueOf(actual);
                    }
                    if (actual.length() > 10) {
                        return Long.valueOf(actual);
                    }
                    return Integer.valueOf(actual);
                }
                return def;
            }
            return def;
        }
        return def;
    }

    public static Number parseStrict(String s) {
        int coef = -1;
        if (s.length() == 0) {
            return 0;
        }
        if (s.charAt(0) == '+') {
            s = s.substring(1);
        }
        if (s.matches("(\\+|-)?Infinity")) {
            if (s.startsWith("-")) {
                return Double.valueOf(Double.NEGATIVE_INFINITY);
            }
            return Double.valueOf(Double.POSITIVE_INFINITY);
        } else if (s.indexOf(46) != -1 || s.equals("-0")) {
            return Double.valueOf(s);
        } else {
            if (s.toLowerCase().indexOf("0x") > -1) {
                if (s.charAt(0) != '-') {
                    coef = 1;
                }
                if (s.length() > 17) {
                    throw new RuntimeException("Can't handle a number this big: " + s);
                }
                if (s.length() > 9) {
                    return Long.valueOf(coef * Long.valueOf(s.substring((int) ((coef * (-0.5d)) + 2.5d)), 16).longValue());
                }
                return Integer.valueOf(Integer.valueOf(s.substring((int) ((coef * (-0.5d)) + 2.5d)), 16).intValue() * coef);
            }
            int e = s.toLowerCase().indexOf(HttpStatus.SC_SWITCHING_PROTOCOLS);
            if (e > 0) {
                double num = Double.parseDouble(s.substring(0, e));
                int exp = Integer.parseInt(s.substring(e + 1));
                return Double.valueOf(Math.pow(10.0d, exp) * num);
            } else if (s.length() > 17) {
                return Double.valueOf(s);
            } else {
                if (s.length() > 9) {
                    return Long.valueOf(s);
                }
                return Integer.valueOf(s);
            }
        }
    }

    public static int parseIfInt(String s, int def) {
        if (s != null && s.length() != 0) {
            String s2 = s.trim();
            for (int i = 0; i < s2.length(); i++) {
                if (!Character.isDigit(s2.charAt(i))) {
                    return def;
                }
            }
            return Integer.parseInt(s2);
        }
        return def;
    }
}
