package org.apache.tools.ant.types;

import java.util.Stack;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/types/AntFilterReader.class */
public final class AntFilterReader extends DataType implements Cloneable {
    private String className;
    private Path classpath;
    private final Vector parameters = new Vector();

    public void addParam(Parameter parameter) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        this.parameters.addElement(parameter);
    }

    public Path createClasspath() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        setChecked(false);
        return this.classpath.createPath();
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    if (this.classpath != null) {
                        pushAndInvokeCircularReferenceCheck(this.classpath, stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    public String getClassName() {
        String str;
        if (isReference()) {
            str = ((AntFilterReader) getCheckedRef()).getClassName();
        } else {
            dieOnCircularReference();
            str = this.className;
        }
        return str;
    }

    public Path getClasspath() {
        if (isReference()) {
            ((AntFilterReader) getCheckedRef()).getClasspath();
        }
        dieOnCircularReference();
        return this.classpath;
    }

    public Parameter[] getParams() {
        if (isReference()) {
            ((AntFilterReader) getCheckedRef()).getParams();
        }
        dieOnCircularReference();
        Parameter[] parameterArr = new Parameter[this.parameters.size()];
        this.parameters.copyInto(parameterArr);
        return parameterArr;
    }

    public void setClassName(String str) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        this.className = str;
    }

    public void setClasspath(Path path) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        if (this.classpath == null) {
            this.classpath = path;
        } else {
            this.classpath.append(path);
        }
        setChecked(false);
    }

    public void setClasspathRef(Reference reference) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        createClasspath().setRefid(reference);
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (this.parameters.isEmpty() && this.className == null && this.classpath == null) {
            super.setRefid(reference);
            return;
        }
        throw tooManyAttributes();
    }
}
