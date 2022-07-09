package org.jivesoftware.smackx.workgroup.packet;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/AgentStatusRequest.class */
public class AgentStatusRequest extends IQ {
    public static final String ELEMENT_NAME = "agent-status-request";
    public static final String NAMESPACE = "http://jabber.org/protocol/workgroup";
    private Set<Item> agents = new HashSet();

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Item.class */
    public static class Item {
        private String jid;
        private String name;
        private String type;

        public Item(String str, String str2, String str3) {
            this.jid = str;
            this.type = str2;
            this.name = str3;
        }

        public String getJID() {
            return this.jid;
        }

        public String getName() {
            return this.name;
        }

        public String getType() {
            return this.type;
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Provider.class */
    public static class Provider implements IQProvider {
        private Item parseAgent(XmlPullParser xmlPullParser) throws Exception {
            boolean z = false;
            String attributeValue = xmlPullParser.getAttributeValue("", "jid");
            String attributeValue2 = xmlPullParser.getAttributeValue("", "type");
            String str = null;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2 && "name".equals(xmlPullParser.getName())) {
                    str = xmlPullParser.nextText();
                } else if (next == 3 && "agent".equals(xmlPullParser.getName())) {
                    z = true;
                }
            }
            return new Item(attributeValue, attributeValue2, str);
        }

        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            AgentStatusRequest agentStatusRequest = new AgentStatusRequest();
            if (xmlPullParser.getEventType() != 2) {
                throw new IllegalStateException("Parser not in proper position, or bad XML.");
            }
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2 && "agent".equals(xmlPullParser.getName())) {
                    agentStatusRequest.agents.add(parseAgent(xmlPullParser));
                } else if (next == 3 && AgentStatusRequest.ELEMENT_NAME.equals(xmlPullParser.getName())) {
                    z = true;
                }
            }
            return agentStatusRequest;
        }
    }

    public int getAgentCount() {
        return this.agents.size();
    }

    public Set<Item> getAgents() {
        return Collections.unmodifiableSet(this.agents);
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append("http://jabber.org/protocol/workgroup").append("\">");
        synchronized (this.agents) {
            for (Item item : this.agents) {
                sb.append("<agent jid=\"").append(item.getJID()).append("\">");
                if (item.getName() != null) {
                    sb.append("<name xmlns=\"http://jivesoftware.com/protocol/workgroup\">");
                    sb.append(item.getName());
                    sb.append("</name>");
                }
                sb.append("</agent>");
            }
        }
        sb.append("</").append(getElementName()).append("> ");
        return sb.toString();
    }

    public String getElementName() {
        return ELEMENT_NAME;
    }

    public String getNamespace() {
        return "http://jabber.org/protocol/workgroup";
    }
}
