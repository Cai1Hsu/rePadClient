package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Hashtable;
import org.apache.tools.ant.Task;
import org.xml.sax.AttributeList;
import org.xml.sax.HandlerBase;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler.class */
public class DescriptorHandler extends HandlerBase {
    private static final String BEAN_CLASS = "ejb-class";
    private static final int DEFAULT_HASH_TABLE_SIZE = 10;
    private static final String EJB_JAR = "ejb-jar";
    private static final String EJB_LOCAL_REF = "ejb-local-ref";
    private static final String EJB_NAME = "ejb-name";
    private static final String EJB_REF = "ejb-ref";
    private static final String ENTERPRISE_BEANS = "enterprise-beans";
    private static final String ENTITY_BEAN = "entity";
    private static final String HOME_INTERFACE = "home";
    private static final String LOCAL_HOME_INTERFACE = "local-home";
    private static final String LOCAL_INTERFACE = "local";
    private static final String MESSAGE_BEAN = "message-driven";
    private static final String PK_CLASS = "prim-key-class";
    private static final String REMOTE_INTERFACE = "remote";
    private static final String SESSION_BEAN = "session";
    private static final int STATE_IN_BEANS = 3;
    private static final int STATE_IN_EJBJAR = 2;
    private static final int STATE_IN_ENTITY = 5;
    private static final int STATE_IN_MESSAGE = 6;
    private static final int STATE_IN_SESSION = 4;
    private static final int STATE_LOOKING_EJBJAR = 1;
    private Task owningTask;
    private File srcDir;
    private String publicId = null;
    private int parseState = 1;
    protected String currentElement = null;
    protected String currentText = null;
    protected Hashtable ejbFiles = null;
    protected String ejbName = null;
    private Hashtable fileDTDs = new Hashtable();
    private Hashtable resourceDTDs = new Hashtable();
    private boolean inEJBRef = false;
    private Hashtable urlDTDs = new Hashtable();

    public DescriptorHandler(Task task, File file) {
        this.owningTask = task;
        this.srcDir = file;
    }

    @Override // org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
    public void characters(char[] cArr, int i, int i2) throws SAXException {
        this.currentText = new StringBuffer().append(this.currentText).append(new String(cArr, i, i2)).toString();
    }

    @Override // org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
    public void endElement(String str) throws SAXException {
        processElement();
        this.currentText = "";
        this.currentElement = "";
        if (str.equals(EJB_REF) || str.equals(EJB_LOCAL_REF)) {
            this.inEJBRef = false;
        } else if (this.parseState == 5 && str.equals(ENTITY_BEAN)) {
            this.parseState = 3;
        } else if (this.parseState == 4 && str.equals("session")) {
            this.parseState = 3;
        } else if (this.parseState == 6 && str.equals(MESSAGE_BEAN)) {
            this.parseState = 3;
        } else if (this.parseState == 3 && str.equals(ENTERPRISE_BEANS)) {
            this.parseState = 2;
        } else if (this.parseState != 2 || !str.equals(EJB_JAR)) {
        } else {
            this.parseState = 1;
        }
    }

    public String getEjbName() {
        return this.ejbName;
    }

    public Hashtable getFiles() {
        return this.ejbFiles == null ? new Hashtable() : this.ejbFiles;
    }

    public String getPublicId() {
        return this.publicId;
    }

    protected void processElement() {
        if (!this.inEJBRef) {
            if (this.parseState != 5 && this.parseState != 4 && this.parseState != 6) {
                return;
            }
            if (this.currentElement.equals(HOME_INTERFACE) || this.currentElement.equals(REMOTE_INTERFACE) || this.currentElement.equals(LOCAL_INTERFACE) || this.currentElement.equals(LOCAL_HOME_INTERFACE) || this.currentElement.equals(BEAN_CLASS) || this.currentElement.equals(PK_CLASS)) {
                String trim = this.currentText.trim();
                if (!trim.startsWith("java.") && !trim.startsWith("javax.")) {
                    String stringBuffer = new StringBuffer().append(trim.replace('.', File.separatorChar)).append(".class").toString();
                    this.ejbFiles.put(stringBuffer, new File(this.srcDir, stringBuffer));
                }
            }
            if (!this.currentElement.equals("ejb-name") || this.ejbName != null) {
                return;
            }
            this.ejbName = this.currentText.trim();
        }
    }

