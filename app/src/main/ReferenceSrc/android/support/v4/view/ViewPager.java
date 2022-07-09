package android.support.v4.view;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.SystemClock;
import android.support.annotation.CallSuper;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.support.v4.os.ParcelableCompat;
import android.support.v4.os.ParcelableCompatCreatorCallbacks;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityRecordCompat;
import android.support.v4.widget.EdgeEffectCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SoundEffectConstants;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Interpolator;
import android.widget.Scroller;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/* loaded from: classes.jar:android/support/v4/view/ViewPager.class */
public class ViewPager extends ViewGroup {
    private static final int CLOSE_ENOUGH = 2;
    private static final boolean DEBUG = false;
    private static final int DEFAULT_GUTTER_SIZE = 16;
    private static final int DEFAULT_OFFSCREEN_PAGES = 1;
    private static final int DRAW_ORDER_DEFAULT = 0;
    private static final int DRAW_ORDER_FORWARD = 1;
    private static final int DRAW_ORDER_REVERSE = 2;
    private static final int INVALID_POINTER = -1;
    private static final int MAX_SETTLE_DURATION = 600;
    private static final int MIN_DISTANCE_FOR_FLING = 25;
    private static final int MIN_FLING_VELOCITY = 400;
    public static final int SCROLL_STATE_DRAGGING = 1;
    public static final int SCROLL_STATE_IDLE = 0;
    public static final int SCROLL_STATE_SETTLING = 2;
    private static final String TAG = "ViewPager";
    private static final boolean USE_CACHE = false;
    PagerAdapter mAdapter;
    private List<OnAdapterChangeListener> mAdapterChangeListeners;
    private int mBottomPageBounds;
    private boolean mCalledSuper;
    private int mChildHeightMeasureSpec;
    private int mChildWidthMeasureSpec;
    private int mCloseEnough;
    int mCurItem;
    private int mDecorChildCount;
    private int mDefaultGutterSize;
    private int mDrawingOrder;
    private ArrayList<View> mDrawingOrderedChildren;
    private int mExpectedAdapterCount;
    private long mFakeDragBeginTime;
    private boolean mFakeDragging;
    private int mFlingDistance;
    private int mGutterSize;
    private boolean mInLayout;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private OnPageChangeListener mInternalPageChangeListener;
    private boolean mIsBeingDragged;
    private boolean mIsScrollStarted;
    private boolean mIsUnableToDrag;
    private float mLastMotionX;
    private float mLastMotionY;
    private EdgeEffectCompat mLeftEdge;
    private Drawable mMarginDrawable;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    private PagerObserver mObserver;
    private OnPageChangeListener mOnPageChangeListener;
    private List<OnPageChangeListener> mOnPageChangeListeners;
    private int mPageMargin;
    private PageTransformer mPageTransformer;
    private int mPageTransformerLayerType;
    private boolean mPopulatePending;
    private EdgeEffectCompat mRightEdge;
    private Scroller mScroller;
    private boolean mScrollingCacheEnabled;
    private Method mSetChildrenDrawingOrderEnabled;
    private int mTopPageBounds;
    private int mTouchSlop;
    private VelocityTracker mVelocityTracker;
    static final int[] LAYOUT_ATTRS = {16842931};
    private static final Comparator<ItemInfo> COMPARATOR = new Comparator<ItemInfo>() { // from class: android.support.v4.view.ViewPager.1
        public int compare(ItemInfo itemInfo, ItemInfo itemInfo2) {
            return itemInfo.position - itemInfo2.position;
        }
    };
    private static final Interpolator sInterpolator = new Interpolator() { // from class: android.support.v4.view.ViewPager.2
        @Override // android.animation.TimeInterpolator
        public float getInterpolation(float f) {
            float f2 = f - 1.0f;
            return (f2 * f2 * f2 * f2 * f2) + 1.0f;
        }
    };
    private static final ViewPositionComparator sPositionComparator = new ViewPositionComparator();
    private final ArrayList<ItemInfo> mItems = new ArrayList<>();
    private final ItemInfo mTempItem = new ItemInfo();
    private final Rect mTempRect = new Rect();
    private int mRestoredCurItem = -1;
    private Parcelable mRestoredAdapterState = null;
    private ClassLoader mRestoredClassLoader = null;
    private float mFirstOffset = -3.4028235E38f;
    private float mLastOffset = Float.MAX_VALUE;
    private int mOffscreenPageLimit = 1;
    private int mActivePointerId = -1;
    private boolean mFirstLayout = true;
    private boolean mNeedCalculatePageOffsets = false;
    private final Runnable mEndScrollRunnable = new Runnable() { // from class: android.support.v4.view.ViewPager.3
        @Override // java.lang.Runnable
        public void run() {
            ViewPager.this.setScrollState(0);
            ViewPager.this.populate();
        }
    };
    private int mScrollState = 0;

    @Inherited
    @Target({ElementType.TYPE})
    @Retention(RetentionPolicy.RUNTIME)
    /* loaded from: classes.jar:android/support/v4/view/ViewPager$DecorView.class */
    public @interface DecorView {
    }

    /* loaded from: classes.jar:android/support/v4/view/ViewPager$ItemInfo.class */
    static class ItemInfo {
        Object object;
        float offset;
        int position;
        boolean scrolling;
        float widthFactor;

        ItemInfo() {
        }
    }

    /* loaded from: classes.jar:android/support/v4/view/ViewPager$LayoutParams.class */
    public static class LayoutParams extends ViewGroup.LayoutParams {
        int childIndex;
        public int gravity;
        public boolean isDecor;
        boolean needsMeasure;
        int position;
        float widthFactor = 0.0f;

