package org.jivesoftware.smackx;

import java.util.List;
import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.packet.SharedGroupsInfo;

/* loaded from: classes.jar:org/jivesoftware/smackx/SharedGroupManager.class */
public class SharedGroupManager {
    public static List<String> getSharedGroups(Connection connection) throws XMPPException {
        SharedGroupsInfo sharedGroupsInfo = new SharedGroupsInfo();
        sharedGroupsInfo.setType(IQ.Type.GET);
        PacketCollector createPacketCollector = connection.createPacketCollector(new PacketIDFilter(sharedGroupsInfo.getPacketID()));
        connection.sendPacket(sharedGroupsInfo);
        IQ iq = (IQ) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (iq == null) {
            throw new XMPPException("No response from the server.");
        }
        if (iq.getType() != IQ.Type.ERROR) {
            return ((SharedGroupsInfo) iq).getGroups();
        }
        throw new XMPPException(iq.getError());
    }
}
