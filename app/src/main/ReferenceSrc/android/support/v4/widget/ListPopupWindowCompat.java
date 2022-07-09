package android.support.v4.widget;

import android.os.Build;
import android.view.View;

/* loaded from: classes.jar:android/support/v4/widget/ListPopupWindowCompat.class */
public final class ListPopupWindowCompat {
    static final ListPopupWindowImpl IMPL;

    /* loaded from: classes.jar:android/support/v4/widget/ListPopupWindowCompat$BaseListPopupWindowImpl.class */
    static class BaseListPopupWindowImpl implements ListPopupWindowImpl {
        BaseListPopupWindowImpl() {
        }

        @Override // android.support.v4.widget.ListPopupWindowCompat.ListPopupWindowImpl
        public View.OnTouchListener createDragToOpenListener(Object obj, View view) {
            return null;
        }
    }

    /* loaded from: classes.jar:android/support/v4/widget/ListPopupWindowCompat$KitKatListPopupWindowImpl.class */
    static class KitKatListPopupWindowImpl extends BaseListPopupWindowImpl {
        KitKatListPopupWindowImpl() {
        }

        @Override // android.support.v4.widget.ListPopupWindowCompat.BaseListPopupWindowImpl, android.support.v4.widget.ListPopupWindowCompat.ListPopupWindowImpl
        public View.OnTouchListener createDragToOpenListener(Object obj, View view) {
            return ListPopupWindowCompatKitKat.createDragToOpenListener(obj, view);
        }
    }

    /* loaded from: classes.jar:android/support/v4/widget/ListPopupWindowCompat$ListPopupWindowImpl.class */
    interface ListPopupWindowImpl {
        View.OnTouchListener createDragToOpenListener(Object obj, View view);
    }

    static {
        if (Build.VERSION.SDK_INT >= 19) {
            IMPL = new KitKatListPopupWindowImpl();
        } else {
            IMPL = new BaseListPopupWindowImpl();
        }
    }

    private ListPopupWindowCompat() {
    }

    public static View.OnTouchListener createDragToOpenListener(Object obj, View view) {
        return IMPL.createDragToOpenListener(obj, view);
    }
}
