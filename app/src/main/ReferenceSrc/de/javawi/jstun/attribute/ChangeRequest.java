package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import de.javawi.jstun.util.Utility;
import de.javawi.jstun.util.UtilityException;

/* loaded from: classes.jar:de/javawi/jstun/attribute/ChangeRequest.class */
public class ChangeRequest extends MessageAttribute {
    boolean changeIP = false;
    boolean changePort = false;

    public ChangeRequest() {
        super(MessageAttributeInterface.MessageAttributeType.ChangeRequest);
    }

    public static ChangeRequest parse(byte[] bArr) throws MessageAttributeParsingException {
        try {
            if (bArr.length < 4) {
                throw new MessageAttributeParsingException("Data array too short");
            }
            ChangeRequest changeRequest = new ChangeRequest();
            switch (Utility.oneByteToInteger(bArr[3])) {
                case 0:
                    break;
                case 1:
                case 3:
                case 5:
                default:
                    throw new MessageAttributeParsingException("Status parsing error");
                case 2:
                    changeRequest.setChangePort();
                    break;
                case 4:
                    changeRequest.setChangeIP();
                    break;
                case 6:
                    changeRequest.setChangeIP();
                    changeRequest.setChangePort();
                    break;
            }
            return changeRequest;
        } catch (UtilityException e) {
            throw new MessageAttributeParsingException("Parsing error");
        }
    }

    @Override // de.javawi.jstun.attribute.MessageAttribute
    public byte[] getBytes() throws UtilityException {
        byte[] bArr = new byte[8];
        System.arraycopy(Utility.integerToTwoBytes(typeToInteger(this.type)), 0, bArr, 0, 2);
        System.arraycopy(Utility.integerToTwoBytes(4), 0, bArr, 2, 2);
        if (this.changeIP) {
            bArr[7] = Utility.integerToOneByte(4);
        }
        if (this.changePort) {
            bArr[7] = Utility.integerToOneByte(2);
        }
        if (this.changeIP && this.changePort) {
            bArr[7] = Utility.integerToOneByte(6);
        }
        return bArr;
    }

    public boolean isChangeIP() {
        return this.changeIP;
    }

    public boolean isChangePort() {
        return this.changePort;
    }

    public void setChangeIP() {
        this.changeIP = true;
    }

    public void setChangePort() {
        this.changePort = true;
    }
}
