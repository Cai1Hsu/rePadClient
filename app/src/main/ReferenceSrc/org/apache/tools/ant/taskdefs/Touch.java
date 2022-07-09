package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.Locale;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.FileList;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.Touchable;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Touch.class */
public class Touch extends Task {
    public static final DateFormatFactory DEFAULT_DF_FACTORY = new DateFormatFactory() { // from class: org.apache.tools.ant.taskdefs.Touch.1
        @Override // org.apache.tools.ant.taskdefs.Touch.DateFormatFactory
        public DateFormat getFallbackFormat() {
            return DateFormat.getDateTimeInstance(3, 2, Locale.US);
        }

        @Override // org.apache.tools.ant.taskdefs.Touch.DateFormatFactory
        public DateFormat getPrimaryFormat() {
            return DateFormat.getDateTimeInstance(3, 3, Locale.US);
        }
    };
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    static Class class$org$apache$tools$ant$types$resources$Touchable;
    private String dateTime;
    private boolean dateTimeConfigured;
    private File file;
    private boolean mkdirs;
    private Union resources;
    private long millis = -1;
    private Vector filesets = new Vector();
    private boolean verbose = true;
    private FileNameMapper fileNameMapper = null;
    private DateFormatFactory dfFactory = DEFAULT_DF_FACTORY;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Touch$DateFormatFactory.class */
    public interface DateFormatFactory {
        DateFormat getFallbackFormat();

        DateFormat getPrimaryFormat();
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private long getTimestamp() {
        return this.millis < 0 ? System.currentTimeMillis() : this.millis;
    }

    private void touch(File file, long j) {
        if (!file.exists()) {
            log(new StringBuffer().append("Creating ").append(file).toString(), this.verbose ? 2 : 3);
            try {
                FILE_UTILS.createNewFile(file, this.mkdirs);
            } catch (IOException e) {
                throw new BuildException(new StringBuffer().append("Could not create ").append(file).toString(), e, getLocation());
            }
        }
        if (!file.canWrite()) {
            throw new BuildException(new StringBuffer().append("Can not change modification date of read-only file ").append(file).toString());
        }
        FILE_UTILS.setFileLastModified(file, j);
    }

    private void touch(Resource resource, long j) {
        Class cls;
        Class cls2;
        if (this.fileNameMapper == null) {
            if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                class$org$apache$tools$ant$types$resources$FileProvider = cls;
            } else {
                cls = class$org$apache$tools$ant$types$resources$FileProvider;
            }
            FileProvider fileProvider = (FileProvider) resource.as(cls);
            if (fileProvider != null) {
                touch(fileProvider.getFile(), j);
                return;
            }
            if (class$org$apache$tools$ant$types$resources$Touchable == null) {
                cls2 = class$("org.apache.tools.ant.types.resources.Touchable");
                class$org$apache$tools$ant$types$resources$Touchable = cls2;
            } else {
                cls2 = class$org$apache$tools$ant$types$resources$Touchable;
            }
            ((Touchable) resource.as(cls2)).touch(j);
            return;
        }
        String[] mapFileName = this.fileNameMapper.mapFileName(resource.getName());
        if (mapFileName == null || mapFileName.length <= 0) {
            return;
        }
        long j2 = j;
        if (this.millis < 0) {
            j2 = j;
            if (resource.isExists()) {
                j2 = resource.getLastModified();
            }
        }
        for (String str : mapFileName) {
            touch(getProject().resolveFile(str), j2);
        }
    }

    public void add(ResourceCollection resourceCollection) {
        synchronized (this) {
            this.resources = this.resources == null ? new Union() : this.resources;
            this.resources.add(resourceCollection);
        }
    }

    public void add(FileNameMapper fileNameMapper) throws BuildException {
        if (this.fileNameMapper != null) {
            throw new BuildException(new StringBuffer().append("Only one mapper may be added to the ").append(getTaskName()).append(" task.").toString());
        }
        this.fileNameMapper = fileNameMapper;
    }

    public void addConfiguredMapper(Mapper mapper) {
        add(mapper.getImplementation());
    }

    public void addFilelist(FileList fileList) {
        add(fileList);
    }

    public void addFileset(FileSet fileSet) {
        this.filesets.add(fileSet);
        add(fileSet);
    }

