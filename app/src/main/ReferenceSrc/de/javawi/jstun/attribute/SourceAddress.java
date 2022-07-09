package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: classes.jar:de/javawi/jstun/attribute/SourceAddress.class */
public class SourceAddress extends MappedResponseChangedSourceAddressReflectedFrom {
    private static final Log LOGGER = LogFactory.getLog(SourceAddress.class);

    public SourceAddress() {
        super(MessageAttributeInterface.MessageAttributeType.SourceAddress);
    }

    public static MessageAttribute parse(byte[] bArr) throws MessageAttributeParsingException {
        SourceAddress sourceAddress = new SourceAddress();
        MappedResponseChangedSourceAddressReflectedFrom.parse(sourceAddress, bArr);
        LOGGER.debug("Message Attribute: Source Address parsed: " + sourceAddress.toString() + ".");
        return sourceAddress;
    }
}
