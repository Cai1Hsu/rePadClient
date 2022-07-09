package org.jivesoftware.smackx.packet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.Form;
import org.jivesoftware.smackx.FormField;

/* loaded from: classes.jar:org/jivesoftware/smackx/packet/DataForm.class */
public class DataForm implements PacketExtension {
    private ReportedData reportedData;
    private String title;
    private String type;
    private List<String> instructions = new ArrayList();
    private final List<Item> items = new ArrayList();
    private final List<FormField> fields = new ArrayList();

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/DataForm$Item.class */
    public static class Item {
        private List<FormField> fields;

        public Item(List<FormField> list) {
            this.fields = new ArrayList();
            this.fields = list;
        }

        public Iterator<FormField> getFields() {
            return Collections.unmodifiableList(new ArrayList(this.fields)).iterator();
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<item>");
            Iterator<FormField> fields = getFields();
            while (fields.hasNext()) {
                sb.append(fields.next().toXML());
            }
            sb.append("</item>");
            return sb.toString();
        }
    }

    /* loaded from: classes.jar:org/jivesoftware/smackx/packet/DataForm$ReportedData.class */
    public static class ReportedData {
        private List<FormField> fields;

        public ReportedData(List<FormField> list) {
            this.fields = new ArrayList();
            this.fields = list;
        }

        public Iterator<FormField> getFields() {
            return Collections.unmodifiableList(new ArrayList(this.fields)).iterator();
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<reported>");
            Iterator<FormField> fields = getFields();
            while (fields.hasNext()) {
                sb.append(fields.next().toXML());
            }
            sb.append("</reported>");
            return sb.toString();
        }
    }

    public DataForm(String str) {
        this.type = str;
    }

    public void addField(FormField formField) {
        synchronized (this.fields) {
            this.fields.add(formField);
        }
    }

    public void addInstruction(String str) {
        synchronized (this.instructions) {
            this.instructions.add(str);
        }
    }

    public void addItem(Item item) {
        synchronized (this.items) {
            this.items.add(item);
        }
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getElementName() {
        return "x";
    }

    public Iterator<FormField> getFields() {
        Iterator<FormField> it;
        synchronized (this.fields) {
            it = Collections.unmodifiableList(new ArrayList(this.fields)).iterator();
        }
        return it;
    }

    public Iterator<String> getInstructions() {
        Iterator<String> it;
        synchronized (this.instructions) {
            it = Collections.unmodifiableList(new ArrayList(this.instructions)).iterator();
        }
        return it;
    }

    public Iterator<Item> getItems() {
        Iterator<Item> it;
        synchronized (this.items) {
            it = Collections.unmodifiableList(new ArrayList(this.items)).iterator();
        }
        return it;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String getNamespace() {
        return Form.NAMESPACE;
    }

    public ReportedData getReportedData() {
        return this.reportedData;
    }

    public String getTitle() {
        return this.title;
    }

    public String getType() {
        return this.type;
    }

    public boolean hasHiddenFormTypeField() {
        boolean z = false;
        for (FormField formField : this.fields) {
            if (formField.getVariable().equals("FORM_TYPE") && formField.getType() != null && formField.getType().equals(FormField.TYPE_HIDDEN)) {
                z = true;
            }
        }
        return z;
    }

    public void setInstructions(List<String> list) {
        this.instructions = list;
    }

    public void setReportedData(ReportedData reportedData) {
        this.reportedData = reportedData;
    }

    public void setTitle(String str) {
        this.title = str;
    }

    @Override // org.jivesoftware.smack.packet.PacketExtension
    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<").append(getElementName()).append(" xmlns=\"").append(getNamespace()).append("\" type=\"" + getType() + "\">");
        if (getTitle() != null) {
            sb.append("<title>").append(getTitle()).append("</title>");
        }
        Iterator<String> instructions = getInstructions();
        while (instructions.hasNext()) {
            sb.append("<instructions>").append(instructions.next()).append("</instructions>");
        }
        if (getReportedData() != null) {
            sb.append(getReportedData().toXML());
        }
        Iterator<Item> items = getItems();
        while (items.hasNext()) {
            sb.append(items.next().toXML());
        }
        Iterator<FormField> fields = getFields();
        while (fields.hasNext()) {
            sb.append(fields.next().toXML());
        }
        sb.append("</").append(getElementName()).append(">");
        return sb.toString();
    }
}
