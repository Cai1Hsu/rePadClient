package org.apache.tools.ant.taskdefs;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.types.EnumeratedAttribute;
import org.apache.tools.ant.util.DOMElementWriter;
import org.apache.tools.ant.util.FileUtils;
import org.apache.tools.ant.util.XMLFragment;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/EchoXML.class */
public class EchoXML extends XMLFragment {
    private static final String ERROR_NO_XML = "No nested XML specified";
    private boolean append;
    private File file;
    private NamespacePolicy namespacePolicy = NamespacePolicy.DEFAULT;

    /* loaded from: classes.jar:org/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy.class */
    public static class NamespacePolicy extends EnumeratedAttribute {
        private static final String ALL = "all";
        public static final NamespacePolicy DEFAULT = new NamespacePolicy("ignore");
        private static final String ELEMENTS = "elementsOnly";
        private static final String IGNORE = "ignore";

        public NamespacePolicy() {
        }

        public NamespacePolicy(String str) {
            setValue(str);
        }

        public DOMElementWriter.XmlNamespacePolicy getPolicy() {
            DOMElementWriter.XmlNamespacePolicy xmlNamespacePolicy;
            String value = getValue();
            if ("ignore".equalsIgnoreCase(value)) {
                xmlNamespacePolicy = DOMElementWriter.XmlNamespacePolicy.IGNORE;
            } else if (ELEMENTS.equalsIgnoreCase(value)) {
                xmlNamespacePolicy = DOMElementWriter.XmlNamespacePolicy.ONLY_QUALIFY_ELEMENTS;
            } else if (!ALL.equalsIgnoreCase(value)) {
                throw new BuildException(new StringBuffer().append("Invalid namespace policy: ").append(value).toString());
            } else {
                xmlNamespacePolicy = DOMElementWriter.XmlNamespacePolicy.QUALIFY_ALL;
            }
            return xmlNamespacePolicy;
        }

        @Override // org.apache.tools.ant.types.EnumeratedAttribute
        public String[] getValues() {
            return new String[]{"ignore", ELEMENTS, ALL};
        }
    }

    public void execute() {
        DOMElementWriter dOMElementWriter = new DOMElementWriter(!this.append, this.namespacePolicy.getPolicy());
        OutputStream outputStream = null;
        try {
            try {
                FileOutputStream fileOutputStream = this.file != null ? new FileOutputStream(this.file.getAbsolutePath(), this.append) : new LogOutputStream(this, 2);
                Node firstChild = getFragment().getFirstChild();
                if (firstChild == null) {
                    OutputStream outputStream2 = fileOutputStream;
                    OutputStream outputStream3 = fileOutputStream;
                    throw new BuildException(ERROR_NO_XML);
                }
                dOMElementWriter.write((Element) firstChild, fileOutputStream);
                outputStream = fileOutputStream;
            } catch (BuildException e) {
                throw e;
            } catch (Exception e2) {
                throw new BuildException(e2);
            }
        } finally {
            FileUtils.close(outputStream);
        }
    }

    public void setAppend(boolean z) {
        this.append = z;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public void setNamespacePolicy(NamespacePolicy namespacePolicy) {
        this.namespacePolicy = namespacePolicy;
    }
}
