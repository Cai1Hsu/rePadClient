package org.apache.tools.ant.taskdefs.optional;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.ErrorListener;
import javax.xml.transform.Source;
import javax.xml.transform.SourceLocator;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.URIResolver;
import javax.xml.transform.sax.SAXSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.XSLTLiaison3;
import org.apache.tools.ant.taskdefs.XSLTLogger;
import org.apache.tools.ant.taskdefs.XSLTLoggerAware;
import org.apache.tools.ant.taskdefs.XSLTProcess;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.XMLCatalog;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.types.resources.URLProvider;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JAXPUtils;
import org.xml.sax.EntityResolver;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/TraXLiaison.class */
public class TraXLiaison implements XSLTLiaison3, ErrorListener, XSLTLoggerAware {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    static Class class$org$apache$tools$ant$types$resources$URLProvider;
    private EntityResolver entityResolver;
    private XSLTLogger logger;
    private Project project;
    private Resource stylesheet;
    private Templates templates;
    private long templatesModTime;
    private Transformer transformer;
    private URIResolver uriResolver;
    private String factoryName = null;
    private TransformerFactory tfactory = null;
    private Vector outputProperties = new Vector();
    private Hashtable params = new Hashtable();
    private Vector attributes = new Vector();
    private boolean suppressWarnings = false;
    private XSLTProcess.TraceConfiguration traceConfiguration = null;

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private void createTransformer() throws Exception {
        if (this.templates == null) {
            readTemplates();
        }
        this.transformer = this.templates.newTransformer();
        this.transformer.setErrorListener(this);
        if (this.uriResolver != null) {
            this.transformer.setURIResolver(this.uriResolver);
        }
        int size = this.outputProperties.size();
        for (int i = 0; i < size; i++) {
            String[] strArr = (String[]) this.outputProperties.elementAt(i);
            this.transformer.setOutputProperty(strArr[0], strArr[1]);
        }
        if (this.traceConfiguration != null) {
            if (!"org.apache.xalan.transformer.TransformerImpl".equals(this.transformer.getClass().getName())) {
                String stringBuffer = new StringBuffer().append("Not enabling trace support for transformer implementation").append(this.transformer.getClass().getName()).toString();
                if (this.project != null) {
                    this.project.log(stringBuffer, 1);
                    return;
                } else {
                    System.err.println(stringBuffer);
                    return;
                }
            }
            try {
                ((XSLTTraceSupport) Class.forName("org.apache.tools.ant.taskdefs.optional.Xalan2TraceSupport", true, Thread.currentThread().getContextClassLoader()).newInstance()).configureTrace(this.transformer, this.traceConfiguration);
            } catch (Exception e) {
                String stringBuffer2 = new StringBuffer().append("Failed to enable tracing because of ").append(e).toString();
                if (this.project != null) {
                    this.project.log(stringBuffer2, 1);
                } else {
                    System.err.println(stringBuffer2);
                }
            }
        }
    }

    private TransformerFactory getFactory() throws BuildException {
        TransformerFactory transformerFactory;
        if (this.tfactory != null) {
            transformerFactory = this.tfactory;
        } else {
            if (this.factoryName == null) {
                this.tfactory = TransformerFactory.newInstance();
            } else {
                Class<?> cls = null;
                try {
                    try {
                        cls = Class.forName(this.factoryName, true, Thread.currentThread().getContextClassLoader());
                    } catch (ClassNotFoundException e) {
                        String stringBuffer = new StringBuffer().append("Failed to load ").append(this.factoryName).append(" via the configured classpath, will try").append(" Ant's classpath instead.").toString();
                        if (this.logger != null) {
                            this.logger.log(stringBuffer);
                        } else if (this.project != null) {
                            this.project.log(stringBuffer, 1);
                        } else {
                            System.err.println(stringBuffer);
                        }
                    }
                    Class<?> cls2 = cls;
                    if (cls == null) {
                        cls2 = Class.forName(this.factoryName);
                    }
                    this.tfactory = (TransformerFactory) cls2.newInstance();
                } catch (Exception e2) {
                    throw new BuildException(e2);
                }
            }
            try {
                Field declaredField = this.tfactory.getClass().getDeclaredField("_isNotSecureProcessing");
                declaredField.setAccessible(true);
                declaredField.set(this.tfactory, Boolean.TRUE);
            } catch (Exception e3) {
                if (this.project != null) {
                    this.project.log(e3.toString(), 4);
                }
            }
            this.tfactory.setErrorListener(this);
            int size = this.attributes.size();
            for (int i = 0; i < size; i++) {
                Object[] objArr = (Object[]) this.attributes.elementAt(i);
                this.tfactory.setAttribute((String) objArr[0], objArr[1]);
            }
            if (this.uriResolver != null) {
                this.tfactory.setURIResolver(this.uriResolver);
            }
            transformerFactory = this.tfactory;
        }
        return transformerFactory;
    }

