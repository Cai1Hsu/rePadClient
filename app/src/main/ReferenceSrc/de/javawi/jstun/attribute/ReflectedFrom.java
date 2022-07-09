package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: classes.jar:de/javawi/jstun/attribute/ReflectedFrom.class */
public class ReflectedFrom extends MappedResponseChangedSourceAddressReflectedFrom {
    private static final Log LOGGER = LogFactory.getLog(ReflectedFrom.class);

    public ReflectedFrom() {
        super(MessageAttributeInterface.MessageAttributeType.ReflectedFrom);
    }

    public static ReflectedFrom parse(byte[] bArr) throws MessageAttributeParsingException {
        ReflectedFrom reflectedFrom = new ReflectedFrom();
        MappedResponseChangedSourceAddressReflectedFrom.parse(reflectedFrom, bArr);
        LOGGER.debug("Message Attribute: ReflectedFrom parsed: " + reflectedFrom.toString() + ".");
        return reflectedFrom;
    }
}
