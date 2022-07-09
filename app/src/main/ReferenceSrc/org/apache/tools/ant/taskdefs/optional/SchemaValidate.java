package org.apache.tools.ant.taskdefs.optional;

import java.io.File;
import java.net.MalformedURLException;
import java.util.HashMap;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParserFactory;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.XmlConstants;
import org.xml.sax.SAXException;
import org.xml.sax.SAXNotRecognizedException;
import org.xml.sax.SAXNotSupportedException;
import org.xml.sax.XMLReader;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/SchemaValidate.class */
public class SchemaValidate extends XMLValidateTask {
    public static final String ERROR_DUPLICATE_SCHEMA = "Duplicate declaration of schema ";
    public static final String ERROR_NO_XSD_SUPPORT = "Parser does not support Xerces or JAXP schema features";
    public static final String ERROR_PARSER_CREATION_FAILURE = "Could not create parser";
    public static final String ERROR_SAX_1 = "SAX1 parsers are not supported";
    public static final String ERROR_TOO_MANY_DEFAULT_SCHEMAS = "Only one of defaultSchemaFile and defaultSchemaURL allowed";
    public static final String MESSAGE_ADDING_SCHEMA = "Adding schema ";
    private SchemaLocation anonymousSchema;
    private HashMap schemaLocations = new HashMap();
    private boolean fullChecking = true;
    private boolean disableDTD = false;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/SchemaValidate$SchemaLocation.class */
    public static class SchemaLocation {
        public static final String ERROR_NO_FILE = "File not found: ";
        public static final String ERROR_NO_LOCATION = "No file or URL supplied for the schema ";
        public static final String ERROR_NO_URI = "No namespace URI";
        public static final String ERROR_NO_URL_REPRESENTATION = "Cannot make a URL of ";
        public static final String ERROR_TWO_LOCATIONS = "Both URL and File were given for schema ";
        private File file;
        private String namespace;
        private String url;

        private boolean isSet(String str) {
            return (str == null || str.length() == 0) ? false : true;
        }

        public boolean equals(Object obj) {
            boolean z = true;
            if (this != obj) {
                if (!(obj instanceof SchemaLocation)) {
                    z = false;
                } else {
                    SchemaLocation schemaLocation = (SchemaLocation) obj;
                    if (this.file == null ? schemaLocation.file != null : !this.file.equals(schemaLocation.file)) {
                        z = false;
                    } else if (this.namespace == null ? schemaLocation.namespace != null : !this.namespace.equals(schemaLocation.namespace)) {
                        z = false;
                    } else if (this.url == null ? schemaLocation.url != null : !this.url.equals(schemaLocation.url)) {
                        z = false;
                    }
                }
            }
            return z;
        }

        public File getFile() {
            return this.file;
        }

        public String getNamespace() {
            return this.namespace;
        }

        public String getSchemaLocationURL() {
            boolean z = this.file != null;
            boolean isSet = isSet(this.url);
            if (z || isSet) {
                if (z && isSet) {
                    throw new BuildException(new StringBuffer().append(ERROR_TWO_LOCATIONS).append(this.namespace).toString());
                }
                String str = this.url;
                if (z) {
                    if (!this.file.exists()) {
                        throw new BuildException(new StringBuffer().append(ERROR_NO_FILE).append(this.file).toString());
                    }
                    try {
                        str = FileUtils.getFileUtils().getFileURL(this.file).toString();
                    } catch (MalformedURLException e) {
                        throw new BuildException(new StringBuffer().append(ERROR_NO_URL_REPRESENTATION).append(this.file).toString(), e);
                    }
                }
                return str;
            }
            throw new BuildException(new StringBuffer().append(ERROR_NO_LOCATION).append(this.namespace).toString());
        }

        public String getURIandLocation() throws BuildException {
            validateNamespace();
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append(this.namespace);
            stringBuffer.append(' ');
            stringBuffer.append(getSchemaLocationURL());
            return new String(stringBuffer);
        }

        public String getUrl() {
            return this.url;
        }

        public int hashCode() {
            int i = 0;
            int hashCode = this.namespace != null ? this.namespace.hashCode() : 0;
            int hashCode2 = this.file != null ? this.file.hashCode() : 0;
            if (this.url != null) {
                i = this.url.hashCode();
            }
            return (((hashCode * 29) + hashCode2) * 29) + i;
        }

        public void setFile(File file) {
            this.file = file;
        }

        public void setNamespace(String str) {
            this.namespace = str;
        }

        public void setUrl(String str) {
            this.url = str;
        }

        public String toString() {
            StringBuffer stringBuffer = new StringBuffer();
            stringBuffer.append(this.namespace != null ? this.namespace : "(anonymous)");
            stringBuffer.append(' ');
            stringBuffer.append(this.url != null ? new StringBuffer().append(this.url).append(" ").toString() : "");
            stringBuffer.append(this.file != null ? this.file.getAbsolutePath() : "");
            return stringBuffer.toString();
        }

        public void validateNamespace() {
            if (!isSet(getNamespace())) {
                throw new BuildException(ERROR_NO_URI);
            }
        }
    }

    private void setNoNamespaceSchemaProperty(String str) {
        String noNamespaceSchemaURL = getNoNamespaceSchemaURL();
        if (noNamespaceSchemaURL != null) {
            setProperty(str, noNamespaceSchemaURL);
        }
    }

