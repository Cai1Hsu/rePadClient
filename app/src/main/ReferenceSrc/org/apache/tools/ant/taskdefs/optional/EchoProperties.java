package org.apache.tools.ant.taskdefs.optional;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.TreeSet;
import java.util.Vector;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.types.PropertySet;
import org.apache.tools.ant.types.selectors.ContainsSelector;
import org.apache.tools.ant.util.CollectionUtils;
import org.apache.tools.ant.util.DOMElementWriter;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JavaEnvUtils;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/EchoProperties.class */
public class EchoProperties extends Task {
    private static final String ATTR_NAME = "name";
    private static final String ATTR_VALUE = "value";
    private static final String PROPERTIES = "properties";
    private static final String PROPERTY = "property";
    private String prefix;
    private String regex;
    private File inFile = null;
    private File destfile = null;
    private boolean failonerror = true;
    private Vector propertySets = new Vector();
    private String format = ContainsSelector.CONTAINS_KEY;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/EchoProperties$FormatAttribute.class */
    public static class FormatAttribute extends EnumeratedAttribute {
        private String[] formats = {"xml", ContainsSelector.CONTAINS_KEY};

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return this.formats;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/optional/EchoProperties$Tuple.class */
    private static final class Tuple implements Comparable {
        private String key;
        private String value;

        private Tuple(String str, String str2) {
            this.key = str;
            this.value = str2;
        }

        Tuple(String str, String str2, AnonymousClass1 anonymousClass1) {
            this(str, str2);
        }

        @Override // java.lang.Comparable
        public int compareTo(Object obj) {
            return this.key.compareTo(((Tuple) obj).key);
        }
    }

    private static DocumentBuilder getDocumentBuilder() {
        try {
            return DocumentBuilderFactory.newInstance().newDocumentBuilder();
        } catch (Exception e) {
            throw new ExceptionInInitializerError(e);
        }
    }

    private List sortProperties(Properties properties) {
        ArrayList arrayList = new ArrayList(properties.size());
        Enumeration<?> propertyNames = properties.propertyNames();
        while (propertyNames.hasMoreElements()) {
            String str = (String) propertyNames.nextElement();
            arrayList.add(new Tuple(str, properties.getProperty(str), null));
        }
        Collections.sort(arrayList);
        return arrayList;
    }

