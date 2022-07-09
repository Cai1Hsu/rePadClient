package org.apache.tools.ant.taskdefs.optional;

import javax.xml.transform.Transformer;
import org.apache.tools.ant.taskdefs.XSLTProcess;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/XSLTTraceSupport.class */
public interface XSLTTraceSupport {
    void configureTrace(Transformer transformer, XSLTProcess.TraceConfiguration traceConfiguration);
}
