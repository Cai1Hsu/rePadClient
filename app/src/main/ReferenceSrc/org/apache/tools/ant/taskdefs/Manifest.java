package org.apache.tools.ant.taskdefs;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Vector;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.CollectionUtils;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Manifest.class */
public class Manifest {
    public static final String ATTRIBUTE_SIGNATURE_VERSION = "Signature-Version";
    public static final String DEFAULT_MANIFEST_VERSION = "1.0";
    public static final String EOL = "\r\n";
    public static final String ERROR_FROM_FORBIDDEN = "Manifest attributes should not start with \"From\" in \"";
    public static final String JAR_ENCODING = "UTF-8";
    public static final int MAX_LINE_LENGTH = 72;
    public static final int MAX_SECTION_LENGTH = 70;
    static Class class$org$apache$tools$ant$taskdefs$Manifest;
    private String manifestVersion;
    public static final String ATTRIBUTE_MANIFEST_VERSION = "Manifest-Version";
    private static final String ATTRIBUTE_MANIFEST_VERSION_LC = ATTRIBUTE_MANIFEST_VERSION.toLowerCase(Locale.ENGLISH);
    public static final String ATTRIBUTE_NAME = "Name";
    private static final String ATTRIBUTE_NAME_LC = ATTRIBUTE_NAME.toLowerCase(Locale.ENGLISH);
    public static final String ATTRIBUTE_FROM = "From";
    private static final String ATTRIBUTE_FROM_LC = ATTRIBUTE_FROM.toLowerCase(Locale.ENGLISH);
    public static final String ATTRIBUTE_CLASSPATH = "Class-Path";
    private static final String ATTRIBUTE_CLASSPATH_LC = ATTRIBUTE_CLASSPATH.toLowerCase(Locale.ENGLISH);
    private Section mainSection = new Section();
    private Map sections = new LinkedHashMap();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Manifest$Attribute.class */
    public static class Attribute {
        private static final int MAX_NAME_LENGTH = 70;
        private static final int MAX_NAME_VALUE_LENGTH = 68;
        private int currentIndex;
        private String name;
        private Vector values;

        public Attribute() {
            this.name = null;
            this.values = new Vector();
            this.currentIndex = 0;
        }

        public Attribute(String str) throws ManifestException {
            this.name = null;
            this.values = new Vector();
            this.currentIndex = 0;
            parse(str);
        }

        public Attribute(String str, String str2) {
            this.name = null;
            this.values = new Vector();
            this.currentIndex = 0;
            this.name = str;
            setValue(str2);
        }

        private void writeValue(PrintWriter printWriter, String str) throws IOException {
            String str2;
            String str3;
            int length = this.name.getBytes("UTF-8").length;
            if (length <= MAX_NAME_VALUE_LENGTH) {
                str2 = new StringBuffer().append(this.name).append(": ").append(str).toString();
            } else if (length > 70) {
                throw new IOException(new StringBuffer().append("Unable to write manifest line ").append(this.name).append(": ").append(str).toString());
            } else {
                printWriter.print(new StringBuffer().append(this.name).append(": ").append("\r\n").toString());
                str2 = new StringBuffer().append(" ").append(str).toString();
            }
            while (true) {
                String str4 = str2;
                if (str4.getBytes("UTF-8").length <= 70) {
                    printWriter.print(new StringBuffer().append(str4).append("\r\n").toString());
                    return;
                }
                int i = 70;
                if (70 >= str4.length()) {
                    i = str4.length() - 1;
                }
                String substring = str4.substring(0, i);
                while (true) {
                    str3 = substring;
                    if (str3.getBytes("UTF-8").length <= 70 || i <= 0) {
                        break;
                    }
                    i--;
                    substring = str4.substring(0, i);
                }
                if (i == 0) {
                    throw new IOException(new StringBuffer().append("Unable to write manifest line ").append(this.name).append(": ").append(str).toString());
                }
                printWriter.print(new StringBuffer().append(str3).append("\r\n").toString());
                str2 = new StringBuffer().append(" ").append(str4.substring(i)).toString();
            }
        }

