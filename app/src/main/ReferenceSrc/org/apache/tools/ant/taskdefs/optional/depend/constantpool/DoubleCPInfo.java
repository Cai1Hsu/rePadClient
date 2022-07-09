package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/DoubleCPInfo.class */
public class DoubleCPInfo extends ConstantCPInfo {
    public DoubleCPInfo() {
        super(6, 2);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void read(DataInputStream dataInputStream) throws IOException {
        setValue(new Double(dataInputStream.readDouble()));
    }

    public String toString() {
        return new StringBuffer().append("Double Constant Pool Entry: ").append(getValue()).toString();
    }
}
