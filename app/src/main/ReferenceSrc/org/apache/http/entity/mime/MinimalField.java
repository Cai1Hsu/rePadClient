package org.apache.http.entity.mime;

/* loaded from: classes.jar:org/apache/http/entity/mime/MinimalField.class */
public class MinimalField {
    private final String name;
    private final String value;

    MinimalField(String str, String str2) {
        this.name = str;
        this.value = str2;
    }

    public String getBody() {
        return this.value;
    }

    public String getName() {
        return this.name;
    }

    public String toString() {
        return this.name + ": " + this.value;
    }
}
