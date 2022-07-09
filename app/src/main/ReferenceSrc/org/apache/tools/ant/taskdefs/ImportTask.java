package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.ProjectHelperRepository;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.URLResource;
import org.apache.tools.ant.types.resources.Union;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/ImportTask.class */
public class ImportTask extends Task {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private String file;
    private boolean optional;
    private String prefixSeparator = ".";
    private final Union resources = new Union();
    private String targetPrefix;

    public ImportTask() {
        this.resources.setCache(true);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private Resource getFileAttributeResource() {
        FileResource fileResource;
        if (this.file != null) {
            File absoluteFile = new File(getLocation().getFileName()).getAbsoluteFile();
            if (absoluteFile.exists()) {
                fileResource = new FileResource(FILE_UTILS.resolveFile(new File(absoluteFile.getParent()), this.file));
            } else {
                try {
                    fileResource = new URLResource(new URL(new URL(getLocation().getFileName()), this.file));
                } catch (MalformedURLException e) {
                    log(e.toString(), 3);
                    throw new BuildException(new StringBuffer().append("failed to resolve ").append(this.file).append(" relative to ").append(getLocation().getFileName()).toString());
                }
            }
        } else {
            fileResource = null;
        }
        return fileResource;
    }

    private void importResource(ProjectHelper projectHelper, Resource resource) {
        Class cls;
        Vector importStack = projectHelper.getImportStack();
        getProject().log(new StringBuffer().append("Importing file ").append(resource).append(" from ").append(getLocation().getFileName()).toString(), 3);
        if (!resource.isExists()) {
            String stringBuffer = new StringBuffer().append("Cannot find ").append(resource).append(" imported from ").append(getLocation().getFileName()).toString();
            if (!this.optional) {
                throw new BuildException(stringBuffer);
            }
            getProject().log(stringBuffer, 3);
            return;
        }
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        FileProvider fileProvider = (FileProvider) resource.as(cls);
        File file = null;
        if (fileProvider != null) {
            file = fileProvider.getFile();
        }
        if (!isInIncludeMode() && (importStack.contains(resource) || (file != null && importStack.contains(file)))) {
            getProject().log(new StringBuffer().append("Skipped already imported file:\n   ").append(resource).append("\n").toString(), 3);
            return;
        }
        String currentTargetPrefix = ProjectHelper.getCurrentTargetPrefix();
        boolean isInIncludeMode = ProjectHelper.isInIncludeMode();
        String currentPrefixSeparator = ProjectHelper.getCurrentPrefixSeparator();
        try {
            try {
                setProjectHelperProps((!isInIncludeMode() || currentTargetPrefix == null || this.targetPrefix == null) ? this.targetPrefix != null ? this.targetPrefix : currentTargetPrefix : new StringBuffer().append(currentTargetPrefix).append(currentPrefixSeparator).append(this.targetPrefix).toString(), this.prefixSeparator, isInIncludeMode());
                ProjectHelper projectHelperForBuildFile = ProjectHelperRepository.getInstance().getProjectHelperForBuildFile(resource);
                projectHelperForBuildFile.getImportStack().addAll(projectHelper.getImportStack());
                projectHelperForBuildFile.getExtensionStack().addAll(projectHelper.getExtensionStack());
                getProject().addReference("ant.projectHelper", projectHelperForBuildFile);
                projectHelperForBuildFile.parse(getProject(), resource);
                getProject().addReference("ant.projectHelper", projectHelper);
                projectHelper.getImportStack().clear();
                projectHelper.getImportStack().addAll(projectHelperForBuildFile.getImportStack());
                projectHelper.getExtensionStack().clear();
                projectHelper.getExtensionStack().addAll(projectHelperForBuildFile.getExtensionStack());
            } catch (BuildException e) {
                throw ProjectHelper.addLocationToBuildException(e, getLocation());
            }
        } finally {
            setProjectHelperProps(currentTargetPrefix, currentPrefixSeparator, isInIncludeMode);
        }
    }

    private static void setProjectHelperProps(String str, String str2, boolean z) {
        ProjectHelper.setCurrentTargetPrefix(str);
        ProjectHelper.setCurrentPrefixSeparator(str2);
        ProjectHelper.setInIncludeMode(z);
    }

    public void add(ResourceCollection resourceCollection) {
        this.resources.add(resourceCollection);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() {
        if (this.file == null && this.resources.size() == 0) {
            throw new BuildException("import requires file attribute or at least one nested resource");
        }
        if (getOwningTarget() == null || !"".equals(getOwningTarget().getName())) {
            throw new BuildException("import only allowed as a top-level task");
        }
        ProjectHelper projectHelper = (ProjectHelper) getProject().getReference("ant.projectHelper");
        if (projectHelper == null) {
            throw new BuildException("import requires support in ProjectHelper");
        }
        if (projectHelper.getImportStack().size() == 0) {
            throw new BuildException("import requires support in ProjectHelper");
        }
        if (getLocation() == null || getLocation().getFileName() == null) {
            throw new BuildException("Unable to get location of import task");
        }
        Union union = new Union(getProject(), this.resources);
        Resource fileAttributeResource = getFileAttributeResource();
        if (fileAttributeResource != null) {
            this.resources.add(fileAttributeResource);
        }
        Iterator it = union.iterator();
        while (it.hasNext()) {
            importResource(projectHelper, (Resource) it.next());
        }
    }

    protected final boolean isInIncludeMode() {
        return "include".equals(getTaskType());
    }

    public void setAs(String str) {
        this.targetPrefix = str;
    }

    public void setFile(String str) {
        this.file = str;
    }

    public void setOptional(boolean z) {
        this.optional = z;
    }

    public void setPrefixSeparator(String str) {
        this.prefixSeparator = str;
    }
}
