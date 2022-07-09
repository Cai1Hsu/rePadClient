package org.apache.tools.ant.taskdefs.condition;

import java.io.IOException;
import java.util.Iterator;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.ResourceUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/ResourcesMatch.class */
public class ResourcesMatch implements Condition {
    private Union resources = null;
    private boolean asText = false;

    public void add(ResourceCollection resourceCollection) {
        if (resourceCollection == null) {
            return;
        }
        this.resources = this.resources == null ? new Union() : this.resources;
        this.resources.add(resourceCollection);
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        if (this.resources == null) {
            throw new BuildException("You must specify one or more nested resource collections");
        }
        boolean z = true;
        if (this.resources.size() > 1) {
            Iterator it = this.resources.iterator();
            Resource resource = (Resource) it.next();
            while (true) {
                Resource resource2 = resource;
                z = true;
                if (!it.hasNext()) {
                    break;
                }
                Resource resource3 = (Resource) it.next();
                try {
                    if (!ResourceUtils.contentEquals(resource2, resource3, this.asText)) {
                        z = false;
                        break;
                    }
                    resource = resource3;
                } catch (IOException e) {
                    throw new BuildException(new StringBuffer().append("when comparing resources ").append(resource2.toString()).append(" and ").append(resource3.toString()).toString(), e);
                }
            }
        }
        return z;
    }

    public void setAsText(boolean z) {
        this.asText = z;
    }
}
