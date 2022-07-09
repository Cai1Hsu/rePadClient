package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.List;

/* loaded from: classes.jar:com/google/zxing/client/result/VEventResultParser.class */
public final class VEventResultParser extends ResultParser {
    private static String matchSingleVCardPrefixedField(CharSequence charSequence, String str, boolean z) {
        List<String> matchSingleVCardPrefixedField = VCardResultParser.matchSingleVCardPrefixedField(charSequence, str, z);
        return (matchSingleVCardPrefixedField == null || matchSingleVCardPrefixedField.isEmpty()) ? null : matchSingleVCardPrefixedField.get(0);
    }

    @Override // com.google.zxing.client.result.ResultParser
    public CalendarParsedResult parse(Result result) {
        double d;
        double d2;
        CalendarParsedResult calendarParsedResult;
        String text = result.getText();
        if (text == null) {
            calendarParsedResult = null;
        } else if (text.indexOf("BEGIN:VEVENT") < 0) {
            calendarParsedResult = null;
        } else {
            String matchSingleVCardPrefixedField = matchSingleVCardPrefixedField("SUMMARY", text, true);
            String matchSingleVCardPrefixedField2 = matchSingleVCardPrefixedField("DTSTART", text, true);
            if (matchSingleVCardPrefixedField2 == null) {
                calendarParsedResult = null;
            } else {
                String matchSingleVCardPrefixedField3 = matchSingleVCardPrefixedField("DTEND", text, true);
                String matchSingleVCardPrefixedField4 = matchSingleVCardPrefixedField("LOCATION", text, true);
                String matchSingleVCardPrefixedField5 = matchSingleVCardPrefixedField("DESCRIPTION", text, true);
                String matchSingleVCardPrefixedField6 = matchSingleVCardPrefixedField("GEO", text, true);
                if (matchSingleVCardPrefixedField6 == null) {
                    d2 = Double.NaN;
                    d = Double.NaN;
                } else {
                    int indexOf = matchSingleVCardPrefixedField6.indexOf(59);
                    try {
                        d2 = Double.parseDouble(matchSingleVCardPrefixedField6.substring(0, indexOf));
                        d = Double.parseDouble(matchSingleVCardPrefixedField6.substring(indexOf + 1));
                    } catch (NumberFormatException e) {
                        calendarParsedResult = null;
                    }
                }
                try {
                    calendarParsedResult = new CalendarParsedResult(matchSingleVCardPrefixedField, matchSingleVCardPrefixedField2, matchSingleVCardPrefixedField3, matchSingleVCardPrefixedField4, null, matchSingleVCardPrefixedField5, d2, d);
                } catch (IllegalArgumentException e2) {
                    calendarParsedResult = null;
                }
            }
        }
        return calendarParsedResult;
    }
}
