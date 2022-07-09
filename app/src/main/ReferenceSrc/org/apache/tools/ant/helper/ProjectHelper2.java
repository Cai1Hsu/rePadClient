package org.apache.tools.ant.helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Stack;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ExtensionPoint;
import org.apache.tools.ant.Location;
import org.apache.tools.ant.MagicNames;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectHelper;
import org.apache.tools.ant.RuntimeConfigurable;
import org.apache.tools.ant.Target;
import org.apache.tools.ant.Task;
import org.apache.tools.ant.UnknownElement;
import org.apache.tools.ant.types.Resource;
import org.apache.tools.ant.types.resources.FileProvider;
import org.apache.tools.ant.types.resources.URLProvider;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.JAXPUtils;
import org.apache.tools.zip.ZipFile;
import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.Locator;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;

/* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelper2.class */
public class ProjectHelper2 extends ProjectHelper {
    private static final String REFID_CONTEXT = "ant.parsing.context";
    public static final String REFID_TARGETS = "ant.targets";
    static Class class$org$apache$tools$ant$types$resources$FileProvider;
    static Class class$org$apache$tools$ant$types$resources$URLProvider;
    private static AntHandler elementHandler = new ElementHandler();
    private static AntHandler targetHandler = new TargetHandler();
    private static AntHandler mainHandler = new MainHandler();
    private static AntHandler projectHandler = new ProjectHandler();
    private static final FileUtils FILE_UTILS = FileUtils.getFileUtils();

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelper2$AntHandler.class */
    public static class AntHandler {
        public void characters(char[] cArr, int i, int i2, AntXMLContext antXMLContext) throws SAXParseException {
            String trim = new String(cArr, i, i2).trim();
            if (trim.length() > 0) {
                throw new SAXParseException(new StringBuffer().append("Unexpected text \"").append(trim).append("\"").toString(), antXMLContext.getLocator());
            }
        }

        protected void checkNamespace(String str) {
        }

        public void onEndChild(String str, String str2, String str3, AntXMLContext antXMLContext) throws SAXParseException {
        }

        public void onEndElement(String str, String str2, AntXMLContext antXMLContext) {
        }

        public AntHandler onStartChild(String str, String str2, String str3, Attributes attributes, AntXMLContext antXMLContext) throws SAXParseException {
            throw new SAXParseException(new StringBuffer().append("Unexpected element \"").append(str3).append(" \"").toString(), antXMLContext.getLocator());
        }

