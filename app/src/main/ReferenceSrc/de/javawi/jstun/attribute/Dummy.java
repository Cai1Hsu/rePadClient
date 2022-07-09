package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import de.javawi.jstun.util.Utility;
import de.javawi.jstun.util.UtilityException;

/* loaded from: classes.jar:de/javawi/jstun/attribute/Dummy.class */
public class Dummy extends MessageAttribute {
    int lengthValue;

    public Dummy() {
        super(MessageAttributeInterface.MessageAttributeType.Dummy);
    }

    public static Dummy parse(byte[] bArr) {
        Dummy dummy = new Dummy();
        dummy.setLengthValue(bArr.length);
        return dummy;
    }

    @Override // de.javawi.jstun.attribute.MessageAttribute
    public byte[] getBytes() throws UtilityException {
        byte[] bArr = new byte[this.lengthValue + 4];
        System.arraycopy(Utility.integerToTwoBytes(typeToInteger(this.type)), 0, bArr, 0, 2);
        System.arraycopy(Utility.integerToTwoBytes(this.lengthValue), 0, bArr, 2, 2);
        return bArr;
    }

    public void setLengthValue(int i) {
        this.lengthValue = i;
    }
}
