package org.apache.tools.ant.taskdefs.optional.jsp;

import java.io.File;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jsp/Jasper41Mangler.class */
public class Jasper41Mangler implements JspMangler {
    private static String mangleChar(char c) {
        String hexString = Integer.toHexString(c);
        int length = 5 - hexString.length();
        char[] cArr = new char[6];
        cArr[0] = (char) 95;
        for (int i = 1; i <= length; i++) {
            cArr[i] = (char) 48;
        }
        int i2 = length + 1;
        int i3 = 0;
        while (i2 < 6) {
            cArr[i2] = hexString.charAt(i3);
            i2++;
            i3++;
        }
        return new String(cArr);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.jsp.JspMangler
    public String mapJspToJavaName(File file) {
        String absolutePath = file.getAbsolutePath();
        int lastIndexOf = absolutePath.lastIndexOf(File.separatorChar) + 1;
        int length = absolutePath.length();
        StringBuffer stringBuffer = new StringBuffer(absolutePath.length() - lastIndexOf);
        if (!Character.isJavaIdentifierStart(absolutePath.charAt(lastIndexOf)) || absolutePath.charAt(lastIndexOf) == '_') {
            stringBuffer.append('_');
        }
        while (lastIndexOf < length) {
            char charAt = absolutePath.charAt(lastIndexOf);
            if (Character.isJavaIdentifierPart(charAt)) {
                stringBuffer.append(charAt);
            } else if (charAt == '.') {
                stringBuffer.append('_');
            } else {
                stringBuffer.append(mangleChar(charAt));
            }
            lastIndexOf++;
        }
        return stringBuffer.toString();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.jsp.JspMangler
    public String mapPath(String str) {
        return null;
    }
}
