package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.types.AbstractFileSet;
import org.apache.tools.ant.types.Commandline;
import org.apache.tools.ant.types.DirSet;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.FileList;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Mapper;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.FileNameMapper;
import org.apache.tools.ant.util.ResourceUtils;
import org.apache.tools.ant.util.SourceFileScanner;
import org.jivesoftware.smack.packet.PrivacyItem;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ExecuteOn.class */
public class ExecuteOn extends ExecTask {
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    protected Vector filesets = new Vector();
    private Union resources = null;
    private boolean relative = false;
    private boolean parallel = false;
    private boolean forwardSlash = false;
    protected String type = "file";
    protected Commandline.Marker srcFilePos = null;
    private boolean skipEmpty = false;
    protected Commandline.Marker targetFilePos = null;
    protected Mapper mapperElement = null;
    protected FileNameMapper mapper = null;
    protected File destDir = null;
    private int maxParallel = -1;
    private boolean addSourceFile = true;
    private boolean verbose = false;
    private boolean ignoreMissing = true;
    private boolean force = false;
    protected boolean srcIsFirst = true;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ExecuteOn$FileDirBoth.class */
    public static class FileDirBoth extends EnumeratedAttribute {
        public static final String DIR = "dir";
        public static final String FILE = "file";

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"file", "dir", PrivacyItem.PrivacyRule.SUBSCRIPTION_BOTH};
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private static void insertTargetFiles(String[] strArr, String[] strArr2, int i, String str, String str2) {
        if (str.length() == 0 && str2.length() == 0) {
            System.arraycopy(strArr, 0, strArr2, i, strArr.length);
            return;
        }
        for (int i2 = 0; i2 < strArr.length; i2++) {
            strArr2[i + i2] = new StringBuffer().append(str).append(strArr[i2]).append(str2).toString();
        }
    }

    private void logSkippingFileset(String str, DirectoryScanner directoryScanner, File file) {
        int i = 0;
        int includedFilesCount = !"dir".equals(str) ? directoryScanner.getIncludedFilesCount() : 0;
        if (!"file".equals(str)) {
            i = directoryScanner.getIncludedDirsCount();
        }
        log(new StringBuffer().append("Skipping fileset for directory ").append(file).append(". It is ").append(includedFilesCount + i > 0 ? "up to date." : "empty.").toString(), this.verbose ? 2 : 3);
    }

    private String[] restrict(String[] strArr, File file) {
        String[] strArr2 = strArr;
        if (this.mapper != null) {
            strArr2 = this.force ? strArr : new SourceFileScanner(this).restrict(strArr, file, this.destDir, this.mapper);
        }
        return strArr2;
    }

    public void add(ResourceCollection resourceCollection) {
        if (this.resources == null) {
            this.resources = new Union();
        }
        this.resources.add(resourceCollection);
    }

    public void add(FileNameMapper fileNameMapper) {
        createMapper().add(fileNameMapper);
    }

    public void addDirset(DirSet dirSet) {
        this.filesets.addElement(dirSet);
    }

    public void addFilelist(FileList fileList) {
        add(fileList);
    }

    public void addFileset(FileSet fileSet) {
        this.filesets.addElement(fileSet);
    }

    @Override // org.apache.tools.ant.taskdefs.ExecTask
    protected void checkConfiguration() {
        if ("execon".equals(getTaskName())) {
            log("!! execon is deprecated. Use apply instead. !!");
        }
        super.checkConfiguration();
        if (this.filesets.size() == 0 && this.resources == null) {
            throw new BuildException("no resources specified", getLocation());
        }
        if (this.targetFilePos != null && this.mapperElement == null) {
            throw new BuildException("targetfile specified without mapper", getLocation());
        }
        if (this.destDir != null && this.mapperElement == null) {
            throw new BuildException("dest specified without mapper", getLocation());
        }
        if (this.mapperElement == null) {
            return;
        }
        this.mapper = this.mapperElement.getImplementation();
    }

    @Override // org.apache.tools.ant.taskdefs.ExecTask
    protected ExecuteStreamHandler createHandler() throws BuildException {
        return this.redirectorElement == null ? super.createHandler() : new PumpStreamHandler();
    }

    public Mapper createMapper() throws BuildException {
        if (this.mapperElement != null) {
            throw new BuildException(Expand.ERROR_MULTIPLE_MAPPERS, getLocation());
        }
        this.mapperElement = new Mapper(getProject());
        return this.mapperElement;
    }

