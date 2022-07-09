package org.jivesoftware.smackx.provider;

import com.edutech.idauthentication.AppEnvironment;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.packet.MUCUser;
import org.jivesoftware.smackx.packet.Nick;
import org.jivesoftware.smackx.workgroup.packet.RoomInvitation;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/MUCUserProvider.class */
public class MUCUserProvider implements PacketExtensionProvider {
    private MUCUser.Decline parseDecline(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        MUCUser.Decline decline = new MUCUser.Decline();
        decline.setFrom(xmlPullParser.getAttributeValue("", PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM));
        decline.setTo(xmlPullParser.getAttributeValue("", "to"));
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("reason")) {
                    decline.setReason(xmlPullParser.nextText());
                }
            } else if (next == 3 && xmlPullParser.getName().equals("decline")) {
                z = true;
            }
        }
        return decline;
    }

    private MUCUser.Destroy parseDestroy(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        MUCUser.Destroy destroy = new MUCUser.Destroy();
        destroy.setJid(xmlPullParser.getAttributeValue("", "jid"));
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("reason")) {
                    destroy.setReason(xmlPullParser.nextText());
                }
            } else if (next == 3 && xmlPullParser.getName().equals("destroy")) {
                z = true;
            }
        }
        return destroy;
    }

    private MUCUser.Invite parseInvite(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        MUCUser.Invite invite = new MUCUser.Invite();
        invite.setFrom(xmlPullParser.getAttributeValue("", PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM));
        invite.setTo(xmlPullParser.getAttributeValue("", "to"));
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("reason")) {
                    invite.setReason(xmlPullParser.nextText());
                }
            } else if (next == 3 && xmlPullParser.getName().equals(RoomInvitation.ELEMENT_NAME)) {
                z = true;
            }
        }
        return invite;
    }

    private MUCUser.Item parseItem(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        MUCUser.Item item = new MUCUser.Item(xmlPullParser.getAttributeValue("", "affiliation"), xmlPullParser.getAttributeValue("", "role"));
        item.setNick(xmlPullParser.getAttributeValue("", Nick.ELEMENT_NAME));
        item.setJid(xmlPullParser.getAttributeValue("", "jid"));
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("actor")) {
                    item.setActor(xmlPullParser.getAttributeValue("", "jid"));
                }
                if (xmlPullParser.getName().equals("reason")) {
                    item.setReason(xmlPullParser.nextText());
                }
            } else if (next == 3 && xmlPullParser.getName().equals("item")) {
                z = true;
            }
        }
        return item;
    }

    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        MUCUser mUCUser = new MUCUser();
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals(RoomInvitation.ELEMENT_NAME)) {
                    mUCUser.setInvite(parseInvite(xmlPullParser));
                }
                if (xmlPullParser.getName().equals("item")) {
                    mUCUser.setItem(parseItem(xmlPullParser));
                }
                if (xmlPullParser.getName().equals(AppEnvironment.PASSWORD)) {
                    mUCUser.setPassword(xmlPullParser.nextText());
                }
                if (xmlPullParser.getName().equals("status")) {
                    mUCUser.setStatus(new MUCUser.Status(xmlPullParser.getAttributeValue("", "code")));
                }
                if (xmlPullParser.getName().equals("decline")) {
                    mUCUser.setDecline(parseDecline(xmlPullParser));
                }
                if (xmlPullParser.getName().equals("destroy")) {
                    mUCUser.setDestroy(parseDestroy(xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals("x")) {
                z = true;
            }
        }
        return mUCUser;
    }
}
