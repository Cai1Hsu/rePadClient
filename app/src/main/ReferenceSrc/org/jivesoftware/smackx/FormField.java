package org.jivesoftware.smackx;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.jivesoftware.smack.util.StringUtils;

/* loaded from: classes.jar:org/jivesoftware/smackx/FormField.class */
public class FormField {
    public static final String TYPE_BOOLEAN = "boolean";
    public static final String TYPE_FIXED = "fixed";
    public static final String TYPE_HIDDEN = "hidden";
    public static final String TYPE_JID_MULTI = "jid-multi";
    public static final String TYPE_JID_SINGLE = "jid-single";
    public static final String TYPE_LIST_MULTI = "list-multi";
    public static final String TYPE_LIST_SINGLE = "list-single";
    public static final String TYPE_TEXT_MULTI = "text-multi";
    public static final String TYPE_TEXT_PRIVATE = "text-private";
    public static final String TYPE_TEXT_SINGLE = "text-single";
    private String description;
    private String label;
    private final List<Option> options;
    private boolean required;
    private String type;
    private final List<String> values;
    private String variable;

    /* loaded from: classes.jar:org/jivesoftware/smackx/FormField$Option.class */
    public static class Option {
        private String label;
        private String value;

        public Option(String str) {
            this.value = str;
        }

        public Option(String str, String str2) {
            this.label = str;
            this.value = str2;
        }

        public boolean equals(Object obj) {
            boolean z;
            if (obj == null) {
                z = false;
            } else if (obj == this) {
                z = true;
            } else {
                z = false;
                if (obj.getClass() == getClass()) {
                    Option option = (Option) obj;
                    z = false;
                    if (this.value.equals(option.value)) {
                        z = false;
                        if ((this.label == null ? "" : this.label).equals(option.label == null ? "" : option.label)) {
                            z = true;
                        }
                    }
                }
            }
            return z;
        }

        public String getLabel() {
            return this.label;
        }

        public String getValue() {
            return this.value;
        }

        public int hashCode() {
            return ((this.value.hashCode() + 37) * 37) + (this.label == null ? 0 : this.label.hashCode());
        }

        public String toString() {
            return getLabel();
        }

        public String toXML() {
            StringBuilder sb = new StringBuilder();
            sb.append("<option");
            if (getLabel() != null) {
                sb.append(" label=\"").append(getLabel()).append("\"");
            }
            sb.append(">");
            sb.append("<value>").append(StringUtils.escapeForXML(getValue())).append("</value>");
            sb.append("</option>");
            return sb.toString();
        }
    }

    public FormField() {
        this.required = false;
        this.options = new ArrayList();
        this.values = new ArrayList();
        this.type = TYPE_FIXED;
    }

    public FormField(String str) {
        this.required = false;
        this.options = new ArrayList();
        this.values = new ArrayList();
        this.variable = str;
    }

    public void addOption(Option option) {
        synchronized (this.options) {
            this.options.add(option);
        }
    }

    public void addValue(String str) {
        synchronized (this.values) {
            this.values.add(str);
        }
    }

    public void addValues(List<String> list) {
        synchronized (this.values) {
            this.values.addAll(list);
        }
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (obj != null) {
            if (obj == this) {
                z = true;
            } else if (obj instanceof FormField) {
                z = toXML().equals(((FormField) obj).toXML());
            }
        }
        return z;
    }

    public String getDescription() {
        return this.description;
    }

    public String getLabel() {
        return this.label;
    }

    public Iterator<Option> getOptions() {
        Iterator<Option> it;
        synchronized (this.options) {
            it = Collections.unmodifiableList(new ArrayList(this.options)).iterator();
        }
        return it;
    }

    public String getType() {
        return this.type;
    }

    public Iterator<String> getValues() {
        Iterator<String> it;
        synchronized (this.values) {
            it = Collections.unmodifiableList(new ArrayList(this.values)).iterator();
        }
        return it;
    }

    public String getVariable() {
        return this.variable;
    }

    public int hashCode() {
        return toXML().hashCode();
    }

    public boolean isRequired() {
        return this.required;
    }

    protected void resetValues() {
        synchronized (this.values) {
            this.values.removeAll(new ArrayList(this.values));
        }
    }

    public void setDescription(String str) {
        this.description = str;
    }

    public void setLabel(String str) {
        this.label = str;
    }

    public void setRequired(boolean z) {
        this.required = z;
    }

    public void setType(String str) {
        this.type = str;
    }

    public String toXML() {
        StringBuilder sb = new StringBuilder();
        sb.append("<field");
        if (getLabel() != null) {
            sb.append(" label=\"").append(getLabel()).append("\"");
        }
        if (getVariable() != null) {
            sb.append(" var=\"").append(getVariable()).append("\"");
        }
        if (getType() != null) {
            sb.append(" type=\"").append(getType()).append("\"");
        }
        sb.append(">");
        if (getDescription() != null) {
            sb.append("<desc>").append(getDescription()).append("</desc>");
        }
        if (isRequired()) {
            sb.append("<required/>");
        }
        Iterator<String> values = getValues();
        while (values.hasNext()) {
            sb.append("<value>").append(values.next()).append("</value>");
        }
        Iterator<Option> options = getOptions();
        while (options.hasNext()) {
            sb.append(options.next().toXML());
        }
        sb.append("</field>");
        return sb.toString();
    }
}
