package org.jivesoftware.smack.packet;

/* loaded from: classes.jar:org/jivesoftware/smack/packet/PacketExtension.class */
public interface PacketExtension {
    String getElementName();

    String getNamespace();

    String toXML();
}
