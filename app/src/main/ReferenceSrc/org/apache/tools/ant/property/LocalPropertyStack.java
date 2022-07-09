package org.apache.tools.ant.property;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import org.apache.tools.ant.PropertyHelper;

/* loaded from: classes.jar:org/apache/tools/ant/property/LocalPropertyStack.class */
public class LocalPropertyStack {
    private LinkedList stack = new LinkedList();

    private Map getMapForProperty(String str) {
        Map map;
        Iterator it = this.stack.iterator();
        while (true) {
            if (!it.hasNext()) {
                map = null;
                break;
            }
            Map map2 = (Map) it.next();
            if (map2.get(str) != null) {
                map = map2;
                break;
            }
        }
        return map;
    }

    public void addLocal(String str) {
        if (!this.stack.isEmpty()) {
            ((Map) this.stack.getFirst()).put(str, NullReturn.NULL);
        }
    }

    public LocalPropertyStack copy() {
        LocalPropertyStack localPropertyStack = new LocalPropertyStack();
        localPropertyStack.stack.addAll(this.stack);
        return localPropertyStack;
    }

    public void enterScope() {
        this.stack.addFirst(new HashMap());
    }

    public Object evaluate(String str, PropertyHelper propertyHelper) {
        Object obj;
        Iterator it = this.stack.iterator();
        while (true) {
            if (!it.hasNext()) {
                obj = null;
                break;
            }
            Object obj2 = ((Map) it.next()).get(str);
            if (obj2 != null) {
                obj = obj2;
                break;
            }
        }
        return obj;
    }

    public void exitScope() {
        ((HashMap) this.stack.removeFirst()).clear();
    }

    public boolean set(String str, Object obj, PropertyHelper propertyHelper) {
        boolean z;
        Map mapForProperty = getMapForProperty(str);
        if (mapForProperty == null) {
            z = false;
        } else {
            mapForProperty.put(str, obj);
            z = true;
        }
        return z;
    }

    public boolean setNew(String str, Object obj, PropertyHelper propertyHelper) {
        boolean z;
        Map mapForProperty = getMapForProperty(str);
        if (mapForProperty == null) {
            z = false;
        } else {
            if (mapForProperty.get(str) == NullReturn.NULL) {
                mapForProperty.put(str, obj);
            }
            z = true;
        }
        return z;
    }
}
