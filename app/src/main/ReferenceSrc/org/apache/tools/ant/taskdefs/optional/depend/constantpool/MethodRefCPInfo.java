package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/MethodRefCPInfo.class */
public class MethodRefCPInfo extends ConstantPoolEntry {
    private int classIndex;
    private String methodClassName;
    private String methodName;
    private String methodType;
    private int nameAndTypeIndex;

    public MethodRefCPInfo() {
        super(10, 1);
    }

    public String getMethodClassName() {
        return this.methodClassName;
    }

    public String getMethodName() {
        return this.methodName;
    }

    public String getMethodType() {
        return this.methodType;
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
        this.methodClassName = classCPInfo.getClassName();
        NameAndTypeCPInfo nameAndTypeCPInfo = (NameAndTypeCPInfo) constantPool.getEntry(this.nameAndTypeIndex);
        nameAndTypeCPInfo.resolve(constantPool);
        this.methodName = nameAndTypeCPInfo.getName();
        this.methodType = nameAndTypeCPInfo.getType();
        super.resolve(constantPool);
    }

    public String toString() {
        return isResolved() ? new StringBuffer().append("Method : Class = ").append(this.methodClassName).append(", name = ").append(this.methodName).append(", type = ").append(this.methodType).toString() : new StringBuffer().append("Method : Class index = ").append(this.classIndex).append(", name and type index = ").append(this.nameAndTypeIndex).toString();
    }
}
