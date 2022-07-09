package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.ArrayList;

/* loaded from: classes.jar:com/google/zxing/client/result/AddressBookAUResultParser.class */
public final class AddressBookAUResultParser extends ResultParser {
    private static String[] matchMultipleValuePrefix(String str, int i, String str2, boolean z) {
        String matchSinglePrefixedField;
        ArrayList arrayList = null;
        int i2 = 1;
        while (i2 <= i && (matchSinglePrefixedField = matchSinglePrefixedField(str + i2 + ':', str2, '\r', z)) != null) {
            ArrayList arrayList2 = arrayList;
            if (arrayList == null) {
                arrayList2 = new ArrayList(i);
            }
            arrayList2.add(matchSinglePrefixedField);
            i2++;
            arrayList = arrayList2;
        }
        return arrayList == null ? null : (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    @Override // com.google.zxing.client.result.ResultParser
    public AddressBookParsedResult parse(Result result) {
        AddressBookParsedResult addressBookParsedResult;
        String text = result.getText();
        if (!text.contains("MEMORY") || !text.contains("\r\n")) {
            addressBookParsedResult = null;
        } else {
            String matchSinglePrefixedField = matchSinglePrefixedField("NAME1:", text, '\r', true);
            String matchSinglePrefixedField2 = matchSinglePrefixedField("NAME2:", text, '\r', true);
            String[] matchMultipleValuePrefix = matchMultipleValuePrefix("TEL", 3, text, true);
            String[] matchMultipleValuePrefix2 = matchMultipleValuePrefix("MAIL", 3, text, true);
            String matchSinglePrefixedField3 = matchSinglePrefixedField("MEMORY:", text, '\r', false);
            String matchSinglePrefixedField4 = matchSinglePrefixedField("ADD:", text, '\r', true);
            addressBookParsedResult = new AddressBookParsedResult(maybeWrap(matchSinglePrefixedField), matchSinglePrefixedField2, matchMultipleValuePrefix, null, matchMultipleValuePrefix2, null, null, matchSinglePrefixedField3, matchSinglePrefixedField4 == null ? null : new String[]{matchSinglePrefixedField4}, null, null, null, null, null);
        }
        return addressBookParsedResult;
    }
}