    private Source getSource(InputStream inputStream, File file) throws ParserConfigurationException, SAXException {
        Source streamSource;
        if (this.entityResolver == null) {
            streamSource = new StreamSource(inputStream);
        } else if (!getFactory().getFeature("http://javax.xml.transform.sax.SAXSource/feature")) {
            throw new IllegalStateException("xcatalog specified, but parser doesn't support SAX");
        } else {
            SAXParserFactory newInstance = SAXParserFactory.newInstance();
            newInstance.setNamespaceAware(true);
            XMLReader xMLReader = newInstance.newSAXParser().getXMLReader();
            xMLReader.setEntityResolver(this.entityResolver);
            streamSource = new SAXSource(xMLReader, new InputSource(inputStream));
        }
        streamSource.setSystemId(JAXPUtils.getSystemId(file));
        return streamSource;
    }

    private Source getSource(InputStream inputStream, Resource resource) throws ParserConfigurationException, SAXException {
        Source streamSource;
        if (this.entityResolver == null) {
            streamSource = new StreamSource(inputStream);
        } else if (!getFactory().getFeature("http://javax.xml.transform.sax.SAXSource/feature")) {
            throw new IllegalStateException("xcatalog specified, but parser doesn't support SAX");
        } else {
            SAXParserFactory newInstance = SAXParserFactory.newInstance();
            newInstance.setNamespaceAware(true);
            XMLReader xMLReader = newInstance.newSAXParser().getXMLReader();
            xMLReader.setEntityResolver(this.entityResolver);
            streamSource = new SAXSource(xMLReader, new InputSource(inputStream));
        }
        streamSource.setSystemId(resourceToURI(resource));
        return streamSource;
    }

    private void logError(TransformerException transformerException, String str) {
        if (this.logger == null) {
            return;
        }
        StringBuffer stringBuffer = new StringBuffer();
        SourceLocator locator = transformerException.getLocator();
        if (locator != null) {
            String systemId = locator.getSystemId();
            if (systemId != null) {
                String str2 = systemId;
                if (systemId.startsWith("file:")) {
                    str2 = FileUtils.getFileUtils().fromURI(systemId);
                }
                stringBuffer.append(str2);
            } else {
                stringBuffer.append("Unknown file");
            }
            int lineNumber = locator.getLineNumber();
            if (lineNumber != -1) {
                stringBuffer.append(":");
                stringBuffer.append(lineNumber);
                int columnNumber = locator.getColumnNumber();
                if (columnNumber != -1) {
                    stringBuffer.append(":");
                    stringBuffer.append(columnNumber);
                }
            }
        }
        stringBuffer.append(": ");
        stringBuffer.append(str);
        stringBuffer.append("! ");
        stringBuffer.append(transformerException.getMessage());
        if (transformerException.getCause() != null) {
            stringBuffer.append(" Cause: ");
            stringBuffer.append(transformerException.getCause());
        }
        this.logger.log(stringBuffer.toString());
    }

    private void readTemplates() throws IOException, TransformerConfigurationException, ParserConfigurationException, SAXException {
        Throwable th;
        BufferedInputStream bufferedInputStream = null;
        try {
            BufferedInputStream bufferedInputStream2 = new BufferedInputStream(this.stylesheet.getInputStream());
            try {
                this.templatesModTime = this.stylesheet.getLastModified();
                this.templates = getFactory().newTemplates(getSource(bufferedInputStream2, this.stylesheet));
                if (bufferedInputStream2 == null) {
                    return;
                }
                bufferedInputStream2.close();
            } catch (Throwable th2) {
                th = th2;
                bufferedInputStream = bufferedInputStream2;
                if (bufferedInputStream != null) {
                    bufferedInputStream.close();
                }
                throw th;
            }
        } catch (Throwable th3) {
            th = th3;
        }
    }

    private String resourceToURI(Resource resource) {
        Class cls;
        Class cls2;
        String valueOf;
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        FileProvider fileProvider = (FileProvider) resource.as(cls);
        if (fileProvider != null) {
            valueOf = FILE_UTILS.toURI(fileProvider.getFile().getAbsolutePath());
        } else {
            if (class$org$apache$tools$ant$types$resources$URLProvider == null) {
                cls2 = class$("org.apache.tools.ant.types.resources.URLProvider");
                class$org$apache$tools$ant$types$resources$URLProvider = cls2;
            } else {
                cls2 = class$org$apache$tools$ant$types$resources$URLProvider;
            }
            URLProvider uRLProvider = (URLProvider) resource.as(cls2);
            valueOf = uRLProvider != null ? String.valueOf(uRLProvider.getURL()) : resource.getName();
        }
        return valueOf;
    }

    private void setTransformationParameters() {
        Enumeration keys = this.params.keys();
        while (keys.hasMoreElements()) {
            String str = (String) keys.nextElement();
            this.transformer.setParameter(str, (String) this.params.get(str));
        }
    }

    @Override // org.apache.tools.ant.taskdefs.XSLTLiaison
    public void addParam(String str, String str2) {
        this.params.put(str, str2);
    }

