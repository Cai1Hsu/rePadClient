package org.apache.tools.ant.helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Locale;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.IntrospectionHelper;
import org.apache.tools.ant.Location;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.RuntimeConfigurable;
import org.apache.tools.ant.Target;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.TaskContainer;
import org.apache.tools.ant.TypeAdapter;
import org.apache.tools.ant.UnknownElement;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JAXPUtils;
import org.xml.sax.AttributeList;
import org.xml.sax.DocumentHandler;
import org.xml.sax.HandlerBase;
import org.xml.sax.InputSource;
import org.xml.sax.Locator;
import org.xml.sax.Parser;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xml.sax.helpers.XMLReaderAdapter;

/* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelperImpl.class */
public class ProjectHelperImpl extends ProjectHelper {
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();
    private File buildFile;
    private File buildFileParent;
    private Target implicitTarget = new Target();
    private Locator locator;
    private Parser parser;
    private Project project;

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelperImpl$AbstractHandler.class */
    static class AbstractHandler extends HandlerBase {
        ProjectHelperImpl helperImpl;
        protected DocumentHandler parentHandler;

        public AbstractHandler(ProjectHelperImpl projectHelperImpl, DocumentHandler documentHandler) {
            this.parentHandler = documentHandler;
            this.helperImpl = projectHelperImpl;
            projectHelperImpl.parser.setDocumentHandler(this);
        }

        @Override // org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void characters(char[] cArr, int i, int i2) throws SAXParseException {
            String trim = new String(cArr, i, i2).trim();
            if (trim.length() > 0) {
                throw new SAXParseException(new StringBuffer().append("Unexpected text \"").append(trim).append("\"").toString(), this.helperImpl.locator);
            }
        }

