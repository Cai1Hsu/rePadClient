package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import de.javawi.jstun.util.Utility;
import de.javawi.jstun.util.UtilityException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: classes.jar:de/javawi/jstun/attribute/MessageAttribute.class */
public abstract class MessageAttribute implements MessageAttributeInterface {
    private static final Log LOGGER = LogFactory.getLog(MessageAttribute.class);
    MessageAttributeInterface.MessageAttributeType type;

    public MessageAttribute() {
    }

    public MessageAttribute(MessageAttributeInterface.MessageAttributeType messageAttributeType) {
        setType(messageAttributeType);
    }

    public static MessageAttributeInterface.MessageAttributeType intToType(long j) {
        return j == 1 ? MessageAttributeInterface.MessageAttributeType.MappedAddress : j == 2 ? MessageAttributeInterface.MessageAttributeType.ResponseAddress : j == 3 ? MessageAttributeInterface.MessageAttributeType.ChangeRequest : j == 4 ? MessageAttributeInterface.MessageAttributeType.SourceAddress : j == 5 ? MessageAttributeInterface.MessageAttributeType.ChangedAddress : j == 6 ? MessageAttributeInterface.MessageAttributeType.Username : j == 7 ? MessageAttributeInterface.MessageAttributeType.Password : j == 8 ? MessageAttributeInterface.MessageAttributeType.MessageIntegrity : j == 9 ? MessageAttributeInterface.MessageAttributeType.ErrorCode : j == 10 ? MessageAttributeInterface.MessageAttributeType.UnknownAttribute : j == 11 ? MessageAttributeInterface.MessageAttributeType.ReflectedFrom : j == 0 ? MessageAttributeInterface.MessageAttributeType.Dummy : null;
    }

    public static MessageAttribute parseCommonHeader(byte[] bArr) throws MessageAttributeParsingException {
        MessageAttribute parse;
        try {
            byte[] bArr2 = new byte[2];
            System.arraycopy(bArr, 0, bArr2, 0, 2);
            int twoBytesToInteger = Utility.twoBytesToInteger(bArr2);
            byte[] bArr3 = new byte[2];
            System.arraycopy(bArr, 2, bArr3, 0, 2);
            int twoBytesToInteger2 = Utility.twoBytesToInteger(bArr3);
            byte[] bArr4 = new byte[twoBytesToInteger2];
            System.arraycopy(bArr, 4, bArr4, 0, twoBytesToInteger2);
            switch (twoBytesToInteger) {
                case 1:
                    parse = MappedAddress.parse(bArr4);
                    break;
                case 2:
                    parse = ResponseAddress.parse(bArr4);
                    break;
                case 3:
                    parse = ChangeRequest.parse(bArr4);
                    break;
                case 4:
                    parse = SourceAddress.parse(bArr4);
                    break;
                case 5:
                    parse = ChangedAddress.parse(bArr4);
                    break;
                case 6:
                    parse = Username.parse(bArr4);
                    break;
                case 7:
                    parse = Password.parse(bArr4);
                    break;
                case 8:
                    parse = MessageIntegrity.parse(bArr4);
                    break;
                case 9:
                    parse = ErrorCode.parse(bArr4);
                    break;
                case 10:
                    parse = UnknownAttribute.parse(bArr4);
                    break;
                case 11:
                    parse = ReflectedFrom.parse(bArr4);
                    break;
                default:
                    if (twoBytesToInteger > 32767) {
                        LOGGER.debug("MessageAttribute with type " + twoBytesToInteger + " unkown.");
                        parse = Dummy.parse(bArr4);
                        break;
                    } else {
                        throw new UnknownMessageAttributeException("Unkown mandatory message attribute", intToType(twoBytesToInteger));
                    }
            }
            return parse;
        } catch (UtilityException e) {
            throw new MessageAttributeParsingException("Parsing error");
        }
    }

    public static int typeToInteger(MessageAttributeInterface.MessageAttributeType messageAttributeType) {
        return messageAttributeType == MessageAttributeInterface.MessageAttributeType.MappedAddress ? 1 : messageAttributeType == MessageAttributeInterface.MessageAttributeType.ResponseAddress ? 2 : messageAttributeType == MessageAttributeInterface.MessageAttributeType.ChangeRequest ? 3 : messageAttributeType == MessageAttributeInterface.MessageAttributeType.SourceAddress ? 4 : messageAttributeType == MessageAttributeInterface.MessageAttributeType.ChangedAddress ? 5 : messageAttributeType == MessageAttributeInterface.MessageAttributeType.Username ? 6 : messageAttributeType == MessageAttributeInterface.MessageAttributeType.Password ? 7 : messageAttributeType == MessageAttributeInterface.MessageAttributeType.MessageIntegrity ? 8 : messageAttributeType == MessageAttributeInterface.MessageAttributeType.ErrorCode ? 9 : messageAttributeType == MessageAttributeInterface.MessageAttributeType.UnknownAttribute ? 10 : messageAttributeType == MessageAttributeInterface.MessageAttributeType.ReflectedFrom ? 11 : messageAttributeType == MessageAttributeInterface.MessageAttributeType.Dummy ? 0 : -1;
    }

    public abstract byte[] getBytes() throws UtilityException;

    public int getLength() throws UtilityException {
        return getBytes().length;
    }

    public MessageAttributeInterface.MessageAttributeType getType() {
        return this.type;
    }

    public void setType(MessageAttributeInterface.MessageAttributeType messageAttributeType) {
        this.type = messageAttributeType;
    }
}
