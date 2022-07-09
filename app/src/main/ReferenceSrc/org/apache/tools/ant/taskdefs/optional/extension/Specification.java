package org.apache.tools.ant.taskdefs.optional.extension;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import java.util.jar.Attributes;
import java.util.jar.Manifest;
import org.apache.tools.ant.util.StringUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/extension/Specification.class */
public final class Specification {
    private static final String MISSING = "Missing ";
    private String implementationTitle;
    private String implementationVendor;
    private String implementationVersion;
    private String[] sections;
    private String specificationTitle;
    private String specificationVendor;
    private org.apache.tools.ant.util.DeweyDecimal specificationVersion;
    public static final Attributes.Name SPECIFICATION_TITLE = Attributes.Name.SPECIFICATION_TITLE;
    public static final Attributes.Name SPECIFICATION_VERSION = Attributes.Name.SPECIFICATION_VERSION;
    public static final Attributes.Name SPECIFICATION_VENDOR = Attributes.Name.SPECIFICATION_VENDOR;
    public static final Attributes.Name IMPLEMENTATION_TITLE = Attributes.Name.IMPLEMENTATION_TITLE;
    public static final Attributes.Name IMPLEMENTATION_VERSION = Attributes.Name.IMPLEMENTATION_VERSION;
    public static final Attributes.Name IMPLEMENTATION_VENDOR = Attributes.Name.IMPLEMENTATION_VENDOR;
    public static final Compatibility COMPATIBLE = new Compatibility("COMPATIBLE");
    public static final Compatibility REQUIRE_SPECIFICATION_UPGRADE = new Compatibility("REQUIRE_SPECIFICATION_UPGRADE");
    public static final Compatibility REQUIRE_VENDOR_SWITCH = new Compatibility("REQUIRE_VENDOR_SWITCH");
    public static final Compatibility REQUIRE_IMPLEMENTATION_CHANGE = new Compatibility("REQUIRE_IMPLEMENTATION_CHANGE");
    public static final Compatibility INCOMPATIBLE = new Compatibility("INCOMPATIBLE");

    public Specification(String str, String str2, String str3, String str4, String str5, String str6) {
        this(str, str2, str3, str4, str5, str6, null);
    }

    public Specification(String str, String str2, String str3, String str4, String str5, String str6, String[] strArr) {
        this.specificationTitle = str;
        this.specificationVendor = str3;
        if (str2 != null) {
            try {
                this.specificationVersion = new org.apache.tools.ant.util.DeweyDecimal(str2);
            } catch (NumberFormatException e) {
                throw new IllegalArgumentException(new StringBuffer().append("Bad specification version format '").append(str2).append("' in '").append(str).append("'. (Reason: ").append(e).append(")").toString());
            }
        }
        this.implementationTitle = str4;
        this.implementationVendor = str6;
        this.implementationVersion = str5;
        if (this.specificationTitle == null) {
            throw new NullPointerException("specificationTitle");
        }
        String[] strArr2 = null;
        if (strArr != null) {
            strArr2 = new String[strArr.length];
            System.arraycopy(strArr, 0, strArr2, 0, strArr.length);
        }
        this.sections = strArr2;
    }

    private static Specification getSpecification(String str, Attributes attributes) throws ParseException {
        Specification specification;
        String trimmedString = getTrimmedString(attributes.getValue(SPECIFICATION_TITLE));
        if (trimmedString == null) {
            specification = null;
        } else {
            String trimmedString2 = getTrimmedString(attributes.getValue(SPECIFICATION_VENDOR));
            if (trimmedString2 == null) {
                throw new ParseException(new StringBuffer().append(MISSING).append(SPECIFICATION_VENDOR).toString(), 0);
            }
            String trimmedString3 = getTrimmedString(attributes.getValue(SPECIFICATION_VERSION));
            if (trimmedString3 == null) {
                throw new ParseException(new StringBuffer().append(MISSING).append(SPECIFICATION_VERSION).toString(), 0);
            }
            String trimmedString4 = getTrimmedString(attributes.getValue(IMPLEMENTATION_TITLE));
            if (trimmedString4 == null) {
                throw new ParseException(new StringBuffer().append(MISSING).append(IMPLEMENTATION_TITLE).toString(), 0);
            }
            String trimmedString5 = getTrimmedString(attributes.getValue(IMPLEMENTATION_VERSION));
            if (trimmedString5 == null) {
                throw new ParseException(new StringBuffer().append(MISSING).append(IMPLEMENTATION_VERSION).toString(), 0);
            }
            String trimmedString6 = getTrimmedString(attributes.getValue(IMPLEMENTATION_VENDOR));
            if (trimmedString6 == null) {
                throw new ParseException(new StringBuffer().append(MISSING).append(IMPLEMENTATION_VENDOR).toString(), 0);
            }
            specification = new Specification(trimmedString, trimmedString3, trimmedString2, trimmedString4, trimmedString5, trimmedString6, new String[]{str});
        }
        return specification;
    }

    public static Specification[] getSpecifications(Manifest manifest) throws ParseException {
        Specification[] specificationArr;
        if (manifest == null) {
            specificationArr = new Specification[0];
        } else {
            ArrayList arrayList = new ArrayList();
            Map<String, Attributes> entries = manifest.getEntries();
            for (String str : entries.keySet()) {
                Specification specification = getSpecification(str, entries.get(str));
                if (specification != null) {
                    arrayList.add(specification);
                }
            }
            ArrayList removeDuplicates = removeDuplicates(arrayList);
            specificationArr = (Specification[]) removeDuplicates.toArray(new Specification[removeDuplicates.size()]);
        }
        return specificationArr;
    }

