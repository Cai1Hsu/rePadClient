package com.google.zxing.client.result;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.Result;
import java.util.HashMap;
import org.apache.commons.compress.archivers.tar.TarConstants;

/* loaded from: classes.jar:com/google/zxing/client/result/ExpandedProductResultParser.class */
public final class ExpandedProductResultParser extends ResultParser {
    private static String findAIvalue(int i, String str) {
        String sb;
        StringBuilder sb2 = new StringBuilder();
        if (str.charAt(i) == '(') {
            String substring = str.substring(i + 1);
            int i2 = 0;
            while (true) {
                if (i2 >= substring.length()) {
                    sb = sb2.toString();
                    break;
                }
                char charAt = substring.charAt(i2);
                if (charAt != ')') {
                    sb = null;
                    if (charAt < '0') {
                        break;
                    }
                    sb = null;
                    if (charAt > '9') {
                        break;
                    }
                    sb2.append(charAt);
                    i2++;
                } else {
                    sb = sb2.toString();
                    break;
                }
            }
        } else {
            sb = null;
        }
        return sb;
    }

    private static String findValue(int i, String str) {
        StringBuilder sb = new StringBuilder();
        String substring = str.substring(i);
        for (int i2 = 0; i2 < substring.length(); i2++) {
            char charAt = substring.charAt(i2);
            if (charAt != '(') {
                sb.append(charAt);
            } else if (findAIvalue(i2, substring) != null) {
                break;
            } else {
                sb.append('(');
            }
        }
        return sb.toString();
    }

    @Override // com.google.zxing.client.result.ResultParser
    public ExpandedProductParsedResult parse(Result result) {
        ExpandedProductParsedResult expandedProductParsedResult;
        if (result.getBarcodeFormat() == BarcodeFormat.RSS_EXPANDED) {
            String text = result.getText();
            if (text != null) {
                String str = null;
                String str2 = null;
                String str3 = null;
                String str4 = null;
                String str5 = null;
                String str6 = null;
                String str7 = null;
                String str8 = null;
                String str9 = null;
                String str10 = null;
                String str11 = null;
                String str12 = null;
                String str13 = null;
                HashMap hashMap = new HashMap();
                int i = 0;
                while (true) {
                    if (i >= text.length()) {
                        expandedProductParsedResult = new ExpandedProductParsedResult(str, str2, str3, str4, str5, str6, str7, str8, str9, str10, str11, str12, str13, hashMap);
                        break;
                    }
                    String findAIvalue = findAIvalue(i, text);
                    if (findAIvalue == null) {
                        expandedProductParsedResult = null;
                        break;
                    }
                    int length = i + findAIvalue.length() + 2;
                    String findValue = findValue(length, text);
                    i = length + findValue.length();
                    if (TarConstants.VERSION_POSIX.equals(findAIvalue)) {
                        str2 = findValue;
                    } else if ("01".equals(findAIvalue)) {
                        str = findValue;
                    } else if ("10".equals(findAIvalue)) {
                        str3 = findValue;
                    } else if ("11".equals(findAIvalue)) {
                        str4 = findValue;
                    } else if ("13".equals(findAIvalue)) {
                        str5 = findValue;
                    } else if ("15".equals(findAIvalue)) {
                        str6 = findValue;
                    } else if ("17".equals(findAIvalue)) {
                        str7 = findValue;
                    } else if ("3100".equals(findAIvalue) || "3101".equals(findAIvalue) || "3102".equals(findAIvalue) || "3103".equals(findAIvalue) || "3104".equals(findAIvalue) || "3105".equals(findAIvalue) || "3106".equals(findAIvalue) || "3107".equals(findAIvalue) || "3108".equals(findAIvalue) || "3109".equals(findAIvalue)) {
                        str9 = ExpandedProductParsedResult.KILOGRAM;
                        str10 = findAIvalue.substring(3);
                        str8 = findValue;
                    } else if ("3200".equals(findAIvalue) || "3201".equals(findAIvalue) || "3202".equals(findAIvalue) || "3203".equals(findAIvalue) || "3204".equals(findAIvalue) || "3205".equals(findAIvalue) || "3206".equals(findAIvalue) || "3207".equals(findAIvalue) || "3208".equals(findAIvalue) || "3209".equals(findAIvalue)) {
                        str9 = ExpandedProductParsedResult.POUND;
                        str10 = findAIvalue.substring(3);
                        str8 = findValue;
                    } else if ("3920".equals(findAIvalue) || "3921".equals(findAIvalue) || "3922".equals(findAIvalue) || "3923".equals(findAIvalue)) {
                        str12 = findAIvalue.substring(3);
                        str11 = findValue;
                    } else if (!"3930".equals(findAIvalue) && !"3931".equals(findAIvalue) && !"3932".equals(findAIvalue) && !"3933".equals(findAIvalue)) {
                        hashMap.put(findAIvalue, findValue);
                    } else if (findValue.length() < 4) {
                        expandedProductParsedResult = null;
                        break;
                    } else {
                        str11 = findValue.substring(3);
                        str13 = findValue.substring(0, 3);
                        str12 = findAIvalue.substring(3);
                    }
                }
            } else {
                expandedProductParsedResult = null;
            }
        } else {
            expandedProductParsedResult = null;
        }
        return expandedProductParsedResult;
    }
}
