package org.apache.tools.ant.util;

/* loaded from: classes.jar:org/apache/tools/ant/util/FileNameMapper.class */
public interface FileNameMapper {
    String[] mapFileName(String str);

    void setFrom(String str);

    void setTo(String str);
}
