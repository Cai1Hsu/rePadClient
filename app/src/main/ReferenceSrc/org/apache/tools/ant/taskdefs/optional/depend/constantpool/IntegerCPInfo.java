package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/IntegerCPInfo.class */
public class IntegerCPInfo extends ConstantCPInfo {
    public IntegerCPInfo() {
        super(3, 1);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void read(DataInputStream dataInputStream) throws IOException {
        setValue(new Integer(dataInputStream.readInt()));
    }

    public String toString() {
        return new StringBuffer().append("Integer Constant Pool Entry: ").append(getValue()).toString();
    }
}
