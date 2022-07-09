package org.apache.tools.ant.types.resources;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/Appendable.class */
public interface Appendable {
    OutputStream getAppendOutputStream() throws IOException;
}