    public void addPropertyset(PropertySet propertySet) {
        this.propertySets.addElement(propertySet);
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        FileInputStream fileInputStream;
        IOException e;
        Throwable th;
        FileNotFoundException e2;
        OutputStream outputStream;
        IOException e3;
        if (this.prefix == null || this.regex == null) {
            Hashtable hashtable = new Hashtable();
            if (this.inFile == null && this.propertySets.size() == 0) {
                hashtable.putAll(getProject().getProperties());
            } else if (this.inFile != null) {
                if (this.inFile.exists() && this.inFile.isDirectory()) {
                    if (this.failonerror) {
                        throw new BuildException("srcfile is a directory!", getLocation());
                    }
                    log("srcfile is a directory!", 0);
                    return;
                } else if (this.inFile.exists() && !this.inFile.canRead()) {
                    if (this.failonerror) {
                        throw new BuildException("Can not read from the specified srcfile!", getLocation());
                    }
                    log("Can not read from the specified srcfile!", 0);
                    return;
                } else {
                    try {
                        try {
                            fileInputStream = new FileInputStream(this.inFile);
                        } catch (Throwable th2) {
                            th = th2;
                            fileInputStream = null;
                        }
                    } catch (FileNotFoundException e4) {
                        e2 = e4;
                        fileInputStream = null;
                    } catch (IOException e5) {
                        e = e5;
                        fileInputStream = null;
                    }
                    try {
                        Properties properties = new Properties();
                        properties.load(fileInputStream);
                        hashtable.putAll(properties);
                        FileUtils.close(fileInputStream);
                    } catch (FileNotFoundException e6) {
                        e2 = e6;
                        FileInputStream fileInputStream2 = fileInputStream;
                        FileInputStream fileInputStream3 = fileInputStream;
                        String stringBuffer = new StringBuffer().append("Could not find file ").append(this.inFile.getAbsolutePath()).toString();
                        FileInputStream fileInputStream4 = fileInputStream;
                        if (!this.failonerror) {
                            log(stringBuffer, 1);
                            FileUtils.close(fileInputStream);
                            return;
                        }
                        FileInputStream fileInputStream5 = fileInputStream;
                        FileInputStream fileInputStream6 = fileInputStream;
                        BuildException buildException = new BuildException(stringBuffer, e2, getLocation());
                        FileInputStream fileInputStream7 = fileInputStream;
                        throw buildException;
                    } catch (IOException e7) {
                        e = e7;
                        FileInputStream fileInputStream8 = fileInputStream;
                        FileInputStream fileInputStream9 = fileInputStream;
                        String stringBuffer2 = new StringBuffer().append("Could not read file ").append(this.inFile.getAbsolutePath()).toString();
                        FileInputStream fileInputStream10 = fileInputStream;
                        if (!this.failonerror) {
                            FileInputStream fileInputStream11 = fileInputStream;
                            log(stringBuffer2, 1);
                            FileUtils.close(fileInputStream);
                            return;
                        }
                        FileInputStream fileInputStream12 = fileInputStream;
                        FileInputStream fileInputStream13 = fileInputStream;
                        BuildException buildException2 = new BuildException(stringBuffer2, e, getLocation());
                        FileInputStream fileInputStream14 = fileInputStream;
                        throw buildException2;
                    } catch (Throwable th3) {
                        th = th3;
                        FileUtils.close(fileInputStream);
                        throw th;
                    }
                }
            }
            Enumeration elements = this.propertySets.elements();
            while (elements.hasMoreElements()) {
                hashtable.putAll(((PropertySet) elements.nextElement()).getProperties());
            }
            ByteArrayOutputStream byteArrayOutputStream = null;
            ByteArrayOutputStream byteArrayOutputStream2 = null;
            try {
                try {
                    try {
                    } catch (IOException e8) {
                        return;
                    }
                } catch (IOException e9) {
                    e3 = e9;
                    outputStream = null;
                }
            } catch (Throwable th4) {
                th = th4;
            }
            try {
                if (this.destfile == null) {
                    ByteArrayOutputStream byteArrayOutputStream3 = new ByteArrayOutputStream();
                    saveProperties(hashtable, byteArrayOutputStream3);
                    byteArrayOutputStream = byteArrayOutputStream3;
                    log(byteArrayOutputStream3.toString(), 2);
                    byteArrayOutputStream2 = byteArrayOutputStream3;
                } else if (this.destfile.exists() && this.destfile.isDirectory()) {
                    if (this.failonerror) {
                        throw new BuildException("destfile is a directory!", getLocation());
                    }
                    log("destfile is a directory!", 0);
                    if (0 == 0) {
                        return;
                    }
                    throw new NullPointerException();
                } else if (this.destfile.exists() && !this.destfile.canWrite()) {
                    if (this.failonerror) {
                        throw new BuildException("Can not write to the specified destfile!", getLocation());
                    }
                    log("Can not write to the specified destfile!", 0);
                    if (0 == 0) {
                        return;
                    }
                    throw new NullPointerException();
                } else {
                    FileOutputStream fileOutputStream = new FileOutputStream(this.destfile);
                    byteArrayOutputStream = fileOutputStream;
                    saveProperties(hashtable, fileOutputStream);
                    byteArrayOutputStream2 = fileOutputStream;
                }
                if (byteArrayOutputStream2 == null) {
                    return;
                }
                byteArrayOutputStream2.close();
                return;
            } catch (IOException e10) {
                e3 = e10;
                outputStream = byteArrayOutputStream2;
                if (this.failonerror) {
                    OutputStream outputStream2 = outputStream;
                    OutputStream outputStream3 = outputStream;
                    OutputStream outputStream4 = outputStream;
                    throw new BuildException(e3, getLocation());
                }
                log(e3.getMessage(), 2);
                if (outputStream == null) {
                    return;
                }
                outputStream.close();
                return;
            } catch (Throwable th5) {
                th = th5;
                byteArrayOutputStream2 = byteArrayOutputStream;
                if (byteArrayOutputStream2 != null) {
                    try {
                        byteArrayOutputStream2.close();
                    } catch (IOException e11) {
                    }
                }
                throw th;
            }
        }
        throw new BuildException("Please specify either prefix or regex, but not both", getLocation());
    }

