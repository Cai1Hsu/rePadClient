package org.apache.tools.ant.taskdefs.optional.extension;

import java.io.File;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.FileSet;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/JarLibDisplayTask.class */
public class JarLibDisplayTask extends Task {
    private File libraryFile;
    private final Vector libraryFileSets = new Vector();

    private void validate() throws BuildException {
        if (this.libraryFile != null || !this.libraryFileSets.isEmpty()) {
            if (this.libraryFile != null && !this.libraryFile.exists()) {
                throw new BuildException(new StringBuffer().append("File '").append(this.libraryFile).append("' does not exist.").toString());
            }
            if (this.libraryFile != null && !this.libraryFile.isFile()) {
                throw new BuildException(new StringBuffer().append("'").append(this.libraryFile).append("' is not a file.").toString());
            }
            return;
        }
        throw new BuildException("File attribute not specified.");
    }

    public void addFileset(FileSet fileSet) {
        this.libraryFileSets.addElement(fileSet);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        validate();
        LibraryDisplayer libraryDisplayer = new LibraryDisplayer();
        if (this.libraryFileSets.isEmpty()) {
            libraryDisplayer.displayLibrary(this.libraryFile);
            return;
        }
        Iterator it = this.libraryFileSets.iterator();
        while (it.hasNext()) {
            DirectoryScanner directoryScanner = ((FileSet) it.next()).getDirectoryScanner(getProject());
            File basedir = directoryScanner.getBasedir();
            for (String str : directoryScanner.getIncludedFiles()) {
                libraryDisplayer.displayLibrary(new File(basedir, str));
            }
        }
    }

    public void setFile(File file) {
        this.libraryFile = file;
    }
}
