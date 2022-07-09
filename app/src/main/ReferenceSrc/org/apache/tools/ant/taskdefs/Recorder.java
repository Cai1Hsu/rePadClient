package org.apache.tools.ant.taskdefs;

import java.util.Hashtable;
import java.util.Map;
import org.apache.tools.ant.BuildEvent;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.SubBuildListener;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.LogLevel;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Recorder.class */
public class Recorder extends Task implements SubBuildListener {
    private static Hashtable recorderEntries = new Hashtable();
    private String filename = null;
    private Boolean append = null;
    private Boolean start = null;
    private int loglevel = -1;
    private boolean emacsMode = false;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Recorder$ActionChoices.class */
    public static class ActionChoices extends EnumeratedAttribute {
        private static final String[] VALUES = {"start", "stop"};

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return VALUES;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Recorder$VerbosityLevelChoices.class */
    public static class VerbosityLevelChoices extends LogLevel {
    }

    private void cleanup() {
        for (Map.Entry entry : ((Hashtable) recorderEntries.clone()).entrySet()) {
            if (((RecorderEntry) entry.getValue()).getProject() == getProject()) {
                recorderEntries.remove(entry.getKey());
            }
        }
        getProject().removeBuildListener(this);
    }

    @Override // org.apache.tools.ant.BuildListener
    public void buildFinished(BuildEvent buildEvent) {
        cleanup();
    }

    @Override // org.apache.tools.ant.BuildListener
    public void buildStarted(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        if (this.filename == null) {
            throw new BuildException("No filename specified");
        }
        getProject().log(new StringBuffer().append("setting a recorder for name ").append(this.filename).toString(), 4);
        RecorderEntry recorder = getRecorder(this.filename, getProject());
        recorder.setMessageOutputLevel(this.loglevel);
        recorder.setEmacsMode(this.emacsMode);
        if (this.start == null) {
            return;
        }
        if (this.start.booleanValue()) {
            recorder.reopenFile();
            recorder.setRecordState(this.start);
            return;
        }
        recorder.setRecordState(this.start);
        recorder.closeFile();
    }

    protected RecorderEntry getRecorder(String str, Project project) throws BuildException {
        RecorderEntry recorderEntry;
        Object obj = recorderEntries.get(str);
        if (obj == null) {
            RecorderEntry recorderEntry2 = new RecorderEntry(str);
            if (this.append == null) {
                recorderEntry2.openFile(false);
            } else {
                recorderEntry2.openFile(this.append.booleanValue());
            }
            recorderEntry2.setProject(project);
            recorderEntries.put(str, recorderEntry2);
            recorderEntry = recorderEntry2;
        } else {
            recorderEntry = (RecorderEntry) obj;
        }
        return recorderEntry;
    }

    @Override // org.apache.tools.ant.Task
    public void init() {
        getProject().addBuildListener(this);
    }

    @Override // org.apache.tools.ant.BuildListener
    public void messageLogged(BuildEvent buildEvent) {
    }

    public void setAction(ActionChoices actionChoices) {
        if (actionChoices.getValue().equalsIgnoreCase("start")) {
            this.start = Boolean.TRUE;
        } else {
            this.start = Boolean.FALSE;
        }
    }

    public void setAppend(boolean z) {
        this.append = z ? Boolean.TRUE : Boolean.FALSE;
    }

    public void setEmacsMode(boolean z) {
        this.emacsMode = z;
    }

    public void setLoglevel(VerbosityLevelChoices verbosityLevelChoices) {
        this.loglevel = verbosityLevelChoices.getLevel();
    }

    public void setName(String str) {
        this.filename = str;
    }

    @Override // org.apache.tools.ant.SubBuildListener
    public void subBuildFinished(BuildEvent buildEvent) {
        if (buildEvent.getProject() == getProject()) {
            cleanup();
        }
    }

    @Override // org.apache.tools.ant.SubBuildListener
    public void subBuildStarted(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.BuildListener
    public void targetFinished(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.BuildListener
    public void targetStarted(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.BuildListener
    public void taskFinished(BuildEvent buildEvent) {
    }

    @Override // org.apache.tools.ant.BuildListener
    public void taskStarted(BuildEvent buildEvent) {
    }
}
