package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import de.javawi.jstun.util.Address;
import de.javawi.jstun.util.Utility;
import de.javawi.jstun.util.UtilityException;

/* loaded from: classes.jar:de/javawi/jstun/attribute/MappedResponseChangedSourceAddressReflectedFrom.class */
public class MappedResponseChangedSourceAddressReflectedFrom extends MessageAttribute {
    Address address;
    int port;

    public MappedResponseChangedSourceAddressReflectedFrom() {
        try {
            this.port = 0;
            this.address = new Address("0.0.0.0");
        } catch (UtilityException e) {
            e.getMessage();
            e.printStackTrace();
        }
    }

    public MappedResponseChangedSourceAddressReflectedFrom(MessageAttributeInterface.MessageAttributeType messageAttributeType) {
        super(messageAttributeType);
    }

    protected static MappedResponseChangedSourceAddressReflectedFrom parse(MappedResponseChangedSourceAddressReflectedFrom mappedResponseChangedSourceAddressReflectedFrom, byte[] bArr) throws MessageAttributeParsingException {
        try {
            if (bArr.length < 8) {
                throw new MessageAttributeParsingException("Data array too short");
            }
            int oneByteToInteger = Utility.oneByteToInteger(bArr[1]);
            if (oneByteToInteger != 1) {
                throw new MessageAttributeParsingException("Family " + oneByteToInteger + " is not supported");
            }
            byte[] bArr2 = new byte[2];
            System.arraycopy(bArr, 2, bArr2, 0, 2);
            mappedResponseChangedSourceAddressReflectedFrom.setPort(Utility.twoBytesToInteger(bArr2));
            mappedResponseChangedSourceAddressReflectedFrom.setAddress(new Address(Utility.oneByteToInteger(bArr[4]), Utility.oneByteToInteger(bArr[5]), Utility.oneByteToInteger(bArr[6]), Utility.oneByteToInteger(bArr[7])));
            return mappedResponseChangedSourceAddressReflectedFrom;
        } catch (MessageAttributeException e) {
            throw new MessageAttributeParsingException("Port parsing error");
        } catch (UtilityException e2) {
            throw new MessageAttributeParsingException("Parsing error");
        }
    }

    public Address getAddress() {
        return this.address;
    }

    @Override // de.javawi.jstun.attribute.MessageAttribute
    public byte[] getBytes() throws UtilityException {
        byte[] bArr = new byte[12];
        System.arraycopy(Utility.integerToTwoBytes(typeToInteger(this.type)), 0, bArr, 0, 2);
        System.arraycopy(Utility.integerToTwoBytes(8), 0, bArr, 2, 2);
        bArr[5] = Utility.integerToOneByte(1);
        System.arraycopy(Utility.integerToTwoBytes(this.port), 0, bArr, 6, 2);
        System.arraycopy(this.address.getBytes(), 0, bArr, 8, 4);
        return bArr;
    }

    public int getPort() {
        return this.port;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public void setPort(int i) throws MessageAttributeException {
        if (i > 65536 || i < 0) {
            throw new MessageAttributeException("Port value " + i + " out of range.");
        }
        this.port = i;
    }

    public String toString() {
        return "Address " + this.address.toString() + ", Port " + this.port;
    }
}
