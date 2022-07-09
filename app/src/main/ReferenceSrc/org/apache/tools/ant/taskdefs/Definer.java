package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Properties;
import org.apache.tools.ant.AntTypeDefinition;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ComponentHelper;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.util.FileUtils;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Definer.class */
public abstract class Definer extends DefBase {
    private static final String ANTLIB_XML = "/antlib.xml";
    private static ResourceStack resourceStack = new ResourceStack(null);
    private String adaptTo;
    private Class adaptToClass;
    private String adapter;
    private Class adapterClass;
    private String classname;
    private File file;
    private String name;
    private String resource;
    private boolean restrict = false;
    private int format = 0;
    private boolean definerSet = false;
    private int onError = 0;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Definer$Format.class */
    public static class Format extends EnumeratedAttribute {
        public static final int PROPERTIES = 0;
        public static final int XML = 1;

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"properties", "xml"};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Definer$OnError.class */
    public static class OnError extends EnumeratedAttribute {
        public static final int FAIL = 0;
        public static final int FAIL_ALL = 3;
        public static final int IGNORE = 2;
        public static final String POLICY_FAIL = "fail";
        public static final String POLICY_FAILALL = "failall";
        public static final String POLICY_IGNORE = "ignore";
        public static final String POLICY_REPORT = "report";
        public static final int REPORT = 1;

        public OnError() {
        }

        public OnError(String str) {
            setValue(str);
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"fail", POLICY_REPORT, POLICY_IGNORE, POLICY_FAILALL};
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/Definer$ResourceStack.class */
    private static class ResourceStack extends ThreadLocal {
        private ResourceStack() {
        }

        ResourceStack(AnonymousClass1 anonymousClass1) {
            this();
        }

        Map getStack() {
            return (Map) get();
        }

        @Override // java.lang.ThreadLocal
        public Object initialValue() {
            return new HashMap();
        }
    }

    private URL fileToURL() {
        URL fileURL;
        String str = null;
        if (!this.file.exists()) {
            str = new StringBuffer().append("File ").append(this.file).append(" does not exist").toString();
        }
        String str2 = str;
        if (str == null) {
            str2 = str;
            if (!this.file.isFile()) {
                str2 = new StringBuffer().append("File ").append(this.file).append(" is not a file").toString();
            }
        }
        String str3 = str2;
        if (str2 == null) {
            try {
                fileURL = FileUtils.getFileUtils().getFileURL(this.file);
            } catch (Exception e) {
                str3 = new StringBuffer().append("File ").append(this.file).append(" cannot use as URL: ").append(e.toString()).toString();
            }
            return fileURL;
        }
        switch (this.onError) {
            case 0:
            case 1:
                log(str3, 1);
                break;
            case 2:
                log(str3, 3);
                break;
            case 3:
                throw new BuildException(str3);
        }
        fileURL = null;
        return fileURL;
    }

    private void loadAntlib(ClassLoader classLoader, URL url) {
        try {
            Antlib createAntlib = Antlib.createAntlib(getProject(), url, getURI());
            createAntlib.setClassLoader(classLoader);
            createAntlib.setURI(getURI());
            createAntlib.execute();
        } catch (BuildException e) {
            throw ProjectHelper.addLocationToBuildException(e, getLocation());
        }
    }

    public static String makeResourceFromURI(String str) {
        String stringBuffer;
        String substring = str.substring("antlib:".length());
        if (substring.startsWith("//")) {
            String substring2 = substring.substring("//".length());
            stringBuffer = substring2;
            if (!substring2.endsWith(".xml")) {
                stringBuffer = new StringBuffer().append(substring2).append(ANTLIB_XML).toString();
            }
        } else {
            stringBuffer = new StringBuffer().append(substring.replace('.', '/')).append(ANTLIB_XML).toString();
        }
        return stringBuffer;
    }

