package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.PatternSet;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResourceIterator;
import org.apache.tools.ant.types.resources.Resources;
import org.apache.tools.ant.types.resources.Restrict;
import org.apache.tools.ant.types.resources.Sort;
import org.apache.tools.ant.types.resources.comparators.FileSystem;
import org.apache.tools.ant.types.resources.comparators.ResourceComparator;
import org.apache.tools.ant.types.resources.comparators.Reverse;
import org.apache.tools.ant.types.resources.selectors.Exists;
import org.apache.tools.ant.types.resources.selectors.ResourceSelector;
import org.apache.tools.ant.types.selectors.AndSelector;
import org.apache.tools.ant.types.selectors.ContainsRegexpSelector;
import org.apache.tools.ant.types.selectors.ContainsSelector;
import org.apache.tools.ant.types.selectors.DateSelector;
import org.apache.tools.ant.types.selectors.DependSelector;
import org.apache.tools.ant.types.selectors.DepthSelector;
import org.apache.tools.ant.types.selectors.ExtendSelector;
import org.apache.tools.ant.types.selectors.FileSelector;
import org.apache.tools.ant.types.selectors.FilenameSelector;
import org.apache.tools.ant.types.selectors.MajoritySelector;
import org.apache.tools.ant.types.selectors.NoneSelector;
import org.apache.tools.ant.types.selectors.NotSelector;
import org.apache.tools.ant.types.selectors.OrSelector;
import org.apache.tools.ant.types.selectors.PresentSelector;
import org.apache.tools.ant.types.selectors.SelectSelector;
import org.apache.tools.ant.types.selectors.SizeSelector;
import org.apache.tools.ant.types.selectors.modifiedselector.ModifiedSelector;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.SymbolicLinkUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Delete.class */
public class Delete extends MatchingTask {
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private static final ResourceComparator REVERSE_FILESYSTEM = new Reverse(new FileSystem());
    private static final ResourceSelector EXISTS = new Exists();
    private static FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private static SymbolicLinkUtils SYMLINK_UTILS = SymbolicLinkUtils.getSymbolicLinkUtils();
    protected File file = null;
    protected File dir = null;
    protected Vector filesets = new Vector();
    protected boolean usedMatchingTask = false;
    protected boolean includeEmpty = false;
    private int verbosity = 3;
    private boolean quiet = false;
    private boolean failonerror = true;
    private boolean deleteOnExit = false;
    private boolean removeNotFollowedSymlinks = false;
    private Resources rcs = null;
    private boolean performGc = Os.isFamily(Os.FAMILY_WINDOWS);

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Delete$ReverseDirs.class */
    private static class ReverseDirs implements ResourceCollection {
        static final Comparator REVERSE = new Comparator() { // from class: org.apache.tools.ant.taskdefs.Delete.1
            @Override // java.util.Comparator
            public int compare(Object obj, Object obj2) {
                return ((Comparable) obj).compareTo(obj2) * (-1);
            }
        };
        private File basedir;
        private String[] dirs;
        private Project project;

        ReverseDirs(Project project, File file, String[] strArr) {
            this.project = project;
            this.basedir = file;
            this.dirs = strArr;
            Arrays.sort(this.dirs, REVERSE);
        }

        @Override // org.apache.tools.ant.types.ResourceCollection
        public boolean isFilesystemOnly() {
            return true;
        }

        @Override // org.apache.tools.ant.types.ResourceCollection
        public Iterator iterator() {
            return new FileResourceIterator(this.project, this.basedir, this.dirs);
        }

