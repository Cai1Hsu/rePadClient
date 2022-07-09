package com.google.zxing.client.result;

import com.google.zxing.Result;

/* loaded from: classes.jar:com/google/zxing/client/result/AddressBookDoCoMoResultParser.class */
public final class AddressBookDoCoMoResultParser extends AbstractDoCoMoResultParser {
    private static String parseName(String str) {
        int indexOf;
        String str2 = str;
        if (str.indexOf(44) >= 0) {
            str2 = str.substring(indexOf + 1) + ' ' + str.substring(0, indexOf);
        }
        return str2;
    }

    @Override // com.google.zxing.client.result.ResultParser
    public AddressBookParsedResult parse(Result result) {
        AddressBookParsedResult addressBookParsedResult;
        String text = result.getText();
        if (!text.startsWith("MECARD:")) {
            addressBookParsedResult = null;
        } else {
            String[] matchDoCoMoPrefixedField = matchDoCoMoPrefixedField("N:", text, true);
            if (matchDoCoMoPrefixedField == null) {
                addressBookParsedResult = null;
            } else {
                String parseName = parseName(matchDoCoMoPrefixedField[0]);
                String matchSingleDoCoMoPrefixedField = matchSingleDoCoMoPrefixedField("SOUND:", text, true);
                String[] matchDoCoMoPrefixedField2 = matchDoCoMoPrefixedField("TEL:", text, true);
                String[] matchDoCoMoPrefixedField3 = matchDoCoMoPrefixedField("EMAIL:", text, true);
                String matchSingleDoCoMoPrefixedField2 = matchSingleDoCoMoPrefixedField("NOTE:", text, false);
                String[] matchDoCoMoPrefixedField4 = matchDoCoMoPrefixedField("ADR:", text, true);
                String matchSingleDoCoMoPrefixedField3 = matchSingleDoCoMoPrefixedField("BDAY:", text, true);
                String str = matchSingleDoCoMoPrefixedField3;
                if (matchSingleDoCoMoPrefixedField3 != null) {
                    str = matchSingleDoCoMoPrefixedField3;
                    if (!isStringOfDigits(matchSingleDoCoMoPrefixedField3, 8)) {
                        str = null;
                    }
                }
                addressBookParsedResult = new AddressBookParsedResult(maybeWrap(parseName), matchSingleDoCoMoPrefixedField, matchDoCoMoPrefixedField2, null, matchDoCoMoPrefixedField3, null, null, matchSingleDoCoMoPrefixedField2, matchDoCoMoPrefixedField4, null, matchSingleDoCoMoPrefixedField("ORG:", text, true), str, null, matchSingleDoCoMoPrefixedField("URL:", text, true));
            }
        }
        return addressBookParsedResult;
    }
}
