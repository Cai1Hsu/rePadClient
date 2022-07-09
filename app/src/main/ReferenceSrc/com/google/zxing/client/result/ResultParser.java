package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

/* loaded from: classes.jar:com/google/zxing/client/result/ResultParser.class */
public abstract class ResultParser {
    private static final ResultParser[] PARSERS = {new BookmarkDoCoMoResultParser(), new AddressBookDoCoMoResultParser(), new EmailDoCoMoResultParser(), new AddressBookAUResultParser(), new VCardResultParser(), new BizcardResultParser(), new VEventResultParser(), new EmailAddressResultParser(), new SMTPResultParser(), new TelResultParser(), new SMSMMSResultParser(), new SMSTOMMSTOResultParser(), new GeoResultParser(), new WifiResultParser(), new URLTOResultParser(), new URIResultParser(), new ISBNResultParser(), new ProductResultParser(), new ExpandedProductResultParser()};
    private static final Pattern DIGITS = Pattern.compile("\\d*");
    private static final Pattern ALPHANUM = Pattern.compile("[a-zA-Z0-9]*");
    private static final Pattern AMPERSAND = Pattern.compile("&");
    private static final Pattern EQUALS = Pattern.compile("=");

    private static void appendKeyValue(CharSequence charSequence, Map<String, String> map) {
        String[] split = EQUALS.split(charSequence, 2);
        if (split.length == 2) {
            try {
                map.put(split[0], URLDecoder.decode(split[1], "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                throw new IllegalStateException(e);
            }
        }
    }

    protected static boolean isStringOfDigits(CharSequence charSequence, int i) {
        return charSequence != null && i == charSequence.length() && DIGITS.matcher(charSequence).matches();
    }

    protected static boolean isSubstringOfAlphaNumeric(CharSequence charSequence, int i, int i2) {
        boolean z;
        if (charSequence == null) {
            z = false;
        } else {
            int i3 = i + i2;
            z = false;
            if (charSequence.length() >= i3) {
                z = false;
                if (ALPHANUM.matcher(charSequence.subSequence(i, i3)).matches()) {
                    z = true;
                }
            }
        }
        return z;
    }

    protected static boolean isSubstringOfDigits(CharSequence charSequence, int i, int i2) {
        boolean z;
        if (charSequence == null) {
            z = false;
        } else {
            int i3 = i + i2;
            z = false;
            if (charSequence.length() >= i3) {
                z = false;
                if (DIGITS.matcher(charSequence.subSequence(i, i3)).matches()) {
                    z = true;
                }
            }
        }
        return z;
    }

    static String[] matchPrefixedField(String str, String str2, char c, boolean z) {
        int indexOf;
        ArrayList arrayList = null;
        int i = 0;
        int length = str2.length();
        while (i < length && (indexOf = str2.indexOf(str, i)) >= 0) {
            int length2 = indexOf + str.length();
            boolean z2 = true;
            ArrayList arrayList2 = arrayList;
            int i2 = length2;
            while (true) {
                int i3 = i2;
                i = i3;
                arrayList = arrayList2;
                if (z2) {
                    int indexOf2 = str2.indexOf(c, i3);
                    if (indexOf2 < 0) {
                        i2 = str2.length();
                        z2 = false;
                    } else if (str2.charAt(indexOf2 - 1) == '\\') {
                        i2 = indexOf2 + 1;
                    } else {
                        ArrayList arrayList3 = arrayList2;
                        if (arrayList2 == null) {
                            arrayList3 = new ArrayList(3);
                        }
                        String unescapeBackslash = unescapeBackslash(str2.substring(length2, indexOf2));
                        String str3 = unescapeBackslash;
                        if (z) {
                            str3 = unescapeBackslash.trim();
                        }
                        arrayList3.add(str3);
                        i2 = indexOf2 + 1;
                        z2 = false;
                        arrayList2 = arrayList3;
                    }
                }
            }
        }
        return (arrayList == null || arrayList.isEmpty()) ? null : (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    static String matchSinglePrefixedField(String str, String str2, char c, boolean z) {
        String[] matchPrefixedField = matchPrefixedField(str, str2, c, z);
        return matchPrefixedField == null ? null : matchPrefixedField[0];
    }

    protected static void maybeAppend(String str, StringBuilder sb) {
        if (str != null) {
            sb.append('\n');
            sb.append(str);
        }
    }

    protected static void maybeAppend(String[] strArr, StringBuilder sb) {
        if (strArr != null) {
            for (String str : strArr) {
                sb.append('\n');
                sb.append(str);
            }
        }
    }

    protected static String[] maybeWrap(String str) {
        return str == null ? null : new String[]{str};
    }

    protected static int parseHexDigit(char c) {
        return (c < '0' || c > '9') ? (c < 'a' || c > 'f') ? (c < 'A' || c > 'F') ? -1 : (c - 'A') + 10 : (c - 'a') + 10 : c - '0';
    }

    static Map<String, String> parseNameValuePairs(String str) {
        HashMap hashMap;
        int indexOf = str.indexOf(63);
        if (indexOf >= 0) {
            HashMap hashMap2 = new HashMap(3);
            String[] split = AMPERSAND.split(str.substring(indexOf + 1));
            int length = split.length;
            int i = 0;
            while (true) {
                hashMap = hashMap2;
                if (i >= length) {
                    break;
                }
                appendKeyValue(split[i], hashMap2);
                i++;
            }
        } else {
            hashMap = null;
        }
        return hashMap;
    }

    public static ParsedResult parseResult(Result result) {
        TextParsedResult textParsedResult;
        ResultParser[] resultParserArr = PARSERS;
        int length = resultParserArr.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                textParsedResult = new TextParsedResult(result.getText(), null);
                break;
            }
            ParsedResult parse = resultParserArr[i].parse(result);
            if (parse != null) {
                textParsedResult = parse;
                break;
            }
            i++;
        }
        return textParsedResult;
    }

    protected static String unescapeBackslash(String str) {
        boolean z;
        int indexOf = str.indexOf(92);
        if (indexOf >= 0) {
            int length = str.length();
            StringBuilder sb = new StringBuilder(length - 1);
            sb.append(str.toCharArray(), 0, indexOf);
            boolean z2 = false;
            while (indexOf < length) {
                char charAt = str.charAt(indexOf);
                if (z2 || charAt != '\\') {
                    sb.append(charAt);
                    z = false;
                } else {
                    z = true;
                }
                z2 = z;
                indexOf++;
            }
            str = sb.toString();
        }
        return str;
    }

    public abstract ParsedResult parse(Result result);
}
