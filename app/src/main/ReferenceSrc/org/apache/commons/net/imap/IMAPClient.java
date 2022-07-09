package org.apache.commons.net.imap;

import java.io.IOException;
import org.apache.commons.net.imap.IMAP;

/* loaded from: classes.jar:org/apache/commons/net/imap/IMAPClient.class */
public class IMAPClient extends IMAP {

    /* loaded from: classes.jar:org/apache/commons/net/imap/IMAPClient$FETCH_ITEM_NAMES.class */
    public enum FETCH_ITEM_NAMES {
        ALL,
        FAST,
        FULL,
        BODY,
        BODYSTRUCTURE,
        ENVELOPE,
        FLAGS,
        INTERNALDATE,
        RFC822,
        UID
    }

    /* loaded from: classes.jar:org/apache/commons/net/imap/IMAPClient$SEARCH_CRITERIA.class */
    public enum SEARCH_CRITERIA {
        ALL,
        ANSWERED,
        BCC,
        BEFORE,
        BODY,
        CC,
        DELETED,
        DRAFT,
        FLAGGED,
        FROM,
        HEADER,
        KEYWORD,
        LARGER,
        NEW,
        NOT,
        OLD,
        ON,
        OR,
        RECENT,
        SEEN,
        SENTBEFORE,
        SENTON,
        SENTSINCE,
        SINCE,
        SMALLER,
        SUBJECT,
        TEXT,
        TO,
        UID,
        UNANSWERED,
        UNDELETED,
        UNDRAFT,
        UNFLAGGED,
        UNKEYWORD,
        UNSEEN
    }

    /* loaded from: classes.jar:org/apache/commons/net/imap/IMAPClient$STATUS_DATA_ITEMS.class */
    public enum STATUS_DATA_ITEMS {
        MESSAGES,
        RECENT,
        UIDNEXT,
        UIDVALIDITY,
        UNSEEN
    }

    public boolean append(String str) throws IOException {
        return append(str, null, null);
    }

    public boolean append(String str, String str2, String str3) throws IOException {
        String str4 = str;
        if (str2 != null) {
            str4 = str + " " + str2;
        }
        String str5 = str4;
        if (str3 != null) {
            str5 = str3.charAt(0) == '{' ? str4 + " " + str3 : str4 + " {" + str3 + "}";
        }
        return doCommand(IMAPCommand.APPEND, str5);
    }

    public boolean capability() throws IOException {
        return doCommand(IMAPCommand.CAPABILITY);
    }

    public boolean check() throws IOException {
        return doCommand(IMAPCommand.CHECK);
    }

    public boolean close() throws IOException {
        return doCommand(IMAPCommand.CLOSE);
    }

    public boolean copy(String str, String str2) throws IOException {
        return doCommand(IMAPCommand.COPY, str + " " + str2);
    }

    public boolean create(String str) throws IOException {
        return doCommand(IMAPCommand.CREATE, str);
    }

    public boolean delete(String str) throws IOException {
        return doCommand(IMAPCommand.DELETE, str);
    }

    public boolean examine(String str) throws IOException {
        return doCommand(IMAPCommand.EXAMINE, str);
    }

    public boolean expunge() throws IOException {
        return doCommand(IMAPCommand.EXPUNGE);
    }

    public boolean fetch(String str, String str2) throws IOException {
        return doCommand(IMAPCommand.FETCH, str + " " + str2);
    }

    public boolean list(String str, String str2) throws IOException {
        return doCommand(IMAPCommand.LIST, str + " " + str2);
    }

    public boolean login(String str, String str2) throws IOException {
        boolean z = false;
        if (getState() == IMAP.IMAPState.NOT_AUTH_STATE && doCommand(IMAPCommand.LOGIN, str + " " + str2)) {
            setState(IMAP.IMAPState.AUTH_STATE);
            z = true;
        }
        return z;
    }

    public boolean logout() throws IOException {
        return doCommand(IMAPCommand.LOGOUT);
    }

    public boolean lsub(String str, String str2) throws IOException {
        return doCommand(IMAPCommand.LSUB, str + " " + str2);
    }

    public boolean noop() throws IOException {
        return doCommand(IMAPCommand.NOOP);
    }

    public boolean rename(String str, String str2) throws IOException {
        return doCommand(IMAPCommand.RENAME, str + " " + str2);
    }

    public boolean search(String str) throws IOException {
        return search(null, str);
    }

    public boolean search(String str, String str2) throws IOException {
        String str3 = "";
        if (str != null) {
            str3 = "CHARSET " + str;
        }
        return doCommand(IMAPCommand.SEARCH, str3 + str2);
    }

    public boolean select(String str) throws IOException {
        return doCommand(IMAPCommand.SELECT, str);
    }

    public boolean status(String str, String[] strArr) throws IOException {
        if (strArr == null || strArr.length < 1) {
            throw new IllegalArgumentException("STATUS command requires at least one data item name");
        }
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" (");
        for (int i = 0; i < strArr.length; i++) {
            if (i > 0) {
                sb.append(" ");
            }
            sb.append(strArr[i]);
        }
        sb.append(")");
        return doCommand(IMAPCommand.STATUS, sb.toString());
    }

    public boolean store(String str, String str2, String str3) throws IOException {
        return doCommand(IMAPCommand.STORE, str + " " + str2 + " " + str3);
    }

    public boolean subscribe(String str) throws IOException {
        return doCommand(IMAPCommand.SUBSCRIBE, str);
    }

    public boolean uid(String str, String str2) throws IOException {
        return doCommand(IMAPCommand.UID, str + " " + str2);
    }

    public boolean unsubscribe(String str) throws IOException {
        return doCommand(IMAPCommand.UNSUBSCRIBE, str);
    }
}
