package org.apache.commons.net.smtp;

import java.io.IOException;
import java.io.Writer;
import org.apache.commons.net.io.DotTerminatedMessageWriter;

/* loaded from: classes.jar:org/apache/commons/net/smtp/SMTPClient.class */
public class SMTPClient extends SMTP {
    public SMTPClient() {
    }

    public SMTPClient(String str) {
        super(str);
    }

    public boolean addRecipient(String str) throws IOException {
        return SMTPReply.isPositiveCompletion(rcpt("<" + str + ">"));
    }

    public boolean addRecipient(RelayPath relayPath) throws IOException {
        return SMTPReply.isPositiveCompletion(rcpt(relayPath.toString()));
    }

    public boolean completePendingCommand() throws IOException {
        return SMTPReply.isPositiveCompletion(getReply());
    }

    public String listHelp() throws IOException {
        return SMTPReply.isPositiveCompletion(help()) ? getReplyString() : null;
    }

    public String listHelp(String str) throws IOException {
        return SMTPReply.isPositiveCompletion(help(str)) ? getReplyString() : null;
    }

    public boolean login() throws IOException {
        String hostName = getLocalAddress().getHostName();
        return hostName == null ? false : SMTPReply.isPositiveCompletion(helo(hostName));
    }

    public boolean login(String str) throws IOException {
        return SMTPReply.isPositiveCompletion(helo(str));
    }

    public boolean logout() throws IOException {
        return SMTPReply.isPositiveCompletion(quit());
    }

    public boolean reset() throws IOException {
        return SMTPReply.isPositiveCompletion(rset());
    }

    public Writer sendMessageData() throws IOException {
        return !SMTPReply.isPositiveIntermediate(data()) ? null : new DotTerminatedMessageWriter(this._writer);
    }

    public boolean sendNoOp() throws IOException {
        return SMTPReply.isPositiveCompletion(noop());
    }

    public boolean sendShortMessageData(String str) throws IOException {
        boolean completePendingCommand;
        Writer sendMessageData = sendMessageData();
        if (sendMessageData == null) {
            completePendingCommand = false;
        } else {
            sendMessageData.write(str);
            sendMessageData.close();
            completePendingCommand = completePendingCommand();
        }
        return completePendingCommand;
    }

    public boolean sendSimpleMessage(String str, String str2, String str3) throws IOException {
        boolean z = false;
        if (setSender(str) && addRecipient(str2)) {
            z = sendShortMessageData(str3);
        }
        return z;
    }

    public boolean sendSimpleMessage(String str, String[] strArr, String str2) throws IOException {
        boolean z = false;
        boolean z2 = false;
        if (setSender(str)) {
            for (String str3 : strArr) {
                if (addRecipient(str3)) {
                    z2 = true;
                }
            }
            if (z2) {
                z = sendShortMessageData(str2);
            }
        }
        return z;
    }

    public boolean setSender(String str) throws IOException {
        return SMTPReply.isPositiveCompletion(mail("<" + str + ">"));
    }

    public boolean setSender(RelayPath relayPath) throws IOException {
        return SMTPReply.isPositiveCompletion(mail(relayPath.toString()));
    }

    public boolean verify(String str) throws IOException {
        int vrfy = vrfy(str);
        return vrfy == 250 || vrfy == 251;
    }
}
