package org.apache.tools.ant.types;

import org.apache.tools.ant.BuildException;

/* loaded from: classes.jar:org/apache/tools/ant/types/Quantifier.class */
public class Quantifier extends EnumeratedAttribute {
    private static final String[] VALUES = {"all", "each", "every", "any", "some", "one", "majority", "most", "none"};
    public static final Quantifier ALL = new Quantifier("all");
    public static final Quantifier ANY = new Quantifier("any");
    public static final Quantifier ONE = new Quantifier("one");
    public static final Quantifier MAJORITY = new Quantifier("majority");
    public static final Quantifier NONE = new Quantifier("none");
    private static final Predicate ALL_PRED = new Predicate() { // from class: org.apache.tools.ant.types.Quantifier.1
        @Override // org.apache.tools.ant.types.Quantifier.Predicate
        boolean eval(int i, int i2) {
            return i2 == 0;
        }
    };
    private static final Predicate ANY_PRED = new Predicate() { // from class: org.apache.tools.ant.types.Quantifier.2
        @Override // org.apache.tools.ant.types.Quantifier.Predicate
        boolean eval(int i, int i2) {
            return i > 0;
        }
    };
    private static final Predicate ONE_PRED = new Predicate() { // from class: org.apache.tools.ant.types.Quantifier.3
        @Override // org.apache.tools.ant.types.Quantifier.Predicate
        boolean eval(int i, int i2) {
            boolean z = true;
            if (i != 1) {
                z = false;
            }
            return z;
        }
    };
    private static final Predicate MAJORITY_PRED = new Predicate() { // from class: org.apache.tools.ant.types.Quantifier.4
        @Override // org.apache.tools.ant.types.Quantifier.Predicate
        boolean eval(int i, int i2) {
            return i > i2;
        }
    };
    private static final Predicate NONE_PRED = new Predicate() { // from class: org.apache.tools.ant.types.Quantifier.5
        @Override // org.apache.tools.ant.types.Quantifier.Predicate
        boolean eval(int i, int i2) {
            return i == 0;
        }
    };
    private static final Predicate[] PREDS = new Predicate[VALUES.length];

    /* loaded from: classes.jar:org/apache/tools/ant/types/Quantifier$Predicate.class */
    private static abstract class Predicate {
        private Predicate() {
        }

        Predicate(AnonymousClass1 anonymousClass1) {
            this();
        }

        abstract boolean eval(int i, int i2);
    }

    static {
        PREDS[0] = ALL_PRED;
        PREDS[1] = ALL_PRED;
        PREDS[2] = ALL_PRED;
        PREDS[3] = ANY_PRED;
        PREDS[4] = ANY_PRED;
        PREDS[5] = ONE_PRED;
        PREDS[6] = MAJORITY_PRED;
        PREDS[7] = MAJORITY_PRED;
        PREDS[8] = NONE_PRED;
    }

    public Quantifier() {
    }

    public Quantifier(String str) {
        setValue(str);
    }

    public boolean evaluate(int i, int i2) {
        int index = getIndex();
        if (index == -1) {
            throw new BuildException("Quantifier value not set.");
        }
        return PREDS[index].eval(i, i2);
    }

    public boolean evaluate(boolean[] zArr) {
        int i = 0;
        int i2 = 0;
        while (i2 < zArr.length) {
            int i3 = i;
            if (zArr[i2]) {
                i3 = i + 1;
            }
            i2++;
            i = i3;
        }
        return evaluate(i, zArr.length - i);
    }

    @Override // org.apache.tools.ant.types.EnumeratedAttribute
    public String[] getValues() {
        return VALUES;
    }
}
