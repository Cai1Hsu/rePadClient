package org.apache.tools.ant.util;

import java.io.ByteArrayOutputStream;
import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/util/PropertyOutputStream.class */
public class PropertyOutputStream extends ByteArrayOutputStream {
    private Project project;
    private String property;
    private boolean trim;

    public PropertyOutputStream(Project project, String str) {
        this(project, str, true);
    }

    public PropertyOutputStream(Project project, String str, boolean z) {
        this.project = project;
        this.property = str;
        this.trim = z;
    }

    @Override // java.io.ByteArrayOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        if (this.project == null || this.property == null) {
            return;
        }
        String str = new String(toByteArray());
        Project project = this.project;
        String str2 = this.property;
        String str3 = str;
        if (this.trim) {
            str3 = str.trim();
        }
        project.setNewProperty(str2, str3);
    }
}
