package org.jivesoftware.smackx.provider;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.packet.DelayInfo;
import org.jivesoftware.smackx.packet.DelayInformation;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/DelayInfoProvider.class */
public class DelayInfoProvider extends DelayInformationProvider {
    @Override // org.jivesoftware.smackx.provider.DelayInformationProvider, org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        return new DelayInfo((DelayInformation) super.parseExtension(xmlPullParser));
    }
}
