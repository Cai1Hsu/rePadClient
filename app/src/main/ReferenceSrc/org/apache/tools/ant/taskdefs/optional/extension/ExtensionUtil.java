package org.apache.tools.ant.taskdefs.optional.extension;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.jar.JarFile;
import java.util.jar.Manifest;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.DirectoryScanner;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.types.FileSet;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/ExtensionUtil.class */
public final class ExtensionUtil {
    private ExtensionUtil() {
    }

    private static void addExtension(List list, Extension extension, boolean z, boolean z2) {
        if (!z2 && extension.getImplementationURL() != null) {
            extension = new Extension(extension.getExtensionName(), extension.getSpecificationVersion().toString(), extension.getSpecificationVendor(), extension.getImplementationVersion().toString(), extension.getImplementationVendor(), extension.getImplementationVendorID(), null);
        }
        boolean z3 = (extension.getImplementationURL() == null && extension.getImplementationVersion() == null && extension.getImplementationVendorID() == null && extension.getImplementationVendor() == null) ? false : true;
        Extension extension2 = extension;
        if (!z) {
            extension2 = extension;
            if (z3) {
                extension2 = new Extension(extension.getExtensionName(), extension.getSpecificationVersion().toString(), extension.getSpecificationVendor(), null, null, null, extension.getImplementationURL());
            }
        }
        list.add(extension2);
    }

    static void extractExtensions(Project project, List list, List list2) throws BuildException {
        if (!list2.isEmpty()) {
            for (Extension extension : getExtensions(project, list2)) {
                list.add(extension);
            }
        }
    }

    private static Extension[] getExtensions(Project project, List list) throws BuildException {
        ArrayList arrayList = new ArrayList();
        Iterator it = list.iterator();
        while (it.hasNext()) {
            FileSet fileSet = (FileSet) it.next();
            boolean z = true;
            boolean z2 = true;
            if (fileSet instanceof LibFileSet) {
                LibFileSet libFileSet = (LibFileSet) fileSet;
                z = libFileSet.isIncludeImpl();
                z2 = libFileSet.isIncludeURL();
            }
            DirectoryScanner directoryScanner = fileSet.getDirectoryScanner(project);
            File basedir = directoryScanner.getBasedir();
            for (String str : directoryScanner.getIncludedFiles()) {
                loadExtensions(new File(basedir, str), arrayList, z, z2);
            }
        }
        return (Extension[]) arrayList.toArray(new Extension[arrayList.size()]);
    }

    static Manifest getManifest(File file) throws BuildException {
        try {
            Manifest manifest = new JarFile(file).getManifest();
            if (manifest != null) {
                return manifest;
            }
            throw new BuildException(new StringBuffer().append(file).append(" doesn't have a MANIFEST").toString());
        } catch (IOException e) {
            throw new BuildException(e.getMessage(), e);
        }
    }

    private static void loadExtensions(File file, List list, boolean z, boolean z2) throws BuildException {
        try {
            for (Extension extension : Extension.getAvailable(new JarFile(file).getManifest())) {
                addExtension(list, extension, z, z2);
            }
        } catch (Exception e) {
            throw new BuildException(e.getMessage(), e);
        }
    }

    static ArrayList toExtensions(List list) throws BuildException {
        ArrayList arrayList = new ArrayList();
        int size = list.size();
        for (int i = 0; i < size; i++) {
            arrayList.add(((ExtensionAdapter) list.get(i)).toExtension());
        }
        return arrayList;
    }
}
