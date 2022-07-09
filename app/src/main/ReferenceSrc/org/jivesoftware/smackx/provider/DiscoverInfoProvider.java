package org.jivesoftware.smackx.provider;

import org.apache.http.protocol.HTTP;
import org.apache.tools.ant.taskdefs.condition.ParserSupports;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.util.PacketParserUtils;
import org.jivesoftware.smackx.jingle.nat.STUN;
import org.jivesoftware.smackx.packet.DiscoverInfo;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/DiscoverInfoProvider.class */
public class DiscoverInfoProvider implements IQProvider {
    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        DiscoverInfo discoverInfo = new DiscoverInfo();
        boolean z = false;
        String str = "";
        String str2 = "";
        String str3 = "";
        String str4 = "";
        String str5 = "";
        discoverInfo.setNode(xmlPullParser.getAttributeValue("", "node"));
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals(HTTP.IDENTITY_CODING)) {
                    str = xmlPullParser.getAttributeValue("", "category");
                    str2 = xmlPullParser.getAttributeValue("", "name");
                    str3 = xmlPullParser.getAttributeValue("", "type");
                    str5 = xmlPullParser.getAttributeValue(xmlPullParser.getNamespace("xml"), "lang");
                } else if (xmlPullParser.getName().equals(ParserSupports.FEATURE)) {
                    str4 = xmlPullParser.getAttributeValue("", "var");
                } else {
                    discoverInfo.addExtension(PacketParserUtils.parsePacketExtension(xmlPullParser.getName(), xmlPullParser.getNamespace(), xmlPullParser));
                }
            } else if (next == 3) {
                if (xmlPullParser.getName().equals(HTTP.IDENTITY_CODING)) {
                    DiscoverInfo.Identity identity = new DiscoverInfo.Identity(str, str2, str3);
                    if (str5 != null) {
                        identity.setLanguage(str5);
                    }
                    discoverInfo.addIdentity(identity);
                }
                if (xmlPullParser.getName().equals(ParserSupports.FEATURE)) {
                    discoverInfo.addFeature(str4);
                }
                if (xmlPullParser.getName().equals(STUN.ELEMENT_NAME)) {
                    z = true;
                }
            }
        }
        return discoverInfo;
    }
}
