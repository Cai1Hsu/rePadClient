package org.apache.tools.ant.types.resources;

import org.apache.tools.ant.types.ResourceCollection;

/* loaded from: classes.jar:org/apache/tools/ant/types/resources/CompressedResource.class */
public abstract class CompressedResource extends ContentTransformingResource {
    protected CompressedResource() {
    }

    protected CompressedResource(ResourceCollection resourceCollection) {
        addConfigured(resourceCollection);
    }

    protected abstract String getCompressionName();

    @Override // org.apache.tools.ant.types.Resource, org.apache.tools.ant.types.DataType
    public String toString() {
        return new StringBuffer().append(getCompressionName()).append(" compressed ").append(super.toString()).toString();
    }
}
