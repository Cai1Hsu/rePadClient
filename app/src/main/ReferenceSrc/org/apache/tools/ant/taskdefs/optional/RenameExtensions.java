package org.apache.tools.ant.taskdefs.optional;

import java.io.File;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.taskdefs.MatchingTask;
import org.apache.tools.ant.taskdefs.Move;
import org.apache.tools.ant.types.Mapper;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/RenameExtensions.class */
public class RenameExtensions extends MatchingTask {
    private File srcDir;
    private String fromExtension = "";
    private String toExtension = "";
    private boolean replace = false;
    private Mapper.MapperType globType = new Mapper.MapperType();

    public RenameExtensions() {
        this.globType.setValue("glob");
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.fromExtension == null || this.toExtension == null || this.srcDir == null) {
            throw new BuildException("srcDir, fromExtension and toExtension attributes must be set!");
        }
        log("DEPRECATED - The renameext task is deprecated.  Use move instead.", 1);
        log("Replace this with:", 2);
        log(new StringBuffer().append("<move todir=\"").append(this.srcDir).append("\" overwrite=\"").append(this.replace).append("\">").toString(), 2);
        log(new StringBuffer().append("  <fileset dir=\"").append(this.srcDir).append("\" />").toString(), 2);
        log("  <mapper type=\"glob\"", 2);
        log(new StringBuffer().append("          from=\"*").append(this.fromExtension).append("\"").toString(), 2);
        log(new StringBuffer().append("          to=\"*").append(this.toExtension).append("\" />").toString(), 2);
        log("</move>", 2);
        log("using the same patterns on <fileset> as you've used here", 2);
        Move move = new Move();
        move.bindToOwner(this);
        move.setOwningTarget(getOwningTarget());
        move.setTaskName(getTaskName());
        move.setLocation(getLocation());
        move.setTodir(this.srcDir);
        move.setOverwrite(this.replace);
        this.fileset.setDir(this.srcDir);
        move.addFileset(this.fileset);
        Mapper createMapper = move.createMapper();
        createMapper.setType(this.globType);
        createMapper.setFrom(new StringBuffer().append("*").append(this.fromExtension).toString());
        createMapper.setTo(new StringBuffer().append("*").append(this.toExtension).toString());
        move.execute();
    }

    public void setFromExtension(String str) {
        this.fromExtension = str;
    }

    public void setReplace(boolean z) {
        this.replace = z;
    }

    public void setSrcDir(File file) {
        this.srcDir = file;
    }

    public void setToExtension(String str) {
        this.toExtension = str;
    }
}
