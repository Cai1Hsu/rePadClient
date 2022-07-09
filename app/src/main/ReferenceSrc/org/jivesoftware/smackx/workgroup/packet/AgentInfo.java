package org.jivesoftware.smackx.workgroup.packet;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/AgentInfo.class */
public class AgentInfo extends IQ {
    public static final String ELEMENT_NAME = "agent-info";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    private String jid;
    private String name;

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/AgentInfo$Provider.class */
    public static class Provider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            AgentInfo agentInfo = new AgentInfo();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2) {
                    if (xmlPullParser.getName().equals("jid")) {
                        agentInfo.setJid(xmlPullParser.nextText());
                    } else if (xmlPullParser.getName().equals("name")) {
                        agentInfo.setName(xmlPullParser.nextText());
                    }
                } else if (next == 3 && xmlPullParser.getName().equals(AgentInfo.ELEMENT_NAME)) {
                    z = true;
                }
            }
            return agentInfo;
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append("http://jivesoftware.com/protocol/workgroup").append("\">");
        if (this.jid != null) {
            sb.append("<jid>").append(getJid()).append("</jid>");
        }
        if (this.name != null) {
            sb.append("<name>").append(getName()).append("</name>");
        }
        sb.append("</").append(ELEMENT_NAME).append("> ");
        return sb.toString();
    }

    public String getJid() {
        return this.jid;
    }

    public String getName() {
        return this.name;
    }

    public void setJid(String str) {
        this.jid = str;
    }

    public void setName(String str) {
        this.name = str;
    }
}