        @Override // org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void endElement(String str) throws SAXException {
            this.helperImpl.parser.setDocumentHandler(this.parentHandler);
        }

        @Override // org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void startElement(String str, AttributeList attributeList) throws SAXParseException {
            throw new SAXParseException(new StringBuffer().append("Unexpected element \"").append(str).append("\"").toString(), this.helperImpl.locator);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelperImpl$DataTypeHandler.class */
    static class DataTypeHandler extends AbstractHandler {
        private Object element;
        private Target target;
        private RuntimeConfigurable wrapper = null;

        public DataTypeHandler(ProjectHelperImpl projectHelperImpl, DocumentHandler documentHandler, Target target) {
            super(projectHelperImpl, documentHandler);
            this.target = target;
        }

        @Override // org.apache.tools.ant.helper.ProjectHelperImpl.AbstractHandler, org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void characters(char[] cArr, int i, int i2) {
            this.wrapper.addText(cArr, i, i2);
        }

        public void init(String str, AttributeList attributeList) throws SAXParseException {
            try {
                this.element = this.helperImpl.project.createDataType(str);
                if (this.element == null) {
                    throw new BuildException(new StringBuffer().append("Unknown data type ").append(str).toString());
                }
                this.wrapper = new RuntimeConfigurable(this.element, str);
                this.wrapper.setAttributes(attributeList);
                this.target.addDataType(this.wrapper);
            } catch (BuildException e) {
                throw new SAXParseException(e.getMessage(), this.helperImpl.locator, e);
            }
        }

        @Override // org.apache.tools.ant.helper.ProjectHelperImpl.AbstractHandler, org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void startElement(String str, AttributeList attributeList) throws SAXParseException {
            new NestedElementHandler(this.helperImpl, this, this.element, this.wrapper, this.target).init(str, attributeList);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelperImpl$DescriptionHandler.class */
    static class DescriptionHandler extends AbstractHandler {
        public DescriptionHandler(ProjectHelperImpl projectHelperImpl, DocumentHandler documentHandler) {
            super(projectHelperImpl, documentHandler);
        }

        @Override // org.apache.tools.ant.helper.ProjectHelperImpl.AbstractHandler, org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void characters(char[] cArr, int i, int i2) {
            String str = new String(cArr, i, i2);
            String description = this.helperImpl.project.getDescription();
            if (description == null) {
                this.helperImpl.project.setDescription(str);
            } else {
                this.helperImpl.project.setDescription(new StringBuffer().append(description).append(str).toString());
            }
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler.class */
    static class NestedElementHandler extends AbstractHandler {
        private Object child;
        private RuntimeConfigurable childWrapper = null;
        private Object parent;
        private RuntimeConfigurable parentWrapper;
        private Target target;

        public NestedElementHandler(ProjectHelperImpl projectHelperImpl, DocumentHandler documentHandler, Object obj, RuntimeConfigurable runtimeConfigurable, Target target) {
            super(projectHelperImpl, documentHandler);
            if (obj instanceof TypeAdapter) {
                this.parent = ((TypeAdapter) obj).getProxy();
            } else {
                this.parent = obj;
            }
            this.parentWrapper = runtimeConfigurable;
            this.target = target;
        }

        @Override // org.apache.tools.ant.helper.ProjectHelperImpl.AbstractHandler, org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void characters(char[] cArr, int i, int i2) {
            this.childWrapper.addText(cArr, i, i2);
        }

        public void init(String str, AttributeList attributeList) throws SAXParseException {
            IntrospectionHelper helper = IntrospectionHelper.getHelper(this.helperImpl.project, this.parent.getClass());
            try {
                String lowerCase = str.toLowerCase(Locale.ENGLISH);
                if (this.parent instanceof UnknownElement) {
                    UnknownElement unknownElement = new UnknownElement(lowerCase);
                    unknownElement.setProject(this.helperImpl.project);
                    ((UnknownElement) this.parent).addChild(unknownElement);
                    this.child = unknownElement;
                } else {
                    this.child = helper.createElement(this.helperImpl.project, this.parent, lowerCase);
                }
                this.helperImpl.configureId(this.child, attributeList);
                this.childWrapper = new RuntimeConfigurable(this.child, str);
                this.childWrapper.setAttributes(attributeList);
                this.parentWrapper.addChild(this.childWrapper);
            } catch (BuildException e) {
                throw new SAXParseException(e.getMessage(), this.helperImpl.locator, e);
            }
        }

        @Override // org.apache.tools.ant.helper.ProjectHelperImpl.AbstractHandler, org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void startElement(String str, AttributeList attributeList) throws SAXParseException {
            if (this.child instanceof TaskContainer) {
                new TaskHandler(this.helperImpl, this, (TaskContainer) this.child, this.childWrapper, this.target).init(str, attributeList);
            } else {
                new NestedElementHandler(this.helperImpl, this, this.child, this.childWrapper, this.target).init(str, attributeList);
            }
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelperImpl$ProjectHandler.class */
    static class ProjectHandler extends AbstractHandler {
        public ProjectHandler(ProjectHelperImpl projectHelperImpl, DocumentHandler documentHandler) {
            super(projectHelperImpl, documentHandler);
        }

        private void handleTarget(String str, AttributeList attributeList) throws SAXParseException {
            new TargetHandler(this.helperImpl, this).init(str, attributeList);
        }

        public void init(String str, AttributeList attributeList) throws SAXParseException {
            String str2 = null;
            String str3 = null;
            String str4 = null;
            String str5 = null;
            for (int i = 0; i < attributeList.getLength(); i++) {
                String name = attributeList.getName(i);
                String value = attributeList.getValue(i);
                if (name.equals("default")) {
                    str2 = value;
                } else if (name.equals("name")) {
                    str3 = value;
                } else if (name.equals("id")) {
                    str4 = value;
                } else if (!name.equals(MagicNames.PROJECT_BASEDIR)) {
                    throw new SAXParseException(new StringBuffer().append("Unexpected attribute \"").append(attributeList.getName(i)).append("\"").toString(), this.helperImpl.locator);
                } else {
                    str5 = value;
                }
            }
            if (str2 == null || str2.equals("")) {
                throw new BuildException("The default attribute is required");
            }
            this.helperImpl.project.setDefault(str2);
            if (str3 != null) {
                this.helperImpl.project.setName(str3);
                this.helperImpl.project.addReference(str3, this.helperImpl.project);
            }
            if (str4 != null) {
                this.helperImpl.project.addReference(str4, this.helperImpl.project);
            }
            if (this.helperImpl.project.getProperty(MagicNames.PROJECT_BASEDIR) != null) {
                this.helperImpl.project.setBasedir(this.helperImpl.project.getProperty(MagicNames.PROJECT_BASEDIR));
            } else if (str5 == null) {
                this.helperImpl.project.setBasedir(this.helperImpl.buildFileParent.getAbsolutePath());
            } else if (new File(str5).isAbsolute()) {
                this.helperImpl.project.setBasedir(str5);
            } else {
                this.helperImpl.project.setBaseDir(ProjectHelperImpl.FILE_UTILS.resolveFile(this.helperImpl.buildFileParent, str5));
            }
            this.helperImpl.project.addTarget("", this.helperImpl.implicitTarget);
        }

        @Override // org.apache.tools.ant.helper.ProjectHelperImpl.AbstractHandler, org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void startElement(String str, AttributeList attributeList) throws SAXParseException {
            if (str.equals("target")) {
                handleTarget(str, attributeList);
            } else {
                ProjectHelperImpl.handleElement(this.helperImpl, this, this.helperImpl.implicitTarget, str, attributeList);
            }
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelperImpl$RootHandler.class */
    static class RootHandler extends HandlerBase {
        ProjectHelperImpl helperImpl;

        public RootHandler(ProjectHelperImpl projectHelperImpl) {
            this.helperImpl = projectHelperImpl;
        }

        @Override // org.xml.sax.HandlerBase, org.xml.sax.EntityResolver
        public InputSource resolveEntity(String str, String str2) {
            InputSource inputSource;
            this.helperImpl.project.log(new StringBuffer().append("resolving systemId: ").append(str2).toString(), 3);
            if (str2.startsWith("file:")) {
                String fromURI = ProjectHelperImpl.FILE_UTILS.fromURI(str2);
                File file = new File(fromURI);
                File file2 = file;
                if (!file.isAbsolute()) {
                    file2 = ProjectHelperImpl.FILE_UTILS.resolveFile(this.helperImpl.buildFileParent, fromURI);
                    this.helperImpl.project.log(new StringBuffer().append("Warning: '").append(str2).append("' in ").append(this.helperImpl.buildFile).append(" should be expressed simply as '").append(fromURI.replace('\\', '/')).append("' for compliance with other XML tools").toString(), 1);
                }
                try {
                    InputSource inputSource2 = new InputSource(new FileInputStream(file2));
                    inputSource2.setSystemId(ProjectHelperImpl.FILE_UTILS.toURI(file2.getAbsolutePath()));
                    inputSource = inputSource2;
                } catch (FileNotFoundException e) {
                    this.helperImpl.project.log(new StringBuffer().append(file2.getAbsolutePath()).append(" could not be found").toString(), 1);
                }
                return inputSource;
            }
            inputSource = null;
            return inputSource;
        }

        @Override // org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void setDocumentLocator(Locator locator) {
            this.helperImpl.locator = locator;
        }

        @Override // org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void startElement(String str, AttributeList attributeList) throws SAXParseException {
            if (str.equals("project")) {
                new ProjectHandler(this.helperImpl, this).init(str, attributeList);
                return;
            }
            throw new SAXParseException("Config file is not of expected XML type", this.helperImpl.locator);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelperImpl$TargetHandler.class */
    static class TargetHandler extends AbstractHandler {
        private Target target;

        public TargetHandler(ProjectHelperImpl projectHelperImpl, DocumentHandler documentHandler) {
            super(projectHelperImpl, documentHandler);
        }

        public void init(String str, AttributeList attributeList) throws SAXParseException {
            String str2 = null;
            String str3 = "";
            String str4 = null;
            String str5 = null;
            String str6 = null;
            String str7 = null;
            for (int i = 0; i < attributeList.getLength(); i++) {
                String name = attributeList.getName(i);
                String value = attributeList.getValue(i);
                if (name.equals("name")) {
                    str2 = value;
                    if (value.equals("")) {
                        throw new BuildException("name attribute must not be empty", new Location(this.helperImpl.locator));
                    }
                } else if (name.equals("depends")) {
                    str3 = value;
                } else if (name.equals("if")) {
                    str4 = value;
                } else if (name.equals("unless")) {
                    str5 = value;
                } else if (name.equals("id")) {
                    str6 = value;
                } else if (!name.equals("description")) {
                    throw new SAXParseException(new StringBuffer().append("Unexpected attribute \"").append(name).append("\"").toString(), this.helperImpl.locator);
                } else {
                    str7 = value;
                }
            }
            if (str2 == null) {
                throw new SAXParseException("target element appears without a name attribute", this.helperImpl.locator);
            }
            this.target = new Target();
            this.target.addDependency("");
            this.target.setName(str2);
            this.target.setIf(str4);
            this.target.setUnless(str5);
            this.target.setDescription(str7);
            this.helperImpl.project.addTarget(str2, this.target);
            if (str6 != null && !str6.equals("")) {
                this.helperImpl.project.addReference(str6, this.target);
            }
            if (str3.length() <= 0) {
                return;
            }
            this.target.setDepends(str3);
        }

        @Override // org.apache.tools.ant.helper.ProjectHelperImpl.AbstractHandler, org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void startElement(String str, AttributeList attributeList) throws SAXParseException {
            ProjectHelperImpl.handleElement(this.helperImpl, this, this.target, str, attributeList);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelperImpl$TaskHandler.class */
    static class TaskHandler extends AbstractHandler {
        private TaskContainer container;
        private RuntimeConfigurable parentWrapper;
        private Target target;
        private Task task;
        private RuntimeConfigurable wrapper = null;

        public TaskHandler(ProjectHelperImpl projectHelperImpl, DocumentHandler documentHandler, TaskContainer taskContainer, RuntimeConfigurable runtimeConfigurable, Target target) {
            super(projectHelperImpl, documentHandler);
            this.container = taskContainer;
            this.parentWrapper = runtimeConfigurable;
            this.target = target;
        }

        @Override // org.apache.tools.ant.helper.ProjectHelperImpl.AbstractHandler, org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void characters(char[] cArr, int i, int i2) {
            this.wrapper.addText(cArr, i, i2);
        }

        public void init(String str, AttributeList attributeList) throws SAXParseException {
            try {
                this.task = this.helperImpl.project.createTask(str);
            } catch (BuildException e) {
            }
            if (this.task == null) {
                this.task = new UnknownElement(str);
                this.task.setProject(this.helperImpl.project);
                this.task.setTaskName(str);
            }
            this.task.setLocation(new Location(this.helperImpl.locator));
            this.helperImpl.configureId(this.task, attributeList);
            this.task.setOwningTarget(this.target);
            this.container.addTask(this.task);
            this.task.init();
            this.wrapper = this.task.getRuntimeConfigurableWrapper();
            this.wrapper.setAttributes(attributeList);
            if (this.parentWrapper != null) {
                this.parentWrapper.addChild(this.wrapper);
            }
        }

        @Override // org.apache.tools.ant.helper.ProjectHelperImpl.AbstractHandler, org.xml.sax.HandlerBase, org.xml.sax.DocumentHandler
        public void startElement(String str, AttributeList attributeList) throws SAXParseException {
            if (this.task instanceof TaskContainer) {
                new TaskHandler(this.helperImpl, this, (TaskContainer) this.task, this.wrapper, this.target).init(str, attributeList);
            } else {
                new NestedElementHandler(this.helperImpl, this, this.task, this.wrapper, this.target).init(str, attributeList);
            }
        }
    }

    public ProjectHelperImpl() {
        this.implicitTarget.setName("");
    }

    public void configureId(Object obj, AttributeList attributeList) {
        String value = attributeList.getValue("id");
        if (value != null) {
            this.project.addReference(value, obj);
        }
    }

    public static void handleElement(ProjectHelperImpl projectHelperImpl, DocumentHandler documentHandler, Target target, String str, AttributeList attributeList) throws SAXParseException {
        if (str.equals("description")) {
            new DescriptionHandler(projectHelperImpl, documentHandler);
        } else if (projectHelperImpl.project.getDataTypeDefinitions().get(str) != null) {
            new DataTypeHandler(projectHelperImpl, documentHandler, target).init(str, attributeList);
        } else {
            new TaskHandler(projectHelperImpl, documentHandler, target, null, target).init(str, attributeList);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x0148  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x01aa  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x01b3  */
    @Override // org.apache.tools.ant.ProjectHelper
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void parse(Project project, Object obj) throws BuildException {
        IOException e;
        FileInputStream fileInputStream;
        UnsupportedEncodingException e2;
        FileInputStream fileInputStream2;
        FileNotFoundException e3;
        FileInputStream fileInputStream3;
        SAXException e4;
        FileInputStream fileInputStream4;
        Exception exception;
        SAXParseException e5;
        FileInputStream fileInputStream5;
        Exception exception2;
        String uri;
        FileInputStream fileInputStream6;
        InputSource inputSource;
        if (!(obj instanceof File)) {
            throw new BuildException("Only File source supported by default plugin");
        }
        File file = (File) obj;
        this.project = project;
        this.buildFile = new File(file.getAbsolutePath());
        this.buildFileParent = new File(this.buildFile.getParent());
        FileInputStream fileInputStream7 = null;
        try {
            try {
                try {
                    this.parser = JAXPUtils.getParser();
                } catch (BuildException e6) {
                    this.parser = new XMLReaderAdapter(JAXPUtils.getXMLReader());
                }
                uri = FILE_UTILS.toURI(file.getAbsolutePath());
                fileInputStream6 = new FileInputStream(file);
                try {
                    inputSource = new InputSource(fileInputStream6);
                } catch (FileNotFoundException e7) {
                    fileInputStream3 = fileInputStream6;
                    e3 = e7;
                } catch (UnsupportedEncodingException e8) {
                    e2 = e8;
                    fileInputStream2 = fileInputStream6;
                } catch (IOException e9) {
                    fileInputStream = fileInputStream6;
                    e = e9;
                } catch (SAXParseException e10) {
                    e5 = e10;
                    fileInputStream5 = fileInputStream6;
                } catch (SAXException e11) {
                    fileInputStream4 = fileInputStream6;
                    e4 = e11;
                } catch (Throwable th) {
                    th = th;
                    fileInputStream7 = fileInputStream6;
                }
            } catch (FileNotFoundException e12) {
                e3 = e12;
                fileInputStream3 = null;
                FileInputStream fileInputStream8 = fileInputStream3;
                FileInputStream fileInputStream9 = fileInputStream3;
                throw new BuildException(e3);
            } catch (UnsupportedEncodingException e13) {
                e2 = e13;
                fileInputStream2 = null;
                FileInputStream fileInputStream10 = fileInputStream2;
                FileInputStream fileInputStream11 = fileInputStream2;
                throw new BuildException("Encoding of project file is invalid.", e2);
            } catch (IOException e14) {
                e = e14;
                fileInputStream = null;
                FileInputStream fileInputStream12 = fileInputStream;
                FileInputStream fileInputStream13 = fileInputStream;
                FileInputStream fileInputStream14 = fileInputStream;
                FileInputStream fileInputStream15 = fileInputStream;
                throw new BuildException(new StringBuffer().append("Error reading project file: ").append(e.getMessage()).toString(), e);
            } catch (SAXParseException e15) {
                e5 = e15;
                fileInputStream5 = null;
                FileInputStream fileInputStream16 = fileInputStream5;
                Location location = new Location(e5.getSystemId(), e5.getLineNumber(), e5.getColumnNumber());
                FileInputStream fileInputStream17 = fileInputStream5;
                exception2 = e5.getException();
                FileInputStream fileInputStream18 = fileInputStream5;
                if (exception2 instanceof BuildException) {
                    FileInputStream fileInputStream19 = fileInputStream5;
                    BuildException buildException = new BuildException(e5.getMessage(), exception2, location);
                    FileInputStream fileInputStream20 = fileInputStream5;
                    throw buildException;
                }
                FileInputStream fileInputStream21 = fileInputStream5;
                BuildException buildException2 = (BuildException) exception2;
                FileInputStream fileInputStream22 = fileInputStream5;
                if (buildException2.getLocation() == Location.UNKNOWN_LOCATION) {
                    FileInputStream fileInputStream23 = fileInputStream5;
                    buildException2.setLocation(location);
                }
                FileInputStream fileInputStream24 = fileInputStream5;
                throw buildException2;
            } catch (SAXException e16) {
                e4 = e16;
                fileInputStream4 = null;
                exception = e4.getException();
                FileInputStream fileInputStream25 = fileInputStream4;
                if (!(exception instanceof BuildException)) {
                    FileInputStream fileInputStream26 = fileInputStream4;
                    throw ((BuildException) exception);
                }
                FileInputStream fileInputStream27 = fileInputStream4;
                FileInputStream fileInputStream28 = fileInputStream4;
                BuildException buildException3 = new BuildException(e4.getMessage(), exception);
                FileInputStream fileInputStream29 = fileInputStream4;
                throw buildException3;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            inputSource.setSystemId(uri);
            project.log(new StringBuffer().append("parsing buildfile ").append(file).append(" with URI = ").append(uri).toString(), 3);
            RootHandler rootHandler = new RootHandler(this);
            this.parser.setDocumentHandler(rootHandler);
            this.parser.setEntityResolver(rootHandler);
            this.parser.setErrorHandler(rootHandler);
            this.parser.setDTDHandler(rootHandler);
            this.parser.parse(inputSource);
            FileUtils.close(fileInputStream6);
        } catch (FileNotFoundException e17) {
            e3 = e17;
            fileInputStream3 = fileInputStream6;
            FileInputStream fileInputStream82 = fileInputStream3;
            FileInputStream fileInputStream92 = fileInputStream3;
            throw new BuildException(e3);
        } catch (UnsupportedEncodingException e18) {
            e2 = e18;
            fileInputStream2 = fileInputStream6;
            FileInputStream fileInputStream102 = fileInputStream2;
            FileInputStream fileInputStream112 = fileInputStream2;
            throw new BuildException("Encoding of project file is invalid.", e2);
        } catch (IOException e19) {
            fileInputStream = fileInputStream6;
            e = e19;
            FileInputStream fileInputStream122 = fileInputStream;
            FileInputStream fileInputStream132 = fileInputStream;
            FileInputStream fileInputStream142 = fileInputStream;
            FileInputStream fileInputStream152 = fileInputStream;
            throw new BuildException(new StringBuffer().append("Error reading project file: ").append(e.getMessage()).toString(), e);
        } catch (SAXParseException e20) {
            e5 = e20;
            fileInputStream5 = fileInputStream6;
            FileInputStream fileInputStream162 = fileInputStream5;
            Location location2 = new Location(e5.getSystemId(), e5.getLineNumber(), e5.getColumnNumber());
            FileInputStream fileInputStream172 = fileInputStream5;
            exception2 = e5.getException();
            FileInputStream fileInputStream182 = fileInputStream5;
            if (exception2 instanceof BuildException) {
            }
        } catch (SAXException e21) {
            fileInputStream4 = fileInputStream6;
            e4 = e21;
            exception = e4.getException();
            FileInputStream fileInputStream252 = fileInputStream4;
            if (!(exception instanceof BuildException)) {
            }
        } catch (Throwable th3) {
            th = th3;
            fileInputStream7 = fileInputStream6;
            FileUtils.close(fileInputStream7);
            throw th;
        }
    }
}
