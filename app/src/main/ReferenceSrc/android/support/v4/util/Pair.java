package android.support.v4.util;

/* loaded from: classes.jar:android/support/v4/util/Pair.class */
public class Pair<F, S> {
    public final F first;
    public final S second;

    public Pair(F f, S s) {
        this.first = f;
        this.second = s;
    }

    public static <A, B> Pair<A, B> create(A a, B b) {
        return new Pair<>(a, b);
    }

    private static boolean objectsEqual(Object obj, Object obj2) {
        return obj == obj2 || (obj != null && obj.equals(obj2));
    }

    public boolean equals(Object obj) {
        boolean z;
        if (!(obj instanceof Pair)) {
            z = false;
        } else {
            Pair pair = (Pair) obj;
            z = false;
            if (objectsEqual(pair.first, this.first)) {
                z = false;
                if (objectsEqual(pair.second, this.second)) {
                    z = true;
                }
            }
        }
        return z;
    }

    public int hashCode() {
        int i = 0;
        int hashCode = this.first == null ? 0 : this.first.hashCode();
        if (this.second != null) {
            i = this.second.hashCode();
        }
        return hashCode ^ i;
    }

    public String toString() {
        return "Pair{" + String.valueOf(this.first) + " " + String.valueOf(this.second) + "}";
    }
}
