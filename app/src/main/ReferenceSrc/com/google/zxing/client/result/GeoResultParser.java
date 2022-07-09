package com.google.zxing.client.result;

import com.google.zxing.Result;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* loaded from: classes.jar:com/google/zxing/client/result/GeoResultParser.class */
public final class GeoResultParser extends ResultParser {
    private static final Pattern GEO_URL_PATTERN = Pattern.compile("geo:([\\-0-9.]+),([\\-0-9.]+)(?:,([\\-0-9.]+))?(?:\\?(.*))?", 2);

    @Override // com.google.zxing.client.result.ResultParser
    public GeoParsedResult parse(Result result) {
        GeoParsedResult geoParsedResult;
        double d;
        String text = result.getText();
        if (text == null) {
            geoParsedResult = null;
        } else {
            Matcher matcher = GEO_URL_PATTERN.matcher(text);
            geoParsedResult = null;
            if (matcher.matches()) {
                String group = matcher.group(4);
                try {
                    double parseDouble = Double.parseDouble(matcher.group(1));
                    geoParsedResult = null;
                    if (parseDouble <= 90.0d) {
                        geoParsedResult = null;
                        if (parseDouble >= -90.0d) {
                            double parseDouble2 = Double.parseDouble(matcher.group(2));
                            geoParsedResult = null;
                            if (parseDouble2 <= 180.0d) {
                                geoParsedResult = null;
                                if (parseDouble2 >= -180.0d) {
                                    if (matcher.group(3) == null) {
                                        d = 0.0d;
                                    } else {
                                        double parseDouble3 = Double.parseDouble(matcher.group(3));
                                        d = parseDouble3;
                                        if (parseDouble3 < 0.0d) {
                                            geoParsedResult = null;
                                        }
                                    }
                                    geoParsedResult = new GeoParsedResult(parseDouble, parseDouble2, d, group);
                                }
                            }
                        }
                    }
                } catch (NumberFormatException e) {
                    geoParsedResult = null;
                }
            }
        }
        return geoParsedResult;
    }
}
