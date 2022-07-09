package org.apache.tools.ant.util;

import java.util.Enumeration;
import java.util.Hashtable;

/* loaded from: classes.jar:org/apache/tools/ant/util/LazyHashtable.class */
public class LazyHashtable extends Hashtable {
    protected boolean initAllDone = false;

    @Override // java.util.Hashtable
    public boolean contains(Object obj) {
        initAll();
        return super.contains(obj);
    }

    @Override // java.util.Hashtable, java.util.Map
    public boolean containsKey(Object obj) {
        initAll();
        return super.containsKey(obj);
    }

    @Override // java.util.Hashtable, java.util.Map
    public boolean containsValue(Object obj) {
        return contains(obj);
    }

    @Override // java.util.Hashtable, java.util.Dictionary
    public Enumeration elements() {
        initAll();
        return super.elements();
    }

    protected void initAll() {
        if (this.initAllDone) {
            return;
        }
        this.initAllDone = true;
    }

    @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
    public boolean isEmpty() {
        initAll();
        return super.isEmpty();
    }

    @Override // java.util.Hashtable, java.util.Dictionary
    public Enumeration keys() {
        initAll();
        return super.keys();
    }

    @Override // java.util.Hashtable, java.util.Dictionary, java.util.Map
    public int size() {
        initAll();
        return super.size();
    }
}