    protected void jdkSaveProperties(Properties properties, OutputStream outputStream, String str) throws IOException {
        try {
            try {
                properties.store(outputStream, str);
                if (outputStream == null) {
                    return;
                }
                try {
                    outputStream.close();
                } catch (IOException e) {
                    log("Failed to close output stream");
                }
            } catch (IOException e2) {
                throw new BuildException(e2, getLocation());
            }
        } catch (Throwable th) {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e3) {
                    log("Failed to close output stream");
                }
            }
            throw th;
        }
    }

    protected void saveProperties(Hashtable hashtable, OutputStream outputStream) throws IOException, BuildException {
        ArrayList arrayList = new ArrayList(hashtable.keySet());
        Collections.sort(arrayList);
        Properties properties = new Properties(this, arrayList) { // from class: org.apache.tools.ant.taskdefs.optional.EchoProperties.1
            private static final long serialVersionUID = 5090936442309201654L;
            private final EchoProperties this$0;
            private final List val$keyList;

            {
                this.this$0 = this;
                this.val$keyList = arrayList;
            }

            @Override // java.util.Hashtable, java.util.Map
            public Set entrySet() {
                Set entrySet = super.entrySet();
                TreeSet treeSet = entrySet;
                if (JavaEnvUtils.isKaffe()) {
                    TreeSet treeSet2 = new TreeSet(new Comparator(this) { // from class: org.apache.tools.ant.taskdefs.optional.EchoProperties.2
                        private final AnonymousClass1 this$1;

                        {
                            this.this$1 = this;
                        }

                        @Override // java.util.Comparator
                        public int compare(Object obj, Object obj2) {
                            return ((String) ((Map.Entry) obj).getKey()).compareTo((String) ((Map.Entry) obj2).getKey());
                        }
                    });
                    treeSet2.addAll(entrySet);
                    treeSet = treeSet2;
                }
                return treeSet;
            }

            @Override // java.util.Hashtable, java.util.Dictionary
            public Enumeration keys() {
                return CollectionUtils.asEnumeration(this.val$keyList.iterator());
            }
        };
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            String obj = arrayList.get(i).toString();
            properties.setProperty(obj, hashtable.get(obj).toString());
        }
        if (ContainsSelector.CONTAINS_KEY.equals(this.format)) {
            jdkSaveProperties(properties, outputStream, "Ant properties");
        } else if ("xml".equals(this.format)) {
            xmlSaveProperties(properties, outputStream);
        }
    }

    public void setDestfile(File file) {
        this.destfile = file;
    }

    public void setFailOnError(boolean z) {
        this.failonerror = z;
    }

    public void setFormat(FormatAttribute formatAttribute) {
        this.format = formatAttribute.getValue();
    }

    public void setPrefix(String str) {
        if (str == null || str.length() == 0) {
            return;
        }
        this.prefix = str;
        PropertySet propertySet = new PropertySet();
        propertySet.setProject(getProject());
        propertySet.appendPrefix(str);
        addPropertyset(propertySet);
    }

    public void setRegex(String str) {
        if (str == null || str.length() == 0) {
            return;
        }
        this.regex = str;
        PropertySet propertySet = new PropertySet();
        propertySet.setProject(getProject());
        propertySet.appendRegex(str);
        addPropertyset(propertySet);
    }

    public void setSrcfile(File file) {
        this.inFile = file;
    }

    protected void xmlSaveProperties(Properties properties, OutputStream outputStream) throws IOException {
        Throwable th;
        OutputStreamWriter outputStreamWriter;
        IOException e;
        OutputStreamWriter outputStreamWriter2;
        OutputStreamWriter outputStreamWriter3;
        Document newDocument = getDocumentBuilder().newDocument();
        Element createElement = newDocument.createElement(PROPERTIES);
        for (Tuple tuple : sortProperties(properties)) {
            Element createElement2 = newDocument.createElement("property");
            createElement2.setAttribute("name", tuple.key);
            createElement2.setAttribute("value", tuple.value);
            createElement.appendChild(createElement2);
        }
        try {
            try {
                outputStreamWriter3 = new OutputStreamWriter(outputStream, "UTF8");
            } catch (Throwable th2) {
                th = th2;
                outputStreamWriter = null;
            }
        } catch (IOException e2) {
            e = e2;
            outputStreamWriter2 = null;
        }
        try {
            outputStreamWriter3.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            new DOMElementWriter().write(createElement, outputStreamWriter3, 0, "\t");
            outputStreamWriter3.flush();
            FileUtils.close(outputStreamWriter3);
        } catch (IOException e3) {
            outputStreamWriter2 = outputStreamWriter3;
            e = e3;
            OutputStreamWriter outputStreamWriter4 = outputStreamWriter2;
            OutputStreamWriter outputStreamWriter5 = outputStreamWriter2;
            throw new BuildException("Unable to write XML file", e);
        } catch (Throwable th3) {
            outputStreamWriter = outputStreamWriter3;
            th = th3;
            FileUtils.close(outputStreamWriter);
            throw th;
        }
    }
}
