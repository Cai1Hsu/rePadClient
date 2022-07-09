package org.jivesoftware.smack.provider;

import java.util.ArrayList;
import org.apache.tools.ant.taskdefs.optional.j2ee.HotDeploymentTool;
import org.apache.tools.ant.types.selectors.SizeSelector;
import org.jivesoftware.smack.packet.DefaultPacketExtension;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Privacy;
import org.jivesoftware.smack.packet.PrivacyItem;
import org.jivesoftware.smackx.jingle.nat.STUN;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smack/provider/PrivacyProvider.class */
public class PrivacyProvider implements IQProvider {
    @Override // org.jivesoftware.smack.provider.IQProvider
    public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
        Privacy privacy = new Privacy();
        privacy.addExtension(new DefaultPacketExtension(xmlPullParser.getName(), xmlPullParser.getNamespace()));
        boolean z = false;
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("active")) {
                    String attributeValue = xmlPullParser.getAttributeValue("", "name");
                    if (attributeValue == null) {
                        privacy.setDeclineActiveList(true);
                    } else {
                        privacy.setActiveName(attributeValue);
                    }
                } else if (xmlPullParser.getName().equals("default")) {
                    String attributeValue2 = xmlPullParser.getAttributeValue("", "name");
                    if (attributeValue2 == null) {
                        privacy.setDeclineDefaultList(true);
                    } else {
                        privacy.setDefaultName(attributeValue2);
                    }
                } else if (xmlPullParser.getName().equals(HotDeploymentTool.ACTION_LIST)) {
                    parseList(xmlPullParser, privacy);
                }
            } else if (next == 3 && xmlPullParser.getName().equals(STUN.ELEMENT_NAME)) {
                z = true;
            }
        }
        return privacy;
    }

    public PrivacyItem parseItem(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        String attributeValue = xmlPullParser.getAttributeValue("", "action");
        String attributeValue2 = xmlPullParser.getAttributeValue("", "order");
        String attributeValue3 = xmlPullParser.getAttributeValue("", "type");
        boolean z2 = true;
        if ("allow".equalsIgnoreCase(attributeValue)) {
            z2 = true;
        } else if ("deny".equalsIgnoreCase(attributeValue)) {
            z2 = false;
        }
        PrivacyItem privacyItem = new PrivacyItem(attributeValue3, z2, Integer.parseInt(attributeValue2));
        privacyItem.setValue(xmlPullParser.getAttributeValue("", SizeSelector.SIZE_KEY));
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("iq")) {
                    privacyItem.setFilterIQ(true);
                }
                if (xmlPullParser.getName().equals("message")) {
                    privacyItem.setFilterMessage(true);
                }
                if (xmlPullParser.getName().equals("presence-in")) {
                    privacyItem.setFilterPresence_in(true);
                }
                if (xmlPullParser.getName().equals("presence-out")) {
                    privacyItem.setFilterPresence_out(true);
                }
            } else if (next == 3 && xmlPullParser.getName().equals("item")) {
                z = true;
            }
        }
        return privacyItem;
    }

    public void parseList(XmlPullParser xmlPullParser, Privacy privacy) throws Exception {
        boolean z = false;
        String attributeValue = xmlPullParser.getAttributeValue("", "name");
        ArrayList arrayList = new ArrayList();
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("item")) {
                    arrayList.add(parseItem(xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals(HotDeploymentTool.ACTION_LIST)) {
                z = true;
            }
        }
        privacy.setPrivacyList(attributeValue, arrayList);
    }
}
