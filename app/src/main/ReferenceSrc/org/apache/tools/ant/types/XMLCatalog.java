package org.apache.tools.ant.types;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Enumeration;
import java.util.Stack;
import java.util.Vector;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.transform.Source;
import javax.xml.transform.TransformerException;
import javax.xml.transform.URIResolver;
import javax.xml.transform.sax.SAXSource;
import org.apache.tools.ant.AntClassLoader;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Definer;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JAXPUtils;
import org.xml.sax.EntityResolver;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

/* loaded from: classes.jar:org/apache/tools/ant/types/XMLCatalog.class */
public class XMLCatalog extends DataType implements Cloneable, EntityResolver, URIResolver {
    public static final String APACHE_RESOLVER = "org.apache.tools.ant.types.resolver.ApacheCatalogResolver";
    public static final String CATALOG_RESOLVER = "org.apache.xml.resolver.tools.CatalogResolver";
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    static Class class$java$lang$String;
    static Class class$org$apache$tools$ant$types$XMLCatalog;
    private Path catalogPath;
    private Path classpath;
    private Vector elements = new Vector();
    private CatalogResolver catalogResolver = null;

    /* loaded from: classes.jar:org/apache/tools/ant/types/XMLCatalog$CatalogResolver.class */
    private interface CatalogResolver extends URIResolver, EntityResolver {
        @Override // javax.xml.transform.URIResolver
        Source resolve(String str, String str2) throws TransformerException;

        @Override // org.xml.sax.EntityResolver
        InputSource resolveEntity(String str, String str2);
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/XMLCatalog$ExternalResolver.class */
    private class ExternalResolver implements CatalogResolver {
        private boolean externalCatalogsProcessed = false;
        private Method parseCatalog;
        private Method resolve;
        private Method resolveEntity;
        private Object resolverImpl;
        private Method setXMLCatalog;
        private final XMLCatalog this$0;

        public ExternalResolver(XMLCatalog xMLCatalog, Class cls, Object obj) {
            Class<?> cls2;
            Class<?> cls3;
            Class<?> cls4;
            Class<?> cls5;
            Class<?> cls6;
            Class<?> cls7;
            this.this$0 = xMLCatalog;
            this.setXMLCatalog = null;
            this.parseCatalog = null;
            this.resolveEntity = null;
            this.resolve = null;
            this.resolverImpl = null;
            this.resolverImpl = obj;
            try {
                if (XMLCatalog.class$org$apache$tools$ant$types$XMLCatalog == null) {
                    cls2 = XMLCatalog.class$("org.apache.tools.ant.types.XMLCatalog");
                    XMLCatalog.class$org$apache$tools$ant$types$XMLCatalog = cls2;
                } else {
                    cls2 = XMLCatalog.class$org$apache$tools$ant$types$XMLCatalog;
                }
                this.setXMLCatalog = cls.getMethod("setXMLCatalog", cls2);
                if (XMLCatalog.class$java$lang$String == null) {
                    cls3 = XMLCatalog.class$("java.lang.String");
                    XMLCatalog.class$java$lang$String = cls3;
                } else {
                    cls3 = XMLCatalog.class$java$lang$String;
                }
                this.parseCatalog = cls.getMethod("parseCatalog", cls3);
                if (XMLCatalog.class$java$lang$String == null) {
                    cls4 = XMLCatalog.class$("java.lang.String");
                    XMLCatalog.class$java$lang$String = cls4;
                } else {
                    cls4 = XMLCatalog.class$java$lang$String;
                }
                if (XMLCatalog.class$java$lang$String == null) {
                    cls5 = XMLCatalog.class$("java.lang.String");
                    XMLCatalog.class$java$lang$String = cls5;
                } else {
                    cls5 = XMLCatalog.class$java$lang$String;
                }
                this.resolveEntity = cls.getMethod("resolveEntity", cls4, cls5);
                if (XMLCatalog.class$java$lang$String == null) {
                    cls6 = XMLCatalog.class$("java.lang.String");
                    XMLCatalog.class$java$lang$String = cls6;
                } else {
                    cls6 = XMLCatalog.class$java$lang$String;
                }
                if (XMLCatalog.class$java$lang$String == null) {
                    cls7 = XMLCatalog.class$("java.lang.String");
                    XMLCatalog.class$java$lang$String = cls7;
                } else {
                    cls7 = XMLCatalog.class$java$lang$String;
                }
                this.resolve = cls.getMethod("resolve", cls6, cls7);
                xMLCatalog.log("Apache resolver library found, xml-commons resolver will be used", 3);
            } catch (NoSuchMethodException e) {
                throw new BuildException(e);
            }
        }

