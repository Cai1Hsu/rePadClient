package org.jivesoftware.smackx.workgroup.agent;

import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.ReportedData;
import org.jivesoftware.smackx.workgroup.packet.TranscriptSearch;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/TranscriptSearchManager.class */
public class TranscriptSearchManager {
    private Connection connection;

    public TranscriptSearchManager(Connection connection) {
        this.connection = connection;
    }

    public Form getSearchForm(String str) throws XMPPException {
        TranscriptSearch transcriptSearch = new TranscriptSearch();
        transcriptSearch.setType(IQ.Type.GET);
        transcriptSearch.setTo(str);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(transcriptSearch.getPacketID()));
        this.connection.sendPacket(transcriptSearch);
        TranscriptSearch transcriptSearch2 = (TranscriptSearch) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (transcriptSearch2 == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (transcriptSearch2.getError() == null) {
            return Form.getFormFrom(transcriptSearch2);
        }
        throw new XMPPException(transcriptSearch2.getError());
    }

    public ReportedData submitSearch(String str, Form form) throws XMPPException {
        TranscriptSearch transcriptSearch = new TranscriptSearch();
        transcriptSearch.setType(IQ.Type.GET);
        transcriptSearch.setTo(str);
        transcriptSearch.addExtension(form.getDataFormToSend());
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(transcriptSearch.getPacketID()));
        this.connection.sendPacket(transcriptSearch);
        TranscriptSearch transcriptSearch2 = (TranscriptSearch) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (transcriptSearch2 == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (transcriptSearch2.getError() == null) {
            return ReportedData.getReportedDataFrom(transcriptSearch2);
        }
        throw new XMPPException(transcriptSearch2.getError());
    }
}
