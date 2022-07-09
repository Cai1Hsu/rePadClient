package org.jivesoftware.smackx;

import com.edutech.publicedu.log.LogHelp;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.StringTokenizer;
import org.jivesoftware.smack.packet.Packet;
import org.jivesoftware.smack.packet.PacketExtension;
import org.jivesoftware.smackx.packet.DataForm;

/* loaded from: classes.jar:org/jivesoftware/smackx/Form.class */
public class Form {
    public static final String ELEMENT = "x";
    public static final String NAMESPACE = "jabber:x:data";
    public static final String TYPE_CANCEL = "cancel";
    public static final String TYPE_FORM = "form";
    public static final String TYPE_RESULT = "result";
    public static final String TYPE_SUBMIT = "submit";
    private DataForm dataForm;

    public Form(String str) {
        this.dataForm = new DataForm(str);
    }

    public Form(DataForm dataForm) {
        this.dataForm = dataForm;
    }

    public static Form getFormFrom(Packet packet) {
        Form form;
        PacketExtension extension = packet.getExtension("x", NAMESPACE);
        if (extension != null) {
            DataForm dataForm = (DataForm) extension;
            if (dataForm.getReportedData() == null) {
                form = new Form(dataForm);
                return form;
            }
        }
        form = null;
        return form;
    }

    private boolean isFormType() {
        return TYPE_FORM.equals(this.dataForm.getType());
    }

    private boolean isSubmitType() {
        return TYPE_SUBMIT.equals(this.dataForm.getType());
    }

    private void setAnswer(FormField formField, Object obj) {
        if (!isSubmitType()) {
            throw new IllegalStateException("Cannot set an answer if the form is not of type \"submit\"");
        }
        formField.resetValues();
        formField.addValue(obj.toString());
    }

    public void addField(FormField formField) {
        this.dataForm.addField(formField);
    }

    public Form createAnswerForm() {
        if (!isFormType()) {
            throw new IllegalStateException("Only forms of type \"form\" could be answered");
        }
        Form form = new Form(TYPE_SUBMIT);
        Iterator<FormField> fields = getFields();
        while (fields.hasNext()) {
            FormField next = fields.next();
            if (next.getVariable() != null) {
                FormField formField = new FormField(next.getVariable());
                formField.setType(next.getType());
                form.addField(formField);
                if (FormField.TYPE_HIDDEN.equals(next.getType())) {
                    ArrayList arrayList = new ArrayList();
                    Iterator<String> values = next.getValues();
                    while (values.hasNext()) {
                        arrayList.add(values.next());
                    }
                    form.setAnswer(next.getVariable(), arrayList);
                }
            }
        }
        return form;
    }

    public DataForm getDataFormToSend() {
        DataForm dataForm;
        if (isSubmitType()) {
            DataForm dataForm2 = new DataForm(getType());
            Iterator<FormField> fields = getFields();
            while (true) {
                dataForm = dataForm2;
                if (!fields.hasNext()) {
                    break;
                }
                FormField next = fields.next();
                if (next.getValues().hasNext()) {
                    dataForm2.addField(next);
                }
            }
        } else {
            dataForm = this.dataForm;
        }
        return dataForm;
    }

    public FormField getField(String str) {
        FormField formField;
        if (str == null || str.equals("")) {
            throw new IllegalArgumentException("Variable must not be null or blank.");
        }
        Iterator<FormField> fields = getFields();
        while (true) {
            if (!fields.hasNext()) {
                formField = null;
                break;
            }
            FormField next = fields.next();
            if (str.equals(next.getVariable())) {
                formField = next;
                break;
            }
        }
        return formField;
    }

    public Iterator<FormField> getFields() {
        return this.dataForm.getFields();
    }

    public String getInstructions() {
        StringBuilder sb = new StringBuilder();
        Iterator<String> instructions = this.dataForm.getInstructions();
        while (instructions.hasNext()) {
            sb.append(instructions.next());
            if (instructions.hasNext()) {
                sb.append("\n");
            }
        }
        return sb.toString();
    }

    public String getTitle() {
        return this.dataForm.getTitle();
    }

    public String getType() {
        return this.dataForm.getType();
    }

    public void setAnswer(String str, double d) {
        FormField field = getField(str);
        if (field == null) {
            throw new IllegalArgumentException("Field not found for the specified variable name.");
        }
        if (!FormField.TYPE_TEXT_MULTI.equals(field.getType()) && !FormField.TYPE_TEXT_PRIVATE.equals(field.getType()) && !FormField.TYPE_TEXT_SINGLE.equals(field.getType())) {
            throw new IllegalArgumentException("This field is not of type double.");
        }
        setAnswer(field, Double.valueOf(d));
    }

