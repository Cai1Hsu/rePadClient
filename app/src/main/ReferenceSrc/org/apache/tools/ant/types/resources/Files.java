package org.apache.tools.ant.types.resources;

import java.io.File;
import java.util.Collections;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.PatternSet;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.selectors.AbstractSelectorContainer;
import org.apache.tools.ant.types.selectors.FileSelector;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/Files.class */
public class Files extends AbstractSelectorContainer implements ResourceCollection {
    private static final Iterator EMPTY_ITERATOR = Collections.EMPTY_SET.iterator();
    private Vector additionalPatterns;
    private boolean caseSensitive;
    private PatternSet defaultPatterns;
    private DirectoryScanner ds;
    private boolean followSymlinks;
    private boolean useDefaultExcludes;

    public Files() {
        this.defaultPatterns = new PatternSet();
        this.additionalPatterns = new Vector();
        this.useDefaultExcludes = true;
        this.caseSensitive = true;
        this.followSymlinks = true;
        this.ds = null;
    }

    protected Files(Files files) {
        this.defaultPatterns = new PatternSet();
        this.additionalPatterns = new Vector();
        this.useDefaultExcludes = true;
        this.caseSensitive = true;
        this.followSymlinks = true;
        this.ds = null;
        this.defaultPatterns = files.defaultPatterns;
        this.additionalPatterns = files.additionalPatterns;
        this.useDefaultExcludes = files.useDefaultExcludes;
        this.caseSensitive = files.caseSensitive;
        this.followSymlinks = files.followSymlinks;
        this.ds = files.ds;
        setProject(files.getProject());
    }

    private void ensureDirectoryScannerSetup() {
        synchronized (this) {
            dieOnCircularReference();
            if (this.ds == null) {
                this.ds = new DirectoryScanner();
                PatternSet mergePatterns = mergePatterns(getProject());
                this.ds.setIncludes(mergePatterns.getIncludePatterns(getProject()));
                this.ds.setExcludes(mergePatterns.getExcludePatterns(getProject()));
                this.ds.setSelectors(getSelectors(getProject()));
                if (this.useDefaultExcludes) {
                    this.ds.addDefaultExcludes();
                }
                this.ds.setCaseSensitive(this.caseSensitive);
                this.ds.setFollowSymlinks(this.followSymlinks);
            }
        }
    }

    private boolean hasPatterns(PatternSet patternSet) {
        String[] includePatterns = patternSet.getIncludePatterns(getProject());
        return (includePatterns != null && includePatterns.length > 0) || (includePatterns != null && patternSet.getExcludePatterns(getProject()).length > 0);
    }

    public void appendExcludes(String[] strArr) {
        synchronized (this) {
            checkAttributesAllowed();
            if (strArr != null) {
                for (String str : strArr) {
                    this.defaultPatterns.createExclude().setName(str);
                }
                this.ds = null;
            }
        }
    }

    public void appendIncludes(String[] strArr) {
        synchronized (this) {
            checkAttributesAllowed();
            if (strArr != null) {
                for (String str : strArr) {
                    this.defaultPatterns.createInclude().setName(str);
                }
                this.ds = null;
            }
        }
    }

