package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/FieldRefCPInfo.class */
public class FieldRefCPInfo extends ConstantPoolEntry {
    private int classIndex;
    private String fieldClassName;
    private String fieldName;
    private String fieldType;
    private int nameAndTypeIndex;

    public FieldRefCPInfo() {
        super(9, 1);
    }

    public String getFieldClassName() {
        return this.fieldClassName;
    }

    public String getFieldName() {
        return this.fieldName;
    }

    public String getFieldType() {
        return this.fieldType;
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
        this.fieldClassName = classCPInfo.getClassName();
        NameAndTypeCPInfo nameAndTypeCPInfo = (NameAndTypeCPInfo) constantPool.getEntry(this.nameAndTypeIndex);
        nameAndTypeCPInfo.resolve(constantPool);
        this.fieldName = nameAndTypeCPInfo.getName();
        this.fieldType = nameAndTypeCPInfo.getType();
        super.resolve(constantPool);
    }

    public String toString() {
        return isResolved() ? new StringBuffer().append("Field : Class = ").append(this.fieldClassName).append(", name = ").append(this.fieldName).append(", type = ").append(this.fieldType).toString() : new StringBuffer().append("Field : Class index = ").append(this.classIndex).append(", name and type index = ").append(this.nameAndTypeIndex).toString();
    }
}
