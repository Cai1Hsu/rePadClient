package org.apache.commons.net.imap;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.net.MalformedServerReplyException;

/* loaded from: classes.jar:org/apache/commons/net/imap/IMAPReply.class */
public final class IMAPReply {
    public static final int BAD = 2;
    public static final int CONT = 3;
    private static final String IMAP_BAD = "BAD";
    private static final String IMAP_CONTINUATION_PREFIX = "+";
    private static final String IMAP_NO = "NO";
    private static final String IMAP_OK = "OK";
    private static final String IMAP_UNTAGGED_PREFIX = "* ";
    public static final int NO = 1;
    public static final int OK = 0;
    private static final String TAGGED_RESPONSE = "^\\w+ (\\S+).*";
    private static final Pattern TAGGED_PATTERN = Pattern.compile(TAGGED_RESPONSE);
    private static final String UNTAGGED_RESPONSE = "^\\* (\\S+).*";
    private static final Pattern UNTAGGED_PATTERN = Pattern.compile(UNTAGGED_RESPONSE);

    private IMAPReply() {
    }

    public static int getReplyCode(String str) throws IOException {
        return getReplyCode(str, TAGGED_PATTERN);
    }

    /* JADX WARN: Code restructure failed: missing block: B:16:0x0042, code lost:
        if (r0.equals(org.apache.commons.net.imap.IMAPReply.IMAP_NO) == false) goto L17;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static int getReplyCode(String str, Pattern pattern) throws IOException {
        int i = 1;
        if (!isContinuation(str)) {
            Matcher matcher = pattern.matcher(str);
            if (matcher.matches()) {
                String group = matcher.group(1);
                if (group.equals(IMAP_OK)) {
                    i = 0;
                } else if (group.equals(IMAP_BAD)) {
                    i = 2;
                }
            }
            throw new MalformedServerReplyException("Received unexpected IMAP protocol response from server: '" + str + "'.");
        }
        i = 3;
        return i;
    }

    public static int getUntaggedReplyCode(String str) throws IOException {
        return getReplyCode(str, UNTAGGED_PATTERN);
    }

    public static boolean isContinuation(int i) {
        return i == 3;
    }

    public static boolean isContinuation(String str) {
        return str.startsWith(IMAP_CONTINUATION_PREFIX);
    }

    public static boolean isSuccess(int i) {
        return i == 0;
    }

    public static boolean isUntagged(String str) {
        return str.startsWith(IMAP_UNTAGGED_PREFIX);
    }
}
