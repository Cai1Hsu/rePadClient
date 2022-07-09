package org.jivesoftware.smackx.bytestreams.ibb.packet;

import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.util.StringUtils;
import org.jivesoftware.smackx.bytestreams.ibb.InBandBytestreamManager;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/packet/DataPacketExtension.class */
public class DataPacketExtension implements PacketExtension {
    public static final String ELEMENT_NAME = "data";
    private final String data;
    private byte[] decodedData;
    private final long seq;
    private final String sessionID;

    public DataPacketExtension(String str, long j, String str2) {
        if (str == null || "".equals(str)) {
            throw new IllegalArgumentException("Session ID must not be null or empty");
        }
        if (j < 0 || j > 65535) {
            throw new IllegalArgumentException("Sequence must not be between 0 and 65535");
        }
        if (str2 == null) {
            throw new IllegalArgumentException("Data must not be null");
        }
        this.sessionID = str;
        this.seq = j;
        this.data = str2;
    }

    public String getData() {
        return this.data;
    }

    public byte[] getDecodedData() {
        byte[] bArr;
        if (this.decodedData != null) {
            bArr = this.decodedData;
        } else if (this.data.matches(".*={1,2}+.+")) {
            bArr = null;
        } else {
            this.decodedData = StringUtils.decodeBase64(this.data);
            bArr = this.decodedData;
        }
        return bArr;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "data";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return InBandBytestreamManager.NAMESPACE;
    }

    public long getSeq() {
        return this.seq;
    }

    public String getSessionID() {
        return this.sessionID;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        return "<" + getElementName() + " xmlns=\"" + InBandBytestreamManager.NAMESPACE + "\" seq=\"" + this.seq + "\" sid=\"" + this.sessionID + "\">" + this.data + "</" + getElementName() + ">";
    }
}
