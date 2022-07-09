package org.apache.tools.ant.types;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Enumeration;
import java.util.StringTokenizer;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.PropertyHelper;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/types/PatternSet.class */
public class PatternSet extends DataType implements Cloneable {
    private Vector includeList = new Vector();
    private Vector excludeList = new Vector();
    private Vector includesFileList = new Vector();
    private Vector excludesFileList = new Vector();

    /* renamed from: org.apache.tools.ant.types.PatternSet$1 */
    /* loaded from: classes.jar:org/apache/tools/ant/types/PatternSet$1.class */
    static class AnonymousClass1 {
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/PatternSet$InvertedPatternSet.class */
    private static final class InvertedPatternSet extends PatternSet {
        private InvertedPatternSet(PatternSet patternSet) {
            setProject(patternSet.getProject());
            addConfiguredPatternset(patternSet);
        }

        InvertedPatternSet(PatternSet patternSet, AnonymousClass1 anonymousClass1) {
            this(patternSet);
        }

        @Override // org.apache.tools.ant.types.PatternSet
        public String[] getExcludePatterns(Project project) {
            return super.getIncludePatterns(project);
        }

        @Override // org.apache.tools.ant.types.PatternSet
        public String[] getIncludePatterns(Project project) {
            return super.getExcludePatterns(project);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/PatternSet$NameEntry.class */
    public class NameEntry {
        private Object ifCond;
        private String name;
        private final PatternSet this$0;
        private Object unlessCond;

        public NameEntry(PatternSet patternSet) {
            this.this$0 = patternSet;
        }

        private boolean valid(Project project) {
            PropertyHelper propertyHelper = PropertyHelper.getPropertyHelper(project);
            return propertyHelper.testIfCondition(this.ifCond) && propertyHelper.testUnlessCondition(this.unlessCond);
        }

        public String evalName(Project project) {
            return valid(project) ? this.name : null;
        }

        public String getName() {
            return this.name;
        }

        public void setIf(Object obj) {
            this.ifCond = obj;
        }

        public void setIf(String str) {
            setIf((Object) str);
        }

        public void setName(String str) {
            this.name = str;
        }

        public void setUnless(Object obj) {
            this.unlessCond = obj;
        }

        public void setUnless(String str) {
            setUnless((Object) str);
        }

        public String toString() {
            StringBuffer stringBuffer = new StringBuffer();
            if (this.name == null) {
                stringBuffer.append("noname");
            } else {
                stringBuffer.append(this.name);
            }
            if (this.ifCond != null || this.unlessCond != null) {
                stringBuffer.append(":");
                String str = "";
                if (this.ifCond != null) {
                    stringBuffer.append("if->");
                    stringBuffer.append(this.ifCond);
                    str = ";";
                }
                if (this.unlessCond != null) {
                    stringBuffer.append(str);
                    stringBuffer.append("unless->");
                    stringBuffer.append(this.unlessCond);
                }
            }
            return stringBuffer.toString();
        }
    }

    private NameEntry addPatternToList(Vector vector) {
        NameEntry nameEntry = new NameEntry(this);
        vector.addElement(nameEntry);
        return nameEntry;
    }

    private PatternSet getRef(Project project) {
        return (PatternSet) getCheckedRef(project);
    }

    private String[] makeArray(Vector vector, Project project) {
        String[] strArr;
        if (vector.size() == 0) {
            strArr = null;
        } else {
            Vector vector2 = new Vector();
            Enumeration elements = vector.elements();
            while (elements.hasMoreElements()) {
                String evalName = ((NameEntry) elements.nextElement()).evalName(project);
                if (evalName != null && evalName.length() > 0) {
                    vector2.addElement(evalName);
                }
            }
            strArr = new String[vector2.size()];
            vector2.copyInto(strArr);
        }
        return strArr;
    }

    private void readFiles(Project project) {
        if (this.includesFileList.size() > 0) {
            Enumeration elements = this.includesFileList.elements();
            while (elements.hasMoreElements()) {
                String evalName = ((NameEntry) elements.nextElement()).evalName(project);
                if (evalName != null) {
                    File resolveFile = project.resolveFile(evalName);
                    if (!resolveFile.exists()) {
                        throw new BuildException(new StringBuffer().append("Includesfile ").append(resolveFile.getAbsolutePath()).append(" not found.").toString());
                    }
                    readPatterns(resolveFile, this.includeList, project);
                }
            }
            this.includesFileList.removeAllElements();
        }
        if (this.excludesFileList.size() > 0) {
            Enumeration elements2 = this.excludesFileList.elements();
            while (elements2.hasMoreElements()) {
                String evalName2 = ((NameEntry) elements2.nextElement()).evalName(project);
                if (evalName2 != null) {
                    File resolveFile2 = project.resolveFile(evalName2);
                    if (!resolveFile2.exists()) {
                        throw new BuildException(new StringBuffer().append("Excludesfile ").append(resolveFile2.getAbsolutePath()).append(" not found.").toString());
                    }
                    readPatterns(resolveFile2, this.excludeList, project);
                }
            }
            this.excludesFileList.removeAllElements();
        }
    }

    private void readPatterns(File file, Vector vector, Project project) throws BuildException {
        Throwable th;
        IOException e;
        BufferedReader bufferedReader;
        BufferedReader bufferedReader2;
        BufferedReader bufferedReader3 = null;
        try {
            try {
                bufferedReader2 = new BufferedReader(new FileReader(file));
            } catch (IOException e2) {
                e = e2;
                bufferedReader = null;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            for (String readLine = bufferedReader2.readLine(); readLine != null; readLine = bufferedReader2.readLine()) {
                if (readLine.length() > 0) {
                    addPatternToList(vector).setName(project.replaceProperties(readLine));
                }
            }
            FileUtils.close(bufferedReader2);
        } catch (IOException e3) {
            e = e3;
            bufferedReader = bufferedReader2;
            BufferedReader bufferedReader4 = bufferedReader;
            BufferedReader bufferedReader5 = bufferedReader;
            BufferedReader bufferedReader6 = bufferedReader;
            bufferedReader3 = bufferedReader;
            throw new BuildException(new StringBuffer().append("An error occurred while reading from pattern file: ").append(file).toString(), e);
        } catch (Throwable th3) {
            th = th3;
            bufferedReader3 = bufferedReader2;
            FileUtils.close(bufferedReader3);
            throw th;
        }
    }

    public void addConfiguredInvert(PatternSet patternSet) {
        addConfiguredPatternset(new InvertedPatternSet(patternSet, null));
    }

    public void addConfiguredPatternset(PatternSet patternSet) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        String[] includePatterns = patternSet.getIncludePatterns(getProject());
        String[] excludePatterns = patternSet.getExcludePatterns(getProject());
        if (includePatterns != null) {
            for (String str : includePatterns) {
                createInclude().setName(str);
            }
        }
        if (excludePatterns == null) {
            return;
        }
        for (String str2 : excludePatterns) {
            createExclude().setName(str2);
        }
    }

    public void append(PatternSet patternSet, Project project) {
        if (isReference()) {
            throw new BuildException("Cannot append to a reference");
        }
        dieOnCircularReference(project);
        String[] includePatterns = patternSet.getIncludePatterns(project);
        if (includePatterns != null) {
            for (String str : includePatterns) {
                createInclude().setName(str);
            }
        }
        String[] excludePatterns = patternSet.getExcludePatterns(project);
        if (excludePatterns == null) {
            return;
        }
        for (String str2 : excludePatterns) {
            createExclude().setName(str2);
        }
    }

    @Override // org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() {
        try {
            PatternSet patternSet = (PatternSet) super.clone();
            patternSet.includeList = (Vector) this.includeList.clone();
            patternSet.excludeList = (Vector) this.excludeList.clone();
            patternSet.includesFileList = (Vector) this.includesFileList.clone();
            patternSet.excludesFileList = (Vector) this.excludesFileList.clone();
            return patternSet;
        } catch (CloneNotSupportedException e) {
            throw new BuildException(e);
        }
    }

