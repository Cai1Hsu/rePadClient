package org.apache.tools.ant.types.spi;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;

/* loaded from: classes.jar:org/apache/tools/ant/types/spi/Provider.class */
public class Provider extends ProjectComponent {
    private String type;

    public void check() {
        if (this.type == null) {
            throw new BuildException("classname attribute must be set for provider element", getLocation());
        }
        if (this.type.length() != 0) {
            return;
        }
        throw new BuildException("Invalid empty classname", getLocation());
    }

    public String getClassName() {
        return this.type;
    }

    public void setClassName(String str) {
        this.type = str;
    }
}
