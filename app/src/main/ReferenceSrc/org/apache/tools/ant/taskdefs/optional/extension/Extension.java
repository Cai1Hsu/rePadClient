package org.apache.tools.ant.taskdefs.optional.extension;

import java.util.ArrayList;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.jar.Attributes;
import java.util.jar.Manifest;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/Extension.class */
public final class Extension {
    private String extensionName;
    private String implementationURL;
    private String implementationVendor;
    private String implementationVendorID;
    private org.apache.tools.ant.util.DeweyDecimal implementationVersion;
    private String specificationVendor;
    private org.apache.tools.ant.util.DeweyDecimal specificationVersion;
    public static final Attributes.Name EXTENSION_LIST = new Attributes.Name("Extension-List");
    public static final Attributes.Name OPTIONAL_EXTENSION_LIST = new Attributes.Name("Optional-Extension-List");
    public static final Attributes.Name EXTENSION_NAME = new Attributes.Name("Extension-Name");
    public static final Attributes.Name SPECIFICATION_VERSION = Attributes.Name.SPECIFICATION_VERSION;
    public static final Attributes.Name SPECIFICATION_VENDOR = Attributes.Name.SPECIFICATION_VENDOR;
    public static final Attributes.Name IMPLEMENTATION_VERSION = Attributes.Name.IMPLEMENTATION_VERSION;
    public static final Attributes.Name IMPLEMENTATION_VENDOR = Attributes.Name.IMPLEMENTATION_VENDOR;
    public static final Attributes.Name IMPLEMENTATION_URL = new Attributes.Name("Implementation-URL");
    public static final Attributes.Name IMPLEMENTATION_VENDOR_ID = new Attributes.Name("Implementation-Vendor-Id");
    public static final Compatibility COMPATIBLE = new Compatibility("COMPATIBLE");
    public static final Compatibility REQUIRE_SPECIFICATION_UPGRADE = new Compatibility("REQUIRE_SPECIFICATION_UPGRADE");
    public static final Compatibility REQUIRE_VENDOR_SWITCH = new Compatibility("REQUIRE_VENDOR_SWITCH");
    public static final Compatibility REQUIRE_IMPLEMENTATION_UPGRADE = new Compatibility("REQUIRE_IMPLEMENTATION_UPGRADE");
    public static final Compatibility INCOMPATIBLE = new Compatibility("INCOMPATIBLE");

    public Extension(String str, String str2, String str3, String str4, String str5, String str6, String str7) {
        this.extensionName = str;
        this.specificationVendor = str3;
        if (str2 != null) {
            try {
                this.specificationVersion = new org.apache.tools.ant.util.DeweyDecimal(str2);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException(new StringBuffer().append("Bad specification version format '").append(str2).append("' in '").append(str).append("'. (Reason: ").append(e).append(")").toString());
            }
        }
        this.implementationURL = str7;
        this.implementationVendor = str5;
        this.implementationVendorID = str6;
        if (str4 != null) {
            try {
                this.implementationVersion = new org.apache.tools.ant.util.DeweyDecimal(str4);
            } catch (NumberFormatException e2) {
                throw new IllegalArgumentException(new StringBuffer().append("Bad implementation version format '").append(str4).append("' in '").append(str).append("'. (Reason: ").append(e2).append(")").toString());
            }
        }
        if (this.extensionName == null) {
            throw new NullPointerException("extensionName property is null");
        }
    }

