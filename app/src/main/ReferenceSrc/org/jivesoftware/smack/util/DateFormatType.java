package org.jivesoftware.smack.util;

import java.text.SimpleDateFormat;
import org.apache.tools.ant.util.DateUtils;

/* loaded from: classes.jar:org/jivesoftware/smack/util/DateFormatType.class */
public enum DateFormatType {
    XEP_0082_DATE_PROFILE(DateUtils.ISO8601_DATE_PATTERN),
    XEP_0082_DATETIME_PROFILE("yyyy-MM-dd'T'HH:mm:ssZ"),
    XEP_0082_DATETIME_MILLIS_PROFILE("yyyy-MM-dd'T'HH:mm:ss.SSSZ"),
    XEP_0082_TIME_PROFILE("hh:mm:ss"),
    XEP_0082_TIME_ZONE_PROFILE("hh:mm:ssZ"),
    XEP_0082_TIME_MILLIS_PROFILE("hh:mm:ss.SSS"),
    XEP_0082_TIME_MILLIS_ZONE_PROFILE("hh:mm:ss.SSSZ"),
    XEP_0091_DATETIME("yyyyMMdd'T'HH:mm:ss");
    
    private String formatString;

    DateFormatType(String str) {
        this.formatString = str;
    }

    public SimpleDateFormat createFormatter() {
        return new SimpleDateFormat(getFormatString());
    }

    public String getFormatString() {
        return this.formatString;
    }
}
