package org.apache.tools.ant.util.regexp;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/util/regexp/Jdk14RegexpRegexp.class */
public class Jdk14RegexpRegexp extends Jdk14RegexpMatcher implements Regexp {
    private static final int DECIMAL = 10;

    protected int getSubsOptions(int i) {
        int i2 = 1;
        if (RegexpUtil.hasFlag(i, 16)) {
            i2 = 16;
        }
        return i2;
    }

    @Override // org.apache.tools.ant.util.regexp.Regexp
    public String substitute(String str, String str2, int i) throws BuildException {
        StringBuffer stringBuffer = new StringBuffer();
        int i2 = 0;
        while (i2 < str2.length()) {
            char charAt = str2.charAt(i2);
            if (charAt == '$') {
                stringBuffer.append('\\');
                stringBuffer.append('$');
            } else if (charAt == '\\') {
                i2++;
                if (i2 < str2.length()) {
                    char charAt2 = str2.charAt(i2);
                    int digit = Character.digit(charAt2, 10);
                    if (digit > -1) {
                        stringBuffer.append("$").append(digit);
                    } else {
                        stringBuffer.append(charAt2);
                    }
                } else {
                    stringBuffer.append('\\');
                }
            } else {
                stringBuffer.append(charAt);
            }
            i2++;
        }
        String stringBuffer2 = stringBuffer.toString();
        int subsOptions = getSubsOptions(i);
        Pattern compiledPattern = getCompiledPattern(i);
        StringBuffer stringBuffer3 = new StringBuffer();
        Matcher matcher = compiledPattern.matcher(str);
        if (RegexpUtil.hasFlag(subsOptions, 16)) {
            stringBuffer3.append(matcher.replaceAll(stringBuffer2));
        } else if (matcher.find()) {
            matcher.appendReplacement(stringBuffer3, stringBuffer2);
            matcher.appendTail(stringBuffer3);
        } else {
            stringBuffer3.append(str);
        }
        return stringBuffer3.toString();
    }
}
