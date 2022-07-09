package org.apache.tools.ant.taskdefs.condition;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/ResourceContains.class */
public class ResourceContains implements Condition {
    private boolean casesensitive = true;
    private Project project;
    private String refid;
    private Resource resource;
    private String substring;

    private void resolveRefid() {
        try {
            if (getProject() == null) {
                throw new BuildException("Cannot retrieve refid; project unset");
            }
            Object reference = getProject().getReference(this.refid);
            Object obj = reference;
            if (!(reference instanceof Resource)) {
                if (!(reference instanceof ResourceCollection)) {
                    throw new BuildException(new StringBuffer().append("Illegal value at '").append(this.refid).append("': ").append(String.valueOf(reference)).toString());
                }
                ResourceCollection resourceCollection = (ResourceCollection) reference;
                obj = reference;
                if (resourceCollection.size() == 1) {
                    obj = resourceCollection.iterator().next();
                }
            }
            this.resource = (Resource) obj;
        } finally {
            this.refid = null;
        }
    }

    private void validate() {
        if (this.resource == null || this.refid == null) {
            if (this.resource == null && this.refid != null) {
                resolveRefid();
            }
            if (this.resource != null && this.substring != null) {
                return;
            }
            throw new BuildException("both resource and substring are required in <resourcecontains>");
        }
        throw new BuildException("Cannot set both resource and refid");
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        Throwable th;
        BufferedReader bufferedReader;
        BufferedReader bufferedReader2;
        boolean z = true;
        synchronized (this) {
            validate();
            if (this.substring.length() == 0) {
                z = true;
                if (getProject() != null) {
                    getProject().log("Substring is empty; returning true", 3);
                    z = true;
                }
            } else if (this.resource.getSize() == 0) {
                z = false;
            } else {
                try {
                    try {
                        bufferedReader2 = new BufferedReader(new InputStreamReader(this.resource.getInputStream()));
                    } catch (Throwable th2) {
                        th = th2;
                        bufferedReader = null;
                    }
                } catch (IOException e) {
                    bufferedReader2 = null;
                }
                try {
                    String safeReadFully = FileUtils.safeReadFully(bufferedReader2);
                    String str = this.substring;
                    String str2 = safeReadFully;
                    String str3 = str;
                    if (!this.casesensitive) {
                        str2 = safeReadFully.toLowerCase();
                        str3 = str.toLowerCase();
                    }
                    if (str2.indexOf(str3) < 0) {
                        z = false;
                    }
                    FileUtils.close(bufferedReader2);
                } catch (IOException e2) {
                    BufferedReader bufferedReader3 = bufferedReader2;
                    BufferedReader bufferedReader4 = bufferedReader2;
                    BufferedReader bufferedReader5 = bufferedReader2;
                    BufferedReader bufferedReader6 = bufferedReader2;
                    throw new BuildException(new StringBuffer().append("There was a problem accessing resource : ").append(this.resource).toString());
                } catch (Throwable th3) {
                    bufferedReader = bufferedReader2;
                    th = th3;
                    FileUtils.close(bufferedReader);
                    throw th;
                }
            }
        }
        return z;
    }

    public Project getProject() {
        return this.project;
    }

    public void setCasesensitive(boolean z) {
        this.casesensitive = z;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public void setRefid(String str) {
        this.refid = str;
    }

    public void setResource(String str) {
        this.resource = new FileResource(new File(str));
    }

    public void setSubstring(String str) {
        this.substring = str;
    }
}
