package org.apache.tools.ant.property;

import java.util.Collection;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import org.apache.tools.ant.BuildException;
import org.apache.tools.ant.Project;

/* loaded from: classes.jar:org/apache/tools/ant/property/ResolvePropertyMap.class */
public class ResolvePropertyMap implements GetProperty {
    private Map map;
    private final GetProperty master;
    private final ParseProperties parseProperties;
    private String prefix;
    private final Set seen = new HashSet();
    private boolean prefixValues = false;
    private boolean expandingLHS = true;

    public ResolvePropertyMap(Project project, GetProperty getProperty, Collection collection) {
        this.master = getProperty;
        this.parseProperties = new ParseProperties(project, collection, this);
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x004a, code lost:
        if (r5.prefixValues != false) goto L15;
     */
    @Override // org.apache.tools.ant.property.GetProperty
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object getProperty(String str) {
        if (this.seen.contains(str)) {
            throw new BuildException(new StringBuffer().append("Property ").append(str).append(" was circularly ").append("defined.").toString());
        }
        String str2 = str;
        try {
            if (this.prefix != null) {
                if (!this.expandingLHS) {
                    str2 = str;
                }
                str2 = new StringBuffer().append(this.prefix).append(str).toString();
            }
            Object property = this.master.getProperty(str2);
            if (property == null) {
                this.seen.add(str);
                this.expandingLHS = false;
                property = this.parseProperties.parseProperties((String) this.map.get(str));
                this.seen.remove(str);
            }
            return property;
        } finally {
            this.seen.remove(str);
        }
    }

    public void resolveAllProperties(Map map) {
        resolveAllProperties(map, null, false);
    }

    public void resolveAllProperties(Map map, String str) {
        resolveAllProperties(map, null, false);
    }

    public void resolveAllProperties(Map map, String str, boolean z) {
        this.map = map;
        this.prefix = str;
        this.prefixValues = z;
        for (String str2 : map.keySet()) {
            this.expandingLHS = true;
            Object property = getProperty(str2);
            map.put(str2, property == null ? "" : property.toString());
        }
    }
}