        public void addContinuation(String str) {
            setValue(new StringBuffer().append((String) this.values.elementAt(this.currentIndex)).append(str.substring(1)).toString());
        }

        public void addValue(String str) {
            this.currentIndex++;
            setValue(str);
        }

        /* JADX WARN: Code restructure failed: missing block: B:15:0x003b, code lost:
            if (r0 == null) goto L16;
         */
        /* JADX WARN: Code restructure failed: missing block: B:19:0x004c, code lost:
            if (r0.equals(r0) != false) goto L20;
         */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public boolean equals(Object obj) {
            boolean z = false;
            if (obj != null) {
                if (obj.getClass() != getClass()) {
                    z = false;
                } else if (obj == this) {
                    z = true;
                } else {
                    Attribute attribute = (Attribute) obj;
                    String key = getKey();
                    String key2 = attribute.getKey();
                    if (key == null) {
                        z = false;
                    }
                    if (key != null) {
                        z = false;
                    }
                    z = this.values.equals(attribute.values);
                }
            }
            return z;
        }

        public String getKey() {
            return this.name == null ? null : this.name.toLowerCase(Locale.ENGLISH);
        }

        public String getName() {
            return this.name;
        }

        public String getValue() {
            String trim;
            if (this.values.size() == 0) {
                trim = null;
            } else {
                String str = "";
                Enumeration values = getValues();
                while (values.hasMoreElements()) {
                    str = new StringBuffer().append(str).append((String) values.nextElement()).append(" ").toString();
                }
                trim = str.trim();
            }
            return trim;
        }

        public Enumeration getValues() {
            return this.values.elements();
        }

        public int hashCode() {
            int i = 0;
            if (this.name != null) {
                i = 0 + getKey().hashCode();
            }
            return i + this.values.hashCode();
        }

        public void parse(String str) throws ManifestException {
            int indexOf = str.indexOf(": ");
            if (indexOf == -1) {
                throw new ManifestException(new StringBuffer().append("Manifest line \"").append(str).append("\" is not valid as it does not ").append("contain a name and a value separated by ': ' ").toString());
            }
            this.name = str.substring(0, indexOf);
            setValue(str.substring(indexOf + 2));
        }

        public void setName(String str) {
            this.name = str;
        }

        public void setValue(String str) {
            if (this.currentIndex < this.values.size()) {
                this.values.setElementAt(str, this.currentIndex);
                return;
            }
            this.values.addElement(str);
            this.currentIndex = this.values.size() - 1;
        }

        public void write(PrintWriter printWriter) throws IOException {
            write(printWriter, false);
        }

