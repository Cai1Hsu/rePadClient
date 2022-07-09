package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.ArrayList;

/* loaded from: classes.jar:com/google/zxing/client/result/BizcardResultParser.class */
public final class BizcardResultParser extends AbstractDoCoMoResultParser {
    private static String buildName(String str, String str2) {
        if (str == null) {
            str = str2;
        } else if (str2 != null) {
            str = str + ' ' + str2;
        }
        return str;
    }

    private static String[] buildPhoneNumbers(String str, String str2, String str3) {
        ArrayList arrayList = new ArrayList(3);
        if (str != null) {
            arrayList.add(str);
        }
        if (str2 != null) {
            arrayList.add(str2);
        }
        if (str3 != null) {
            arrayList.add(str3);
        }
        int size = arrayList.size();
        return size == 0 ? null : (String[]) arrayList.toArray(new String[size]);
    }

    @Override // com.google.zxing.client.result.ResultParser
    public AddressBookParsedResult parse(Result result) {
        AddressBookParsedResult addressBookParsedResult;
        String text = result.getText();
        if (!text.startsWith("BIZCARD:")) {
            addressBookParsedResult = null;
        } else {
            String buildName = buildName(matchSingleDoCoMoPrefixedField("N:", text, true), matchSingleDoCoMoPrefixedField("X:", text, true));
            String matchSingleDoCoMoPrefixedField = matchSingleDoCoMoPrefixedField("T:", text, true);
            addressBookParsedResult = new AddressBookParsedResult(maybeWrap(buildName), null, buildPhoneNumbers(matchSingleDoCoMoPrefixedField("B:", text, true), matchSingleDoCoMoPrefixedField("M:", text, true), matchSingleDoCoMoPrefixedField("F:", text, true)), null, maybeWrap(matchSingleDoCoMoPrefixedField("E:", text, true)), null, null, null, matchDoCoMoPrefixedField("A:", text, true), null, matchSingleDoCoMoPrefixedField("C:", text, true), null, matchSingleDoCoMoPrefixedField, null);
        }
        return addressBookParsedResult;
    }
}
