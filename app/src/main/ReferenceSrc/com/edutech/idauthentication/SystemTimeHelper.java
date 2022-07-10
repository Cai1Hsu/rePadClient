package com.edutech.idauthentication;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class SystemTimeHelper {
    public static String getTheSystemTime() {
        SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sDateFormat.format(new Date());
        return date;
    }

    public static long compareTime(String begin, String end) {
        SimpleDateFormat dateFormate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date date1 = dateFormate.parse(begin);
            Date date2 = dateFormate.parse(end);
            long diff = date2.getTime() - date1.getTime();
            long seconds = diff / 1000;
            if (seconds >= 0) {
                return seconds;
            }
            return 0L;
        } catch (ParseException e) {
            e.printStackTrace();
            return 0L;
        }
    }
}
