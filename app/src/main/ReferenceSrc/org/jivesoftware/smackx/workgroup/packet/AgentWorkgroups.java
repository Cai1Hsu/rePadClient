package org.jivesoftware.smackx.workgroup.packet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/AgentWorkgroups.class */
public class AgentWorkgroups extends IQ {
    private String agentJID;
    private List<String> workgroups;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/AgentWorkgroups$Provider.class */
    public static class Provider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            String attributeValue = xmlPullParser.getAttributeValue("", "jid");
            ArrayList arrayList = new ArrayList();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2) {
                    if (xmlPullParser.getName().equals(WorkgroupInformation.ELEMENT_NAME)) {
                        arrayList.add(xmlPullParser.getAttributeValue("", "jid"));
                    }
                } else if (next == 3 && xmlPullParser.getName().equals("workgroups")) {
                    z = true;
                }
            }
            return new AgentWorkgroups(attributeValue, arrayList);
        }
    }

    public AgentWorkgroups(String str) {
        this.agentJID = str;
        this.workgroups = new ArrayList();
    }

    public AgentWorkgroups(String str, List<String> list) {
        this.agentJID = str;
        this.workgroups = list;
    }

    public String getAgentJID() {
        return this.agentJID;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<workgroups xmlns=\"http://jabber.org/protocol/workgroup\" jid=\"").append(this.agentJID).append("\">");
        Iterator<String> it = this.workgroups.iterator();
        while (it.hasNext()) {
            sb.append("<workgroup jid=\"" + it.next() + "\"/>");
        }
        sb.append("</workgroups>");
        return sb.toString();
    }

    public List<String> getWorkgroups() {
        return Collections.unmodifiableList(this.workgroups);
    }
}
