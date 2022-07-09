package org.jivesoftware.smackx.muc;

import org.jivesoftware.smack.packet.Presence;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.packet.MUCAdmin;
import org.jivesoftware.smackx.packet.MUCUser;

/* loaded from: classes.jar:org/jivesoftware/smackx/muc/Occupant.class */
public class Occupant {
    private String affiliation;
    private String jid;
    private String nick;
    private String role;

    Occupant(Presence presence) {
        MUCUser.Item item = ((MUCUser) presence.getExtension("x", "http://jabber.org/protocol/muc#user")).getItem();
        this.jid = item.getJid();
        this.affiliation = item.getAffiliation();
        this.role = item.getRole();
        this.nick = StringUtils.parseResource(presence.getFrom());
    }

    Occupant(MUCAdmin.Item item) {
        this.jid = item.getJid();
        this.affiliation = item.getAffiliation();
        this.role = item.getRole();
        this.nick = item.getNick();
    }

    public boolean equals(Object obj) {
        return !(obj instanceof Occupant) ? false : this.jid.equals(((Occupant) obj).jid);
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

    public String getRole() {
        return this.role;
    }

    public int hashCode() {
        int hashCode = this.affiliation.hashCode();
        int hashCode2 = this.role.hashCode();
        return (((((hashCode * 17) + hashCode2) * 17) + this.jid.hashCode()) * 17) + (this.nick != null ? this.nick.hashCode() : 0);
    }
}
