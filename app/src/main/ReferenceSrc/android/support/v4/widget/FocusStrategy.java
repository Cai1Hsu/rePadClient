package android.support.v4.widget;

import android.graphics.Rect;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.media.TransportMediator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/* loaded from: classes.jar:android/support/v4/widget/FocusStrategy.class */
class FocusStrategy {

    /* loaded from: classes.jar:android/support/v4/widget/FocusStrategy$BoundsAdapter.class */
    public interface BoundsAdapter<T> {
        void obtainBounds(T t, Rect rect);
    }

    /* loaded from: classes.jar:android/support/v4/widget/FocusStrategy$CollectionAdapter.class */
    public interface CollectionAdapter<T, V> {
        V get(T t, int i);

        int size(T t);
    }

    /* loaded from: classes.jar:android/support/v4/widget/FocusStrategy$SequentialComparator.class */
    private static class SequentialComparator<T> implements Comparator<T> {
        private final BoundsAdapter<T> mAdapter;
        private final boolean mIsLayoutRtl;
        private final Rect mTemp1 = new Rect();
        private final Rect mTemp2 = new Rect();

        SequentialComparator(boolean z, BoundsAdapter<T> boundsAdapter) {
            this.mIsLayoutRtl = z;
            this.mAdapter = boundsAdapter;
        }

        @Override // java.util.Comparator
        public int compare(T t, T t2) {
            int i = 1;
            Rect rect = this.mTemp1;
            Rect rect2 = this.mTemp2;
            this.mAdapter.obtainBounds(t, rect);
            this.mAdapter.obtainBounds(t2, rect2);
            if (rect.top < rect2.top) {
                i = -1;
            } else if (rect.top > rect2.top) {
                i = 1;
            } else if (rect.left < rect2.left) {
                if (!this.mIsLayoutRtl) {
                    i = -1;
                }
            } else if (rect.left > rect2.left) {
                i = -1;
                if (!this.mIsLayoutRtl) {
                    i = 1;
                }
            } else {
                i = -1;
                if (rect.bottom >= rect2.bottom) {
                    if (rect.bottom > rect2.bottom) {
                        i = 1;
                    } else if (rect.right < rect2.right) {
                        i = this.mIsLayoutRtl ? 1 : -1;
                    } else if (rect.right > rect2.right) {
                        i = -1;
                        if (!this.mIsLayoutRtl) {
                            i = 1;
                        }
                    } else {
                        i = 0;
                    }
                }
            }
            return i;
        }
    }

    FocusStrategy() {
    }

    private static boolean beamBeats(int i, @NonNull Rect rect, @NonNull Rect rect2, @NonNull Rect rect3) {
        boolean z;
        boolean beamsOverlap = beamsOverlap(i, rect, rect2);
        if (beamsOverlap(i, rect, rect3) || !beamsOverlap) {
            z = false;
        } else {
            z = true;
            if (isToDirectionOf(i, rect, rect3)) {
                z = true;
                if (i != 17) {
                    z = true;
                    if (i != 66) {
                        z = true;
                        if (majorAxisDistance(i, rect, rect2) >= majorAxisDistanceToFarEdge(i, rect, rect3)) {
                            z = false;
                        }
                    }
                }
            }
        }
        return z;
    }

    private static boolean beamsOverlap(int i, @NonNull Rect rect, @NonNull Rect rect2) {
        boolean z = true;
        switch (i) {
            case 17:
            case 66:
                if (rect2.bottom < rect.top || rect2.top > rect.bottom) {
                    z = false;
                    break;
                }
                break;
            case 33:
            case TransportMediator.KEYCODE_MEDIA_RECORD /* 130 */:
                if (rect2.right < rect.left || rect2.left > rect.right) {
                    z = false;
                    break;
                }
                break;
            default:
                throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
        }
        return z;
    }

    public static <L, T> T findNextFocusInAbsoluteDirection(@NonNull L l, @NonNull CollectionAdapter<L, T> collectionAdapter, @NonNull BoundsAdapter<T> boundsAdapter, @Nullable T t, @NonNull Rect rect, int i) {
        Rect rect2 = new Rect(rect);
        switch (i) {
            case 17:
                rect2.offset(rect.width() + 1, 0);
                break;
            case 33:
                rect2.offset(0, rect.height() + 1);
                break;
            case 66:
                rect2.offset(-(rect.width() + 1), 0);
                break;
            case TransportMediator.KEYCODE_MEDIA_RECORD /* 130 */:
                rect2.offset(0, -(rect.height() + 1));
                break;
            default:
                throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
        }
        T t2 = null;
        int size = collectionAdapter.size(l);
        Rect rect3 = new Rect();
        for (int i2 = 0; i2 < size; i2++) {
            T t3 = collectionAdapter.get(l, i2);
            if (t3 != t) {
                boundsAdapter.obtainBounds(t3, rect3);
                if (isBetterCandidate(i, rect, rect3, rect2)) {
                    rect2.set(rect3);
                    t2 = t3;
                }
            }
        }
        return t2;
    }

    public static <L, T> T findNextFocusInRelativeDirection(@NonNull L l, @NonNull CollectionAdapter<L, T> collectionAdapter, @NonNull BoundsAdapter<T> boundsAdapter, @Nullable T t, int i, boolean z, boolean z2) {
        Object previousFocusable;
        int size = collectionAdapter.size(l);
        ArrayList arrayList = new ArrayList(size);
        for (int i2 = 0; i2 < size; i2++) {
            arrayList.add(collectionAdapter.get(l, i2));
        }
        Collections.sort(arrayList, new SequentialComparator(z, boundsAdapter));
        switch (i) {
            case 1:
                previousFocusable = getPreviousFocusable(t, arrayList, z2);
                break;
            case 2:
                previousFocusable = getNextFocusable(t, arrayList, z2);
                break;
            default:
                throw new IllegalArgumentException("direction must be one of {FOCUS_FORWARD, FOCUS_BACKWARD}.");
        }
        return (T) previousFocusable;
    }

