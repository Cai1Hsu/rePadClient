package org.jivesoftware.smackx.workgroup;

import java.util.List;
import java.util.Map;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.workgroup.util.MetaDataUtils;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/MetaData.class */
public class MetaData implements PacketExtension {
    public static final String ELEMENT_NAME = "metadata";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";
    private Map<String, List<String>> metaData;

    public MetaData(Map<String, List<String>> map) {
        this.metaData = map;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return ELEMENT_NAME;
    }

    public Map<String, List<String>> getMetaData() {
        return this.metaData;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return "http://jivesoftware.com/protocol/workgroup";
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        return MetaDataUtils.serializeMetaData(getMetaData());
    }
}
