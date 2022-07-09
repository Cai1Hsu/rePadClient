package org.apache.tools.ant;

/* loaded from: classes.jar:org/apache/tools/ant/TypeAdapter.class */
public interface TypeAdapter {
    void checkProxyClass(Class cls);

    Project getProject();

    Object getProxy();

    void setProject(Project project);

    void setProxy(Object obj);
}
