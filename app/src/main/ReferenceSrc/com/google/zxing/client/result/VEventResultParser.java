package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.List;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class VEventResultParser extends ResultParser {
    @Override // com.google.zxing.client.result.ResultParser
    public CalendarParsedResult parse(Result result) {
        double longitude;
        double latitude;
        String rawText = result.getText();
        if (rawText == null) {
            return null;
        }
        int vEventStart = rawText.indexOf("BEGIN:VEVENT");
        if (vEventStart < 0) {
            return null;
        }
        String summary = matchSingleVCardPrefixedField("SUMMARY", rawText, true);
        String start = matchSingleVCardPrefixedField("DTSTART", rawText, true);
        if (start == null) {
            return null;
        }
        String end = matchSingleVCardPrefixedField("DTEND", rawText, true);
        String location = matchSingleVCardPrefixedField("LOCATION", rawText, true);
        String description = matchSingleVCardPrefixedField("DESCRIPTION", rawText, true);
        String geoString = matchSingleVCardPrefixedField("GEO", rawText, true);
        if (geoString == null) {
            latitude = Double.NaN;
            longitude = Double.NaN;
        } else {
            int semicolon = geoString.indexOf(59);
            try {
                latitude = Double.parseDouble(geoString.substring(0, semicolon));
                longitude = Double.parseDouble(geoString.substring(semicolon + 1));
            } catch (NumberFormatException e) {
                return null;
            }
        }
        try {
            return new CalendarParsedResult(summary, start, end, location, null, description, latitude, longitude);
        } catch (IllegalArgumentException e2) {
            return null;
        }
    }

    private static String matchSingleVCardPrefixedField(CharSequence prefix, String rawText, boolean trim) {
        List<String> values = VCardResultParser.matchSingleVCardPrefixedField(prefix, rawText, trim);
        if (values == null || values.isEmpty()) {
            return null;
        }
        return values.get(0);
    }
}
