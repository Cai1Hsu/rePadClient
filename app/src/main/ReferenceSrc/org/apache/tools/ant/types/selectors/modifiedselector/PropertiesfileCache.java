package org.apache.tools.ant.types.selectors.modifiedselector;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Properties;
import java.util.Vector;

/* loaded from: classes.jar:org/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache.class */
public class PropertiesfileCache implements Cache {
    private Properties cache;
    private boolean cacheDirty;
    private boolean cacheLoaded;
    private File cachefile;

    public PropertiesfileCache() {
        this.cachefile = null;
        this.cache = new Properties();
        this.cacheLoaded = false;
        this.cacheDirty = true;
    }

    public PropertiesfileCache(File file) {
        this.cachefile = null;
        this.cache = new Properties();
        this.cacheLoaded = false;
        this.cacheDirty = true;
        this.cachefile = file;
    }

    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Cache
    public void delete() {
        this.cache = new Properties();
        this.cachefile.delete();
        this.cacheLoaded = true;
        this.cacheDirty = false;
    }

    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Cache
    public Object get(Object obj) {
        String str;
        if (!this.cacheLoaded) {
            load();
        }
        try {
            str = this.cache.getProperty(String.valueOf(obj));
        } catch (ClassCastException e) {
            str = null;
        }
        return str;
    }

    public File getCachefile() {
        return this.cachefile;
    }

    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Cache
    public boolean isValid() {
        return this.cachefile != null;
    }

    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Cache
    public Iterator iterator() {
        Vector vector = new Vector();
        Enumeration<?> propertyNames = this.cache.propertyNames();
        while (propertyNames.hasMoreElements()) {
            vector.add(propertyNames.nextElement());
        }
        return vector.iterator();
    }

    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Cache
    public void load() {
        if (this.cachefile != null && this.cachefile.isFile() && this.cachefile.canRead()) {
            try {
                BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(this.cachefile));
                this.cache.load(bufferedInputStream);
                bufferedInputStream.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        this.cacheLoaded = true;
        this.cacheDirty = false;
    }

    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Cache
    public void put(Object obj, Object obj2) {
        this.cache.put(String.valueOf(obj), String.valueOf(obj2));
        this.cacheDirty = true;
    }

    @Override // org.apache.tools.ant.types.selectors.modifiedselector.Cache
    public void save() {
        if (!this.cacheDirty) {
            return;
        }
        if (this.cachefile != null && this.cache.propertyNames().hasMoreElements()) {
            try {
                BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(this.cachefile));
                this.cache.store(bufferedOutputStream, (String) null);
                bufferedOutputStream.flush();
                bufferedOutputStream.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        this.cacheDirty = false;
    }

    public void setCachefile(File file) {
        this.cachefile = file;
    }

    public String toString() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("<PropertiesfileCache:");
        stringBuffer.append("cachefile=").append(this.cachefile);
        stringBuffer.append(";noOfEntries=").append(this.cache.size());
        stringBuffer.append(">");
        return stringBuffer.toString();
    }
}