    public void registerDTD(String str, String str2) {
        if (str2 == null) {
            return;
        }
        File file = new File(str2);
        File file2 = file;
        if (!file.exists()) {
            file2 = this.owningTask.getProject().resolveFile(str2);
        }
        if (file2.exists()) {
            if (str == null) {
                return;
            }
            this.fileDTDs.put(str, file2);
            this.owningTask.log(new StringBuffer().append("Mapped publicId ").append(str).append(" to file ").append(file2).toString(), 3);
            return;
        }
        if (getClass().getResource(str2) != null && str != null) {
            this.resourceDTDs.put(str, str2);
            this.owningTask.log(new StringBuffer().append("Mapped publicId ").append(str).append(" to resource ").append(str2).toString(), 3);
        }
        if (str == null) {
            return;
        }
        try {
            this.urlDTDs.put(str, new URL(str2));
        } catch (MalformedURLException e) {
        }
    }

    @Override // org.xml.sax.HandlerBase, org.xml.sax.EntityResolver
    public InputSource resolveEntity(String str, String str2) throws SAXException {
        InputSource inputSource;
        InputStream resourceAsStream;
        this.publicId = str;
        File file = (File) this.fileDTDs.get(str);
        if (file != null) {
            try {
                this.owningTask.log(new StringBuffer().append("Resolved ").append(str).append(" to local file ").append(file).toString(), 3);
                inputSource = new InputSource(new FileInputStream(file));
            } catch (FileNotFoundException e) {
            }
            return inputSource;
        }
        String str3 = (String) this.resourceDTDs.get(str);
        if (str3 == null || (resourceAsStream = getClass().getResourceAsStream(str3)) == null) {
            URL url = (URL) this.urlDTDs.get(str);
            if (url != null) {
                try {
                    InputStream openStream = url.openStream();
                    this.owningTask.log(new StringBuffer().append("Resolved ").append(str).append(" to url ").append(url).toString(), 3);
                    inputSource = new InputSource(openStream);
                } catch (IOException e2) {
                }
            }
            this.owningTask.log(new StringBuffer().append("Could not resolve ( publicId: ").append(str).append(", systemId: ").append(str2).append(") to a local entity").toString(), 2);
            inputSource = null;
        } else {
            this.owningTask.log(new StringBuffer().append("Resolved ").append(str).append(" to local resource ").append(str3).toString(), 3);
            inputSource = new InputSource(resourceAsStream);
        }
        return inputSource;
    }

    @Override // org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
    public void startDocument() throws SAXException {
        this.ejbFiles = new Hashtable(10, 1.0f);
        this.currentElement = null;
        this.inEJBRef = false;
    }

    @Override // org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
    public void startElement(String str, AttributeList attributeList) throws SAXException {
        this.currentElement = str;
        this.currentText = "";
        if (str.equals(EJB_REF) || str.equals(EJB_LOCAL_REF)) {
            this.inEJBRef = true;
        } else if (this.parseState == 1 && str.equals(EJB_JAR)) {
            this.parseState = 2;
        } else if (this.parseState == 2 && str.equals(ENTERPRISE_BEANS)) {
            this.parseState = 3;
        } else if (this.parseState == 3 && str.equals("session")) {
            this.parseState = 4;
        } else if (this.parseState == 3 && str.equals(ENTITY_BEAN)) {
            this.parseState = 5;
        } else if (this.parseState != 3 || !str.equals(MESSAGE_BEAN)) {
        } else {
            this.parseState = 6;
        }
    }
}
