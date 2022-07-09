package de.javawi.jstun.header;

import de.javawi.jstun.attribute.MessageAttribute;
import de.javawi.jstun.attribute.MessageAttributeInterface;
import de.javawi.jstun.attribute.MessageAttributeParsingException;
import de.javawi.jstun.header.MessageHeaderInterface;
import de.javawi.jstun.util.Utility;
import de.javawi.jstun.util.UtilityException;
import java.util.TreeMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: classes.jar:de/javawi/jstun/header/MessageHeader.class */
public class MessageHeader implements MessageHeaderInterface {
    private static final Log LOGGER = LogFactory.getLog(MessageHeader.class);
    byte[] id;
    TreeMap<MessageAttributeInterface.MessageAttributeType, MessageAttribute> ma;
    MessageHeaderInterface.MessageHeaderType type;

    public MessageHeader() {
        this.id = new byte[16];
        this.ma = new TreeMap<>();
    }

    public MessageHeader(MessageHeaderInterface.MessageHeaderType messageHeaderType) {
        this.id = new byte[16];
        this.ma = new TreeMap<>();
        setType(messageHeaderType);
    }

    public static MessageHeader parseHeader(byte[] bArr) throws MessageHeaderParsingException {
        try {
            MessageHeader messageHeader = new MessageHeader();
            byte[] bArr2 = new byte[2];
            System.arraycopy(bArr, 0, bArr2, 0, 2);
            int twoBytesToInteger = Utility.twoBytesToInteger(bArr2);
            switch (twoBytesToInteger) {
                case 1:
                    messageHeader.setType(MessageHeaderInterface.MessageHeaderType.BindingRequest);
                    LOGGER.debug("Binding Request received.");
                    break;
                case 2:
                    messageHeader.setType(MessageHeaderInterface.MessageHeaderType.SharedSecretRequest);
                    LOGGER.debug("Shared Secret Request received.");
                    break;
                case 257:
                    messageHeader.setType(MessageHeaderInterface.MessageHeaderType.BindingResponse);
                    LOGGER.debug("Binding Response received.");
                    break;
                case 258:
                    messageHeader.setType(MessageHeaderInterface.MessageHeaderType.SharedSecretResponse);
                    LOGGER.debug("Shared Secret Response received.");
                    break;
                case MessageHeaderInterface.BINDINGERRORRESPONSE /* 273 */:
                    messageHeader.setType(MessageHeaderInterface.MessageHeaderType.BindingErrorResponse);
                    LOGGER.debug("Binding Error Response received.");
                    break;
                case MessageHeaderInterface.SHAREDSECRETERRORRESPONSE /* 274 */:
                    messageHeader.setType(MessageHeaderInterface.MessageHeaderType.SharedSecretErrorResponse);
                    LOGGER.debug("Shared Secret Error Response received.");
                    break;
                default:
                    throw new MessageHeaderParsingException("Message type " + twoBytesToInteger + "is not supported");
            }
            return messageHeader;
        } catch (UtilityException e) {
            throw new MessageHeaderParsingException("Parsing error");
        }
    }

    public static int typeToInteger(MessageHeaderInterface.MessageHeaderType messageHeaderType) {
        return messageHeaderType == MessageHeaderInterface.MessageHeaderType.BindingRequest ? 1 : messageHeaderType == MessageHeaderInterface.MessageHeaderType.BindingResponse ? 257 : messageHeaderType == MessageHeaderInterface.MessageHeaderType.BindingErrorResponse ? 273 : messageHeaderType == MessageHeaderInterface.MessageHeaderType.SharedSecretRequest ? 2 : messageHeaderType == MessageHeaderInterface.MessageHeaderType.SharedSecretResponse ? 258 : messageHeaderType == MessageHeaderInterface.MessageHeaderType.SharedSecretErrorResponse ? 274 : -1;
    }

    public void addMessageAttribute(MessageAttribute messageAttribute) {
        this.ma.put(messageAttribute.getType(), messageAttribute);
    }

