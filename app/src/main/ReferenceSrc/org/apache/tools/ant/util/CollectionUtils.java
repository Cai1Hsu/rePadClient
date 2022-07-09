package org.apache.tools.ant.util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Dictionary;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Vector;

/* loaded from: classes.jar:org/apache/tools/ant/util/CollectionUtils.class */
public class CollectionUtils {
    public static final List EMPTY_LIST = Collections.unmodifiableList(new ArrayList(0));

    /* loaded from: classes.jar:org/apache/tools/ant/util/CollectionUtils$CompoundEnumeration.class */
    private static final class CompoundEnumeration implements Enumeration {
        private final Enumeration e1;
        private final Enumeration e2;

        public CompoundEnumeration(Enumeration enumeration, Enumeration enumeration2) {
            this.e1 = enumeration;
            this.e2 = enumeration2;
        }

        @Override // java.util.Enumeration
        public boolean hasMoreElements() {
            return this.e1.hasMoreElements() || this.e2.hasMoreElements();
        }

        @Override // java.util.Enumeration
        public Object nextElement() throws NoSuchElementException {
            return this.e1.hasMoreElements() ? this.e1.nextElement() : this.e2.nextElement();
        }
    }

    /* loaded from: classes.jar:org/apache/tools/ant/util/CollectionUtils$EmptyEnumeration.class */
    public static final class EmptyEnumeration implements Enumeration {
        @Override // java.util.Enumeration
        public boolean hasMoreElements() {
            return false;
        }

        @Override // java.util.Enumeration
        public Object nextElement() throws NoSuchElementException {
            throw new NoSuchElementException();
        }
    }

    public static Enumeration append(Enumeration enumeration, Enumeration enumeration2) {
        return new CompoundEnumeration(enumeration, enumeration2);
    }

    public static Collection asCollection(Iterator it) {
        ArrayList arrayList = new ArrayList();
        while (it.hasNext()) {
            arrayList.add(it.next());
        }
        return arrayList;
    }

    public static Enumeration asEnumeration(Iterator it) {
        return new Enumeration(it) { // from class: org.apache.tools.ant.util.CollectionUtils.1
            private final Iterator val$iter;

            {
                this.val$iter = it;
            }

            @Override // java.util.Enumeration
            public boolean hasMoreElements() {
                return this.val$iter.hasNext();
            }

            @Override // java.util.Enumeration
            public Object nextElement() {
                return this.val$iter.next();
            }
        };
    }

    public static Iterator asIterator(Enumeration enumeration) {
        return new Iterator(enumeration) { // from class: org.apache.tools.ant.util.CollectionUtils.2
            private final Enumeration val$e;

            {
                this.val$e = enumeration;
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.val$e.hasMoreElements();
            }

            @Override // java.util.Iterator
            public Object next() {
                return this.val$e.nextElement();
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }
        };
    }

    public static boolean equals(Dictionary dictionary, Dictionary dictionary2) {
        boolean z;
        Object obj;
        Object obj2;
        if (dictionary == dictionary2) {
            z = true;
        } else if (dictionary == null || dictionary2 == null) {
            z = false;
        } else if (dictionary.size() != dictionary2.size()) {
            z = false;
        } else {
            Enumeration keys = dictionary.keys();
            do {
                z = true;
                if (!keys.hasMoreElements()) {
                    break;
                }
                Object nextElement = keys.nextElement();
                obj = dictionary.get(nextElement);
                obj2 = dictionary2.get(nextElement);
                if (obj2 == null) {
                    break;
                }
            } while (obj.equals(obj2));
            z = false;
        }
        return z;
    }

    public static boolean equals(Vector vector, Vector vector2) {
        return vector == vector2 ? true : (vector == null || vector2 == null) ? false : vector.equals(vector2);
    }

    public static String flattenToString(Collection collection) {
        boolean z = true;
        StringBuffer stringBuffer = new StringBuffer();
        for (Object obj : collection) {
            if (!z) {
                stringBuffer.append(",");
            }
            stringBuffer.append(String.valueOf(obj));
            z = false;
        }
        return stringBuffer.toString();
    }

    public static int frequency(Collection collection, Object obj) {
        int i = 0;
        int i2 = 0;
        if (collection != null) {
            Iterator it = collection.iterator();
            while (true) {
                i = i2;
                if (!it.hasNext()) {
                    break;
                }
                Object next = it.next();
                if (obj == null) {
                    if (next == null) {
                        i2++;
                    }
                } else if (obj.equals(next)) {
                    i2++;
                }
            }
        }
        return i;
    }

    public static void putAll(Dictionary dictionary, Dictionary dictionary2) {
        Enumeration keys = dictionary2.keys();
        while (keys.hasMoreElements()) {
            Object nextElement = keys.nextElement();
            dictionary.put(nextElement, dictionary2.get(nextElement));
        }
    }
}
