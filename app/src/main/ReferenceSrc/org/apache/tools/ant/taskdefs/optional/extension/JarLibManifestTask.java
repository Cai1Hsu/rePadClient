package org.apache.tools.ant.taskdefs.optional.extension;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.jar.Attributes;
import java.util.jar.Manifest;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Task;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/JarLibManifestTask.class */
public final class JarLibManifestTask extends Task {
    private static final String CREATED_BY = "Created-By";
    private static final String MANIFEST_VERSION = "1.0";
    private File destFile;
    private Extension extension;
    private final ArrayList dependencies = new ArrayList();
    private final ArrayList optionals = new ArrayList();
    private final ArrayList extraAttributes = new ArrayList();

    private void appendExtensionList(Attributes attributes, Attributes.Name name, String str, int i) {
        StringBuffer stringBuffer = new StringBuffer();
        for (int i2 = 0; i2 < i; i2++) {
            stringBuffer.append(str);
            stringBuffer.append(i2);
            stringBuffer.append(' ');
        }
        attributes.put(name, stringBuffer.toString());
    }

    private void appendExtraAttributes(Attributes attributes) {
        Iterator it = this.extraAttributes.iterator();
        while (it.hasNext()) {
            ExtraAttribute extraAttribute = (ExtraAttribute) it.next();
            attributes.putValue(extraAttribute.getName(), extraAttribute.getValue());
        }
    }

    private void appendLibraryList(Attributes attributes, String str, ArrayList arrayList) throws BuildException {
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            Extension.addExtension((Extension) arrayList.get(i), new StringBuffer().append(str).append(i).append("-").toString(), attributes);
        }
    }

    private ArrayList toExtensions(ArrayList arrayList) throws BuildException {
        ArrayList arrayList2 = new ArrayList();
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            for (Extension extension : ((ExtensionSet) arrayList.get(i)).toExtensions(getProject())) {
                arrayList2.add(extension);
            }
        }
        return arrayList2;
    }

    private void validate() throws BuildException {
        if (this.destFile == null) {
            throw new BuildException("Destfile attribute not specified.");
        }
        if (this.destFile.exists() && !this.destFile.isFile()) {
            throw new BuildException(new StringBuffer().append(this.destFile).append(" is not a file.").toString());
        }
    }

    private void writeManifest(Manifest manifest) throws IOException {
        Throwable th;
        FileOutputStream fileOutputStream;
        FileOutputStream fileOutputStream2 = null;
        try {
            fileOutputStream = new FileOutputStream(this.destFile);
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            manifest.write(fileOutputStream);
            fileOutputStream.flush();
            if (fileOutputStream == null) {
                return;
            }
            try {
                fileOutputStream.close();
            } catch (IOException e) {
            }
        } catch (Throwable th3) {
            th = th3;
            fileOutputStream2 = fileOutputStream;
            if (fileOutputStream2 != null) {
                try {
                    fileOutputStream2.close();
                } catch (IOException e2) {
                }
            }
            throw th;
        }
    }

    public void addConfiguredAttribute(ExtraAttribute extraAttribute) {
        this.extraAttributes.add(extraAttribute);
    }

    public void addConfiguredDepends(ExtensionSet extensionSet) {
        this.dependencies.add(extensionSet);
    }

    public void addConfiguredExtension(ExtensionAdapter extensionAdapter) throws BuildException {
        if (this.extension != null) {
            throw new BuildException("Can not have multiple extensions defined in one library.");
        }
        this.extension = extensionAdapter.toExtension();
    }

    public void addConfiguredOptions(ExtensionSet extensionSet) {
        this.optionals.add(extensionSet);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        validate();
        Manifest manifest = new Manifest();
        Attributes mainAttributes = manifest.getMainAttributes();
        mainAttributes.put(Attributes.Name.MANIFEST_VERSION, "1.0");
        mainAttributes.putValue(CREATED_BY, new StringBuffer().append("Apache Ant ").append(getProject().getProperty(MagicNames.ANT_VERSION)).toString());
        appendExtraAttributes(mainAttributes);
        if (this.extension != null) {
            Extension.addExtension(this.extension, mainAttributes);
        }
        ArrayList extensions = toExtensions(this.dependencies);
        appendExtensionList(mainAttributes, Extension.EXTENSION_LIST, "lib", extensions.size());
        appendLibraryList(mainAttributes, "lib", extensions);
        ArrayList extensions2 = toExtensions(this.optionals);
        appendExtensionList(mainAttributes, Extension.OPTIONAL_EXTENSION_LIST, "opt", extensions2.size());
        appendLibraryList(mainAttributes, "opt", extensions2);
        try {
            log(new StringBuffer().append("Generating manifest ").append(this.destFile.getAbsoluteFile()).toString(), 2);
            writeManifest(manifest);
        } catch (IOException e) {
            throw new BuildException(e.getMessage(), e);
        }
    }

    public void setDestfile(File file) {
        this.destFile = file;
    }
}
