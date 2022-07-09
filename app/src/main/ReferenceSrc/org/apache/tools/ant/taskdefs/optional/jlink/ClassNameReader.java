package org.apache.tools.ant.taskdefs.optional.jlink;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jlink/ClassNameReader.class */
public class ClassNameReader {
    private static final int CLASS_MAGIC_NUMBER = -889275714;

    public static String getClassName(InputStream inputStream) throws IOException {
        String str;
        DataInputStream dataInputStream = new DataInputStream(inputStream);
        if (dataInputStream.readInt() != CLASS_MAGIC_NUMBER) {
            str = null;
        } else {
            dataInputStream.readInt();
            Object[] objArr = new ConstantPool(dataInputStream).values;
            dataInputStream.readUnsignedShort();
            str = (String) objArr[((Integer) objArr[dataInputStream.readUnsignedShort()]).intValue()];
        }
        return str;
    }
}
