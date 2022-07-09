package org.apache.tools.ant.taskdefs.condition;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.JavaEnvUtils;
import org.apache.tools.ant.util.ReflectWrapper;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/HasFreeSpace.class */
public class HasFreeSpace implements Condition {
    private String needed;
    private String partition;

    private void validate() throws BuildException {
        if (this.partition == null) {
            throw new BuildException("Please set the partition attribute.");
        }
        if (this.needed != null) {
            return;
        }
        throw new BuildException("Please set the needed attribute.");
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        validate();
        try {
            if (!JavaEnvUtils.isAtLeastJavaVersion(JavaEnvUtils.JAVA_1_6)) {
                throw new BuildException("HasFreeSpace condition not supported on Java5 or less.");
            }
            return ((Long) new ReflectWrapper(new File(this.partition)).invoke("getFreeSpace")).longValue() >= StringUtils.parseHumanSizes(this.needed);
        } catch (Exception e) {
            throw new BuildException(e);
        }
    }

    public String getNeeded() {
        return this.needed;
    }

    public String getPartition() {
        return this.partition;
    }

    public void setNeeded(String str) {
        this.needed = str;
    }

    public void setPartition(String str) {
        this.partition = str;
    }
}
