package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.FilterSetCollection;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/CopyPath.class */
public class CopyPath extends Task {
    public static final String ERROR_NO_DESTDIR = "No destDir specified";
    public static final String ERROR_NO_MAPPER = "No mapper specified";
    public static final String ERROR_NO_PATH = "No path specified";
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private File destDir;
    private FileNameMapper mapper;
    private Path path;
    private long granularity = FILE_UTILS.getFileTimestampGranularity();
    private boolean preserveLastModified = false;

    public void add(FileNameMapper fileNameMapper) {
        if (this.mapper != null) {
            throw new BuildException("Only one mapper allowed");
        }
        this.mapper = fileNameMapper;
    }

    public Path createPath() {
        if (this.path == null) {
            this.path = new Path(getProject());
        }
        return this.path;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        log("This task should have never been released and was obsoleted by ResourceCollection support in <copy> available since Ant 1.7.0.  Don't use it.", 0);
        validateAttributes();
        String[] list = this.path.list();
        if (list.length == 0) {
            log("Path is empty", 3);
            return;
        }
        for (String str : list) {
            File file = new File(str);
            for (String str2 : this.mapper.mapFileName(str)) {
                File file2 = new File(this.destDir, str2);
                if (file.equals(file2)) {
                    log(new StringBuffer().append("Skipping self-copy of ").append(str).toString(), 3);
                } else if (file.isDirectory()) {
                    log(new StringBuffer().append("Skipping directory ").append(str).toString());
                } else {
                    try {
                        log(new StringBuffer().append("Copying ").append(file).append(" to ").append(file2).toString(), 3);
                        FILE_UTILS.copyFile(file, file2, (FilterSetCollection) null, (Vector) null, false, this.preserveLastModified, (String) null, (String) null, getProject());
                    } catch (IOException e) {
                        String stringBuffer = new StringBuffer().append("Failed to copy ").append(file).append(" to ").append(file2).append(" due to ").append(e.getMessage()).toString();
                        String str3 = stringBuffer;
                        if (file2.exists()) {
                            str3 = stringBuffer;
                            if (!file2.delete()) {
                                str3 = new StringBuffer().append(stringBuffer).append(" and I couldn't delete the corrupt ").append(file2).toString();
                            }
                        }
                        throw new BuildException(str3, e, getLocation());
                    }
                }
            }
        }
    }

    public void setDestDir(File file) {
        this.destDir = file;
    }

    public void setGranularity(long j) {
        this.granularity = j;
    }

    public void setPath(Path path) {
        createPath().append(path);
    }

    public void setPathRef(Reference reference) {
        createPath().setRefid(reference);
    }

    public void setPreserveLastModified(boolean z) {
        this.preserveLastModified = z;
    }

    protected void validateAttributes() throws BuildException {
        if (this.destDir == null) {
            throw new BuildException(ERROR_NO_DESTDIR);
        }
        if (this.mapper == null) {
            throw new BuildException(ERROR_NO_MAPPER);
        }
        if (this.path != null) {
            return;
        }
        throw new BuildException(ERROR_NO_PATH);
    }
}
