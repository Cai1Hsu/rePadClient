package org.apache.tools.ant.types;

import java.net.URL;

/* loaded from: classes.jar:org/apache/tools/ant/types/ResourceLocation.class */
public class ResourceLocation {
    private String publicId = null;
    private String location = null;
    private URL base = null;

    public URL getBase() {
        return this.base;
    }

    public String getLocation() {
        return this.location;
    }

    public String getPublicId() {
        return this.publicId;
    }

    public void setBase(URL url) {
        this.base = url;
    }

    public void setLocation(String str) {
        this.location = str;
    }

    public void setPublicId(String str) {
        this.publicId = str;
    }
}
