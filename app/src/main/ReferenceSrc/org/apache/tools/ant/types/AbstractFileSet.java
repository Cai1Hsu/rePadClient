package org.apache.tools.ant.types;

import java.io.File;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Stack;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.FileScanner;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.PatternSet;
import org.apache.tools.ant.types.selectors.AndSelector;
import org.apache.tools.ant.types.selectors.ContainsRegexpSelector;
import org.apache.tools.ant.types.selectors.ContainsSelector;
import org.apache.tools.ant.types.selectors.DateSelector;
import org.apache.tools.ant.types.selectors.DependSelector;
import org.apache.tools.ant.types.selectors.DepthSelector;
import org.apache.tools.ant.types.selectors.DifferentSelector;
import org.apache.tools.ant.types.selectors.ExtendSelector;
import org.apache.tools.ant.types.selectors.FileSelector;
import org.apache.tools.ant.types.selectors.FilenameSelector;
import org.apache.tools.ant.types.selectors.MajoritySelector;
import org.apache.tools.ant.types.selectors.NoneSelector;
import org.apache.tools.ant.types.selectors.NotSelector;
import org.apache.tools.ant.types.selectors.OrSelector;
import org.apache.tools.ant.types.selectors.PresentSelector;
import org.apache.tools.ant.types.selectors.ReadableSelector;
import org.apache.tools.ant.types.selectors.SelectSelector;
import org.apache.tools.ant.types.selectors.SelectorContainer;
import org.apache.tools.ant.types.selectors.SelectorScanner;
import org.apache.tools.ant.types.selectors.SizeSelector;
import org.apache.tools.ant.types.selectors.TypeSelector;
import org.apache.tools.ant.types.selectors.WritableSelector;
import org.apache.tools.ant.types.selectors.modifiedselector.ModifiedSelector;

/* loaded from: classes.jar:org/apache/tools/ant/types/AbstractFileSet.class */
public abstract class AbstractFileSet extends DataType implements Cloneable, SelectorContainer {
    private Vector additionalPatterns;
    private boolean caseSensitive;
    private PatternSet defaultPatterns;
    private File dir;
    private DirectoryScanner directoryScanner;
    private boolean errorOnMissingDir;
    private boolean followSymlinks;
    private int maxLevelsOfSymlinks;
    private Vector selectors;
    private boolean useDefaultExcludes;

    public AbstractFileSet() {
        this.defaultPatterns = new PatternSet();
        this.additionalPatterns = new Vector();
        this.selectors = new Vector();
        this.useDefaultExcludes = true;
        this.caseSensitive = true;
        this.followSymlinks = true;
        this.errorOnMissingDir = true;
        this.maxLevelsOfSymlinks = 5;
        this.directoryScanner = null;
    }

