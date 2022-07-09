package org.apache.tools.ant.types;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/types/Assertions.class */
public class Assertions extends DataType implements Cloneable {
    private ArrayList assertionList = new ArrayList();
    private Boolean enableSystemAssertions;

    /* loaded from: classes.jar:org/apache/tools/ant/types/Assertions$BaseAssertion.class */
    public static abstract class BaseAssertion {
        private String className;
        private String packageName;

        protected String getClassName() {
            return this.className;
        }

        public abstract String getCommandPrefix();

        protected String getPackageName() {
            return this.packageName;
        }

        public void setClass(String str) {
            this.className = str;
        }

        public void setPackage(String str) {
            this.packageName = str;
        }

        public String toCommand() {
            if (getPackageName() == null || getClassName() == null) {
                StringBuffer stringBuffer = new StringBuffer(getCommandPrefix());
                if (getPackageName() != null) {
                    stringBuffer.append(':');
                    stringBuffer.append(getPackageName());
                    if (!stringBuffer.toString().endsWith("...")) {
                        stringBuffer.append("...");
                    }
                } else if (getClassName() != null) {
                    stringBuffer.append(':');
                    stringBuffer.append(getClassName());
                }
                return stringBuffer.toString();
            }
            throw new BuildException("Both package and class have been set");
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/Assertions$DisabledAssertion.class */
    public static class DisabledAssertion extends BaseAssertion {
        @Override // org.apache.tools.ant.types.Assertions.BaseAssertion
        public String getCommandPrefix() {
            return "-da";
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/Assertions$EnabledAssertion.class */
    public static class EnabledAssertion extends BaseAssertion {
        @Override // org.apache.tools.ant.types.Assertions.BaseAssertion
        public String getCommandPrefix() {
            return "-ea";
        }
    }

    private static void addVmArgument(CommandlineJava commandlineJava, String str) {
        commandlineJava.createVmArgument().setValue(str);
    }

    private Assertions getFinalReference() {
        Assertions assertions;
        if (getRefid() == null) {
            assertions = this;
        } else {
            Object referencedObject = getRefid().getReferencedObject(getProject());
            if (!(referencedObject instanceof Assertions)) {
                throw new BuildException("reference is of wrong type");
            }
            assertions = (Assertions) referencedObject;
        }
        return assertions;
    }

    private int getFinalSize() {
        return (this.enableSystemAssertions != null ? 1 : 0) + this.assertionList.size();
    }

    public void addDisable(DisabledAssertion disabledAssertion) {
        checkChildrenAllowed();
        this.assertionList.add(disabledAssertion);
    }

    public void addEnable(EnabledAssertion enabledAssertion) {
        checkChildrenAllowed();
        this.assertionList.add(enabledAssertion);
    }

    public void applyAssertions(List list) {
        getProject().log("Applying assertions", 4);
        Assertions finalReference = getFinalReference();
        if (Boolean.TRUE.equals(finalReference.enableSystemAssertions)) {
            getProject().log("Enabling system assertions", 4);
            list.add("-enablesystemassertions");
        } else if (Boolean.FALSE.equals(finalReference.enableSystemAssertions)) {
            getProject().log("disabling system assertions", 4);
            list.add("-disablesystemassertions");
        }
        Iterator it = finalReference.assertionList.iterator();
        while (it.hasNext()) {
            String command = ((BaseAssertion) it.next()).toCommand();
            getProject().log(new StringBuffer().append("adding assertion ").append(command).toString(), 4);
            list.add(command);
        }
    }

    public void applyAssertions(ListIterator listIterator) {
        getProject().log("Applying assertions", 4);
        Assertions finalReference = getFinalReference();
        if (Boolean.TRUE.equals(finalReference.enableSystemAssertions)) {
            getProject().log("Enabling system assertions", 4);
            listIterator.add("-enablesystemassertions");
        } else if (Boolean.FALSE.equals(finalReference.enableSystemAssertions)) {
            getProject().log("disabling system assertions", 4);
            listIterator.add("-disablesystemassertions");
        }
        Iterator it = finalReference.assertionList.iterator();
        while (it.hasNext()) {
            String command = ((BaseAssertion) it.next()).toCommand();
            getProject().log(new StringBuffer().append("adding assertion ").append(command).toString(), 4);
            listIterator.add(command);
        }
    }

    public void applyAssertions(CommandlineJava commandlineJava) {
        Assertions finalReference = getFinalReference();
        if (Boolean.TRUE.equals(finalReference.enableSystemAssertions)) {
            addVmArgument(commandlineJava, "-enablesystemassertions");
        } else if (Boolean.FALSE.equals(finalReference.enableSystemAssertions)) {
            addVmArgument(commandlineJava, "-disablesystemassertions");
        }
        Iterator it = finalReference.assertionList.iterator();
        while (it.hasNext()) {
            addVmArgument(commandlineJava, ((BaseAssertion) it.next()).toCommand());
        }
    }

    @Override // org.apache.tools.ant.types.DataType, org.apache.tools.ant.ProjectComponent
    public Object clone() throws CloneNotSupportedException {
        Assertions assertions = (Assertions) super.clone();
        assertions.assertionList = (ArrayList) this.assertionList.clone();
        return assertions;
    }

    public void setEnableSystemAssertions(Boolean bool) {
        checkAttributesAllowed();
        this.enableSystemAssertions = bool;
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) {
        if (this.assertionList.size() > 0 || this.enableSystemAssertions != null) {
            throw tooManyAttributes();
        }
        super.setRefid(reference);
    }

    public int size() {
        return getFinalReference().getFinalSize();
    }
}