    private static <T> T getNextFocusable(T t, ArrayList<T> arrayList, boolean z) {
        int size = arrayList.size();
        int lastIndexOf = (t == null ? -1 : arrayList.lastIndexOf(t)) + 1;
        return lastIndexOf < size ? arrayList.get(lastIndexOf) : (!z || size <= 0) ? null : arrayList.get(0);
    }

    private static <T> T getPreviousFocusable(T t, ArrayList<T> arrayList, boolean z) {
        int size = arrayList.size();
        int indexOf = (t == null ? size : arrayList.indexOf(t)) - 1;
        return indexOf >= 0 ? arrayList.get(indexOf) : (!z || size <= 0) ? null : arrayList.get(size - 1);
    }

    private static int getWeightedDistanceFor(int i, int i2) {
        return (i * 13 * i) + (i2 * i2);
    }

    private static boolean isBetterCandidate(int i, @NonNull Rect rect, @NonNull Rect rect2, @NonNull Rect rect3) {
        boolean z;
        if (!isCandidate(rect, rect2, i)) {
            z = false;
        } else {
            z = true;
            if (isCandidate(rect, rect3, i)) {
                z = true;
                if (!beamBeats(i, rect, rect2, rect3)) {
                    if (beamBeats(i, rect, rect3, rect2)) {
                        z = false;
                    } else {
                        z = true;
                        if (getWeightedDistanceFor(majorAxisDistance(i, rect, rect2), minorAxisDistance(i, rect, rect2)) >= getWeightedDistanceFor(majorAxisDistance(i, rect, rect3), minorAxisDistance(i, rect, rect3))) {
                            z = false;
                        }
                    }
                }
            }
        }
        return z;
    }

    private static boolean isCandidate(@NonNull Rect rect, @NonNull Rect rect2, int i) {
        boolean z = true;
        switch (i) {
            case 17:
                if ((rect.right <= rect2.right && rect.left < rect2.right) || rect.left <= rect2.left) {
                    z = false;
                    break;
                }
                break;
            case 33:
                if ((rect.bottom <= rect2.bottom && rect.top < rect2.bottom) || rect.top <= rect2.top) {
                    z = false;
                    break;
                }
                break;
            case 66:
                if ((rect.left >= rect2.left && rect.right > rect2.left) || rect.right >= rect2.right) {
                    z = false;
                    break;
                }
                break;
            case TransportMediator.KEYCODE_MEDIA_RECORD /* 130 */:
                if ((rect.top >= rect2.top && rect.bottom > rect2.top) || rect.bottom >= rect2.bottom) {
                    z = false;
                    break;
                }
                break;
            default:
                throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
        }
        return z;
    }

    private static boolean isToDirectionOf(int i, @NonNull Rect rect, @NonNull Rect rect2) {
        boolean z = true;
        switch (i) {
            case 17:
                if (rect.left < rect2.right) {
                    z = false;
                    break;
                }
                break;
            case 33:
                if (rect.top < rect2.bottom) {
                    z = false;
                    break;
                }
                break;
            case 66:
                if (rect.right > rect2.left) {
                    z = false;
                    break;
                }
                break;
            case TransportMediator.KEYCODE_MEDIA_RECORD /* 130 */:
                if (rect.bottom > rect2.top) {
                    z = false;
                    break;
                }
                break;
            default:
                throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
        }
        return z;
    }

    private static int majorAxisDistance(int i, @NonNull Rect rect, @NonNull Rect rect2) {
        return Math.max(0, majorAxisDistanceRaw(i, rect, rect2));
    }

    private static int majorAxisDistanceRaw(int i, @NonNull Rect rect, @NonNull Rect rect2) {
        int i2;
        switch (i) {
            case 17:
                i2 = rect.left - rect2.right;
                break;
            case 33:
                i2 = rect.top - rect2.bottom;
                break;
            case 66:
                i2 = rect2.left - rect.right;
                break;
            case TransportMediator.KEYCODE_MEDIA_RECORD /* 130 */:
                i2 = rect2.top - rect.bottom;
                break;
            default:
                throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
        }
        return i2;
    }

    private static int majorAxisDistanceToFarEdge(int i, @NonNull Rect rect, @NonNull Rect rect2) {
        return Math.max(1, majorAxisDistanceToFarEdgeRaw(i, rect, rect2));
    }

    private static int majorAxisDistanceToFarEdgeRaw(int i, @NonNull Rect rect, @NonNull Rect rect2) {
        int i2;
        switch (i) {
            case 17:
                i2 = rect.left - rect2.left;
                break;
            case 33:
                i2 = rect.top - rect2.top;
                break;
            case 66:
                i2 = rect2.right - rect.right;
                break;
            case TransportMediator.KEYCODE_MEDIA_RECORD /* 130 */:
                i2 = rect2.bottom - rect.bottom;
                break;
            default:
                throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
        }
        return i2;
    }

    private static int minorAxisDistance(int i, @NonNull Rect rect, @NonNull Rect rect2) {
        int abs;
        switch (i) {
            case 17:
            case 66:
                abs = Math.abs((rect.top + (rect.height() / 2)) - (rect2.top + (rect2.height() / 2)));
                break;
            case 33:
            case TransportMediator.KEYCODE_MEDIA_RECORD /* 130 */:
                abs = Math.abs((rect.left + (rect.width() / 2)) - (rect2.left + (rect2.width() / 2)));
                break;
            default:
                throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
        }
        return abs;
    }
}
