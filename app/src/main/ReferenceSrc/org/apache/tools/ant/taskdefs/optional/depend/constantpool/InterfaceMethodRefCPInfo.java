package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/InterfaceMethodRefCPInfo.class */
public class InterfaceMethodRefCPInfo extends ConstantPoolEntry {
    private int classIndex;
    private String interfaceMethodClassName;
    private String interfaceMethodName;
    private String interfaceMethodType;
    private int nameAndTypeIndex;

    public InterfaceMethodRefCPInfo() {
        super(11, 1);
    }

    public String getInterfaceMethodClassName() {
        return this.interfaceMethodClassName;
    }

    public String getInterfaceMethodName() {
        return this.interfaceMethodName;
    }

    public String getInterfaceMethodType() {
        return this.interfaceMethodType;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void read(DataInputStream dataInputStream) throws IOException {
        this.classIndex = dataInputStream.readUnsignedShort();
        this.nameAndTypeIndex = dataInputStream.readUnsignedShort();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void resolve(ConstantPool constantPool) {
        ClassCPInfo classCPInfo = (ClassCPInfo) constantPool.getEntry(this.classIndex);
        classCPInfo.resolve(constantPool);
        this.interfaceMethodClassName = classCPInfo.getClassName();
        NameAndTypeCPInfo nameAndTypeCPInfo = (NameAndTypeCPInfo) constantPool.getEntry(this.nameAndTypeIndex);
        nameAndTypeCPInfo.resolve(constantPool);
        this.interfaceMethodName = nameAndTypeCPInfo.getName();
        this.interfaceMethodType = nameAndTypeCPInfo.getType();
        super.resolve(constantPool);
    }

    public String toString() {
        return isResolved() ? new StringBuffer().append("InterfaceMethod : Class = ").append(this.interfaceMethodClassName).append(", name = ").append(this.interfaceMethodName).append(", type = ").append(this.interfaceMethodType).toString() : new StringBuffer().append("InterfaceMethod : Class index = ").append(this.classIndex).append(", name and type index = ").append(this.nameAndTypeIndex).toString();
    }
}
