package de.javawi.jstun.attribute;

import de.javawi.jstun.attribute.MessageAttributeInterface;
import de.javawi.jstun.util.Utility;
import de.javawi.jstun.util.UtilityException;

/* loaded from: classes.jar:de/javawi/jstun/attribute/Username.class */
public class Username extends MessageAttribute {
    String username;

    public Username() {
        super(MessageAttributeInterface.MessageAttributeType.Username);
    }

    public Username(String str) {
        super(MessageAttributeInterface.MessageAttributeType.Username);
        setUsername(str);
    }

    public static Username parse(byte[] bArr) {
        Username username = new Username();
        username.setUsername(new String(bArr));
        return username;
    }

    @Override // de.javawi.jstun.attribute.MessageAttribute
    public byte[] getBytes() throws UtilityException {
        int length = this.username.length();
        int i = length;
        if (length % 4 != 0) {
            i = length + (4 - (length % 4));
        }
        int i2 = i + 4;
        byte[] bArr = new byte[i2];
        System.arraycopy(Utility.integerToTwoBytes(typeToInteger(this.type)), 0, bArr, 0, 2);
        System.arraycopy(Utility.integerToTwoBytes(i2 - 4), 0, bArr, 2, 2);
        byte[] bytes = this.username.getBytes();
        System.arraycopy(bytes, 0, bArr, 4, bytes.length);
        return bArr;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String str) {
        this.username = str;
    }
}
