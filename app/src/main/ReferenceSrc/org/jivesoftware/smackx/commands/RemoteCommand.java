package org.jivesoftware.smackx.commands;

import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.commands.AdHocCommand;
import org.jivesoftware.smackx.packet.AdHocCommandData;

/* loaded from: classes.jar:org/jivesoftware/smackx/commands/RemoteCommand.class */
public class RemoteCommand extends AdHocCommand {
    private Connection connection;
    private String jid;
    private long packetReplyTimeout = SmackConfiguration.getPacketReplyTimeout();
    private String sessionID;

    protected RemoteCommand(Connection connection, String str, String str2) {
        this.connection = connection;
        this.jid = str2;
        setNode(str);
    }

    private void executeAction(AdHocCommand.Action action, long j) throws XMPPException {
        executeAction(action, null, j);
    }

    private void executeAction(AdHocCommand.Action action, Form form, long j) throws XMPPException {
        AdHocCommandData adHocCommandData = new AdHocCommandData();
        adHocCommandData.setType(IQ.Type.SET);
        adHocCommandData.setTo(getOwnerJID());
        adHocCommandData.setNode(getNode());
        adHocCommandData.setSessionID(this.sessionID);
        adHocCommandData.setAction(action);
        if (form != null) {
            adHocCommandData.setForm(form.getDataFormToSend());
        }
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(adHocCommandData.getPacketID()));
        this.connection.sendPacket(adHocCommandData);
        Packet nextResult = createPacketCollector.nextResult(j);
        createPacketCollector.cancel();
        if (nextResult == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (nextResult.getError() != null) {
            throw new XMPPException(nextResult.getError());
        }
        AdHocCommandData adHocCommandData2 = (AdHocCommandData) nextResult;
        this.sessionID = adHocCommandData2.getSessionID();
        super.setData(adHocCommandData2);
    }

    @Override // org.jivesoftware.smackx.commands.AdHocCommand
    public void cancel() throws XMPPException {
        executeAction(AdHocCommand.Action.cancel, this.packetReplyTimeout);
    }

    @Override // org.jivesoftware.smackx.commands.AdHocCommand
    public void complete(Form form) throws XMPPException {
        executeAction(AdHocCommand.Action.complete, form, this.packetReplyTimeout);
    }

    @Override // org.jivesoftware.smackx.commands.AdHocCommand
    public void execute() throws XMPPException {
        executeAction(AdHocCommand.Action.execute, this.packetReplyTimeout);
    }

    public void execute(Form form) throws XMPPException {
        executeAction(AdHocCommand.Action.execute, form, this.packetReplyTimeout);
    }

    @Override // org.jivesoftware.smackx.commands.AdHocCommand
    public String getOwnerJID() {
        return this.jid;
    }

    public long getPacketReplyTimeout() {
        return this.packetReplyTimeout;
    }

    @Override // org.jivesoftware.smackx.commands.AdHocCommand
    public void next(Form form) throws XMPPException {
        executeAction(AdHocCommand.Action.next, form, this.packetReplyTimeout);
    }

    @Override // org.jivesoftware.smackx.commands.AdHocCommand
    public void prev() throws XMPPException {
        executeAction(AdHocCommand.Action.prev, this.packetReplyTimeout);
    }

    public void setPacketReplyTimeout(long j) {
        this.packetReplyTimeout = j;
    }
}
