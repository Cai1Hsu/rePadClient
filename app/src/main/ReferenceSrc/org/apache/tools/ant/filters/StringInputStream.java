package org.apache.tools.ant.filters;

import java.io.StringReader;
import org.apache.tools.ant.util.ReaderInputStream;

/* loaded from: classes.jar:org/apache/tools/ant/filters/StringInputStream.class */
public class StringInputStream extends ReaderInputStream {
    public StringInputStream(String str) {
        super(new StringReader(str));
    }

    public StringInputStream(String str, String str2) {
        super(new StringReader(str), str2);
    }
}
