package org.apache.tools.ant.taskdefs.condition;

import java.util.Enumeration;
import java.util.Vector;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.taskdefs.Available;
import org.apache.tools.ant.taskdefs.Checksum;
import org.apache.tools.ant.taskdefs.UpToDate;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/ConditionBase.class */
public abstract class ConditionBase extends ProjectComponent {
    private Vector conditions = new Vector();
    private String taskName;

    protected ConditionBase() {
        this.taskName = "condition";
        this.taskName = "component";
    }

    protected ConditionBase(String str) {
        this.taskName = "condition";
        this.taskName = str;
    }

    public void add(Condition condition) {
        this.conditions.addElement(condition);
    }

    public void addAnd(And and) {
        this.conditions.addElement(and);
    }

    public void addAvailable(Available available) {
        this.conditions.addElement(available);
    }

    public void addChecksum(Checksum checksum) {
        this.conditions.addElement(checksum);
    }

    public void addContains(Contains contains) {
        this.conditions.addElement(contains);
    }

    public void addEquals(Equals equals) {
        this.conditions.addElement(equals);
    }

    public void addFilesMatch(FilesMatch filesMatch) {
        this.conditions.addElement(filesMatch);
    }

    public void addHttp(Http http) {
        this.conditions.addElement(http);
    }

    public void addIsFalse(IsFalse isFalse) {
        this.conditions.addElement(isFalse);
    }

    public void addIsFileSelected(IsFileSelected isFileSelected) {
        this.conditions.addElement(isFileSelected);
    }

    public void addIsReference(IsReference isReference) {
        this.conditions.addElement(isReference);
    }

    public void addIsSet(IsSet isSet) {
        this.conditions.addElement(isSet);
    }

    public void addIsTrue(IsTrue isTrue) {
        this.conditions.addElement(isTrue);
    }

    public void addNot(Not not) {
        this.conditions.addElement(not);
    }

    public void addOr(Or or) {
        this.conditions.addElement(or);
    }

    public void addOs(Os os) {
        this.conditions.addElement(os);
    }

    public void addSocket(Socket socket) {
        this.conditions.addElement(socket);
    }

    public void addUptodate(UpToDate upToDate) {
        this.conditions.addElement(upToDate);
    }

    protected int countConditions() {
        return this.conditions.size();
    }

    protected final Enumeration getConditions() {
        return this.conditions.elements();
    }

    public String getTaskName() {
        return this.taskName;
    }

    public void setTaskName(String str) {
        this.taskName = str;
    }
}
