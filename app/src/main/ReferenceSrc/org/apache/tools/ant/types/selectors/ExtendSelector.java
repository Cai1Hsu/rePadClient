package org.apache.tools.ant.types.selectors;

import java.io.File;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Parameter;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/ExtendSelector.class */
public class ExtendSelector extends BaseSelector {
    private String classname = null;
    private FileSelector dynselector = null;
    private Vector paramVec = new Vector();
    private Path classpath = null;

    public void addParam(Parameter parameter) {
        this.paramVec.addElement(parameter);
    }

    public final Path createClasspath() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        return this.classpath.createPath();
    }

    public final Path getClasspath() {
        return this.classpath;
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector, org.apache.tools.ant.types.selectors.FileSelector
    public boolean isSelected(File file, String str, File file2) throws BuildException {
        validate();
        if (this.paramVec.size() > 0 && (this.dynselector instanceof ExtendFileSelector)) {
            Parameter[] parameterArr = new Parameter[this.paramVec.size()];
            this.paramVec.copyInto(parameterArr);
            ((ExtendFileSelector) this.dynselector).setParameters(parameterArr);
        }
        return this.dynselector.isSelected(file, str, file2);
    }

    public void selectorCreate() {
        Class<?> cls;
        if (this.classname == null || this.classname.length() <= 0) {
            setError("There is no classname specified");
            return;
        }
        try {
            if (this.classpath == null) {
                cls = Class.forName(this.classname);
            } else {
                cls = Class.forName(this.classname, true, getProject().createClassLoader(this.classpath));
            }
            this.dynselector = (FileSelector) cls.newInstance();
            Project project = getProject();
            if (project == null) {
                return;
            }
            project.setProjectReference(this.dynselector);
        } catch (ClassNotFoundException e) {
            setError(new StringBuffer().append("Selector ").append(this.classname).append(" not initialized, no such class").toString());
        } catch (IllegalAccessException e2) {
            setError(new StringBuffer().append("Selector ").append(this.classname).append(" not initialized, class not accessible").toString());
        } catch (InstantiationException e3) {
            setError(new StringBuffer().append("Selector ").append(this.classname).append(" not initialized, could not create class").toString());
        }
    }

    public void setClassname(String str) {
        this.classname = str;
    }

    public final void setClasspath(Path path) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        if (this.classpath == null) {
            this.classpath = path;
        } else {
            this.classpath.append(path);
        }
    }

    public void setClasspathref(Reference reference) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        createClasspath().setRefid(reference);
    }

    @Override // org.apache.tools.ant.types.selectors.BaseSelector
    public void verifySettings() {
        if (this.dynselector == null) {
            selectorCreate();
        }
        if (this.classname == null || this.classname.length() < 1) {
            setError("The classname attribute is required");
        } else if (this.dynselector == null) {
            setError("Internal Error: The custom selector was not created");
        } else if ((this.dynselector instanceof ExtendFileSelector) || this.paramVec.size() <= 0) {
        } else {
            setError("Cannot set parameters on custom selector that does not implement ExtendFileSelector");
        }
    }
}
