package org.jivesoftware.smackx.provider;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smackx.jingle.nat.STUN;
import org.jivesoftware.smackx.packet.DiscoverItems;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/DiscoverItemsProvider.class */
public class DiscoverItemsProvider implements IQProvider {
    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        DiscoverItems discoverItems = new DiscoverItems();
        boolean z = false;
        String str = "";
        String str2 = "";
        String str3 = "";
        String str4 = "";
        discoverItems.setNode(xmlPullParser.getAttributeValue("", "node"));
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2 && "item".equals(xmlPullParser.getName())) {
                str = xmlPullParser.getAttributeValue("", "jid");
                str2 = xmlPullParser.getAttributeValue("", "name");
                str4 = xmlPullParser.getAttributeValue("", "node");
                str3 = xmlPullParser.getAttributeValue("", "action");
            } else if (next == 3 && "item".equals(xmlPullParser.getName())) {
                DiscoverItems.Item item = new DiscoverItems.Item(str);
                item.setName(str2);
                item.setNode(str4);
                item.setAction(str3);
                discoverItems.addItem(item);
            } else if (next == 3 && STUN.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                z = true;
            }
        }
        return discoverItems;
    }
}
