package com.edutech.idauthentication;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/* loaded from: classes.jar:com/edutech/idauthentication/SystemTimeHelper.class */
public class SystemTimeHelper {
    public static long compareTime(String str, String str2) {
        long j;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            j = (simpleDateFormat.parse(str2).getTime() - simpleDateFormat.parse(str).getTime()) / 1000;
            if (j < 0) {
                j = 0;
            }
        } catch (ParseException e) {
            e.printStackTrace();
            j = 0;
        }
        return j;
    }

    public static String getTheSystemTime() {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    }
}
