package org.apache.tools.ant.types.mappers;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.FileNameMapper;

/* loaded from: classes.jar:org/apache/tools/ant/types/mappers/CutDirsMapper.class */
public class CutDirsMapper implements FileNameMapper {
    private int dirs = 0;

    @Override // org.apache.tools.ant.util.FileNameMapper
    public String[] mapFileName(String str) {
        if (this.dirs <= 0) {
            throw new BuildException("dirs must be set to a positive number");
        }
        char c = File.separatorChar;
        String replace = str.replace('/', c).replace('\\', c);
        int indexOf = replace.indexOf(c);
        for (int i = 1; indexOf > -1 && i < this.dirs; i++) {
            indexOf = replace.indexOf(c, indexOf + 1);
        }
        return indexOf == -1 ? null : new String[]{str.substring(indexOf + 1)};
    }

    public void setDirs(int i) {
        this.dirs = i;
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public void setFrom(String str) {
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public void setTo(String str) {
    }
}
