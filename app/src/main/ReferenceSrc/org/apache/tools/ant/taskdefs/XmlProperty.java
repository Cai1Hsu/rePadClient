package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.Path;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.ResourceCollection;
import org.apache.tools.ant.types.XMLCatalog;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.FileResource;
import org.apache.tools.ant.util.FileUtils;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.EntityResolver;
import org.xml.sax.SAXException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/XmlProperty.class */
public class XmlProperty extends Task {
    private static final String ID = "id";
    private static final String LOCATION = "location";
    private static final String PATH = "path";
    private static final String VALUE = "value";
    static Class class$org$apache$tools$ant$taskdefs$XmlProperty;
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    private Resource src;
    private static final String REF_ID = "refid";
    private static final String PATHID = "pathid";
    private static final String[] ATTRIBUTES = {"id", REF_ID, "location", "value", "path", PATHID};
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private String prefix = "";
    private boolean keepRoot = true;
    private boolean validate = false;
    private boolean collapseAttributes = false;
    private boolean semanticAttributes = false;
    private boolean includeSemanticAttribute = false;
    private File rootDirectory = null;
    private Hashtable addedAttributes = new Hashtable();
    private XMLCatalog xmlCatalog = new XMLCatalog();
    private String delimiter = ",";

    private void addNodeRecursively(Node node, String str, Object obj) {
        String str2 = str;
        if (node.getNodeType() != 3) {
            String str3 = str;
            if (str.trim().length() > 0) {
                str3 = new StringBuffer().append(str).append(".").toString();
            }
            str2 = new StringBuffer().append(str3).append(node.getNodeName()).toString();
        }
        Object processNode = processNode(node, str2, obj);
        if (node.hasChildNodes()) {
            NodeList childNodes = node.getChildNodes();
            int length = childNodes.getLength();
            for (int i = 0; i < length; i++) {
                addNodeRecursively(childNodes.item(i), str2, processNode);
            }
        }
    }

