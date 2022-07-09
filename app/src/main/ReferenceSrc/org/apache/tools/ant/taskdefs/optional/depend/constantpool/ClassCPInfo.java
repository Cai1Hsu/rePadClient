package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/ClassCPInfo.class */
public class ClassCPInfo extends ConstantPoolEntry {
    private String className;
    private int index;

    public ClassCPInfo() {
        super(7, 1);
    }

    public String getClassName() {
        return this.className;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void read(DataInputStream dataInputStream) throws IOException {
        this.index = dataInputStream.readUnsignedShort();
        this.className = "unresolved";
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void resolve(ConstantPool constantPool) {
        this.className = ((Utf8CPInfo) constantPool.getEntry(this.index)).getValue();
        super.resolve(constantPool);
    }

    public String toString() {
        return new StringBuffer().append("Class Constant Pool Entry for ").append(this.className).append("[").append(this.index).append("]").toString();
    }
}
