package org.apache.tools.ant.helper;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Location;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.RuntimeConfigurable;
import org.apache.tools.ant.Target;
import org.apache.tools.ant.util.FileUtils;
import org.xml.sax.Attributes;
import org.xml.sax.Locator;

/* loaded from: classes.jar:org/apache/tools/ant/helper/AntXMLContext.class */
public class AntXMLContext {
    private File buildFile;
    private File buildFileParent;
    private URL buildFileParentURL;
    private URL buildFileURL;
    private String currentProjectName;
    private Locator locator;
    private Project project;
    private Vector targetVector = new Vector();
    private Target implicitTarget = new Target();
    private Target currentTarget = null;
    private Vector wStack = new Vector();
    private boolean ignoreProjectTag = false;
    private Map prefixMapping = new HashMap();
    private Map currentTargets = null;

    public AntXMLContext(Project project) {
        this.project = project;
        this.implicitTarget.setProject(project);
        this.implicitTarget.setName("");
        this.targetVector.addElement(this.implicitTarget);
    }

    public void addTarget(Target target) {
        this.targetVector.addElement(target);
        this.currentTarget = target;
    }

    public void configureId(Object obj, Attributes attributes) {
        String value = attributes.getValue("id");
        if (value != null) {
            this.project.addIdReference(value, obj);
        }
    }

    public RuntimeConfigurable currentWrapper() {
        return this.wStack.size() < 1 ? null : (RuntimeConfigurable) this.wStack.elementAt(this.wStack.size() - 1);
    }

    public void endPrefixMapping(String str) {
        List list = (List) this.prefixMapping.get(str);
        if (list == null || list.size() == 0) {
            return;
        }
        list.remove(list.size() - 1);
    }

    public File getBuildFile() {
        return this.buildFile;
    }

    public File getBuildFileParent() {
        return this.buildFileParent;
    }

    public URL getBuildFileParentURL() {
        return this.buildFileParentURL;
    }

    public URL getBuildFileURL() {
        return this.buildFileURL;
    }

    public String getCurrentProjectName() {
        return this.currentProjectName;
    }

    public Target getCurrentTarget() {
        return this.currentTarget;
    }

    public Map getCurrentTargets() {
        return this.currentTargets;
    }

    public Target getImplicitTarget() {
        return this.implicitTarget;
    }

    public Locator getLocator() {
        return this.locator;
    }

    public String getPrefixMapping(String str) {
        List list = (List) this.prefixMapping.get(str);
        return (list == null || list.size() == 0) ? null : (String) list.get(list.size() - 1);
    }

    public Project getProject() {
        return this.project;
    }

    public Vector getTargets() {
        return this.targetVector;
    }

    public Vector getWrapperStack() {
        return this.wStack;
    }

    public boolean isIgnoringProjectTag() {
        return this.ignoreProjectTag;
    }

    public RuntimeConfigurable parentWrapper() {
        return this.wStack.size() < 2 ? null : (RuntimeConfigurable) this.wStack.elementAt(this.wStack.size() - 2);
    }

    public void popWrapper() {
        if (this.wStack.size() > 0) {
            this.wStack.removeElementAt(this.wStack.size() - 1);
        }
    }

    public void pushWrapper(RuntimeConfigurable runtimeConfigurable) {
        this.wStack.addElement(runtimeConfigurable);
    }

    public void setBuildFile(File file) {
        this.buildFile = file;
        if (file == null) {
            this.buildFileParent = null;
            return;
        }
        this.buildFileParent = new File(file.getParent());
        this.implicitTarget.setLocation(new Location(file.getAbsolutePath()));
        try {
            setBuildFile(FileUtils.getFileUtils().getFileURL(file));
        } catch (MalformedURLException e) {
            throw new BuildException(e);
        }
    }

    public void setBuildFile(URL url) throws MalformedURLException {
        this.buildFileURL = url;
        this.buildFileParentURL = new URL(url, ".");
        if (this.implicitTarget.getLocation() == null) {
            this.implicitTarget.setLocation(new Location(url.toString()));
        }
    }

    public void setCurrentProjectName(String str) {
        this.currentProjectName = str;
    }

    public void setCurrentTarget(Target target) {
        this.currentTarget = target;
    }

    public void setCurrentTargets(Map map) {
        this.currentTargets = map;
    }

    public void setIgnoreProjectTag(boolean z) {
        this.ignoreProjectTag = z;
    }

    public void setImplicitTarget(Target target) {
        this.implicitTarget = target;
    }

    public void setLocator(Locator locator) {
        this.locator = locator;
    }

    public void startPrefixMapping(String str, String str2) {
        List list = (List) this.prefixMapping.get(str);
        ArrayList arrayList = list;
        if (list == null) {
            arrayList = new ArrayList();
            this.prefixMapping.put(str, arrayList);
        }
        arrayList.add(str2);
    }
}
