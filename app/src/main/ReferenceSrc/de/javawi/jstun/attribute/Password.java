package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import de.javawi.jstun.util.Utility;
import de.javawi.jstun.util.UtilityException;

/* loaded from: classes.jar:de/javawi/jstun/attribute/Password.class */
public class Password extends MessageAttribute {
    String password;

    public Password() {
        super(MessageAttributeInterface.MessageAttributeType.Password);
    }

    public Password(String str) {
        super(MessageAttributeInterface.MessageAttributeType.Password);
        setPassword(str);
    }

    public static Password parse(byte[] bArr) {
        Password password = new Password();
        password.setPassword(new String(bArr));
        return password;
    }

    @Override // de.javawi.jstun.attribute.MessageAttribute
    public byte[] getBytes() throws UtilityException {
        int length = this.password.length();
        int i = length;
        if (length % 4 != 0) {
            i = length + (4 - (length % 4));
        }
        int i2 = i + 4;
        byte[] bArr = new byte[i2];
        System.arraycopy(Utility.integerToTwoBytes(typeToInteger(this.type)), 0, bArr, 0, 2);
        System.arraycopy(Utility.integerToTwoBytes(i2 - 4), 0, bArr, 2, 2);
        byte[] bytes = this.password.getBytes();
        System.arraycopy(bytes, 0, bArr, 4, bytes.length);
        return bArr;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String str) {
        this.password = str;
    }
}