    private Enumeration resourceToURLs(ClassLoader classLoader) {
        try {
            Enumeration<URL> resources = classLoader.getResources(this.resource);
            if (!resources.hasMoreElements()) {
                String stringBuffer = new StringBuffer().append("Could not load definitions from resource ").append(this.resource).append(Rmic.ERROR_NOT_FOUND).toString();
                switch (this.onError) {
                    case 0:
                    case 1:
                        log(stringBuffer, 1);
                        break;
                    case 2:
                        log(stringBuffer, 3);
                        break;
                    case 3:
                        throw new BuildException(stringBuffer);
                }
            }
            return resources;
        } catch (IOException e) {
            throw new BuildException(new StringBuffer().append("Could not fetch resources named ").append(this.resource).toString(), e, getLocation());
        }
    }

    private void tooManyDefinitions() {
        throw new BuildException("Only one of the attributes name, file and resource can be set", getLocation());
    }

    protected void addDefinition(ClassLoader classLoader, String str, String str2) throws BuildException {
        try {
            try {
                String genComponentName = ProjectHelper.genComponentName(getURI(), str);
                Class<?> cls = null;
                if (this.onError != 2) {
                    cls = Class.forName(str2, true, classLoader);
                }
                if (this.adapter != null) {
                    this.adapterClass = Class.forName(this.adapter, true, classLoader);
                }
                if (this.adaptTo != null) {
                    this.adaptToClass = Class.forName(this.adaptTo, true, classLoader);
                }
                AntTypeDefinition antTypeDefinition = new AntTypeDefinition();
                antTypeDefinition.setName(genComponentName);
                antTypeDefinition.setClassName(str2);
                antTypeDefinition.setClass(cls);
                antTypeDefinition.setAdapterClass(this.adapterClass);
                antTypeDefinition.setAdaptToClass(this.adaptToClass);
                antTypeDefinition.setRestrict(this.restrict);
                antTypeDefinition.setClassLoader(classLoader);
                if (cls != null) {
                    antTypeDefinition.checkClass(getProject());
                }
                ComponentHelper.getComponentHelper(getProject()).addDataTypeDefinition(antTypeDefinition);
            } catch (ClassNotFoundException e) {
                throw new BuildException(new StringBuffer().append(getTaskName()).append(" class ").append(str2).append(" cannot be found").append("\n using the classloader ").append(classLoader).toString(), e, getLocation());
            } catch (NoClassDefFoundError e2) {
                throw new BuildException(new StringBuffer().append(getTaskName()).append(" A class needed by class ").append(str2).append(" cannot be found: ").append(e2.getMessage()).append("\n using the classloader ").append(classLoader).toString(), e2, getLocation());
            }
        } catch (BuildException e3) {
            switch (this.onError) {
                case 0:
                case 3:
                    throw e3;
                case 1:
                    log(new StringBuffer().append(e3.getLocation()).append("Warning: ").append(e3.getMessage()).toString(), 1);
                    return;
                case 2:
                default:
                    log(new StringBuffer().append(e3.getLocation()).append(e3.getMessage()).toString(), 4);
                    return;
            }
        }
    }