    public static void addExtension(Extension extension, String str, Attributes attributes) {
        attributes.putValue(new StringBuffer().append(str).append(EXTENSION_NAME).toString(), extension.getExtensionName());
        String specificationVendor = extension.getSpecificationVendor();
        if (specificationVendor != null) {
            attributes.putValue(new StringBuffer().append(str).append(SPECIFICATION_VENDOR).toString(), specificationVendor);
        }
        org.apache.tools.ant.util.DeweyDecimal specificationVersion = extension.getSpecificationVersion();
        if (specificationVersion != null) {
            attributes.putValue(new StringBuffer().append(str).append(SPECIFICATION_VERSION).toString(), specificationVersion.toString());
        }
        String implementationVendorID = extension.getImplementationVendorID();
        if (implementationVendorID != null) {
            attributes.putValue(new StringBuffer().append(str).append(IMPLEMENTATION_VENDOR_ID).toString(), implementationVendorID);
        }
        String implementationVendor = extension.getImplementationVendor();
        if (implementationVendor != null) {
            attributes.putValue(new StringBuffer().append(str).append(IMPLEMENTATION_VENDOR).toString(), implementationVendor);
        }
        org.apache.tools.ant.util.DeweyDecimal implementationVersion = extension.getImplementationVersion();
        if (implementationVersion != null) {
            attributes.putValue(new StringBuffer().append(str).append(IMPLEMENTATION_VERSION).toString(), implementationVersion.toString());
        }
        String implementationURL = extension.getImplementationURL();
        if (implementationURL != null) {
            attributes.putValue(new StringBuffer().append(str).append(IMPLEMENTATION_URL).toString(), implementationURL);
        }
    }

    public static void addExtension(Extension extension, Attributes attributes) {
        addExtension(extension, "", attributes);
    }

    public static Extension[] getAvailable(Manifest manifest) {
        Extension[] extensionArr;
        Extension extension;
        if (manifest == null) {
            extensionArr = new Extension[0];
        } else {
            ArrayList arrayList = new ArrayList();
            Attributes mainAttributes = manifest.getMainAttributes();
            if (mainAttributes != null && (extension = getExtension("", mainAttributes)) != null) {
                arrayList.add(extension);
            }
            Map<String, Attributes> entries = manifest.getEntries();
            for (String str : entries.keySet()) {
                Extension extension2 = getExtension("", entries.get(str));
                if (extension2 != null) {
                    arrayList.add(extension2);
                }
            }
            extensionArr = (Extension[]) arrayList.toArray(new Extension[arrayList.size()]);
        }
        return extensionArr;
    }

    private static Extension getExtension(String str, Attributes attributes) {
        Extension extension;
        String trimmedString = getTrimmedString(attributes.getValue(new StringBuffer().append(str).append(EXTENSION_NAME).toString()));
        if (trimmedString == null) {
            extension = null;
        } else {
            extension = new Extension(trimmedString, getTrimmedString(attributes.getValue(new StringBuffer().append(str).append(SPECIFICATION_VERSION).toString())), getTrimmedString(attributes.getValue(new StringBuffer().append(str).append(SPECIFICATION_VENDOR).toString())), getTrimmedString(attributes.getValue(new StringBuffer().append(str).append(IMPLEMENTATION_VERSION).toString())), getTrimmedString(attributes.getValue(new StringBuffer().append(str).append(IMPLEMENTATION_VENDOR).toString())), getTrimmedString(attributes.getValue(new StringBuffer().append(str).append(IMPLEMENTATION_VENDOR_ID).toString())), getTrimmedString(attributes.getValue(new StringBuffer().append(str).append(IMPLEMENTATION_URL).toString())));
        }
        return extension;
    }

    private static void getExtension(Attributes attributes, ArrayList arrayList, Attributes.Name name) {
        String value = attributes.getValue(name);
        if (value == null) {
            return;
        }
        for (String str : split(value, " ")) {
            Extension extension = getExtension(new StringBuffer().append(str).append("-").toString(), attributes);
            if (extension != null) {
                arrayList.add(extension);
            }
        }
    }

    private static Extension[] getListed(Manifest manifest, Attributes.Name name) {
        ArrayList arrayList = new ArrayList();
        Attributes mainAttributes = manifest.getMainAttributes();
        if (mainAttributes != null) {
            getExtension(mainAttributes, arrayList, name);
        }
        Map<String, Attributes> entries = manifest.getEntries();
        for (String str : entries.keySet()) {
            getExtension(entries.get(str), arrayList, name);
        }
        return (Extension[]) arrayList.toArray(new Extension[arrayList.size()]);
    }

    public static Extension[] getOptions(Manifest manifest) {
        return getListed(manifest, OPTIONAL_EXTENSION_LIST);
    }

    public static Extension[] getRequired(Manifest manifest) {
        return getListed(manifest, Attributes.Name.EXTENSION_LIST);
    }

    private static String getTrimmedString(String str) {
        return str == null ? null : str.trim();
    }

