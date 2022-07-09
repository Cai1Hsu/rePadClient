package org.jivesoftware.smackx.packet;

import com.mongodb.util.JSONCallback;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/MUCInitialPresence.class */
public class MUCInitialPresence implements PacketExtension {
    private History history;
    private String password;

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/MUCInitialPresence$History.class */
    public static class History {
        private int maxChars = -1;
        private int maxStanzas = -1;
        private int seconds = -1;
        private Date since;

        public int getMaxChars() {
            return this.maxChars;
        }

        public int getMaxStanzas() {
            return this.maxStanzas;
        }

        public int getSeconds() {
            return this.seconds;
        }

        public Date getSince() {
            return this.since;
        }

        public void setMaxChars(int i) {
            this.maxChars = i;
        }

        public void setMaxStanzas(int i) {
            this.maxStanzas = i;
        }

        public void setSeconds(int i) {
            this.seconds = i;
        }

        public void setSince(Date date) {
            this.since = date;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<history");
            if (getMaxChars() != -1) {
                sb.append(" maxchars=\"").append(getMaxChars()).append("\"");
            }
            if (getMaxStanzas() != -1) {
                sb.append(" maxstanzas=\"").append(getMaxStanzas()).append("\"");
            }
            if (getSeconds() != -1) {
                sb.append(" seconds=\"").append(getSeconds()).append("\"");
            }
            if (getSince() != null) {
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat(JSONCallback._msDateFormat);
                simpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
                sb.append(" since=\"").append(simpleDateFormat.format(getSince())).append("\"");
            }
            sb.append("/>");
            return sb.toString();
        }
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "x";
    }

    public History getHistory() {
        return this.history;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jabber.org/protocol/muc";
    }

    public String getPassword() {
        return this.password;
    }

    public void setHistory(History history) {
        this.history = history;
    }

    public void setPassword(String str) {
        this.password = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\">");
        if (getPassword() != null) {
            sb.append("<password>").append(getPassword()).append("</password>");
        }
        if (getHistory() != null) {
            sb.append(getHistory().toXML());
        }
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }
}
