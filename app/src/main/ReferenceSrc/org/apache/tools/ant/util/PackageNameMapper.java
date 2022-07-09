package org.apache.tools.ant.util;

import java.io.File;

/* loaded from: classes.jar:org/apache/tools/ant/util/PackageNameMapper.class */
public class PackageNameMapper extends GlobPatternMapper {
    @Override // org.apache.tools.ant.util.GlobPatternMapper
    protected String extractVariablePart(String str) {
        String substring = str.substring(this.prefixLength, str.length() - this.postfixLength);
        if (getHandleDirSep()) {
            substring = str.replace('/', '.').replace('\\', '.');
        }
        return substring.replace(File.separatorChar, '.');
    }
}
