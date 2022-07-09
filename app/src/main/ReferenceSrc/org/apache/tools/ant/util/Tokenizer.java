package org.apache.tools.ant.util;

import java.io.IOException;
import java.io.Reader;

/* loaded from: classes.jar:org/apache/tools/ant/util/Tokenizer.class */
public interface Tokenizer {
    String getPostToken();

    String getToken(Reader reader) throws IOException;
}
