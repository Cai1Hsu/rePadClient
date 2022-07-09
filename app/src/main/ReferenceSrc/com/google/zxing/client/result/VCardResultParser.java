package com.google.zxing.client.result;

import com.google.zxing.Result;
import com.mining.app.zxing.decoding.Intents;
import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes.jar:com/google/zxing/client/result/VCardResultParser.class */
public final class VCardResultParser extends ResultParser {
    private static final Pattern BEGIN_VCARD = Pattern.compile("BEGIN:VCARD", 2);
    private static final Pattern VCARD_LIKE_DATE = Pattern.compile("\\d{4}-?\\d{2}-?\\d{2}");
    private static final Pattern CR_LF_SPACE_TAB = Pattern.compile("\r\n[ \t]");
    private static final Pattern NEWLINE_ESCAPE = Pattern.compile("\\\\[nN]");
    private static final Pattern VCARD_ESCAPES = Pattern.compile("\\\\([,;\\\\])");
    private static final Pattern EQUALS = Pattern.compile("=");
    private static final Pattern SEMICOLON = Pattern.compile(";");

    private static String decodeQuotedPrintable(CharSequence charSequence, String str) {
        int length = charSequence.length();
        StringBuilder sb = new StringBuilder(length);
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= length) {
                maybeAppendFragment(byteArrayOutputStream, str, sb);
                return sb.toString();
            }
            char charAt = charSequence.charAt(i2);
            int i3 = i2;
            switch (charAt) {
                case '\n':
                case '\r':
                    break;
                case '=':
                    i3 = i2;
                    if (i2 >= length - 2) {
                        break;
                    } else {
                        char charAt2 = charSequence.charAt(i2 + 1);
                        i3 = i2;
                        if (charAt2 == '\r') {
                            break;
                        } else {
                            i3 = i2;
                            if (charAt2 == '\n') {
                                break;
                            } else {
                                char charAt3 = charSequence.charAt(i2 + 2);
                                int parseHexDigit = parseHexDigit(charAt2);
                                int parseHexDigit2 = parseHexDigit(charAt3);
                                if (parseHexDigit >= 0 && parseHexDigit2 >= 0) {
                                    byteArrayOutputStream.write((parseHexDigit << 4) + parseHexDigit2);
                                }
                                i3 = i2 + 2;
                                break;
                            }
                        }
                    }
                default:
                    maybeAppendFragment(byteArrayOutputStream, str, sb);
                    sb.append(charAt);
                    i3 = i2;
                    break;
            }
            i = i3 + 1;
        }
    }

    private static void formatNames(Iterable<List<String>> iterable) {
        if (iterable != null) {
            for (List<String> list : iterable) {
                String str = list.get(0);
                String[] strArr = new String[5];
                int i = 0;
                int i2 = 0;
                while (true) {
                    int indexOf = str.indexOf(59, i);
                    if (indexOf > 0) {
                        strArr[i2] = str.substring(i, indexOf);
                        i2++;
                        i = indexOf + 1;
                    }
                }
                strArr[i2] = str.substring(i);
                StringBuilder sb = new StringBuilder(100);
                maybeAppendComponent(strArr, 3, sb);
                maybeAppendComponent(strArr, 1, sb);
                maybeAppendComponent(strArr, 2, sb);
                maybeAppendComponent(strArr, 0, sb);
                maybeAppendComponent(strArr, 4, sb);
                list.set(0, sb.toString().trim());
            }
        }
    }

    private static boolean isLikeVCardDate(CharSequence charSequence) {
        return charSequence == null || VCARD_LIKE_DATE.matcher(charSequence).matches();
    }

    static List<String> matchSingleVCardPrefixedField(CharSequence charSequence, String str, boolean z) {
        List<List<String>> matchVCardPrefixedField = matchVCardPrefixedField(charSequence, str, z);
        return (matchVCardPrefixedField == null || matchVCardPrefixedField.isEmpty()) ? null : matchVCardPrefixedField.get(0);
    }

    private static List<List<String>> matchVCardPrefixedField(CharSequence charSequence, String str, boolean z) {
        int indexOf;
        String replaceAll;
        ArrayList arrayList = null;
        int i = 0;
        int length = str.length();
        while (i < length) {
            Matcher matcher = Pattern.compile("(?:^|\n)" + ((Object) charSequence) + "(?:;([^:]*))?:", 2).matcher(str);
            int i2 = i;
            if (i > 0) {
                i2 = i - 1;
            }
            if (!matcher.find(i2)) {
                break;
            }
            int end = matcher.end(0);
            String group = matcher.group(1);
            ArrayList arrayList2 = null;
            ArrayList arrayList3 = null;
            boolean z2 = false;
            boolean z3 = false;
            String str2 = null;
            String str3 = null;
            if (group != null) {
                String[] split = SEMICOLON.split(group);
                int length2 = split.length;
                int i3 = 0;
                while (true) {
                    arrayList2 = arrayList3;
                    z2 = z3;
                    str2 = str3;
                    if (i3 >= length2) {
                        break;
                    }
                    String str4 = split[i3];
                    ArrayList arrayList4 = arrayList3;
                    if (arrayList3 == null) {
                        arrayList4 = new ArrayList(1);
                    }
                    arrayList4.add(str4);
                    String[] split2 = EQUALS.split(str4, 2);
                    boolean z4 = z3;
                    String str5 = str3;
                    if (split2.length > 1) {
                        String str6 = split2[0];
                        String str7 = split2[1];
                        if (!"ENCODING".equalsIgnoreCase(str6) || !"QUOTED-PRINTABLE".equalsIgnoreCase(str7)) {
                            z4 = z3;
                            str5 = str3;
                            if ("CHARSET".equalsIgnoreCase(str6)) {
                                str5 = str7;
                                z4 = z3;
                            }
                        } else {
                            z4 = true;
                            str5 = str3;
                        }
                    }
                    i3++;
                    arrayList3 = arrayList4;
                    z3 = z4;
                    str3 = str5;
                }
            }
            int i4 = end;
            while (true) {
                indexOf = str.indexOf(10, i4);
                if (indexOf < 0) {
                    break;
                } else if (indexOf < str.length() - 1 && (str.charAt(indexOf + 1) == ' ' || str.charAt(indexOf + 1) == '\t')) {
                    i4 = indexOf + 2;
                } else if (!z2 || (str.charAt(indexOf - 1) != '=' && str.charAt(indexOf - 2) != '=')) {
                    break;
                } else {
                    i4 = indexOf + 1;
                }
            }
            if (indexOf < 0) {
                i = length;
            } else if (indexOf > end) {
                ArrayList arrayList5 = arrayList;
                if (arrayList == null) {
                    arrayList5 = new ArrayList(1);
                }
                int i5 = indexOf;
                if (str.charAt(indexOf - 1) == '\r') {
                    i5 = indexOf - 1;
                }
                String substring = str.substring(end, i5);
                String str8 = substring;
                if (z) {
                    str8 = substring.trim();
                }
                if (z2) {
                    replaceAll = decodeQuotedPrintable(str8, str2);
                } else {
                    replaceAll = VCARD_ESCAPES.matcher(NEWLINE_ESCAPE.matcher(CR_LF_SPACE_TAB.matcher(str8).replaceAll("")).replaceAll("\n")).replaceAll("$1");
                }
                if (arrayList2 == null) {
                    ArrayList arrayList6 = new ArrayList(1);
                    arrayList6.add(replaceAll);
                    arrayList5.add(arrayList6);
                } else {
                    arrayList2.add(0, replaceAll);
                    arrayList5.add(arrayList2);
                }
                i = i5 + 1;
                arrayList = arrayList5;
            } else {
                i = indexOf + 1;
            }
        }
        return arrayList;
    }

    private static void maybeAppendComponent(String[] strArr, int i, StringBuilder sb) {
        if (strArr[i] != null) {
            sb.append(' ');
            sb.append(strArr[i]);
        }
    }

    private static void maybeAppendFragment(ByteArrayOutputStream byteArrayOutputStream, String str, StringBuilder sb) {
        String str2;
        if (byteArrayOutputStream.size() > 0) {
            byte[] byteArray = byteArrayOutputStream.toByteArray();
            if (str == null) {
                str2 = new String(byteArray);
            } else {
                try {
                    str2 = new String(byteArray, str);
                } catch (UnsupportedEncodingException e) {
                    str2 = new String(byteArray);
                }
            }
            byteArrayOutputStream.reset();
            sb.append(str2);
        }
    }

    private static String toPrimaryValue(List<String> list) {
        return (list == null || list.isEmpty()) ? null : list.get(0);
    }

    private static String[] toPrimaryValues(Collection<List<String>> collection) {
        String[] strArr;
        if (collection == null || collection.isEmpty()) {
            strArr = null;
        } else {
            ArrayList arrayList = new ArrayList(collection.size());
            for (List<String> list : collection) {
                arrayList.add(list.get(0));
            }
            strArr = (String[]) arrayList.toArray(new String[collection.size()]);
        }
        return strArr;
    }

    private static String[] toTypes(Collection<List<String>> collection) {
        String[] strArr;
        String str;
        if (collection == null || collection.isEmpty()) {
            strArr = null;
        } else {
            ArrayList arrayList = new ArrayList(collection.size());
            for (List<String> list : collection) {
                int i = 1;
                while (true) {
                    str = null;
                    if (i < list.size()) {
                        str = list.get(i);
                        int indexOf = str.indexOf(61);
                        if (indexOf >= 0) {
                            if (Intents.WifiConnect.TYPE.equalsIgnoreCase(str.substring(0, indexOf))) {
                                str = str.substring(indexOf + 1);
                                break;
                            }
                            i++;
                        }
                    }
                }
                arrayList.add(str);
            }
            strArr = (String[]) arrayList.toArray(new String[collection.size()]);
        }
        return strArr;
    }

    @Override // com.google.zxing.client.result.ResultParser
    public AddressBookParsedResult parse(Result result) {
        AddressBookParsedResult addressBookParsedResult;
        String text = result.getText();
        Matcher matcher = BEGIN_VCARD.matcher(text);
        if (!matcher.find() || matcher.start() != 0) {
            addressBookParsedResult = null;
        } else {
            List<List<String>> matchVCardPrefixedField = matchVCardPrefixedField("FN", text, true);
            List<List<String>> list = matchVCardPrefixedField;
            if (matchVCardPrefixedField == null) {
                list = matchVCardPrefixedField("N", text, true);
                formatNames(list);
            }
            List<List<String>> matchVCardPrefixedField2 = matchVCardPrefixedField("TEL", text, true);
            List<List<String>> matchVCardPrefixedField3 = matchVCardPrefixedField("EMAIL", text, true);
            List<String> matchSingleVCardPrefixedField = matchSingleVCardPrefixedField("NOTE", text, false);
            List<List<String>> matchVCardPrefixedField4 = matchVCardPrefixedField("ADR", text, true);
            if (matchVCardPrefixedField4 != null) {
                for (List<String> list2 : matchVCardPrefixedField4) {
                    list2.set(0, list2.get(0));
                }
            }
            List<String> matchSingleVCardPrefixedField2 = matchSingleVCardPrefixedField("ORG", text, true);
            List<String> matchSingleVCardPrefixedField3 = matchSingleVCardPrefixedField("BDAY", text, true);
            List<String> list3 = matchSingleVCardPrefixedField3;
            if (matchSingleVCardPrefixedField3 != null) {
                list3 = matchSingleVCardPrefixedField3;
                if (!isLikeVCardDate(matchSingleVCardPrefixedField3.get(0))) {
                    list3 = null;
                }
            }
            addressBookParsedResult = new AddressBookParsedResult(toPrimaryValues(list), null, toPrimaryValues(matchVCardPrefixedField2), toTypes(matchVCardPrefixedField2), toPrimaryValues(matchVCardPrefixedField3), toTypes(matchVCardPrefixedField3), toPrimaryValue(matchSingleVCardPrefixedField("IMPP", text, true)), toPrimaryValue(matchSingleVCardPrefixedField), toPrimaryValues(matchVCardPrefixedField4), toTypes(matchVCardPrefixedField4), toPrimaryValue(matchSingleVCardPrefixedField2), toPrimaryValue(list3), toPrimaryValue(matchSingleVCardPrefixedField("TITLE", text, true)), toPrimaryValue(matchSingleVCardPrefixedField("URL", text, true)));
        }
        return addressBookParsedResult;
    }
}
