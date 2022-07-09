package org.apache.tools.ant.taskdefs;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ComponentHelper;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.ProjectHelperRepository;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.TaskContainer;
import org.apache.tools.ant.UnknownElement;
import org.apache.tools.ant.types.resources.URLResource;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Antlib.class */
public class Antlib extends Task implements TaskContainer {
    public static final String TAG = "antlib";
    static Class class$org$apache$tools$ant$taskdefs$Antlib;
    private ClassLoader classLoader;
    private String uri = "";
    private List tasks = new ArrayList();

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static Antlib createAntlib(Project project, URL url, String str) {
        try {
            url.openConnection().connect();
            ComponentHelper componentHelper = ComponentHelper.getComponentHelper(project);
            componentHelper.enterAntLib(str);
            URLResource uRLResource = new URLResource(url);
            ProjectHelper projectHelper = null;
            try {
                Object reference = project.getReference("ant.projectHelper");
                if (reference instanceof ProjectHelper) {
                    ProjectHelper projectHelper2 = (ProjectHelper) reference;
                    projectHelper = projectHelper2;
                    if (!projectHelper2.canParseAntlibDescriptor(uRLResource)) {
                        projectHelper = null;
                    }
                }
                ProjectHelper projectHelper3 = projectHelper;
                if (projectHelper == null) {
                    projectHelper3 = ProjectHelperRepository.getInstance().getProjectHelperForAntlib(uRLResource);
                }
                UnknownElement parseAntlibDescriptor = projectHelper3.parseAntlibDescriptor(project, uRLResource);
                if (!parseAntlibDescriptor.getTag().equals(TAG)) {
                    throw new BuildException(new StringBuffer().append("Unexpected tag ").append(parseAntlibDescriptor.getTag()).append(" expecting ").append(TAG).toString(), parseAntlibDescriptor.getLocation());
                }
                Antlib antlib = new Antlib();
                antlib.setProject(project);
                antlib.setLocation(parseAntlibDescriptor.getLocation());
                antlib.setTaskName(TAG);
                antlib.init();
                parseAntlibDescriptor.configure(antlib);
                return antlib;
            } finally {
                componentHelper.exitAntLib();
            }
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Unable to find ").append(url).toString(), e);
        }
    }

    private ClassLoader getClassLoader() {
        Class cls;
        if (this.classLoader == null) {
            if (class$org$apache$tools$ant$taskdefs$Antlib == null) {
                cls = class$("org.apache.tools.ant.taskdefs.Antlib");
                class$org$apache$tools$ant$taskdefs$Antlib = cls;
            } else {
                cls = class$org$apache$tools$ant$taskdefs$Antlib;
            }
            this.classLoader = cls.getClassLoader();
        }
        return this.classLoader;
    }

    @Override // org.apache.tools.ant.TaskContainer
    public void addTask(Task task) {
        this.tasks.add(task);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        for (UnknownElement unknownElement : this.tasks) {
            setLocation(unknownElement.getLocation());
            unknownElement.maybeConfigure();
            Object realThing = unknownElement.getRealThing();
            if (realThing != null) {
                if (!(realThing instanceof AntlibDefinition)) {
                    throw new BuildException(new StringBuffer().append("Invalid task in antlib ").append(unknownElement.getTag()).append(" ").append(realThing.getClass()).append(" does not ").append("extend org.apache.tools.ant.taskdefs.AntlibDefinition").toString());
                }
                AntlibDefinition antlibDefinition = (AntlibDefinition) realThing;
                antlibDefinition.setURI(this.uri);
                antlibDefinition.setAntlibClassLoader(getClassLoader());
                antlibDefinition.init();
                antlibDefinition.execute();
            }
        }
    }

    protected void setClassLoader(ClassLoader classLoader) {
        this.classLoader = classLoader;
    }

    protected void setURI(String str) {
        this.uri = str;
    }
}
