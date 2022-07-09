package org.apache.tools.ant.filters;

import java.io.Reader;

/* loaded from: classes.jar:org/apache/tools/ant/filters/ChainableReader.class */
public interface ChainableReader {
    Reader chain(Reader reader);
}