    private static String getTrimmedString(String str) {
        return str == null ? null : str.trim();
    }

    private boolean isCompatible(org.apache.tools.ant.util.DeweyDecimal deweyDecimal, org.apache.tools.ant.util.DeweyDecimal deweyDecimal2) {
        return deweyDecimal.isGreaterThanOrEqual(deweyDecimal2);
    }

    private static boolean isEqual(Specification specification, Specification specification2) {
        return specification.getSpecificationTitle().equals(specification2.getSpecificationTitle()) && specification.getSpecificationVersion().isEqual(specification2.getSpecificationVersion()) && specification.getSpecificationVendor().equals(specification2.getSpecificationVendor()) && specification.getImplementationTitle().equals(specification2.getImplementationTitle()) && specification.getImplementationVersion().equals(specification2.getImplementationVersion()) && specification.getImplementationVendor().equals(specification2.getImplementationVendor());
    }

    private static Specification mergeInSections(Specification specification, ArrayList arrayList) {
        if (arrayList.size() != 0) {
            arrayList.addAll(Arrays.asList(specification.getSections()));
            specification = new Specification(specification.getSpecificationTitle(), specification.getSpecificationVersion().toString(), specification.getSpecificationVendor(), specification.getImplementationTitle(), specification.getImplementationVersion(), specification.getImplementationVendor(), (String[]) arrayList.toArray(new String[arrayList.size()]));
        }
        return specification;
    }

    private static ArrayList removeDuplicates(ArrayList arrayList) {
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        while (arrayList.size() > 0) {
            Specification specification = (Specification) arrayList.remove(0);
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Specification specification2 = (Specification) it.next();
                if (isEqual(specification, specification2)) {
                    String[] sections = specification2.getSections();
                    if (sections != null) {
                        arrayList3.addAll(Arrays.asList(sections));
                    }
                    it.remove();
                }
            }
            arrayList2.add(mergeInSections(specification, arrayList3));
            arrayList3.clear();
        }
        return arrayList2;
    }

    public Compatibility getCompatibilityWith(Specification specification) {
        Compatibility compatibility;
        if (!this.specificationTitle.equals(specification.getSpecificationTitle())) {
            compatibility = INCOMPATIBLE;
        } else {
            org.apache.tools.ant.util.DeweyDecimal specificationVersion = specification.getSpecificationVersion();
            if (this.specificationVersion == null || (specificationVersion != null && isCompatible(this.specificationVersion, specificationVersion))) {
                String implementationVendor = specification.getImplementationVendor();
                if (this.implementationVendor == null || (implementationVendor != null && this.implementationVendor.equals(implementationVendor))) {
                    String implementationVersion = specification.getImplementationVersion();
                    compatibility = (this.implementationVersion == null || (implementationVersion != null && this.implementationVersion.equals(implementationVersion))) ? COMPATIBLE : REQUIRE_IMPLEMENTATION_CHANGE;
                } else {
                    compatibility = REQUIRE_VENDOR_SWITCH;
                }
            } else {
                compatibility = REQUIRE_SPECIFICATION_UPGRADE;
            }
        }
        return compatibility;
    }

    public String getImplementationTitle() {
        return this.implementationTitle;
    }

    public String getImplementationVendor() {
        return this.implementationVendor;
    }

    public String getImplementationVersion() {
        return this.implementationVersion;
    }

    public String[] getSections() {
        String[] strArr;
        if (this.sections == null) {
            strArr = null;
        } else {
            strArr = new String[this.sections.length];
            System.arraycopy(this.sections, 0, strArr, 0, this.sections.length);
        }
        return strArr;
    }

    public String getSpecificationTitle() {
        return this.specificationTitle;
    }

    public String getSpecificationVendor() {
        return this.specificationVendor;
    }

    public org.apache.tools.ant.util.DeweyDecimal getSpecificationVersion() {
        return this.specificationVersion;
    }

    public boolean isCompatibleWith(Specification specification) {
        return COMPATIBLE == getCompatibilityWith(specification);
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer(SPECIFICATION_TITLE.toString());
        stringBuffer.append(": ");
        stringBuffer.append(this.specificationTitle);
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
        if (this.implementationTitle != null) {
            stringBuffer.append(IMPLEMENTATION_TITLE);
            stringBuffer.append(": ");
            stringBuffer.append(this.implementationTitle);
            stringBuffer.append(StringUtils.LINE_SEP);
        }
        if (this.implementationVersion != null) {
            stringBuffer.append(IMPLEMENTATION_VERSION);
            stringBuffer.append(": ");
            stringBuffer.append(this.implementationVersion);
            stringBuffer.append(StringUtils.LINE_SEP);
        }
        if (this.implementationVendor != null) {
            stringBuffer.append(IMPLEMENTATION_VENDOR);
            stringBuffer.append(": ");
            stringBuffer.append(this.implementationVendor);
            stringBuffer.append(StringUtils.LINE_SEP);
        }
        return stringBuffer.toString();
    }
}
