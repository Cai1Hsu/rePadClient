package org.jivesoftware.smackx.provider;

import java.util.ArrayList;
import org.apache.tools.ant.types.selectors.SizeSelector;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smack.provider.PacketExtensionProvider;
import org.jivesoftware.smackx.FormField;
import org.jivesoftware.smackx.packet.DataForm;
import org.xmlpull.v1.XmlPullParser;

/* loaded from: classes.jar:org/jivesoftware/smackx/provider/DataFormProvider.class */
public class DataFormProvider implements PacketExtensionProvider {
    private FormField parseField(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        FormField formField = new FormField(xmlPullParser.getAttributeValue("", "var"));
        formField.setLabel(xmlPullParser.getAttributeValue("", "label"));
        formField.setType(xmlPullParser.getAttributeValue("", "type"));
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("desc")) {
                    formField.setDescription(xmlPullParser.nextText());
                } else if (xmlPullParser.getName().equals(SizeSelector.SIZE_KEY)) {
                    formField.addValue(xmlPullParser.nextText());
                } else if (xmlPullParser.getName().equals("required")) {
                    formField.setRequired(true);
                } else if (xmlPullParser.getName().equals("option")) {
                    formField.addOption(parseOption(xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals("field")) {
                z = true;
            }
        }
        return formField;
    }

    private DataForm.Item parseItem(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        ArrayList arrayList = new ArrayList();
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("field")) {
                    arrayList.add(parseField(xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals("item")) {
                z = true;
            }
        }
        return new DataForm.Item(arrayList);
    }

    private FormField.Option parseOption(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        FormField.Option option = null;
        String attributeValue = xmlPullParser.getAttributeValue("", "label");
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals(SizeSelector.SIZE_KEY)) {
                    option = new FormField.Option(attributeValue, xmlPullParser.nextText());
                }
            } else if (next == 3 && xmlPullParser.getName().equals("option")) {
                z = true;
            }
        }
        return option;
    }

    private DataForm.ReportedData parseReported(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        ArrayList arrayList = new ArrayList();
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("field")) {
                    arrayList.add(parseField(xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals("reported")) {
                z = true;
            }
        }
        return new DataForm.ReportedData(arrayList);
    }

    @Override // org.jivesoftware.smack.provider.PacketExtensionProvider
    public PacketExtension parseExtension(XmlPullParser xmlPullParser) throws Exception {
        boolean z = false;
        DataForm dataForm = new DataForm(xmlPullParser.getAttributeValue("", "type"));
        while (!z) {
            int next = xmlPullParser.next();
            if (next == 2) {
                if (xmlPullParser.getName().equals("instructions")) {
                    dataForm.addInstruction(xmlPullParser.nextText());
                } else if (xmlPullParser.getName().equals("title")) {
                    dataForm.setTitle(xmlPullParser.nextText());
                } else if (xmlPullParser.getName().equals("field")) {
                    dataForm.addField(parseField(xmlPullParser));
                } else if (xmlPullParser.getName().equals("item")) {
                    dataForm.addItem(parseItem(xmlPullParser));
                } else if (xmlPullParser.getName().equals("reported")) {
                    dataForm.setReportedData(parseReported(xmlPullParser));
                }
            } else if (next == 3 && xmlPullParser.getName().equals(dataForm.getElementName())) {
                z = true;
            }
        }
        return dataForm;
    }
}