        private void processExternalCatalogs() {
            if (!this.externalCatalogsProcessed) {
                try {
                    this.setXMLCatalog.invoke(this.resolverImpl, this.this$0);
                    if (this.this$0.getCatalogPath() != null) {
                        this.this$0.log(new StringBuffer().append("Using catalogpath '").append(this.this$0.getCatalogPath()).append("'").toString(), 4);
                        for (String str : this.this$0.getCatalogPath().list()) {
                            File file = new File(str);
                            this.this$0.log(new StringBuffer().append("Parsing ").append(file).toString(), 4);
                            try {
                                this.parseCatalog.invoke(this.resolverImpl, file.getPath());
                            } catch (Exception e) {
                                throw new BuildException(e);
                            }
                        }
                    }
                } catch (Exception e2) {
                    throw new BuildException(e2);
                }
            }
            this.externalCatalogsProcessed = true;
        }

        @Override // org.apache.tools.ant.types.XMLCatalog.CatalogResolver, javax.xml.transform.URIResolver
        public Source resolve(String str, String str2) throws TransformerException {
            SAXSource sAXSource;
            processExternalCatalogs();
            ResourceLocation findMatchingEntry = this.this$0.findMatchingEntry(str);
            if (findMatchingEntry != null) {
                this.this$0.log(new StringBuffer().append("Matching catalog entry found for uri: '").append(findMatchingEntry.getPublicId()).append("' location: '").append(findMatchingEntry.getLocation()).append("'").toString(), 4);
                ResourceLocation resourceLocation = findMatchingEntry;
                if (str2 != null) {
                    try {
                        URL url = new URL(str2);
                        resourceLocation = new ResourceLocation();
                        try {
                            resourceLocation.setBase(url);
                        } catch (MalformedURLException e) {
                        }
                    } catch (MalformedURLException e2) {
                        resourceLocation = findMatchingEntry;
                    }
                }
                resourceLocation.setPublicId(findMatchingEntry.getPublicId());
                resourceLocation.setLocation(findMatchingEntry.getLocation());
                InputSource filesystemLookup = this.this$0.filesystemLookup(resourceLocation);
                InputSource inputSource = filesystemLookup;
                if (filesystemLookup == null) {
                    inputSource = this.this$0.classpathLookup(resourceLocation);
                }
                if (inputSource != null) {
                    sAXSource = new SAXSource(inputSource);
                } else {
                    try {
                        sAXSource = (SAXSource) this.resolve.invoke(this.resolverImpl, str, str2);
                    } catch (Exception e3) {
                        throw new BuildException(e3);
                    }
                }
            } else {
                try {
                    sAXSource = (SAXSource) this.resolve.invoke(this.resolverImpl, str, str2);
                } catch (Exception e4) {
                    throw new BuildException(e4);
                }
            }
            return sAXSource;
        }

