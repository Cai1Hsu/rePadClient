package org.jivesoftware.smackx.bytestreams.ibb.packet;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamManager;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/packet/Open.class */
public class Open extends IQ {
    private final int blockSize;
    private final String sessionID;
    private final InBandBytestreamManager.StanzaType stanza;

    public Open(String str, int i) {
        this(str, i, InBandBytestreamManager.StanzaType.IQ);
    }

    public Open(String str, int i, InBandBytestreamManager.StanzaType stanzaType) {
        if (str == null || "".equals(str)) {
            throw new IllegalArgumentException("Session ID must not be null or empty");
        }
        if (i <= 0) {
            throw new IllegalArgumentException("Block size must be greater than zero");
        }
        this.sessionID = str;
        this.blockSize = i;
        this.stanza = stanzaType;
        setType(IQ.Type.SET);
    }

    public int getBlockSize() {
        return this.blockSize;
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        return "<open xmlns=\"" + InBandBytestreamManager.NAMESPACE + "\" block-size=\"" + this.blockSize + "\" sid=\"" + this.sessionID + "\" stanza=\"" + this.stanza.toString().toLowerCase() + "\"/>";
    }

    public String getSessionID() {
        return this.sessionID;
    }

    public InBandBytestreamManager.StanzaType getStanza() {
        return this.stanza;
    }
}
