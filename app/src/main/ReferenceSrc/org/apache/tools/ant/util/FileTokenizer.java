package org.apache.tools.ant.util;

import java.io.IOException;
import java.io.Reader;
import org.apache.tools.ant.ProjectComponent;

/* loaded from: classes.jar:org/apache/tools/ant/util/FileTokenizer.class */
public class FileTokenizer extends ProjectComponent implements Tokenizer {
    @Override // org.apache.tools.ant.util.Tokenizer
    public String getPostToken() {
        return "";
    }

    @Override // org.apache.tools.ant.util.Tokenizer
    public String getToken(Reader reader) throws IOException {
        return FileUtils.readFully(reader);
    }
}
