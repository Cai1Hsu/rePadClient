package org.apache.tools.ant.taskdefs.optional.extension.resolvers;

import java.io.File;
import java.net.URL;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Get;
import org.apache.tools.ant.taskdefs.optional.extension.Extension;
import org.apache.tools.ant.taskdefs.optional.extension.ExtensionResolver;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/resolvers/URLResolver.class */
public class URLResolver implements ExtensionResolver {
    private File destdir;
    private File destfile;
    private URL url;

    private File getDest() {
        String str;
        File file;
        if (this.destfile != null) {
            file = this.destfile;
        } else {
            String file2 = this.url.getFile();
            if (file2 == null || file2.length() <= 1) {
                str = "default.file";
            } else {
                int lastIndexOf = file2.lastIndexOf(47);
                int i = lastIndexOf;
                if (-1 == lastIndexOf) {
                    i = 0;
                }
                str = file2.substring(i);
            }
            file = new File(this.destdir, str);
        }
        return file;
    }

    private void validate() {
        if (this.url == null) {
            throw new BuildException("Must specify URL");
        }
        if (this.destdir == null && this.destfile == null) {
            throw new BuildException("Must specify destination file or directory");
        }
        if (this.destdir != null && this.destfile != null) {
            throw new BuildException("Must not specify both destination file or directory");
        }
    }

    @Override // org.apache.tools.ant.taskdefs.optional.extension.ExtensionResolver
    public File resolve(Extension extension, Project project) throws BuildException {
        validate();
        File dest = getDest();
        Get get = new Get();
        get.setProject(project);
        get.setDest(dest);
        get.setSrc(this.url);
        get.execute();
        return dest;
    }

    public void setDestdir(File file) {
        this.destdir = file;
    }

    public void setDestfile(File file) {
        this.destfile = file;
    }

    public void setUrl(URL url) {
        this.url = url;
    }

    public String toString() {
        return new StringBuffer().append("URL[").append(this.url).append("]").toString();
    }
}
