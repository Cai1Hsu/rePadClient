package org.jivesoftware.smackx.bytestreams.ibb.packet;

import org.jivesoftware.smack.packet.IQ;

/* loaded from: classes.jar:org/jivesoftware/smackx/bytestreams/ibb/packet/Data.class */
public class Data extends IQ {
    private final DataPacketExtension dataPacketExtension;

    public Data(DataPacketExtension dataPacketExtension) {
        if (dataPacketExtension == null) {
            throw new IllegalArgumentException("Data must not be null");
        }
        this.dataPacketExtension = dataPacketExtension;
        addExtension(dataPacketExtension);
        setType(IQ.Type.SET);
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        return this.dataPacketExtension.toXML();
    }

    public DataPacketExtension getDataPacketExtension() {
        return this.dataPacketExtension;
    }
}