    @Override // org.apache.tools.ant.taskdefs.XSLTLiaison2
    public void configure(XSLTProcess xSLTProcess) {
        this.project = xSLTProcess.getProject();
        XSLTProcess.Factory factory = xSLTProcess.getFactory();
        if (factory != null) {
            setFactory(factory.getName());
            Enumeration attributes = factory.getAttributes();
            while (attributes.hasMoreElements()) {
                XSLTProcess.Factory.Attribute attribute = (XSLTProcess.Factory.Attribute) attributes.nextElement();
                setAttribute(attribute.getName(), attribute.getValue());
            }
        }
        XMLCatalog xMLCatalog = xSLTProcess.getXMLCatalog();
        if (xMLCatalog != null) {
            setEntityResolver(xMLCatalog);
            setURIResolver(xMLCatalog);
        }
        Enumeration outputProperties = xSLTProcess.getOutputProperties();
        while (outputProperties.hasMoreElements()) {
            XSLTProcess.OutputProperty outputProperty = (XSLTProcess.OutputProperty) outputProperties.nextElement();
            setOutputProperty(outputProperty.getName(), outputProperty.getValue());
        }
        this.suppressWarnings = xSLTProcess.getSuppressWarnings();
        this.traceConfiguration = xSLTProcess.getTraceConfiguration();
    }

    @Override // javax.xml.transform.ErrorListener
    public void error(TransformerException transformerException) {
        logError(transformerException, "Error");
    }

    @Override // javax.xml.transform.ErrorListener
    public void fatalError(TransformerException transformerException) {
        logError(transformerException, "Fatal Error");
        throw new BuildException("Fatal error during transformation", transformerException);
    }

    protected String getSystemId(File file) {
        return JAXPUtils.getSystemId(file);
    }

    public void setAttribute(String str, Object obj) {
        this.attributes.addElement(new Object[]{str, obj});
    }

    public void setEntityResolver(EntityResolver entityResolver) {
        this.entityResolver = entityResolver;
    }

    public void setFactory(String str) {
        this.factoryName = str;
    }

    @Override // org.apache.tools.ant.taskdefs.XSLTLoggerAware
    public void setLogger(XSLTLogger xSLTLogger) {
        this.logger = xSLTLogger;
    }

    public void setOutputProperty(String str, String str2) {
        this.outputProperties.addElement(new String[]{str, str2});
    }

    @Override // org.apache.tools.ant.taskdefs.XSLTLiaison
    public void setStylesheet(File file) throws Exception {
        FileResource fileResource = new FileResource();
        fileResource.setProject(this.project);
        fileResource.setFile(file);
        setStylesheet(fileResource);
    }

    @Override // org.apache.tools.ant.taskdefs.XSLTLiaison3
    public void setStylesheet(Resource resource) throws Exception {
        if (this.stylesheet != null) {
            this.transformer = null;
            if (!this.stylesheet.equals(resource) || resource.getLastModified() != this.templatesModTime) {
                this.templates = null;
            }
        }
        this.stylesheet = resource;
    }

    public void setURIResolver(URIResolver uRIResolver) {
        this.uriResolver = uRIResolver;
    }

    @Override // org.apache.tools.ant.taskdefs.XSLTLiaison
    public void transform(File file, File file2) throws Exception {
        BufferedOutputStream bufferedOutputStream;
        Throwable th;
        BufferedInputStream bufferedInputStream;
        BufferedInputStream bufferedInputStream2;
        BufferedOutputStream bufferedOutputStream2;
        if (this.transformer == null) {
            createTransformer();
        }
        try {
            bufferedInputStream2 = new BufferedInputStream(new FileInputStream(file));
            try {
                bufferedOutputStream2 = new BufferedOutputStream(new FileOutputStream(file2));
            } catch (Throwable th2) {
                th = th2;
                bufferedInputStream = bufferedInputStream2;
                bufferedOutputStream = null;
            }
        } catch (Throwable th3) {
            th = th3;
            bufferedOutputStream = null;
            bufferedInputStream = null;
        }
        try {
            StreamResult streamResult = new StreamResult(bufferedOutputStream2);
            streamResult.setSystemId(JAXPUtils.getSystemId(file2));
            Source source = getSource(bufferedInputStream2, file);
            setTransformationParameters();
            this.transformer.transform(source, streamResult);
            FileUtils.close(bufferedInputStream2);
            FileUtils.close(bufferedOutputStream2);
        } catch (Throwable th4) {
            th = th4;
            bufferedInputStream = bufferedInputStream2;
            bufferedOutputStream = bufferedOutputStream2;
            FileUtils.close(bufferedInputStream);
            FileUtils.close(bufferedOutputStream);
            throw th;
        }
    }

    @Override // javax.xml.transform.ErrorListener
    public void warning(TransformerException transformerException) {
        if (!this.suppressWarnings) {
            logError(transformerException, "Warning");
        }
    }
}