    public NameEntry createExclude() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        return addPatternToList(this.excludeList);
    }

    public NameEntry createExcludesFile() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        return addPatternToList(this.excludesFileList);
    }

    public NameEntry createInclude() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        return addPatternToList(this.includeList);
    }

    public NameEntry createIncludesFile() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        return addPatternToList(this.includesFileList);
    }

    public String[] getExcludePatterns(Project project) {
        String[] makeArray;
        if (isReference()) {
            makeArray = getRef(project).getExcludePatterns(project);
        } else {
            dieOnCircularReference(project);
            readFiles(project);
            makeArray = makeArray(this.excludeList, project);
        }
        return makeArray;
    }

    public String[] getIncludePatterns(Project project) {
        String[] makeArray;
        if (isReference()) {
            makeArray = getRef(project).getIncludePatterns(project);
        } else {
            dieOnCircularReference(project);
            readFiles(project);
            makeArray = makeArray(this.includeList, project);
        }
        return makeArray;
    }

    public boolean hasPatterns(Project project) {
        boolean z;
        if (isReference()) {
            z = getRef(project).hasPatterns(project);
        } else {
            dieOnCircularReference(project);
            z = this.includesFileList.size() > 0 || this.excludesFileList.size() > 0 || this.includeList.size() > 0 || this.excludeList.size() > 0;
        }
        return z;
    }

    public void setExcludes(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        if (str == null || str.length() <= 0) {
            return;
        }
        StringTokenizer stringTokenizer = new StringTokenizer(str, ", ", false);
        while (stringTokenizer.hasMoreTokens()) {
            createExclude().setName(stringTokenizer.nextToken());
        }
    }

    public void setExcludesfile(File file) throws BuildException {
        if (isReference()) {
            throw tooManyAttributes();
        }
        createExcludesFile().setName(file.getAbsolutePath());
    }

    public void setIncludes(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        if (str == null || str.length() <= 0) {
            return;
        }
        StringTokenizer stringTokenizer = new StringTokenizer(str, ", ", false);
        while (stringTokenizer.hasMoreTokens()) {
            createInclude().setName(stringTokenizer.nextToken());
        }
    }

    public void setIncludesfile(File file) throws BuildException {
        if (isReference()) {
            throw tooManyAttributes();
        }
        createIncludesFile().setName(file.getAbsolutePath());
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (!this.includeList.isEmpty() || !this.excludeList.isEmpty()) {
            throw tooManyAttributes();
        }
        super.setRefid(reference);
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        return new StringBuffer().append("patternSet{ includes: ").append(this.includeList).append(" excludes: ").append(this.excludeList).append(" }").toString();
    }
}
