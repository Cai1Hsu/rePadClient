package org.apache.tools.ant.taskdefs.optional.ejb;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.apache.tools.ant.taskdefs.rmic.DefaultRmicAdapter;
import org.jivesoftware.smackx.workgroup.packet.SessionID;
import org.xml.sax.AttributeList;
import org.xml.sax.HandlerBase;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc.class */
public class IPlanetEjbc {
    private static final String ENTITY_BEAN = "entity";
    private static final int MAX_NUM_ARGS = 8;
    private static final int MIN_NUM_ARGS = 2;
    private static final int NUM_CLASSES_WITHOUT_IIOP = 9;
    private static final int NUM_CLASSES_WITH_IIOP = 15;
    private static final String STATEFUL_SESSION = "stateful";
    private static final String STATELESS_SESSION = "stateless";
    private String classpath;
    private String[] classpathElements;
    private File destDirectory;
    private String displayName;
    private File iasDescriptor;
    private File iasHomeDir;
    private SAXParser parser;
    private File stdDescriptor;
    private boolean retainSource = false;
    private boolean debugOutput = false;
    private EjbcHandler handler = new EjbcHandler(this);
    private Hashtable ejbFiles = new Hashtable();

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$Classname.class */
    private static class Classname {
        private String className;
        private String packageName;
        private String qualifiedName;

        public Classname(String str) {
            if (str == null) {
                return;
            }
            this.qualifiedName = str;
            int lastIndexOf = str.lastIndexOf(46);
            if (lastIndexOf == -1) {
                this.className = str;
                this.packageName = "";
                return;
            }
            this.packageName = str.substring(0, lastIndexOf);
            this.className = str.substring(lastIndexOf + 1);
        }

        public File getClassFile(File file) {
            return new File(file, new StringBuffer().append(this.qualifiedName.replace('.', File.separatorChar)).append(".class").toString());
        }

        public String getClassName() {
            return this.className;
        }

        public String getPackageName() {
            return this.packageName;
        }

        public String getQualifiedClassName() {
            return this.qualifiedName;
        }

        public String getQualifiedWithUnderscores() {
            return this.qualifiedName.replace('.', '_');
        }

