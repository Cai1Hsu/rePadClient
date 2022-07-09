package org.apache.tools.ant.util;

import java.io.File;

/* loaded from: classes.jar:org/apache/tools/ant/util/UnPackageNameMapper.class */
public class UnPackageNameMapper extends GlobPatternMapper {
    @Override // org.apache.tools.ant.util.GlobPatternMapper
    protected String extractVariablePart(String str) {
        return str.substring(this.prefixLength, str.length() - this.postfixLength).replace('.', File.separatorChar);
    }
}
