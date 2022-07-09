package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/FloatCPInfo.class */
public class FloatCPInfo extends ConstantCPInfo {
    public FloatCPInfo() {
        super(4, 1);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void read(DataInputStream dataInputStream) throws IOException {
        setValue(new Float(dataInputStream.readFloat()));
    }

    public String toString() {
        return new StringBuffer().append("Float Constant Pool Entry: ").append(getValue()).toString();
    }
}
