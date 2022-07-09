package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/NameAndTypeCPInfo.class */
public class NameAndTypeCPInfo extends ConstantPoolEntry {
    private int descriptorIndex;
    private String name;
    private int nameIndex;
    private String type;

    public NameAndTypeCPInfo() {
        super(12, 1);
    }

    public String getName() {
        return this.name;
    }

    public String getType() {
        return this.type;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void read(DataInputStream dataInputStream) throws IOException {
        this.nameIndex = dataInputStream.readUnsignedShort();
        this.descriptorIndex = dataInputStream.readUnsignedShort();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void resolve(ConstantPool constantPool) {
        this.name = ((Utf8CPInfo) constantPool.getEntry(this.nameIndex)).getValue();
        this.type = ((Utf8CPInfo) constantPool.getEntry(this.descriptorIndex)).getValue();
        super.resolve(constantPool);
    }

    public String toString() {
        return isResolved() ? new StringBuffer().append("Name = ").append(this.name).append(", type = ").append(this.type).toString() : new StringBuffer().append("Name index = ").append(this.nameIndex).append(", descriptor index = ").append(this.descriptorIndex).toString();
    }
}
