package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import de.javawi.jstun.util.Utility;
import de.javawi.jstun.util.UtilityException;
import java.util.Iterator;
import java.util.Vector;

/* loaded from: classes.jar:de/javawi/jstun/attribute/UnknownAttribute.class */
public class UnknownAttribute extends MessageAttribute {
    Vector<MessageAttributeInterface.MessageAttributeType> unkown = new Vector<>();

    public UnknownAttribute() {
        super(MessageAttributeInterface.MessageAttributeType.UnknownAttribute);
    }

    public static UnknownAttribute parse(byte[] bArr) throws MessageAttributeParsingException {
        try {
            UnknownAttribute unknownAttribute = new UnknownAttribute();
            if (bArr.length % 4 != 0) {
                throw new MessageAttributeParsingException("Data array too short");
            }
            for (int i = 0; i < bArr.length; i += 4) {
                byte[] bArr2 = new byte[4];
                System.arraycopy(bArr, i, bArr2, 0, 4);
                unknownAttribute.addAttribute(MessageAttribute.intToType(Utility.fourBytesToLong(bArr2)));
            }
            return unknownAttribute;
        } catch (UtilityException e) {
            throw new MessageAttributeParsingException("Parsing error");
        }
    }

    public void addAttribute(MessageAttributeInterface.MessageAttributeType messageAttributeType) {
        this.unkown.add(messageAttributeType);
    }

    @Override // de.javawi.jstun.attribute.MessageAttribute
    public byte[] getBytes() throws UtilityException {
        int size = this.unkown.size() % 2 == 1 ? ((this.unkown.size() + 1) * 2) + 4 : (this.unkown.size() * 2) + 4;
        byte[] bArr = new byte[size];
        System.arraycopy(Utility.integerToTwoBytes(typeToInteger(this.type)), 0, bArr, 0, 2);
        System.arraycopy(Utility.integerToTwoBytes(size - 4), 0, bArr, 2, 2);
        Iterator<MessageAttributeInterface.MessageAttributeType> it = this.unkown.iterator();
        while (it.hasNext()) {
            System.arraycopy(Utility.integerToTwoBytes(typeToInteger(it.next())), 0, bArr, 4, 2);
        }
        if (this.unkown.size() % 2 == 1) {
            System.arraycopy(Utility.integerToTwoBytes(typeToInteger(this.unkown.elementAt(1))), 0, bArr, 4, 2);
        }
        return bArr;
    }
}
