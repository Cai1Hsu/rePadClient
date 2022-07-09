package org.apache.tools.ant.util;

import java.util.Stack;

/* loaded from: classes.jar:org/apache/tools/ant/util/IdentityStack.class */
public class IdentityStack extends Stack {
    private static final long serialVersionUID = -5555522620060077046L;

    public IdentityStack() {
    }

    public IdentityStack(Object obj) {
        push(obj);
    }

    public static IdentityStack getInstance(Stack stack) {
        IdentityStack identityStack;
        if (stack instanceof IdentityStack) {
            identityStack = (IdentityStack) stack;
        } else {
            IdentityStack identityStack2 = new IdentityStack();
            if (stack != null) {
                identityStack2.addAll(stack);
            }
            identityStack = identityStack2;
        }
        return identityStack;
    }

    @Override // java.util.Vector, java.util.AbstractCollection, java.util.Collection, java.util.List
    public boolean contains(Object obj) {
        boolean z;
        synchronized (this) {
            z = indexOf(obj) >= 0;
        }
        return z;
    }

    @Override // java.util.Vector
    public int indexOf(Object obj, int i) {
        synchronized (this) {
            int size = size();
            while (true) {
                if (i >= size) {
                    i = -1;
                    break;
                } else if (get(i) == obj) {
                    break;
                } else {
                    i++;
                }
            }
        }
        return i;
    }

    @Override // java.util.Vector
    public int lastIndexOf(Object obj, int i) {
        synchronized (this) {
            while (true) {
                if (i < 0) {
                    i = -1;
                    break;
                } else if (get(i) == obj) {
                    break;
                } else {
                    i--;
                }
            }
        }
        return i;
    }
}
