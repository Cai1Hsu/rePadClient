package org.apache.http.entity.mime;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

/* loaded from: classes.jar:org/apache/http/entity/mime/Header.class */
public class Header implements Iterable<MinimalField> {
    private final List<MinimalField> fields = new LinkedList();
    private final Map<String, List<MinimalField>> fieldMap = new HashMap();

    public void addField(MinimalField minimalField) {
        if (minimalField == null) {
            return;
        }
        String lowerCase = minimalField.getName().toLowerCase(Locale.US);
        List<MinimalField> list = this.fieldMap.get(lowerCase);
        LinkedList linkedList = list;
        if (list == null) {
            linkedList = new LinkedList();
            this.fieldMap.put(lowerCase, linkedList);
        }
        linkedList.add(minimalField);
        this.fields.add(minimalField);
    }

    public MinimalField getField(String str) {
        MinimalField minimalField;
        if (str == null) {
            minimalField = null;
        } else {
            List<MinimalField> list = this.fieldMap.get(str.toLowerCase(Locale.US));
            minimalField = null;
            if (list != null) {
                minimalField = null;
                if (!list.isEmpty()) {
                    minimalField = list.get(0);
                }
            }
        }
        return minimalField;
    }

    public List<MinimalField> getFields() {
        return new ArrayList(this.fields);
    }

    public List<MinimalField> getFields(String str) {
        ArrayList emptyList;
        if (str == null) {
            emptyList = null;
        } else {
            List<MinimalField> list = this.fieldMap.get(str.toLowerCase(Locale.US));
            emptyList = (list == null || list.isEmpty()) ? Collections.emptyList() : new ArrayList(list);
        }
        return emptyList;
    }

    @Override // java.lang.Iterable
    public Iterator<MinimalField> iterator() {
        return Collections.unmodifiableList(this.fields).iterator();
    }

    public int removeFields(String str) {
        int i;
        if (str == null) {
            i = 0;
        } else {
            List<MinimalField> remove = this.fieldMap.remove(str.toLowerCase(Locale.US));
            i = 0;
            if (remove != null) {
                i = 0;
                if (!remove.isEmpty()) {
                    this.fields.removeAll(remove);
                    i = remove.size();
                }
            }
        }
        return i;
    }

    public void setField(MinimalField minimalField) {
        if (minimalField == null) {
            return;
        }
        List<MinimalField> list = this.fieldMap.get(minimalField.getName().toLowerCase(Locale.US));
        if (list == null || list.isEmpty()) {
            addField(minimalField);
            return;
        }
        list.clear();
        list.add(minimalField);
        int i = -1;
        int i2 = 0;
        Iterator<MinimalField> it = this.fields.iterator();
        while (it.hasNext()) {
            int i3 = i;
            if (it.next().getName().equalsIgnoreCase(minimalField.getName())) {
                it.remove();
                i3 = i;
                if (i == -1) {
                    i3 = i2;
                }
            }
            i2++;
            i = i3;
        }
        this.fields.add(i, minimalField);
    }

    public String toString() {
        return this.fields.toString();
    }
}
