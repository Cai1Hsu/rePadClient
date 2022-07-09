package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Iterator;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Truncate.class */
public class Truncate extends Task {
    private static final int BUFFER_SIZE = 1024;
    private static final String INVALID_LENGTH = "Cannot truncate to length ";
    private static final String NO_CHILD = "No files specified.";
    private static final String READ_WRITE = "rw";
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private Long adjust;
    private Long length;
    private Path path;
    private static final Long ZERO = new Long(0);
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static final byte[] FILL_BUFFER = new byte[1024];
    private boolean create = true;
    private boolean mkdirs = false;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private Path getPath() {
        Path path;
        synchronized (this) {
            if (this.path == null) {
                this.path = new Path(getProject());
            }
            path = this.path;
        }
        return path;
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[]}, finally: {[INVOKE] complete} */
    private void process(File file) {
        long length = file.length();
        long longValue = this.length == null ? length + this.adjust.longValue() : this.length.longValue();
        if (length == longValue) {
            return;
        }
        try {
            RandomAccessFile randomAccessFile = new RandomAccessFile(file, READ_WRITE);
            try {
                try {
                    if (longValue > length) {
                        randomAccessFile.seek(length);
                        while (length < longValue) {
                            long min = Math.min(FILL_BUFFER.length, longValue - length);
                            randomAccessFile.write(FILL_BUFFER, 0, (int) min);
                            length += min;
                        }
                    } else {
                        randomAccessFile.setLength(longValue);
                    }
                    try {
                        randomAccessFile.close();
                    } catch (IOException e) {
                        log(new StringBuffer().append("Caught ").append(e).append(" closing ").append(randomAccessFile).toString(), 1);
                    }
                } catch (IOException e2) {
                    throw new BuildException(new StringBuffer().append("Exception working with ").append(randomAccessFile).toString(), e2);
                }
            } catch (Throwable th) {
                try {
                    randomAccessFile.close();
                } catch (IOException e3) {
                    log(new StringBuffer().append("Caught ").append(e3).append(" closing ").append(randomAccessFile).toString(), 1);
                }
                throw th;
            }
        } catch (Exception e4) {
            throw new BuildException(new StringBuffer().append("Could not open ").append(file).append(" for writing").toString(), e4);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:11:0x0028, code lost:
        if (org.apache.tools.ant.taskdefs.Truncate.FILE_UTILS.createNewFile(r6, r5.mkdirs) == false) goto L12;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private boolean shouldProcess(File file) {
        IOException e;
        boolean z = true;
        if (!file.isFile()) {
            if (!this.create) {
                z = false;
            } else {
                e = null;
                try {
                } catch (IOException e2) {
                    e = e2;
                }
            }
        }
        return z;
        String stringBuffer = new StringBuffer().append("Unable to create ").append(file).toString();
        if (e == null) {
            log(stringBuffer, 1);
            z = false;
            return z;
        }
        throw new BuildException(stringBuffer, e);
    }

    public void add(ResourceCollection resourceCollection) {
        getPath().add(resourceCollection);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        Class cls;
        if (this.length == null || this.adjust == null) {
            if (this.length == null && this.adjust == null) {
                this.length = ZERO;
            }
            if (this.path == null) {
                throw new BuildException(NO_CHILD);
            }
            Iterator it = this.path.iterator();
            while (it.hasNext()) {
                Resource resource = (Resource) it.next();
                if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                    cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                    class$org$apache$tools$ant$types$resources$FileProvider = cls;
                } else {
                    cls = class$org$apache$tools$ant$types$resources$FileProvider;
                }
                File file = ((FileProvider) resource.as(cls)).getFile();
                if (shouldProcess(file)) {
                    process(file);
                }
            }
            return;
        }
        throw new BuildException("length and adjust are mutually exclusive options");
    }

    public void setAdjust(Long l) {
        this.adjust = l;
    }

    public void setCreate(boolean z) {
        this.create = z;
    }

    public void setFile(File file) {
        add(new FileResource(file));
    }

    public void setLength(Long l) {
        this.length = l;
        if (l == null || l.longValue() >= 0) {
            return;
        }
        throw new BuildException(new StringBuffer().append(INVALID_LENGTH).append(l).toString());
    }

    public void setMkdirs(boolean z) {
        this.mkdirs = z;
    }
}
