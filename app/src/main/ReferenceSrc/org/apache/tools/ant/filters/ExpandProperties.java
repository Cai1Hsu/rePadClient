package org.apache.tools.ant.filters;

import java.io.IOException;
import java.io.Reader;
import java.util.Properties;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;
import org.apache.tools.ant.PropertyHelper;
import org.apache.tools.ant.property.GetProperty;
import org.apache.tools.ant.property.ParseProperties;
import org.apache.tools.ant.types.PropertySet;

/* loaded from: classes.jar:org/apache/tools/ant/filters/ExpandProperties.class */
public final class ExpandProperties extends BaseFilterReader implements ChainableReader {
    private static final int EOF = -1;
    private char[] buffer;
    private int index;
    private PropertySet propertySet;

    public ExpandProperties() {
    }

    public ExpandProperties(Reader reader) {
        super(reader);
    }

    public void add(PropertySet propertySet) {
        if (this.propertySet != null) {
            throw new BuildException("expandproperties filter accepts only one propertyset");
        }
        this.propertySet = propertySet;
    }

    @Override // org.apache.tools.ant.filters.ChainableReader
    public Reader chain(Reader reader) {
        ExpandProperties expandProperties = new ExpandProperties(reader);
        expandProperties.setProject(getProject());
        expandProperties.add(this.propertySet);
        return expandProperties;
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        char c = 65535;
        if (this.index > -1) {
            if (this.buffer == null) {
                String readFully = readFully();
                Project project = getProject();
                this.buffer = new ParseProperties(project, PropertyHelper.getPropertyHelper(project).getExpanders(), this.propertySet == null ? PropertyHelper.getPropertyHelper(project) : new GetProperty(this, this.propertySet.getProperties()) { // from class: org.apache.tools.ant.filters.ExpandProperties.1
                    private final ExpandProperties this$0;
                    private final Properties val$props;

                    {
                        this.this$0 = this;
                        this.val$props = r5;
                    }

                    @Override // org.apache.tools.ant.property.GetProperty
                    public Object getProperty(String str) {
                        return this.val$props.getProperty(str);
                    }
                }).parseProperties(readFully).toString().toCharArray();
            }
            if (this.index < this.buffer.length) {
                char[] cArr = this.buffer;
                int i = this.index;
                this.index = i + 1;
                c = cArr[i];
            } else {
                this.index = -1;
                c = 65535;
            }
        }
        return c;
    }
}
