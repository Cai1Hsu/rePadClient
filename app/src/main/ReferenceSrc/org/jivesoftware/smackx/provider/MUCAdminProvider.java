package org.jivesoftware.smackx.provider;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smackx.jingle.nat.STUN;
import org.jivesoftware.smackx.packet.MUCAdmin;
import org.jivesoftware.smackx.packet.Nick;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/MUCAdminProvider.class */
public class MUCAdminProvider implements IQProvider {
    private MUCAdmin.Item parseItem(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        MUCAdmin.Item item = new MUCAdmin.Item(xmlPullParser.getAttributeValue("", "affiliation"), xmlPullParser.getAttributeValue("", "role"));
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

    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        MUCAdmin mUCAdmin = new MUCAdmin();
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("item")) {
                    mUCAdmin.addItem(parseItem(xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals(STUN.ELEMENT_NAME)) {
                z = true;
            }
        }
        return mUCAdmin;
    }
}
