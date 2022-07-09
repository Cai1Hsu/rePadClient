package org.apache.commons.net.pop3;

import java.io.IOException;
import java.io.Reader;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ListIterator;
import java.util.StringTokenizer;
import org.apache.commons.net.io.DotTerminatedMessageReader;

/* loaded from: classes.jar:org/apache/commons/net/pop3/POP3Client.class */
public class POP3Client extends POP3 {
    private static POP3MessageInfo __parseStatus(String str) {
        POP3MessageInfo pOP3MessageInfo;
        StringTokenizer stringTokenizer = new StringTokenizer(str);
        if (!stringTokenizer.hasMoreElements()) {
            pOP3MessageInfo = null;
        } else {
            try {
                int parseInt = Integer.parseInt(stringTokenizer.nextToken());
                pOP3MessageInfo = null;
                if (stringTokenizer.hasMoreElements()) {
                    pOP3MessageInfo = new POP3MessageInfo(parseInt, Integer.parseInt(stringTokenizer.nextToken()));
                }
            } catch (NumberFormatException e) {
                pOP3MessageInfo = null;
            }
        }
        return pOP3MessageInfo;
    }

    private static POP3MessageInfo __parseUID(String str) {
        POP3MessageInfo pOP3MessageInfo;
        StringTokenizer stringTokenizer = new StringTokenizer(str);
        if (!stringTokenizer.hasMoreElements()) {
            pOP3MessageInfo = null;
        } else {
            try {
                int parseInt = Integer.parseInt(stringTokenizer.nextToken());
                pOP3MessageInfo = null;
                if (stringTokenizer.hasMoreElements()) {
                    pOP3MessageInfo = new POP3MessageInfo(parseInt, stringTokenizer.nextToken());
                }
            } catch (NumberFormatException e) {
                pOP3MessageInfo = null;
            }
        }
        return pOP3MessageInfo;
    }

    public boolean capa() throws IOException {
        boolean z;
        if (sendCommand(12) == 0) {
            getAdditionalReply();
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    public boolean deleteMessage(int i) throws IOException {
        boolean z = true;
        if (getState() != 1) {
            z = false;
        } else if (sendCommand(6, Integer.toString(i)) != 0) {
            z = false;
        }
        return z;
    }

    public POP3MessageInfo listMessage(int i) throws IOException {
        POP3MessageInfo pOP3MessageInfo = null;
        if (getState() == 1 && sendCommand(4, Integer.toString(i)) == 0) {
            pOP3MessageInfo = __parseStatus(this._lastReplyLine.substring(3));
        }
        return pOP3MessageInfo;
    }

    public POP3MessageInfo[] listMessages() throws IOException {
        POP3MessageInfo[] pOP3MessageInfoArr = null;
        if (getState() == 1 && sendCommand(4) == 0) {
            getAdditionalReply();
            POP3MessageInfo[] pOP3MessageInfoArr2 = new POP3MessageInfo[this._replyLines.size() - 2];
            ListIterator<String> listIterator = this._replyLines.listIterator(1);
            int i = 0;
            while (true) {
                pOP3MessageInfoArr = pOP3MessageInfoArr2;
                if (i >= pOP3MessageInfoArr2.length) {
                    break;
                }
                pOP3MessageInfoArr2[i] = __parseStatus(listIterator.next());
                i++;
            }
        }
        return pOP3MessageInfoArr;
    }

    public POP3MessageInfo listUniqueIdentifier(int i) throws IOException {
        POP3MessageInfo pOP3MessageInfo = null;
        if (getState() == 1 && sendCommand(11, Integer.toString(i)) == 0) {
            pOP3MessageInfo = __parseUID(this._lastReplyLine.substring(3));
        }
        return pOP3MessageInfo;
    }

    public POP3MessageInfo[] listUniqueIdentifiers() throws IOException {
        POP3MessageInfo[] pOP3MessageInfoArr = null;
        if (getState() == 1 && sendCommand(11) == 0) {
            getAdditionalReply();
            POP3MessageInfo[] pOP3MessageInfoArr2 = new POP3MessageInfo[this._replyLines.size() - 2];
            ListIterator<String> listIterator = this._replyLines.listIterator(1);
            int i = 0;
            while (true) {
                pOP3MessageInfoArr = pOP3MessageInfoArr2;
                if (i >= pOP3MessageInfoArr2.length) {
                    break;
                }
                pOP3MessageInfoArr2[i] = __parseUID(listIterator.next());
                i++;
            }
        }
        return pOP3MessageInfoArr;
    }

    public boolean login(String str, String str2) throws IOException {
        boolean z;
        if (getState() != 0) {
            z = false;
        } else {
            z = false;
            if (sendCommand(0, str) == 0) {
                z = false;
                if (sendCommand(1, str2) == 0) {
                    setState(1);
                    z = true;
                }
            }
        }
        return z;
    }

    public boolean login(String str, String str2, String str3) throws IOException, NoSuchAlgorithmException {
        boolean z = false;
        if (getState() == 0) {
            byte[] digest = MessageDigest.getInstance("MD5").digest((str2 + str3).getBytes());
            StringBuilder sb = new StringBuilder(128);
            for (byte b : digest) {
                int i = b & 255;
                if (i <= 15) {
                    sb.append("0");
                }
                sb.append(Integer.toHexString(i));
            }
            StringBuilder sb2 = new StringBuilder(256);
            sb2.append(str);
            sb2.append(' ');
            sb2.append(sb.toString());
            if (sendCommand(9, sb2.toString()) == 0) {
                setState(1);
                z = true;
            }
        }
        return z;
    }

    public boolean logout() throws IOException {
        boolean z = true;
        if (getState() == 1) {
            setState(2);
        }
        sendCommand(2);
        if (this._replyCode != 0) {
            z = false;
        }
        return z;
    }

    public boolean noop() throws IOException {
        boolean z = true;
        if (getState() != 1) {
            z = false;
        } else if (sendCommand(7) != 0) {
            z = false;
        }
        return z;
    }

    public boolean reset() throws IOException {
        boolean z = true;
        if (getState() != 1) {
            z = false;
        } else if (sendCommand(8) != 0) {
            z = false;
        }
        return z;
    }

    public Reader retrieveMessage(int i) throws IOException {
        DotTerminatedMessageReader dotTerminatedMessageReader = null;
        if (getState() == 1 && sendCommand(5, Integer.toString(i)) == 0) {
            dotTerminatedMessageReader = new DotTerminatedMessageReader(this._reader);
        }
        return dotTerminatedMessageReader;
    }

    public Reader retrieveMessageTop(int i, int i2) throws IOException {
        DotTerminatedMessageReader dotTerminatedMessageReader = null;
        if (i2 >= 0) {
            if (getState() != 1) {
                dotTerminatedMessageReader = null;
            } else {
                dotTerminatedMessageReader = null;
                if (sendCommand(10, Integer.toString(i) + " " + Integer.toString(i2)) == 0) {
                    dotTerminatedMessageReader = new DotTerminatedMessageReader(this._reader);
                }
            }
        }
        return dotTerminatedMessageReader;
    }

    public POP3MessageInfo status() throws IOException {
        POP3MessageInfo pOP3MessageInfo = null;
        if (getState() == 1 && sendCommand(3) == 0) {
            pOP3MessageInfo = __parseStatus(this._lastReplyLine.substring(3));
        }
        return pOP3MessageInfo;
    }
}
