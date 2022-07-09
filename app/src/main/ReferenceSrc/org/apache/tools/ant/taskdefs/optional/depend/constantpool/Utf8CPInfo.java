package org.apache.tools.ant.taskdefs.optional.depend.constantpool;

import java.io.DataInputStream;
import java.io.IOException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/depend/constantpool/Utf8CPInfo.class */
public class Utf8CPInfo extends ConstantPoolEntry {
    private String value;

    public Utf8CPInfo() {
        super(1, 1);
    }

    public String getValue() {
        return this.value;
    }

    @Override // org.apache.tools.ant.taskdefs.optional.depend.constantpool.ConstantPoolEntry
    public void read(DataInputStream dataInputStream) throws IOException {
        this.value = dataInputStream.readUTF();
    }

    public String toString() {
        return new StringBuffer().append("UTF8 Value = ").append(this.value).toString();
    }
}
