package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.UnsupportedEncodingException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.launch.Locator;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ManifestClassPath.class */
public class ManifestClassPath extends Task {
    private File dir;
    private int maxParentLevels = 2;
    private String name;
    private Path path;

    public void addClassPath(Path path) {
        this.path = path;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        if (this.name == null) {
            throw new BuildException("Missing 'property' attribute!");
        }
        if (this.dir == null) {
            throw new BuildException("Missing 'jarfile' attribute!");
        }
        if (getProject().getProperty(this.name) != null) {
            throw new BuildException(new StringBuffer().append("Property '").append(this.name).append("' already set!").toString());
        }
        if (this.path == null) {
            throw new BuildException("Missing nested <classpath>!");
        }
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 0; i < this.maxParentLevels + 1; i++) {
            stringBuffer.append("../");
        }
        String stringBuffer2 = stringBuffer.toString();
        FileUtils fileUtils = FileUtils.getFileUtils();
        this.dir = fileUtils.normalize(this.dir.getAbsolutePath());
        String[] list = this.path.list();
        StringBuffer stringBuffer3 = new StringBuffer();
        for (String str : list) {
            String absolutePath = new File(str).getAbsolutePath();
            File normalize = fileUtils.normalize(absolutePath);
            try {
                String relativePath = FileUtils.getRelativePath(this.dir, normalize);
                String canonicalPath = normalize.getCanonicalPath();
                String str2 = canonicalPath;
                if (File.separatorChar != '/') {
                    str2 = canonicalPath.replace(File.separatorChar, '/');
                }
                if (relativePath.equals(str2) || relativePath.startsWith(stringBuffer2)) {
                    throw new BuildException(new StringBuffer().append("No suitable relative path from ").append(this.dir).append(" to ").append(absolutePath).toString());
                }
                String str3 = relativePath;
                if (normalize.isDirectory()) {
                    str3 = relativePath;
                    if (!relativePath.endsWith("/")) {
                        str3 = new StringBuffer().append(relativePath).append('/').toString();
                    }
                }
                try {
                    stringBuffer3.append(Locator.encodeURI(str3));
                    stringBuffer3.append(' ');
                } catch (UnsupportedEncodingException e) {
                    throw new BuildException(e);
                }
            } catch (Exception e2) {
                throw new BuildException(new StringBuffer().append("error trying to get the relative path from ").append(this.dir).append(" to ").append(absolutePath).toString(), e2);
            }
        }
        getProject().setNewProperty(this.name, stringBuffer3.toString().trim());
    }

    public void setJarFile(File file) {
        File parentFile = file.getParentFile();
        if (!parentFile.isDirectory()) {
            throw new BuildException(new StringBuffer().append("Jar's directory not found: ").append(parentFile).toString());
        }
        this.dir = parentFile;
    }

    public void setMaxParentLevels(int i) {
        if (i < 0) {
            throw new BuildException("maxParentLevels must not be a negative number");
        }
        this.maxParentLevels = i;
    }

    public void setProperty(String str) {
        this.name = str;
    }
}