    protected AbstractFileSet(AbstractFileSet abstractFileSet) {
        this.defaultPatterns = new PatternSet();
        this.additionalPatterns = new Vector();
        this.selectors = new Vector();
        this.useDefaultExcludes = true;
        this.caseSensitive = true;
        this.followSymlinks = true;
        this.errorOnMissingDir = true;
        this.maxLevelsOfSymlinks = 5;
        this.directoryScanner = null;
        this.dir = abstractFileSet.dir;
        this.defaultPatterns = abstractFileSet.defaultPatterns;
        this.additionalPatterns = abstractFileSet.additionalPatterns;
        this.selectors = abstractFileSet.selectors;
        this.useDefaultExcludes = abstractFileSet.useDefaultExcludes;
        this.caseSensitive = abstractFileSet.caseSensitive;
        this.followSymlinks = abstractFileSet.followSymlinks;
        this.errorOnMissingDir = abstractFileSet.errorOnMissingDir;
        this.maxLevelsOfSymlinks = abstractFileSet.maxLevelsOfSymlinks;
        setProject(abstractFileSet.getProject());
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void add(FileSelector fileSelector) {
        appendSelector(fileSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addAnd(AndSelector andSelector) {
        appendSelector(andSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addContains(ContainsSelector containsSelector) {
        appendSelector(containsSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addContainsRegexp(ContainsRegexpSelector containsRegexpSelector) {
        appendSelector(containsRegexpSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addCustom(ExtendSelector extendSelector) {
        appendSelector(extendSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addDate(DateSelector dateSelector) {
        appendSelector(dateSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addDepend(DependSelector dependSelector) {
        appendSelector(dependSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addDepth(DepthSelector depthSelector) {
        appendSelector(depthSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addDifferent(DifferentSelector differentSelector) {
        appendSelector(differentSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addFilename(FilenameSelector filenameSelector) {
        appendSelector(filenameSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addMajority(MajoritySelector majoritySelector) {
        appendSelector(majoritySelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addModified(ModifiedSelector modifiedSelector) {
        appendSelector(modifiedSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addNone(NoneSelector noneSelector) {
        appendSelector(noneSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addNot(NotSelector notSelector) {
        appendSelector(notSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addOr(OrSelector orSelector) {
        appendSelector(orSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addPresent(PresentSelector presentSelector) {
        appendSelector(presentSelector);
    }

    public void addReadable(ReadableSelector readableSelector) {
        appendSelector(readableSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addSelector(SelectSelector selectSelector) {
        appendSelector(selectSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addSize(SizeSelector sizeSelector) {
        appendSelector(sizeSelector);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void addType(TypeSelector typeSelector) {
        appendSelector(typeSelector);
    }

    public void addWritable(WritableSelector writableSelector) {
        appendSelector(writableSelector);
    }

    public void appendExcludes(String[] strArr) {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            if (strArr != null) {
                for (String str : strArr) {
                    this.defaultPatterns.createExclude().setName(str);
                }
                this.directoryScanner = null;
            }
        }
    }

    public void appendIncludes(String[] strArr) {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            if (strArr != null) {
                for (String str : strArr) {
                    this.defaultPatterns.createInclude().setName(str);
                }
                this.directoryScanner = null;
            }
        }
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public void appendSelector(FileSelector fileSelector) {
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            this.selectors.addElement(fileSelector);
            this.directoryScanner = null;
            setChecked(false);
        }
    }

    @Override // org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        AbstractFileSet abstractFileSet;
        synchronized (this) {
            if (isReference()) {
                abstractFileSet = getRef(getProject()).clone();
            } else {
                try {
                    AbstractFileSet abstractFileSet2 = (AbstractFileSet) super.clone();
                    abstractFileSet2.defaultPatterns = (PatternSet) this.defaultPatterns.clone();
                    abstractFileSet2.additionalPatterns = new Vector(this.additionalPatterns.size());
                    Enumeration elements = this.additionalPatterns.elements();
                    while (elements.hasMoreElements()) {
                        abstractFileSet2.additionalPatterns.addElement(((PatternSet) elements.nextElement()).clone());
                    }
                    abstractFileSet2.selectors = new Vector(this.selectors);
                    abstractFileSet = abstractFileSet2;
                } catch (CloneNotSupportedException e) {
                    throw new BuildException(e);
                }
            }
        }
        return abstractFileSet;
    }

    public PatternSet.NameEntry createExclude() {
        PatternSet.NameEntry createExclude;
        synchronized (this) {
            if (isReference()) {
                throw noChildrenAllowed();
            }
            this.directoryScanner = null;
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
            this.directoryScanner = null;
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
            this.directoryScanner = null;
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
            this.directoryScanner = null;
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
            this.directoryScanner = null;
        }
        return patternSet;
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    Iterator it = this.selectors.iterator();
                    while (it.hasNext()) {
                        Object next = it.next();
                        if (next instanceof DataType) {
                            pushAndInvokeCircularReferenceCheck((DataType) next, stack, project);
                        }
                    }
                    Iterator it2 = this.additionalPatterns.iterator();
                    while (it2.hasNext()) {
                        pushAndInvokeCircularReferenceCheck((PatternSet) it2.next(), stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    public boolean getDefaultexcludes() {
        boolean z;
        synchronized (this) {
            if (isReference()) {
                z = getRef(getProject()).getDefaultexcludes();
            } else {
                dieOnCircularReference();
                z = this.useDefaultExcludes;
            }
        }
        return z;
    }

    public File getDir() {
        return getDir(getProject());
    }

    public File getDir(Project project) {
        File file;
        synchronized (this) {
            if (isReference()) {
                file = getRef(project).getDir(project);
            } else {
                dieOnCircularReference();
                file = this.dir;
            }
        }
        return file;
    }

    public DirectoryScanner getDirectoryScanner() {
        return getDirectoryScanner(getProject());
    }

    public DirectoryScanner getDirectoryScanner(Project project) {
        Throwable th;
        DirectoryScanner directoryScanner;
        if (isReference()) {
            directoryScanner = getRef(project).getDirectoryScanner(project);
        } else {
            dieOnCircularReference();
            synchronized (this) {
                try {
                    if (this.directoryScanner != null && project == getProject()) {
                        directoryScanner = this.directoryScanner;
                    } else if (this.dir == null) {
                        throw new BuildException(new StringBuffer().append("No directory specified for ").append(getDataTypeName()).append(".").toString());
                    } else {
                        if (!this.dir.exists() && this.errorOnMissingDir) {
                            throw new BuildException(new StringBuffer().append(this.dir.getAbsolutePath()).append(DirectoryScanner.DOES_NOT_EXIST_POSTFIX).toString());
                        }
                        if (!this.dir.isDirectory() && this.dir.exists()) {
                            throw new BuildException(new StringBuffer().append(this.dir.getAbsolutePath()).append(" is not a directory.").toString());
                        }
                        DirectoryScanner directoryScanner2 = new DirectoryScanner();
                        try {
                            setupDirectoryScanner(directoryScanner2, project);
                            directoryScanner2.setFollowSymlinks(this.followSymlinks);
                            directoryScanner2.setErrorOnMissingDir(this.errorOnMissingDir);
                            directoryScanner2.setMaxLevelsOfSymlinks(this.maxLevelsOfSymlinks);
                            this.directoryScanner = project == getProject() ? directoryScanner2 : this.directoryScanner;
                            directoryScanner = directoryScanner2;
                        } catch (Throwable th2) {
                            th = th2;
                            throw th;
                        }
                    }
                    directoryScanner.scan();
                } catch (Throwable th3) {
                    th = th3;
                }
            }
        }
        return directoryScanner;
    }

    public boolean getErrorOnMissingDir() {
        return this.errorOnMissingDir;
    }

    public int getMaxLevelsOfSymlinks() {
        return this.maxLevelsOfSymlinks;
    }

    protected AbstractFileSet getRef(Project project) {
        return (AbstractFileSet) getCheckedRef(project);
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public FileSelector[] getSelectors(Project project) {
        FileSelector[] fileSelectorArr;
        synchronized (this) {
            if (isReference()) {
                fileSelectorArr = getRef(getProject()).getSelectors(project);
            } else {
                dieOnCircularReference(project);
                fileSelectorArr = (FileSelector[]) this.selectors.toArray(new FileSelector[this.selectors.size()]);
            }
        }
        return fileSelectorArr;
    }

    public boolean hasPatterns() {
        boolean z;
        synchronized (this) {
            if (!isReference() || getProject() == null) {
                dieOnCircularReference();
                z = true;
                if (!this.defaultPatterns.hasPatterns(getProject())) {
                    Enumeration elements = this.additionalPatterns.elements();
                    while (true) {
                        if (!elements.hasMoreElements()) {
                            z = false;
                            break;
                        } else if (((PatternSet) elements.nextElement()).hasPatterns(getProject())) {
                            z = true;
                            break;
                        }
                    }
                }
            } else {
                z = getRef(getProject()).hasPatterns();
            }
        }
        return z;
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public boolean hasSelectors() {
        boolean z;
        synchronized (this) {
            if (isReference()) {
                z = getRef(getProject()).hasSelectors();
            } else {
                dieOnCircularReference();
                z = !this.selectors.isEmpty();
            }
        }
        return z;
    }

    public boolean isCaseSensitive() {
        boolean z;
        synchronized (this) {
            if (isReference()) {
                z = getRef(getProject()).isCaseSensitive();
            } else {
                dieOnCircularReference();
                z = this.caseSensitive;
            }
        }
        return z;
    }

    public boolean isFollowSymlinks() {
        boolean z;
        synchronized (this) {
            if (isReference()) {
                z = getRef(getProject()).isCaseSensitive();
            } else {
                dieOnCircularReference();
                z = this.followSymlinks;
            }
        }
        return z;
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
                PatternSet patternSet2 = (PatternSet) this.defaultPatterns.clone();
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
                patternSet = getRef(project).mergePatterns(project);
            }
        }
        return patternSet;
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public int selectorCount() {
        int size;
        synchronized (this) {
            if (isReference()) {
                size = getRef(getProject()).selectorCount();
            } else {
                dieOnCircularReference();
                size = this.selectors.size();
            }
        }
        return size;
    }

    @Override // org.apache.tools.ant.types.selectors.SelectorContainer
    public Enumeration selectorElements() {
        Enumeration elements;
        synchronized (this) {
            if (isReference()) {
                elements = getRef(getProject()).selectorElements();
            } else {
                dieOnCircularReference();
                elements = this.selectors.elements();
            }
        }
        return elements;
    }

    public void setCaseSensitive(boolean z) {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            this.caseSensitive = z;
            this.directoryScanner = null;
        }
    }

    public void setDefaultexcludes(boolean z) {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            this.useDefaultExcludes = z;
            this.directoryScanner = null;
        }
    }

    public void setDir(File file) throws BuildException {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            this.dir = file;
            this.directoryScanner = null;
        }
    }

    public void setErrorOnMissingDir(boolean z) {
        this.errorOnMissingDir = z;
    }

    public void setExcludes(String str) {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            this.defaultPatterns.setExcludes(str);
            this.directoryScanner = null;
        }
    }

    public void setExcludesfile(File file) throws BuildException {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            this.defaultPatterns.setExcludesfile(file);
            this.directoryScanner = null;
        }
    }

    public void setFile(File file) {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            setDir(file.getParentFile());
            createInclude().setName(file.getName());
        }
    }

    public void setFollowSymlinks(boolean z) {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            this.followSymlinks = z;
            this.directoryScanner = null;
        }
    }

    public void setIncludes(String str) {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            this.defaultPatterns.setIncludes(str);
            this.directoryScanner = null;
        }
    }

    public void setIncludesfile(File file) throws BuildException {
        synchronized (this) {
            if (isReference()) {
                throw tooManyAttributes();
            }
            this.defaultPatterns.setIncludesfile(file);
            this.directoryScanner = null;
        }
    }

    public void setMaxLevelsOfSymlinks(int i) {
        this.maxLevelsOfSymlinks = i;
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (this.dir != null || this.defaultPatterns.hasPatterns(getProject())) {
            throw tooManyAttributes();
        }
        if (!this.additionalPatterns.isEmpty()) {
            throw noChildrenAllowed();
        }
        if (!this.selectors.isEmpty()) {
            throw noChildrenAllowed();
        }
        super.setRefid(reference);
    }

    public void setupDirectoryScanner(FileScanner fileScanner) {
        setupDirectoryScanner(fileScanner, getProject());
    }

    public void setupDirectoryScanner(FileScanner fileScanner, Project project) {
        synchronized (this) {
            if (isReference()) {
                getRef(project).setupDirectoryScanner(fileScanner, project);
            } else {
                dieOnCircularReference(project);
                if (fileScanner == null) {
                    throw new IllegalArgumentException("ds cannot be null");
                }
                fileScanner.setBasedir(this.dir);
                PatternSet mergePatterns = mergePatterns(project);
                project.log(new StringBuffer().append(getDataTypeName()).append(": Setup scanner in dir ").append(this.dir).append(" with ").append(mergePatterns).toString(), 4);
                fileScanner.setIncludes(mergePatterns.getIncludePatterns(project));
                fileScanner.setExcludes(mergePatterns.getExcludePatterns(project));
                if (fileScanner instanceof SelectorScanner) {
                    ((SelectorScanner) fileScanner).setSelectors(getSelectors(project));
                }
                if (this.useDefaultExcludes) {
                    fileScanner.addDefaultExcludes();
                }
                fileScanner.setCaseSensitive(this.caseSensitive);
            }
        }
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        String stringBuffer;
        if (isReference()) {
            stringBuffer = getRef(getProject()).toString();
        } else {
            dieOnCircularReference();
            String[] includedFiles = getDirectoryScanner(getProject()).getIncludedFiles();
            StringBuffer stringBuffer2 = new StringBuffer();
            for (int i = 0; i < includedFiles.length; i++) {
                if (i > 0) {
                    stringBuffer2.append(';');
                }
                stringBuffer2.append(includedFiles[i]);
            }
            stringBuffer = stringBuffer2.toString();
        }
        return stringBuffer;
    }
}
