package org.apache.tools.ant.util.facade;

import java.util.ArrayList;
import java.util.List;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.Path;

/* loaded from: classes.jar:org/apache/tools/ant/util/facade/FacadeTaskHelper.class */
public class FacadeTaskHelper {
    private List args;
    private String defaultValue;
    private Path implementationClasspath;
    private String magicValue;
    private String userChoice;

    public FacadeTaskHelper(String str) {
        this(str, null);
    }

    public FacadeTaskHelper(String str, String str2) {
        this.args = new ArrayList();
        this.defaultValue = str;
        this.magicValue = str2;
    }

    public void addImplementationArgument(ImplementationSpecificArgument implementationSpecificArgument) {
        this.args.add(implementationSpecificArgument);
    }

    public String[] getArgs() {
        ArrayList arrayList = new ArrayList(this.args.size());
        for (ImplementationSpecificArgument implementationSpecificArgument : this.args) {
            for (String str : implementationSpecificArgument.getParts(getImplementation())) {
                arrayList.add(str);
            }
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public String getExplicitChoice() {
        return this.userChoice;
    }

    public String getImplementation() {
        return this.userChoice != null ? this.userChoice : this.magicValue != null ? this.magicValue : this.defaultValue;
    }

    public Path getImplementationClasspath(Project project) {
        if (this.implementationClasspath == null) {
            this.implementationClasspath = new Path(project);
        }
        return this.implementationClasspath;
    }

    public boolean hasBeenSet() {
        return (this.userChoice == null && this.magicValue == null) ? false : true;
    }

    public void setImplementation(String str) {
        this.userChoice = str;
    }

    public void setMagicValue(String str) {
        this.magicValue = str;
    }
}