    public boolean equalTransactionID(MessageHeader messageHeader) {
        boolean z;
        byte[] transactionID = messageHeader.getTransactionID();
        if (transactionID.length != 16) {
            z = false;
        } else {
            z = false;
            if (transactionID[0] == this.id[0]) {
                z = false;
                if (transactionID[1] == this.id[1]) {
                    z = false;
                    if (transactionID[2] == this.id[2]) {
                        z = false;
                        if (transactionID[3] == this.id[3]) {
                            z = false;
                            if (transactionID[4] == this.id[4]) {
                                z = false;
                                if (transactionID[5] == this.id[5]) {
                                    z = false;
                                    if (transactionID[6] == this.id[6]) {
                                        z = false;
                                        if (transactionID[7] == this.id[7]) {
                                            z = false;
                                            if (transactionID[8] == this.id[8]) {
                                                z = false;
                                                if (transactionID[9] == this.id[9]) {
                                                    z = false;
                                                    if (transactionID[10] == this.id[10]) {
                                                        z = false;
                                                        if (transactionID[11] == this.id[11]) {
                                                            z = false;
                                                            if (transactionID[12] == this.id[12]) {
                                                                z = false;
                                                                if (transactionID[13] == this.id[13]) {
                                                                    z = false;
                                                                    if (transactionID[14] == this.id[14]) {
                                                                        z = false;
                                                                        if (transactionID[15] == this.id[15]) {
                                                                            z = true;
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return z;
    }

    public void generateTransactionID() throws UtilityException {
        System.arraycopy(Utility.integerToTwoBytes((int) (Math.random() * 65536.0d)), 0, this.id, 0, 2);
        System.arraycopy(Utility.integerToTwoBytes((int) (Math.random() * 65536.0d)), 0, this.id, 2, 2);
        System.arraycopy(Utility.integerToTwoBytes((int) (Math.random() * 65536.0d)), 0, this.id, 4, 2);
        System.arraycopy(Utility.integerToTwoBytes((int) (Math.random() * 65536.0d)), 0, this.id, 6, 2);
        System.arraycopy(Utility.integerToTwoBytes((int) (Math.random() * 65536.0d)), 0, this.id, 8, 2);
        System.arraycopy(Utility.integerToTwoBytes((int) (Math.random() * 65536.0d)), 0, this.id, 10, 2);
        System.arraycopy(Utility.integerToTwoBytes((int) (Math.random() * 65536.0d)), 0, this.id, 12, 2);
        System.arraycopy(Utility.integerToTwoBytes((int) (Math.random() * 65536.0d)), 0, this.id, 14, 2);
    }

    public byte[] getBytes() throws UtilityException {
        int i = 20;
        for (MessageAttributeInterface.MessageAttributeType messageAttributeType : this.ma.keySet()) {
            i += this.ma.get(messageAttributeType).getLength();
        }
        byte[] bArr = new byte[i];
        System.arraycopy(Utility.integerToTwoBytes(typeToInteger(this.type)), 0, bArr, 0, 2);
        System.arraycopy(Utility.integerToTwoBytes(i - 20), 0, bArr, 2, 2);
        System.arraycopy(this.id, 0, bArr, 4, 16);
        int i2 = 20;
        for (MessageAttributeInterface.MessageAttributeType messageAttributeType2 : this.ma.keySet()) {
            MessageAttribute messageAttribute = this.ma.get(messageAttributeType2);
            System.arraycopy(messageAttribute.getBytes(), 0, bArr, i2, messageAttribute.getLength());
            i2 += messageAttribute.getLength();
        }
        return bArr;
    }

    public int getLength() throws UtilityException {
        return getBytes().length;
    }

    public MessageAttribute getMessageAttribute(MessageAttributeInterface.MessageAttributeType messageAttributeType) {
        return this.ma.get(messageAttributeType);
    }

    public byte[] getTransactionID() {
        byte[] bArr = new byte[this.id.length];
        System.arraycopy(this.id, 0, bArr, 0, this.id.length);
        return bArr;
    }

    public MessageHeaderInterface.MessageHeaderType getType() {
        return this.type;
    }

    public void parseAttributes(byte[] bArr) throws MessageAttributeParsingException {
        try {
            byte[] bArr2 = new byte[2];
            System.arraycopy(bArr, 2, bArr2, 0, 2);
            int twoBytesToInteger = Utility.twoBytesToInteger(bArr2);
            System.arraycopy(bArr, 4, this.id, 0, 16);
            int i = 20;
            while (true) {
                int i2 = i;
                if (twoBytesToInteger <= 0) {
                    return;
                }
                byte[] bArr3 = new byte[twoBytesToInteger];
                System.arraycopy(bArr, i2, bArr3, 0, twoBytesToInteger);
                MessageAttribute parseCommonHeader = MessageAttribute.parseCommonHeader(bArr3);
                addMessageAttribute(parseCommonHeader);
                twoBytesToInteger -= parseCommonHeader.getLength();
                i = i2 + parseCommonHeader.getLength();
            }
        } catch (UtilityException e) {
            throw new MessageAttributeParsingException("Parsing error");
        }
    }

    public void setTransactionID(byte[] bArr) {
        System.arraycopy(bArr, 0, this.id, 0, 16);
    }

    public void setType(MessageHeaderInterface.MessageHeaderType messageHeaderType) {
        this.type = messageHeaderType;
    }
}