    public void addConfiguredSchema(SchemaLocation schemaLocation) {
        log(new StringBuffer().append("adding schema ").append(schemaLocation).toString(), 4);
        schemaLocation.validateNamespace();
        SchemaLocation schemaLocation2 = (SchemaLocation) this.schemaLocations.get(schemaLocation.getNamespace());
        if (schemaLocation2 == null || schemaLocation2.equals(schemaLocation)) {
            this.schemaLocations.put(schemaLocation.getNamespace(), schemaLocation);
            return;
        }
        throw new BuildException(new StringBuffer().append(ERROR_DUPLICATE_SCHEMA).append(schemaLocation).toString());
    }

    protected void addSchemaLocations() {
        StringBuffer stringBuffer = new StringBuffer();
        int i = 0;
        for (SchemaLocation schemaLocation : this.schemaLocations.values()) {
            if (i > 0) {
                stringBuffer.append(' ');
            }
            String uRIandLocation = schemaLocation.getURIandLocation();
            stringBuffer.append(uRIandLocation);
            log(new StringBuffer().append(MESSAGE_ADDING_SCHEMA).append(uRIandLocation).toString(), 3);
            i++;
        }
        if (i > 0) {
            setProperty(XmlConstants.PROPERTY_SCHEMA_LOCATION, stringBuffer.toString());
        }
    }

    protected void createAnonymousSchema() {
        if (this.anonymousSchema == null) {
            this.anonymousSchema = new SchemaLocation();
        }
        this.anonymousSchema.setNamespace("(no namespace)");
    }

    @Override // org.apache.tools.ant.taskdefs.optional.XMLValidateTask
    protected XMLReader createDefaultReader() {
        SAXParserFactory newInstance = SAXParserFactory.newInstance();
        newInstance.setValidating(true);
        newInstance.setNamespaceAware(true);
        try {
            return newInstance.newSAXParser().getXMLReader();
        } catch (ParserConfigurationException e) {
            throw new BuildException(ERROR_PARSER_CREATION_FAILURE, e);
        } catch (SAXException e2) {
            throw new BuildException(ERROR_PARSER_CREATION_FAILURE, e2);
        }
    }

    public boolean enableJAXP12SchemaValidation() {
        boolean z;
        try {
            setProperty(XmlConstants.FEATURE_JAXP12_SCHEMA_LANGUAGE, XmlConstants.URI_XSD);
            setNoNamespaceSchemaProperty(XmlConstants.FEATURE_JAXP12_SCHEMA_SOURCE);
            z = true;
        } catch (BuildException e) {
            log(e.toString(), 3);
            z = false;
        }
        return z;
    }

    public boolean enableXercesSchemaValidation() {
        boolean z = true;
        try {
            setFeature(XmlConstants.FEATURE_XSD, true);
            setNoNamespaceSchemaProperty(XmlConstants.PROPERTY_NO_NAMESPACE_SCHEMA_LOCATION);
        } catch (BuildException e) {
            log(e.toString(), 3);
            z = false;
        }
        return z;
    }

    protected String getNoNamespaceSchemaURL() {
        return this.anonymousSchema == null ? null : this.anonymousSchema.getSchemaLocationURL();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.XMLValidateTask, org.apache.tools.ant.Task
    public void init() throws BuildException {
        super.init();
        setLenient(false);
    }

    @Override // org.apache.tools.ant.taskdefs.optional.XMLValidateTask
    protected void initValidator() {
        super.initValidator();
        if (isSax1Parser()) {
            throw new BuildException(ERROR_SAX_1);
        }
        setFeature(XmlConstants.FEATURE_NAMESPACES, true);
        if (!enableXercesSchemaValidation() && !enableJAXP12SchemaValidation()) {
            throw new BuildException(ERROR_NO_XSD_SUPPORT);
        }
        setFeature(XmlConstants.FEATURE_XSD_FULL_VALIDATION, this.fullChecking);
        setFeatureIfSupported(XmlConstants.FEATURE_DISALLOW_DTD, this.disableDTD);
        addSchemaLocations();
    }

    @Override // org.apache.tools.ant.taskdefs.optional.XMLValidateTask
    protected void onSuccessfulValidation(int i) {
        log(new StringBuffer().append(i).append(XMLValidateTask.MESSAGE_FILES_VALIDATED).toString(), 3);
    }

    public void setDisableDTD(boolean z) {
        this.disableDTD = z;
    }

    protected void setFeatureIfSupported(String str, boolean z) {
        try {
            getXmlReader().setFeature(str, z);
        } catch (SAXNotRecognizedException e) {
            log(new StringBuffer().append("Not recognizied: ").append(str).toString(), 3);
        } catch (SAXNotSupportedException e2) {
            log(new StringBuffer().append("Not supported: ").append(str).toString(), 3);
        }
    }

    public void setFullChecking(boolean z) {
        this.fullChecking = z;
    }

    public void setNoNamespaceFile(File file) {
        createAnonymousSchema();
        this.anonymousSchema.setFile(file);
    }

    public void setNoNamespaceURL(String str) {
        createAnonymousSchema();
        this.anonymousSchema.setUrl(str);
    }
}
