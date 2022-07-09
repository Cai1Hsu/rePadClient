package org.jivesoftware.smackx.bytestreams.socks5.provider;

import org.apache.http.cookie.ClientCookie;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smackx.bytestreams.socks5.packet.Bytestream;
import org.jivesoftware.smackx.jingle.nat.STUN;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/socks5/provider/BytestreamsProvider.class */
public class BytestreamsProvider implements IQProvider {
    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        Bytestream bytestream = new Bytestream();
        String attributeValue = xmlPullParser.getAttributeValue("", "sid");
        String attributeValue2 = xmlPullParser.getAttributeValue("", "mode");
        String str = null;
        String str2 = null;
        String str3 = null;
        while (!z) {
            int next = xmlPullParser.next();
            String name = xmlPullParser.getName();
            if (next == 2) {
                if (name.equals(Bytestream.StreamHost.ELEMENTNAME)) {
                    str = xmlPullParser.getAttributeValue("", "jid");
                    str2 = xmlPullParser.getAttributeValue("", "host");
                    str3 = xmlPullParser.getAttributeValue("", ClientCookie.PORT_ATTR);
                } else if (name.equals(Bytestream.StreamHostUsed.ELEMENTNAME)) {
                    bytestream.setUsedHost(xmlPullParser.getAttributeValue("", "jid"));
                } else if (name.equals(Bytestream.Activate.ELEMENTNAME)) {
                    bytestream.setToActivate(xmlPullParser.getAttributeValue("", "jid"));
                }
            } else if (next == 3) {
                if (name.equals("streamhost")) {
                    if (str3 == null) {
                        bytestream.addStreamHost(str, str2);
                    } else {
                        bytestream.addStreamHost(str, str2, Integer.parseInt(str3));
                    }
                    str = null;
                    str2 = null;
                    str3 = null;
                } else if (name.equals(STUN.ELEMENT_NAME)) {
                    z = true;
                }
            }
        }
        bytestream.setMode(Bytestream.Mode.fromName(attributeValue2));
        bytestream.setSessionID(attributeValue);
        return bytestream;
    }
}
