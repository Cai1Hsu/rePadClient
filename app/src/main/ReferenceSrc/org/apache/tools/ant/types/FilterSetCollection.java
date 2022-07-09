package org.apache.tools.ant.types;

import java.util.Enumeration;
import java.util.Vector;

/* loaded from: classes.jar:org/apache/tools/ant/types/FilterSetCollection.class */
public class FilterSetCollection {
    private Vector filterSets = new Vector();

    public FilterSetCollection() {
    }

    public FilterSetCollection(FilterSet filterSet) {
        addFilterSet(filterSet);
    }

    public void addFilterSet(FilterSet filterSet) {
        this.filterSets.addElement(filterSet);
    }

    public boolean hasFilters() {
        boolean z;
        Enumeration elements = this.filterSets.elements();
        while (true) {
            if (!elements.hasMoreElements()) {
                z = false;
                break;
            } else if (((FilterSet) elements.nextElement()).hasFilters()) {
                z = true;
                break;
            }
        }
        return z;
    }

    public String replaceTokens(String str) {
        Enumeration elements = this.filterSets.elements();
        while (elements.hasMoreElements()) {
            str = ((FilterSet) elements.nextElement()).replaceTokens(str);
        }
        return str;
    }
}
