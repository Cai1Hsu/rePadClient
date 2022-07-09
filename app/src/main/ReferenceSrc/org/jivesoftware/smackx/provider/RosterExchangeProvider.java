package org.jivesoftware.smackx.provider;

import java.util.ArrayList;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.RemoteRosterEntry;
import org.jivesoftware.smackx.packet.RosterExchange;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/RosterExchangeProvider.class */
public class RosterExchangeProvider implements PacketExtensionProvider {
    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        RosterExchange rosterExchange = new RosterExchange();
        boolean z = false;
        String str = "";
        String str2 = "";
        ArrayList arrayList = new ArrayList();
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                ArrayList arrayList2 = arrayList;
                String str3 = str;
                String str4 = str2;
                if (xmlPullParser.getName().equals("item")) {
                    arrayList2 = new ArrayList();
                    str3 = xmlPullParser.getAttributeValue("", "jid");
                    str4 = xmlPullParser.getAttributeValue("", "name");
                }
                arrayList = arrayList2;
                str = str3;
                str2 = str4;
                if (xmlPullParser.getName().equals("group")) {
                    arrayList2.add(xmlPullParser.nextText());
                    arrayList = arrayList2;
                    str = str3;
                    str2 = str4;
                }
            } else if (next == 3) {
                if (xmlPullParser.getName().equals("item")) {
                    rosterExchange.addRosterEntry(new RemoteRosterEntry(str, str2, (String[]) arrayList.toArray(new String[arrayList.size()])));
                }
                if (xmlPullParser.getName().equals("x")) {
                    z = true;
                }
            }
        }
        return rosterExchange;
    }
}
