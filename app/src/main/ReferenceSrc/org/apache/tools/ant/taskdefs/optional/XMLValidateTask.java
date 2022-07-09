package org.apache.tools.ant.taskdefs.optional;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Vector;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.DTDLocation;
import org.apache.tools.ant.types.FileSet;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Reference;
import org.apache.tools.ant.types.XMLCatalog;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JAXPUtils;
import org.apache.tools.ant.util.XmlConstants;
import org.xml.sax.EntityResolver;
import org.xml.sax.ErrorHandler;
import org.xml.sax.InputSource;
import org.xml.sax.Parser;
import org.xml.sax.SAXException;
import org.xml.sax.SAXNotRecognizedException;
import org.xml.sax.SAXNotSupportedException;
import org.xml.sax.SAXParseException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.ParserAdapter;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/XMLValidateTask.class */
public class XMLValidateTask extends Task {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    protected static final String INIT_FAILED_MSG = "Could not start xml validation: ";
    public static final String MESSAGE_FILES_VALIDATED = " file(s) have been successfully validated.";
    protected Path classpath;
    protected boolean failOnError = true;
    protected boolean warn = true;
    protected boolean lenient = false;
    protected String readerClassName = null;
    protected File file = null;
    protected Vector filesets = new Vector();
    protected XMLReader xmlReader = null;
    protected ValidatorErrorHandler errorHandler = new ValidatorErrorHandler(this);
    private Vector attributeList = new Vector();
    private final Vector propertyList = new Vector();
    private XMLCatalog xmlCatalog = new XMLCatalog();
    private AntClassLoader readerLoader = null;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/XMLValidateTask$Attribute.class */
    public static class Attribute {
        private String attributeName = null;
        private boolean attributeValue;

        public String getName() {
            return this.attributeName;
        }

        public boolean getValue() {
            return this.attributeValue;
        }

        public void setName(String str) {
            this.attributeName = str;
        }

