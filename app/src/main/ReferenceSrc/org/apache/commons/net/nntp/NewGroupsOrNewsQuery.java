package org.apache.commons.net.nntp;

import java.util.Calendar;
import org.apache.commons.compress.archivers.tar.TarConstants;

/* loaded from: classes.jar:org/apache/commons/net/nntp/NewGroupsOrNewsQuery.class */
public final class NewGroupsOrNewsQuery {
    private String __date;
    private boolean __isGMT;
    private String __time;
    private StringBuffer __distributions = null;
    private StringBuffer __newsgroups = null;

    public NewGroupsOrNewsQuery(Calendar calendar, boolean z) {
        this.__isGMT = z;
        StringBuilder sb = new StringBuilder();
        String num = Integer.toString(calendar.get(1));
        int length = num.length();
        if (length >= 2) {
            sb.append(num.substring(length - 2));
        } else {
            sb.append(TarConstants.VERSION_POSIX);
        }
        String num2 = Integer.toString(calendar.get(2) + 1);
        int length2 = num2.length();
        if (length2 == 1) {
            sb.append('0');
            sb.append(num2);
        } else if (length2 == 2) {
            sb.append(num2);
        } else {
            sb.append("01");
        }
        String num3 = Integer.toString(calendar.get(5));
        int length3 = num3.length();
        if (length3 == 1) {
            sb.append('0');
            sb.append(num3);
        } else if (length3 == 2) {
            sb.append(num3);
        } else {
            sb.append("01");
        }
        this.__date = sb.toString();
        sb.setLength(0);
        String num4 = Integer.toString(calendar.get(11));
        int length4 = num4.length();
        if (length4 == 1) {
            sb.append('0');
            sb.append(num4);
        } else if (length4 == 2) {
            sb.append(num4);
        } else {
            sb.append(TarConstants.VERSION_POSIX);
        }
        String num5 = Integer.toString(calendar.get(12));
        int length5 = num5.length();
        if (length5 == 1) {
            sb.append('0');
            sb.append(num5);
        } else if (length5 == 2) {
            sb.append(num5);
        } else {
            sb.append(TarConstants.VERSION_POSIX);
        }
        String num6 = Integer.toString(calendar.get(13));
        int length6 = num6.length();
        if (length6 == 1) {
            sb.append('0');
            sb.append(num6);
        } else if (length6 == 2) {
            sb.append(num6);
        } else {
            sb.append(TarConstants.VERSION_POSIX);
        }
        this.__time = sb.toString();
    }

    public void addDistribution(String str) {
        if (this.__distributions != null) {
            this.__distributions.append(',');
        } else {
            this.__distributions = new StringBuffer();
        }
        this.__distributions.append(str);
    }

    public void addNewsgroup(String str) {
        if (this.__newsgroups != null) {
            this.__newsgroups.append(',');
        } else {
            this.__newsgroups = new StringBuffer();
        }
        this.__newsgroups.append(str);
    }

    public String getDate() {
        return this.__date;
    }

    public String getDistributions() {
        return this.__distributions == null ? null : this.__distributions.toString();
    }

    public String getNewsgroups() {
        return this.__newsgroups == null ? null : this.__newsgroups.toString();
    }

    public String getTime() {
        return this.__time;
    }

    public boolean isGMT() {
        return this.__isGMT;
    }

    public void omitNewsgroup(String str) {
        addNewsgroup("!" + str);
    }
}