    @Override // org.apache.tools.ant.Task
    public void execute() throws BuildException {
        Enumeration enumeration;
        ClassLoader createLoader = createLoader();
        if (!this.definerSet) {
            if (getURI() == null) {
                throw new BuildException(new StringBuffer().append("name, file or resource attribute of ").append(getTaskName()).append(" is undefined").toString(), getLocation());
            }
            if (!getURI().startsWith("antlib:")) {
                throw new BuildException(new StringBuffer().append("Only antlib URIs can be located from the URI alone,not the URI ").append(getURI()).toString());
            }
            setResource(makeResourceFromURI(getURI()));
        }
        if (this.name != null) {
            if (this.classname == null) {
                throw new BuildException(new StringBuffer().append("classname attribute of ").append(getTaskName()).append(" element ").append("is undefined").toString(), getLocation());
            }
            addDefinition(createLoader, this.name, this.classname);
        } else if (this.classname != null) {
            throw new BuildException("You must not specify classname together with file or resource.", getLocation());
        } else {
            if (this.file != null) {
                URL fileToURL = fileToURL();
                if (fileToURL == null) {
                    return;
                }
                enumeration = new Enumeration(this, fileToURL) { // from class: org.apache.tools.ant.taskdefs.Definer.1
                    private boolean more = true;
                    private final Definer this$0;
                    private final URL val$url;

                    {
                        this.this$0 = this;
                        this.val$url = fileToURL;
                    }

                    @Override // java.util.Enumeration
                    public boolean hasMoreElements() {
                        return this.more;
                    }

                    @Override // java.util.Enumeration
                    public Object nextElement() throws NoSuchElementException {
                        if (this.more) {
                            this.more = false;
                            return this.val$url;
                        }
                        throw new NoSuchElementException();
                    }
                };
            } else {
                enumeration = resourceToURLs(createLoader);
            }
            while (enumeration.hasMoreElements()) {
                URL url = (URL) enumeration.nextElement();
                int i = this.format;
                if (url.toString().toLowerCase(Locale.ENGLISH).endsWith(".xml")) {
                    i = 1;
                }
                if (i == 0) {
                    loadProperties(createLoader, url);
                    return;
                } else if (resourceStack.getStack().get(url) != null) {
                    log(new StringBuffer().append("Warning: Recursive loading of ").append(url).append(" ignored").append(" at ").append(getLocation()).append(" originally loaded at ").append(resourceStack.getStack().get(url)).toString(), 1);
                } else {
                    try {
                        resourceStack.getStack().put(url, getLocation());
                        loadAntlib(createLoader, url);
                        resourceStack.getStack().remove(url);
                    } catch (Throwable th) {
                        resourceStack.getStack().remove(url);
                        throw th;
                    }
                }
            }
        }
    }

    public String getClassname() {
        return this.classname;
    }

    public File getFile() {
        return this.file;
    }

    public String getName() {
        return this.name;
    }

    public String getResource() {
        return this.resource;
    }

    protected void loadProperties(ClassLoader classLoader, URL url) {
        InputStream inputStream = null;
        try {
            try {
                inputStream = url.openStream();
                if (inputStream == null) {
                    log(new StringBuffer().append("Could not load definitions from ").append(url).toString(), 1);
                    return;
                }
                Properties properties = new Properties();
                properties.load(inputStream);
                Enumeration keys = properties.keys();
                while (keys.hasMoreElements()) {
                    this.name = (String) keys.nextElement();
                    this.classname = properties.getProperty(this.name);
                    addDefinition(classLoader, this.name, this.classname);
                }
            } catch (IOException e) {
                throw new BuildException(e, getLocation());
            }
        } finally {
            FileUtils.close(inputStream);
        }
    }

    public void setAdaptTo(String str) {
        this.adaptTo = str;
    }

    protected void setAdaptToClass(Class cls) {
        this.adaptToClass = cls;
    }

    public void setAdapter(String str) {
        this.adapter = str;
    }

    protected void setAdapterClass(Class cls) {
        this.adapterClass = cls;
    }

    public void setAntlib(String str) {
        if (this.definerSet) {
            tooManyDefinitions();
        }
        if (!str.startsWith("antlib:")) {
            throw new BuildException("Invalid antlib attribute - it must start with antlib:");
        }
        setURI(str);
        this.resource = new StringBuffer().append(str.substring("antlib:".length()).replace('.', '/')).append(ANTLIB_XML).toString();
        this.definerSet = true;
    }

    public void setClassname(String str) {
        this.classname = str;
    }

    public void setFile(File file) {
        if (this.definerSet) {
            tooManyDefinitions();
        }
        this.definerSet = true;
        this.file = file;
    }

    public void setFormat(Format format) {
        this.format = format.getIndex();
    }

    public void setName(String str) {
        if (this.definerSet) {
            tooManyDefinitions();
        }
        this.definerSet = true;
        this.name = str;
    }

    public void setOnError(OnError onError) {
        this.onError = onError.getIndex();
    }

    public void setResource(String str) {
        if (this.definerSet) {
            tooManyDefinitions();
        }
        this.definerSet = true;
        this.resource = str;
    }

    protected void setRestrict(boolean z) {
        this.restrict = z;
    }
}
