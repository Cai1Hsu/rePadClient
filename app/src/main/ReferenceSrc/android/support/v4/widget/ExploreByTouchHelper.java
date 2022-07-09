package android.support.v4.widget;

import android.graphics.Rect;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.media.TransportMediator;
import android.support.v4.util.SparseArrayCompat;
import android.support.v4.view.AccessibilityDelegateCompat;
import android.support.v4.view.KeyEventCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewParentCompat;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.support.v4.view.accessibility.AccessibilityManagerCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeProviderCompat;
import android.support.v4.view.accessibility.AccessibilityRecordCompat;
import android.support.v4.widget.FocusStrategy;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import java.util.ArrayList;
import java.util.List;
import org.apache.tools.ant.taskdefs.Execute;

/* loaded from: classes.jar:android/support/v4/widget/ExploreByTouchHelper.class */
public abstract class ExploreByTouchHelper extends AccessibilityDelegateCompat {
    private static final String DEFAULT_CLASS_NAME = "android.view.View";
    public static final int HOST_ID = -1;
    public static final int INVALID_ID = Integer.MIN_VALUE;
    private static final Rect INVALID_PARENT_BOUNDS = new Rect(Execute.INVALID, Execute.INVALID, INVALID_ID, INVALID_ID);
    private static final FocusStrategy.BoundsAdapter<AccessibilityNodeInfoCompat> NODE_ADAPTER = new FocusStrategy.BoundsAdapter<AccessibilityNodeInfoCompat>() { // from class: android.support.v4.widget.ExploreByTouchHelper.1
        public void obtainBounds(AccessibilityNodeInfoCompat accessibilityNodeInfoCompat, Rect rect) {
            accessibilityNodeInfoCompat.getBoundsInParent(rect);
        }
    };
    private static final FocusStrategy.CollectionAdapter<SparseArrayCompat<AccessibilityNodeInfoCompat>, AccessibilityNodeInfoCompat> SPARSE_VALUES_ADAPTER = new FocusStrategy.CollectionAdapter<SparseArrayCompat<AccessibilityNodeInfoCompat>, AccessibilityNodeInfoCompat>() { // from class: android.support.v4.widget.ExploreByTouchHelper.2
        public AccessibilityNodeInfoCompat get(SparseArrayCompat<AccessibilityNodeInfoCompat> sparseArrayCompat, int i) {
            return sparseArrayCompat.valueAt(i);
        }

        public int size(SparseArrayCompat<AccessibilityNodeInfoCompat> sparseArrayCompat) {
            return sparseArrayCompat.size();
        }
    };
    private final View mHost;
    private final AccessibilityManager mManager;
    private MyNodeProvider mNodeProvider;
    private final Rect mTempScreenRect = new Rect();
    private final Rect mTempParentRect = new Rect();
    private final Rect mTempVisibleRect = new Rect();
    private final int[] mTempGlobalRect = new int[2];
    private int mAccessibilityFocusedVirtualViewId = INVALID_ID;
    private int mKeyboardFocusedVirtualViewId = INVALID_ID;
    private int mHoveredVirtualViewId = INVALID_ID;

