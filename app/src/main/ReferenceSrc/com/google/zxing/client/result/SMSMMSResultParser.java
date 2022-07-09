package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

/* loaded from: classes.jar:com/google/zxing/client/result/SMSMMSResultParser.class */
public final class SMSMMSResultParser extends ResultParser {
    private static void addNumberVia(Collection<String> collection, Collection<String> collection2, String str) {
        int indexOf = str.indexOf(59);
        if (indexOf < 0) {
            collection.add(str);
            collection2.add(null);
            return;
        }
        collection.add(str.substring(0, indexOf));
        String substring = str.substring(indexOf + 1);
        collection2.add(substring.startsWith("via=") ? substring.substring(4) : null);
    }

    @Override // com.google.zxing.client.result.ResultParser
    public SMSParsedResult parse(Result result) {
        SMSParsedResult sMSParsedResult;
        String text = result.getText();
        if (text.startsWith("sms:") || text.startsWith("SMS:") || text.startsWith("mms:") || text.startsWith("MMS:")) {
            Map<String, String> parseNameValuePairs = parseNameValuePairs(text);
            String str = null;
            boolean z = false;
            String str2 = null;
            if (parseNameValuePairs != null) {
                str = null;
                z = false;
                str2 = null;
                if (!parseNameValuePairs.isEmpty()) {
                    str2 = parseNameValuePairs.get("subject");
                    str = parseNameValuePairs.get("body");
                    z = true;
                }
            }
            int indexOf = text.indexOf(63, 4);
            String substring = (indexOf < 0 || !z) ? text.substring(4) : text.substring(4, indexOf);
            int i = -1;
            ArrayList arrayList = new ArrayList(1);
            ArrayList arrayList2 = new ArrayList(1);
            while (true) {
                int indexOf2 = substring.indexOf(44, i + 1);
                if (indexOf2 <= i) {
                    break;
                }
                addNumberVia(arrayList, arrayList2, substring.substring(i + 1, indexOf2));
                i = indexOf2;
            }
            addNumberVia(arrayList, arrayList2, substring.substring(i + 1));
            sMSParsedResult = new SMSParsedResult((String[]) arrayList.toArray(new String[arrayList.size()]), (String[]) arrayList2.toArray(new String[arrayList2.size()]), str2, str);
        } else {
            sMSParsedResult = null;
        }
        return sMSParsedResult;
    }
}