    @Override // org.apache.tools.ant.types.selectors.AbstractSelectorContainer, org.apache.tools.ant.types.selectors.SelectorContainer
    public void appendSelector(FileSelector fileSelector) {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            super.appendSelector(fileSelector);
            this.ds = null;
        }
    }

    @Override // org.apache.tools.ant.types.selectors.AbstractSelectorContainer, org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        Files files;
        synchronized (this) {
            if (!isReference()) {
                Files files2 = (Files) super.clone();
                files2.defaultPatterns = (PatternSet) this.defaultPatterns.clone();
                files2.additionalPatterns = new Vector(this.additionalPatterns.size());
                Iterator it = this.additionalPatterns.iterator();
                while (true) {
                    files = files2;
                    if (!it.hasNext()) {
                        break;
                    }
                    files2.additionalPatterns.add(((PatternSet) it.next()).clone());
                }
            } else {
                files = getRef().clone();
            }
        }
        return files;
    }

    public PatternSet.NameEntry createExclude() {
        PatternSet.NameEntry createExclude;
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            this.ds = null;
            createExclude = this.defaultPatterns.createExclude();
        }
        return createExclude;
    }

    public PatternSet.NameEntry createExcludesFile() {
        PatternSet.NameEntry createExcludesFile;
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            this.ds = null;
            createExcludesFile = this.defaultPatterns.createExcludesFile();
        }
        return createExcludesFile;
    }

    public PatternSet.NameEntry createInclude() {
        PatternSet.NameEntry createInclude;
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            this.ds = null;
            createInclude = this.defaultPatterns.createInclude();
        }
        return createInclude;
    }

    public PatternSet.NameEntry createIncludesFile() {
        PatternSet.NameEntry createIncludesFile;
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            this.ds = null;
            createIncludesFile = this.defaultPatterns.createIncludesFile();
        }
        return createIncludesFile;
    }

    public PatternSet createPatternSet() {
        PatternSet patternSet;
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            patternSet = new PatternSet();
            this.additionalPatterns.addElement(patternSet);
            this.ds = null;
            setChecked(false);
        }
        return patternSet;
    }

    public boolean getDefaultexcludes() {
        boolean defaultexcludes;
        synchronized (this) {
            defaultexcludes = isReference() ? getRef().getDefaultexcludes() : this.useDefaultExcludes;
        }
        return defaultexcludes;
    }

    protected Files getRef() {
        return (Files) getCheckedRef();
    }

    public boolean hasPatterns() {
        boolean z;
        synchronized (this) {
            if (!isReference()) {
                dieOnCircularReference();
                if (!hasPatterns(this.defaultPatterns)) {
                    Iterator it = this.additionalPatterns.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            z = false;
                            break;
                        } else if (hasPatterns((PatternSet) it.next())) {
                            z = true;
                            break;
                        }
                    }
                } else {
                    z = true;
                }
            } else {
                z = getRef().hasPatterns();
            }
        }
        return z;
    }

    public boolean isCaseSensitive() {
        boolean isCaseSensitive;
        synchronized (this) {
            isCaseSensitive = isReference() ? getRef().isCaseSensitive() : this.caseSensitive;
        }
        return isCaseSensitive;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public boolean isFilesystemOnly() {
        return true;
    }

    public boolean isFollowSymlinks() {
        boolean isFollowSymlinks;
        synchronized (this) {
            isFollowSymlinks = isReference() ? getRef().isFollowSymlinks() : this.followSymlinks;
        }
        return isFollowSymlinks;
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public Iterator iterator() {
        FileResourceIterator fileResourceIterator;
        synchronized (this) {
            if (isReference()) {
                fileResourceIterator = getRef().iterator();
            } else {
                ensureDirectoryScannerSetup();
                this.ds.scan();
                int includedFilesCount = this.ds.getIncludedFilesCount();
                int includedDirsCount = this.ds.getIncludedDirsCount();
                if (includedFilesCount + includedDirsCount == 0) {
                    fileResourceIterator = EMPTY_ITERATOR;
                } else {
                    FileResourceIterator fileResourceIterator2 = new FileResourceIterator(getProject());
                    if (includedFilesCount > 0) {
                        fileResourceIterator2.addFiles(this.ds.getIncludedFiles());
                    }
                    fileResourceIterator = fileResourceIterator2;
                    if (includedDirsCount > 0) {
                        fileResourceIterator2.addFiles(this.ds.getIncludedDirectories());
                        fileResourceIterator = fileResourceIterator2;
                    }
                }
            }
        }
        return fileResourceIterator;
    }

    public String[] mergeExcludes(Project project) {
        return mergePatterns(project).getExcludePatterns(project);
    }

    public String[] mergeIncludes(Project project) {
        return mergePatterns(project).getIncludePatterns(project);
    }

    public PatternSet mergePatterns(Project project) {
        PatternSet patternSet;
        synchronized (this) {
            if (!isReference()) {
                dieOnCircularReference();
                PatternSet patternSet2 = new PatternSet();
                patternSet2.append(this.defaultPatterns, project);
                int size = this.additionalPatterns.size();
                int i = 0;
                while (true) {
                    patternSet = patternSet2;
                    if (i >= size) {
                        break;
                    }
                    patternSet2.append((PatternSet) this.additionalPatterns.elementAt(i), project);
                    i++;
                }
            } else {
                patternSet = getRef().mergePatterns(project);
            }
        }
        return patternSet;
    }

    public void setCaseSensitive(boolean z) {
        synchronized (this) {
            checkAttributesAllowed();
            this.caseSensitive = z;
            this.ds = null;
        }
    }

    public void setDefaultexcludes(boolean z) {
        synchronized (this) {
            checkAttributesAllowed();
            this.useDefaultExcludes = z;
            this.ds = null;
        }
    }

    public void setExcludes(String str) {
        synchronized (this) {
            checkAttributesAllowed();
            this.defaultPatterns.setExcludes(str);
            this.ds = null;
        }
    }

    public void setExcludesfile(File file) throws BuildException {
        synchronized (this) {
            checkAttributesAllowed();
            this.defaultPatterns.setExcludesfile(file);
            this.ds = null;
        }
    }

    public void setFollowSymlinks(boolean z) {
        synchronized (this) {
            checkAttributesAllowed();
            this.followSymlinks = z;
            this.ds = null;
        }
    }

    public void setIncludes(String str) {
        synchronized (this) {
            checkAttributesAllowed();
            this.defaultPatterns.setIncludes(str);
            this.ds = null;
        }
    }

    public void setIncludesfile(File file) throws BuildException {
        synchronized (this) {
            checkAttributesAllowed();
            this.defaultPatterns.setIncludesfile(file);
            this.ds = null;
        }
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (hasPatterns(this.defaultPatterns)) {
            throw tooManyAttributes();
        }
        if (!this.additionalPatterns.isEmpty()) {
            throw noChildrenAllowed();
        }
        if (hasSelectors()) {
            throw noChildrenAllowed();
        }
        super.setRefid(reference);
    }

    @Override // org.apache.tools.ant.types.ResourceCollection
    public int size() {
        int includedFilesCount;
        synchronized (this) {
            if (isReference()) {
                includedFilesCount = getRef().size();
            } else {
                ensureDirectoryScannerSetup();
                this.ds.scan();
                includedFilesCount = this.ds.getIncludedFilesCount() + this.ds.getIncludedDirsCount();
            }
        }
        return includedFilesCount;
    }

    @Override // org.apache.tools.ant.types.selectors.AbstractSelectorContainer, org.apache.tools.ant.types.DataType
    public String toString() {
        String stringBuffer;
        if (isReference()) {
            stringBuffer = getRef().toString();
        } else {
            Iterator it = iterator();
            if (!it.hasNext()) {
                stringBuffer = "";
            } else {
                StringBuffer stringBuffer2 = new StringBuffer();
                while (it.hasNext()) {
                    if (stringBuffer2.length() > 0) {
                        stringBuffer2.append(File.pathSeparatorChar);
                    }
                    stringBuffer2.append(it.next());
                }
                stringBuffer = stringBuffer2.toString();
            }
        }
        return stringBuffer;
    }
}
