package org.apache.tools.ant.taskdefs.optional.extension;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Reference;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/ExtensionSet.class */
public class ExtensionSet extends DataType {
    private final ArrayList extensions = new ArrayList();
    private final ArrayList extensionsFilesets = new ArrayList();

    public void addExtension(ExtensionAdapter extensionAdapter) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.extensions.add(extensionAdapter);
    }

    public void addFileset(FileSet fileSet) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.extensionsFilesets.add(fileSet);
    }

    public void addLibfileset(LibFileSet libFileSet) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        setChecked(false);
        this.extensionsFilesets.add(libFileSet);
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    Iterator it = this.extensions.iterator();
                    while (it.hasNext()) {
                        pushAndInvokeCircularReferenceCheck((ExtensionAdapter) it.next(), stack, project);
                    }
                    Iterator it2 = this.extensionsFilesets.iterator();
                    while (it2.hasNext()) {
                        pushAndInvokeCircularReferenceCheck((FileSet) it2.next(), stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (!this.extensions.isEmpty() || !this.extensionsFilesets.isEmpty()) {
            throw tooManyAttributes();
        }
        super.setRefid(reference);
    }

    public Extension[] toExtensions(Project project) throws BuildException {
        Extension[] extensionArr;
        if (isReference()) {
            extensionArr = ((ExtensionSet) getCheckedRef()).toExtensions(project);
        } else {
            dieOnCircularReference();
            ArrayList extensions = ExtensionUtil.toExtensions(this.extensions);
            ExtensionUtil.extractExtensions(project, extensions, this.extensionsFilesets);
            extensionArr = (Extension[]) extensions.toArray(new Extension[extensions.size()]);
        }
        return extensionArr;
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        return new StringBuffer().append("ExtensionSet").append(Arrays.asList(toExtensions(getProject()))).toString();
    }
}
