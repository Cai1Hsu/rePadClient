package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: classes.jar:de/javawi/jstun/attribute/ResponseAddress.class */
public class ResponseAddress extends MappedResponseChangedSourceAddressReflectedFrom {
    private static final Log LOGGER = LogFactory.getLog(ResponseAddress.class);

    public ResponseAddress() {
        super(MessageAttributeInterface.MessageAttributeType.ResponseAddress);
    }

    public static MessageAttribute parse(byte[] bArr) throws MessageAttributeParsingException {
        ResponseAddress responseAddress = new ResponseAddress();
        MappedResponseChangedSourceAddressReflectedFrom.parse(responseAddress, bArr);
        LOGGER.debug("Message Attribute: Response Address parsed: " + responseAddress.toString() + ".");
        return responseAddress;
    }
}
