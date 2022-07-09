package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.taskdefs.condition.Os;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.FilterSet;
import org.apache.tools.ant.types.FilterSetCollection;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Move.class */
public class Move extends Copy {
    private boolean performGc = Os.isFamily(Os.FAMILY_WINDOWS);

    public Move() {
        setOverwrite(true);
    }

    private void copyFile(File file, File file2, boolean z, boolean z2) {
        try {
            log(new StringBuffer().append("Copying ").append(file).append(" to ").append(file2).toString(), this.verbosity);
            FilterSetCollection filterSetCollection = new FilterSetCollection();
            if (z) {
                filterSetCollection.addFilterSet(getProject().getGlobalFilterSet());
            }
            Iterator it = getFilterSets().iterator();
            while (it.hasNext()) {
                filterSetCollection.addFilterSet((FilterSet) it.next());
            }
            getFileUtils().copyFile(file, file2, filterSetCollection, getFilterChains(), this.forceOverwrite, getPreserveLastModified(), false, getEncoding(), getOutputEncoding(), getProject(), getForce());
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Failed to copy ").append(file).append(" to ").append(file2).append(" due to ").append(e.getMessage()).toString(), e, getLocation());
        }
    }

    private void moveFile(File file, File file2, boolean z, boolean z2) {
        try {
            log(new StringBuffer().append("Attempting to rename: ").append(file).append(" to ").append(file2).toString(), this.verbosity);
            if (renameFile(file, file2, z, this.forceOverwrite)) {
                return;
            }
            copyFile(file, file2, z, z2);
            if (getFileUtils().tryHardToDelete(file, this.performGc)) {
                return;
            }
            throw new BuildException(new StringBuffer().append("Unable to delete file ").append(file.getAbsolutePath()).toString());
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Failed to rename ").append(file).append(" to ").append(file2).append(" due to ").append(e.getMessage()).toString(), e, getLocation());
        }
    }

    protected void deleteDir(File file) {
        deleteDir(file, false);
    }

    protected void deleteDir(File file, boolean z) {
        String[] list = file.list();
        if (list == null) {
            return;
        }
        for (String str : list) {
            File file2 = new File(file, str);
            if (!file2.isDirectory()) {
                if (z && !getFileUtils().tryHardToDelete(file2, this.performGc)) {
                    throw new BuildException(new StringBuffer().append("Unable to delete file ").append(file2.getAbsolutePath()).toString());
                }
                throw new BuildException(new StringBuffer().append("UNEXPECTED ERROR - The file ").append(file2.getAbsolutePath()).append(" should not exist!").toString());
            }
            deleteDir(file2);
        }
        log(new StringBuffer().append("Deleting directory ").append(file.getAbsolutePath()).toString(), this.verbosity);
        if (getFileUtils().tryHardToDelete(file, this.performGc)) {
            return;
        }
        throw new BuildException(new StringBuffer().append("Unable to delete directory ").append(file.getAbsolutePath()).toString());
    }

    @Override // org.apache.tools.ant.taskdefs.Copy
    protected void doFileOperations() {
        int i;
        boolean z;
        if (this.completeDirMap.size() > 0) {
            for (File file : this.completeDirMap.keySet()) {
                File file2 = (File) this.completeDirMap.get(file);
                try {
                    log(new StringBuffer().append("Attempting to rename dir: ").append(file).append(" to ").append(file2).toString(), this.verbosity);
                    if (!renameFile(file, file2, this.filtering, this.forceOverwrite)) {
                        FileSet fileSet = new FileSet();
                        fileSet.setProject(getProject());
                        fileSet.setDir(file);
                        addFileset(fileSet);
                        DirectoryScanner directoryScanner = fileSet.getDirectoryScanner(getProject());
                        scan(file, file2, directoryScanner.getIncludedFiles(), directoryScanner.getIncludedDirectories());
                    }
                } catch (IOException e) {
                    throw new BuildException(new StringBuffer().append("Failed to rename dir ").append(file).append(" to ").append(file2).append(" due to ").append(e.getMessage()).toString(), e, getLocation());
                }
            }
        }
        int size = this.fileCopyMap.size();
        if (size > 0) {
            log(new StringBuffer().append("Moving ").append(size).append(" file").append(size == 1 ? "" : "s").append(" to ").append(this.destDir.getAbsolutePath()).toString());
            for (String str : this.fileCopyMap.keySet()) {
                File file3 = new File(str);
                boolean z2 = false;
                if (file3.exists()) {
                    String[] strArr = (String[]) this.fileCopyMap.get(str);
                    for (int i2 = 0; i2 < strArr.length; i2++) {
                        String str2 = strArr[i2];
                        if (str.equals(str2)) {
                            log(new StringBuffer().append("Skipping self-move of ").append(str).toString(), this.verbosity);
                            z2 = true;
                        } else {
                            File file4 = new File(str2);
                            if (i2 + 1 != strArr.length || z2) {
                                copyFile(file3, file4, this.filtering, this.forceOverwrite);
                            } else {
                                moveFile(file3, file4, this.filtering, this.forceOverwrite);
                            }
                        }
                    }
                }
            }
        }
        if (this.includeEmpty) {
            int i3 = 0;
            for (String str3 : this.dirCopyMap.keySet()) {
                String[] strArr2 = (String[]) this.dirCopyMap.get(str3);
                boolean z3 = false;
                int i4 = 0;
                int i5 = i3;
                while (i4 < strArr2.length) {
                    if (str3.equals(strArr2[i4])) {
                        log(new StringBuffer().append("Skipping self-move of ").append(str3).toString(), this.verbosity);
                        z = true;
                        i = i5;
                    } else {
                        File file5 = new File(strArr2[i4]);
                        i = i5;
                        z = z3;
                        if (!file5.exists()) {
                            if (!file5.mkdirs()) {
                                log(new StringBuffer().append("Unable to create directory ").append(file5.getAbsolutePath()).toString(), 0);
                                i = i5;
                                z = z3;
                            } else {
                                i = i5 + 1;
                                z = z3;
                            }
                        }
                    }
                    i4++;
                    i5 = i;
                    z3 = z;
                }
                File file6 = new File(str3);
                i3 = i5;
                if (!z3) {
                    i3 = i5;
                    if (okToDelete(file6)) {
                        deleteDir(file6);
                        i3 = i5;
                    }
                }
            }
            if (i3 <= 0) {
                return;
            }
            log(new StringBuffer().append("Moved ").append(this.dirCopyMap.size()).append(" empty director").append(this.dirCopyMap.size() == 1 ? "y" : "ies").append(" to ").append(i3).append(" empty director").append(i3 == 1 ? "y" : "ies").append(" under ").append(this.destDir.getAbsolutePath()).toString());
        }
    }