    private void addProperty(String str, String str2, String str3) {
        String stringBuffer = new StringBuffer().append(str).append(":").append(str2).toString();
        String str4 = stringBuffer;
        if (str3 != null) {
            str4 = new StringBuffer().append(stringBuffer).append("(id=").append(str3).append(")").toString();
        }
        log(str4, 4);
        if (this.addedAttributes.containsKey(str)) {
            str2 = new StringBuffer().append((String) this.addedAttributes.get(str)).append(getDelimiter()).append(str2).toString();
            getProject().setProperty(str, str2);
            this.addedAttributes.put(str, str2);
        } else if (getProject().getProperty(str) == null) {
            getProject().setNewProperty(str, str2);
            this.addedAttributes.put(str, str2);
        } else {
            log(new StringBuffer().append("Override ignored for property ").append(str).toString(), 3);
        }
        if (str3 != null) {
            getProject().addReference(str3, str2);
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    private String getAttributeName(Node node) {
        String nodeName = node.getNodeName();
        return this.semanticAttributes ? nodeName.equals(REF_ID) ? "" : (!isSemanticAttribute(nodeName) || this.includeSemanticAttribute) ? new StringBuffer().append(".").append(nodeName).toString() : "" : this.collapseAttributes ? new StringBuffer().append(".").append(nodeName).toString() : new StringBuffer().append("(").append(nodeName).append(")").toString();
    }

    private String getAttributeValue(Node node) {
        String str;
        String trim = node.getNodeValue().trim();
        String str2 = trim;
        if (this.semanticAttributes) {
            String nodeName = node.getNodeName();
            String replaceProperties = getProject().replaceProperties(trim);
            if (nodeName.equals("location")) {
                str = resolveFile(replaceProperties).getPath();
            } else {
                str2 = replaceProperties;
                if (nodeName.equals(REF_ID)) {
                    Object reference = getProject().getReference(replaceProperties);
                    str2 = replaceProperties;
                    if (reference != null) {
                        str = reference.toString();
                    }
                }
            }
            return str;
        }
        str = str2;
        return str;
    }

    private static boolean isSemanticAttribute(String str) {
        boolean z;
        int i = 0;
        while (true) {
            if (i >= ATTRIBUTES.length) {
                z = false;
                break;
            } else if (str.equals(ATTRIBUTES[i])) {
                z = true;
                break;
            } else {
                i++;
            }
        }
        return z;
    }

    private File resolveFile(String str) {
        return FILE_UTILS.resolveFile(this.rootDirectory == null ? getProject().getBaseDir() : this.rootDirectory, str);
    }

    public void addConfigured(ResourceCollection resourceCollection) {
        if (resourceCollection.size() != 1) {
            throw new BuildException("only single argument resource collections are supported as archives");
        }
        setSrcResource((Resource) resourceCollection.iterator().next());
    }

    public void addConfiguredXMLCatalog(XMLCatalog xMLCatalog) {
        this.xmlCatalog.addConfiguredXMLCatalog(xMLCatalog);
    }

    void addNodeRecursively(Node node, String str) {
        addNodeRecursively(node, str, null);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Class cls;
        Resource resource = getResource();
        if (resource == null) {
            throw new BuildException("XmlProperty task requires a source resource");
        }
        try {
            log(new StringBuffer().append("Loading ").append(this.src).toString(), 3);
            if (!resource.isExists()) {
                log(new StringBuffer().append("Unable to find property resource: ").append(resource).toString(), 3);
                return;
            }
            DocumentBuilderFactory newInstance = DocumentBuilderFactory.newInstance();
            newInstance.setValidating(this.validate);
            newInstance.setNamespaceAware(false);
            DocumentBuilder newDocumentBuilder = newInstance.newDocumentBuilder();
            newDocumentBuilder.setEntityResolver(getEntityResolver());
            Resource resource2 = this.src;
            if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                class$org$apache$tools$ant$types$resources$FileProvider = cls;
            } else {
                cls = class$org$apache$tools$ant$types$resources$FileProvider;
            }
            FileProvider fileProvider = (FileProvider) resource2.as(cls);
            Element documentElement = (fileProvider != null ? newDocumentBuilder.parse(fileProvider.getFile()) : newDocumentBuilder.parse(this.src.getInputStream())).getDocumentElement();
            this.addedAttributes = new Hashtable();
            if (this.keepRoot) {
                addNodeRecursively(documentElement, this.prefix, null);
                return;
            }
            NodeList childNodes = documentElement.getChildNodes();
            int length = childNodes.getLength();
            for (int i = 0; i < length; i++) {
                addNodeRecursively(childNodes.item(i), this.prefix, null);
            }
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Failed to load ").append(this.src).toString(), e);
        } catch (ParserConfigurationException e2) {
            throw new BuildException(e2);
        } catch (SAXException e3) {
            Exception exc = e3;
            if (e3.getException() != null) {
                exc = e3.getException();
            }
            throw new BuildException(new StringBuffer().append("Failed to load ").append(this.src).toString(), exc);
        }
    }

    protected boolean getCollapseAttributes() {
        return this.collapseAttributes;
    }

    public String getDelimiter() {
        return this.delimiter;
    }

    protected EntityResolver getEntityResolver() {
        return this.xmlCatalog;
    }

    protected File getFile() {
        Class cls;
        Resource resource = this.src;
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        FileProvider fileProvider = (FileProvider) resource.as(cls);
        return fileProvider != null ? fileProvider.getFile() : null;
    }

    protected boolean getIncludeSementicAttribute() {
        return this.includeSemanticAttribute;
    }

    protected boolean getKeeproot() {
        return this.keepRoot;
    }

    protected String getPrefix() {
        return this.prefix;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v16, types: [org.apache.tools.ant.types.Resource] */
    /* JADX WARN: Type inference failed for: r0v19, types: [org.apache.tools.ant.types.Resource] */
    protected Resource getResource() {
        Class cls;
        File file = getFile();
        Resource resource = this.src;
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        FileProvider fileProvider = (FileProvider) resource.as(cls);
        return file == null ? this.src : (fileProvider == null || !fileProvider.getFile().equals(file)) ? new FileResource(file) : this.src;
    }

    protected File getRootDirectory() {
        return this.rootDirectory;
    }

    protected boolean getSemanticAttributes() {
        return this.semanticAttributes;
    }

    protected boolean getValidate() {
        return this.validate;
    }

    @Override // org.apache.tools.ant.Task
    public void init() {
        super.init();
        this.xmlCatalog.setProject(getProject());
    }

    /* JADX WARN: Code restructure failed: missing block: B:63:0x0214, code lost:
        if (r6.getAttributes().getNamedItem(org.apache.tools.ant.taskdefs.XmlProperty.PATHID) != null) goto L64;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x0269, code lost:
        if (r14 != false) goto L81;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object processNode(Node node, String str, Object obj) {
        boolean z;
        String str2;
        Path path;
        Path path2 = null;
        Path path3 = null;
        Path path4 = null;
        if (node.hasAttributes()) {
            NamedNodeMap attributes = node.getAttributes();
            Node namedItem = attributes.getNamedItem("id");
            String nodeValue = (!this.semanticAttributes || namedItem == null) ? null : namedItem.getNodeValue();
            int i = 0;
            while (true) {
                path2 = path3;
                path4 = nodeValue;
                if (i >= attributes.getLength()) {
                    break;
                }
                Node item = attributes.item(i);
                if (!this.semanticAttributes) {
                    addProperty(new StringBuffer().append(str).append(getAttributeName(item)).toString(), getAttributeValue(item), null);
                    path = path3;
                } else {
                    String nodeName = item.getNodeName();
                    String attributeValue = getAttributeValue(item);
                    Path path5 = (obj == null || !(obj instanceof Path)) ? null : (Path) obj;
                    path = path3;
                    if (nodeName.equals("id")) {
                        continue;
                    } else if (path5 != null && nodeName.equals("path")) {
                        path5.setPath(attributeValue);
                        path = path3;
                    } else if ((obj instanceof Path) && nodeName.equals(REF_ID)) {
                        path5.setPath(attributeValue);
                        path = path3;
                    } else if ((obj instanceof Path) && nodeName.equals("location")) {
                        path5.setLocation(resolveFile(attributeValue));
                        path = path3;
                    } else if (!nodeName.equals(PATHID)) {
                        addProperty(new StringBuffer().append(str).append(getAttributeName(item)).toString(), attributeValue, nodeValue);
                        path = path3;
                    } else if (obj != null) {
                        throw new BuildException("XmlProperty does not support nested paths");
                    } else {
                        path = new Path(getProject());
                        getProject().addReference(attributeValue, path);
                    }
                }
                i++;
                path3 = path;
            }
        }
        boolean z2 = false;
        if (node.getNodeType() == 1) {
            z2 = false;
            if (this.semanticAttributes) {
                z2 = false;
                if (node.hasAttributes()) {
                    if (node.getAttributes().getNamedItem("value") == null && node.getAttributes().getNamedItem("location") == null && node.getAttributes().getNamedItem(REF_ID) == null && node.getAttributes().getNamedItem("path") == null) {
                        z2 = false;
                    }
                    z2 = true;
                }
            }
        }
        if (node.getNodeType() == 3) {
            str2 = getAttributeValue(node);
            z = false;
        } else if (node.getNodeType() == 1 && node.getChildNodes().getLength() == 1 && node.getFirstChild().getNodeType() == 4) {
            String nodeValue2 = node.getFirstChild().getNodeValue();
            z = false;
            str2 = nodeValue2;
            if ("".equals(nodeValue2)) {
                z = false;
                str2 = nodeValue2;
                if (!z2) {
                    z = true;
                    str2 = nodeValue2;
                }
            }
        } else if (node.getNodeType() == 1 && node.getChildNodes().getLength() == 0 && !z2) {
            str2 = "";
            z = true;
        } else {
            z = false;
            str2 = null;
            if (node.getNodeType() == 1) {
                z = false;
                str2 = null;
                if (node.getChildNodes().getLength() == 1) {
                    z = false;
                    str2 = null;
                    if (node.getFirstChild().getNodeType() == 3) {
                        z = false;
                        str2 = null;
                        if ("".equals(node.getFirstChild().getNodeValue())) {
                            z = false;
                            str2 = null;
                            if (!z2) {
                                str2 = "";
                                z = true;
                            }
                        }
                    }
                }
            }
        }
        Path path6 = path4;
        if (str2 != null) {
            Path path7 = path4;
            if (this.semanticAttributes) {
                path7 = path4;
                if (path4 == null) {
                    path7 = path4;
                    if (obj instanceof String) {
                        path7 = (String) obj;
                    }
                }
            }
            if (str2.trim().length() == 0) {
                path6 = path7;
            }
            addProperty(str, str2, path7);
            path6 = path7;
        }
        if (path2 == null) {
            path2 = path6;
        }
        return path2;
    }

    public void setCollapseAttributes(boolean z) {
        this.collapseAttributes = z;
    }

    public void setDelimiter(String str) {
        this.delimiter = str;
    }

    public void setFile(File file) {
        setSrcResource(new FileResource(file));
    }

    public void setIncludeSemanticAttribute(boolean z) {
        this.includeSemanticAttribute = z;
    }

    public void setKeeproot(boolean z) {
        this.keepRoot = z;
    }

    public void setPrefix(String str) {
        this.prefix = str.trim();
    }

    public void setRootDirectory(File file) {
        this.rootDirectory = file;
    }

    public void setSemanticAttributes(boolean z) {
        this.semanticAttributes = z;
    }

    public void setSrcResource(Resource resource) {
        Class cls;
        if (resource.isDirectory()) {
            throw new BuildException("the source can't be a directory");
        }
        if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.FileProvider");
            class$org$apache$tools$ant$types$resources$FileProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$FileProvider;
        }
        if (resource.as(cls) == null && !supportsNonFileResources()) {
            throw new BuildException("Only FileSystem resources are supported.");
        }
        this.src = resource;
    }

    public void setValidate(boolean z) {
        this.validate = z;
    }

    protected boolean supportsNonFileResources() {
        Class cls;
        Class<?> cls2 = getClass();
        if (class$org$apache$tools$ant$taskdefs$XmlProperty == null) {
            cls = class$("org.apache.tools.ant.taskdefs.XmlProperty");
            class$org$apache$tools$ant$taskdefs$XmlProperty = cls;
        } else {
            cls = class$org$apache$tools$ant$taskdefs$XmlProperty;
        }
        return cls2.equals(cls);
    }
}