    public Commandline.Marker createSrcfile() {
        if (this.srcFilePos != null) {
            throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support multiple ").append("srcfile elements.").toString(), getLocation());
        }
        this.srcFilePos = this.cmdl.createMarker();
        return this.srcFilePos;
    }

    public Commandline.Marker createTargetfile() {
        if (this.targetFilePos != null) {
            throw new BuildException(new StringBuffer().append(getTaskType()).append(" doesn't support multiple ").append("targetfile elements.").toString(), getLocation());
        }
        this.targetFilePos = this.cmdl.createMarker();
        this.srcIsFirst = this.srcFilePos != null;
        return this.targetFilePos;
    }

    protected String[] getCommandline(String str, File file) {
        return getCommandline(new String[]{str}, new File[]{file});
    }

    protected String[] getCommandline(String[] strArr, File[] fileArr) {
        char c = File.separatorChar;
        Vector vector = new Vector();
        if (this.targetFilePos != null) {
            HashSet hashSet = new HashSet();
            for (String str : strArr) {
                String[] mapFileName = this.mapper.mapFileName(str);
                if (mapFileName != null) {
                    for (int i = 0; i < mapFileName.length; i++) {
                        String absolutePath = !this.relative ? new File(this.destDir, mapFileName[i]).getAbsolutePath() : mapFileName[i];
                        String str2 = absolutePath;
                        if (this.forwardSlash) {
                            str2 = absolutePath;
                            if (c != '/') {
                                str2 = absolutePath.replace(c, '/');
                            }
                        }
                        if (!hashSet.contains(str2)) {
                            vector.addElement(str2);
                            hashSet.add(str2);
                        }
                    }
                }
            }
        }
        String[] strArr2 = (String[]) vector.toArray(new String[vector.size()]);
        String[] strArr3 = strArr;
        if (!this.addSourceFile) {
            strArr3 = new String[0];
        }
        String[] commandline = this.cmdl.getCommandline();
        String[] strArr4 = new String[commandline.length + strArr3.length + strArr2.length];
        int length = commandline.length;
        if (this.srcFilePos != null) {
            length = this.srcFilePos.getPosition();
        }
        if (this.targetFilePos != null) {
            int position = this.targetFilePos.getPosition();
            if (length < position || (length == position && this.srcIsFirst)) {
                System.arraycopy(commandline, 0, strArr4, 0, length);
                System.arraycopy(commandline, length, strArr4, strArr3.length + length, position - length);
                insertTargetFiles(strArr2, strArr4, strArr3.length + position, this.targetFilePos.getPrefix(), this.targetFilePos.getSuffix());
                System.arraycopy(commandline, position, strArr4, strArr3.length + position + strArr2.length, commandline.length - position);
            } else {
                System.arraycopy(commandline, 0, strArr4, 0, position);
                insertTargetFiles(strArr2, strArr4, position, this.targetFilePos.getPrefix(), this.targetFilePos.getSuffix());
                System.arraycopy(commandline, position, strArr4, strArr2.length + position, length - position);
                System.arraycopy(commandline, length, strArr4, strArr3.length + length + strArr2.length, commandline.length - length);
                length += strArr2.length;
            }
        } else {
            System.arraycopy(commandline, 0, strArr4, 0, length);
            System.arraycopy(commandline, length, strArr4, strArr3.length + length, commandline.length - length);
        }
        for (int i2 = 0; i2 < strArr3.length; i2++) {
            String absolutePath2 = this.relative ? strArr3[i2] : new File(fileArr[i2], strArr3[i2]).getAbsolutePath();
            String str3 = absolutePath2;
            if (this.forwardSlash) {
                str3 = absolutePath2;
                if (c != '/') {
                    str3 = absolutePath2.replace(c, '/');
                }
            }
            String str4 = str3;
            if (this.srcFilePos != null) {
                if (this.srcFilePos.getPrefix().length() <= 0) {
                    str4 = str3;
                    if (this.srcFilePos.getSuffix().length() <= 0) {
                    }
                }
                str4 = new StringBuffer().append(this.srcFilePos.getPrefix()).append(str3).append(this.srcFilePos.getSuffix()).toString();
            }
            strArr4[length + i2] = str4;
        }
        return strArr4;
    }

    protected String[] getDirs(File file, DirectoryScanner directoryScanner) {
        return restrict(directoryScanner.getIncludedDirectories(), file);
    }

    protected String[] getFiles(File file, DirectoryScanner directoryScanner) {
        return restrict(directoryScanner.getIncludedFiles(), file);
    }

    protected String[] getFilesAndDirs(FileList fileList) {
        return restrict(fileList.getFiles(getProject()), fileList.getDir(getProject()));
    }

