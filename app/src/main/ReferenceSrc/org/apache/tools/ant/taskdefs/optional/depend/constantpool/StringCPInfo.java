package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/StringCPInfo.class */
public class StringCPInfo extends ConstantCPInfo {
    private int index;

    public StringCPInfo() {
        super(8, 1);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void read(DataInputStream dataInputStream) throws IOException {
        this.index = dataInputStream.readUnsignedShort();
        setValue("unresolved");
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void resolve(ConstantPool constantPool) {
        setValue(((Utf8CPInfo) constantPool.getEntry(this.index)).getValue());
        super.resolve(constantPool);
    }

    public String toString() {
        return new StringBuffer().append("String Constant Pool Entry for ").append(getValue()).append("[").append(this.index).append("]").toString();
    }
}
