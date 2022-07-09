package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: classes.jar:de/javawi/jstun/attribute/ChangedAddress.class */
public class ChangedAddress extends MappedResponseChangedSourceAddressReflectedFrom {
    private static final Log LOGGER = LogFactory.getLog(ChangedAddress.class);

    public ChangedAddress() {
        super(MessageAttributeInterface.MessageAttributeType.ChangedAddress);
    }

    public static MessageAttribute parse(byte[] bArr) throws MessageAttributeParsingException {
        ChangedAddress changedAddress = new ChangedAddress();
        MappedResponseChangedSourceAddressReflectedFrom.parse(changedAddress, bArr);
        LOGGER.debug("Message Attribute: Changed Address parsed: " + changedAddress.toString() + ".");
        return changedAddress;
    }
}