        public void setValue(boolean z) {
            this.attributeValue = z;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property.class */
    public static final class Property {
        private String name;
        private String value;

        public String getName() {
            return this.name;
        }

        public String getValue() {
            return this.value;
        }

        public void setName(String str) {
            this.name = str;
        }

        public void setValue(String str) {
            this.value = str;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/XMLValidateTask$ValidatorErrorHandler.class */
    protected class ValidatorErrorHandler implements ErrorHandler {
        private final XMLValidateTask this$0;
        protected File currentFile = null;
        protected String lastErrorMessage = null;
        protected boolean failed = false;

        protected ValidatorErrorHandler(XMLValidateTask xMLValidateTask) {
            this.this$0 = xMLValidateTask;
        }

        private void doLog(SAXParseException sAXParseException, int i) {
            this.this$0.log(getMessage(sAXParseException), i);
        }

        private String getMessage(SAXParseException sAXParseException) {
            String message;
            String stringBuffer;
            String systemId = sAXParseException.getSystemId();
            if (systemId != null) {
                String str = systemId;
                if (systemId.startsWith("file:")) {
                    try {
                        str = XMLValidateTask.FILE_UTILS.fromURI(systemId);
                    } catch (Exception e) {
                        str = systemId;
                    }
                }
                int lineNumber = sAXParseException.getLineNumber();
                int columnNumber = sAXParseException.getColumnNumber();
                StringBuffer append = new StringBuffer().append(str);
                if (lineNumber == -1) {
                    stringBuffer = "";
                } else {
                    stringBuffer = new StringBuffer().append(":").append(lineNumber).append(columnNumber == -1 ? "" : new StringBuffer().append(":").append(columnNumber).toString()).toString();
                }
                message = append.append(stringBuffer).append(": ").append(sAXParseException.getMessage()).toString();
            } else {
                message = sAXParseException.getMessage();
            }
            return message;
        }

        @Override // org.xml.sax.ErrorHandler
        public void error(SAXParseException sAXParseException) {
            this.failed = true;
            doLog(sAXParseException, 0);
        }

        @Override // org.xml.sax.ErrorHandler
        public void fatalError(SAXParseException sAXParseException) {
            this.failed = true;
            doLog(sAXParseException, 0);
        }

        public boolean getFailure() {
            return this.failed;
        }

        public void init(File file) {
            this.currentFile = file;
            this.failed = false;
        }

        @Override // org.xml.sax.ErrorHandler
        public void warning(SAXParseException sAXParseException) {
            if (this.this$0.warn) {
                doLog(sAXParseException, 1);
            }
        }
    }

    private Object createDefaultReaderOrParser() {
        Object parser;
        try {
            parser = createDefaultReader();
        } catch (BuildException e) {
            parser = JAXPUtils.getParser();
        }
        return parser;
    }

    public void addConfiguredXMLCatalog(XMLCatalog xMLCatalog) {
        this.xmlCatalog.addConfiguredXMLCatalog(xMLCatalog);
    }

    public void addFileset(FileSet fileSet) {
        this.filesets.addElement(fileSet);
    }

    protected void cleanup() {
        if (this.readerLoader != null) {
            this.readerLoader.cleanup();
            this.readerLoader = null;
        }
    }

    public Attribute createAttribute() {
        Attribute attribute = new Attribute();
        this.attributeList.addElement(attribute);
        return attribute;
    }

    public Path createClasspath() {
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        return this.classpath.createPath();
    }

    public DTDLocation createDTD() {
        DTDLocation dTDLocation = new DTDLocation();
        this.xmlCatalog.addDTD(dTDLocation);
        return dTDLocation;
    }

    protected XMLReader createDefaultReader() {
        return JAXPUtils.getXMLReader();
    }

    public Property createProperty() {
        Property property = new Property();
        this.propertyList.addElement(property);
        return property;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v26, types: [org.xml.sax.XMLReader] */
    protected XMLReader createXmlReader() {
        Class<?> cls;
        Object newInstance;
        ParserAdapter parserAdapter;
        if (this.readerClassName == null) {
            newInstance = createDefaultReaderOrParser();
        } else {
            try {
                if (this.classpath != null) {
                    this.readerLoader = getProject().createClassLoader(this.classpath);
                    cls = Class.forName(this.readerClassName, true, this.readerLoader);
                } else {
                    cls = Class.forName(this.readerClassName);
                }
                newInstance = cls.newInstance();
            } catch (ClassNotFoundException e) {
                throw new BuildException(new StringBuffer().append(INIT_FAILED_MSG).append(this.readerClassName).toString(), e);
            } catch (IllegalAccessException e2) {
                throw new BuildException(new StringBuffer().append(INIT_FAILED_MSG).append(this.readerClassName).toString(), e2);
            } catch (InstantiationException e3) {
                throw new BuildException(new StringBuffer().append(INIT_FAILED_MSG).append(this.readerClassName).toString(), e3);
            }
        }
        if (newInstance instanceof XMLReader) {
            log(new StringBuffer().append("Using SAX2 reader ").append(newInstance.getClass().getName()).toString(), 3);
            parserAdapter = (XMLReader) newInstance;
        } else if (!(newInstance instanceof Parser)) {
            throw new BuildException(new StringBuffer().append(INIT_FAILED_MSG).append(newInstance.getClass().getName()).append(" implements nor SAX1 Parser nor SAX2 XMLReader.").toString());
        } else {
            ParserAdapter parserAdapter2 = new ParserAdapter((Parser) newInstance);
            log(new StringBuffer().append("Using SAX1 parser ").append(newInstance.getClass().getName()).toString(), 3);
            parserAdapter = parserAdapter2;
        }
        return parserAdapter;
    }

    protected boolean doValidate(File file) {
        initValidator();
        boolean z = true;
        try {
            log(new StringBuffer().append("Validating ").append(file.getName()).append("... ").toString(), 3);
            this.errorHandler.init(file);
            InputSource inputSource = new InputSource(new FileInputStream(file));
            inputSource.setSystemId(FILE_UTILS.toURI(file.getAbsolutePath()));
            this.xmlReader.parse(inputSource);
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Could not validate document ").append(file).toString(), e);
        } catch (SAXException e2) {
            log(new StringBuffer().append("Caught when validating: ").append(e2.toString()).toString(), 4);
            if (this.failOnError) {
                throw new BuildException(new StringBuffer().append("Could not validate document ").append(file).toString());
            }
            log(new StringBuffer().append("Could not validate document ").append(file).append(": ").append(e2.toString()).toString());
            z = false;
        }
        if (this.errorHandler.getFailure()) {
            if (this.failOnError) {
                throw new BuildException(new StringBuffer().append(file).append(" is not a valid XML document.").toString());
            }
            z = false;
            log(new StringBuffer().append(file).append(" is not a valid XML document").toString(), 0);
        }
        return z;
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        try {
            if (this.file == null && this.filesets.size() == 0) {
                throw new BuildException("Specify at least one source - a file or a fileset.");
            }
            int i = 0;
            if (this.file != null) {
                if (!this.file.exists() || !this.file.canRead() || !this.file.isFile()) {
                    String stringBuffer = new StringBuffer().append("File ").append(this.file).append(" cannot be read").toString();
                    if (this.failOnError) {
                        throw new BuildException(stringBuffer);
                    }
                    log(stringBuffer, 0);
                    i = 0;
                } else {
                    doValidate(this.file);
                    i = 0 + 1;
                }
            }
            int size = this.filesets.size();
            for (int i2 = 0; i2 < size; i2++) {
                FileSet fileSet = (FileSet) this.filesets.elementAt(i2);
                for (String str : fileSet.getDirectoryScanner(getProject()).getIncludedFiles()) {
                    doValidate(new File(fileSet.getDir(getProject()), str));
                    i++;
                }
            }
            onSuccessfulValidation(i);
        } finally {
            cleanup();
        }
    }

    protected EntityResolver getEntityResolver() {
        return this.xmlCatalog;
    }

    protected XMLReader getXmlReader() {
        return this.xmlReader;
    }

    @Override // org.apache.tools.ant.Task
    public void init() throws BuildException {
        super.init();
        this.xmlCatalog.setProject(getProject());
    }

    protected void initValidator() {
        this.xmlReader = createXmlReader();
        this.xmlReader.setEntityResolver(getEntityResolver());
        this.xmlReader.setErrorHandler(this.errorHandler);
        if (!isSax1Parser()) {
            if (!this.lenient) {
                setFeature(XmlConstants.FEATURE_VALIDATION, true);
            }
            int size = this.attributeList.size();
            for (int i = 0; i < size; i++) {
                Attribute attribute = (Attribute) this.attributeList.elementAt(i);
                setFeature(attribute.getName(), attribute.getValue());
            }
            int size2 = this.propertyList.size();
            for (int i2 = 0; i2 < size2; i2++) {
                Property property = (Property) this.propertyList.elementAt(i2);
                setProperty(property.getName(), property.getValue());
            }
        }
    }

    protected boolean isSax1Parser() {
        return this.xmlReader instanceof ParserAdapter;
    }

    protected void onSuccessfulValidation(int i) {
        log(new StringBuffer().append(i).append(MESSAGE_FILES_VALIDATED).toString());
    }

    public void setClassName(String str) {
        this.readerClassName = str;
    }

    public void setClasspath(Path path) {
        if (this.classpath == null) {
            this.classpath = path;
        } else {
            this.classpath.append(path);
        }
    }

    public void setClasspathRef(Reference reference) {
        createClasspath().setRefid(reference);
    }

    public void setFailOnError(boolean z) {
        this.failOnError = z;
    }

    protected void setFeature(String str, boolean z) throws BuildException {
        log(new StringBuffer().append("Setting feature ").append(str).append("=").append(z).toString(), 4);
        try {
            this.xmlReader.setFeature(str, z);
        } catch (SAXNotRecognizedException e) {
            throw new BuildException(new StringBuffer().append("Parser ").append(this.xmlReader.getClass().getName()).append(" doesn't recognize feature ").append(str).toString(), e, getLocation());
        } catch (SAXNotSupportedException e2) {
            throw new BuildException(new StringBuffer().append("Parser ").append(this.xmlReader.getClass().getName()).append(" doesn't support feature ").append(str).toString(), e2, getLocation());
        }
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setLenient(boolean z) {
        this.lenient = z;
    }

    protected void setProperty(String str, String str2) throws BuildException {
        if (str == null || str2 == null) {
            throw new BuildException("Property name and value must be specified.");
        }
        try {
            this.xmlReader.setProperty(str, str2);
        } catch (SAXNotRecognizedException e) {
            throw new BuildException(new StringBuffer().append("Parser ").append(this.xmlReader.getClass().getName()).append(" doesn't recognize property ").append(str).toString(), e, getLocation());
        } catch (SAXNotSupportedException e2) {
            throw new BuildException(new StringBuffer().append("Parser ").append(this.xmlReader.getClass().getName()).append(" doesn't support property ").append(str).toString(), e2, getLocation());
        }
    }

    public void setWarn(boolean z) {
        this.warn = z;
    }
}
