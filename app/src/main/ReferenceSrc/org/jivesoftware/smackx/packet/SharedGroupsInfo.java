package org.jivesoftware.smackx.packet;

import java.util.ArrayList;
import java.util.List;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/SharedGroupsInfo.class */
public class SharedGroupsInfo extends IQ {
    private List<String> groups = new ArrayList();

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/SharedGroupsInfo$Provider.class */
    public static class Provider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            SharedGroupsInfo sharedGroupsInfo = new SharedGroupsInfo();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2 && xmlPullParser.getName().equals("group")) {
                    sharedGroupsInfo.getGroups().add(xmlPullParser.nextText());
                } else if (next == 3 && xmlPullParser.getName().equals("sharedgroup")) {
                    z = true;
                }
            }
            return sharedGroupsInfo;
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<sharedgroup xmlns=\"http://www.jivesoftware.org/protocol/sharedgroup\">");
        for (String str : this.groups) {
            sb.append("<group>").append(str).append("</group>");
        }
        sb.append("</sharedgroup>");
        return sb.toString();
    }

    public List<String> getGroups() {
        return this.groups;
    }
}
