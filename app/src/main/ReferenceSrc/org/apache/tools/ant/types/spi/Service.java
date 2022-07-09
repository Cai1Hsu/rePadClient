package org.apache.tools.ant.types.spi;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.ProjectComponent;

/* loaded from: classes.jar:org/apache/tools/ant/types/spi/Service.class */
public class Service extends ProjectComponent {
    private List providerList = new ArrayList();
    private String type;

    public void addConfiguredProvider(Provider provider) {
        provider.check();
        this.providerList.add(provider);
    }

    public void check() {
        if (this.type == null) {
            throw new BuildException("type attribute must be set for service element", getLocation());
        }
        if (this.type.length() == 0) {
            throw new BuildException("Invalid empty type classname", getLocation());
        }
        if (this.providerList.size() != 0) {
            return;
        }
        throw new BuildException("provider attribute or nested provider element must be set!", getLocation());
    }

    public InputStream getAsStream() throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(byteArrayOutputStream, "UTF-8");
        for (Provider provider : this.providerList) {
            outputStreamWriter.write(provider.getClassName());
            outputStreamWriter.write("\n");
        }
        outputStreamWriter.close();
        return new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
    }

    public String getType() {
        return this.type;
    }

    public void setProvider(String str) {
        Provider provider = new Provider();
        provider.setClassName(str);
        this.providerList.add(provider);
    }

    public void setType(String str) {
        this.type = str;
    }
}
