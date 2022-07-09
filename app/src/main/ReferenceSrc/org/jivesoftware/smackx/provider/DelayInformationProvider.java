package org.jivesoftware.smackx.provider;

import java.text.ParseException;
import java.util.Date;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.packet.DelayInformation;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/DelayInformationProvider.class */
public class DelayInformationProvider implements PacketExtensionProvider {
    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        Date date = null;
        try {
            date = StringUtils.parseDate(xmlPullParser.getAttributeValue("", "stamp"));
        } catch (ParseException e) {
            if (0 == 0) {
                date = new Date(0L);
            }
        }
        DelayInformation delayInformation = new DelayInformation(date);
        delayInformation.setFrom(xmlPullParser.getAttributeValue("", PrivacyItem.PrivacyRule.SUBSCRIPTION_FROM));
        String nextText = xmlPullParser.nextText();
        String str = nextText;
        if ("".equals(nextText)) {
            str = null;
        }
        delayInformation.setReason(str);
        return delayInformation;
    }
}