        public void write(PrintWriter printWriter, boolean z) throws IOException {
            if (z) {
                writeValue(printWriter, getValue());
                return;
            }
            Enumeration values = getValues();
            while (values.hasMoreElements()) {
                writeValue(printWriter, (String) values.nextElement());
            }
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Manifest$Section.class */
    public static class Section {
        private Vector warnings = new Vector();
        private String name = null;
        private Map attributes = new LinkedHashMap();

        public void storeAttribute(Attribute attribute) {
            if (attribute == null) {
                return;
            }
            this.attributes.put(attribute.getKey(), attribute);
        }

        public String addAttributeAndCheck(Attribute attribute) throws ManifestException {
            String str;
            if (attribute.getName() == null || attribute.getValue() == null) {
                throw new BuildException("Attributes must have name and value");
            }
            String key = attribute.getKey();
            if (key.equals(Manifest.ATTRIBUTE_NAME_LC)) {
                this.warnings.addElement(new StringBuffer().append("\"Name\" attributes should not occur in the main section and must be the first element in all other sections: \"").append(attribute.getName()).append(": ").append(attribute.getValue()).append("\"").toString());
                str = attribute.getValue();
            } else {
                if (key.startsWith(Manifest.ATTRIBUTE_FROM_LC)) {
                    this.warnings.addElement(new StringBuffer().append(Manifest.ERROR_FROM_FORBIDDEN).append(attribute.getName()).append(": ").append(attribute.getValue()).append("\"").toString());
                } else if (key.equals(Manifest.ATTRIBUTE_CLASSPATH_LC)) {
                    Attribute attribute2 = (Attribute) this.attributes.get(key);
                    if (attribute2 == null) {
                        storeAttribute(attribute);
                    } else {
                        this.warnings.addElement("Multiple Class-Path attributes are supported but violate the Jar specification and may not be correctly processed in all environments");
                        Enumeration values = attribute.getValues();
                        while (values.hasMoreElements()) {
                            attribute2.addValue((String) values.nextElement());
                        }
                    }
                } else if (this.attributes.containsKey(key)) {
                    throw new ManifestException(new StringBuffer().append("The attribute \"").append(attribute.getName()).append("\" may not occur more ").append("than once in the same section").toString());
                } else {
                    storeAttribute(attribute);
                }
                str = null;
            }
            return str;
        }

        public void addConfiguredAttribute(Attribute attribute) throws ManifestException {
            if (addAttributeAndCheck(attribute) != null) {
                throw new BuildException("Specify the section name using the \"name\" attribute of the <section> element rather than using a \"Name\" manifest attribute");
            }
        }

        public Object clone() {
            Section section = new Section();
            section.setName(this.name);
            Enumeration attributeKeys = getAttributeKeys();
            while (attributeKeys.hasMoreElements()) {
                Attribute attribute = getAttribute((String) attributeKeys.nextElement());
                section.storeAttribute(new Attribute(attribute.getName(), attribute.getValue()));
            }
            return section;
        }

        public boolean equals(Object obj) {
            return (obj == null || obj.getClass() != getClass()) ? false : obj == this ? true : this.attributes.equals(((Section) obj).attributes);
        }

        public Attribute getAttribute(String str) {
            return (Attribute) this.attributes.get(str.toLowerCase(Locale.ENGLISH));
        }

        public Enumeration getAttributeKeys() {
            return CollectionUtils.asEnumeration(this.attributes.keySet().iterator());
        }

        public String getAttributeValue(String str) {
            Attribute attribute = getAttribute(str.toLowerCase(Locale.ENGLISH));
            return attribute == null ? null : attribute.getValue();
        }

        public String getName() {
            return this.name;
        }

        public Enumeration getWarnings() {
            return this.warnings.elements();
        }

        public int hashCode() {
            return this.attributes.hashCode();
        }

        public void merge(Section section) throws ManifestException {
            merge(section, false);
        }

        public void merge(Section section, boolean z) throws ManifestException {
            Attribute attribute;
            if ((this.name != null || section.getName() == null) && (this.name == null || section.getName() == null || this.name.toLowerCase(Locale.ENGLISH).equals(section.getName().toLowerCase(Locale.ENGLISH)))) {
                Enumeration attributeKeys = section.getAttributeKeys();
                Attribute attribute2 = null;
                while (attributeKeys.hasMoreElements()) {
                    String str = (String) attributeKeys.nextElement();
                    Attribute attribute3 = section.getAttribute(str);
                    if (str.equalsIgnoreCase(Manifest.ATTRIBUTE_CLASSPATH)) {
                        Attribute attribute4 = attribute2;
                        if (attribute2 == null) {
                            attribute4 = new Attribute();
                            attribute4.setName(Manifest.ATTRIBUTE_CLASSPATH);
                        }
                        Enumeration values = attribute3.getValues();
                        while (true) {
                            attribute2 = attribute4;
                            if (values.hasMoreElements()) {
                                attribute4.addValue((String) values.nextElement());
                            }
                        }
                    } else {
                        storeAttribute(attribute3);
                    }
                }
                if (attribute2 != null) {
                    if (z && (attribute = getAttribute(Manifest.ATTRIBUTE_CLASSPATH)) != null) {
                        Enumeration values2 = attribute.getValues();
                        while (values2.hasMoreElements()) {
                            attribute2.addValue((String) values2.nextElement());
                        }
                    }
                    storeAttribute(attribute2);
                }
                Enumeration elements = section.warnings.elements();
                while (elements.hasMoreElements()) {
                    this.warnings.addElement(elements.nextElement());
                }
                return;
            }
            throw new ManifestException("Unable to merge sections with different names");
        }

        public String read(BufferedReader bufferedReader) throws ManifestException, IOException {
            String str;
            Attribute attribute = null;
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine == null || readLine.length() == 0) {
                    break;
                } else if (readLine.charAt(0) != ' ') {
                    Attribute attribute2 = new Attribute(readLine);
                    String addAttributeAndCheck = addAttributeAndCheck(attribute2);
                    attribute = getAttribute(attribute2.getKey());
                    if (addAttributeAndCheck != null) {
                        str = addAttributeAndCheck;
                        break;
                    }
                } else if (attribute != null) {
                    attribute.addContinuation(readLine);
                } else if (this.name == null) {
                    throw new ManifestException(new StringBuffer().append("Can't start an attribute with a continuation line ").append(readLine).toString());
                } else {
                    this.name = new StringBuffer().append(this.name).append(readLine.substring(1)).toString();
                }
            }
            str = null;
            return str;
        }

