package org.jivesoftware.smackx.workgroup.ext.forms;

import org.jivesoftware.smack.packet.IQ;
import org.jivesoftware.smack.provider.IQProvider;
import org.jivesoftware.smack.util.PacketParserUtils;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/ext/forms/WorkgroupForm.class */
public class WorkgroupForm extends IQ {
    public static final String ELEMENT_NAME = "workgroup-form";
    public static final String NAMESPACE = "http://jivesoftware.com/protocol/workgroup";

    /* loaded from: classes.jar:org/jivesoftware/smackx/workgroup/ext/forms/WorkgroupForm$InternalProvider.class */
    public static class InternalProvider implements IQProvider {
        @Override // org.jivesoftware.smack.provider.IQProvider
        public IQ parseIQ(XmlPullParser xmlPullParser) throws Exception {
            WorkgroupForm workgroupForm = new WorkgroupForm();
            boolean z = false;
            while (!z) {
                int next = xmlPullParser.next();
                if (next == 2) {
                    workgroupForm.addExtension(PacketParserUtils.parsePacketExtension(xmlPullParser.getName(), xmlPullParser.getNamespace(), xmlPullParser));
                } else if (next == 3 && xmlPullParser.getName().equals(WorkgroupForm.ELEMENT_NAME)) {
                    z = true;
                }
            }
            return workgroupForm;
        }
    }

    @Override // org.jivesoftware.smack.packet.IQ
    public String getChildElementXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(ELEMENT_NAME).append(" xmlns=\"").append("http://jivesoftware.com/protocol/workgroup").append("\">");
        sb.append(getExtensionsXML());
        sb.append("</").append(ELEMENT_NAME).append("> ");
        return sb.toString();
    }
}
