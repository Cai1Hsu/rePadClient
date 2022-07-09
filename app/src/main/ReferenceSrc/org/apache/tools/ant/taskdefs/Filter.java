package org.apache.tools.ant.taskdefs;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Filter.class */
public class Filter extends Task {
    private File filtersFile;
    private String token;
    private String value;

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        boolean z = this.filtersFile != null && this.token == null && this.value == null;
        boolean z2 = (this.filtersFile != null || this.token == null || this.value == null) ? false : true;
        if (z || z2) {
            if (z2) {
                getProject().getGlobalFilterSet().addFilter(this.token, this.value);
            }
            if (!z) {
                return;
            }
            readFilters();
            return;
        }
        throw new BuildException("both token and value parameters, or only a filtersFile parameter is required", getLocation());
    }

    protected void readFilters() throws BuildException {
        log(new StringBuffer().append("Reading filters from ").append(this.filtersFile).toString(), 3);
        getProject().getGlobalFilterSet().readFiltersFromFile(this.filtersFile);
    }

    public void setFiltersfile(File file) {
        this.filtersFile = file;
    }

    public void setToken(String str) {
        this.token = str;
    }

    public void setValue(String str) {
        this.value = str;
    }
}
