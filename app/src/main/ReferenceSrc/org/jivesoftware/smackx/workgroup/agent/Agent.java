package org.jivesoftware.smackx.workgroup.agent;

import java.util.Collection;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.workgroup.packet.AgentInfo;
import org.jivesoftware.smackx.workgroup.packet.AgentWorkgroups;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/Agent.class */
public class Agent {
    private Connection connection;
    private String workgroupJID;

    Agent(Connection connection, String str) {
        this.connection = connection;
        this.workgroupJID = str;
    }

    public static Collection<String> getWorkgroups(String str, String str2, Connection connection) throws XMPPException {
        AgentWorkgroups agentWorkgroups = new AgentWorkgroups(str2);
        agentWorkgroups.setTo(str);
        PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(agentWorkgroups.getPacketID()));
        connection.sendPacket(agentWorkgroups);
        AgentWorkgroups agentWorkgroups2 = (AgentWorkgroups) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (agentWorkgroups2 == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (agentWorkgroups2.getError() == null) {
            return agentWorkgroups2.getWorkgroups();
        }
        throw new XMPPException(agentWorkgroups2.getError());
    }

    public String getName() throws XMPPException {
        AgentInfo agentInfo = new AgentInfo();
        agentInfo.setType(IQ.Type.GET);
        agentInfo.setTo(this.workgroupJID);
        agentInfo.setFrom(getUser());
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(agentInfo.getPacketID()));
        this.connection.sendPacket(agentInfo);
        AgentInfo agentInfo2 = (AgentInfo) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (agentInfo2 == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (agentInfo2.getError() == null) {
            return agentInfo2.getName();
        }
        throw new XMPPException(agentInfo2.getError());
    }

    public String getUser() {
        return this.connection.getUser();
    }

    public void setName(String str) throws XMPPException {
        AgentInfo agentInfo = new AgentInfo();
        agentInfo.setType(IQ.Type.SET);
        agentInfo.setTo(this.workgroupJID);
        agentInfo.setFrom(getUser());
        agentInfo.setName(str);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(agentInfo.getPacketID()));
        this.connection.sendPacket(agentInfo);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (iq.getError() == null) {
            return;
        }
        throw new XMPPException(iq.getError());
    }
}
