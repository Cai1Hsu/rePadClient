package org.jivesoftware.smack.packet;

import android.support.v4.widget.ExploreByTouchHelper;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/Presence.class */
public class Presence extends Packet {
    private String language;
    private Type type = Type.available;
    private String status = null;
    private int priority = ExploreByTouchHelper.INVALID_ID;
    private Mode mode = null;

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/Presence$Mode.class */
    public enum Mode {
        chat,
        available,
        away,
        xa,
        dnd
    }

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/Presence$Type.class */
    public enum Type {
        available,
        unavailable,
        subscribe,
        subscribed,
        unsubscribe,
        unsubscribed,
        error
    }

    public Presence(Type type) {
        setType(type);
    }

    public Presence(Type type, String str, int i, Mode mode) {
        setType(type);
        setStatus(str);
        setPriority(i);
        setMode(mode);
    }

    public String getLanguage() {
        return this.language;
    }

    public Mode getMode() {
        return this.mode;
    }

    public int getPriority() {
        return this.priority;
    }

    public String getStatus() {
        return this.status;
    }

    public Type getType() {
        return this.type;
    }

    public boolean isAvailable() {
        return this.type == Type.available;
    }

    public boolean isAway() {
        return this.type == Type.available && (this.mode == Mode.away || this.mode == Mode.xa || this.mode == Mode.dnd);
    }

    public void setLanguage(String str) {
        this.language = str;
    }

    public void setMode(Mode mode) {
        this.mode = mode;
    }

    public void setPriority(int i) {
        if (i < -128 || i > 128) {
            throw new IllegalArgumentException("Priority value " + i + " is not valid. Valid range is -128 through 128.");
        }
        this.priority = i;
    }

    public void setStatus(String str) {
        this.status = str;
    }

    public void setType(Type type) {
        if (type == null) {
            throw new NullPointerException("Type cannot be null");
        }
        this.type = type;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.type);
        if (this.mode != null) {
            sb.append(": ").append(this.mode);
        }
        if (getStatus() != null) {
            sb.append(" (").append(getStatus()).append(")");
        }
        return sb.toString();
    }

    @Override // org.jivesoftware.smack.packet.Packet
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<presence");
        if (getXmlns() != null) {
            sb.append(" xmlns=\"").append(getXmlns()).append("\"");
        }
        if (this.language != null) {
            sb.append(" xml:lang=\"").append(getLanguage()).append("\"");
        }
        if (getPacketID() != null) {
            sb.append(" id=\"").append(getPacketID()).append("\"");
        }
        if (getTo() != null) {
            sb.append(" to=\"").append(StringUtils.escapeForXML(getTo())).append("\"");
        }
        if (getFrom() != null) {
            sb.append(" from=\"").append(StringUtils.escapeForXML(getFrom())).append("\"");
        }
        if (this.type != Type.available) {
            sb.append(" type=\"").append(this.type).append("\"");
        }
        sb.append(">");
        if (this.status != null) {
            sb.append("<status>").append(StringUtils.escapeForXML(this.status)).append("</status>");
        }
        if (this.priority != Integer.MIN_VALUE) {
            sb.append("<priority>").append(this.priority).append("</priority>");
        }
        if (this.mode != null && this.mode != Mode.available) {
            sb.append("<show>").append(this.mode).append("</show>");
        }
        sb.append(getExtensionsXML());
        XMPPError error = getError();
        if (error != null) {
            sb.append(error.toXML());
        }
        sb.append("</presence>");
        return sb.toString();
    }
}
