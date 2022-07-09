package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: classes.jar:de/javawi/jstun/attribute/MappedAddress.class */
public class MappedAddress extends MappedResponseChangedSourceAddressReflectedFrom {
    private static final Log LOGGER = LogFactory.getLog(MappedAddress.class);

    public MappedAddress() {
        super(MessageAttributeInterface.MessageAttributeType.MappedAddress);
    }

    public static MessageAttribute parse(byte[] bArr) throws MessageAttributeParsingException {
        MappedAddress mappedAddress = new MappedAddress();
        MappedResponseChangedSourceAddressReflectedFrom.parse(mappedAddress, bArr);
        LOGGER.debug("Message Attribute: Mapped Address parsed: " + mappedAddress.toString() + ".");
        return mappedAddress;
    }
}
