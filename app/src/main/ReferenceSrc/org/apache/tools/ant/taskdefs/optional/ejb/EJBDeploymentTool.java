package org.apache.tools.ant.taskdefs.optional.ejb;

import javax.xml.parsers.SAXParser;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.taskdefs.optional.ejb.EjbJar;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool.class */
public interface EJBDeploymentTool {
    void configure(EjbJar.Config config);

    void processDescriptor(String str, SAXParser sAXParser) throws BuildException;

    void setTask(Task task);

    void validateConfigured() throws BuildException;
}
