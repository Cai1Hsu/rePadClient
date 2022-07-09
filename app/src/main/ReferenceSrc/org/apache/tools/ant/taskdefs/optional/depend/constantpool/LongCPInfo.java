package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/LongCPInfo.class */
public class LongCPInfo extends ConstantCPInfo {
    public LongCPInfo() {
        super(5, 2);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void read(DataInputStream dataInputStream) throws IOException {
        setValue(new Long(dataInputStream.readLong()));
    }

    public String toString() {
        return new StringBuffer().append("Long Constant Pool Entry: ").append(getValue()).toString();
    }
}