        @Override // org.apache.tools.ant.types.ResourceCollection
        public int size() {
            return this.dirs.length;
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private boolean delete(File file) {
        boolean z = true;
        if (!FILE_UTILS.tryHardToDelete(file, this.performGc)) {
            if (this.deleteOnExit) {
                log(new StringBuffer().append("Failed to delete ").append(file).append(", calling deleteOnExit.").append(" This attempts to delete the file when the Ant jvm").append(" has exited and might not succeed.").toString(), this.quiet ? 3 : 2);
                file.deleteOnExit();
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    private void handle(Exception exc) {
        if (this.failonerror) {
            throw (exc instanceof BuildException ? (BuildException) exc : new BuildException(exc));
        }
        log(exc, this.quiet ? 3 : this.verbosity);
    }

    private void handle(String str) {
        handle(new BuildException(str));
    }

    private boolean isDanglingSymlink(File file) {
        boolean z;
        try {
            z = SYMLINK_UTILS.isDanglingSymbolicLink(file);
        } catch (IOException e) {
            log(new StringBuffer().append("Error while trying to detect ").append(file.getAbsolutePath()).append(" as broken symbolic link. ").append(e.getMessage()).toString(), this.quiet ? 3 : this.verbosity);
            z = false;
        }
        return z;
    }

    public void add(ResourceCollection resourceCollection) {
        if (resourceCollection == null) {
            return;
        }
        if (this.rcs == null) {
            this.rcs = new Resources();
            this.rcs.setCache(true);
        }
        this.rcs.add(resourceCollection);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void add(FileSelector fileSelector) {
        this.usedMatchingTask = true;
        super.add(fileSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addAnd(AndSelector andSelector) {
        this.usedMatchingTask = true;
        super.addAnd(andSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addContains(ContainsSelector containsSelector) {
        this.usedMatchingTask = true;
        super.addContains(containsSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addContainsRegexp(ContainsRegexpSelector containsRegexpSelector) {
        this.usedMatchingTask = true;
        super.addContainsRegexp(containsRegexpSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addCustom(ExtendSelector extendSelector) {
        this.usedMatchingTask = true;
        super.addCustom(extendSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addDate(DateSelector dateSelector) {
        this.usedMatchingTask = true;
        super.addDate(dateSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addDepend(DependSelector dependSelector) {
        this.usedMatchingTask = true;
        super.addDepend(dependSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addDepth(DepthSelector depthSelector) {
        this.usedMatchingTask = true;
        super.addDepth(depthSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addFilename(FilenameSelector filenameSelector) {
        this.usedMatchingTask = true;
        super.addFilename(filenameSelector);
    }

    public void addFileset(FileSet fileSet) {
        this.filesets.addElement(fileSet);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addMajority(MajoritySelector majoritySelector) {
        this.usedMatchingTask = true;
        super.addMajority(majoritySelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addModified(ModifiedSelector modifiedSelector) {
        this.usedMatchingTask = true;
        super.addModified(modifiedSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addNone(NoneSelector noneSelector) {
        this.usedMatchingTask = true;
        super.addNone(noneSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addNot(NotSelector notSelector) {
        this.usedMatchingTask = true;
        super.addNot(notSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addOr(OrSelector orSelector) {
        this.usedMatchingTask = true;
        super.addOr(orSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addPresent(PresentSelector presentSelector) {
        this.usedMatchingTask = true;
        super.addPresent(presentSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addSelector(SelectSelector selectSelector) {
        this.usedMatchingTask = true;
        super.addSelector(selectSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask, org.apache.tools.ant.types.selectors.SelectorContainer
    public void addSize(SizeSelector sizeSelector) {
        this.usedMatchingTask = true;
        super.addSize(sizeSelector);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask
    public PatternSet.NameEntry createExclude() {
        this.usedMatchingTask = true;
        return super.createExclude();
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask
    public PatternSet.NameEntry createExcludesFile() {
        this.usedMatchingTask = true;
        return super.createExcludesFile();
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask
    public PatternSet.NameEntry createInclude() {
        this.usedMatchingTask = true;
        return super.createInclude();
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask
    public PatternSet.NameEntry createIncludesFile() {
        this.usedMatchingTask = true;
        return super.createIncludesFile();
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask
    public PatternSet createPatternSet() {
        this.usedMatchingTask = true;
        return super.createPatternSet();
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[MOVE, AGET]}, finally: {[MOVE] complete} */
    /* JADX DEBUG: Another duplicated slice has different insns count: {[MOVE, IGET]}, finally: {[MOVE] complete} */
    /* JADX DEBUG: Another duplicated slice has different insns count: {[MOVE, INVOKE]}, finally: {[MOVE] complete} */
    /* JADX DEBUG: Incorrect finally slice size: {[MOVE, INVOKE] complete}, expected: {[MOVE] complete} */
    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:114:0x040c -> B:112:0x0404). Please submit an issue!!! */
    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Vector vector;
        Class cls;
        if (this.usedMatchingTask) {
            log("DEPRECATED - Use of the implicit FileSet is deprecated.  Use a nested fileset element instead.", this.quiet ? 3 : this.verbosity);
        }
        if (this.file == null && this.dir == null && this.filesets.size() == 0 && this.rcs == null) {
            throw new BuildException("At least one of the file or dir attributes, or a nested resource collection, must be set.");
        }
        if (this.quiet && this.failonerror) {
            throw new BuildException("quiet and failonerror cannot both be set to true", getLocation());
        }
        if (this.file != null) {
            if (this.file.exists()) {
                if (this.file.isDirectory()) {
                    log(new StringBuffer().append("Directory ").append(this.file.getAbsolutePath()).append(" cannot be removed using the file attribute.  ").append("Use dir instead.").toString(), this.quiet ? 3 : this.verbosity);
                } else {
                    log(new StringBuffer().append("Deleting: ").append(this.file.getAbsolutePath()).toString());
                    if (!delete(this.file)) {
                        handle(new StringBuffer().append("Unable to delete file ").append(this.file.getAbsolutePath()).toString());
                    }
                }
            } else if (isDanglingSymlink(this.file)) {
                log(new StringBuffer().append("Trying to delete file ").append(this.file.getAbsolutePath()).append(" which looks like a broken symlink.").toString(), this.quiet ? 3 : this.verbosity);
                if (!delete(this.file)) {
                    handle(new StringBuffer().append("Unable to delete file ").append(this.file.getAbsolutePath()).toString());
                }
            } else {
                log(new StringBuffer().append("Could not find file ").append(this.file.getAbsolutePath()).append(" to delete.").toString(), this.quiet ? 3 : this.verbosity);
            }
        }
        if (this.dir != null && !this.usedMatchingTask) {
            if (this.dir.exists() && this.dir.isDirectory()) {
                if (this.verbosity == 3) {
                    log(new StringBuffer().append("Deleting directory ").append(this.dir.getAbsolutePath()).toString());
                }
                removeDir(this.dir);
            } else if (isDanglingSymlink(this.dir)) {
                log(new StringBuffer().append("Trying to delete directory ").append(this.dir.getAbsolutePath()).append(" which looks like a broken symlink.").toString(), this.quiet ? 3 : this.verbosity);
                if (!delete(this.dir)) {
                    handle(new StringBuffer().append("Unable to delete directory ").append(this.dir.getAbsolutePath()).toString());
                }
            }
        }
        Resources resources = new Resources();
        resources.setProject(getProject());
        resources.setCache(true);
        Resources resources2 = new Resources();
        resources2.setProject(getProject());
        resources2.setCache(true);
        FileSet fileSet = null;
        if (this.usedMatchingTask) {
            fileSet = null;
            if (this.dir != null) {
                fileSet = null;
                if (this.dir.isDirectory()) {
                    fileSet = getImplicitFileSet();
                    fileSet.setProject(getProject());
                    this.filesets.add(fileSet);
                }
            }
        }
        int size = this.filesets.size();
        for (int i = 0; i < size; i++) {
            FileSet fileSet2 = (FileSet) this.filesets.get(i);
            FileSet fileSet3 = fileSet2;
            if (fileSet2.getProject() == null) {
                log("Deleting fileset with no project specified; assuming executing project", 3);
                fileSet3 = (FileSet) fileSet2.clone();
                fileSet3.setProject(getProject());
            }
            File dir = fileSet3.getDir();
            if (fileSet3.getErrorOnMissingDir() || (dir != null && dir.exists())) {
                if (dir == null) {
                    throw new BuildException("File or Resource without directory or file specified");
                }
                if (!dir.isDirectory()) {
                    handle(new StringBuffer().append("Directory does not exist: ").append(dir).toString());
                } else {
                    DirectoryScanner directoryScanner = fileSet3.getDirectoryScanner();
                    resources.add(new ResourceCollection(this, directoryScanner.getIncludedFiles(), dir) { // from class: org.apache.tools.ant.taskdefs.Delete.2
                        private final Delete this$0;
                        private final String[] val$files;
                        private final File val$fsDir;

                        {
                            this.this$0 = this;
                            this.val$files = r5;
                            this.val$fsDir = dir;
                        }

                        @Override // org.apache.tools.ant.types.ResourceCollection
                        public boolean isFilesystemOnly() {
                            return true;
                        }

                        @Override // org.apache.tools.ant.types.ResourceCollection
                        public Iterator iterator() {
                            return new FileResourceIterator(this.this$0.getProject(), this.val$fsDir, this.val$files);
                        }

                        @Override // org.apache.tools.ant.types.ResourceCollection
                        public int size() {
                            return this.val$files.length;
                        }
                    });
                    if (this.includeEmpty) {
                        resources2.add(new ReverseDirs(getProject(), dir, directoryScanner.getIncludedDirectories()));
                    }
                    if (this.removeNotFollowedSymlinks) {
                        String[] notFollowedSymlinks = directoryScanner.getNotFollowedSymlinks();
                        if (notFollowedSymlinks.length > 0) {
                            String[] strArr = new String[notFollowedSymlinks.length];
                            System.arraycopy(notFollowedSymlinks, 0, strArr, 0, notFollowedSymlinks.length);
                            Arrays.sort(strArr, ReverseDirs.REVERSE);
                            for (String str : strArr) {
                                try {
                                    SYMLINK_UTILS.deleteSymbolicLink(new File(str), this);
                                } catch (IOException e) {
                                    handle(e);
                                }
                            }
                        }
                    }
                }
            }
        }
        resources.add(resources2);
        if (this.rcs != null) {
            Restrict restrict = new Restrict();
            restrict.add(EXISTS);
            restrict.add(this.rcs);
            Sort sort = new Sort();
            sort.add(REVERSE_FILESYSTEM);
            sort.add(restrict);
            resources.add(sort);
        }
        try {
            try {
                if (resources.isFilesystemOnly()) {
                    Iterator it = resources.iterator();
                    while (it.hasNext()) {
                        Resource resource = (Resource) it.next();
                        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                            class$org$apache$tools$ant$types$resources$FileProvider = cls;
                        } else {
                            cls = class$org$apache$tools$ant$types$resources$FileProvider;
                        }
                        File file = ((FileProvider) resource.as(cls)).getFile();
                        if (file.exists() && (!file.isDirectory() || file.list().length == 0)) {
                            log(new StringBuffer().append("Deleting ").append(file).toString(), this.verbosity);
                            if (!delete(file) && this.failonerror) {
                                handle(new StringBuffer().append("Unable to delete ").append(file.isDirectory() ? "directory " : "file ").append(file).toString());
                            }
                        }
                    }
                } else {
                    handle(new StringBuffer().append(getTaskName()).append(" handles only filesystem resources").toString());
                }
            } catch (Throwable th) {
                if (fileSet != null) {
                    this.filesets.remove(fileSet);
                }
                throw th;
            }
        } catch (Exception e2) {
            handle(e2);
            if (fileSet == null) {
                return;
            }
            vector = this.filesets;
        }
        if (fileSet == null) {
            return;
        }
        vector = this.filesets;
        vector.remove(fileSet);
    }

    protected void removeDir(File file) {
        String[] list = file.list();
        String[] strArr = list;
        if (list == null) {
            strArr = new String[0];
        }
        for (String str : strArr) {
            File file2 = new File(file, str);
            if (file2.isDirectory()) {
                removeDir(file2);
            } else {
                log(new StringBuffer().append("Deleting ").append(file2.getAbsolutePath()).toString(), this.quiet ? 3 : this.verbosity);
                if (!delete(file2)) {
                    handle(new StringBuffer().append("Unable to delete file ").append(file2.getAbsolutePath()).toString());
                }
            }
        }
        log(new StringBuffer().append("Deleting directory ").append(file.getAbsolutePath()).toString(), this.verbosity);
        if (!delete(file)) {
            handle(new StringBuffer().append("Unable to delete directory ").append(file.getAbsolutePath()).toString());
        }
    }

    protected void removeFiles(File file, String[] strArr, String[] strArr2) {
        int i;
        if (strArr.length > 0) {
            log(new StringBuffer().append("Deleting ").append(strArr.length).append(" files from ").append(file.getAbsolutePath()).toString(), this.quiet ? 3 : this.verbosity);
            for (String str : strArr) {
                File file2 = new File(file, str);
                log(new StringBuffer().append("Deleting ").append(file2.getAbsolutePath()).toString(), this.quiet ? 3 : this.verbosity);
                if (!delete(file2)) {
                    handle(new StringBuffer().append("Unable to delete file ").append(file2.getAbsolutePath()).toString());
                }
            }
        }
        if (strArr2.length <= 0 || !this.includeEmpty) {
            return;
        }
        int i2 = 0;
        int length = strArr2.length - 1;
        while (length >= 0) {
            File file3 = new File(file, strArr2[length]);
            String[] list = file3.list();
            if (list != null) {
                i = i2;
                if (list.length != 0) {
                    length--;
                    i2 = i;
                }
            }
            log(new StringBuffer().append("Deleting ").append(file3.getAbsolutePath()).toString(), this.quiet ? 3 : this.verbosity);
            if (!delete(file3)) {
                handle(new StringBuffer().append("Unable to delete directory ").append(file3.getAbsolutePath()).toString());
                i = i2;
            } else {
                i = i2 + 1;
            }
            length--;
            i2 = i;
        }
        if (i2 <= 0) {
            return;
        }
        log(new StringBuffer().append("Deleted ").append(i2).append(" director").append(i2 == 1 ? "y" : "ies").append(" form ").append(file.getAbsolutePath()).toString(), this.quiet ? 3 : this.verbosity);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask
    public void setCaseSensitive(boolean z) {
        this.usedMatchingTask = true;
        super.setCaseSensitive(z);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask
    public void setDefaultexcludes(boolean z) {
        this.usedMatchingTask = true;
        super.setDefaultexcludes(z);
    }

    public void setDeleteOnExit(boolean z) {
        this.deleteOnExit = z;
    }

    public void setDir(File file) {
        this.dir = file;
        getImplicitFileSet().setDir(file);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask
    public void setExcludes(String str) {
        this.usedMatchingTask = true;
        super.setExcludes(str);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask
    public void setExcludesfile(File file) {
        this.usedMatchingTask = true;
        super.setExcludesfile(file);
    }

    public void setFailOnError(boolean z) {
        this.failonerror = z;
    }

    public void setFile(File file) {
        this.file = file;
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask
    public void setFollowSymlinks(boolean z) {
        this.usedMatchingTask = true;
        super.setFollowSymlinks(z);
    }

    public void setIncludeEmptyDirs(boolean z) {
        this.includeEmpty = z;
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask
    public void setIncludes(String str) {
        this.usedMatchingTask = true;
        super.setIncludes(str);
    }

    @Override // org.apache.tools.ant.taskdefs.MatchingTask
    public void setIncludesfile(File file) {
        this.usedMatchingTask = true;
        super.setIncludesfile(file);
    }

    public void setPerformGcOnFailedDelete(boolean z) {
        this.performGc = z;
    }

    public void setQuiet(boolean z) {
        this.quiet = z;
        if (z) {
            this.failonerror = false;
        }
    }

    public void setRemoveNotFollowedSymlinks(boolean z) {
        this.removeNotFollowedSymlinks = z;
    }

    public void setVerbose(boolean z) {
        if (z) {
            this.verbosity = 2;
        } else {
            this.verbosity = 3;
        }
    }
}