    protected boolean okToDelete(File file) {
        boolean z;
        String[] list = file.list();
        if (list != null) {
            int i = 0;
            while (true) {
                if (i >= list.length) {
                    z = true;
                    break;
                }
                File file2 = new File(file, list[i]);
                z = false;
                if (!file2.isDirectory()) {
                    break;
                }
                z = false;
                if (!okToDelete(file2)) {
                    break;
                }
                i++;
            }
        } else {
            z = false;
        }
        return z;
    }

    protected boolean renameFile(File file, File file2, boolean z, boolean z2) throws IOException, BuildException {
        boolean z3;
        File file3;
        File file4;
        if (file2.isDirectory() || z || getFilterSets().size() > 0 || getFilterChains().size() > 0) {
            z3 = false;
        } else {
            if (file2.isFile() && !file2.canWrite()) {
                if (!getForce()) {
                    throw new IOException(new StringBuffer().append("can't replace read-only destination file ").append(file2).toString());
                }
                if (!getFileUtils().tryHardToDelete(file2)) {
                    throw new IOException(new StringBuffer().append("failed to delete read-only destination file ").append(file2).toString());
                }
            }
            File parentFile = file2.getParentFile();
            if (parentFile == null || parentFile.exists()) {
                file3 = file;
                file4 = file2;
                if (file2.isFile()) {
                    File canonicalFile = getFileUtils().normalize(file.getAbsolutePath()).getCanonicalFile();
                    File normalize = getFileUtils().normalize(file2.getAbsolutePath());
                    if (normalize.getAbsolutePath().equals(canonicalFile.getAbsolutePath())) {
                        log(new StringBuffer().append("Rename of ").append(canonicalFile).append(" to ").append(normalize).append(" is a no-op.").toString(), 3);
                        z3 = true;
                    } else {
                        file3 = canonicalFile;
                        file4 = normalize;
                        if (!getFileUtils().areSame(canonicalFile, normalize)) {
                            file3 = canonicalFile;
                            file4 = normalize;
                            if (!getFileUtils().tryHardToDelete(normalize, this.performGc)) {
                                throw new BuildException(new StringBuffer().append("Unable to remove existing file ").append(normalize).toString());
                            }
                        }
                    }
                }
            } else {
                parentFile.mkdirs();
                file4 = file2;
                file3 = file;
            }
            z3 = file3.renameTo(file4);
        }
        return z3;
    }

    public void setPerformGcOnFailedDelete(boolean z) {
        this.performGc = z;
    }

    @Override // org.apache.tools.ant.taskdefs.Copy
    protected void validateAttributes() throws BuildException {
        if (this.file == null || !this.file.isDirectory()) {
            super.validateAttributes();
        } else if ((this.destFile != null && this.destDir != null) || (this.destFile == null && this.destDir == null)) {
            throw new BuildException("One and only one of tofile and todir must be set.");
        } else {
            this.destFile = this.destFile == null ? new File(this.destDir, this.file.getName()) : this.destFile;
            this.destDir = this.destDir == null ? this.destFile.getParentFile() : this.destDir;
            this.completeDirMap.put(this.file, this.destFile);
            this.file = null;
        }
    }
}
