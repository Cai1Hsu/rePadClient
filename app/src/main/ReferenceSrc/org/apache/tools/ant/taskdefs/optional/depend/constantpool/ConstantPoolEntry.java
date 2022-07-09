package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/ConstantPoolEntry.class */
public abstract class ConstantPoolEntry {
    public static final int CONSTANT_CLASS = 7;
    public static final int CONSTANT_DOUBLE = 6;
    public static final int CONSTANT_FIELDREF = 9;
    public static final int CONSTANT_FLOAT = 4;
    public static final int CONSTANT_INTEGER = 3;
    public static final int CONSTANT_INTERFACEMETHODREF = 11;
    public static final int CONSTANT_LONG = 5;
    public static final int CONSTANT_METHODREF = 10;
    public static final int CONSTANT_NAMEANDTYPE = 12;
    public static final int CONSTANT_STRING = 8;
    public static final int CONSTANT_UTF8 = 1;
    private int numEntries;
    private boolean resolved = false;
    private int tag;

    public ConstantPoolEntry(int i, int i2) {
        this.tag = i;
        this.numEntries = i2;
    }

    public static ConstantPoolEntry readEntry(DataInputStream dataInputStream) throws IOException {
        ConstantPoolEntry nameAndTypeCPInfo;
        int readUnsignedByte = dataInputStream.readUnsignedByte();
        switch (readUnsignedByte) {
            case 1:
                nameAndTypeCPInfo = new Utf8CPInfo();
                break;
            case 2:
            default:
                throw new ClassFormatError(new StringBuffer().append("Invalid Constant Pool entry Type ").append(readUnsignedByte).toString());
            case 3:
                nameAndTypeCPInfo = new IntegerCPInfo();
                break;
            case 4:
                nameAndTypeCPInfo = new FloatCPInfo();
                break;
            case 5:
                nameAndTypeCPInfo = new LongCPInfo();
                break;
            case 6:
                nameAndTypeCPInfo = new DoubleCPInfo();
                break;
            case 7:
                nameAndTypeCPInfo = new ClassCPInfo();
                break;
            case 8:
                nameAndTypeCPInfo = new StringCPInfo();
                break;
            case 9:
                nameAndTypeCPInfo = new FieldRefCPInfo();
                break;
            case 10:
                nameAndTypeCPInfo = new MethodRefCPInfo();
                break;
            case 11:
                nameAndTypeCPInfo = new InterfaceMethodRefCPInfo();
                break;
            case 12:
                nameAndTypeCPInfo = new NameAndTypeCPInfo();
                break;
        }
        nameAndTypeCPInfo.read(dataInputStream);
        return nameAndTypeCPInfo;
    }

    public final int getNumEntries() {
        return this.numEntries;
    }

    public int getTag() {
        return this.tag;
    }

    public boolean isResolved() {
        return this.resolved;
    }

    public abstract void read(DataInputStream dataInputStream) throws IOException;

    public void resolve(ConstantPool constantPool) {
        this.resolved = true;
    }
}
