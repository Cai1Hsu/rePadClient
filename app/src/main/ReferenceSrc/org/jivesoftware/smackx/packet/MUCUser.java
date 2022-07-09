package org.jivesoftware.smackx.packet;

import org.jivesoftware.smack.packet.PacketExtension;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/MUCUser.class */
public class MUCUser implements PacketExtension {
    private Decline decline;
    private Destroy destroy;
    private Invite invite;
    private Item item;
    private String password;
    private Status status;

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/MUCUser$Decline.class */
    public static class Decline {
        private String from;
        private String reason;
        private String to;

        public String getFrom() {
            return this.from;
        }

        public String getReason() {
            return this.reason;
        }

        public String getTo() {
            return this.to;
        }

        public void setFrom(String str) {
            this.from = str;
        }

        public void setReason(String str) {
            this.reason = str;
        }

        public void setTo(String str) {
            this.to = str;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<decline ");
            if (getTo() != null) {
                sb.append(" to=\"").append(getTo()).append("\"");
            }
            if (getFrom() != null) {
                sb.append(" from=\"").append(getFrom()).append("\"");
            }
            sb.append(">");
            if (getReason() != null) {
                sb.append("<reason>").append(getReason()).append("</reason>");
            }
            sb.append("</decline>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/MUCUser$Destroy.class */
    public static class Destroy {
        private String jid;
        private String reason;

        public String getJid() {
            return this.jid;
        }

        public String getReason() {
            return this.reason;
        }

        public void setJid(String str) {
            this.jid = str;
        }

        public void setReason(String str) {
            this.reason = str;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<destroy");
            if (getJid() != null) {
                sb.append(" jid=\"").append(getJid()).append("\"");
            }
            if (getReason() == null) {
                sb.append("/>");
            } else {
                sb.append(">");
                if (getReason() != null) {
                    sb.append("<reason>").append(getReason()).append("</reason>");
                }
                sb.append("</destroy>");
            }
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/MUCUser$Invite.class */
    public static class Invite {
        private String from;
        private String reason;
        private String to;

        public String getFrom() {
            return this.from;
        }

        public String getReason() {
            return this.reason;
        }

        public String getTo() {
            return this.to;
        }

        public void setFrom(String str) {
            this.from = str;
        }

        public void setReason(String str) {
            this.reason = str;
        }

        public void setTo(String str) {
            this.to = str;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<invite ");
            if (getTo() != null) {
                sb.append(" to=\"").append(getTo()).append("\"");
            }
            if (getFrom() != null) {
                sb.append(" from=\"").append(getFrom()).append("\"");
            }
            sb.append(">");
            if (getReason() != null) {
                sb.append("<reason>").append(getReason()).append("</reason>");
            }
            sb.append("</invite>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/MUCUser$Item.class */
    public static class Item {
        private String actor;
        private String affiliation;
        private String jid;
        private String nick;
        private String reason;
        private String role;

        public Item(String str, String str2) {
            this.affiliation = str;
            this.role = str2;
        }

        public String getActor() {
            return this.actor == null ? "" : this.actor;
        }

        public String getAffiliation() {
            return this.affiliation;
        }

        public String getJid() {
            return this.jid;
        }

        public String getNick() {
            return this.nick;
        }

        public String getReason() {
            return this.reason == null ? "" : this.reason;
        }

        public String getRole() {
            return this.role;
        }

        public void setActor(String str) {
            this.actor = str;
        }

        public void setJid(String str) {
            this.jid = str;
        }

        public void setNick(String str) {
            this.nick = str;
        }

        public void setReason(String str) {
            this.reason = str;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<item");
            if (getAffiliation() != null) {
                sb.append(" affiliation=\"").append(getAffiliation()).append("\"");
            }
            if (getJid() != null) {
                sb.append(" jid=\"").append(getJid()).append("\"");
            }
            if (getNick() != null) {
                sb.append(" nick=\"").append(getNick()).append("\"");
            }
            if (getRole() != null) {
                sb.append(" role=\"").append(getRole()).append("\"");
            }
            if (getReason() == null && getActor() == null) {
                sb.append("/>");
            } else {
                sb.append(">");
                if (getReason() != null) {
                    sb.append("<reason>").append(getReason()).append("</reason>");
                }
                if (getActor() != null) {
                    sb.append("<actor jid=\"").append(getActor()).append("\"/>");
                }
                sb.append("</item>");
            }
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/MUCUser$Status.class */
    public static class Status {
        private String code;

        public Status(String str) {
            this.code = str;
        }

        public String getCode() {
            return this.code;
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<status code=\"").append(getCode()).append("\"/>");
            return sb.toString();
        }
    }

    public Decline getDecline() {
        return this.decline;
    }

    public Destroy getDestroy() {
        return this.destroy;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "x";
    }

    public Invite getInvite() {
        return this.invite;
    }

    public Item getItem() {
        return this.item;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jabber.org/protocol/muc#user";
    }

    public String getPassword() {
        return this.password;
    }

    public Status getStatus() {
        return this.status;
    }

    public void setDecline(Decline decline) {
        this.decline = decline;
    }

    public void setDestroy(Destroy destroy) {
        this.destroy = destroy;
    }

    public void setInvite(Invite invite) {
        this.invite = invite;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public void setPassword(String str) {
        this.password = str;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\">");
        if (getInvite() != null) {
            sb.append(getInvite().toXML());
        }
        if (getDecline() != null) {
            sb.append(getDecline().toXML());
        }
        if (getItem() != null) {
            sb.append(getItem().toXML());
        }
        if (getPassword() != null) {
            sb.append("<password>").append(getPassword()).append("</password>");
        }
        if (getStatus() != null) {
            sb.append(getStatus().toXML());
        }
        if (getDestroy() != null) {
            sb.append(getDestroy().toXML());
        }
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }
}
