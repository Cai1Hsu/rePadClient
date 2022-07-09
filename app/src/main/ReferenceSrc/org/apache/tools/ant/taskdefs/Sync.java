package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.AbstractFileSet;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.PatternSet;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.Resources;
import org.apache.tools.ant.types.resources.Restrict;
import org.apache.tools.ant.types.resources.selectors.Exists;
import org.apache.tools.ant.types.selectors.FileSelector;
import org.apache.tools.ant.types.selectors.NoneSelector;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Sync.class */
public class Sync extends Task {
    private MyCopy myCopy;
    private Resources resources = null;
    private SyncTarget syncTarget;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Sync$MyCopy.class */
    public static class MyCopy extends Copy {
        private Set nonOrphans = new HashSet();

        public boolean getIncludeEmptyDirs() {
            return this.includeEmpty;
        }

        public File getToDir() {
            return this.destDir;
        }

        @Override // org.apache.tools.ant.taskdefs.Copy
        protected Map scan(Resource[] resourceArr, File file) {
            Sync.assertTrue("No mapper", this.mapperElement == null);
            for (Resource resource : resourceArr) {
                this.nonOrphans.add(resource.getName());
            }
            return super.scan(resourceArr, file);
        }

        @Override // org.apache.tools.ant.taskdefs.Copy
        protected void scan(File file, File file2, String[] strArr, String[] strArr2) {
            Sync.assertTrue("No mapper", this.mapperElement == null);
            super.scan(file, file2, strArr, strArr2);
            for (String str : strArr) {
                this.nonOrphans.add(str);
            }
            for (String str2 : strArr2) {
                this.nonOrphans.add(str2);
            }
        }

