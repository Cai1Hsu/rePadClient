package org.apache.tools.ant;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.apache.tools.ant.IntrospectionHelper;
import org.apache.tools.ant.taskdefs.MacroDef;
import org.apache.tools.ant.taskdefs.MacroInstance;
import org.apache.tools.ant.util.CollectionUtils;
import org.xml.sax.AttributeList;
import org.xml.sax.helpers.AttributeListImpl;

/* loaded from: classes.jar:org/apache/tools/ant/RuntimeConfigurable.class */
public class RuntimeConfigurable implements Serializable {
    private static final Hashtable EMPTY_HASHTABLE = new Hashtable(0);
    private static final long serialVersionUID = 1;
    private transient AttributeList attributes;
    private transient IntrospectionHelper.Creator creator;
    private String elementTag = null;
    private List children = null;
    private transient Object wrappedObject = null;
    private LinkedHashMap attributeMap = null;
    private StringBuffer characters = null;
    private boolean proxyConfigured = false;
    private String polyType = null;
    private String id = null;

    public RuntimeConfigurable(Object obj, String str) {
        setProxy(obj);
        setElementTag(str);
        if (obj instanceof Task) {
            ((Task) obj).setRuntimeConfigurableWrapper(this);
        }
    }

    public void addChild(RuntimeConfigurable runtimeConfigurable) {
        synchronized (this) {
            this.children = this.children == null ? new ArrayList() : this.children;
            this.children.add(runtimeConfigurable);
        }
    }

    public void addText(String str) {
        synchronized (this) {
            if (str.length() != 0) {
                this.characters = this.characters == null ? new StringBuffer(str) : this.characters.append(str);
            }
        }
    }

    public void addText(char[] cArr, int i, int i2) {
        synchronized (this) {
            if (i2 != 0) {
                this.characters = (this.characters == null ? new StringBuffer(i2) : this.characters).append(cArr, i, i2);
            }
        }
    }

    public void applyPreSet(RuntimeConfigurable runtimeConfigurable) {
        if (runtimeConfigurable.attributeMap != null) {
            for (String str : runtimeConfigurable.attributeMap.keySet()) {
                if (this.attributeMap == null || this.attributeMap.get(str) == null) {
                    setAttribute(str, (String) runtimeConfigurable.attributeMap.get(str));
                }
            }
        }
        this.polyType = this.polyType == null ? runtimeConfigurable.polyType : this.polyType;
        if (runtimeConfigurable.children != null) {
            ArrayList arrayList = new ArrayList();
            arrayList.addAll(runtimeConfigurable.children);
            if (this.children != null) {
                arrayList.addAll(this.children);
            }
            this.children = arrayList;
        }
        if (runtimeConfigurable.characters != null) {
            if (this.characters != null && this.characters.toString().trim().length() != 0) {
                return;
            }
            this.characters = new StringBuffer(runtimeConfigurable.characters.toString());
        }
    }

    public Hashtable getAttributeMap() {
        Hashtable hashtable;
        synchronized (this) {
            hashtable = this.attributeMap == null ? EMPTY_HASHTABLE : new Hashtable(this.attributeMap);
        }
        return hashtable;
    }

    public AttributeList getAttributes() {
        AttributeList attributeList;
        synchronized (this) {
            attributeList = this.attributes;
        }
        return attributeList;
    }

    RuntimeConfigurable getChild(int i) {
        RuntimeConfigurable runtimeConfigurable;
        synchronized (this) {
            runtimeConfigurable = (RuntimeConfigurable) this.children.get(i);
        }
        return runtimeConfigurable;
    }

    public Enumeration getChildren() {
        CollectionUtils.EmptyEnumeration emptyEnumeration;
        synchronized (this) {
            emptyEnumeration = this.children == null ? new CollectionUtils.EmptyEnumeration() : Collections.enumeration(this.children);
        }
        return emptyEnumeration;
    }

    public String getElementTag() {
        String str;
        synchronized (this) {
            str = this.elementTag;
        }
        return str;
    }

    public String getId() {
        String str;
        synchronized (this) {
            str = this.id;
        }
        return str;
    }

    public String getPolyType() {
        String str;
        synchronized (this) {
            str = this.polyType;
        }
        return str;
    }

