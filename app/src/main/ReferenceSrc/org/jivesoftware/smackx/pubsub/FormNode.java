package org.jivesoftware.smackx.pubsub;

import org.jivesoftware.smackx.Form;

/* loaded from: classes.jar:org/jivesoftware/smackx/pubsub/FormNode.class */
public class FormNode extends NodeExtension {
    private Form configForm;

    public FormNode(FormNodeType formNodeType, String str, Form form) {
        super(formNodeType.getNodeElement(), str);
        if (form == null) {
            throw new IllegalArgumentException("Submit form cannot be null");
        }
        this.configForm = form;
    }

    public FormNode(FormNodeType formNodeType, Form form) {
        super(formNodeType.getNodeElement());
        if (form == null) {
            throw new IllegalArgumentException("Submit form cannot be null");
        }
        this.configForm = form;
    }

    public Form getForm() {
        return this.configForm;
    }

    @Override // org.jivesoftware.smackx.pubsub.NodeExtension, org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        String sb;
        if (this.configForm == null) {
            sb = super.toXML();
        } else {
            StringBuilder sb2 = new StringBuilder("<");
            sb2.append(getElementName());
            if (getNode() != null) {
                sb2.append(" node='");
                sb2.append(getNode());
                sb2.append("'>");
            } else {
                sb2.append('>');
            }
            sb2.append(this.configForm.getDataFormToSend().toXML());
            sb2.append("</");
            sb2.append(getElementName() + '>');
            sb = sb2.toString();
        }
        return sb;
    }
}