    protected void checkConfiguration() throws BuildException {
        long j;
        synchronized (this) {
            if (this.file == null && this.resources == null) {
                throw new BuildException("Specify at least one source--a file or resource collection.");
            }
            if (this.file != null && this.file.exists() && this.file.isDirectory()) {
                throw new BuildException("Use a resource collection to touch directories.");
            }
            if (this.dateTime != null && !this.dateTimeConfigured) {
                long j2 = this.millis;
                if ("now".equalsIgnoreCase(this.dateTime)) {
                    j = System.currentTimeMillis();
                } else {
                    ParseException e = null;
                    try {
                        j2 = this.dfFactory.getPrimaryFormat().parse(this.dateTime).getTime();
                    } catch (ParseException e2) {
                        DateFormat fallbackFormat = this.dfFactory.getFallbackFormat();
                        if (fallbackFormat == null) {
                            e = e2;
                        } else {
                            try {
                                j2 = fallbackFormat.parse(this.dateTime).getTime();
                            } catch (ParseException e3) {
                                e = e3;
                            }
                        }
                    }
                    if (e != null) {
                        throw new BuildException(e.getMessage(), e, getLocation());
                    }
                    j = j2;
                    if (j2 < 0) {
                        throw new BuildException(new StringBuffer().append("Date of ").append(this.dateTime).append(" results in negative ").append("milliseconds value ").append("relative to epoch ").append("(January 1, 1970, ").append("00:00:00 GMT).").toString());
                    }
                }
                log(new StringBuffer().append("Setting millis to ").append(j).append(" from datetime attribute").toString(), this.millis < 0 ? 4 : 3);
                setMillis(j);
                this.dateTimeConfigured = true;
            }
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        checkConfiguration();
        touch();
    }

    public void setDatetime(String str) {
        if (this.dateTime != null) {
            log(new StringBuffer().append("Resetting datetime attribute to ").append(str).toString(), 3);
        }
        this.dateTime = str;
        this.dateTimeConfigured = false;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setMillis(long j) {
        this.millis = j;
    }

    public void setMkdirs(boolean z) {
        this.mkdirs = z;
    }

    public void setPattern(String str) {
        this.dfFactory = new DateFormatFactory(this, str) { // from class: org.apache.tools.ant.taskdefs.Touch.2
            private final Touch this$0;
            private final String val$pattern;

            {
                this.this$0 = this;
                this.val$pattern = str;
            }

            @Override // org.apache.tools.ant.taskdefs.Touch.DateFormatFactory
            public DateFormat getFallbackFormat() {
                return null;
            }

            @Override // org.apache.tools.ant.taskdefs.Touch.DateFormatFactory
            public DateFormat getPrimaryFormat() {
                return new SimpleDateFormat(this.val$pattern);
            }
        };
    }

    public void setVerbose(boolean z) {
        this.verbose = z;
    }

    protected void touch() throws BuildException {
        Class cls;
        long timestamp = getTimestamp();
        if (this.file != null) {
            touch(new FileResource(this.file.getParentFile(), this.file.getName()), timestamp);
        }
        if (this.resources == null) {
            return;
        }
        Iterator it = this.resources.iterator();
        while (it.hasNext()) {
            Resource resource = (Resource) it.next();
            if (class$org$apache$tools$ant$types$resources$Touchable == null) {
                cls = class$("org.apache.tools.ant.types.resources.Touchable");
                class$org$apache$tools$ant$types$resources$Touchable = cls;
            } else {
                cls = class$org$apache$tools$ant$types$resources$Touchable;
            }
            if (((Touchable) resource.as(cls)) == null) {
                throw new BuildException(new StringBuffer().append("Can't touch ").append(resource).toString());
            }
            touch(resource, timestamp);
        }
        int size = this.filesets.size();
        for (int i = 0; i < size; i++) {
            FileSet fileSet = (FileSet) this.filesets.elementAt(i);
            DirectoryScanner directoryScanner = fileSet.getDirectoryScanner(getProject());
            File dir = fileSet.getDir(getProject());
            for (String str : directoryScanner.getIncludedDirectories()) {
                touch(new FileResource(dir, str), timestamp);
            }
        }
    }

    protected void touch(File file) {
        touch(file, getTimestamp());
    }
}
