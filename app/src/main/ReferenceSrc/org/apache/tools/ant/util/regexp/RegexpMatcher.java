package org.apache.tools.ant.util.regexp;

import java.util.Vector;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/util/regexp/RegexpMatcher.class */
public interface RegexpMatcher {
    public static final int MATCH_CASE_INSENSITIVE = 256;
    public static final int MATCH_DEFAULT = 0;
    public static final int MATCH_MULTILINE = 4096;
    public static final int MATCH_SINGLELINE = 65536;

    Vector getGroups(String str) throws BuildException;

    Vector getGroups(String str, int i) throws BuildException;

    String getPattern() throws BuildException;

    boolean matches(String str) throws BuildException;

    boolean matches(String str, int i) throws BuildException;

    void setPattern(String str) throws BuildException;
}