    /* JADX WARN: Code restructure failed: missing block: B:142:0x03c6, code lost:
        if (r6.skipEmpty == false) goto L143;
     */
    @Override // org.apache.tools.ant.taskdefs.ExecTask
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected void runExec(Execute execute) throws BuildException {
        Class cls;
        int i;
        int i2;
        boolean z;
        int i3 = 0;
        int i4 = 0;
        boolean z2 = false;
        try {
            try {
                Vector vector = new Vector();
                Vector vector2 = new Vector();
                int size = this.filesets.size();
                int i5 = 0;
                while (i5 < size) {
                    String str = this.type;
                    AbstractFileSet abstractFileSet = (AbstractFileSet) this.filesets.elementAt(i5);
                    String str2 = str;
                    if (abstractFileSet instanceof DirSet) {
                        str2 = str;
                        if (!"dir".equals(this.type)) {
                            log(new StringBuffer().append("Found a nested dirset but type is ").append(this.type).append(". ").append("Temporarily switching to type=\"dir\" on the").append(" assumption that you really did mean").append(" <dirset> not <fileset>.").toString(), 4);
                            str2 = "dir";
                        }
                    }
                    File dir = abstractFileSet.getDir(getProject());
                    DirectoryScanner directoryScanner = abstractFileSet.getDirectoryScanner(getProject());
                    int i6 = i3;
                    if (!"dir".equals(str2)) {
                        String[] files = getFiles(dir, directoryScanner);
                        int i7 = 0;
                        while (true) {
                            i6 = i3;
                            if (i7 >= files.length) {
                                break;
                            }
                            i3++;
                            vector.addElement(files[i7]);
                            vector2.addElement(dir);
                            i7++;
                        }
                    }
                    int i8 = i4;
                    if (!"file".equals(str2)) {
                        String[] dirs = getDirs(dir, directoryScanner);
                        int i9 = 0;
                        while (true) {
                            i8 = i4;
                            if (i9 >= dirs.length) {
                                break;
                            }
                            i4++;
                            vector.addElement(dirs[i9]);
                            vector2.addElement(dir);
                            i9++;
                        }
                    }
                    if (vector.size() != 0 || !this.skipEmpty) {
                        z = z2;
                        if (!this.parallel) {
                            String[] strArr = new String[vector.size()];
                            vector.copyInto(strArr);
                            for (int i10 = 0; i10 < strArr.length; i10++) {
                                String[] commandline = getCommandline(strArr[i10], dir);
                                log(Commandline.describeCommand(commandline), 3);
                                execute.setCommandline(commandline);
                                if (this.redirectorElement != null) {
                                    setupRedirector();
                                    this.redirectorElement.configure(this.redirector, strArr[i10]);
                                }
                                if (this.redirectorElement != null || z2) {
                                    execute.setStreamHandler(this.redirector.createHandler());
                                }
                                runExecute(execute);
                                z2 = true;
                            }
                            vector.removeAllElements();
                            vector2.removeAllElements();
                            z = z2;
                        }
                    } else {
                        logSkippingFileset(str2, directoryScanner, dir);
                        z = z2;
                    }
                    i5++;
                    z2 = z;
                    i4 = i8;
                    i3 = i6;
                }
                boolean z3 = z2;
                int i11 = i4;
                int i12 = i3;
                if (this.resources != null) {
                    Iterator it = this.resources.iterator();
                    while (true) {
                        z3 = z2;
                        i11 = i4;
                        i12 = i3;
                        if (!it.hasNext()) {
                            break;
                        }
                        Resource resource = (Resource) it.next();
                        if (resource.isExists() || !this.ignoreMissing) {
                            File file = null;
                            String name = resource.getName();
                            if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                                cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                                class$org$apache$tools$ant$types$resources$FileProvider = cls;
                            } else {
                                cls = class$org$apache$tools$ant$types$resources$FileProvider;
                            }
                            FileProvider fileProvider = (FileProvider) resource.as(cls);
                            String str3 = name;
                            if (fileProvider != null) {
                                FileResource asFileResource = ResourceUtils.asFileResource(fileProvider);
                                File baseDir = asFileResource.getBaseDir();
                                file = baseDir;
                                str3 = name;
                                if (baseDir == null) {
                                    str3 = asFileResource.getFile().getAbsolutePath();
                                    file = baseDir;
                                }
                            }
                            if (restrict(new String[]{str3}, file).length != 0) {
                                if ((!resource.isDirectory() || !resource.isExists()) && !"dir".equals(this.type)) {
                                    i2 = i3 + 1;
                                    i = i4;
                                } else if (resource.isDirectory() && !"file".equals(this.type)) {
                                    i = i4 + 1;
                                    i2 = i3;
                                }
                                vector2.add(file);
                                vector.add(str3);
                                i4 = i;
                                i3 = i2;
                                if (!this.parallel) {
                                    String[] commandline2 = getCommandline(str3, file);
                                    log(Commandline.describeCommand(commandline2), 3);
                                    execute.setCommandline(commandline2);
                                    if (this.redirectorElement != null) {
                                        setupRedirector();
                                        this.redirectorElement.configure(this.redirector, str3);
                                    }
                                    if (this.redirectorElement != null || z2) {
                                        execute.setStreamHandler(this.redirector.createHandler());
                                    }
                                    runExecute(execute);
                                    z2 = true;
                                    vector.removeAllElements();
                                    vector2.removeAllElements();
                                    i4 = i;
                                    i3 = i2;
                                }
                            }
                        }
                    }
                }
                boolean z4 = z3;
                if (this.parallel) {
                    if (vector.size() <= 0) {
                        z4 = z3;
                    }
                    runParallel(execute, vector, vector2);
                    z4 = true;
                }
                if (z4) {
                    log(new StringBuffer().append("Applied ").append(this.cmdl.getExecutable()).append(" to ").append(i12).append(" file").append(i12 != 1 ? "s" : "").append(" and ").append(i11).append(" director").append(i11 != 1 ? "ies" : "y").append(".").toString(), this.verbose ? 2 : 3);
                }
            } catch (IOException e) {
                throw new BuildException(new StringBuffer().append("Execute failed: ").append(e).toString(), e, getLocation());
            }
        } finally {
            logFlush();
            this.redirector.setAppendProperties(false);
            this.redirector.setProperties();
        }
    }

    protected void runParallel(Execute execute, Vector vector, Vector vector2) throws IOException, BuildException {
        String[] strArr = new String[vector.size()];
        vector.copyInto(strArr);
        File[] fileArr = new File[vector2.size()];
        vector2.copyInto(fileArr);
        if (this.maxParallel <= 0 || strArr.length == 0) {
            String[] commandline = getCommandline(strArr, fileArr);
            log(Commandline.describeCommand(commandline), 3);
            execute.setCommandline(commandline);
            if (this.redirectorElement != null) {
                setupRedirector();
                this.redirectorElement.configure(this.redirector, null);
                execute.setStreamHandler(this.redirector.createHandler());
            }
            runExecute(execute);
            return;
        }
        int size = vector.size();
        int i = 0;
        while (true) {
            int i2 = i;
            if (size <= 0) {
                return;
            }
            int min = Math.min(size, this.maxParallel);
            String[] strArr2 = new String[min];
            System.arraycopy(strArr, i2, strArr2, 0, min);
            File[] fileArr2 = new File[min];
            System.arraycopy(fileArr, i2, fileArr2, 0, min);
            String[] commandline2 = getCommandline(strArr2, fileArr2);
            log(Commandline.describeCommand(commandline2), 3);
            execute.setCommandline(commandline2);
            if (this.redirectorElement != null) {
                setupRedirector();
                this.redirectorElement.configure(this.redirector, null);
            }
            if (this.redirectorElement != null || i2 > 0) {
                execute.setStreamHandler(this.redirector.createHandler());
            }
            runExecute(execute);
            size -= min;
            i = i2 + min;
        }
    }

    public void setAddsourcefile(boolean z) {
        this.addSourceFile = z;
    }

    public void setDest(File file) {
        this.destDir = file;
    }

    public void setForce(boolean z) {
        this.force = z;
    }

    public void setForwardslash(boolean z) {
        this.forwardSlash = z;
    }

    public void setIgnoremissing(boolean z) {
        this.ignoreMissing = z;
    }

    public void setMaxParallel(int i) {
        this.maxParallel = i;
    }

    public void setParallel(boolean z) {
        this.parallel = z;
    }

    public void setRelative(boolean z) {
        this.relative = z;
    }

    public void setSkipEmptyFilesets(boolean z) {
        this.skipEmpty = z;
    }

    public void setType(FileDirBoth fileDirBoth) {
        this.type = fileDirBoth.getValue();
    }

    public void setVerbose(boolean z) {
        this.verbose = z;
    }

    @Override // org.apache.tools.ant.taskdefs.ExecTask
    protected void setupRedirector() {
        super.setupRedirector();
        this.redirector.setAppendProperties(true);
    }
}