    private boolean isCompatible(org.apache.tools.ant.util.DeweyDecimal deweyDecimal, org.apache.tools.ant.util.DeweyDecimal deweyDecimal2) {
        return deweyDecimal.isGreaterThanOrEqual(deweyDecimal2);
    }

    private static String[] split(String str, String str2) {
        StringTokenizer stringTokenizer = new StringTokenizer(str, str2);
        String[] strArr = new String[stringTokenizer.countTokens()];
        for (int i = 0; i < strArr.length; i++) {
            strArr[i] = stringTokenizer.nextToken();
        }
        return strArr;
    }

    public Compatibility getCompatibilityWith(Extension extension) {
        Compatibility compatibility;
        if (!this.extensionName.equals(extension.getExtensionName())) {
            compatibility = INCOMPATIBLE;
        } else {
            org.apache.tools.ant.util.DeweyDecimal specificationVersion = extension.getSpecificationVersion();
            if (specificationVersion == null || (this.specificationVersion != null && isCompatible(this.specificationVersion, specificationVersion))) {
                String implementationVendorID = extension.getImplementationVendorID();
                if (implementationVendorID == null || (this.implementationVendorID != null && this.implementationVendorID.equals(implementationVendorID))) {
                    org.apache.tools.ant.util.DeweyDecimal implementationVersion = extension.getImplementationVersion();
                    compatibility = (implementationVersion == null || (this.implementationVersion != null && isCompatible(this.implementationVersion, implementationVersion))) ? COMPATIBLE : REQUIRE_IMPLEMENTATION_UPGRADE;
                } else {
                    compatibility = REQUIRE_VENDOR_SWITCH;
                }
            } else {
                compatibility = REQUIRE_SPECIFICATION_UPGRADE;
            }
        }
        return compatibility;
    }

    public String getExtensionName() {
        return this.extensionName;
    }

    public String getImplementationURL() {
        return this.implementationURL;
    }

    public String getImplementationVendor() {
        return this.implementationVendor;
    }

    public String getImplementationVendorID() {
        return this.implementationVendorID;
    }

    public org.apache.tools.ant.util.DeweyDecimal getImplementationVersion() {
        return this.implementationVersion;
    }

    public String getSpecificationVendor() {
        return this.specificationVendor;
    }

    public org.apache.tools.ant.util.DeweyDecimal getSpecificationVersion() {
        return this.specificationVersion;
    }

    public boolean isCompatibleWith(Extension extension) {
        return COMPATIBLE == getCompatibilityWith(extension);
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer(EXTENSION_NAME.toString());
        stringBuffer.append(": ");
        stringBuffer.append(this.extensionName);
        stringBuffer.append(StringUtils.LINE_SEP);
        if (this.specificationVersion != null) {
            stringBuffer.append(SPECIFICATION_VERSION);
            stringBuffer.append(": ");
            stringBuffer.append(this.specificationVersion);
            stringBuffer.append(StringUtils.LINE_SEP);
        }
        if (this.specificationVendor != null) {
            stringBuffer.append(SPECIFICATION_VENDOR);
            stringBuffer.append(": ");
            stringBuffer.append(this.specificationVendor);
            stringBuffer.append(StringUtils.LINE_SEP);
        }
        if (this.implementationVersion != null) {
            stringBuffer.append(IMPLEMENTATION_VERSION);
            stringBuffer.append(": ");
            stringBuffer.append(this.implementationVersion);
            stringBuffer.append(StringUtils.LINE_SEP);
        }
        if (this.implementationVendorID != null) {
            stringBuffer.append(IMPLEMENTATION_VENDOR_ID);
            stringBuffer.append(": ");
            stringBuffer.append(this.implementationVendorID);
            stringBuffer.append(StringUtils.LINE_SEP);
        }
        if (this.implementationVendor != null) {
            stringBuffer.append(IMPLEMENTATION_VENDOR);
            stringBuffer.append(": ");
            stringBuffer.append(this.implementationVendor);
            stringBuffer.append(StringUtils.LINE_SEP);
        }
        if (this.implementationURL != null) {
            stringBuffer.append(IMPLEMENTATION_URL);
            stringBuffer.append(": ");
            stringBuffer.append(this.implementationURL);
            stringBuffer.append(StringUtils.LINE_SEP);
        }
        return stringBuffer.toString();
    }
}