    public Object getProxy() {
        Object obj;
        synchronized (this) {
            obj = this.wrappedObject;
        }
        return obj;
    }

    public StringBuffer getText() {
        StringBuffer stringBuffer;
        synchronized (this) {
            stringBuffer = this.characters == null ? new StringBuffer(0) : this.characters;
        }
        return stringBuffer;
    }

    public void maybeConfigure(Project project) throws BuildException {
        maybeConfigure(project, true);
    }

    public void maybeConfigure(Project project, boolean z) throws BuildException {
        MacroDef.Attribute attribute;
        synchronized (this) {
            if (!this.proxyConfigured) {
                Object proxy = this.wrappedObject instanceof TypeAdapter ? ((TypeAdapter) this.wrappedObject).getProxy() : this.wrappedObject;
                IntrospectionHelper helper = IntrospectionHelper.getHelper(project, proxy.getClass());
                if (this.attributeMap != null) {
                    for (Map.Entry entry : this.attributeMap.entrySet()) {
                        String str = (String) entry.getKey();
                        String str2 = (String) entry.getValue();
                        Object parseProperties = PropertyHelper.getPropertyHelper(project).parseProperties(str2);
                        String str3 = parseProperties;
                        if (proxy instanceof MacroInstance) {
                            Iterator it = ((MacroInstance) proxy).getMacroDef().getAttributes().iterator();
                            do {
                                str3 = parseProperties;
                                if (it.hasNext()) {
                                    attribute = (MacroDef.Attribute) it.next();
                                }
                            } while (!attribute.getName().equals(str));
                            str3 = parseProperties;
                            if (!attribute.isDoubleExpanding()) {
                                str3 = str2;
                            }
                        }
                        try {
                            helper.setAttribute(project, proxy, str, str3);
                        } catch (UnsupportedAttributeException e) {
                            if (!str.equals("id")) {
                                if (getElementTag() != null) {
                                    throw new BuildException(new StringBuffer().append(getElementTag()).append(" doesn't support the \"").append(e.getAttribute()).append("\" attribute").toString(), e);
                                }
                                throw e;
                            }
                        } catch (BuildException e2) {
                            if (!str.equals("id")) {
                                throw e2;
                            }
                        }
                    }
                }
                if (this.characters != null) {
                    ProjectHelper.addText(project, this.wrappedObject, this.characters.substring(0));
                }
                if (this.id != null) {
                    project.addReference(this.id, this.wrappedObject);
                }
                this.proxyConfigured = true;
            }
        }
    }

    public void reconfigure(Project project) {
        this.proxyConfigured = false;
        maybeConfigure(project);
    }

    public void removeAttribute(String str) {
        synchronized (this) {
            this.attributeMap.remove(str);
        }
    }

    public void setAttribute(String str, String str2) {
        synchronized (this) {
            if (str.equalsIgnoreCase(ProjectHelper.ANT_TYPE)) {
                this.polyType = str2;
            } else {
                if (this.attributeMap == null) {
                    this.attributeMap = new LinkedHashMap();
                }
                if (!str.equalsIgnoreCase("refid") || this.attributeMap.isEmpty()) {
                    this.attributeMap.put(str, str2);
                } else {
                    LinkedHashMap linkedHashMap = new LinkedHashMap();
                    linkedHashMap.put(str, str2);
                    linkedHashMap.putAll(this.attributeMap);
                    this.attributeMap = linkedHashMap;
                }
                if (str.equals("id")) {
                    this.id = str2;
                }
            }
        }
    }

    public void setAttributes(AttributeList attributeList) {
        synchronized (this) {
            this.attributes = new AttributeListImpl(attributeList);
            for (int i = 0; i < attributeList.getLength(); i++) {
                setAttribute(attributeList.getName(i), attributeList.getValue(i));
            }
        }
    }

    void setCreator(IntrospectionHelper.Creator creator) {
        synchronized (this) {
            this.creator = creator;
        }
    }

    public void setElementTag(String str) {
        synchronized (this) {
            this.elementTag = str;
        }
    }

    public void setPolyType(String str) {
        synchronized (this) {
            this.polyType = str;
        }
    }

    public void setProxy(Object obj) {
        synchronized (this) {
            this.wrappedObject = obj;
            this.proxyConfigured = false;
        }
    }
}