        public void onStartElement(String str, String str2, String str3, Attributes attributes, AntXMLContext antXMLContext) throws SAXParseException {
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelper2$ElementHandler.class */
    public static class ElementHandler extends AntHandler {
        @Override // org.apache.tools.ant.helper.ProjectHelper2.AntHandler
        public void characters(char[] cArr, int i, int i2, AntXMLContext antXMLContext) throws SAXParseException {
            antXMLContext.currentWrapper().addText(cArr, i, i2);
        }

        @Override // org.apache.tools.ant.helper.ProjectHelper2.AntHandler
        public void onEndElement(String str, String str2, AntXMLContext antXMLContext) {
            antXMLContext.popWrapper();
        }

        @Override // org.apache.tools.ant.helper.ProjectHelper2.AntHandler
        public AntHandler onStartChild(String str, String str2, String str3, Attributes attributes, AntXMLContext antXMLContext) throws SAXParseException {
            return ProjectHelper2.elementHandler;
        }

        @Override // org.apache.tools.ant.helper.ProjectHelper2.AntHandler
        public void onStartElement(String str, String str2, String str3, Attributes attributes, AntXMLContext antXMLContext) throws SAXParseException {
            String str4;
            String str5;
            RuntimeConfigurable currentWrapper = antXMLContext.currentWrapper();
            Object obj = null;
            if (currentWrapper != null) {
                obj = currentWrapper.getProxy();
            }
            UnknownElement unknownElement = new UnknownElement(str2);
            unknownElement.setProject(antXMLContext.getProject());
            unknownElement.setNamespace(str);
            unknownElement.setQName(str3);
            unknownElement.setTaskType(ProjectHelper.genComponentName(unknownElement.getNamespace(), str2));
            unknownElement.setTaskName(str3);
            unknownElement.setLocation(new Location(antXMLContext.getLocator().getSystemId(), antXMLContext.getLocator().getLineNumber(), antXMLContext.getLocator().getColumnNumber()));
            unknownElement.setOwningTarget(antXMLContext.getCurrentTarget());
            if (obj != null) {
                ((UnknownElement) obj).addChild(unknownElement);
            } else {
                antXMLContext.getCurrentTarget().addTask(unknownElement);
            }
            antXMLContext.configureId(unknownElement, attributes);
            RuntimeConfigurable runtimeConfigurable = new RuntimeConfigurable(unknownElement, unknownElement.getTaskName());
            for (int i = 0; i < attributes.getLength(); i++) {
                String localName = attributes.getLocalName(i);
                String uri = attributes.getURI(i);
                String str6 = localName;
                if (uri != null) {
                    str6 = localName;
                    if (!uri.equals("")) {
                        str6 = localName;
                        if (!uri.equals(str)) {
                            str6 = new StringBuffer().append(uri).append(":").append(attributes.getQName(i)).toString();
                        }
                    }
                }
                String value = attributes.getValue(i);
                if (!ProjectHelper.ANT_TYPE.equals(str6)) {
                    str5 = str6;
                    str4 = value;
                    if (ProjectHelper.ANT_CORE_URI.equals(uri)) {
                        str5 = str6;
                        str4 = value;
                        if (!ProjectHelper.ANT_TYPE.equals(attributes.getLocalName(i))) {
                            continue;
                        }
                    } else {
                        continue;
                    }
                    runtimeConfigurable.setAttribute(str5, str4);
                }
                int indexOf = value.indexOf(":");
                str5 = ProjectHelper.ANT_TYPE;
                str4 = value;
                if (indexOf < 0) {
                    continue;
                } else {
                    String substring = value.substring(0, indexOf);
                    String prefixMapping = antXMLContext.getPrefixMapping(substring);
                    if (prefixMapping == null) {
                        throw new BuildException(new StringBuffer().append("Unable to find XML NS prefix \"").append(substring).append("\"").toString());
                    }
                    str4 = ProjectHelper.genComponentName(prefixMapping, value.substring(indexOf + 1));
                    str5 = ProjectHelper.ANT_TYPE;
                }
                runtimeConfigurable.setAttribute(str5, str4);
            }
            if (currentWrapper != null) {
                currentWrapper.addChild(runtimeConfigurable);
            }
            antXMLContext.pushWrapper(runtimeConfigurable);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelper2$MainHandler.class */
    public static class MainHandler extends AntHandler {
        @Override // org.apache.tools.ant.helper.ProjectHelper2.AntHandler
        public AntHandler onStartChild(String str, String str2, String str3, Attributes attributes, AntXMLContext antXMLContext) throws SAXParseException {
            if (!str2.equals("project") || (!str.equals("") && !str.equals(ProjectHelper.ANT_CORE_URI))) {
                if (!str2.equals(str3)) {
                    throw new SAXParseException(new StringBuffer().append("Unexpected element \"").append(str3).append("\" ").append(str2).toString(), antXMLContext.getLocator());
                }
                throw new SAXParseException(new StringBuffer().append("Unexpected element \"{").append(str).append("}").append(str2).append("\" {").append(ProjectHelper.ANT_CORE_URI).append("}").append(str2).toString(), antXMLContext.getLocator());
            }
            return ProjectHelper2.projectHandler;
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelper2$ProjectHandler.class */
    public static class ProjectHandler extends AntHandler {
        @Override // org.apache.tools.ant.helper.ProjectHelper2.AntHandler
        public AntHandler onStartChild(String str, String str2, String str3, Attributes attributes, AntXMLContext antXMLContext) throws SAXParseException {
            return ((str2.equals("target") || str2.equals("extension-point")) && (str.equals("") || str.equals(ProjectHelper.ANT_CORE_URI))) ? ProjectHelper2.targetHandler : ProjectHelper2.elementHandler;
        }

        @Override // org.apache.tools.ant.helper.ProjectHelper2.AntHandler
        public void onStartElement(String str, String str2, String str3, Attributes attributes, AntXMLContext antXMLContext) throws SAXParseException {
            Object url;
            Object buildFileURL;
            String str4;
            boolean z;
            String str5 = null;
            boolean z2 = false;
            Project project = antXMLContext.getProject();
            antXMLContext.getImplicitTarget().setLocation(new Location(antXMLContext.getLocator()));
            int i = 0;
            while (i < attributes.getLength()) {
                String uri = attributes.getURI(i);
                if (uri == null || uri.equals("") || uri.equals(str)) {
                    String localName = attributes.getLocalName(i);
                    String value = attributes.getValue(i);
                    if (localName.equals("default")) {
                        str4 = str5;
                        z = z2;
                        if (value != null) {
                            str4 = str5;
                            z = z2;
                            if (!value.equals("")) {
                                str4 = str5;
                                z = z2;
                                if (!antXMLContext.isIgnoringProjectTag()) {
                                    project.setDefault(value);
                                    str4 = str5;
                                    z = z2;
                                }
                            }
                        }
                    } else if (localName.equals("name")) {
                        str4 = str5;
                        z = z2;
                        if (value != null) {
                            antXMLContext.setCurrentProjectName(value);
                            if (!antXMLContext.isIgnoringProjectTag()) {
                                project.setName(value);
                                project.addReference(value, project);
                                str4 = str5;
                                z = true;
                            } else {
                                str4 = str5;
                                z = true;
                                if (ProjectHelper.isInIncludeMode()) {
                                    str4 = str5;
                                    z = true;
                                    if (!"".equals(value)) {
                                        if (ProjectHelper.getCurrentTargetPrefix() != null) {
                                            str4 = str5;
                                            z = true;
                                            if (ProjectHelper.getCurrentTargetPrefix().length() != 0) {
                                            }
                                        }
                                        ProjectHelper.setCurrentTargetPrefix(value);
                                        str4 = str5;
                                        z = true;
                                    }
                                }
                            }
                        }
                    } else if (localName.equals("id")) {
                        str4 = str5;
                        z = z2;
                        if (value != null) {
                            str4 = str5;
                            z = z2;
                            if (!antXMLContext.isIgnoringProjectTag()) {
                                project.addReference(value, project);
                                str4 = str5;
                                z = z2;
                            }
                        }
                    } else if (!localName.equals(MagicNames.PROJECT_BASEDIR)) {
                        throw new SAXParseException(new StringBuffer().append("Unexpected attribute \"").append(attributes.getQName(i)).append("\"").toString(), antXMLContext.getLocator());
                    } else {
                        str4 = str5;
                        z = z2;
                        if (!antXMLContext.isIgnoringProjectTag()) {
                            str4 = value;
                            z = z2;
                        }
                    }
                } else {
                    z = z2;
                    str4 = str5;
                }
                i++;
                str5 = str4;
                z2 = z;
            }
            String stringBuffer = new StringBuffer().append("ant.file.").append(antXMLContext.getCurrentProjectName()).toString();
            String property = project.getProperty(stringBuffer);
            String stringBuffer2 = new StringBuffer().append("ant.file.type.").append(antXMLContext.getCurrentProjectName()).toString();
            String property2 = project.getProperty(stringBuffer2);
            if (property != null && z2) {
                if (MagicNames.ANT_FILE_TYPE_URL.equals(property2)) {
                    try {
                        url = new URL(property);
                        buildFileURL = antXMLContext.getBuildFileURL();
                    } catch (MalformedURLException e) {
                        throw new BuildException(new StringBuffer().append("failed to parse ").append(property).append(" as URL while looking").append(" at a duplicate project").append(" name.").toString(), e);
                    }
                } else {
                    url = new File(property);
                    buildFileURL = antXMLContext.getBuildFile();
                }
                if (antXMLContext.isIgnoringProjectTag() && !url.equals(buildFileURL)) {
                    project.log(new StringBuffer().append("Duplicated project name in import. Project ").append(antXMLContext.getCurrentProjectName()).append(" defined first in ").append(property).append(" and again in ").append(buildFileURL).toString(), 1);
                }
            }
            if (z2) {
                if (antXMLContext.getBuildFile() != null) {
                    project.setUserProperty(stringBuffer, antXMLContext.getBuildFile().toString());
                    project.setUserProperty(stringBuffer2, "file");
                } else if (antXMLContext.getBuildFileURL() != null) {
                    project.setUserProperty(stringBuffer, antXMLContext.getBuildFileURL().toString());
                    project.setUserProperty(stringBuffer2, MagicNames.ANT_FILE_TYPE_URL);
                }
            }
            if (antXMLContext.isIgnoringProjectTag()) {
                return;
            }
            if (project.getProperty(MagicNames.PROJECT_BASEDIR) != null) {
                project.setBasedir(project.getProperty(MagicNames.PROJECT_BASEDIR));
            } else if (str5 == null) {
                project.setBasedir(antXMLContext.getBuildFileParent().getAbsolutePath());
            } else if (new File(str5).isAbsolute()) {
                project.setBasedir(str5);
            } else {
                project.setBaseDir(ProjectHelper2.FILE_UTILS.resolveFile(antXMLContext.getBuildFileParent(), str5));
            }
            project.addTarget("", antXMLContext.getImplicitTarget());
            antXMLContext.setCurrentTarget(antXMLContext.getImplicitTarget());
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelper2$RootHandler.class */
    public static class RootHandler extends DefaultHandler {
        private Stack antHandlers = new Stack();
        private AntXMLContext context;
        private AntHandler currentHandler;

        public RootHandler(AntXMLContext antXMLContext, AntHandler antHandler) {
            this.currentHandler = null;
            this.currentHandler = antHandler;
            this.antHandlers.push(this.currentHandler);
            this.context = antXMLContext;
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void characters(char[] cArr, int i, int i2) throws SAXParseException {
            this.currentHandler.characters(cArr, i, i2, this.context);
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void endElement(String str, String str2, String str3) throws SAXException {
            this.currentHandler.onEndElement(str, str2, this.context);
            this.currentHandler = (AntHandler) this.antHandlers.pop();
            if (this.currentHandler != null) {
                this.currentHandler.onEndChild(str, str2, str3, this.context);
            }
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void endPrefixMapping(String str) {
            this.context.endPrefixMapping(str);
        }

        public AntHandler getCurrentAntHandler() {
            return this.currentHandler;
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.EntityResolver
        public InputSource resolveEntity(String str, String str2) {
            InputSource inputSource;
            this.context.getProject().log(new StringBuffer().append("resolving systemId: ").append(str2).toString(), 3);
            if (str2.startsWith("file:")) {
                String fromURI = ProjectHelper2.FILE_UTILS.fromURI(str2);
                File file = new File(fromURI);
                File file2 = file;
                if (!file.isAbsolute()) {
                    file2 = ProjectHelper2.FILE_UTILS.resolveFile(this.context.getBuildFileParent(), fromURI);
                    this.context.getProject().log(new StringBuffer().append("Warning: '").append(str2).append("' in ").append(this.context.getBuildFile()).append(" should be expressed simply as '").append(fromURI.replace('\\', '/')).append("' for compliance with other XML tools").toString(), 1);
                }
                this.context.getProject().log(new StringBuffer().append("file=").append(file2).toString(), 4);
                try {
                    InputSource inputSource2 = new InputSource(new FileInputStream(file2));
                    inputSource2.setSystemId(ProjectHelper2.FILE_UTILS.toURI(file2.getAbsolutePath()));
                    inputSource = inputSource2;
                } catch (FileNotFoundException e) {
                    this.context.getProject().log(new StringBuffer().append(file2.getAbsolutePath()).append(" could not be found").toString(), 1);
                }
                return inputSource;
            }
            this.context.getProject().log("could not resolve systemId", 4);
            inputSource = null;
            return inputSource;
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void setDocumentLocator(Locator locator) {
            this.context.setLocator(locator);
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXParseException {
            AntHandler onStartChild = this.currentHandler.onStartChild(str, str2, str3, attributes, this.context);
            this.antHandlers.push(this.currentHandler);
            this.currentHandler = onStartChild;
            this.currentHandler.onStartElement(str, str2, str3, attributes, this.context);
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void startPrefixMapping(String str, String str2) {
            this.context.startPrefixMapping(str, str2);
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/helper/ProjectHelper2$TargetHandler.class */
    public static class TargetHandler extends AntHandler {
        private String getTargetPrefix(AntXMLContext antXMLContext) {
            String str;
            String currentTargetPrefix = ProjectHelper.getCurrentTargetPrefix();
            String str2 = currentTargetPrefix;
            if (currentTargetPrefix != null) {
                str2 = currentTargetPrefix;
                if (currentTargetPrefix.length() == 0) {
                    str2 = null;
                }
            }
            if (str2 != null) {
                str = str2;
            } else {
                String currentProjectName = antXMLContext.getCurrentProjectName();
                str = currentProjectName;
                if ("".equals(currentProjectName)) {
                    str = null;
                }
            }
            return str;
        }

        @Override // org.apache.tools.ant.helper.ProjectHelper2.AntHandler
        public void onEndElement(String str, String str2, AntXMLContext antXMLContext) {
            antXMLContext.setCurrentTarget(antXMLContext.getImplicitTarget());
        }

        @Override // org.apache.tools.ant.helper.ProjectHelper2.AntHandler
        public AntHandler onStartChild(String str, String str2, String str3, Attributes attributes, AntXMLContext antXMLContext) throws SAXParseException {
            return ProjectHelper2.elementHandler;
        }

        @Override // org.apache.tools.ant.helper.ProjectHelper2.AntHandler
        public void onStartElement(String str, String str2, String str3, Attributes attributes, AntXMLContext antXMLContext) throws SAXParseException {
            ProjectHelper.OnMissingExtensionPoint valueOf;
            String str4;
            String str5;
            String str6;
            String str7 = null;
            String str8 = "";
            String str9 = null;
            ProjectHelper.OnMissingExtensionPoint onMissingExtensionPoint = null;
            Project project = antXMLContext.getProject();
            ExtensionPoint target = "target".equals(str2) ? new Target() : new ExtensionPoint();
            target.setProject(project);
            target.setLocation(new Location(antXMLContext.getLocator()));
            antXMLContext.addTarget(target);
            int i = 0;
            while (i < attributes.getLength()) {
                String uri = attributes.getURI(i);
                if (uri == null || uri.equals("") || uri.equals(str)) {
                    String localName = attributes.getLocalName(i);
                    String value = attributes.getValue(i);
                    if (localName.equals("name")) {
                        str4 = str8;
                        str5 = str9;
                        valueOf = onMissingExtensionPoint;
                        str6 = value;
                        if ("".equals(value)) {
                            throw new BuildException("name attribute must not be empty");
                        }
                    } else if (localName.equals("depends")) {
                        str4 = value;
                        str5 = str9;
                        valueOf = onMissingExtensionPoint;
                        str6 = str7;
                    } else if (localName.equals("if")) {
                        target.setIf(value);
                        str4 = str8;
                        str5 = str9;
                        valueOf = onMissingExtensionPoint;
                        str6 = str7;
                    } else if (localName.equals("unless")) {
                        target.setUnless(value);
                        str4 = str8;
                        str5 = str9;
                        valueOf = onMissingExtensionPoint;
                        str6 = str7;
                    } else if (localName.equals("id")) {
                        str4 = str8;
                        str5 = str9;
                        valueOf = onMissingExtensionPoint;
                        str6 = str7;
                        if (value != null) {
                            str4 = str8;
                            str5 = str9;
                            valueOf = onMissingExtensionPoint;
                            str6 = str7;
                            if (!value.equals("")) {
                                antXMLContext.getProject().addReference(value, target);
                                str4 = str8;
                                str5 = str9;
                                valueOf = onMissingExtensionPoint;
                                str6 = str7;
                            }
                        }
                    } else if (localName.equals("description")) {
                        target.setDescription(value);
                        str4 = str8;
                        str5 = str9;
                        valueOf = onMissingExtensionPoint;
                        str6 = str7;
                    } else if (localName.equals("extensionOf")) {
                        str4 = str8;
                        str5 = value;
                        valueOf = onMissingExtensionPoint;
                        str6 = str7;
                    } else if (!localName.equals("onMissingExtensionPoint")) {
                        throw new SAXParseException(new StringBuffer().append("Unexpected attribute \"").append(localName).append("\"").toString(), antXMLContext.getLocator());
                    } else {
                        try {
                            valueOf = ProjectHelper.OnMissingExtensionPoint.valueOf(value);
                            str4 = str8;
                            str5 = str9;
                            str6 = str7;
                        } catch (IllegalArgumentException e) {
                            throw new BuildException(new StringBuffer().append("Invalid onMissingExtensionPoint ").append(value).toString());
                        }
                    }
                } else {
                    str6 = str7;
                    valueOf = onMissingExtensionPoint;
                    str5 = str9;
                    str4 = str8;
                }
                i++;
                str8 = str4;
                str9 = str5;
                onMissingExtensionPoint = valueOf;
                str7 = str6;
            }
            if (str7 == null) {
                throw new SAXParseException("target element appears without a name attribute", antXMLContext.getLocator());
            }
            String str10 = null;
            boolean z = antXMLContext.isIgnoringProjectTag() && ProjectHelper.isInIncludeMode();
            String currentPrefixSeparator = ProjectHelper.getCurrentPrefixSeparator();
            String str11 = str7;
            if (z) {
                str10 = getTargetPrefix(antXMLContext);
                if (str10 == null) {
                    throw new BuildException(new StringBuffer().append("can't include build file ").append(antXMLContext.getBuildFileURL()).append(", no as attribute has been given").append(" and the project tag doesn't").append(" specify a name attribute").toString());
                }
                str11 = new StringBuffer().append(str10).append(currentPrefixSeparator).append(str7).toString();
            }
            if (antXMLContext.getCurrentTargets().get(str11) != null) {
                throw new BuildException(new StringBuffer().append("Duplicate target '").append(str11).append("'").toString(), target.getLocation());
            }
            boolean z2 = false;
            if (project.getTargets().containsKey(str11)) {
                project.log(new StringBuffer().append("Already defined in main or a previous import, ignore ").append(str11).toString(), 3);
            } else {
                target.setName(str11);
                antXMLContext.getCurrentTargets().put(str11, target);
                project.addOrReplaceTarget(str11, target);
                z2 = true;
            }
            if (str8.length() > 0) {
                if (!z) {
                    target.setDepends(str8);
                } else {
                    for (Object obj : Target.parseDepends(str8, str11, "depends")) {
                        target.addDependency(new StringBuffer().append(str10).append(currentPrefixSeparator).append(obj).toString());
                    }
                }
            }
            String str12 = str10;
            if (!z) {
                str12 = str10;
                if (antXMLContext.isIgnoringProjectTag()) {
                    String targetPrefix = getTargetPrefix(antXMLContext);
                    str12 = targetPrefix;
                    if (targetPrefix != null) {
                        String stringBuffer = new StringBuffer().append(targetPrefix).append(currentPrefixSeparator).append(str11).toString();
                        Target target2 = z2 ? new Target(target) : target;
                        target2.setName(stringBuffer);
                        antXMLContext.getCurrentTargets().put(stringBuffer, target2);
                        project.addOrReplaceTarget(stringBuffer, target2);
                        str12 = targetPrefix;
                    }
                }
            }
            if (onMissingExtensionPoint != null && str9 == null) {
                throw new BuildException("onMissingExtensionPoint attribute cannot be specified unless extensionOf is specified", target.getLocation());
            }
            if (str9 == null) {
                return;
            }
            ProjectHelper projectHelper = (ProjectHelper) antXMLContext.getProject().getReference("ant.projectHelper");
            for (String str13 : Target.parseDepends(str9, str11, "extensionOf")) {
                String str14 = str13;
                if (ProjectHelper.isInIncludeMode()) {
                    str14 = new StringBuffer().append(str12).append(currentPrefixSeparator).append(str13).toString();
                }
                ProjectHelper.OnMissingExtensionPoint onMissingExtensionPoint2 = onMissingExtensionPoint;
                if (onMissingExtensionPoint == null) {
                    onMissingExtensionPoint2 = ProjectHelper.OnMissingExtensionPoint.FAIL;
                }
                projectHelper.getExtensionStack().add(new String[]{str14, str11, onMissingExtensionPoint2.name()});
                onMissingExtensionPoint = onMissingExtensionPoint2;
            }
        }
    }

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    protected static AntHandler getElementHandler() {
        return elementHandler;
    }

    protected static AntHandler getMainHandler() {
        return mainHandler;
    }

    protected static AntHandler getProjectHandler() {
        return projectHandler;
    }

    protected static AntHandler getTargetHandler() {
        return targetHandler;
    }

    protected static void setElementHandler(AntHandler antHandler) {
        elementHandler = antHandler;
    }

    protected static void setMainHandler(AntHandler antHandler) {
        mainHandler = antHandler;
    }

    protected static void setProjectHandler(AntHandler antHandler) {
        projectHandler = antHandler;
    }

    protected static void setTargetHandler(AntHandler antHandler) {
        targetHandler = antHandler;
    }

    @Override // org.apache.tools.ant.ProjectHelper
    public boolean canParseAntlibDescriptor(Resource resource) {
        return true;
    }

    @Override // org.apache.tools.ant.ProjectHelper
    public void parse(Project project, Object obj) throws BuildException {
        getImportStack().addElement(obj);
        AntXMLContext antXMLContext = (AntXMLContext) project.getReference(REFID_CONTEXT);
        AntXMLContext antXMLContext2 = antXMLContext;
        if (antXMLContext == null) {
            antXMLContext2 = new AntXMLContext(project);
            project.addReference(REFID_CONTEXT, antXMLContext2);
            project.addReference(REFID_TARGETS, antXMLContext2.getTargets());
        }
        if (getImportStack().size() > 1) {
            antXMLContext2.setIgnoreProjectTag(true);
            Target currentTarget = antXMLContext2.getCurrentTarget();
            Target implicitTarget = antXMLContext2.getImplicitTarget();
            Map currentTargets = antXMLContext2.getCurrentTargets();
            try {
                Target target = new Target();
                target.setProject(project);
                target.setName("");
                antXMLContext2.setCurrentTarget(target);
                antXMLContext2.setCurrentTargets(new HashMap());
                antXMLContext2.setImplicitTarget(target);
                parse(project, obj, new RootHandler(antXMLContext2, mainHandler));
                target.execute();
                antXMLContext2.setCurrentTarget(currentTarget);
                antXMLContext2.setImplicitTarget(implicitTarget);
                antXMLContext2.setCurrentTargets(currentTargets);
                return;
            } catch (Throwable th) {
                antXMLContext2.setCurrentTarget(currentTarget);
                antXMLContext2.setImplicitTarget(implicitTarget);
                antXMLContext2.setCurrentTargets(currentTargets);
                throw th;
            }
        }
        antXMLContext2.setCurrentTargets(new HashMap());
        parse(project, obj, new RootHandler(antXMLContext2, mainHandler));
        antXMLContext2.getImplicitTarget().execute();
        for (String[] strArr : getExtensionStack()) {
            String str = strArr[0];
            String str2 = strArr[1];
            ProjectHelper.OnMissingExtensionPoint valueOf = ProjectHelper.OnMissingExtensionPoint.valueOf(strArr[2]);
            Hashtable targets = project.getTargets();
            if (!targets.containsKey(str)) {
                String stringBuffer = new StringBuffer().append("can't add target ").append(str2).append(" to extension-point ").append(str).append(" because the extension-point is unknown.").toString();
                if (valueOf == ProjectHelper.OnMissingExtensionPoint.FAIL) {
                    throw new BuildException(stringBuffer);
                }
                if (valueOf == ProjectHelper.OnMissingExtensionPoint.WARN) {
                    antXMLContext2.getProject().log((Target) targets.get(str2), new StringBuffer().append("Warning: ").append(stringBuffer).toString(), 1);
                }
            } else {
                Target target2 = (Target) targets.get(str);
                if (!(target2 instanceof ExtensionPoint)) {
                    throw new BuildException(new StringBuffer().append("referenced target ").append(str).append(" is not an extension-point").toString());
                }
                target2.addDependency(str2);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:106:0x0517  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x0576  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x0582  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x04d1  */
    /* JADX WARN: Type inference failed for: r0v142, types: [org.xml.sax.SAXException] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void parse(Project project, Object obj, RootHandler rootHandler) throws BuildException {
        File file;
        URL url;
        Class cls;
        Class cls2;
        String url2;
        ZipFile zipFile;
        FileInputStream fileInputStream;
        IOException e;
        UnsupportedEncodingException e2;
        FileNotFoundException e3;
        SAXException e4;
        Exception exception;
        Throwable th;
        SAXParseException e5;
        Exception exception2;
        String str;
        AntXMLContext antXMLContext = rootHandler.context;
        if (obj instanceof File) {
            file = (File) obj;
            url = null;
        } else if (obj instanceof URL) {
            url = (URL) obj;
            file = null;
        } else {
            file = null;
            url = null;
            if (obj instanceof Resource) {
                Resource resource = (Resource) obj;
                if (class$org$apache$tools$ant$types$resources$FileProvider == null) {
                    cls = class$("org.apache.tools.ant.types.resources.FileProvider");
                    class$org$apache$tools$ant$types$resources$FileProvider = cls;
                } else {
                    cls = class$org$apache$tools$ant$types$resources$FileProvider;
                }
                FileProvider fileProvider = (FileProvider) resource.as(cls);
                if (fileProvider != null) {
                    file = fileProvider.getFile();
                    url = null;
                } else {
                    Resource resource2 = (Resource) obj;
                    if (class$org$apache$tools$ant$types$resources$URLProvider == null) {
                        cls2 = class$("org.apache.tools.ant.types.resources.URLProvider");
                        class$org$apache$tools$ant$types$resources$URLProvider = cls2;
                    } else {
                        cls2 = class$org$apache$tools$ant$types$resources$URLProvider;
                    }
                    URLProvider uRLProvider = (URLProvider) resource2.as(cls2);
                    file = null;
                    url = null;
                    if (uRLProvider != null) {
                        url = uRLProvider.getURL();
                        file = null;
                    }
                }
            }
        }
        if (file != null) {
            file = FILE_UTILS.normalize(file.getAbsolutePath());
            antXMLContext.setBuildFile(file);
            url2 = file.toString();
        } else if (url == null) {
            throw new BuildException(new StringBuffer().append("Source ").append(obj.getClass().getName()).append(" not supported by this plugin").toString());
        } else {
            try {
                antXMLContext.setBuildFile((File) null);
                antXMLContext.setBuildFile(url);
                url2 = url.toString();
            } catch (MalformedURLException e6) {
                throw new BuildException(e6);
            }
        }
        InputStream inputStream = null;
        ZipFile zipFile2 = null;
        InputStream inputStream2 = null;
        ZipFile zipFile3 = null;
        InputStream inputStream3 = null;
        ZipFile zipFile4 = null;
        InputStream inputStream4 = null;
        ZipFile zipFile5 = null;
        InputStream inputStream5 = null;
        ZipFile zipFile6 = null;
        try {
            try {
                XMLReader namespaceXMLReader = JAXPUtils.getNamespaceXMLReader();
                if (file != null) {
                    str = FILE_UTILS.toURI(file.getAbsolutePath());
                    fileInputStream = new FileInputStream(file);
                    zipFile = null;
                } else {
                    String url3 = url.toString();
                    if (url3.startsWith("jar:file")) {
                        int indexOf = url3.indexOf("!/");
                        if (indexOf > -1) {
                            ZipFile zipFile7 = new ZipFile(org.apache.tools.ant.launch.Locator.fromJarURI(url3), "UTF-8");
                            try {
                                zipFile = zipFile7;
                                fileInputStream = zipFile7.getInputStream(zipFile7.getEntry(url3.substring(indexOf + 1)));
                                str = url3;
                            } catch (FileNotFoundException e7) {
                                e3 = e7;
                                zipFile = zipFile7;
                                fileInputStream = null;
                                InputStream inputStream6 = fileInputStream;
                                InputStream inputStream7 = fileInputStream;
                                throw new BuildException(e3);
                            } catch (UnsupportedEncodingException e8) {
                                e2 = e8;
                                zipFile = zipFile7;
                                fileInputStream = null;
                                InputStream inputStream8 = fileInputStream;
                                InputStream inputStream9 = fileInputStream;
                                InputStream inputStream10 = fileInputStream;
                                InputStream inputStream11 = fileInputStream;
                                throw new BuildException(new StringBuffer().append("Encoding of project file ").append(url2).append(" is invalid.").toString(), e2);
                            } catch (IOException e9) {
                                e = e9;
                                zipFile = zipFile7;
                                fileInputStream = null;
                                InputStream inputStream12 = fileInputStream;
                                InputStream inputStream13 = fileInputStream;
                                InputStream inputStream14 = fileInputStream;
                                InputStream inputStream15 = fileInputStream;
                                throw new BuildException(new StringBuffer().append("Error reading project file ").append(url2).append(": ").append(e.getMessage()).toString(), e);
                            } catch (SAXParseException e10) {
                                e5 = e10;
                                zipFile = zipFile7;
                                fileInputStream = null;
                                InputStream inputStream16 = fileInputStream;
                                Location location = new Location(e5.getSystemId(), e5.getLineNumber(), e5.getColumnNumber());
                                InputStream inputStream17 = fileInputStream;
                                exception2 = e5.getException();
                                InputStream inputStream18 = fileInputStream;
                                if (exception2 instanceof BuildException) {
                                    InputStream inputStream19 = fileInputStream;
                                    String message = e5.getMessage();
                                    if (exception2 != null) {
                                        e5 = exception2;
                                    }
                                    BuildException buildException = new BuildException(message, e5, location);
                                    InputStream inputStream20 = fileInputStream;
                                    throw buildException;
                                }
                                InputStream inputStream21 = fileInputStream;
                                BuildException buildException2 = (BuildException) exception2;
                                InputStream inputStream22 = fileInputStream;
                                if (buildException2.getLocation() == Location.UNKNOWN_LOCATION) {
                                    InputStream inputStream23 = fileInputStream;
                                    buildException2.setLocation(location);
                                }
                                InputStream inputStream24 = fileInputStream;
                                throw buildException2;
                            } catch (SAXException e11) {
                                e4 = e11;
                                zipFile = zipFile7;
                                fileInputStream = null;
                                exception = e4.getException();
                                InputStream inputStream25 = fileInputStream;
                                if (!(exception instanceof BuildException)) {
                                    InputStream inputStream26 = fileInputStream;
                                    throw ((BuildException) exception);
                                }
                                InputStream inputStream27 = fileInputStream;
                                InputStream inputStream28 = fileInputStream;
                                String message2 = e4.getMessage();
                                if (exception != null) {
                                    e4 = exception;
                                }
                                BuildException buildException3 = new BuildException(message2, e4);
                                InputStream inputStream29 = fileInputStream;
                                throw buildException3;
                            } catch (Throwable th2) {
                                th = th2;
                                zipFile = zipFile7;
                                fileInputStream = null;
                                FileUtils.close(fileInputStream);
                                ZipFile.closeQuietly(zipFile);
                                throw th;
                            }
                        }
                    }
                    fileInputStream = url.openStream();
                    str = url3;
                    zipFile = null;
                }
                inputStream = fileInputStream;
                zipFile2 = zipFile;
                inputStream2 = fileInputStream;
                zipFile3 = zipFile;
                inputStream3 = fileInputStream;
                zipFile4 = zipFile;
                inputStream4 = fileInputStream;
                zipFile5 = zipFile;
                inputStream5 = fileInputStream;
                zipFile6 = zipFile;
                InputSource inputSource = new InputSource(fileInputStream);
                if (str != null) {
                    try {
                        inputSource.setSystemId(str);
                    } catch (FileNotFoundException e12) {
                        e3 = e12;
                        InputStream inputStream62 = fileInputStream;
                        InputStream inputStream72 = fileInputStream;
                        throw new BuildException(e3);
                    } catch (UnsupportedEncodingException e13) {
                        e2 = e13;
                        InputStream inputStream82 = fileInputStream;
                        InputStream inputStream92 = fileInputStream;
                        InputStream inputStream102 = fileInputStream;
                        InputStream inputStream112 = fileInputStream;
                        throw new BuildException(new StringBuffer().append("Encoding of project file ").append(url2).append(" is invalid.").toString(), e2);
                    } catch (IOException e14) {
                        e = e14;
                        InputStream inputStream122 = fileInputStream;
                        InputStream inputStream132 = fileInputStream;
                        InputStream inputStream142 = fileInputStream;
                        InputStream inputStream152 = fileInputStream;
                        throw new BuildException(new StringBuffer().append("Error reading project file ").append(url2).append(": ").append(e.getMessage()).toString(), e);
                    } catch (SAXParseException e15) {
                        e5 = e15;
                        InputStream inputStream162 = fileInputStream;
                        Location location2 = new Location(e5.getSystemId(), e5.getLineNumber(), e5.getColumnNumber());
                        InputStream inputStream172 = fileInputStream;
                        exception2 = e5.getException();
                        InputStream inputStream182 = fileInputStream;
                        if (exception2 instanceof BuildException) {
                        }
                    } catch (SAXException e16) {
                        e4 = e16;
                        exception = e4.getException();
                        InputStream inputStream252 = fileInputStream;
                        if (!(exception instanceof BuildException)) {
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        FileUtils.close(fileInputStream);
                        ZipFile.closeQuietly(zipFile);
                        throw th;
                    }
                }
                project.log(new StringBuffer().append("parsing buildfile ").append(url2).append(" with URI = ").append(str).append(zipFile != null ? " from a zip file" : "").toString(), 3);
                namespaceXMLReader.setContentHandler(rootHandler);
                namespaceXMLReader.setEntityResolver(rootHandler);
                namespaceXMLReader.setErrorHandler(rootHandler);
                namespaceXMLReader.setDTDHandler(rootHandler);
                namespaceXMLReader.parse(inputSource);
                FileUtils.close(fileInputStream);
                ZipFile.closeQuietly(zipFile);
            } catch (Throwable th4) {
                th = th4;
                zipFile = null;
                fileInputStream = null;
            }
        } catch (FileNotFoundException e17) {
            e3 = e17;
            zipFile = zipFile4;
            fileInputStream = inputStream3;
        } catch (UnsupportedEncodingException e18) {
            e2 = e18;
            zipFile = zipFile5;
            fileInputStream = inputStream4;
        } catch (IOException e19) {
            e = e19;
            zipFile = zipFile6;
            fileInputStream = inputStream5;
        } catch (SAXParseException e20) {
            e5 = e20;
            zipFile = zipFile2;
            fileInputStream = inputStream;
        } catch (SAXException e21) {
            e4 = e21;
            zipFile = zipFile3;
            fileInputStream = inputStream2;
        }
    }

    @Override // org.apache.tools.ant.ProjectHelper
    public UnknownElement parseAntlibDescriptor(Project project, Resource resource) {
        Class cls;
        if (class$org$apache$tools$ant$types$resources$URLProvider == null) {
            cls = class$("org.apache.tools.ant.types.resources.URLProvider");
            class$org$apache$tools$ant$types$resources$URLProvider = cls;
        } else {
            cls = class$org$apache$tools$ant$types$resources$URLProvider;
        }
        URLProvider uRLProvider = (URLProvider) resource.as(cls);
        if (uRLProvider == null) {
            throw new BuildException(new StringBuffer().append("Unsupported resource type: ").append(resource).toString());
        }
        return parseUnknownElement(project, uRLProvider.getURL());
    }

    public UnknownElement parseUnknownElement(Project project, URL url) throws BuildException {
        Target target = new Target();
        target.setProject(project);
        AntXMLContext antXMLContext = new AntXMLContext(project);
        antXMLContext.addTarget(target);
        antXMLContext.setImplicitTarget(target);
        parse(antXMLContext.getProject(), url, new RootHandler(antXMLContext, elementHandler));
        Task[] tasks = target.getTasks();
        if (tasks.length != 1) {
            throw new BuildException("No tasks defined");
        }
        return (UnknownElement) tasks[0];
    }
}