    public void setAnswer(String str, float f) {
        FormField field = getField(str);
        if (field == null) {
            throw new IllegalArgumentException("Field not found for the specified variable name.");
        }
        if (!FormField.TYPE_TEXT_MULTI.equals(field.getType()) && !FormField.TYPE_TEXT_PRIVATE.equals(field.getType()) && !FormField.TYPE_TEXT_SINGLE.equals(field.getType())) {
            throw new IllegalArgumentException("This field is not of type float.");
        }
        setAnswer(field, Float.valueOf(f));
    }

    public void setAnswer(String str, int i) {
        FormField field = getField(str);
        if (field == null) {
            throw new IllegalArgumentException("Field not found for the specified variable name.");
        }
        if (!FormField.TYPE_TEXT_MULTI.equals(field.getType()) && !FormField.TYPE_TEXT_PRIVATE.equals(field.getType()) && !FormField.TYPE_TEXT_SINGLE.equals(field.getType())) {
            throw new IllegalArgumentException("This field is not of type int.");
        }
        setAnswer(field, Integer.valueOf(i));
    }

    public void setAnswer(String str, long j) {
        FormField field = getField(str);
        if (field == null) {
            throw new IllegalArgumentException("Field not found for the specified variable name.");
        }
        if (!FormField.TYPE_TEXT_MULTI.equals(field.getType()) && !FormField.TYPE_TEXT_PRIVATE.equals(field.getType()) && !FormField.TYPE_TEXT_SINGLE.equals(field.getType())) {
            throw new IllegalArgumentException("This field is not of type long.");
        }
        setAnswer(field, Long.valueOf(j));
    }

    public void setAnswer(String str, String str2) {
        FormField field = getField(str);
        if (field == null) {
            throw new IllegalArgumentException("Field not found for the specified variable name.");
        }
        if (!FormField.TYPE_TEXT_MULTI.equals(field.getType()) && !FormField.TYPE_TEXT_PRIVATE.equals(field.getType()) && !FormField.TYPE_TEXT_SINGLE.equals(field.getType()) && !FormField.TYPE_JID_SINGLE.equals(field.getType()) && !FormField.TYPE_HIDDEN.equals(field.getType())) {
            throw new IllegalArgumentException("This field is not of type String.");
        }
        setAnswer(field, str2);
    }

    public void setAnswer(String str, List<String> list) {
        if (!isSubmitType()) {
            throw new IllegalStateException("Cannot set an answer if the form is not of type \"submit\"");
        }
        FormField field = getField(str);
        if (field == null) {
            throw new IllegalArgumentException("Couldn't find a field for the specified variable.");
        }
        if (!FormField.TYPE_JID_MULTI.equals(field.getType()) && !FormField.TYPE_LIST_MULTI.equals(field.getType()) && !FormField.TYPE_LIST_SINGLE.equals(field.getType()) && !FormField.TYPE_TEXT_MULTI.equals(field.getType()) && !FormField.TYPE_HIDDEN.equals(field.getType())) {
            throw new IllegalArgumentException("This field only accept list of values.");
        }
        field.resetValues();
        field.addValues(list);
    }

    public void setAnswer(String str, boolean z) {
        FormField field = getField(str);
        if (field == null) {
            throw new IllegalArgumentException("Field not found for the specified variable name.");
        }
        if (!FormField.TYPE_BOOLEAN.equals(field.getType())) {
            throw new IllegalArgumentException("This field is not of type boolean.");
        }
        setAnswer(field, z ? LogHelp.TYPE_GUIDANCE : "0");
    }

    public void setDefaultAnswer(String str) {
        if (!isSubmitType()) {
            throw new IllegalStateException("Cannot set an answer if the form is not of type \"submit\"");
        }
        FormField field = getField(str);
        if (field == null) {
            throw new IllegalArgumentException("Couldn't find a field for the specified variable.");
        }
        field.resetValues();
        Iterator<String> values = field.getValues();
        while (values.hasNext()) {
            field.addValue(values.next());
        }
    }

    public void setInstructions(String str) {
        ArrayList arrayList = new ArrayList();
        StringTokenizer stringTokenizer = new StringTokenizer(str, "\n");
        while (stringTokenizer.hasMoreTokens()) {
            arrayList.add(stringTokenizer.nextToken());
        }
        this.dataForm.setInstructions(arrayList);
    }

    public void setTitle(String str) {
        this.dataForm.setTitle(str);
    }
}
