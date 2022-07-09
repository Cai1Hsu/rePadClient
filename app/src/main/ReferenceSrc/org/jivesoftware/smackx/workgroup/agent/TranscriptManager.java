package org.jivesoftware.smackx.workgroup.agent;

import org.jivesoftware.smack.Connection;
import org.jivesoftware.smack.PacketCollector;
import org.jivesoftware.smack.SmackConfiguration;
import org.jivesoftware.smack.XMPPException;
import org.jivesoftware.smack.filter.PacketIDFilter;
import org.jivesoftware.smackx.workgroup.packet.Transcript;
import org.jivesoftware.smackx.workgroup.packet.Transcripts;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/agent/TranscriptManager.class */
public class TranscriptManager {
    private Connection connection;

    public TranscriptManager(Connection connection) {
        this.connection = connection;
    }

    public Transcript getTranscript(String str, String str2) throws XMPPException {
        Transcript transcript = new Transcript(str2);
        transcript.setTo(str);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(transcript.getPacketID()));
        this.connection.sendPacket(transcript);
        Transcript transcript2 = (Transcript) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (transcript2 == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (transcript2.getError() == null) {
            return transcript2;
        }
        throw new XMPPException(transcript2.getError());
    }

    public Transcripts getTranscripts(String str, String str2) throws XMPPException {
        Transcripts transcripts = new Transcripts(str2);
        transcripts.setTo(str);
        PacketCollector createPacketCollector = this.connection.createPacketCollector(new PacketIDFilter(transcripts.getPacketID()));
        this.connection.sendPacket(transcripts);
        Transcripts transcripts2 = (Transcripts) createPacketCollector.nextResult(SmackConfiguration.getPacketReplyTimeout());
        createPacketCollector.cancel();
        if (transcripts2 == null) {
            throw new XMPPException("No response from server on status set.");
        }
        if (transcripts2.getError() == null) {
            return transcripts2;
        }
        throw new XMPPException(transcripts2.getError());
    }
}