        public void removeAttribute(String str) {
            this.attributes.remove(str.toLowerCase(Locale.ENGLISH));
        }

        public void setName(String str) {
            this.name = str;
        }

        public void write(PrintWriter printWriter) throws IOException {
            write(printWriter, false);
        }

        public void write(PrintWriter printWriter, boolean z) throws IOException {
            if (this.name != null) {
                new Attribute(Manifest.ATTRIBUTE_NAME, this.name).write(printWriter);
            }
            Enumeration attributeKeys = getAttributeKeys();
            while (attributeKeys.hasMoreElements()) {
                getAttribute((String) attributeKeys.nextElement()).write(printWriter, z);
            }
            printWriter.print("\r\n");
        }
    }

    public Manifest() {
        this.manifestVersion = "1.0";
        this.manifestVersion = null;
    }

    public Manifest(Reader reader) throws ManifestException, IOException {
        this.manifestVersion = "1.0";
        BufferedReader bufferedReader = new BufferedReader(reader);
        String read = this.mainSection.read(bufferedReader);
        String attributeValue = this.mainSection.getAttributeValue(ATTRIBUTE_MANIFEST_VERSION);
        if (attributeValue != null) {
            this.manifestVersion = attributeValue;
            this.mainSection.removeAttribute(ATTRIBUTE_MANIFEST_VERSION);
        }
        while (true) {
            String readLine = bufferedReader.readLine();
            if (readLine != null) {
                if (readLine.length() != 0) {
                    Section section = new Section();
                    if (read == null) {
                        Attribute attribute = new Attribute(readLine);
                        if (!attribute.getName().equalsIgnoreCase(ATTRIBUTE_NAME)) {
                            throw new ManifestException(new StringBuffer().append("Manifest sections should start with a \"Name\" attribute and not \"").append(attribute.getName()).append("\"").toString());
                        }
                        read = attribute.getValue();
                    } else {
                        section.addAttributeAndCheck(new Attribute(readLine));
                    }
                    section.setName(read);
                    read = section.read(bufferedReader);
                    addConfiguredSection(section);
                }
            } else {
                return;
            }
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public static Manifest getDefaultManifest() throws BuildException {
        InputStream inputStream;
        IOException e;
        Throwable th;
        ManifestException e2;
        Class cls;
        InputStreamReader inputStreamReader;
        InputStreamReader inputStreamReader2;
        InputStreamReader inputStreamReader3;
        Manifest manifest;
        InputStreamReader inputStreamReader4;
        InputStreamReader inputStreamReader5 = null;
        InputStreamReader inputStreamReader6 = null;
        InputStreamReader inputStreamReader7 = null;
        try {
            try {
                if (class$org$apache$tools$ant$taskdefs$Manifest == null) {
                    cls = class$("org.apache.tools.ant.taskdefs.Manifest");
                    class$org$apache$tools$ant$taskdefs$Manifest = cls;
                } else {
                    cls = class$org$apache$tools$ant$taskdefs$Manifest;
                }
                inputStream = cls.getResourceAsStream("/org/apache/tools/ant/defaultManifest.mf");
                if (inputStream == null) {
                    throw new BuildException(new StringBuffer().append("Could not find default manifest: ").append("/org/apache/tools/ant/defaultManifest.mf").toString());
                }
                try {
                    inputStreamReader4 = new InputStreamReader(inputStream, "UTF-8");
                    inputStreamReader3 = inputStreamReader4;
                    inputStreamReader2 = inputStreamReader4;
                    inputStreamReader = inputStreamReader4;
                } catch (UnsupportedEncodingException e3) {
                    inputStreamReader = null;
                }
                try {
                    try {
                        Manifest manifest2 = new Manifest(inputStreamReader4);
                        String property = System.getProperty("java.runtime.version");
                        String str = property;
                        if (property == null) {
                            str = System.getProperty("java.vm.version");
                        }
                        manifest2.getMainSection().storeAttribute(new Attribute("Created-By", new StringBuffer().append(str).append(" (").append(System.getProperty("java.vm.vendor")).append(")").toString()));
                        FileUtils.close(inputStreamReader4);
                        FileUtils.close(inputStream);
                        manifest = manifest2;
                    } catch (UnsupportedEncodingException e4) {
                        inputStreamReader = inputStreamReader4;
                        inputStreamReader3 = inputStreamReader;
                        inputStreamReader2 = inputStreamReader;
                        InputStreamReader inputStreamReader8 = new InputStreamReader(inputStream);
                        Manifest manifest3 = new Manifest(inputStreamReader8);
                        FileUtils.close(inputStreamReader8);
                        FileUtils.close(inputStream);
                        manifest = manifest3;
                        return manifest;
                    }
                    return manifest;
                } catch (IOException e5) {
                    e = e5;
                    inputStreamReader7 = inputStreamReader2;
                    InputStream inputStream2 = inputStream;
                    InputStream inputStream3 = inputStream;
                    throw new BuildException("Unable to read default manifest", e);
                } catch (ManifestException e6) {
                    e2 = e6;
                    inputStreamReader5 = inputStreamReader;
                    InputStream inputStream4 = inputStream;
                    InputStream inputStream5 = inputStream;
                    throw new BuildException("Default manifest is invalid !!", e2);
                } catch (Throwable th2) {
                    inputStreamReader6 = inputStreamReader3;
                    th = th2;
                    FileUtils.close(inputStreamReader6);
                    FileUtils.close(inputStream);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                inputStream = null;
            }
        } catch (IOException e7) {
            e = e7;
            inputStream = null;
        } catch (ManifestException e8) {
            e2 = e8;
            inputStream = null;
        }
    }

    public void addConfiguredAttribute(Attribute attribute) throws ManifestException {
        if (attribute.getKey() == null || attribute.getValue() == null) {
            throw new BuildException("Attributes must have name and value");
        }
        if (attribute.getKey().equals(ATTRIBUTE_MANIFEST_VERSION_LC)) {
            this.manifestVersion = attribute.getValue();
        } else {
            this.mainSection.addConfiguredAttribute(attribute);
        }
    }

    public void addConfiguredSection(Section section) throws ManifestException {
        String name = section.getName();
        if (name == null) {
            throw new BuildException("Sections must have a name");
        }
        this.sections.put(name, section);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0033, code lost:
        if (r0.manifestVersion == null) goto L16;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equals(Object obj) {
        boolean z = false;
        if (obj != null) {
            if (obj.getClass() != getClass()) {
                z = false;
            } else if (obj == this) {
                z = true;
            } else {
                Manifest manifest = (Manifest) obj;
                if (this.manifestVersion == null) {
                    z = false;
                } else {
                    if (!this.manifestVersion.equals(manifest.manifestVersion)) {
                        z = false;
                    }
                    z = false;
                    if (this.mainSection.equals(manifest.mainSection)) {
                        z = this.sections.equals(manifest.sections);
                    }
                }
            }
        }
        return z;
    }

    public Section getMainSection() {
        return this.mainSection;
    }

    public String getManifestVersion() {
        return this.manifestVersion;
    }

    public Section getSection(String str) {
        return (Section) this.sections.get(str);
    }

    public Enumeration getSectionNames() {
        return CollectionUtils.asEnumeration(this.sections.keySet().iterator());
    }

    public Enumeration getWarnings() {
        Vector vector = new Vector();
        Enumeration warnings = this.mainSection.getWarnings();
        while (warnings.hasMoreElements()) {
            vector.addElement(warnings.nextElement());
        }
        for (Section section : this.sections.values()) {
            Enumeration warnings2 = section.getWarnings();
            while (warnings2.hasMoreElements()) {
                vector.addElement(warnings2.nextElement());
            }
        }
        return vector.elements();
    }

    public int hashCode() {
        int i = 0;
        if (this.manifestVersion != null) {
            i = 0 + this.manifestVersion.hashCode();
        }
        return i + this.mainSection.hashCode() + this.sections.hashCode();
    }

    public void merge(Manifest manifest) throws ManifestException {
        merge(manifest, false);
    }

    public void merge(Manifest manifest, boolean z) throws ManifestException {
        merge(manifest, z, false);
    }

    public void merge(Manifest manifest, boolean z, boolean z2) throws ManifestException {
        if (manifest != null) {
            if (z) {
                this.mainSection = (Section) manifest.mainSection.clone();
            } else {
                this.mainSection.merge(manifest.mainSection, z2);
            }
            if (manifest.manifestVersion != null) {
                this.manifestVersion = manifest.manifestVersion;
            }
            Enumeration sectionNames = manifest.getSectionNames();
            while (sectionNames.hasMoreElements()) {
                String str = (String) sectionNames.nextElement();
                Section section = (Section) this.sections.get(str);
                Section section2 = (Section) manifest.sections.get(str);
                if (section != null) {
                    section.merge(section2, z2);
                } else if (section2 != null) {
                    addConfiguredSection((Section) section2.clone());
                }
            }
        }
    }

    public String toString() {
        String str;
        StringWriter stringWriter = new StringWriter();
        try {
            write(new PrintWriter(stringWriter));
            str = stringWriter.toString();
        } catch (IOException e) {
            str = null;
        }
        return str;
    }

    public void write(PrintWriter printWriter) throws IOException {
        write(printWriter, false);
    }

    public void write(PrintWriter printWriter, boolean z) throws IOException {
        printWriter.print(new StringBuffer().append("Manifest-Version: ").append(this.manifestVersion).append("\r\n").toString());
        String attributeValue = this.mainSection.getAttributeValue(ATTRIBUTE_SIGNATURE_VERSION);
        if (attributeValue != null) {
            printWriter.print(new StringBuffer().append("Signature-Version: ").append(attributeValue).append("\r\n").toString());
            this.mainSection.removeAttribute(ATTRIBUTE_SIGNATURE_VERSION);
        }
        this.mainSection.write(printWriter, z);
        if (attributeValue != null) {
            try {
                this.mainSection.addConfiguredAttribute(new Attribute(ATTRIBUTE_SIGNATURE_VERSION, attributeValue));
            } catch (ManifestException e) {
            }
        }
        for (String str : this.sections.keySet()) {
            getSection(str).write(printWriter, z);
        }
    }
}
