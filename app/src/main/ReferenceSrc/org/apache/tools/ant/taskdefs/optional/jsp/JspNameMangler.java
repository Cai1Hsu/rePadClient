package org.apache.tools.ant.taskdefs.optional.jsp;

import java.io.File;
import org.apache.tools.ant.util.StringUtils;
import org.jivesoftware.smackx.FormField;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/jsp/JspNameMangler.class */
public class JspNameMangler implements JspMangler {
    public static final String[] keywords = {"assert", "abstract", FormField.TYPE_BOOLEAN, "break", "byte", "case", "catch", "char", "class", "const", "continue", "default", "do", "double", "else", "extends", "final", "finally", "float", "for", "goto", "if", "implements", "import", "instanceof", "int", "interface", "long", "native", "new", "package", "private", "protected", "public", "return", "short", "static", "super", "switch", "synchronized", "this", "throw", "throws", "transient", "try", "void", "volatile", "while"};

    private static String mangleChar(char c) {
        char c2 = c;
        if (c == File.separatorChar) {
            c2 = '/';
        }
        String hexString = Integer.toHexString(c2);
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

    private String mapJspToBaseName(File file) {
        String str;
        String stripExtension = stripExtension(file);
        int i = 0;
        while (true) {
            str = stripExtension;
            if (i >= keywords.length) {
                break;
            } else if (stripExtension.equals(keywords[i])) {
                str = new StringBuffer().append(stripExtension).append("%").toString();
                break;
            } else {
                i++;
            }
        }
        StringBuffer stringBuffer = new StringBuffer(str.length());
        char charAt = str.charAt(0);
        if (Character.isJavaIdentifierStart(charAt)) {
            stringBuffer.append(charAt);
        } else {
            stringBuffer.append(mangleChar(charAt));
        }
        for (int i2 = 1; i2 < str.length(); i2++) {
            char charAt2 = str.charAt(i2);
            if (Character.isJavaIdentifierPart(charAt2)) {
                stringBuffer.append(charAt2);
            } else {
                stringBuffer.append(mangleChar(charAt2));
            }
        }
        return stringBuffer.toString();
    }

    private String stripExtension(File file) {
        return StringUtils.removeSuffix(file.getName(), ".jsp");
    }

    @Override // org.apache.tools.ant.taskdefs.optional.jsp.JspMangler
    public String mapJspToJavaName(File file) {
        return new StringBuffer().append(mapJspToBaseName(file)).append(".java").toString();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.jsp.JspMangler
    public String mapPath(String str) {
        return null;
    }
}
