package org.apache.tools.ant.util;

/* loaded from: classes.jar:org/apache/tools/ant/util/MergingMapper.class */
public class MergingMapper implements FileNameMapper {
    protected String[] mergedFile = null;

    public MergingMapper() {
    }

    public MergingMapper(String str) {
        setTo(str);
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public String[] mapFileName(String str) {
        return this.mergedFile;
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public void setFrom(String str) {
    }

    @Override // org.apache.tools.ant.util.FileNameMapper
    public void setTo(String str) {
        this.mergedFile = new String[]{str};
    }
}
