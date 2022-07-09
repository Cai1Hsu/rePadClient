package org.apache.tools.ant.taskdefs.optional.jlink;

import java.io.DataInput;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jlink/ConstantPool.class */
class ConstantPool {
    static final byte CLASS = 7;
    static final byte DOUBLE = 6;
    static final byte FIELDREF = 9;
    static final byte FLOAT = 4;
    static final byte INTEGER = 3;
    static final byte INTERFACEMETHODREF = 11;
    static final byte LONG = 5;
    static final byte METHODREF = 10;
    static final byte NAMEANDTYPE = 12;
    static final byte STRING = 8;
    static final byte UNUSED = 2;
    static final byte UTF8 = 1;
    byte[] types;
    Object[] values;

    ConstantPool(DataInput dataInput) throws IOException {
        int readUnsignedShort = dataInput.readUnsignedShort();
        this.types = new byte[readUnsignedShort];
        this.values = new Object[readUnsignedShort];
        int i = 1;
        while (true) {
            int i2 = i;
            if (i2 < readUnsignedShort) {
                byte readByte = dataInput.readByte();
                this.types[i2] = readByte;
                int i3 = i2;
                switch (readByte) {
                    case 1:
                        this.values[i2] = dataInput.readUTF();
                        i3 = i2;
                        break;
                    case 2:
                        break;
                    case 3:
                        this.values[i2] = new Integer(dataInput.readInt());
                        i3 = i2;
                        break;
                    case 4:
                        this.values[i2] = new Float(dataInput.readFloat());
                        i3 = i2;
                        break;
                    case 5:
                        this.values[i2] = new Long(dataInput.readLong());
                        i3 = i2 + 1;
                        break;
                    case 6:
                        this.values[i2] = new Double(dataInput.readDouble());
                        i3 = i2 + 1;
                        break;
                    case 7:
                    case 8:
                        this.values[i2] = new Integer(dataInput.readUnsignedShort());
                        i3 = i2;
                        break;
                    case 9:
                    case 10:
                    case 11:
                    case 12:
                        this.values[i2] = new Integer(dataInput.readInt());
                        i3 = i2;
                        break;
                    default:
                        i3 = i2;
                        break;
                }
                i = i3 + 1;
            } else {
                return;
            }
        }
    }
}
