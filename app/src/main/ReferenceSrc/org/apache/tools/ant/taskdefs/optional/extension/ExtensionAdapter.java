package org.apache.tools.ant.taskdefs.optional.extension;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.DataType;
import org.apache.tools.ant.types.Reference;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/ExtensionAdapter.class */
public class ExtensionAdapter extends DataType {
    private String extensionName;
    private String implementationURL;
    private String implementationVendor;
    private String implementationVendorID;
    private org.apache.tools.ant.util.DeweyDecimal implementationVersion;
    private String specificationVendor;
    private org.apache.tools.ant.util.DeweyDecimal specificationVersion;

    private void verifyNotAReference() throws BuildException {
        if (isReference()) {
            throw tooManyAttributes();
        }
    }

    public void setExtensionName(String str) {
        verifyNotAReference();
        this.extensionName = str;
    }

    public void setImplementationUrl(String str) {
        verifyNotAReference();
        this.implementationURL = str;
    }

    public void setImplementationVendor(String str) {
        verifyNotAReference();
        this.implementationVendor = str;
    }

    public void setImplementationVendorId(String str) {
        verifyNotAReference();
        this.implementationVendorID = str;
    }

    public void setImplementationVersion(String str) {
        verifyNotAReference();
        this.implementationVersion = new org.apache.tools.ant.util.DeweyDecimal(str);
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (this.extensionName == null && this.specificationVersion == null && this.specificationVendor == null && this.implementationVersion == null && this.implementationVendorID == null && this.implementationVendor == null && this.implementationURL == null) {
            super.setRefid(reference);
            return;
        }
        throw tooManyAttributes();
    }

    public void setSpecificationVendor(String str) {
        verifyNotAReference();
        this.specificationVendor = str;
    }

    public void setSpecificationVersion(String str) {
        verifyNotAReference();
        this.specificationVersion = new org.apache.tools.ant.util.DeweyDecimal(str);
    }

    Extension toExtension() throws BuildException {
        Extension extension;
        if (isReference()) {
            extension = ((ExtensionAdapter) getCheckedRef()).toExtension();
        } else {
            dieOnCircularReference();
            if (this.extensionName == null) {
                throw new BuildException("Extension is missing name.");
            }
            String str = null;
            if (this.specificationVersion != null) {
                str = this.specificationVersion.toString();
            }
            String str2 = null;
            if (this.implementationVersion != null) {
                str2 = this.implementationVersion.toString();
            }
            extension = new Extension(this.extensionName, str, this.specificationVendor, str2, this.implementationVendor, this.implementationVendorID, this.implementationURL);
        }
        return extension;
    }

    @Override // org.apache.tools.ant.types.DataType
    public String toString() {
        return new StringBuffer().append("{").append(toExtension().toString()).append("}").toString();
    }
}