    /* loaded from: classes.jar:android/support/v4/widget/ExploreByTouchHelper$MyNodeProvider.class */
    private class MyNodeProvider extends AccessibilityNodeProviderCompat {
        MyNodeProvider() {
            ExploreByTouchHelper.this = r4;
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeProviderCompat
        public AccessibilityNodeInfoCompat createAccessibilityNodeInfo(int i) {
            return AccessibilityNodeInfoCompat.obtain(ExploreByTouchHelper.this.obtainAccessibilityNodeInfo(i));
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeProviderCompat
        public AccessibilityNodeInfoCompat findFocus(int i) {
            int i2 = i == 2 ? ExploreByTouchHelper.this.mAccessibilityFocusedVirtualViewId : ExploreByTouchHelper.this.mKeyboardFocusedVirtualViewId;
            return i2 == Integer.MIN_VALUE ? null : createAccessibilityNodeInfo(i2);
        }

        @Override // android.support.v4.view.accessibility.AccessibilityNodeProviderCompat
        public boolean performAction(int i, int i2, Bundle bundle) {
            return ExploreByTouchHelper.this.performAction(i, i2, bundle);
        }
    }

    public ExploreByTouchHelper(View view) {
        if (view == null) {
            throw new IllegalArgumentException("View may not be null");
        }
        this.mHost = view;
        this.mManager = (AccessibilityManager) view.getContext().getSystemService("accessibility");
        view.setFocusable(true);
        if (ViewCompat.getImportantForAccessibility(view) != 0) {
            return;
        }
        ViewCompat.setImportantForAccessibility(view, 1);
    }

    private boolean clearAccessibilityFocus(int i) {
        boolean z;
        if (this.mAccessibilityFocusedVirtualViewId == i) {
            this.mAccessibilityFocusedVirtualViewId = INVALID_ID;
            this.mHost.invalidate();
            sendEventForVirtualView(i, 65536);
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    private boolean clickKeyboardFocusedVirtualView() {
        return this.mKeyboardFocusedVirtualViewId != Integer.MIN_VALUE && onPerformActionForVirtualView(this.mKeyboardFocusedVirtualViewId, 16, null);
    }

    private AccessibilityEvent createEvent(int i, int i2) {
        AccessibilityEvent createEventForHost;
        switch (i) {
            case -1:
                createEventForHost = createEventForHost(i2);
                break;
            default:
                createEventForHost = createEventForChild(i, i2);
                break;
        }
        return createEventForHost;
    }

    private AccessibilityEvent createEventForChild(int i, int i2) {
        AccessibilityEvent obtain = AccessibilityEvent.obtain(i2);
        AccessibilityRecordCompat asRecord = AccessibilityEventCompat.asRecord(obtain);
        AccessibilityNodeInfoCompat obtainAccessibilityNodeInfo = obtainAccessibilityNodeInfo(i);
        asRecord.getText().add(obtainAccessibilityNodeInfo.getText());
        asRecord.setContentDescription(obtainAccessibilityNodeInfo.getContentDescription());
        asRecord.setScrollable(obtainAccessibilityNodeInfo.isScrollable());
        asRecord.setPassword(obtainAccessibilityNodeInfo.isPassword());
        asRecord.setEnabled(obtainAccessibilityNodeInfo.isEnabled());
        asRecord.setChecked(obtainAccessibilityNodeInfo.isChecked());
        onPopulateEventForVirtualView(i, obtain);
        if (!obtain.getText().isEmpty() || obtain.getContentDescription() != null) {
            asRecord.setClassName(obtainAccessibilityNodeInfo.getClassName());
            asRecord.setSource(this.mHost, i);
            obtain.setPackageName(this.mHost.getContext().getPackageName());
            return obtain;
        }
        throw new RuntimeException("Callbacks must add text or a content description in populateEventForVirtualViewId()");
    }

    private AccessibilityEvent createEventForHost(int i) {
        AccessibilityEvent obtain = AccessibilityEvent.obtain(i);
        ViewCompat.onInitializeAccessibilityEvent(this.mHost, obtain);
        return obtain;
    }

    @NonNull
    private AccessibilityNodeInfoCompat createNodeForChild(int i) {
        AccessibilityNodeInfoCompat obtain = AccessibilityNodeInfoCompat.obtain();
        obtain.setEnabled(true);
        obtain.setFocusable(true);
        obtain.setClassName(DEFAULT_CLASS_NAME);
        obtain.setBoundsInParent(INVALID_PARENT_BOUNDS);
        obtain.setBoundsInScreen(INVALID_PARENT_BOUNDS);
        obtain.setParent(this.mHost);
        onPopulateNodeForVirtualView(i, obtain);
        if (obtain.getText() == null && obtain.getContentDescription() == null) {
            throw new RuntimeException("Callbacks must add text or a content description in populateNodeForVirtualViewId()");
        }
        obtain.getBoundsInParent(this.mTempParentRect);
        if (this.mTempParentRect.equals(INVALID_PARENT_BOUNDS)) {
            throw new RuntimeException("Callbacks must set parent bounds in populateNodeForVirtualViewId()");
        }
        int actions = obtain.getActions();
        if ((actions & 64) != 0) {
            throw new RuntimeException("Callbacks must not add ACTION_ACCESSIBILITY_FOCUS in populateNodeForVirtualViewId()");
        }
        if ((actions & 128) != 0) {
            throw new RuntimeException("Callbacks must not add ACTION_CLEAR_ACCESSIBILITY_FOCUS in populateNodeForVirtualViewId()");
        }
        obtain.setPackageName(this.mHost.getContext().getPackageName());
        obtain.setSource(this.mHost, i);
        if (this.mAccessibilityFocusedVirtualViewId == i) {
            obtain.setAccessibilityFocused(true);
            obtain.addAction(128);
        } else {
            obtain.setAccessibilityFocused(false);
            obtain.addAction(64);
        }
        boolean z = this.mKeyboardFocusedVirtualViewId == i;
        if (z) {
            obtain.addAction(2);
        } else if (obtain.isFocusable()) {
            obtain.addAction(1);
        }
        obtain.setFocused(z);
        this.mHost.getLocationOnScreen(this.mTempGlobalRect);
        obtain.getBoundsInScreen(this.mTempScreenRect);
        if (this.mTempScreenRect.equals(INVALID_PARENT_BOUNDS)) {
            obtain.getBoundsInParent(this.mTempScreenRect);
            if (obtain.mParentVirtualDescendantId != -1) {
                AccessibilityNodeInfoCompat obtain2 = AccessibilityNodeInfoCompat.obtain();
                int i2 = obtain.mParentVirtualDescendantId;
                while (true) {
                    int i3 = i2;
                    if (i3 == -1) {
                        break;
                    }
                    obtain2.setParent(this.mHost, -1);
                    obtain2.setBoundsInParent(INVALID_PARENT_BOUNDS);
                    onPopulateNodeForVirtualView(i3, obtain2);
                    obtain2.getBoundsInParent(this.mTempParentRect);
                    this.mTempScreenRect.offset(this.mTempParentRect.left, this.mTempParentRect.top);
                    i2 = obtain2.mParentVirtualDescendantId;
                }
                obtain2.recycle();
            }
            this.mTempScreenRect.offset(this.mTempGlobalRect[0] - this.mHost.getScrollX(), this.mTempGlobalRect[1] - this.mHost.getScrollY());
        }
        if (this.mHost.getLocalVisibleRect(this.mTempVisibleRect)) {
            this.mTempVisibleRect.offset(this.mTempGlobalRect[0] - this.mHost.getScrollX(), this.mTempGlobalRect[1] - this.mHost.getScrollY());
            this.mTempScreenRect.intersect(this.mTempVisibleRect);
            obtain.setBoundsInScreen(this.mTempScreenRect);
            if (isVisibleToUser(this.mTempScreenRect)) {
                obtain.setVisibleToUser(true);
            }
        }
        return obtain;
    }

    @NonNull
    private AccessibilityNodeInfoCompat createNodeForHost() {
        AccessibilityNodeInfoCompat obtain = AccessibilityNodeInfoCompat.obtain(this.mHost);
        ViewCompat.onInitializeAccessibilityNodeInfo(this.mHost, obtain);
        ArrayList arrayList = new ArrayList();
        getVisibleVirtualViews(arrayList);
        if (obtain.getChildCount() <= 0 || arrayList.size() <= 0) {
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                obtain.addChild(this.mHost, ((Integer) arrayList.get(i)).intValue());
            }
            return obtain;
        }
        throw new RuntimeException("Views cannot have both real and virtual children");
    }

    private SparseArrayCompat<AccessibilityNodeInfoCompat> getAllNodes() {
        ArrayList arrayList = new ArrayList();
        getVisibleVirtualViews(arrayList);
        SparseArrayCompat<AccessibilityNodeInfoCompat> sparseArrayCompat = new SparseArrayCompat<>();
        for (int i = 0; i < arrayList.size(); i++) {
            sparseArrayCompat.put(i, createNodeForChild(i));
        }
        return sparseArrayCompat;
    }

    private void getBoundsInParent(int i, Rect rect) {
        obtainAccessibilityNodeInfo(i).getBoundsInParent(rect);
    }

    private static Rect guessPreviouslyFocusedRect(@NonNull View view, int i, @NonNull Rect rect) {
        int width = view.getWidth();
        int height = view.getHeight();
        switch (i) {
            case 17:
                rect.set(width, 0, width, height);
                break;
            case 33:
                rect.set(0, height, width, height);
                break;
            case 66:
                rect.set(-1, 0, -1, height);
                break;
            case TransportMediator.KEYCODE_MEDIA_RECORD /* 130 */:
                rect.set(0, -1, width, -1);
                break;
            default:
                throw new IllegalArgumentException("direction must be one of {FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
        }
        return rect;
    }

    private boolean isVisibleToUser(Rect rect) {
        boolean z = false;
        if (rect != null) {
            if (rect.isEmpty()) {
                z = false;
            } else {
                z = false;
                if (this.mHost.getWindowVisibility() == 0) {
                    ViewParent parent = this.mHost.getParent();
                    while (true) {
                        ViewParent viewParent = parent;
                        if (viewParent instanceof View) {
                            View view = (View) viewParent;
                            z = false;
                            if (ViewCompat.getAlpha(view) <= 0.0f) {
                                break;
                            }
                            z = false;
                            if (view.getVisibility() != 0) {
                                break;
                            }
                            parent = view.getParent();
                        } else {
                            z = false;
                            if (viewParent != null) {
                                z = true;
                            }
                        }
                    }
                }
            }
        }
        return z;
    }

    private static int keyToDirection(int i) {
        int i2;
        switch (i) {
            case 19:
                i2 = 33;
                break;
            case 20:
            default:
                i2 = 130;
                break;
            case 21:
                i2 = 17;
                break;
            case 22:
                i2 = 66;
                break;
        }
        return i2;
    }

    private boolean moveFocus(int i, @Nullable Rect rect) {
        AccessibilityNodeInfoCompat accessibilityNodeInfoCompat;
        SparseArrayCompat<AccessibilityNodeInfoCompat> allNodes = getAllNodes();
        int i2 = this.mKeyboardFocusedVirtualViewId;
        AccessibilityNodeInfoCompat accessibilityNodeInfoCompat2 = i2 == Integer.MIN_VALUE ? null : allNodes.get(i2);
        switch (i) {
            case 1:
            case 2:
                accessibilityNodeInfoCompat = (AccessibilityNodeInfoCompat) FocusStrategy.findNextFocusInRelativeDirection(allNodes, SPARSE_VALUES_ADAPTER, NODE_ADAPTER, accessibilityNodeInfoCompat2, i, ViewCompat.getLayoutDirection(this.mHost) == 1, false);
                break;
            case 17:
            case 33:
            case 66:
            case TransportMediator.KEYCODE_MEDIA_RECORD /* 130 */:
                Rect rect2 = new Rect();
                if (this.mKeyboardFocusedVirtualViewId != Integer.MIN_VALUE) {
                    getBoundsInParent(this.mKeyboardFocusedVirtualViewId, rect2);
                } else if (rect != null) {
                    rect2.set(rect);
                } else {
                    guessPreviouslyFocusedRect(this.mHost, i, rect2);
                }
                accessibilityNodeInfoCompat = (AccessibilityNodeInfoCompat) FocusStrategy.findNextFocusInAbsoluteDirection(allNodes, SPARSE_VALUES_ADAPTER, NODE_ADAPTER, accessibilityNodeInfoCompat2, rect2, i);
                break;
            default:
                throw new IllegalArgumentException("direction must be one of {FOCUS_FORWARD, FOCUS_BACKWARD, FOCUS_UP, FOCUS_DOWN, FOCUS_LEFT, FOCUS_RIGHT}.");
        }
        return requestKeyboardFocusForVirtualView(accessibilityNodeInfoCompat == null ? Integer.MIN_VALUE : allNodes.keyAt(allNodes.indexOfValue(accessibilityNodeInfoCompat)));
    }

    private boolean performActionForChild(int i, int i2, Bundle bundle) {
        boolean clearKeyboardFocusForVirtualView;
        switch (i2) {
            case 1:
                clearKeyboardFocusForVirtualView = requestKeyboardFocusForVirtualView(i);
                break;
            case 2:
                clearKeyboardFocusForVirtualView = clearKeyboardFocusForVirtualView(i);
                break;
            case 64:
                clearKeyboardFocusForVirtualView = requestAccessibilityFocus(i);
                break;
            case 128:
                clearKeyboardFocusForVirtualView = clearAccessibilityFocus(i);
                break;
            default:
                clearKeyboardFocusForVirtualView = onPerformActionForVirtualView(i, i2, bundle);
                break;
        }
        return clearKeyboardFocusForVirtualView;
    }

    private boolean performActionForHost(int i, Bundle bundle) {
        return ViewCompat.performAccessibilityAction(this.mHost, i, bundle);
    }

    private boolean requestAccessibilityFocus(int i) {
        boolean z = false;
        if (this.mManager.isEnabled()) {
            if (!AccessibilityManagerCompat.isTouchExplorationEnabled(this.mManager)) {
                z = false;
            } else {
                z = false;
                if (this.mAccessibilityFocusedVirtualViewId != i) {
                    if (this.mAccessibilityFocusedVirtualViewId != Integer.MIN_VALUE) {
                        clearAccessibilityFocus(this.mAccessibilityFocusedVirtualViewId);
                    }
                    this.mAccessibilityFocusedVirtualViewId = i;
                    this.mHost.invalidate();
                    sendEventForVirtualView(i, 32768);
                    z = true;
                }
            }
        }
        return z;
    }

    private void updateHoveredVirtualView(int i) {
        if (this.mHoveredVirtualViewId == i) {
            return;
        }
        int i2 = this.mHoveredVirtualViewId;
        this.mHoveredVirtualViewId = i;
        sendEventForVirtualView(i, 128);
        sendEventForVirtualView(i2, 256);
    }

    public final boolean clearKeyboardFocusForVirtualView(int i) {
        boolean z = false;
        if (this.mKeyboardFocusedVirtualViewId == i) {
            this.mKeyboardFocusedVirtualViewId = INVALID_ID;
            onVirtualViewKeyboardFocusChanged(i, false);
            sendEventForVirtualView(i, 8);
            z = true;
        }
        return z;
    }

    public final boolean dispatchHoverEvent(@NonNull MotionEvent motionEvent) {
        boolean z = false;
        if (this.mManager.isEnabled()) {
            if (AccessibilityManagerCompat.isTouchExplorationEnabled(this.mManager)) {
                switch (motionEvent.getAction()) {
                    case 7:
                    case 9:
                        int virtualViewAt = getVirtualViewAt(motionEvent.getX(), motionEvent.getY());
                        updateHoveredVirtualView(virtualViewAt);
                        if (virtualViewAt == Integer.MIN_VALUE) {
                            z = false;
                            break;
                        } else {
                            z = true;
                            break;
                        }
                    case 8:
                    default:
                        z = false;
                        break;
                    case 10:
                        z = false;
                        if (this.mAccessibilityFocusedVirtualViewId != Integer.MIN_VALUE) {
                            updateHoveredVirtualView(INVALID_ID);
                            z = true;
                            break;
                        }
                        break;
                }
            } else {
                z = false;
            }
        }
        return z;
    }

    public final boolean dispatchKeyEvent(@NonNull KeyEvent keyEvent) {
        boolean z = false;
        if (keyEvent.getAction() != 1) {
            int keyCode = keyEvent.getKeyCode();
            switch (keyCode) {
                case 19:
                case 20:
                case 21:
                case 22:
                    z = false;
                    if (KeyEventCompat.hasNoModifiers(keyEvent)) {
                        int keyToDirection = keyToDirection(keyCode);
                        int repeatCount = keyEvent.getRepeatCount();
                        int i = 0;
                        boolean z2 = false;
                        while (true) {
                            z = z2;
                            if (i >= repeatCount + 1) {
                                break;
                            } else {
                                z = z2;
                                if (!moveFocus(keyToDirection, null)) {
                                    break;
                                } else {
                                    z2 = true;
                                    i++;
                                }
                            }
                        }
                    }
                    break;
                case 23:
                case 66:
                    z = false;
                    if (KeyEventCompat.hasNoModifiers(keyEvent)) {
                        z = false;
                        if (keyEvent.getRepeatCount() == 0) {
                            clickKeyboardFocusedVirtualView();
                            z = true;
                            break;
                        }
                    }
                    break;
                case 61:
                    if (!KeyEventCompat.hasNoModifiers(keyEvent)) {
                        z = false;
                        if (KeyEventCompat.hasModifiers(keyEvent, 1)) {
                            z = moveFocus(1, null);
                            break;
                        }
                    } else {
                        z = moveFocus(2, null);
                        break;
                    }
                    break;
                default:
                    z = false;
                    break;
            }
        }
        return z;
    }

    public final int getAccessibilityFocusedVirtualViewId() {
        return this.mAccessibilityFocusedVirtualViewId;
    }

    @Override // android.support.v4.view.AccessibilityDelegateCompat
    public AccessibilityNodeProviderCompat getAccessibilityNodeProvider(View view) {
        if (this.mNodeProvider == null) {
            this.mNodeProvider = new MyNodeProvider();
        }
        return this.mNodeProvider;
    }

    @Deprecated
    public int getFocusedVirtualView() {
        return getAccessibilityFocusedVirtualViewId();
    }

    public final int getKeyboardFocusedVirtualViewId() {
        return this.mKeyboardFocusedVirtualViewId;
    }

    protected abstract int getVirtualViewAt(float f, float f2);

    protected abstract void getVisibleVirtualViews(List<Integer> list);

    public final void invalidateRoot() {
        invalidateVirtualView(-1, 1);
    }

    public final void invalidateVirtualView(int i) {
        invalidateVirtualView(i, 0);
    }

    public final void invalidateVirtualView(int i, int i2) {
        ViewParent parent;
        if (i == Integer.MIN_VALUE || !this.mManager.isEnabled() || (parent = this.mHost.getParent()) == null) {
            return;
        }
        AccessibilityEvent createEvent = createEvent(i, 2048);
        AccessibilityEventCompat.setContentChangeTypes(createEvent, i2);
        ViewParentCompat.requestSendAccessibilityEvent(parent, this.mHost, createEvent);
    }

    @NonNull
    AccessibilityNodeInfoCompat obtainAccessibilityNodeInfo(int i) {
        return i == -1 ? createNodeForHost() : createNodeForChild(i);
    }

    public final void onFocusChanged(boolean z, int i, @Nullable Rect rect) {
        if (this.mKeyboardFocusedVirtualViewId != Integer.MIN_VALUE) {
            clearKeyboardFocusForVirtualView(this.mKeyboardFocusedVirtualViewId);
        }
        if (z) {
            moveFocus(i, rect);
        }
    }

    @Override // android.support.v4.view.AccessibilityDelegateCompat
    public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(view, accessibilityEvent);
        onPopulateEventForHost(accessibilityEvent);
    }

    @Override // android.support.v4.view.AccessibilityDelegateCompat
    public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
        super.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat);
        onPopulateNodeForHost(accessibilityNodeInfoCompat);
    }

