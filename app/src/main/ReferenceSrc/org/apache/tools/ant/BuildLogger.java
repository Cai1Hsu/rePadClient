package org.apache.tools.ant;

import java.io.PrintStream;

/* loaded from: classes.jar:org/apache/tools/ant/BuildLogger.class */
public interface BuildLogger extends BuildListener {
    void setEmacsMode(boolean z);

    void setErrorPrintStream(PrintStream printStream);

    void setMessageOutputLevel(int i);

    void setOutputPrintStream(PrintStream printStream);
}