        public String toString() {
            return getQualifiedClassName();
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo.class */
    private class EjbInfo {
        private Classname home;
        private Classname implementation;
        private String name;
        private Classname primaryKey;
        private Classname remote;
        private final IPlanetEjbc this$0;
        private String beantype = IPlanetEjbc.ENTITY_BEAN;
        private boolean cmp = false;
        private boolean iiop = false;
        private boolean hasession = false;
        private List cmpDescriptors = new ArrayList();

        public EjbInfo(IPlanetEjbc iPlanetEjbc, String str) {
            this.this$0 = iPlanetEjbc;
            this.name = str;
        }

        public void checkConfiguration(File file) throws EjbcException {
            if (this.home == null) {
                throw new EjbcException(this.this$0, new StringBuffer().append("A home interface was not found for the ").append(this.name).append(" EJB.").toString());
            }
            if (this.remote == null) {
                throw new EjbcException(this.this$0, new StringBuffer().append("A remote interface was not found for the ").append(this.name).append(" EJB.").toString());
            }
            if (this.implementation == null) {
                throw new EjbcException(this.this$0, new StringBuffer().append("An EJB implementation class was not found for the ").append(this.name).append(" EJB.").toString());
            }
            if (!this.beantype.equals(IPlanetEjbc.ENTITY_BEAN) && !this.beantype.equals(IPlanetEjbc.STATELESS_SESSION) && !this.beantype.equals(IPlanetEjbc.STATEFUL_SESSION)) {
                throw new EjbcException(this.this$0, new StringBuffer().append("The beantype found (").append(this.beantype).append(") ").append("isn't valid in the ").append(this.name).append(" EJB.").toString());
            }
            if (this.cmp && !this.beantype.equals(IPlanetEjbc.ENTITY_BEAN)) {
                System.out.println(new StringBuffer().append("CMP stubs and skeletons may not be generated for a Session Bean -- the \"cmp\" attribute will be ignoredfor the ").append(this.name).append(" EJB.").toString());
            }
            if (this.hasession && !this.beantype.equals(IPlanetEjbc.STATEFUL_SESSION)) {
                System.out.println(new StringBuffer().append("Highly available stubs and skeletons may only be generated for a Stateful Session Bean -- the \"hasession\" attribute will be ignored for the ").append(this.name).append(" EJB.").toString());
            }
            if (!this.remote.getClassFile(file).exists()) {
                throw new EjbcException(this.this$0, new StringBuffer().append("The remote interface ").append(this.remote.getQualifiedClassName()).append(" could not be ").append("found.").toString());
            }
            if (!this.home.getClassFile(file).exists()) {
                throw new EjbcException(this.this$0, new StringBuffer().append("The home interface ").append(this.home.getQualifiedClassName()).append(" could not be ").append("found.").toString());
            }
            if (this.implementation.getClassFile(file).exists()) {
                return;
            }
            throw new EjbcException(this.this$0, new StringBuffer().append("The EJB implementation class ").append(this.implementation.getQualifiedClassName()).append(" could ").append("not be found.").toString());
        }

        private String[] classesToGenerate() {
            String[] strArr = this.iiop ? new String[15] : new String[9];
            String stringBuffer = new StringBuffer().append(this.remote.getPackageName()).append(".").toString();
            String className = this.remote.getClassName();
            String stringBuffer2 = new StringBuffer().append(this.home.getPackageName()).append(".").toString();
            String className2 = this.home.getClassName();
            String stringBuffer3 = new StringBuffer().append(this.implementation.getPackageName()).append(".").toString();
            String qualifiedWithUnderscores = this.implementation.getQualifiedWithUnderscores();
            int i = 0 + 1;
            strArr[0] = new StringBuffer().append(stringBuffer3).append("ejb_fac_").append(qualifiedWithUnderscores).toString();
            int i2 = i + 1;
            strArr[i] = new StringBuffer().append(stringBuffer3).append("ejb_home_").append(qualifiedWithUnderscores).toString();
            int i3 = i2 + 1;
            strArr[i2] = new StringBuffer().append(stringBuffer3).append("ejb_skel_").append(qualifiedWithUnderscores).toString();
            int i4 = i3 + 1;
            strArr[i3] = new StringBuffer().append(stringBuffer).append("ejb_kcp_skel_").append(className).toString();
            int i5 = i4 + 1;
            strArr[i4] = new StringBuffer().append(stringBuffer2).append("ejb_kcp_skel_").append(className2).toString();
            int i6 = i5 + 1;
            strArr[i5] = new StringBuffer().append(stringBuffer).append("ejb_kcp_stub_").append(className).toString();
            int i7 = i6 + 1;
            strArr[i6] = new StringBuffer().append(stringBuffer2).append("ejb_kcp_stub_").append(className2).toString();
            int i8 = i7 + 1;
            strArr[i7] = new StringBuffer().append(stringBuffer).append("ejb_stub_").append(className).toString();
            int i9 = i8 + 1;
            strArr[i8] = new StringBuffer().append(stringBuffer2).append("ejb_stub_").append(className2).toString();
            if (this.iiop) {
                int i10 = i9 + 1;
                strArr[i9] = new StringBuffer().append("org.omg.stub.").append(stringBuffer).append("_").append(className).append(DefaultRmicAdapter.RMI_STUB_SUFFIX).toString();
                int i11 = i10 + 1;
                strArr[i10] = new StringBuffer().append("org.omg.stub.").append(stringBuffer2).append("_").append(className2).append(DefaultRmicAdapter.RMI_STUB_SUFFIX).toString();
                int i12 = i11 + 1;
                strArr[i11] = new StringBuffer().append("org.omg.stub.").append(stringBuffer).append("_ejb_RmiCorbaBridge_").append(className).append(DefaultRmicAdapter.RMI_TIE_SUFFIX).toString();
                int i13 = i12 + 1;
                strArr[i12] = new StringBuffer().append("org.omg.stub.").append(stringBuffer2).append("_ejb_RmiCorbaBridge_").append(className2).append(DefaultRmicAdapter.RMI_TIE_SUFFIX).toString();
                strArr[i13] = new StringBuffer().append(stringBuffer).append("ejb_RmiCorbaBridge_").append(className).toString();
                strArr[i13 + 1] = new StringBuffer().append(stringBuffer2).append("ejb_RmiCorbaBridge_").append(className2).toString();
            }
            return strArr;
        }

        private long destClassesModified(File file) {
            String[] classesToGenerate = classesToGenerate();
            long time = new Date().getTime();
            boolean z = true;
            int i = 0;
            while (i < classesToGenerate.length) {
                String stringBuffer = new StringBuffer().append(classesToGenerate[i].replace('.', File.separatorChar)).append(".class").toString();
                File file2 = new File(file, stringBuffer);
                this.this$0.ejbFiles.put(stringBuffer, file2);
                z = z && file2.exists();
                long j = time;
                if (z) {
                    j = Math.min(time, file2.lastModified());
                }
                i++;
                time = j;
            }
            if (!z) {
                time = -1;
            }
            return time;
        }

        private long sourceClassesModified(File file) {
            File file2;
            long j;
            File classFile = this.remote.getClassFile(file);
            long lastModified = classFile.lastModified();
            if (lastModified == -1) {
                System.out.println(new StringBuffer().append("The class ").append(this.remote.getQualifiedClassName()).append(" couldn't ").append("be found on the classpath").toString());
                j = -1;
            } else {
                File classFile2 = this.home.getClassFile(file);
                long lastModified2 = classFile2.lastModified();
                if (lastModified2 == -1) {
                    System.out.println(new StringBuffer().append("The class ").append(this.home.getQualifiedClassName()).append(" couldn't be ").append("found on the classpath").toString());
                    j = -1;
                } else {
                    long max = Math.max(lastModified, lastModified2);
                    if (this.primaryKey != null) {
                        file2 = this.primaryKey.getClassFile(file);
                        long lastModified3 = file2.lastModified();
                        if (lastModified3 == -1) {
                            System.out.println(new StringBuffer().append("The class ").append(this.primaryKey.getQualifiedClassName()).append("couldn't be ").append("found on the classpath").toString());
                            j = -1;
                        } else {
                            max = Math.max(max, lastModified3);
                        }
                    } else {
                        file2 = null;
                    }
                    File classFile3 = this.implementation.getClassFile(file);
                    if (classFile3.lastModified() == -1) {
                        System.out.println(new StringBuffer().append("The class ").append(this.implementation.getQualifiedClassName()).append(" couldn't be found on the classpath").toString());
                        j = -1;
                    } else {
                        this.this$0.ejbFiles.put(new StringBuffer().append(this.remote.getQualifiedClassName().replace('.', File.separatorChar)).append(".class").toString(), classFile);
                        this.this$0.ejbFiles.put(new StringBuffer().append(this.home.getQualifiedClassName().replace('.', File.separatorChar)).append(".class").toString(), classFile2);
                        this.this$0.ejbFiles.put(new StringBuffer().append(this.implementation.getQualifiedClassName().replace('.', File.separatorChar)).append(".class").toString(), classFile3);
                        j = max;
                        if (file2 != null) {
                            this.this$0.ejbFiles.put(new StringBuffer().append(this.primaryKey.getQualifiedClassName().replace('.', File.separatorChar)).append(".class").toString(), file2);
                            j = max;
                        }
                    }
                }
            }
            return j;
        }

        public void addCmpDescriptor(String str) {
            this.cmpDescriptors.add(str);
        }

        public String getBeantype() {
            return this.beantype;
        }

        public boolean getCmp() {
            return this.cmp;
        }

        public List getCmpDescriptors() {
            return this.cmpDescriptors;
        }

        public boolean getHasession() {
            return this.hasession;
        }

        public Classname getHome() {
            return this.home;
        }

        public boolean getIiop() {
            return this.iiop;
        }

        public Classname getImplementation() {
            return this.implementation;
        }

        public String getName() {
            return this.name == null ? this.implementation == null ? "[unnamed]" : this.implementation.getClassName() : this.name;
        }

        public Classname getPrimaryKey() {
            return this.primaryKey;
        }

        public Classname getRemote() {
            return this.remote;
        }

        public boolean mustBeRecompiled(File file) {
            return destClassesModified(file) < sourceClassesModified(file);
        }

        public void setBeantype(String str) {
            this.beantype = str.toLowerCase();
        }

        public void setCmp(String str) {
            setCmp(str.equals("Container"));
        }

        public void setCmp(boolean z) {
            this.cmp = z;
        }

        public void setHasession(String str) {
            setHasession(str.equals("true"));
        }

        public void setHasession(boolean z) {
            this.hasession = z;
        }

        public void setHome(String str) {
            setHome(new Classname(str));
        }

        public void setHome(Classname classname) {
            this.home = classname;
        }

        public void setIiop(String str) {
            setIiop(str.equals("true"));
        }

        public void setIiop(boolean z) {
            this.iiop = z;
        }

        public void setImplementation(String str) {
            setImplementation(new Classname(str));
        }

        public void setImplementation(Classname classname) {
            this.implementation = classname;
        }

        public void setPrimaryKey(String str) {
            setPrimaryKey(new Classname(str));
        }

        public void setPrimaryKey(Classname classname) {
            this.primaryKey = classname;
        }

        public void setRemote(String str) {
            setRemote(new Classname(str));
        }

        public void setRemote(Classname classname) {
            this.remote = classname;
        }

        public String toString() {
            String stringBuffer = new StringBuffer().append("EJB name: ").append(this.name).append("\n\r              home:      ").append(this.home).append("\n\r              remote:    ").append(this.remote).append("\n\r              impl:      ").append(this.implementation).append("\n\r              primaryKey: ").append(this.primaryKey).append("\n\r              beantype:  ").append(this.beantype).append("\n\r              cmp:       ").append(this.cmp).append("\n\r              iiop:      ").append(this.iiop).append("\n\r              hasession: ").append(this.hasession).toString();
            for (Object obj : this.cmpDescriptors) {
                stringBuffer = new StringBuffer().append(stringBuffer).append("\n\r              CMP Descriptor: ").append(obj).toString();
            }
            return stringBuffer;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcException.class */
    public class EjbcException extends Exception {
        private final IPlanetEjbc this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public EjbcException(IPlanetEjbc iPlanetEjbc, String str) {
            super(str);
            this.this$0 = iPlanetEjbc;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler.class */
    private class EjbcHandler extends HandlerBase {
        private static final String DEFAULT_IAS60_DTD_LOCATION = "IASEjb_jar_1_0.dtd";
        private static final String DEFAULT_IAS60_EJB11_DTD_LOCATION = "ejb-jar_1_1.dtd";
        private static final String PUBLICID_EJB11 = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN";
        private static final String PUBLICID_IPLANET_EJB_60 = "-//Sun Microsystems, Inc.//DTD iAS Enterprise JavaBeans 1.0//EN";
        private EjbInfo currentEjb;
        private String currentText;
        private String ejbType;
        private final IPlanetEjbc this$0;
        private Map resourceDtds = new HashMap();
        private Map fileDtds = new HashMap();
        private Map ejbs = new HashMap();
        private boolean iasDescriptor = false;
        private String currentLoc = "";

        public EjbcHandler(IPlanetEjbc iPlanetEjbc) {
            this.this$0 = iPlanetEjbc;
            registerDTD("-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN", DEFAULT_IAS60_EJB11_DTD_LOCATION);
            registerDTD(PUBLICID_IPLANET_EJB_60, DEFAULT_IAS60_DTD_LOCATION);
        }

        private void iasCharacters(String str) {
            String stringBuffer = new StringBuffer().append("\\ias-ejb-jar\\enterprise-beans\\").append(this.ejbType).toString();
            if (this.currentLoc.equals(new StringBuffer().append(stringBuffer).append("\\ejb-name").toString())) {
                this.currentEjb = (EjbInfo) this.ejbs.get(str);
                if (this.currentEjb != null) {
                    return;
                }
                this.currentEjb = new EjbInfo(this.this$0, str);
                this.ejbs.put(str, this.currentEjb);
            } else if (this.currentLoc.equals(new StringBuffer().append(stringBuffer).append("\\iiop").toString())) {
                this.currentEjb.setIiop(str);
            } else if (this.currentLoc.equals(new StringBuffer().append(stringBuffer).append("\\failover-required").toString())) {
                this.currentEjb.setHasession(str);
            } else if (!this.currentLoc.equals(new StringBuffer().append(stringBuffer).append("\\persistence-manager").append("\\properties-file-location").toString())) {
            } else {
                this.currentEjb.addCmpDescriptor(str);
            }
        }

        private void stdCharacters(String str) {
            if (this.currentLoc.equals("\\ejb-jar\\display-name")) {
                this.this$0.displayName = str;
                return;
            }
            String stringBuffer = new StringBuffer().append("\\ejb-jar\\enterprise-beans\\").append(this.ejbType).toString();
            if (this.currentLoc.equals(new StringBuffer().append(stringBuffer).append("\\ejb-name").toString())) {
                this.currentEjb = (EjbInfo) this.ejbs.get(str);
                if (this.currentEjb != null) {
                    return;
                }
                this.currentEjb = new EjbInfo(this.this$0, str);
                this.ejbs.put(str, this.currentEjb);
            } else if (this.currentLoc.equals(new StringBuffer().append(stringBuffer).append("\\home").toString())) {
                this.currentEjb.setHome(str);
            } else if (this.currentLoc.equals(new StringBuffer().append(stringBuffer).append("\\remote").toString())) {
                this.currentEjb.setRemote(str);
            } else if (this.currentLoc.equals(new StringBuffer().append(stringBuffer).append("\\ejb-class").toString())) {
                this.currentEjb.setImplementation(str);
            } else if (this.currentLoc.equals(new StringBuffer().append(stringBuffer).append("\\prim-key-class").toString())) {
                this.currentEjb.setPrimaryKey(str);
            } else if (this.currentLoc.equals(new StringBuffer().append(stringBuffer).append("\\session-type").toString())) {
                this.currentEjb.setBeantype(str);
            } else if (!this.currentLoc.equals(new StringBuffer().append(stringBuffer).append("\\persistence-type").toString())) {
            } else {
                this.currentEjb.setCmp(str);
            }
        }

        @Override // org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void characters(char[] cArr, int i, int i2) throws SAXException {
            this.currentText = new StringBuffer().append(this.currentText).append(new String(cArr).substring(i, i + i2)).toString();
        }

        @Override // org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void endElement(String str) throws SAXException {
            if (this.iasDescriptor) {
                iasCharacters(this.currentText);
            } else {
                stdCharacters(this.currentText);
            }
            int length = str.length();
            this.currentLoc = this.currentLoc.substring(0, this.currentLoc.length() - (length + 1));
        }

        public String getDisplayName() {
            return this.this$0.displayName;
        }

        public EjbInfo[] getEjbs() {
            return (EjbInfo[]) this.ejbs.values().toArray(new EjbInfo[this.ejbs.size()]);
        }

        public void registerDTD(String str, String str2) {
            this.this$0.log(new StringBuffer().append("Registering: ").append(str2).toString());
            if (str == null || str2 == null) {
                return;
            }
            if (ClassLoader.getSystemResource(str2) != null) {
                this.this$0.log(new StringBuffer().append("Found resource: ").append(str2).toString());
                this.resourceDtds.put(str, str2);
                return;
            }
            File file = new File(str2);
            if (!file.exists() || !file.isFile()) {
                return;
            }
            this.this$0.log(new StringBuffer().append("Found file: ").append(str2).toString());
            this.fileDtds.put(str, str2);
        }

        @Override // org.xml.sax.HandlerBase, org.xml.sax.EntityResolver
        public InputSource resolveEntity(String str, String str2) throws SAXException {
            InputSource resolveEntity;
            FileInputStream fileInputStream = null;
            try {
                String str3 = (String) this.resourceDtds.get(str);
                if (str3 != null) {
                    fileInputStream = ClassLoader.getSystemResource(str3).openStream();
                } else {
                    String str4 = (String) this.fileDtds.get(str);
                    if (str4 != null) {
                        fileInputStream = new FileInputStream(str4);
                    }
                }
                resolveEntity = fileInputStream == null ? super.resolveEntity(str, str2) : new InputSource(fileInputStream);
            } catch (IOException e) {
                resolveEntity = super.resolveEntity(str, str2);
            }
            return resolveEntity;
        }

        @Override // org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void startElement(String str, AttributeList attributeList) throws SAXException {
            this.currentLoc = new StringBuffer().append(this.currentLoc).append("\\").append(str).toString();
            this.currentText = "";
            if (this.currentLoc.equals("\\ejb-jar")) {
                this.iasDescriptor = false;
            } else if (this.currentLoc.equals("\\ias-ejb-jar")) {
                this.iasDescriptor = true;
            }
            if (str.equals(SessionID.ELEMENT_NAME) || str.equals(IPlanetEjbc.ENTITY_BEAN)) {
                this.ejbType = str;
            }
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$RedirectOutput.class */
    private static class RedirectOutput extends Thread {
        private InputStream stream;

        public RedirectOutput(InputStream inputStream) {
            this.stream = inputStream;
        }

        /* JADX DEBUG: Another duplicated slice has different insns count: {[]}, finally: {[INVOKE] complete} */
        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(this.stream));
            while (true) {
                try {
                    try {
                        String readLine = bufferedReader.readLine();
                        if (readLine == null) {
                            try {
                                bufferedReader.close();
                                return;
                            } catch (IOException e) {
                                return;
                            }
                        }
                        System.out.println(readLine);
                    } catch (IOException e2) {
                        e2.printStackTrace();
                        try {
                            bufferedReader.close();
                            return;
                        } catch (IOException e3) {
                            return;
                        }
                    }
                } catch (Throwable th) {
                    try {
                        bufferedReader.close();
                    } catch (IOException e4) {
                    }
                    throw th;
                }
            }
        }
    }

    public IPlanetEjbc(File file, File file2, File file3, String str, SAXParser sAXParser) {
        this.stdDescriptor = file;
        this.iasDescriptor = file2;
        this.destDirectory = file3;
        this.classpath = str;
        this.parser = sAXParser;
        ArrayList arrayList = new ArrayList();
        if (str != null) {
            StringTokenizer stringTokenizer = new StringTokenizer(str, File.pathSeparator);
            while (stringTokenizer.hasMoreTokens()) {
                arrayList.add(stringTokenizer.nextToken());
            }
            this.classpathElements = (String[]) arrayList.toArray(new String[arrayList.size()]);
        }
    }

    private String[] buildArgumentList(EjbInfo ejbInfo) {
        ArrayList arrayList = new ArrayList();
        if (this.debugOutput) {
            arrayList.add("-debug");
        }
        if (ejbInfo.getBeantype().equals(STATELESS_SESSION)) {
            arrayList.add("-sl");
        } else if (ejbInfo.getBeantype().equals(STATEFUL_SESSION)) {
            arrayList.add("-sf");
        }
        if (ejbInfo.getIiop()) {
            arrayList.add("-iiop");
        }
        if (ejbInfo.getCmp()) {
            arrayList.add("-cmp");
        }
        if (this.retainSource) {
            arrayList.add("-gs");
        }
        if (ejbInfo.getHasession()) {
            arrayList.add("-fo");
        }
        arrayList.add("-classpath");
        arrayList.add(this.classpath);
        arrayList.add("-d");
        arrayList.add(this.destDirectory.toString());
        arrayList.add(ejbInfo.getHome().getQualifiedClassName());
        arrayList.add(ejbInfo.getRemote().getQualifiedClassName());
        arrayList.add(ejbInfo.getImplementation().getQualifiedClassName());
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    private void callEjbc(String[] strArr) {
        StringBuffer stringBuffer = new StringBuffer();
        for (String str : strArr) {
            stringBuffer.append(str).append(" ");
        }
        String stringBuffer2 = new StringBuffer().append(this.iasHomeDir == null ? "" : new StringBuffer().append(this.iasHomeDir.toString()).append(File.separator).append("bin").append(File.separator).toString()).append("ejbc ").toString();
        log(new StringBuffer().append(stringBuffer2).append((Object) stringBuffer).toString());
        try {
            Process exec = Runtime.getRuntime().exec(new StringBuffer().append(stringBuffer2).append((Object) stringBuffer).toString());
            RedirectOutput redirectOutput = new RedirectOutput(exec.getInputStream());
            RedirectOutput redirectOutput2 = new RedirectOutput(exec.getErrorStream());
            redirectOutput.start();
            redirectOutput2.start();
            exec.waitFor();
            exec.destroy();
        } catch (IOException e) {
            log("An IOException has occurred while trying to execute ejbc.");
            e.printStackTrace();
        } catch (InterruptedException e2) {
        }
    }

    private EjbInfo[] getEjbs() throws IOException, SAXException {
        this.parser.parse(this.stdDescriptor, this.handler);
        this.parser.parse(this.iasDescriptor, this.handler);
        return this.handler.getEjbs();
    }

    public void log(String str) {
        if (this.debugOutput) {
            System.out.println(str);
        }
    }

    public static void main(String[] strArr) {
        File file = null;
        String str = null;
        boolean z = false;
        boolean z2 = false;
        if (strArr.length < 2 || strArr.length > 8) {
            usage();
            return;
        }
        File file2 = new File(strArr[strArr.length - 2]);
        File file3 = new File(strArr[strArr.length - 1]);
        int i = 0;
        while (i < strArr.length - 2) {
            if (strArr[i].equals("-classpath")) {
                i++;
                str = strArr[i];
            } else if (strArr[i].equals("-d")) {
                i++;
                file = new File(strArr[i]);
            } else if (strArr[i].equals("-debug")) {
                z = true;
            } else if (!strArr[i].equals("-keepsource")) {
                usage();
                return;
            } else {
                z2 = true;
            }
            i++;
        }
        String str2 = str;
        if (str == null) {
            str2 = System.getProperties().getProperty("java.class.path");
        }
        File file4 = file;
        if (file == null) {
            file4 = new File(System.getProperties().getProperty("user.dir"));
        }
        SAXParserFactory newInstance = SAXParserFactory.newInstance();
        newInstance.setValidating(true);
        try {
            IPlanetEjbc iPlanetEjbc = new IPlanetEjbc(file2, file3, file4, str2, newInstance.newSAXParser());
            iPlanetEjbc.setDebugOutput(z);
            iPlanetEjbc.setRetainSource(z2);
            try {
                iPlanetEjbc.execute();
            } catch (IOException e) {
                System.out.println(new StringBuffer().append("An IOException has occurred while reading the XML descriptors (").append(e.getMessage()).append(").").toString());
            } catch (EjbcException e2) {
                System.out.println(new StringBuffer().append("An error has occurred while executing the ejbc utility (").append(e2.getMessage()).append(").").toString());
            } catch (SAXException e3) {
                System.out.println(new StringBuffer().append("A SAXException has occurred while reading the XML descriptors (").append(e3.getMessage()).append(").").toString());
            }
        } catch (Exception e4) {
            System.out.println("An exception was generated while trying to ");
            System.out.println("create a new SAXParser.");
            e4.printStackTrace();
        }
    }

    private static void usage() {
        System.out.println("java org.apache.tools.ant.taskdefs.optional.ejb.IPlanetEjbc \\");
        System.out.println("  [OPTIONS] [EJB 1.1 descriptor] [iAS EJB descriptor]");
        System.out.println("");
        System.out.println("Where OPTIONS are:");
        System.out.println("  -debug -- for additional debugging output");
        System.out.println("  -keepsource -- to retain Java source files generated");
        System.out.println("  -classpath [classpath] -- classpath used for compilation");
        System.out.println("  -d [destination directory] -- directory for compiled classes");
        System.out.println("");
        System.out.println("If a classpath is not specified, the system classpath");
        System.out.println("will be used.  If a destination directory is not specified,");
        System.out.println("the current working directory will be used (classes will");
        System.out.println("still be placed in subfolders which correspond to their");
        System.out.println("package name).");
        System.out.println("");
        System.out.println("The EJB home interface, remote interface, and implementation");
        System.out.println("class must be found in the destination directory.  In");
        System.out.println("addition, the destination will look for the stubs and skeletons");
        System.out.println("in the destination directory to ensure they are up to date.");
    }

    protected void checkConfiguration() throws EjbcException {
        String str;
        String str2 = "";
        if (this.stdDescriptor == null) {
            str2 = new StringBuffer().append("").append("A standard XML descriptor file must be specified.  ").toString();
        }
        String str3 = str2;
        if (this.iasDescriptor == null) {
            str3 = new StringBuffer().append(str2).append("An iAS-specific XML descriptor file must be specified.  ").toString();
        }
        String str4 = str3;
        if (this.classpath == null) {
            str4 = new StringBuffer().append(str3).append("A classpath must be specified.    ").toString();
        }
        String str5 = str4;
        if (this.parser == null) {
            str5 = new StringBuffer().append(str4).append("An XML parser must be specified.    ").toString();
        }
        if (this.destDirectory == null) {
            str = new StringBuffer().append(str5).append("A destination directory must be specified.  ").toString();
        } else if (!this.destDirectory.exists()) {
            str = new StringBuffer().append(str5).append("The destination directory specified does not exist.  ").toString();
        } else {
            str = str5;
            if (!this.destDirectory.isDirectory()) {
                str = new StringBuffer().append(str5).append("The destination specified is not a directory.  ").toString();
            }
        }
        if (str.length() > 0) {
            throw new EjbcException(this, str);
        }
    }

    public void execute() throws EjbcException, IOException, SAXException {
        checkConfiguration();
        EjbInfo[] ejbs = getEjbs();
        for (EjbInfo ejbInfo : ejbs) {
            log("EJBInfo...");
            log(ejbInfo.toString());
        }
        for (EjbInfo ejbInfo2 : ejbs) {
            ejbInfo2.checkConfiguration(this.destDirectory);
            if (ejbInfo2.mustBeRecompiled(this.destDirectory)) {
                log(new StringBuffer().append(ejbInfo2.getName()).append(" must be recompiled using ejbc.").toString());
                callEjbc(buildArgumentList(ejbInfo2));
            } else {
                log(new StringBuffer().append(ejbInfo2.getName()).append(" is up to date.").toString());
            }
        }
    }

    public String[] getCmpDescriptors() {
        ArrayList arrayList = new ArrayList();
        for (EjbInfo ejbInfo : this.handler.getEjbs()) {
            arrayList.addAll(ejbInfo.getCmpDescriptors());
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public String getDisplayName() {
        return this.displayName;
    }

    public Hashtable getEjbFiles() {
        return this.ejbFiles;
    }

    public void registerDTD(String str, String str2) {
        this.handler.registerDTD(str, str2);
    }

    public void setDebugOutput(boolean z) {
        this.debugOutput = z;
    }

    public void setIasHomeDir(File file) {
        this.iasHomeDir = file;
    }

    public void setRetainSource(boolean z) {
        this.retainSource = z;
    }
}