        @Override // org.apache.tools.ant.taskdefs.Copy
        protected boolean supportsNonFileResources() {
            return true;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Sync$SyncTarget.class */
    public static class SyncTarget extends AbstractFileSet {
        private Boolean preserveEmptyDirs;

        public FileSet toFileSet(boolean z) {
            FileSet fileSet = new FileSet();
            fileSet.setCaseSensitive(isCaseSensitive());
            fileSet.setFollowSymlinks(isFollowSymlinks());
            fileSet.setMaxLevelsOfSymlinks(getMaxLevelsOfSymlinks());
            fileSet.setProject(getProject());
            if (z) {
                PatternSet mergePatterns = mergePatterns(getProject());
                fileSet.appendIncludes(mergePatterns.getIncludePatterns(getProject()));
                fileSet.appendExcludes(mergePatterns.getExcludePatterns(getProject()));
                Enumeration selectorElements = selectorElements();
                while (selectorElements.hasMoreElements()) {
                    fileSet.appendSelector((FileSelector) selectorElements.nextElement());
                }
                fileSet.setDefaultexcludes(getDefaultexcludes());
            }
            return fileSet;
        }

        public Boolean getPreserveEmptyDirs() {
            return this.preserveEmptyDirs;
        }

        @Override // org.apache.tools.ant.types.AbstractFileSet
        public void setDir(File file) throws BuildException {
            throw new BuildException("preserveintarget doesn't support the dir attribute");
        }

        public void setPreserveEmptyDirs(boolean z) {
            this.preserveEmptyDirs = Boolean.valueOf(z);
        }
    }

    public static void assertTrue(String str, boolean z) {
        if (!z) {
            throw new BuildException(new StringBuffer().append("Assertion Error: ").append(str).toString());
        }
    }

    private void configureTask(Task task) {
        task.setProject(getProject());
        task.setTaskName(getTaskName());
        task.setOwningTarget(getOwningTarget());
        task.init();
    }

    private Boolean getExplicitPreserveEmptyDirs() {
        return this.syncTarget == null ? null : this.syncTarget.getPreserveEmptyDirs();
    }

    private void logRemovedCount(int i, String str, String str2, String str3) {
        File toDir = this.myCopy.getToDir();
        if (str == null) {
            str = "";
        }
        StringBuffer append = new StringBuffer().append(str);
        if (i >= 2) {
            str2 = str3;
        }
        String stringBuffer = append.append(str2).toString();
        if (i > 0) {
            log(new StringBuffer().append("Removed ").append(i).append(" ").append(stringBuffer).append(" from ").append(toDir).toString(), 2);
        } else {
            log(new StringBuffer().append("NO ").append(stringBuffer).append(" to remove from ").append(toDir).toString(), 3);
        }
    }

    private int removeEmptyDirectories(File file, boolean z, Set set) {
        int i = 0;
        int i2 = 0;
        if (file.isDirectory()) {
            File[] listFiles = file.listFiles();
            int i3 = 0;
            while (i3 < listFiles.length) {
                File file2 = listFiles[i3];
                int i4 = i2;
                if (file2.isDirectory()) {
                    i4 = i2 + removeEmptyDirectories(file2, true, set);
                }
                i3++;
                i2 = i4;
            }
            File[] fileArr = listFiles;
            if (listFiles.length > 0) {
                fileArr = file.listFiles();
            }
            i = i2;
            if (fileArr.length < 1) {
                i = i2;
                if (z) {
                    i = i2;
                    if (!set.contains(file)) {
                        log(new StringBuffer().append("Removing empty directory: ").append(file).toString(), 4);
                        file.delete();
                        i = i2 + 1;
                    }
                }
            }
        }
        return i;
    }

    private int removeEmptyDirectories(Set set) {
        int i = 0;
        Iterator it = set.iterator();
        while (it.hasNext()) {
            File file = (File) it.next();
            String[] list = file.list();
            if (list == null || list.length == 0) {
                log(new StringBuffer().append("Removing empty directory: ").append(file).toString(), 4);
                file.delete();
                i++;
            }
        }
        return i;
    }

    private int[] removeOrphanFiles(Set set, File file, Set set2) {
        DirectoryScanner directoryScanner;
        int[] iArr = {0, 0};
        String[] strArr = (String[]) set.toArray(new String[set.size() + 1]);
        strArr[set.size()] = "";
        if (this.syncTarget != null) {
            FileSet fileSet = this.syncTarget.toFileSet(false);
            fileSet.setDir(file);
            PatternSet mergePatterns = this.syncTarget.mergePatterns(getProject());
            fileSet.appendExcludes(mergePatterns.getIncludePatterns(getProject()));
            fileSet.appendIncludes(mergePatterns.getExcludePatterns(getProject()));
            fileSet.setDefaultexcludes(!this.syncTarget.getDefaultexcludes());
            FileSelector[] selectors = this.syncTarget.getSelectors(getProject());
            if (selectors.length > 0) {
                NoneSelector noneSelector = new NoneSelector();
                for (FileSelector fileSelector : selectors) {
                    noneSelector.appendSelector(fileSelector);
                }
                fileSet.appendSelector(noneSelector);
            }
            directoryScanner = fileSet.getDirectoryScanner(getProject());
        } else {
            directoryScanner = new DirectoryScanner();
            directoryScanner.setBasedir(file);
        }
        directoryScanner.addExcludes(strArr);
        directoryScanner.scan();
        for (String str : directoryScanner.getIncludedFiles()) {
            File file2 = new File(file, str);
            log(new StringBuffer().append("Removing orphan file: ").append(file2).toString(), 4);
            file2.delete();
            iArr[1] = iArr[1] + 1;
        }
        String[] includedDirectories = directoryScanner.getIncludedDirectories();
        for (int length = includedDirectories.length - 1; length >= 0; length--) {
            File file3 = new File(file, includedDirectories[length]);
            String[] list = file3.list();
            if (list == null || list.length < 1) {
                log(new StringBuffer().append("Removing orphan directory: ").append(file3).toString(), 4);
                file3.delete();
                iArr[0] = iArr[0] + 1;
            }
        }
        Boolean explicitPreserveEmptyDirs = getExplicitPreserveEmptyDirs();
        if (explicitPreserveEmptyDirs != null && explicitPreserveEmptyDirs.booleanValue() != this.myCopy.getIncludeEmptyDirs()) {
            FileSet fileSet2 = this.syncTarget.toFileSet(true);
            fileSet2.setDir(file);
            String[] includedDirectories2 = fileSet2.getDirectoryScanner(getProject()).getIncludedDirectories();
            for (int length2 = includedDirectories2.length - 1; length2 >= 0; length2--) {
                set2.add(new File(file, includedDirectories2[length2]));
            }
        }
        return iArr;
    }

    public void add(ResourceCollection resourceCollection) {
        if ((resourceCollection instanceof FileSet) && resourceCollection.isFilesystemOnly()) {
            this.myCopy.add(resourceCollection);
            return;
        }
        if (this.resources == null) {
            Restrict restrict = new Restrict();
            restrict.add(new Exists());
            Resources resources = new Resources();
            this.resources = resources;
            restrict.add(resources);
            this.myCopy.add(restrict);
        }
        this.resources.add(resourceCollection);
    }

    public void addFileset(FileSet fileSet) {
        add(fileSet);
    }

    public void addPreserveInTarget(SyncTarget syncTarget) {
        if (this.syncTarget != null) {
            throw new BuildException("you must not specify multiple preserveintarget elements.");
        }
        this.syncTarget = syncTarget;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        File toDir = this.myCopy.getToDir();
        Set set = this.myCopy.nonOrphans;
        boolean z = !toDir.exists() || toDir.list().length < 1;
        log(new StringBuffer().append("PASS#1: Copying files to ").append(toDir).toString(), 4);
        this.myCopy.execute();
        if (z) {
            log(new StringBuffer().append("NO removing necessary in ").append(toDir).toString(), 4);
            return;
        }
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        log(new StringBuffer().append("PASS#2: Removing orphan files from ").append(toDir).toString(), 4);
        int[] removeOrphanFiles = removeOrphanFiles(set, toDir, linkedHashSet);
        logRemovedCount(removeOrphanFiles[0], "dangling director", "y", "ies");
        logRemovedCount(removeOrphanFiles[1], "dangling file", "", "s");
        if (this.myCopy.getIncludeEmptyDirs() && getExplicitPreserveEmptyDirs() != Boolean.FALSE) {
            return;
        }
        log(new StringBuffer().append("PASS#3: Removing empty directories from ").append(toDir).toString(), 4);
        logRemovedCount(!this.myCopy.getIncludeEmptyDirs() ? removeEmptyDirectories(toDir, false, linkedHashSet) : removeEmptyDirectories(linkedHashSet), "empty director", "y", "ies");
    }

    @Override // org.apache.tools.ant.Task
    public void init() throws BuildException {
        this.myCopy = new MyCopy();
        configureTask(this.myCopy);
        this.myCopy.setFiltering(false);
        this.myCopy.setIncludeEmptyDirs(false);
        this.myCopy.setPreserveLastModified(true);
    }

    public void setFailOnError(boolean z) {
        this.myCopy.setFailOnError(z);
    }

    public void setGranularity(long j) {
        this.myCopy.setGranularity(j);
    }

    public void setIncludeEmptyDirs(boolean z) {
        this.myCopy.setIncludeEmptyDirs(z);
    }

    public void setOverwrite(boolean z) {
        this.myCopy.setOverwrite(z);
    }

    public void setTodir(File file) {
        this.myCopy.setTodir(file);
    }

    public void setVerbose(boolean z) {
        this.myCopy.setVerbose(z);
    }
}