        @Override // org.apache.tools.ant.types.XMLCatalog.CatalogResolver, org.xml.sax.EntityResolver
        public InputSource resolveEntity(String str, String str2) {
            InputSource inputSource;
            processExternalCatalogs();
            ResourceLocation findMatchingEntry = this.this$0.findMatchingEntry(str);
            if (findMatchingEntry != null) {
                this.this$0.log(new StringBuffer().append("Matching catalog entry found for publicId: '").append(findMatchingEntry.getPublicId()).append("' location: '").append(findMatchingEntry.getLocation()).append("'").toString(), 4);
                InputSource filesystemLookup = this.this$0.filesystemLookup(findMatchingEntry);
                InputSource inputSource2 = filesystemLookup;
                if (filesystemLookup == null) {
                    inputSource2 = this.this$0.classpathLookup(findMatchingEntry);
                }
                inputSource = inputSource2;
                if (inputSource2 == null) {
                    try {
                        inputSource = (InputSource) this.resolveEntity.invoke(this.resolverImpl, str, str2);
                    } catch (Exception e) {
                        throw new BuildException(e);
                    }
                }
            } else {
                try {
                    inputSource = (InputSource) this.resolveEntity.invoke(this.resolverImpl, str, str2);
                } catch (Exception e2) {
                    throw new BuildException(e2);
                }
            }
            return inputSource;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/types/XMLCatalog$InternalResolver.class */
    private class InternalResolver implements CatalogResolver {
        private final XMLCatalog this$0;

        public InternalResolver(XMLCatalog xMLCatalog) {
            this.this$0 = xMLCatalog;
            xMLCatalog.log("Apache resolver library not found, internal resolver will be used", 3);
        }

        @Override // org.apache.tools.ant.types.XMLCatalog.CatalogResolver, javax.xml.transform.URIResolver
        public Source resolve(String str, String str2) throws TransformerException {
            ResourceLocation findMatchingEntry = this.this$0.findMatchingEntry(str);
            SAXSource sAXSource = null;
            if (findMatchingEntry != null) {
                this.this$0.log(new StringBuffer().append("Matching catalog entry found for uri: '").append(findMatchingEntry.getPublicId()).append("' location: '").append(findMatchingEntry.getLocation()).append("'").toString(), 4);
                ResourceLocation resourceLocation = findMatchingEntry;
                if (str2 != null) {
                    try {
                        URL url = new URL(str2);
                        resourceLocation = new ResourceLocation();
                        try {
                            resourceLocation.setBase(url);
                        } catch (MalformedURLException e) {
                        }
                    } catch (MalformedURLException e2) {
                        resourceLocation = findMatchingEntry;
                    }
                }
                resourceLocation.setPublicId(findMatchingEntry.getPublicId());
                resourceLocation.setLocation(findMatchingEntry.getLocation());
                InputSource filesystemLookup = this.this$0.filesystemLookup(resourceLocation);
                InputSource inputSource = filesystemLookup;
                if (filesystemLookup == null) {
                    inputSource = this.this$0.classpathLookup(resourceLocation);
                }
                InputSource inputSource2 = inputSource;
                if (inputSource == null) {
                    inputSource2 = this.this$0.urlLookup(resourceLocation);
                }
                sAXSource = null;
                if (inputSource2 != null) {
                    sAXSource = new SAXSource(inputSource2);
                }
            }
            return sAXSource;
        }

        @Override // org.apache.tools.ant.types.XMLCatalog.CatalogResolver, org.xml.sax.EntityResolver
        public InputSource resolveEntity(String str, String str2) {
            InputSource inputSource = null;
            ResourceLocation findMatchingEntry = this.this$0.findMatchingEntry(str);
            if (findMatchingEntry != null) {
                this.this$0.log(new StringBuffer().append("Matching catalog entry found for publicId: '").append(findMatchingEntry.getPublicId()).append("' location: '").append(findMatchingEntry.getLocation()).append("'").toString(), 4);
                InputSource filesystemLookup = this.this$0.filesystemLookup(findMatchingEntry);
                InputSource inputSource2 = filesystemLookup;
                if (filesystemLookup == null) {
                    inputSource2 = this.this$0.classpathLookup(findMatchingEntry);
                }
                inputSource = inputSource2;
                if (inputSource2 == null) {
                    inputSource = this.this$0.urlLookup(findMatchingEntry);
                }
            }
            return inputSource;
        }
    }

    public XMLCatalog() {
        setChecked(false);
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    public InputSource classpathLookup(ResourceLocation resourceLocation) {
        AntClassLoader createClassLoader = getProject().createClassLoader(this.classpath != null ? this.classpath.concatSystemClasspath(Definer.OnError.POLICY_IGNORE) : new Path(getProject()).concatSystemClasspath("last"));
        InputStream resourceAsStream = createClassLoader.getResourceAsStream(resourceLocation.getLocation());
        InputSource inputSource = null;
        if (resourceAsStream != null) {
            inputSource = new InputSource(resourceAsStream);
            String externalForm = createClassLoader.getResource(resourceLocation.getLocation()).toExternalForm();
            inputSource.setSystemId(externalForm);
            log(new StringBuffer().append("catalog entry matched a resource in the classpath: '").append(externalForm).append("'").toString(), 4);
        }
        return inputSource;
    }

    public InputSource filesystemLookup(ResourceLocation resourceLocation) {
        URL fileURL;
        String replace = resourceLocation.getLocation().replace(File.separatorChar, '/');
        if (resourceLocation.getBase() != null) {
            fileURL = resourceLocation.getBase();
        } else {
            try {
                fileURL = FILE_UTILS.getFileURL(getProject().getBaseDir());
            } catch (MalformedURLException e) {
                throw new BuildException("Project basedir cannot be converted to a URL");
            }
        }
        URL url = null;
        try {
            url = new URL(fileURL, replace);
        } catch (MalformedURLException e2) {
            File file = new File(replace);
            if (!file.exists() || !file.canRead()) {
                log(new StringBuffer().append("uri : '").append(replace).append("' does not match a readable file").toString(), 4);
            } else {
                log(new StringBuffer().append("uri : '").append(replace).append("' matches a readable file").toString(), 4);
                try {
                    url = FILE_UTILS.getFileURL(file);
                } catch (MalformedURLException e3) {
                    throw new BuildException(new StringBuffer().append("could not find an URL for :").append(file.getAbsolutePath()).toString());
                }
            }
        }
        InputSource inputSource = null;
        if (url != null) {
            inputSource = null;
            if (url.getProtocol().equals("file")) {
                String fromURI = FILE_UTILS.fromURI(url.toString());
                inputSource = null;
                if (fromURI != null) {
                    log(new StringBuffer().append("fileName ").append(fromURI).toString(), 4);
                    File file2 = new File(fromURI);
                    inputSource = null;
                    if (file2.exists()) {
                        inputSource = null;
                        if (file2.canRead()) {
                            try {
                                inputSource = new InputSource(new FileInputStream(file2));
                                try {
                                    String systemId = JAXPUtils.getSystemId(file2);
                                    inputSource.setSystemId(systemId);
                                    log(new StringBuffer().append("catalog entry matched a readable file: '").append(systemId).append("'").toString(), 4);
                                } catch (IOException e4) {
                                }
                            } catch (IOException e5) {
                                inputSource = null;
                            }
                        }
                    }
                }
            }
        }
        return inputSource;
    }

    public ResourceLocation findMatchingEntry(String str) {
        ResourceLocation resourceLocation;
        Enumeration elements = getElements().elements();
        while (true) {
            if (!elements.hasMoreElements()) {
                resourceLocation = null;
                break;
            }
            Object nextElement = elements.nextElement();
            if (nextElement instanceof ResourceLocation) {
                ResourceLocation resourceLocation2 = (ResourceLocation) nextElement;
                if (resourceLocation2.getPublicId().equals(str)) {
                    resourceLocation = resourceLocation2;
                    break;
                }
            }
        }
        return resourceLocation;
    }

    private CatalogResolver getCatalogResolver() {
        if (this.catalogResolver == null) {
            try {
                Class<?> cls = Class.forName(APACHE_RESOLVER, true, Class.forName(CATALOG_RESOLVER, true, Class.forName(APACHE_RESOLVER, true, getProject().createClassLoader(Path.systemClasspath)).getClassLoader()).getClassLoader());
                this.catalogResolver = new ExternalResolver(this, cls, cls.newInstance());
            } catch (Throwable th) {
                this.catalogResolver = new InternalResolver(this);
                if (getCatalogPath() != null && getCatalogPath().list().length != 0) {
                    log("Warning: XML resolver not found; external catalogs will be ignored", 1);
                }
                log(new StringBuffer().append("Failed to load Apache resolver: ").append(th).toString(), 4);
            }
        }
        return this.catalogResolver;
    }

    private Path getClasspath() {
        return getRef().classpath;
    }

    private Vector getElements() {
        return getRef().elements;
    }

    private XMLCatalog getRef() {
        Class cls;
        XMLCatalog xMLCatalog;
        if (!isReference()) {
            xMLCatalog = this;
        } else {
            if (class$org$apache$tools$ant$types$XMLCatalog == null) {
                cls = class$("org.apache.tools.ant.types.XMLCatalog");
                class$org$apache$tools$ant$types$XMLCatalog = cls;
            } else {
                cls = class$org$apache$tools$ant$types$XMLCatalog;
            }
            xMLCatalog = (XMLCatalog) getCheckedRef(cls, "xmlcatalog");
        }
        return xMLCatalog;
    }

    private String removeFragment(String str) {
        String str2 = str;
        int indexOf = str.indexOf("#");
        if (indexOf >= 0) {
            str2 = str.substring(0, indexOf);
        }
        return str2;
    }

    private void setEntityResolver(SAXSource sAXSource) throws TransformerException {
        XMLReader xMLReader = sAXSource.getXMLReader();
        XMLReader xMLReader2 = xMLReader;
        if (xMLReader == null) {
            SAXParserFactory newInstance = SAXParserFactory.newInstance();
            newInstance.setNamespaceAware(true);
            try {
                xMLReader2 = newInstance.newSAXParser().getXMLReader();
            } catch (ParserConfigurationException e) {
                throw new TransformerException(e);
            } catch (SAXException e2) {
                throw new TransformerException(e2);
            }
        }
        xMLReader2.setEntityResolver(this);
        sAXSource.setXMLReader(xMLReader2);
    }

    public InputSource urlLookup(ResourceLocation resourceLocation) {
        URL fileURL;
        String location = resourceLocation.getLocation();
        if (resourceLocation.getBase() != null) {
            fileURL = resourceLocation.getBase();
        } else {
            try {
                fileURL = FILE_UTILS.getFileURL(getProject().getBaseDir());
            } catch (MalformedURLException e) {
                throw new BuildException("Project basedir cannot be converted to a URL");
            }
        }
        URL url = null;
        try {
            url = new URL(fileURL, location);
        } catch (MalformedURLException e2) {
        }
        InputSource inputSource = null;
        if (url != null) {
            try {
                InputStream openStream = url.openStream();
                inputSource = null;
                if (openStream != null) {
                    inputSource = new InputSource(openStream);
                    try {
                        String externalForm = url.toExternalForm();
                        inputSource.setSystemId(externalForm);
                        log(new StringBuffer().append("catalog entry matched as a URL: '").append(externalForm).append("'").toString(), 4);
                    } catch (IOException e3) {
                    }
                }
            } catch (IOException e4) {
                inputSource = null;
            }
        }
        return inputSource;
    }

    public void addConfiguredXMLCatalog(XMLCatalog xMLCatalog) {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        Vector elements = xMLCatalog.getElements();
        Vector elements2 = getElements();
        Enumeration elements3 = elements.elements();
        while (elements3.hasMoreElements()) {
            elements2.addElement(elements3.nextElement());
        }
        createClasspath().append(xMLCatalog.getClasspath());
        createCatalogPath().append(xMLCatalog.getCatalogPath());
        setChecked(false);
    }

    public void addDTD(ResourceLocation resourceLocation) throws BuildException {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        getElements().addElement(resourceLocation);
        setChecked(false);
    }

    public void addEntity(ResourceLocation resourceLocation) throws BuildException {
        addDTD(resourceLocation);
    }

    public Path createCatalogPath() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        if (this.catalogPath == null) {
            this.catalogPath = new Path(getProject());
        }
        setChecked(false);
        return this.catalogPath.createPath();
    }

    public Path createClasspath() {
        if (isReference()) {
            throw noChildrenAllowed();
        }
        if (this.classpath == null) {
            this.classpath = new Path(getProject());
        }
        setChecked(false);
        return this.classpath.createPath();
    }

    @Override // org.apache.tools.ant.types.DataType
    protected void dieOnCircularReference(Stack stack, Project project) throws BuildException {
        synchronized (this) {
            if (!isChecked()) {
                if (isReference()) {
                    super.dieOnCircularReference(stack, project);
                } else {
                    if (this.classpath != null) {
                        pushAndInvokeCircularReferenceCheck(this.classpath, stack, project);
                    }
                    if (this.catalogPath != null) {
                        pushAndInvokeCircularReferenceCheck(this.catalogPath, stack, project);
                    }
                    setChecked(true);
                }
            }
        }
    }

    public Path getCatalogPath() {
        return getRef().catalogPath;
    }

    @Override // javax.xml.transform.URIResolver
    public Source resolve(String str, String str2) throws TransformerException {
        SAXSource sAXSource;
        if (isReference()) {
            sAXSource = getRef().resolve(str, str2);
        } else {
            dieOnCircularReference();
            String removeFragment = removeFragment(str);
            log(new StringBuffer().append("resolve: '").append(removeFragment).append("' with base: '").append(str2).append("'").toString(), 4);
            SAXSource sAXSource2 = (SAXSource) getCatalogResolver().resolve(removeFragment, str2);
            sAXSource = sAXSource2;
            if (sAXSource2 == null) {
                log(new StringBuffer().append("No matching catalog entry found, parser will use: '").append(str).append("'").toString(), 4);
                sAXSource = new SAXSource();
                try {
                    URL fileURL = str2 == null ? FILE_UTILS.getFileURL(getProject().getBaseDir()) : new URL(str2);
                    if (removeFragment.length() != 0) {
                        fileURL = new URL(fileURL, removeFragment);
                    }
                    sAXSource.setInputSource(new InputSource(fileURL.toString()));
                } catch (MalformedURLException e) {
                    sAXSource.setInputSource(new InputSource(removeFragment));
                }
            }
            setEntityResolver(sAXSource);
        }
        return sAXSource;
    }

    @Override // org.xml.sax.EntityResolver
    public InputSource resolveEntity(String str, String str2) throws SAXException, IOException {
        InputSource inputSource;
        if (isReference()) {
            inputSource = getRef().resolveEntity(str, str2);
        } else {
            dieOnCircularReference();
            log(new StringBuffer().append("resolveEntity: '").append(str).append("': '").append(str2).append("'").toString(), 4);
            InputSource resolveEntity = getCatalogResolver().resolveEntity(str, str2);
            inputSource = resolveEntity;
            if (resolveEntity == null) {
                log(new StringBuffer().append("No matching catalog entry found, parser will use: '").append(str2).append("'").toString(), 4);
                inputSource = resolveEntity;
            }
        }
        return inputSource;
    }

    public void setCatalogPathRef(Reference reference) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        createCatalogPath().setRefid(reference);
        setChecked(false);
    }

    public void setClasspath(Path path) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        if (this.classpath == null) {
            this.classpath = path;
        } else {
            this.classpath.append(path);
        }
        setChecked(false);
    }

    public void setClasspathRef(Reference reference) {
        if (isReference()) {
            throw tooManyAttributes();
        }
        createClasspath().setRefid(reference);
        setChecked(false);
    }

    @Override // org.apache.tools.ant.types.DataType
    public void setRefid(Reference reference) throws BuildException {
        if (!this.elements.isEmpty()) {
            throw tooManyAttributes();
        }
        super.setRefid(reference);
    }
}