    protected abstract boolean onPerformActionForVirtualView(int i, int i2, Bundle bundle);

    protected void onPopulateEventForHost(AccessibilityEvent accessibilityEvent) {
    }

    protected void onPopulateEventForVirtualView(int i, AccessibilityEvent accessibilityEvent) {
    }

    protected void onPopulateNodeForHost(AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
    }

    protected abstract void onPopulateNodeForVirtualView(int i, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat);

    protected void onVirtualViewKeyboardFocusChanged(int i, boolean z) {
    }

    boolean performAction(int i, int i2, Bundle bundle) {
        boolean performActionForHost;
        switch (i) {
            case -1:
                performActionForHost = performActionForHost(i2, bundle);
                break;
            default:
                performActionForHost = performActionForChild(i, i2, bundle);
                break;
        }
        return performActionForHost;
    }

    public final boolean requestKeyboardFocusForVirtualView(int i) {
        boolean z = false;
        if ((this.mHost.isFocused() || this.mHost.requestFocus()) && this.mKeyboardFocusedVirtualViewId != i) {
            if (this.mKeyboardFocusedVirtualViewId != Integer.MIN_VALUE) {
                clearKeyboardFocusForVirtualView(this.mKeyboardFocusedVirtualViewId);
            }
            this.mKeyboardFocusedVirtualViewId = i;
            onVirtualViewKeyboardFocusChanged(i, true);
            sendEventForVirtualView(i, 8);
            z = true;
        }
        return z;
    }

    public final boolean sendEventForVirtualView(int i, int i2) {
        boolean z = false;
        if (i != Integer.MIN_VALUE) {
            if (!this.mManager.isEnabled()) {
                z = false;
            } else {
                ViewParent parent = this.mHost.getParent();
                z = false;
                if (parent != null) {
                    z = ViewParentCompat.requestSendAccessibilityEvent(parent, this.mHost, createEvent(i, i2));
                }
            }
        }
        return z;
    }
}