        public LayoutParams() {
            super(-1, -1);
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ViewPager.LAYOUT_ATTRS);
            this.gravity = obtainStyledAttributes.getInteger(0, 48);
            obtainStyledAttributes.recycle();
        }
    }

    /* loaded from: classes.jar:android/support/v4/view/ViewPager$MyAccessibilityDelegate.class */
    class MyAccessibilityDelegate extends AccessibilityDelegateCompat {
        MyAccessibilityDelegate() {
            ViewPager.this = r4;
        }

        private boolean canScroll() {
            boolean z = true;
            if (ViewPager.this.mAdapter == null || ViewPager.this.mAdapter.getCount() <= 1) {
                z = false;
            }
            return z;
        }

        @Override // android.support.v4.view.AccessibilityDelegateCompat
        public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
            super.onInitializeAccessibilityEvent(view, accessibilityEvent);
            accessibilityEvent.setClassName(ViewPager.class.getName());
            AccessibilityRecordCompat asRecord = AccessibilityEventCompat.asRecord(accessibilityEvent);
            asRecord.setScrollable(canScroll());
            if (accessibilityEvent.getEventType() != 4096 || ViewPager.this.mAdapter == null) {
                return;
            }
            asRecord.setItemCount(ViewPager.this.mAdapter.getCount());
            asRecord.setFromIndex(ViewPager.this.mCurItem);
            asRecord.setToIndex(ViewPager.this.mCurItem);
        }

        @Override // android.support.v4.view.AccessibilityDelegateCompat
        public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
            super.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat);
            accessibilityNodeInfoCompat.setClassName(ViewPager.class.getName());
            accessibilityNodeInfoCompat.setScrollable(canScroll());
            if (ViewPager.this.canScrollHorizontally(1)) {
                accessibilityNodeInfoCompat.addAction(4096);
            }
            if (ViewPager.this.canScrollHorizontally(-1)) {
                accessibilityNodeInfoCompat.addAction(8192);
            }
        }

        @Override // android.support.v4.view.AccessibilityDelegateCompat
        public boolean performAccessibilityAction(View view, int i, Bundle bundle) {
            boolean z = true;
            if (!super.performAccessibilityAction(view, i, bundle)) {
                switch (i) {
                    case 4096:
                        if (!ViewPager.this.canScrollHorizontally(1)) {
                            z = false;
                            break;
                        } else {
                            ViewPager.this.setCurrentItem(ViewPager.this.mCurItem + 1);
                            break;
                        }
                    case 8192:
                        if (!ViewPager.this.canScrollHorizontally(-1)) {
                            z = false;
                            break;
                        } else {
                            ViewPager.this.setCurrentItem(ViewPager.this.mCurItem - 1);
                            break;
                        }
                    default:
                        z = false;
                        break;
                }
            }
            return z;
        }
    }

    /* loaded from: classes.jar:android/support/v4/view/ViewPager$OnAdapterChangeListener.class */
    public interface OnAdapterChangeListener {
        void onAdapterChanged(@NonNull ViewPager viewPager, @Nullable PagerAdapter pagerAdapter, @Nullable PagerAdapter pagerAdapter2);
    }

    /* loaded from: classes.jar:android/support/v4/view/ViewPager$OnPageChangeListener.class */
    public interface OnPageChangeListener {
        void onPageScrollStateChanged(int i);

        void onPageScrolled(int i, float f, int i2);

        void onPageSelected(int i);
    }

    /* loaded from: classes.jar:android/support/v4/view/ViewPager$PageTransformer.class */
    public interface PageTransformer {
        void transformPage(View view, float f);
    }

    /* loaded from: classes.jar:android/support/v4/view/ViewPager$PagerObserver.class */
    private class PagerObserver extends DataSetObserver {
        PagerObserver() {
            ViewPager.this = r4;
        }

        @Override // android.database.DataSetObserver
        public void onChanged() {
            ViewPager.this.dataSetChanged();
        }

        @Override // android.database.DataSetObserver
        public void onInvalidated() {
            ViewPager.this.dataSetChanged();
        }
    }

    /* loaded from: classes.jar:android/support/v4/view/ViewPager$SavedState.class */
    public static class SavedState extends AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = ParcelableCompat.newCreator(new ParcelableCompatCreatorCallbacks<SavedState>() { // from class: android.support.v4.view.ViewPager.SavedState.1
            @Override // android.support.v4.os.ParcelableCompatCreatorCallbacks
            public SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
                return new SavedState(parcel, classLoader);
            }

            @Override // android.support.v4.os.ParcelableCompatCreatorCallbacks
            public SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        });
        Parcelable adapterState;
        ClassLoader loader;
        int position;

        SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            ClassLoader classLoader2 = classLoader == null ? getClass().getClassLoader() : classLoader;
            this.position = parcel.readInt();
            this.adapterState = parcel.readParcelable(classLoader2);
            this.loader = classLoader2;
        }

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public String toString() {
            return "FragmentPager.SavedState{" + Integer.toHexString(System.identityHashCode(this)) + " position=" + this.position + "}";
        }

        @Override // android.support.v4.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.position);
            parcel.writeParcelable(this.adapterState, i);
        }
    }

    /* loaded from: classes.jar:android/support/v4/view/ViewPager$SimpleOnPageChangeListener.class */
    public static class SimpleOnPageChangeListener implements OnPageChangeListener {
        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageScrollStateChanged(int i) {
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageScrolled(int i, float f, int i2) {
        }

        @Override // android.support.v4.view.ViewPager.OnPageChangeListener
        public void onPageSelected(int i) {
        }
    }

    /* loaded from: classes.jar:android/support/v4/view/ViewPager$ViewPositionComparator.class */
    static class ViewPositionComparator implements Comparator<View> {
        ViewPositionComparator() {
        }

        public int compare(View view, View view2) {
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            LayoutParams layoutParams2 = (LayoutParams) view2.getLayoutParams();
            return layoutParams.isDecor != layoutParams2.isDecor ? layoutParams.isDecor ? 1 : -1 : layoutParams.position - layoutParams2.position;
        }
    }

    public ViewPager(Context context) {
        super(context);
        initViewPager();
    }

    public ViewPager(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initViewPager();
    }

    private void calculatePageOffsets(ItemInfo itemInfo, int i, ItemInfo itemInfo2) {
        ItemInfo itemInfo3;
        float f;
        int i2;
        ItemInfo itemInfo4;
        float f2;
        int i3;
        int count = this.mAdapter.getCount();
        int clientWidth = getClientWidth();
        float f3 = clientWidth > 0 ? this.mPageMargin / clientWidth : 0.0f;
        if (itemInfo2 != null) {
            int i4 = itemInfo2.position;
            if (i4 < itemInfo.position) {
                int i5 = 0;
                float f4 = itemInfo2.offset + itemInfo2.widthFactor + f3;
                for (int i6 = i4 + 1; i6 <= itemInfo.position && i5 < this.mItems.size(); i6 = i3 + 1) {
                    ItemInfo itemInfo5 = this.mItems.get(i5);
                    while (true) {
                        itemInfo4 = itemInfo5;
                        f2 = f4;
                        i3 = i6;
                        if (i6 <= itemInfo4.position) {
                            break;
                        }
                        f2 = f4;
                        i3 = i6;
                        if (i5 >= this.mItems.size() - 1) {
                            break;
                        }
                        i5++;
                        itemInfo5 = this.mItems.get(i5);
                    }
                    while (i3 < itemInfo4.position) {
                        f2 += this.mAdapter.getPageWidth(i3) + f3;
                        i3++;
                    }
                    itemInfo4.offset = f2;
                    f4 = f2 + itemInfo4.widthFactor + f3;
                }
            } else if (i4 > itemInfo.position) {
                int size = this.mItems.size() - 1;
                float f5 = itemInfo2.offset;
                for (int i7 = i4 - 1; i7 >= itemInfo.position && size >= 0; i7 = i2 - 1) {
                    ItemInfo itemInfo6 = this.mItems.get(size);
                    while (true) {
                        itemInfo3 = itemInfo6;
                        f = f5;
                        i2 = i7;
                        if (i7 >= itemInfo3.position) {
                            break;
                        }
                        f = f5;
                        i2 = i7;
                        if (size <= 0) {
                            break;
                        }
                        size--;
                        itemInfo6 = this.mItems.get(size);
                    }
                    while (i2 > itemInfo3.position) {
                        f -= this.mAdapter.getPageWidth(i2) + f3;
                        i2--;
                    }
                    f5 = f - (itemInfo3.widthFactor + f3);
                    itemInfo3.offset = f5;
                }
            }
        }
        int size2 = this.mItems.size();
        float f6 = itemInfo.offset;
        int i8 = itemInfo.position - 1;
        this.mFirstOffset = itemInfo.position == 0 ? itemInfo.offset : -3.4028235E38f;
        this.mLastOffset = itemInfo.position == count - 1 ? (itemInfo.offset + itemInfo.widthFactor) - 1.0f : Float.MAX_VALUE;
        int i9 = i - 1;
        float f7 = f6;
        while (i9 >= 0) {
            ItemInfo itemInfo7 = this.mItems.get(i9);
            while (i8 > itemInfo7.position) {
                f7 -= this.mAdapter.getPageWidth(i8) + f3;
                i8--;
            }
            f7 -= itemInfo7.widthFactor + f3;
            itemInfo7.offset = f7;
            if (itemInfo7.position == 0) {
                this.mFirstOffset = f7;
            }
            i9--;
            i8--;
        }
        float f8 = itemInfo.offset + itemInfo.widthFactor + f3;
        int i10 = i + 1;
        int i11 = itemInfo.position + 1;
        while (i10 < size2) {
            ItemInfo itemInfo8 = this.mItems.get(i10);
            while (i11 < itemInfo8.position) {
                f8 += this.mAdapter.getPageWidth(i11) + f3;
                i11++;
            }
            if (itemInfo8.position == count - 1) {
                this.mLastOffset = (itemInfo8.widthFactor + f8) - 1.0f;
            }
            itemInfo8.offset = f8;
            f8 += itemInfo8.widthFactor + f3;
            i10++;
            i11++;
        }
        this.mNeedCalculatePageOffsets = false;
    }

    private void completeScroll(boolean z) {
        boolean z2 = true;
        boolean z3 = this.mScrollState == 2;
        if (z3) {
            setScrollingCacheEnabled(false);
            if (this.mScroller.isFinished()) {
                z2 = false;
            }
            if (z2) {
                this.mScroller.abortAnimation();
                int scrollX = getScrollX();
                int scrollY = getScrollY();
                int currX = this.mScroller.getCurrX();
                int currY = this.mScroller.getCurrY();
                if (scrollX != currX || scrollY != currY) {
                    scrollTo(currX, currY);
                    if (currX != scrollX) {
                        pageScrolled(currX);
                    }
                }
            }
        }
        this.mPopulatePending = false;
        boolean z4 = z3;
        for (int i = 0; i < this.mItems.size(); i++) {
            ItemInfo itemInfo = this.mItems.get(i);
            if (itemInfo.scrolling) {
                z4 = true;
                itemInfo.scrolling = false;
            }
        }
        if (z4) {
            if (z) {
                ViewCompat.postOnAnimation(this, this.mEndScrollRunnable);
            } else {
                this.mEndScrollRunnable.run();
            }
        }
    }

    private int determineTargetPage(int i, float f, int i2, int i3) {
        if (Math.abs(i3) <= this.mFlingDistance || Math.abs(i2) <= this.mMinimumVelocity) {
            i += (int) (f + (i >= this.mCurItem ? 0.4f : 0.6f));
        } else if (i2 <= 0) {
            i++;
        }
        int i4 = i;
        if (this.mItems.size() > 0) {
            i4 = Math.max(this.mItems.get(0).position, Math.min(i, this.mItems.get(this.mItems.size() - 1).position));
        }
        return i4;
    }

    private void dispatchOnPageScrolled(int i, float f, int i2) {
        if (this.mOnPageChangeListener != null) {
            this.mOnPageChangeListener.onPageScrolled(i, f, i2);
        }
        if (this.mOnPageChangeListeners != null) {
            int size = this.mOnPageChangeListeners.size();
            for (int i3 = 0; i3 < size; i3++) {
                OnPageChangeListener onPageChangeListener = this.mOnPageChangeListeners.get(i3);
                if (onPageChangeListener != null) {
                    onPageChangeListener.onPageScrolled(i, f, i2);
                }
            }
        }
        if (this.mInternalPageChangeListener != null) {
            this.mInternalPageChangeListener.onPageScrolled(i, f, i2);
        }
    }

    private void dispatchOnPageSelected(int i) {
        if (this.mOnPageChangeListener != null) {
            this.mOnPageChangeListener.onPageSelected(i);
        }
        if (this.mOnPageChangeListeners != null) {
            int size = this.mOnPageChangeListeners.size();
            for (int i2 = 0; i2 < size; i2++) {
                OnPageChangeListener onPageChangeListener = this.mOnPageChangeListeners.get(i2);
                if (onPageChangeListener != null) {
                    onPageChangeListener.onPageSelected(i);
                }
            }
        }
        if (this.mInternalPageChangeListener != null) {
            this.mInternalPageChangeListener.onPageSelected(i);
        }
    }

    private void dispatchOnScrollStateChanged(int i) {
        if (this.mOnPageChangeListener != null) {
            this.mOnPageChangeListener.onPageScrollStateChanged(i);
        }
        if (this.mOnPageChangeListeners != null) {
            int size = this.mOnPageChangeListeners.size();
            for (int i2 = 0; i2 < size; i2++) {
                OnPageChangeListener onPageChangeListener = this.mOnPageChangeListeners.get(i2);
                if (onPageChangeListener != null) {
                    onPageChangeListener.onPageScrollStateChanged(i);
                }
            }
        }
        if (this.mInternalPageChangeListener != null) {
            this.mInternalPageChangeListener.onPageScrollStateChanged(i);
        }
    }

    private void enableLayers(boolean z) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            ViewCompat.setLayerType(getChildAt(i), z ? this.mPageTransformerLayerType : 0, null);
        }
    }

    private void endDrag() {
        this.mIsBeingDragged = false;
        this.mIsUnableToDrag = false;
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    private Rect getChildRectInPagerCoordinates(Rect rect, View view) {
        Rect rect2 = rect;
        if (rect == null) {
            rect2 = new Rect();
        }
        if (view != null) {
            rect2.left = view.getLeft();
            rect2.right = view.getRight();
            rect2.top = view.getTop();
            rect2.bottom = view.getBottom();
            ViewParent parent = view.getParent();
            while (true) {
                ViewParent viewParent = parent;
                if (!(viewParent instanceof ViewGroup) || viewParent == this) {
                    break;
                }
                ViewGroup viewGroup = (ViewGroup) viewParent;
                rect2.left += viewGroup.getLeft();
                rect2.right += viewGroup.getRight();
                rect2.top += viewGroup.getTop();
                rect2.bottom += viewGroup.getBottom();
                parent = viewGroup.getParent();
            }
        } else {
            rect2.set(0, 0, 0, 0);
        }
        return rect2;
    }

    private int getClientWidth() {
        return (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
    }

    /* JADX WARN: Code restructure failed: missing block: B:24:0x00d6, code lost:
        r13 = r15;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private ItemInfo infoForCurrentScrollPosition() {
        ItemInfo itemInfo;
        float f = 0.0f;
        int clientWidth = getClientWidth();
        float scrollX = clientWidth > 0 ? getScrollX() / clientWidth : 0.0f;
        if (clientWidth > 0) {
            f = this.mPageMargin / clientWidth;
        }
        int i = -1;
        float f2 = 0.0f;
        float f3 = 0.0f;
        boolean z = true;
        ItemInfo itemInfo2 = null;
        int i2 = 0;
        while (true) {
            itemInfo = itemInfo2;
            if (i2 >= this.mItems.size()) {
                break;
            }
            ItemInfo itemInfo3 = this.mItems.get(i2);
            int i3 = i2;
            ItemInfo itemInfo4 = itemInfo3;
            if (!z) {
                i3 = i2;
                itemInfo4 = itemInfo3;
                if (itemInfo3.position != i + 1) {
                    itemInfo4 = this.mTempItem;
                    itemInfo4.offset = f2 + f3 + f;
                    itemInfo4.position = i + 1;
                    itemInfo4.widthFactor = this.mAdapter.getPageWidth(itemInfo4.position);
                    i3 = i2 - 1;
                }
            }
            f2 = itemInfo4.offset;
            float f4 = itemInfo4.widthFactor;
            if (!z) {
                itemInfo = itemInfo2;
                if (scrollX < f2) {
                    break;
                }
            }
            if (scrollX < f4 + f2 + f || i3 == this.mItems.size() - 1) {
                break;
            }
            z = false;
            i = itemInfo4.position;
            f3 = itemInfo4.widthFactor;
            i2 = i3 + 1;
            itemInfo2 = itemInfo4;
        }
        return itemInfo;
    }

    private static boolean isDecorView(@NonNull View view) {
        return view.getClass().getAnnotation(DecorView.class) != null;
    }

    private boolean isGutterDrag(float f, float f2) {
        return (f < ((float) this.mGutterSize) && f2 > 0.0f) || (f > ((float) (getWidth() - this.mGutterSize)) && f2 < 0.0f);
    }

    private void onSecondaryPointerUp(MotionEvent motionEvent) {
        int actionIndex = MotionEventCompat.getActionIndex(motionEvent);
        if (motionEvent.getPointerId(actionIndex) == this.mActivePointerId) {
            int i = actionIndex == 0 ? 1 : 0;
            this.mLastMotionX = motionEvent.getX(i);
            this.mActivePointerId = motionEvent.getPointerId(i);
            if (this.mVelocityTracker == null) {
                return;
            }
            this.mVelocityTracker.clear();
        }
    }

    private boolean pageScrolled(int i) {
        boolean z = false;
        if (this.mItems.size() != 0) {
            ItemInfo infoForCurrentScrollPosition = infoForCurrentScrollPosition();
            int clientWidth = getClientWidth();
            int i2 = this.mPageMargin;
            float f = this.mPageMargin / clientWidth;
            int i3 = infoForCurrentScrollPosition.position;
            float f2 = ((i / clientWidth) - infoForCurrentScrollPosition.offset) / (infoForCurrentScrollPosition.widthFactor + f);
            this.mCalledSuper = false;
            onPageScrolled(i3, f2, (int) ((clientWidth + i2) * f2));
            if (!this.mCalledSuper) {
                throw new IllegalStateException("onPageScrolled did not call superclass implementation");
            }
            z = true;
        } else if (!this.mFirstLayout) {
            this.mCalledSuper = false;
            onPageScrolled(0, 0.0f, 0);
            if (!this.mCalledSuper) {
                throw new IllegalStateException("onPageScrolled did not call superclass implementation");
            }
        }
        return z;
    }

    private boolean performDrag(float f) {
        boolean z = false;
        float f2 = this.mLastMotionX;
        this.mLastMotionX = f;
        float scrollX = getScrollX() + (f2 - f);
        int clientWidth = getClientWidth();
        float f3 = clientWidth * this.mFirstOffset;
        float f4 = clientWidth * this.mLastOffset;
        boolean z2 = true;
        boolean z3 = true;
        ItemInfo itemInfo = this.mItems.get(0);
        ItemInfo itemInfo2 = this.mItems.get(this.mItems.size() - 1);
        if (itemInfo.position != 0) {
            z2 = false;
            f3 = itemInfo.offset * clientWidth;
        }
        if (itemInfo2.position != this.mAdapter.getCount() - 1) {
            z3 = false;
            f4 = itemInfo2.offset * clientWidth;
        }
        if (scrollX >= f3) {
            z = false;
            f3 = scrollX;
            if (scrollX > f4) {
                z = false;
                if (z3) {
                    z = this.mRightEdge.onPull(Math.abs(scrollX - f4) / clientWidth);
                }
                f3 = f4;
            }
        } else if (z2) {
            z = this.mLeftEdge.onPull(Math.abs(f3 - scrollX) / clientWidth);
        }
        this.mLastMotionX += f3 - ((int) f3);
        scrollTo((int) f3, getScrollY());
        pageScrolled((int) f3);
        return z;
    }

    private void recomputeScrollPosition(int i, int i2, int i3, int i4) {
        if (i2 <= 0 || this.mItems.isEmpty()) {
            ItemInfo infoForPosition = infoForPosition(this.mCurItem);
            int paddingLeft = (int) (((i - getPaddingLeft()) - getPaddingRight()) * (infoForPosition != null ? Math.min(infoForPosition.offset, this.mLastOffset) : 0.0f));
            if (paddingLeft == getScrollX()) {
                return;
            }
            completeScroll(false);
            scrollTo(paddingLeft, getScrollY());
        } else if (!this.mScroller.isFinished()) {
            this.mScroller.setFinalX(getCurrentItem() * getClientWidth());
        } else {
            int paddingLeft2 = getPaddingLeft();
            scrollTo((int) ((((i - paddingLeft2) - getPaddingRight()) + i3) * (getScrollX() / (((i2 - getPaddingLeft()) - getPaddingRight()) + i4))), getScrollY());
        }
    }

    private void removeNonDecorViews() {
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < getChildCount()) {
                int i3 = i2;
                if (!((LayoutParams) getChildAt(i2).getLayoutParams()).isDecor) {
                    removeViewAt(i2);
                    i3 = i2 - 1;
                }
                i = i3 + 1;
            } else {
                return;
            }
        }
    }

    private void requestParentDisallowInterceptTouchEvent(boolean z) {
        ViewParent parent = getParent();
        if (parent != null) {
            parent.requestDisallowInterceptTouchEvent(z);
        }
    }

    private boolean resetTouch() {
        this.mActivePointerId = -1;
        endDrag();
        return this.mLeftEdge.onRelease() | this.mRightEdge.onRelease();
    }

    private void scrollToItem(int i, boolean z, int i2, boolean z2) {
        ItemInfo infoForPosition = infoForPosition(i);
        int i3 = 0;
        if (infoForPosition != null) {
            i3 = (int) (getClientWidth() * Math.max(this.mFirstOffset, Math.min(infoForPosition.offset, this.mLastOffset)));
        }
        if (z) {
            smoothScrollTo(i3, 0, i2);
            if (!z2) {
                return;
            }
            dispatchOnPageSelected(i);
            return;
        }
        if (z2) {
            dispatchOnPageSelected(i);
        }
        completeScroll(false);
        scrollTo(i3, 0);
        pageScrolled(i3);
    }

    private void setScrollingCacheEnabled(boolean z) {
        if (this.mScrollingCacheEnabled != z) {
            this.mScrollingCacheEnabled = z;
        }
    }

    private void sortChildDrawingOrder() {
        if (this.mDrawingOrder != 0) {
            if (this.mDrawingOrderedChildren == null) {
                this.mDrawingOrderedChildren = new ArrayList<>();
            } else {
                this.mDrawingOrderedChildren.clear();
            }
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                this.mDrawingOrderedChildren.add(getChildAt(i));
            }
            Collections.sort(this.mDrawingOrderedChildren, sPositionComparator);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addFocusables(ArrayList<View> arrayList, int i, int i2) {
        ItemInfo infoForChild;
        int size = arrayList.size();
        int descendantFocusability = getDescendantFocusability();
        if (descendantFocusability != 393216) {
            for (int i3 = 0; i3 < getChildCount(); i3++) {
                View childAt = getChildAt(i3);
                if (childAt.getVisibility() == 0 && (infoForChild = infoForChild(childAt)) != null && infoForChild.position == this.mCurItem) {
                    childAt.addFocusables(arrayList, i, i2);
                }
            }
        }
        if ((descendantFocusability != 262144 || size == arrayList.size()) && isFocusable()) {
            if (((i2 & 1) == 1 && isInTouchMode() && !isFocusableInTouchMode()) || arrayList == null) {
                return;
            }
            arrayList.add(this);
        }
    }

    ItemInfo addNewItem(int i, int i2) {
        ItemInfo itemInfo = new ItemInfo();
        itemInfo.position = i;
        itemInfo.object = this.mAdapter.instantiateItem((ViewGroup) this, i);
        itemInfo.widthFactor = this.mAdapter.getPageWidth(i);
        if (i2 < 0 || i2 >= this.mItems.size()) {
            this.mItems.add(itemInfo);
        } else {
            this.mItems.add(i2, itemInfo);
        }
        return itemInfo;
    }

    public void addOnAdapterChangeListener(@NonNull OnAdapterChangeListener onAdapterChangeListener) {
        if (this.mAdapterChangeListeners == null) {
            this.mAdapterChangeListeners = new ArrayList();
        }
        this.mAdapterChangeListeners.add(onAdapterChangeListener);
    }

    public void addOnPageChangeListener(OnPageChangeListener onPageChangeListener) {
        if (this.mOnPageChangeListeners == null) {
            this.mOnPageChangeListeners = new ArrayList();
        }
        this.mOnPageChangeListeners.add(onPageChangeListener);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addTouchables(ArrayList<View> arrayList) {
        ItemInfo infoForChild;
        for (int i = 0; i < getChildCount(); i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 0 && (infoForChild = infoForChild(childAt)) != null && infoForChild.position == this.mCurItem) {
                childAt.addTouchables(arrayList);
            }
        }
    }

    @Override // android.view.ViewGroup
    public void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        ViewGroup.LayoutParams layoutParams2 = layoutParams;
        if (!checkLayoutParams(layoutParams)) {
            layoutParams2 = generateLayoutParams(layoutParams);
        }
        LayoutParams layoutParams3 = (LayoutParams) layoutParams2;
        layoutParams3.isDecor |= isDecorView(view);
        if (!this.mInLayout) {
            super.addView(view, i, layoutParams2);
        } else if (layoutParams3 != null && layoutParams3.isDecor) {
            throw new IllegalStateException("Cannot add pager decor view during layout");
        } else {
            layoutParams3.needsMeasure = true;
            addViewInLayout(view, i, layoutParams2);
        }
    }

    public boolean arrowScroll(int i) {
        View view;
        boolean z;
        View findFocus = findFocus();
        if (findFocus == this) {
            view = null;
        } else {
            view = findFocus;
            if (findFocus != null) {
                ViewParent parent = findFocus.getParent();
                while (true) {
                    ViewParent viewParent = parent;
                    z = false;
                    if (!(viewParent instanceof ViewGroup)) {
                        break;
                    } else if (viewParent == this) {
                        z = true;
                        break;
                    } else {
                        parent = viewParent.getParent();
                    }
                }
                view = findFocus;
                if (!z) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(findFocus.getClass().getSimpleName());
                    ViewParent parent2 = findFocus.getParent();
                    while (true) {
                        ViewParent viewParent2 = parent2;
                        if (!(viewParent2 instanceof ViewGroup)) {
                            break;
                        }
                        sb.append(" => ").append(viewParent2.getClass().getSimpleName());
                        parent2 = viewParent2.getParent();
                    }
                    Log.e(TAG, "arrowScroll tried to find focus based on non-child current focused view " + sb.toString());
                    view = null;
                }
            }
        }
        boolean z2 = false;
        View findNextFocus = FocusFinder.getInstance().findNextFocus(this, view, i);
        if (findNextFocus == null || findNextFocus == view) {
            if (i == 17 || i == 1) {
                z2 = pageLeft();
            } else if (i == 66 || i == 2) {
                z2 = pageRight();
            }
        } else if (i == 17) {
            z2 = (view == null || getChildRectInPagerCoordinates(this.mTempRect, findNextFocus).left < getChildRectInPagerCoordinates(this.mTempRect, view).left) ? findNextFocus.requestFocus() : pageLeft();
        } else if (i == 66) {
            z2 = (view == null || getChildRectInPagerCoordinates(this.mTempRect, findNextFocus).left > getChildRectInPagerCoordinates(this.mTempRect, view).left) ? findNextFocus.requestFocus() : pageRight();
        }
        if (z2) {
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(i));
        }
        return z2;
    }

    public boolean beginFakeDrag() {
        boolean z = false;
        if (!this.mIsBeingDragged) {
            this.mFakeDragging = true;
            setScrollState(1);
            this.mLastMotionX = 0.0f;
            this.mInitialMotionX = 0.0f;
            if (this.mVelocityTracker == null) {
                this.mVelocityTracker = VelocityTracker.obtain();
            } else {
                this.mVelocityTracker.clear();
            }
            long uptimeMillis = SystemClock.uptimeMillis();
            MotionEvent obtain = MotionEvent.obtain(uptimeMillis, uptimeMillis, 0, 0.0f, 0.0f, 0);
            this.mVelocityTracker.addMovement(obtain);
            obtain.recycle();
            this.mFakeDragBeginTime = uptimeMillis;
            z = true;
        }
        return z;
    }

    protected boolean canScroll(View view, boolean z, int i, int i2, int i3) {
        boolean z2;
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            int scrollX = view.getScrollX();
            int scrollY = view.getScrollY();
            for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = viewGroup.getChildAt(childCount);
                if (i2 + scrollX >= childAt.getLeft() && i2 + scrollX < childAt.getRight() && i3 + scrollY >= childAt.getTop() && i3 + scrollY < childAt.getBottom() && canScroll(childAt, true, i, (i2 + scrollX) - childAt.getLeft(), (i3 + scrollY) - childAt.getTop())) {
                    z2 = true;
                    break;
                }
            }
        }
        z2 = z && ViewCompat.canScrollHorizontally(view, -i);
        return z2;
    }

    @Override // android.view.View
    public boolean canScrollHorizontally(int i) {
        boolean z = false;
        if (this.mAdapter != null) {
            int clientWidth = getClientWidth();
            int scrollX = getScrollX();
            if (i < 0) {
                z = scrollX > ((int) (((float) clientWidth) * this.mFirstOffset));
            } else if (i > 0) {
                z = scrollX < ((int) (((float) clientWidth) * this.mLastOffset));
            }
        }
        return z;
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof LayoutParams) && super.checkLayoutParams(layoutParams);
    }

    public void clearOnPageChangeListeners() {
        if (this.mOnPageChangeListeners != null) {
            this.mOnPageChangeListeners.clear();
        }
    }

    @Override // android.view.View
    public void computeScroll() {
        this.mIsScrollStarted = true;
        if (this.mScroller.isFinished() || !this.mScroller.computeScrollOffset()) {
            completeScroll(true);
            return;
        }
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        int currX = this.mScroller.getCurrX();
        int currY = this.mScroller.getCurrY();
        if (scrollX != currX || scrollY != currY) {
            scrollTo(currX, currY);
            if (!pageScrolled(currX)) {
                this.mScroller.abortAnimation();
                scrollTo(0, currY);
            }
        }
        ViewCompat.postInvalidateOnAnimation(this);
    }

    void dataSetChanged() {
        int i;
        boolean z;
        int i2;
        int count = this.mAdapter.getCount();
        this.mExpectedAdapterCount = count;
        boolean z2 = this.mItems.size() < (this.mOffscreenPageLimit * 2) + 1 && this.mItems.size() < count;
        int i3 = this.mCurItem;
        boolean z3 = false;
        int i4 = 0;
        while (i4 < this.mItems.size()) {
            ItemInfo itemInfo = this.mItems.get(i4);
            int itemPosition = this.mAdapter.getItemPosition(itemInfo.object);
            if (itemPosition == -1) {
                i2 = i3;
                z = z3;
                i = i4;
            } else if (itemPosition == -2) {
                this.mItems.remove(i4);
                int i5 = i4 - 1;
                boolean z4 = z3;
                if (!z3) {
                    this.mAdapter.startUpdate((ViewGroup) this);
                    z4 = true;
                }
                this.mAdapter.destroyItem((ViewGroup) this, itemInfo.position, itemInfo.object);
                z2 = true;
                i = i5;
                z = z4;
                i2 = i3;
                if (this.mCurItem == itemInfo.position) {
                    i2 = Math.max(0, Math.min(this.mCurItem, count - 1));
                    z2 = true;
                    i = i5;
                    z = z4;
                }
            } else {
                i = i4;
                z = z3;
                i2 = i3;
                if (itemInfo.position != itemPosition) {
                    if (itemInfo.position == this.mCurItem) {
                        i3 = itemPosition;
                    }
                    itemInfo.position = itemPosition;
                    z2 = true;
                    i = i4;
                    z = z3;
                    i2 = i3;
                }
            }
            i4 = i + 1;
            z3 = z;
            i3 = i2;
        }
        if (z3) {
            this.mAdapter.finishUpdate((ViewGroup) this);
        }
        Collections.sort(this.mItems, COMPARATOR);
        if (z2) {
            int childCount = getChildCount();
            for (int i6 = 0; i6 < childCount; i6++) {
                LayoutParams layoutParams = (LayoutParams) getChildAt(i6).getLayoutParams();
                if (!layoutParams.isDecor) {
                    layoutParams.widthFactor = 0.0f;
                }
            }
            setCurrentItemInternal(i3, false, true);
            requestLayout();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return super.dispatchKeyEvent(keyEvent) || executeKeyEvent(keyEvent);
    }

    @Override // android.view.View
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        boolean z;
        ItemInfo infoForChild;
        if (accessibilityEvent.getEventType() != 4096) {
            int childCount = getChildCount();
            int i = 0;
            while (true) {
                if (i >= childCount) {
                    z = false;
                    break;
                }
                View childAt = getChildAt(i);
                if (childAt.getVisibility() == 0 && (infoForChild = infoForChild(childAt)) != null && infoForChild.position == this.mCurItem && childAt.dispatchPopulateAccessibilityEvent(accessibilityEvent)) {
                    z = true;
                    break;
                }
                i++;
            }
        } else {
            z = super.dispatchPopulateAccessibilityEvent(accessibilityEvent);
        }
        return z;
    }

    float distanceInfluenceForSnapDuration(float f) {
        return (float) Math.sin((float) ((f - 0.5f) * 0.4712389167638204d));
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        super.draw(canvas);
        boolean z = false;
        boolean z2 = false;
        int overScrollMode = getOverScrollMode();
        if (overScrollMode == 0 || (overScrollMode == 1 && this.mAdapter != null && this.mAdapter.getCount() > 1)) {
            if (!this.mLeftEdge.isFinished()) {
                int save = canvas.save();
                int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
                int width = getWidth();
                canvas.rotate(270.0f);
                canvas.translate((-height) + getPaddingTop(), this.mFirstOffset * width);
                this.mLeftEdge.setSize(height, width);
                z2 = false | this.mLeftEdge.draw(canvas);
                canvas.restoreToCount(save);
            }
            z = z2;
            if (!this.mRightEdge.isFinished()) {
                int save2 = canvas.save();
                int width2 = getWidth();
                int height2 = getHeight();
                int paddingTop = getPaddingTop();
                int paddingBottom = getPaddingBottom();
                canvas.rotate(90.0f);
                canvas.translate(-getPaddingTop(), (-(this.mLastOffset + 1.0f)) * width2);
                this.mRightEdge.setSize((height2 - paddingTop) - paddingBottom, width2);
                z = z2 | this.mRightEdge.draw(canvas);
                canvas.restoreToCount(save2);
            }
        } else {
            this.mLeftEdge.finish();
            this.mRightEdge.finish();
        }
        if (z) {
            ViewCompat.postInvalidateOnAnimation(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable drawable = this.mMarginDrawable;
        if (drawable == null || !drawable.isStateful()) {
            return;
        }
        drawable.setState(getDrawableState());
    }

    public void endFakeDrag() {
        if (!this.mFakeDragging) {
            throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
        }
        if (this.mAdapter != null) {
            VelocityTracker velocityTracker = this.mVelocityTracker;
            velocityTracker.computeCurrentVelocity(1000, this.mMaximumVelocity);
            int xVelocity = (int) VelocityTrackerCompat.getXVelocity(velocityTracker, this.mActivePointerId);
            this.mPopulatePending = true;
            int clientWidth = getClientWidth();
            int scrollX = getScrollX();
            ItemInfo infoForCurrentScrollPosition = infoForCurrentScrollPosition();
            setCurrentItemInternal(determineTargetPage(infoForCurrentScrollPosition.position, ((scrollX / clientWidth) - infoForCurrentScrollPosition.offset) / infoForCurrentScrollPosition.widthFactor, xVelocity, (int) (this.mLastMotionX - this.mInitialMotionX)), true, true, xVelocity);
        }
        endDrag();
        this.mFakeDragging = false;
    }

    public boolean executeKeyEvent(KeyEvent keyEvent) {
        boolean z = false;
        if (keyEvent.getAction() == 0) {
            switch (keyEvent.getKeyCode()) {
                case 21:
                    z = arrowScroll(17);
                    break;
                case 22:
                    z = arrowScroll(66);
                    break;
                case 61:
                    z = false;
                    if (Build.VERSION.SDK_INT >= 11) {
                        if (!KeyEventCompat.hasNoModifiers(keyEvent)) {
                            z = false;
                            if (KeyEventCompat.hasModifiers(keyEvent, 1)) {
                                z = arrowScroll(1);
                                break;
                            }
                        } else {
                            z = arrowScroll(2);
                            break;
                        }
                    }
                    break;
                default:
                    z = false;
                    break;
            }
        }
        return z;
    }

    public void fakeDragBy(float f) {
        if (!this.mFakeDragging) {
            throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
        }
        if (this.mAdapter == null) {
            return;
        }
        this.mLastMotionX += f;
        float scrollX = getScrollX() - f;
        int clientWidth = getClientWidth();
        float f2 = clientWidth * this.mFirstOffset;
        float f3 = clientWidth * this.mLastOffset;
        ItemInfo itemInfo = this.mItems.get(0);
        ItemInfo itemInfo2 = this.mItems.get(this.mItems.size() - 1);
        if (itemInfo.position != 0) {
            f2 = itemInfo.offset * clientWidth;
        }
        if (itemInfo2.position != this.mAdapter.getCount() - 1) {
            f3 = itemInfo2.offset * clientWidth;
        }
        if (scrollX >= f2) {
            f2 = scrollX;
            if (scrollX > f3) {
                f2 = f3;
            }
        }
        this.mLastMotionX += f2 - ((int) f2);
        scrollTo((int) f2, getScrollY());
        pageScrolled((int) f2);
        MotionEvent obtain = MotionEvent.obtain(this.mFakeDragBeginTime, SystemClock.uptimeMillis(), 2, this.mLastMotionX, 0.0f, 0);
        this.mVelocityTracker.addMovement(obtain);
        obtain.recycle();
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return generateDefaultLayoutParams();
    }

    public PagerAdapter getAdapter() {
        return this.mAdapter;
    }

    @Override // android.view.ViewGroup
    protected int getChildDrawingOrder(int i, int i2) {
        if (this.mDrawingOrder == 2) {
            i2 = (i - 1) - i2;
        }
        return ((LayoutParams) this.mDrawingOrderedChildren.get(i2).getLayoutParams()).childIndex;
    }

    public int getCurrentItem() {
        return this.mCurItem;
    }

    public int getOffscreenPageLimit() {
        return this.mOffscreenPageLimit;
    }

    public int getPageMargin() {
        return this.mPageMargin;
    }

    ItemInfo infoForAnyChild(View view) {
        ItemInfo infoForChild;
        while (true) {
            ViewParent parent = view.getParent();
            if (parent == this) {
                infoForChild = infoForChild(view);
                break;
            } else if (parent == null || !(parent instanceof View)) {
                break;
            } else {
                view = (View) parent;
            }
        }
        infoForChild = null;
        return infoForChild;
    }

    ItemInfo infoForChild(View view) {
        ItemInfo itemInfo;
        int i = 0;
        while (true) {
            if (i >= this.mItems.size()) {
                itemInfo = null;
                break;
            }
            ItemInfo itemInfo2 = this.mItems.get(i);
            if (this.mAdapter.isViewFromObject(view, itemInfo2.object)) {
                itemInfo = itemInfo2;
                break;
            }
            i++;
        }
        return itemInfo;
    }

    ItemInfo infoForPosition(int i) {
        ItemInfo itemInfo;
        int i2 = 0;
        while (true) {
            if (i2 >= this.mItems.size()) {
                itemInfo = null;
                break;
            }
            itemInfo = this.mItems.get(i2);
            if (itemInfo.position == i) {
                break;
            }
            i2++;
        }
        return itemInfo;
    }

    void initViewPager() {
        setWillNotDraw(false);
        setDescendantFocusability(262144);
        setFocusable(true);
        Context context = getContext();
        this.mScroller = new Scroller(context, sInterpolator);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        float f = context.getResources().getDisplayMetrics().density;
        this.mTouchSlop = viewConfiguration.getScaledPagingTouchSlop();
        this.mMinimumVelocity = (int) (400.0f * f);
        this.mMaximumVelocity = viewConfiguration.getScaledMaximumFlingVelocity();
        this.mLeftEdge = new EdgeEffectCompat(context);
        this.mRightEdge = new EdgeEffectCompat(context);
        this.mFlingDistance = (int) (25.0f * f);
        this.mCloseEnough = (int) (2.0f * f);
        this.mDefaultGutterSize = (int) (16.0f * f);
        ViewCompat.setAccessibilityDelegate(this, new MyAccessibilityDelegate());
        if (ViewCompat.getImportantForAccessibility(this) == 0) {
            ViewCompat.setImportantForAccessibility(this, 1);
        }
        ViewCompat.setOnApplyWindowInsetsListener(this, new OnApplyWindowInsetsListener() { // from class: android.support.v4.view.ViewPager.4
            private final Rect mTempRect = new Rect();

            @Override // android.support.v4.view.OnApplyWindowInsetsListener
            public WindowInsetsCompat onApplyWindowInsets(View view, WindowInsetsCompat windowInsetsCompat) {
                WindowInsetsCompat onApplyWindowInsets = ViewCompat.onApplyWindowInsets(view, windowInsetsCompat);
                if (!onApplyWindowInsets.isConsumed()) {
                    Rect rect = this.mTempRect;
                    rect.left = onApplyWindowInsets.getSystemWindowInsetLeft();
                    rect.top = onApplyWindowInsets.getSystemWindowInsetTop();
                    rect.right = onApplyWindowInsets.getSystemWindowInsetRight();
                    rect.bottom = onApplyWindowInsets.getSystemWindowInsetBottom();
                    int childCount = ViewPager.this.getChildCount();
                    for (int i = 0; i < childCount; i++) {
                        WindowInsetsCompat dispatchApplyWindowInsets = ViewCompat.dispatchApplyWindowInsets(ViewPager.this.getChildAt(i), onApplyWindowInsets);
                        rect.left = Math.min(dispatchApplyWindowInsets.getSystemWindowInsetLeft(), rect.left);
                        rect.top = Math.min(dispatchApplyWindowInsets.getSystemWindowInsetTop(), rect.top);
                        rect.right = Math.min(dispatchApplyWindowInsets.getSystemWindowInsetRight(), rect.right);
                        rect.bottom = Math.min(dispatchApplyWindowInsets.getSystemWindowInsetBottom(), rect.bottom);
                    }
                    onApplyWindowInsets = onApplyWindowInsets.replaceSystemWindowInsets(rect.left, rect.top, rect.right, rect.bottom);
                }
                return onApplyWindowInsets;
            }
        });
    }

    public boolean isFakeDragging() {
        return this.mFakeDragging;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mFirstLayout = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        removeCallbacks(this.mEndScrollRunnable);
        if (this.mScroller != null && !this.mScroller.isFinished()) {
            this.mScroller.abortAnimation();
        }
        super.onDetachedFromWindow();
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        float f;
        super.onDraw(canvas);
        if (this.mPageMargin <= 0 || this.mMarginDrawable == null || this.mItems.size() <= 0 || this.mAdapter == null) {
            return;
        }
        int scrollX = getScrollX();
        int width = getWidth();
        float f2 = this.mPageMargin / width;
        int i = 0;
        ItemInfo itemInfo = this.mItems.get(0);
        float f3 = itemInfo.offset;
        int size = this.mItems.size();
        int i2 = this.mItems.get(size - 1).position;
        for (int i3 = itemInfo.position; i3 < i2; i3++) {
            while (i3 > itemInfo.position && i < size) {
                i++;
                itemInfo = this.mItems.get(i);
            }
            if (i3 == itemInfo.position) {
                f = (itemInfo.offset + itemInfo.widthFactor) * width;
                f3 = itemInfo.offset + itemInfo.widthFactor + f2;
            } else {
                float pageWidth = this.mAdapter.getPageWidth(i3);
                f = (f3 + pageWidth) * width;
                f3 += pageWidth + f2;
            }
            if (this.mPageMargin + f > scrollX) {
                this.mMarginDrawable.setBounds(Math.round(f), this.mTopPageBounds, Math.round(this.mPageMargin + f), this.mBottomPageBounds);
                this.mMarginDrawable.draw(canvas);
            }
            if (f > scrollX + width) {
                return;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0063  */
    @Override // android.view.ViewGroup
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        boolean z;
        int action = motionEvent.getAction() & 255;
        if (action != 3 && action != 1) {
            if (action != 0) {
                if (this.mIsBeingDragged) {
                    z = true;
                } else if (this.mIsUnableToDrag) {
                    z = false;
                }
            }
            switch (action) {
                case 0:
                    float x = motionEvent.getX();
                    this.mInitialMotionX = x;
                    this.mLastMotionX = x;
                    float y = motionEvent.getY();
                    this.mInitialMotionY = y;
                    this.mLastMotionY = y;
                    this.mActivePointerId = motionEvent.getPointerId(0);
                    this.mIsUnableToDrag = false;
                    this.mIsScrollStarted = true;
                    this.mScroller.computeScrollOffset();
                    if (this.mScrollState != 2 || Math.abs(this.mScroller.getFinalX() - this.mScroller.getCurrX()) <= this.mCloseEnough) {
                        completeScroll(false);
                        this.mIsBeingDragged = false;
                    } else {
                        this.mScroller.abortAnimation();
                        this.mPopulatePending = false;
                        populate();
                        this.mIsBeingDragged = true;
                        requestParentDisallowInterceptTouchEvent(true);
                        setScrollState(1);
                    }
                    if (this.mVelocityTracker == null) {
                        this.mVelocityTracker = VelocityTracker.obtain();
                    }
                    this.mVelocityTracker.addMovement(motionEvent);
                    z = this.mIsBeingDragged;
                    break;
                case 2:
                    int i = this.mActivePointerId;
                    if (i != -1) {
                        int findPointerIndex = motionEvent.findPointerIndex(i);
                        float x2 = motionEvent.getX(findPointerIndex);
                        float f = x2 - this.mLastMotionX;
                        float abs = Math.abs(f);
                        float y2 = motionEvent.getY(findPointerIndex);
                        float abs2 = Math.abs(y2 - this.mInitialMotionY);
                        if (f != 0.0f && !isGutterDrag(this.mLastMotionX, f) && canScroll(this, false, (int) f, (int) x2, (int) y2)) {
                            this.mLastMotionX = x2;
                            this.mLastMotionY = y2;
                            this.mIsUnableToDrag = true;
                            z = false;
                            break;
                        } else {
                            if (abs > this.mTouchSlop && 0.5f * abs > abs2) {
                                this.mIsBeingDragged = true;
                                requestParentDisallowInterceptTouchEvent(true);
                                setScrollState(1);
                                this.mLastMotionX = f > 0.0f ? this.mInitialMotionX + this.mTouchSlop : this.mInitialMotionX - this.mTouchSlop;
                                this.mLastMotionY = y2;
                                setScrollingCacheEnabled(true);
                            } else if (abs2 > this.mTouchSlop) {
                                this.mIsUnableToDrag = true;
                            }
                            if (this.mIsBeingDragged && performDrag(x2)) {
                                ViewCompat.postInvalidateOnAnimation(this);
                            }
                        }
                    }
                    if (this.mVelocityTracker == null) {
                    }
                    this.mVelocityTracker.addMovement(motionEvent);
                    z = this.mIsBeingDragged;
                    break;
                case 6:
                    onSecondaryPointerUp(motionEvent);
                    if (this.mVelocityTracker == null) {
                    }
                    this.mVelocityTracker.addMovement(motionEvent);
                    z = this.mIsBeingDragged;
                    break;
                default:
                    if (this.mVelocityTracker == null) {
                    }
                    this.mVelocityTracker.addMovement(motionEvent);
                    z = this.mIsBeingDragged;
                    break;
            }
        } else {
            resetTouch();
            z = false;
        }
        return z;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean z, int i, int i2, int i3, int i4) {
        ItemInfo infoForChild;
        int measuredWidth;
        int measuredHeight;
        int childCount = getChildCount();
        int i5 = i3 - i;
        int i6 = i4 - i2;
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingRight = getPaddingRight();
        int paddingBottom = getPaddingBottom();
        int scrollX = getScrollX();
        int i7 = 0;
        int i8 = 0;
        while (i8 < childCount) {
            View childAt = getChildAt(i8);
            int i9 = i7;
            int i10 = paddingBottom;
            int i11 = paddingLeft;
            int i12 = paddingRight;
            int i13 = paddingTop;
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                i9 = i7;
                i10 = paddingBottom;
                i11 = paddingLeft;
                i12 = paddingRight;
                i13 = paddingTop;
                if (layoutParams.isDecor) {
                    int i14 = layoutParams.gravity;
                    int i15 = layoutParams.gravity;
                    switch (i14 & 7) {
                        case 1:
                            measuredWidth = Math.max((i5 - childAt.getMeasuredWidth()) / 2, paddingLeft);
                            i11 = paddingLeft;
                            break;
                        case 2:
                        case 4:
                        default:
                            measuredWidth = paddingLeft;
                            i11 = paddingLeft;
                            break;
                        case 3:
                            measuredWidth = paddingLeft;
                            i11 = paddingLeft + childAt.getMeasuredWidth();
                            break;
                        case 5:
                            measuredWidth = (i5 - paddingRight) - childAt.getMeasuredWidth();
                            paddingRight += childAt.getMeasuredWidth();
                            i11 = paddingLeft;
                            break;
                    }
                    switch (i15 & 112) {
                        case 16:
                            measuredHeight = Math.max((i6 - childAt.getMeasuredHeight()) / 2, paddingTop);
                            break;
                        case 48:
                            measuredHeight = paddingTop;
                            paddingTop += childAt.getMeasuredHeight();
                            break;
                        case 80:
                            measuredHeight = (i6 - paddingBottom) - childAt.getMeasuredHeight();
                            paddingBottom += childAt.getMeasuredHeight();
                            break;
                        default:
                            measuredHeight = paddingTop;
                            break;
                    }
                    int i16 = measuredWidth + scrollX;
                    childAt.layout(i16, measuredHeight, childAt.getMeasuredWidth() + i16, childAt.getMeasuredHeight() + measuredHeight);
                    i9 = i7 + 1;
                    i13 = paddingTop;
                    i12 = paddingRight;
                    i10 = paddingBottom;
                }
            }
            i8++;
            i7 = i9;
            paddingBottom = i10;
            paddingLeft = i11;
            paddingRight = i12;
            paddingTop = i13;
        }
        int i17 = (i5 - paddingLeft) - paddingRight;
        for (int i18 = 0; i18 < childCount; i18++) {
            View childAt2 = getChildAt(i18);
            if (childAt2.getVisibility() != 8) {
                LayoutParams layoutParams2 = (LayoutParams) childAt2.getLayoutParams();
                if (!layoutParams2.isDecor && (infoForChild = infoForChild(childAt2)) != null) {
                    int i19 = paddingLeft + ((int) (i17 * infoForChild.offset));
                    if (layoutParams2.needsMeasure) {
                        layoutParams2.needsMeasure = false;
                        childAt2.measure(View.MeasureSpec.makeMeasureSpec((int) (i17 * layoutParams2.widthFactor), 1073741824), View.MeasureSpec.makeMeasureSpec((i6 - paddingTop) - paddingBottom, 1073741824));
                    }
                    childAt2.layout(i19, paddingTop, childAt2.getMeasuredWidth() + i19, childAt2.getMeasuredHeight() + paddingTop);
                }
            }
        }
        this.mTopPageBounds = paddingTop;
        this.mBottomPageBounds = i6 - paddingBottom;
        this.mDecorChildCount = i7;
        if (this.mFirstLayout) {
            scrollToItem(this.mCurItem, false, 0, false);
        }
        this.mFirstLayout = false;
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        LayoutParams layoutParams;
        int i3;
        setMeasuredDimension(getDefaultSize(0, i), getDefaultSize(0, i2));
        int measuredWidth = getMeasuredWidth();
        this.mGutterSize = Math.min(measuredWidth / 10, this.mDefaultGutterSize);
        int paddingLeft = (measuredWidth - getPaddingLeft()) - getPaddingRight();
        int measuredHeight = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
        int childCount = getChildCount();
        int i4 = 0;
        while (i4 < childCount) {
            View childAt = getChildAt(i4);
            int i5 = measuredHeight;
            int i6 = paddingLeft;
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams2 = (LayoutParams) childAt.getLayoutParams();
                i5 = measuredHeight;
                i6 = paddingLeft;
                if (layoutParams2 != null) {
                    i5 = measuredHeight;
                    i6 = paddingLeft;
                    if (layoutParams2.isDecor) {
                        int i7 = layoutParams2.gravity & 7;
                        int i8 = layoutParams2.gravity & 112;
                        int i9 = Integer.MIN_VALUE;
                        boolean z = i8 == 48 || i8 == 80;
                        boolean z2 = i7 == 3 || i7 == 5;
                        if (z) {
                            i3 = 1073741824;
                        } else {
                            i3 = Integer.MIN_VALUE;
                            if (z2) {
                                i9 = 1073741824;
                                i3 = Integer.MIN_VALUE;
                            }
                        }
                        int i10 = paddingLeft;
                        int i11 = measuredHeight;
                        int i12 = i10;
                        if (layoutParams2.width != -2) {
                            i3 = 1073741824;
                            i12 = i10;
                            if (layoutParams2.width != -1) {
                                i12 = layoutParams2.width;
                                i3 = 1073741824;
                            }
                        }
                        int i13 = i9;
                        int i14 = i11;
                        if (layoutParams2.height != -2) {
                            i13 = 1073741824;
                            i14 = i11;
                            if (layoutParams2.height != -1) {
                                i14 = layoutParams2.height;
                                i13 = 1073741824;
                            }
                        }
                        childAt.measure(View.MeasureSpec.makeMeasureSpec(i12, i3), View.MeasureSpec.makeMeasureSpec(i14, i13));
                        if (z) {
                            i5 = measuredHeight - childAt.getMeasuredHeight();
                            i6 = paddingLeft;
                        } else {
                            i5 = measuredHeight;
                            i6 = paddingLeft;
                            if (z2) {
                                i6 = paddingLeft - childAt.getMeasuredWidth();
                                i5 = measuredHeight;
                            }
                        }
                    }
                }
            }
            i4++;
            measuredHeight = i5;
            paddingLeft = i6;
        }
        this.mChildWidthMeasureSpec = View.MeasureSpec.makeMeasureSpec(paddingLeft, 1073741824);
        this.mChildHeightMeasureSpec = View.MeasureSpec.makeMeasureSpec(measuredHeight, 1073741824);
        this.mInLayout = true;
        populate();
        this.mInLayout = false;
        int childCount2 = getChildCount();
        for (int i15 = 0; i15 < childCount2; i15++) {
            View childAt2 = getChildAt(i15);
            if (childAt2.getVisibility() != 8 && ((layoutParams = (LayoutParams) childAt2.getLayoutParams()) == null || !layoutParams.isDecor)) {
                childAt2.measure(View.MeasureSpec.makeMeasureSpec((int) (paddingLeft * layoutParams.widthFactor), 1073741824), this.mChildHeightMeasureSpec);
            }
        }
    }

    @CallSuper
    protected void onPageScrolled(int i, float f, int i2) {
        int measuredWidth;
        int i3;
        int i4;
        if (this.mDecorChildCount > 0) {
            int scrollX = getScrollX();
            int paddingLeft = getPaddingLeft();
            int paddingRight = getPaddingRight();
            int width = getWidth();
            int childCount = getChildCount();
            int i5 = 0;
            while (i5 < childCount) {
                View childAt = getChildAt(i5);
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (!layoutParams.isDecor) {
                    i4 = paddingRight;
                    i3 = paddingLeft;
                } else {
                    switch (layoutParams.gravity & 7) {
                        case 1:
                            measuredWidth = Math.max((width - childAt.getMeasuredWidth()) / 2, paddingLeft);
                            break;
                        case 2:
                        case 4:
                        default:
                            measuredWidth = paddingLeft;
                            break;
                        case 3:
                            measuredWidth = paddingLeft;
                            paddingLeft += childAt.getWidth();
                            break;
                        case 5:
                            measuredWidth = (width - paddingRight) - childAt.getMeasuredWidth();
                            paddingRight += childAt.getMeasuredWidth();
                            break;
                    }
                    int left = (measuredWidth + scrollX) - childAt.getLeft();
                    i3 = paddingLeft;
                    i4 = paddingRight;
                    if (left != 0) {
                        childAt.offsetLeftAndRight(left);
                        i3 = paddingLeft;
                        i4 = paddingRight;
                    }
                }
                i5++;
                paddingLeft = i3;
                paddingRight = i4;
            }
        }
        dispatchOnPageScrolled(i, f, i2);
        if (this.mPageTransformer != null) {
            int scrollX2 = getScrollX();
            int childCount2 = getChildCount();
            for (int i6 = 0; i6 < childCount2; i6++) {
                View childAt2 = getChildAt(i6);
                if (!((LayoutParams) childAt2.getLayoutParams()).isDecor) {
                    this.mPageTransformer.transformPage(childAt2, (childAt2.getLeft() - scrollX2) / getClientWidth());
                }
            }
        }
        this.mCalledSuper = true;
    }

    @Override // android.view.ViewGroup
    protected boolean onRequestFocusInDescendants(int i, Rect rect) {
        int i2;
        int i3;
        boolean z;
        ItemInfo infoForChild;
        int childCount = getChildCount();
        if ((i & 2) != 0) {
            i3 = 0;
            i2 = 1;
        } else {
            i3 = childCount - 1;
            i2 = -1;
            childCount = -1;
        }
        while (true) {
            if (i3 == childCount) {
                z = false;
                break;
            }
            View childAt = getChildAt(i3);
            if (childAt.getVisibility() == 0 && (infoForChild = infoForChild(childAt)) != null && infoForChild.position == this.mCurItem && childAt.requestFocus(i, rect)) {
                z = true;
                break;
            }
            i3 += i2;
        }
        return z;
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        if (this.mAdapter != null) {
            this.mAdapter.restoreState(savedState.adapterState, savedState.loader);
            setCurrentItemInternal(savedState.position, false, true);
            return;
        }
        this.mRestoredCurItem = savedState.position;
        this.mRestoredAdapterState = savedState.adapterState;
        this.mRestoredClassLoader = savedState.loader;
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.position = this.mCurItem;
        if (this.mAdapter != null) {
            savedState.adapterState = this.mAdapter.saveState();
        }
        return savedState;
    }

    @Override // android.view.View
    protected void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (i != i3) {
            recomputeScrollPosition(i, i3, this.mPageMargin, this.mPageMargin);
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        boolean z;
        if (this.mFakeDragging) {
            z = true;
        } else if (motionEvent.getAction() == 0 && motionEvent.getEdgeFlags() != 0) {
            z = false;
        } else if (this.mAdapter == null || this.mAdapter.getCount() == 0) {
            z = false;
        } else {
            if (this.mVelocityTracker == null) {
                this.mVelocityTracker = VelocityTracker.obtain();
            }
            this.mVelocityTracker.addMovement(motionEvent);
            boolean z2 = false;
            switch (motionEvent.getAction() & 255) {
                case 0:
                    this.mScroller.abortAnimation();
                    this.mPopulatePending = false;
                    populate();
                    float x = motionEvent.getX();
                    this.mInitialMotionX = x;
                    this.mLastMotionX = x;
                    float y = motionEvent.getY();
                    this.mInitialMotionY = y;
                    this.mLastMotionY = y;
                    this.mActivePointerId = motionEvent.getPointerId(0);
                    z2 = false;
                    break;
                case 1:
                    z2 = false;
                    if (this.mIsBeingDragged) {
                        VelocityTracker velocityTracker = this.mVelocityTracker;
                        velocityTracker.computeCurrentVelocity(1000, this.mMaximumVelocity);
                        int xVelocity = (int) VelocityTrackerCompat.getXVelocity(velocityTracker, this.mActivePointerId);
                        this.mPopulatePending = true;
                        int clientWidth = getClientWidth();
                        int scrollX = getScrollX();
                        ItemInfo infoForCurrentScrollPosition = infoForCurrentScrollPosition();
                        setCurrentItemInternal(determineTargetPage(infoForCurrentScrollPosition.position, ((scrollX / clientWidth) - infoForCurrentScrollPosition.offset) / (infoForCurrentScrollPosition.widthFactor + (this.mPageMargin / clientWidth)), xVelocity, (int) (motionEvent.getX(motionEvent.findPointerIndex(this.mActivePointerId)) - this.mInitialMotionX)), true, true, xVelocity);
                        z2 = resetTouch();
                        break;
                    }
                    break;
                case 2:
                    if (!this.mIsBeingDragged) {
                        int findPointerIndex = motionEvent.findPointerIndex(this.mActivePointerId);
                        if (findPointerIndex == -1) {
                            z2 = resetTouch();
                            break;
                        } else {
                            float x2 = motionEvent.getX(findPointerIndex);
                            float abs = Math.abs(x2 - this.mLastMotionX);
                            float y2 = motionEvent.getY(findPointerIndex);
                            float abs2 = Math.abs(y2 - this.mLastMotionY);
                            if (abs > this.mTouchSlop && abs > abs2) {
                                this.mIsBeingDragged = true;
                                requestParentDisallowInterceptTouchEvent(true);
                                this.mLastMotionX = x2 - this.mInitialMotionX > 0.0f ? this.mInitialMotionX + this.mTouchSlop : this.mInitialMotionX - this.mTouchSlop;
                                this.mLastMotionY = y2;
                                setScrollState(1);
                                setScrollingCacheEnabled(true);
                                ViewParent parent = getParent();
                                if (parent != null) {
                                    parent.requestDisallowInterceptTouchEvent(true);
                                }
                            }
                        }
                    }
                    z2 = false;
                    if (this.mIsBeingDragged) {
                        z2 = false | performDrag(motionEvent.getX(motionEvent.findPointerIndex(this.mActivePointerId)));
                        break;
                    }
                    break;
                case 3:
                    z2 = false;
                    if (this.mIsBeingDragged) {
                        scrollToItem(this.mCurItem, true, 0, false);
                        z2 = resetTouch();
                        break;
                    }
                    break;
                case 4:
                    break;
                case 5:
                    int actionIndex = MotionEventCompat.getActionIndex(motionEvent);
                    this.mLastMotionX = motionEvent.getX(actionIndex);
                    this.mActivePointerId = motionEvent.getPointerId(actionIndex);
                    z2 = false;
                    break;
                case 6:
                    onSecondaryPointerUp(motionEvent);
                    this.mLastMotionX = motionEvent.getX(motionEvent.findPointerIndex(this.mActivePointerId));
                    z2 = false;
                    break;
                default:
                    z2 = false;
                    break;
            }
            if (z2) {
                ViewCompat.postInvalidateOnAnimation(this);
            }
            z = true;
        }
        return z;
    }

    boolean pageLeft() {
        boolean z = true;
        if (this.mCurItem > 0) {
            setCurrentItem(this.mCurItem - 1, true);
        } else {
            z = false;
        }
        return z;
    }

    boolean pageRight() {
        boolean z = true;
        if (this.mAdapter == null || this.mCurItem >= this.mAdapter.getCount() - 1) {
            z = false;
        } else {
            setCurrentItem(this.mCurItem + 1, true);
        }
        return z;
    }

    void populate() {
        populate(this.mCurItem);
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x00d3 -> B:17:0x007f). Please submit an issue!!! */
    void populate(int i) {
        String hexString;
        ItemInfo itemInfo;
        ItemInfo infoForChild;
        int i2;
        float f;
        ItemInfo itemInfo2;
        float f2;
        int i3;
        ItemInfo itemInfo3;
        int i4;
        ItemInfo itemInfo4 = null;
        if (this.mCurItem != i) {
            itemInfo4 = infoForPosition(this.mCurItem);
            this.mCurItem = i;
        }
        if (this.mAdapter == null) {
            sortChildDrawingOrder();
        } else if (this.mPopulatePending) {
            sortChildDrawingOrder();
        } else if (getWindowToken() != null) {
            this.mAdapter.startUpdate((ViewGroup) this);
            int i5 = this.mOffscreenPageLimit;
            int max = Math.max(0, this.mCurItem - i5);
            int count = this.mAdapter.getCount();
            int min = Math.min(count - 1, this.mCurItem + i5);
            if (count != this.mExpectedAdapterCount) {
                try {
                    hexString = getResources().getResourceName(getId());
                } catch (Resources.NotFoundException e) {
                    hexString = Integer.toHexString(getId());
                }
                throw new IllegalStateException("The application's PagerAdapter changed the adapter's contents without calling PagerAdapter#notifyDataSetChanged! Expected adapter item count: " + this.mExpectedAdapterCount + ", found: " + count + " Pager id: " + hexString + " Pager class: " + getClass() + " Problematic adapter: " + this.mAdapter.getClass());
            }
            int i6 = 0;
            while (true) {
                itemInfo = null;
                if (i6 >= this.mItems.size()) {
                    break;
                }
                ItemInfo itemInfo5 = this.mItems.get(i6);
                if (itemInfo5.position >= this.mCurItem) {
                    itemInfo = null;
                    if (itemInfo5.position == this.mCurItem) {
                        itemInfo = itemInfo5;
                    }
                } else {
                    i6++;
                }
            }
            ItemInfo itemInfo6 = itemInfo;
            if (itemInfo == null) {
                itemInfo6 = itemInfo;
                if (count > 0) {
                    itemInfo6 = addNewItem(this.mCurItem, i6);
                }
            }
            if (itemInfo6 != null) {
                float f3 = 0.0f;
                int i7 = i6 - 1;
                ItemInfo itemInfo7 = i7 >= 0 ? this.mItems.get(i7) : null;
                int clientWidth = getClientWidth();
                float paddingLeft = clientWidth <= 0 ? 0.0f : (2.0f - itemInfo6.widthFactor) + (getPaddingLeft() / clientWidth);
                int i8 = this.mCurItem - 1;
                ItemInfo itemInfo8 = itemInfo7;
                int i9 = i6;
                while (i8 >= 0) {
                    if (f3 < paddingLeft || i8 >= max) {
                        if (itemInfo8 == null || i8 != itemInfo8.position) {
                            f2 = f3 + addNewItem(i8, i7 + 1).widthFactor;
                            i3 = i9 + 1;
                            itemInfo3 = i7 >= 0 ? this.mItems.get(i7) : null;
                            i4 = i7;
                        } else {
                            f2 = f3 + itemInfo8.widthFactor;
                            i4 = i7 - 1;
                            itemInfo3 = i4 >= 0 ? this.mItems.get(i4) : null;
                            i3 = i9;
                        }
                    } else if (itemInfo8 == null) {
                        break;
                    } else {
                        i3 = i9;
                        f2 = f3;
                        itemInfo3 = itemInfo8;
                        i4 = i7;
                        if (i8 == itemInfo8.position) {
                            i3 = i9;
                            f2 = f3;
                            itemInfo3 = itemInfo8;
                            i4 = i7;
                            if (!itemInfo8.scrolling) {
                                this.mItems.remove(i7);
                                this.mAdapter.destroyItem((ViewGroup) this, i8, itemInfo8.object);
                                i4 = i7 - 1;
                                i3 = i9 - 1;
                                if (i4 >= 0) {
                                    itemInfo3 = this.mItems.get(i4);
                                    f2 = f3;
                                } else {
                                    itemInfo3 = null;
                                    f2 = f3;
                                }
                            }
                        }
                    }
                    i8--;
                    i9 = i3;
                    f3 = f2;
                    itemInfo8 = itemInfo3;
                    i7 = i4;
                }
                float f4 = itemInfo6.widthFactor;
                int i10 = i9 + 1;
                if (f4 < 2.0f) {
                    ItemInfo itemInfo9 = i10 < this.mItems.size() ? this.mItems.get(i10) : null;
                    float paddingRight = clientWidth <= 0 ? 0.0f : (getPaddingRight() / clientWidth) + 2.0f;
                    int i11 = this.mCurItem + 1;
                    ItemInfo itemInfo10 = itemInfo9;
                    while (i11 < count) {
                        if (f4 < paddingRight || i11 <= min) {
                            if (itemInfo10 == null || i11 != itemInfo10.position) {
                                i2 = i10 + 1;
                                f = f4 + addNewItem(i11, i10).widthFactor;
                                itemInfo2 = i2 < this.mItems.size() ? this.mItems.get(i2) : null;
                            } else {
                                f = f4 + itemInfo10.widthFactor;
                                i2 = i10 + 1;
                                itemInfo2 = i2 < this.mItems.size() ? this.mItems.get(i2) : null;
                            }
                        } else if (itemInfo10 == null) {
                            break;
                        } else {
                            f = f4;
                            itemInfo2 = itemInfo10;
                            i2 = i10;
                            if (i11 == itemInfo10.position) {
                                f = f4;
                                itemInfo2 = itemInfo10;
                                i2 = i10;
                                if (!itemInfo10.scrolling) {
                                    this.mItems.remove(i10);
                                    this.mAdapter.destroyItem((ViewGroup) this, i11, itemInfo10.object);
                                    if (i10 < this.mItems.size()) {
                                        itemInfo2 = this.mItems.get(i10);
                                        i2 = i10;
                                        f = f4;
                                    } else {
                                        itemInfo2 = null;
                                        f = f4;
                                        i2 = i10;
                                    }
                                }
                            }
                        }
                        i11++;
                        f4 = f;
                        itemInfo10 = itemInfo2;
                        i10 = i2;
                    }
                }
                calculatePageOffsets(itemInfo6, i9, itemInfo4);
            }
            this.mAdapter.setPrimaryItem((ViewGroup) this, this.mCurItem, itemInfo6 != null ? itemInfo6.object : null);
            this.mAdapter.finishUpdate((ViewGroup) this);
            int childCount = getChildCount();
            for (int i12 = 0; i12 < childCount; i12++) {
                View childAt = getChildAt(i12);
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                layoutParams.childIndex = i12;
                if (!layoutParams.isDecor && layoutParams.widthFactor == 0.0f && (infoForChild = infoForChild(childAt)) != null) {
                    layoutParams.widthFactor = infoForChild.widthFactor;
                    layoutParams.position = infoForChild.position;
                }
            }
            sortChildDrawingOrder();
            if (!hasFocus()) {
                return;
            }
            View findFocus = findFocus();
            ItemInfo infoForAnyChild = findFocus != null ? infoForAnyChild(findFocus) : null;
            if (infoForAnyChild != null && infoForAnyChild.position == this.mCurItem) {
                return;
            }
            for (int i13 = 0; i13 < getChildCount(); i13++) {
                View childAt2 = getChildAt(i13);
                ItemInfo infoForChild2 = infoForChild(childAt2);
                if (infoForChild2 != null && infoForChild2.position == this.mCurItem && childAt2.requestFocus(2)) {
                    return;
                }
            }
        }
    }

    public void removeOnAdapterChangeListener(@NonNull OnAdapterChangeListener onAdapterChangeListener) {
        if (this.mAdapterChangeListeners != null) {
            this.mAdapterChangeListeners.remove(onAdapterChangeListener);
        }
    }

    public void removeOnPageChangeListener(OnPageChangeListener onPageChangeListener) {
        if (this.mOnPageChangeListeners != null) {
            this.mOnPageChangeListeners.remove(onPageChangeListener);
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void removeView(View view) {
        if (this.mInLayout) {
            removeViewInLayout(view);
        } else {
            super.removeView(view);
        }
    }

    public void setAdapter(PagerAdapter pagerAdapter) {
        if (this.mAdapter != null) {
            this.mAdapter.setViewPagerObserver(null);
            this.mAdapter.startUpdate((ViewGroup) this);
            for (int i = 0; i < this.mItems.size(); i++) {
                ItemInfo itemInfo = this.mItems.get(i);
                this.mAdapter.destroyItem((ViewGroup) this, itemInfo.position, itemInfo.object);
            }
            this.mAdapter.finishUpdate((ViewGroup) this);
            this.mItems.clear();
            removeNonDecorViews();
            this.mCurItem = 0;
            scrollTo(0, 0);
        }
        PagerAdapter pagerAdapter2 = this.mAdapter;
        this.mAdapter = pagerAdapter;
        this.mExpectedAdapterCount = 0;
        if (this.mAdapter != null) {
            if (this.mObserver == null) {
                this.mObserver = new PagerObserver();
            }
            this.mAdapter.setViewPagerObserver(this.mObserver);
            this.mPopulatePending = false;
            boolean z = this.mFirstLayout;
            this.mFirstLayout = true;
            this.mExpectedAdapterCount = this.mAdapter.getCount();
            if (this.mRestoredCurItem >= 0) {
                this.mAdapter.restoreState(this.mRestoredAdapterState, this.mRestoredClassLoader);
                setCurrentItemInternal(this.mRestoredCurItem, false, true);
                this.mRestoredCurItem = -1;
                this.mRestoredAdapterState = null;
                this.mRestoredClassLoader = null;
            } else if (!z) {
                populate();
            } else {
                requestLayout();
            }
        }
        if (this.mAdapterChangeListeners == null || this.mAdapterChangeListeners.isEmpty()) {
            return;
        }
        int size = this.mAdapterChangeListeners.size();
        for (int i2 = 0; i2 < size; i2++) {
            this.mAdapterChangeListeners.get(i2).onAdapterChanged(this, pagerAdapter2, pagerAdapter);
        }
    }

    void setChildrenDrawingOrderEnabledCompat(boolean z) {
        if (Build.VERSION.SDK_INT >= 7) {
            if (this.mSetChildrenDrawingOrderEnabled == null) {
                try {
                    this.mSetChildrenDrawingOrderEnabled = ViewGroup.class.getDeclaredMethod("setChildrenDrawingOrderEnabled", Boolean.TYPE);
                } catch (NoSuchMethodException e) {
                    Log.e(TAG, "Can't find setChildrenDrawingOrderEnabled", e);
                }
            }
            try {
                this.mSetChildrenDrawingOrderEnabled.invoke(this, Boolean.valueOf(z));
            } catch (Exception e2) {
                Log.e(TAG, "Error changing children drawing order", e2);
            }
        }
    }

    public void setCurrentItem(int i) {
        this.mPopulatePending = false;
        setCurrentItemInternal(i, !this.mFirstLayout, false);
    }

    public void setCurrentItem(int i, boolean z) {
        this.mPopulatePending = false;
        setCurrentItemInternal(i, z, false);
    }

    void setCurrentItemInternal(int i, boolean z, boolean z2) {
        setCurrentItemInternal(i, z, z2, 0);
    }

    void setCurrentItemInternal(int i, boolean z, boolean z2, int i2) {
        int i3;
        if (this.mAdapter == null || this.mAdapter.getCount() <= 0) {
            setScrollingCacheEnabled(false);
        } else if (z2 || this.mCurItem != i || this.mItems.size() == 0) {
            if (i < 0) {
                i3 = 0;
            } else {
                i3 = i;
                if (i >= this.mAdapter.getCount()) {
                    i3 = this.mAdapter.getCount() - 1;
                }
            }
            int i4 = this.mOffscreenPageLimit;
            if (i3 > this.mCurItem + i4 || i3 < this.mCurItem - i4) {
                for (int i5 = 0; i5 < this.mItems.size(); i5++) {
                    this.mItems.get(i5).scrolling = true;
                }
            }
            boolean z3 = this.mCurItem != i3;
            if (!this.mFirstLayout) {
                populate(i3);
                scrollToItem(i3, z, i2, z3);
                return;
            }
            this.mCurItem = i3;
            if (z3) {
                dispatchOnPageSelected(i3);
            }
            requestLayout();
        } else {
            setScrollingCacheEnabled(false);
        }
    }

    OnPageChangeListener setInternalPageChangeListener(OnPageChangeListener onPageChangeListener) {
        OnPageChangeListener onPageChangeListener2 = this.mInternalPageChangeListener;
        this.mInternalPageChangeListener = onPageChangeListener;
        return onPageChangeListener2;
    }

    public void setOffscreenPageLimit(int i) {
        int i2 = i;
        if (i < 1) {
            Log.w(TAG, "Requested offscreen page limit " + i + " too small; defaulting to 1");
            i2 = 1;
        }
        if (i2 != this.mOffscreenPageLimit) {
            this.mOffscreenPageLimit = i2;
            populate();
        }
    }

    @Deprecated
    public void setOnPageChangeListener(OnPageChangeListener onPageChangeListener) {
        this.mOnPageChangeListener = onPageChangeListener;
    }

    public void setPageMargin(int i) {
        int i2 = this.mPageMargin;
        this.mPageMargin = i;
        int width = getWidth();
        recomputeScrollPosition(width, width, i, i2);
        requestLayout();
    }

    public void setPageMarginDrawable(@DrawableRes int i) {
        setPageMarginDrawable(ContextCompat.getDrawable(getContext(), i));
    }

    public void setPageMarginDrawable(Drawable drawable) {
        this.mMarginDrawable = drawable;
        if (drawable != null) {
            refreshDrawableState();
        }
        setWillNotDraw(drawable == null);
        invalidate();
    }

    public void setPageTransformer(boolean z, PageTransformer pageTransformer) {
        setPageTransformer(z, pageTransformer, 2);
    }

    public void setPageTransformer(boolean z, PageTransformer pageTransformer, int i) {
        int i2 = 1;
        if (Build.VERSION.SDK_INT >= 11) {
            boolean z2 = pageTransformer != null;
            boolean z3 = z2 != (this.mPageTransformer != null);
            this.mPageTransformer = pageTransformer;
            setChildrenDrawingOrderEnabledCompat(z2);
            if (z2) {
                if (z) {
                    i2 = 2;
                }
                this.mDrawingOrder = i2;
                this.mPageTransformerLayerType = i;
            } else {
                this.mDrawingOrder = 0;
            }
            if (!z3) {
                return;
            }
            populate();
        }
    }

    void setScrollState(int i) {
        if (this.mScrollState == i) {
            return;
        }
        this.mScrollState = i;
        if (this.mPageTransformer != null) {
            enableLayers(i != 0);
        }
        dispatchOnScrollStateChanged(i);
    }

    void smoothScrollTo(int i, int i2) {
        smoothScrollTo(i, i2, 0);
    }

    void smoothScrollTo(int i, int i2, int i3) {
        int scrollX;
        if (getChildCount() == 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        if (this.mScroller != null && !this.mScroller.isFinished()) {
            scrollX = this.mIsScrollStarted ? this.mScroller.getCurrX() : this.mScroller.getStartX();
            this.mScroller.abortAnimation();
            setScrollingCacheEnabled(false);
        } else {
            scrollX = getScrollX();
        }
        int scrollY = getScrollY();
        int i4 = i - scrollX;
        int i5 = i2 - scrollY;
        if (i4 == 0 && i5 == 0) {
            completeScroll(false);
            populate();
            setScrollState(0);
            return;
        }
        setScrollingCacheEnabled(true);
        setScrollState(2);
        int clientWidth = getClientWidth();
        int i6 = clientWidth / 2;
        float f = i6;
        float f2 = i6;
        float distanceInfluenceForSnapDuration = distanceInfluenceForSnapDuration(Math.min(1.0f, (1.0f * Math.abs(i4)) / clientWidth));
        int abs = Math.abs(i3);
        int min = Math.min(abs > 0 ? Math.round(1000.0f * Math.abs((f + (f2 * distanceInfluenceForSnapDuration)) / abs)) * 4 : (int) ((1.0f + (Math.abs(i4) / (this.mPageMargin + (clientWidth * this.mAdapter.getPageWidth(this.mCurItem))))) * 100.0f), (int) MAX_SETTLE_DURATION);
        this.mIsScrollStarted = false;
        this.mScroller.startScroll(scrollX, scrollY, i4, i5, min);
        ViewCompat.postInvalidateOnAnimation(this);
    }

    @Override // android.view.View
    protected boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.mMarginDrawable;
    }
}
