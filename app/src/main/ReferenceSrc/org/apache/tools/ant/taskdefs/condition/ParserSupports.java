package org.apache.tools.ant.taskdefs.condition;

import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.ProjectComponent;
import org.apache.tools.ant.util.JAXPUtils;
import org.xml.sax.SAXNotRecognizedException;
import org.xml.sax.SAXNotSupportedException;
import org.xml.sax.XMLReader;

/* loaded from: classes.jar:org/apache/tools/ant/taskdefs/condition/ParserSupports.class */
public class ParserSupports extends ProjectComponent implements Condition {
    public static final String ERROR_BOTH_ATTRIBUTES = "Property and feature attributes are exclusive";
    public static final String ERROR_NO_ATTRIBUTES = "Neither feature or property are set";
    public static final String ERROR_NO_VALUE = "A value is needed when testing for property support";
    public static final String FEATURE = "feature";
    public static final String NOT_RECOGNIZED = " not recognized: ";
    public static final String NOT_SUPPORTED = " not supported: ";
    public static final String PROPERTY = "property";
    private String feature;
    private String property;
    private String value;

    private XMLReader getReader() {
        JAXPUtils.getParser();
        return JAXPUtils.getXMLReader();
    }

    @Override // org.apache.tools.ant.taskdefs.condition.Condition
    public boolean eval() throws BuildException {
        boolean evalProperty;
        if (this.feature == null || this.property == null) {
            if (this.feature == null && this.property == null) {
                throw new BuildException(ERROR_NO_ATTRIBUTES);
            }
            if (this.feature != null) {
                evalProperty = evalFeature();
            } else if (this.value == null) {
                throw new BuildException(ERROR_NO_VALUE);
            } else {
                evalProperty = evalProperty();
            }
            return evalProperty;
        }
        throw new BuildException(ERROR_BOTH_ATTRIBUTES);
    }

    public boolean evalFeature() {
        boolean z = false;
        XMLReader reader = getReader();
        if (this.value == null) {
            this.value = "true";
        }
        try {
            reader.setFeature(this.feature, Project.toBoolean(this.value));
            z = true;
        } catch (SAXNotRecognizedException e) {
            log(new StringBuffer().append("feature not recognized: ").append(this.feature).toString(), 3);
        } catch (SAXNotSupportedException e2) {
            log(new StringBuffer().append("feature not supported: ").append(this.feature).toString(), 3);
        }
        return z;
    }

    public boolean evalProperty() {
        boolean z = false;
        try {
            getReader().setProperty(this.property, this.value);
            z = true;
        } catch (SAXNotRecognizedException e) {
            log(new StringBuffer().append("property not recognized: ").append(this.property).toString(), 3);
        } catch (SAXNotSupportedException e2) {
            log(new StringBuffer().append("property not supported: ").append(this.property).toString(), 3);
        }
        return z;
    }

    public void setFeature(String str) {
        this.feature = str;
    }

    public void setProperty(String str) {
        this.property = str;
    }

    public void setValue(String str) {
        this.value = str;
    }
}
