package org.jivesoftware.smack.packet;

import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.Form;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/IQ.class */
public abstract class IQ extends Packet {
    private Type type;

    /* loaded from: classes.jar:org/jivesoftware/smack/packet/IQ$Type.class */
    public static class Type {
        private String value;
        public static final Type GET = new Type("get");
        public static final Type SET = new Type("set");
        public static final Type RESULT = new Type(Form.TYPE_RESULT);
        public static final Type ERROR = new Type("error");

        private Type(String str) {
            this.value = str;
        }

        public static Type fromString(String str) {
            Type type;
            if (str == null) {
                type = null;
            } else {
                String lowerCase = str.toLowerCase();
                if (GET.toString().equals(lowerCase)) {
                    type = GET;
                } else if (SET.toString().equals(lowerCase)) {
                    type = SET;
                } else if (ERROR.toString().equals(lowerCase)) {
                    type = ERROR;
                } else {
                    type = null;
                    if (RESULT.toString().equals(lowerCase)) {
                        type = RESULT;
                    }
                }
            }
            return type;
        }

        public String toString() {
            return this.value;
        }
    }

    public IQ() {
        this.type = Type.GET;
    }

    public IQ(IQ iq) {
        super(iq);
        this.type = Type.GET;
        this.type = iq.getType();
    }

    public static IQ createErrorResponse(IQ iq, XMPPError xMPPError) {
        if (iq.getType() == Type.GET || iq.getType() == Type.SET) {
            IQ iq2 = new IQ() { // from class: org.jivesoftware.smack.packet.IQ.2
                @Override // org.jivesoftware.smack.packet.IQ
                public String getChildElementXML() {
                    return IQ.this.getChildElementXML();
                }
            };
            iq2.setType(Type.ERROR);
            iq2.setPacketID(iq.getPacketID());
            iq2.setFrom(iq.getTo());
            iq2.setTo(iq.getFrom());
            iq2.setError(xMPPError);
            return iq2;
        }
        throw new IllegalArgumentException("IQ must be of type 'set' or 'get'. Original IQ: " + iq.toXML());
    }

    public static IQ createResultIQ(IQ iq) {
        if (iq.getType() == Type.GET || iq.getType() == Type.SET) {
            IQ iq2 = new IQ() { // from class: org.jivesoftware.smack.packet.IQ.1
                @Override // org.jivesoftware.smack.packet.IQ
                public String getChildElementXML() {
                    return null;
                }
            };
            iq2.setType(Type.RESULT);
            iq2.setPacketID(iq.getPacketID());
            iq2.setFrom(iq.getTo());
            iq2.setTo(iq.getFrom());
            return iq2;
        }
        throw new IllegalArgumentException("IQ must be of type 'set' or 'get'. Original IQ: " + iq.toXML());
    }

    public abstract String getChildElementXML();

    public Type getType() {
        return this.type;
    }

    public void setType(Type type) {
        if (type == null) {
            this.type = Type.GET;
        } else {
            this.type = type;
        }
    }

    @Override // org.jivesoftware.smack.packet.Packet
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<iq ");
        if (getPacketID() != null) {
            sb.append("id=\"" + getPacketID() + "\" ");
        }
        if (getTo() != null) {
            sb.append("to=\"").append(StringUtils.escapeForXML(getTo())).append("\" ");
        }
        if (getFrom() != null) {
            sb.append("from=\"").append(StringUtils.escapeForXML(getFrom())).append("\" ");
        }
        if (this.type == null) {
            sb.append("type=\"get\">");
        } else {
            sb.append("type=\"").append(getType()).append("\">");
        }
        String childElementXML = getChildElementXML();
        if (childElementXML != null) {
            sb.append(childElementXML);
        }
        XMPPError error = getError();
        if (error != null) {
            sb.append(error.toXML());
        }
        sb.append("</iq>");
        return sb.toString();
    }
}
