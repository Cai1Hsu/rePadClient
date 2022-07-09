package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;

/* loaded from: classes.jar:de/javawi/jstun/attribute/MessageIntegrity.class */
public class MessageIntegrity extends MessageAttribute {
    public MessageIntegrity() {
        super(MessageAttributeInterface.MessageAttributeType.MessageIntegrity);
    }

    public static MessageIntegrity parse(byte[] bArr) {
        return new MessageIntegrity();
    }

    @Override // de.javawi.jstun.attribute.MessageAttribute
    public byte[] getBytes() {
        return new byte[0];
    }
}
