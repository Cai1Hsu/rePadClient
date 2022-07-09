package org.apache.tools.ant;

/* loaded from: classes.jar:org/apache/tools/ant/SubBuildListener.class */
public interface SubBuildListener extends BuildListener {
    void subBuildFinished(BuildEvent buildEvent);

    void subBuildStarted(BuildEvent buildEvent);
}
