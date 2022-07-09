package org.apache.tools.ant.util;

import org.apache.tools.ant.DynamicConfiguratorNS;
import org.apache.tools.ant.DynamicElementNS;
import org.apache.tools.ant.ProjectComponent;
import org.w3c.dom.Document;
import org.w3c.dom.DocumentFragment;
import org.w3c.dom.Element;
import org.w3c.dom.Node;

/* loaded from: classes.jar:org/apache/tools/ant/util/XMLFragment.class */
public class XMLFragment extends ProjectComponent implements DynamicElementNS {
    private Document doc = JAXPUtils.getDocumentBuilder().newDocument();
    private DocumentFragment fragment = this.doc.createDocumentFragment();

    /* loaded from: classes.jar:org/apache/tools/ant/util/XMLFragment$Child.class */
    public class Child implements DynamicConfiguratorNS {
        private Element e;
        private final XMLFragment this$0;

        Child(XMLFragment xMLFragment, Element element) {
            this.this$0 = xMLFragment;
            this.e = element;
        }

        public void addText(String str) {
            this.this$0.addText(this.e, str);
        }

        @Override // org.apache.tools.ant.DynamicElementNS
        public Object createDynamicElement(String str, String str2, String str3) {
            Element createElement = str.equals("") ? this.this$0.doc.createElement(str2) : this.this$0.doc.createElementNS(str, str3);
            this.e.appendChild(createElement);
            return new Child(this.this$0, createElement);
        }

        @Override // org.apache.tools.ant.DynamicAttributeNS
        public void setDynamicAttribute(String str, String str2, String str3, String str4) {
            if (str.equals("")) {
                this.e.setAttribute(str2, str4);
            } else {
                this.e.setAttributeNS(str, str3, str4);
            }
        }
    }

    public void addText(Node node, String str) {
        String replaceProperties = getProject().replaceProperties(str);
        if (replaceProperties == null || replaceProperties.trim().equals("")) {
            return;
        }
        node.appendChild(this.doc.createTextNode(replaceProperties.trim()));
    }

    public void addText(String str) {
        addText(this.fragment, str);
    }

    @Override // org.apache.tools.ant.DynamicElementNS
    public Object createDynamicElement(String str, String str2, String str3) {
        Element createElement = str.equals("") ? this.doc.createElement(str2) : this.doc.createElementNS(str, str3);
        this.fragment.appendChild(createElement);
        return new Child(this, createElement);
    }

    public DocumentFragment getFragment() {
        return this.fragment;
    }
}
