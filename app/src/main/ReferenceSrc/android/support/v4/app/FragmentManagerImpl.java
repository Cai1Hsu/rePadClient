package android.support.v4.app;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import android.os.Parcelable;
import android.support.annotation.CallSuper;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.os.BuildCompat;
import android.support.v4.os.EnvironmentCompat;
import android.support.v4.util.ArraySet;
import android.support.v4.util.DebugUtils;
import android.support.v4.util.LogWriter;
import android.support.v4.util.Pair;
import android.support.v4.view.LayoutInflaterFactory;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.ScaleAnimation;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/* loaded from: classes.jar:android/support/v4/app/FragmentManagerImpl.class */
final class FragmentManagerImpl extends FragmentManager implements LayoutInflaterFactory {
    static final Interpolator ACCELERATE_CUBIC;
    static final Interpolator ACCELERATE_QUINT;
    static final int ANIM_DUR = 220;
    public static final int ANIM_STYLE_CLOSE_ENTER = 3;
    public static final int ANIM_STYLE_CLOSE_EXIT = 4;
    public static final int ANIM_STYLE_FADE_ENTER = 5;
    public static final int ANIM_STYLE_FADE_EXIT = 6;
    public static final int ANIM_STYLE_OPEN_ENTER = 1;
    public static final int ANIM_STYLE_OPEN_EXIT = 2;
    static boolean DEBUG = false;
    static final Interpolator DECELERATE_CUBIC;
    static final Interpolator DECELERATE_QUINT;
    static final boolean HONEYCOMB;
    static final String TAG = "FragmentManager";
    static final String TARGET_REQUEST_CODE_STATE_TAG = "android:target_req_state";
    static final String TARGET_STATE_TAG = "android:target_state";
    static final String USER_VISIBLE_HINT_TAG = "android:user_visible_hint";
    static final String VIEW_STATE_TAG = "android:view_state";
    static Field sAnimationListenerField;
    ArrayList<Fragment> mActive;
    ArrayList<Fragment> mAdded;
    ArrayList<Integer> mAvailBackStackIndices;
    ArrayList<Integer> mAvailIndices;
    ArrayList<BackStackRecord> mBackStack;
    ArrayList<FragmentManager.OnBackStackChangedListener> mBackStackChangeListeners;
    ArrayList<BackStackRecord> mBackStackIndices;
    FragmentContainer mContainer;
    ArrayList<Fragment> mCreatedMenus;
    boolean mDestroyed;
    boolean mExecutingActions;
    boolean mHavePendingDeferredStart;
    FragmentHostCallback mHost;
    private CopyOnWriteArrayList<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> mLifecycleCallbacks;
    boolean mNeedMenuInvalidate;
    String mNoTransactionsBecause;
    Fragment mParent;
    ArrayList<OpGenerator> mPendingActions;
    ArrayList<StartEnterTransitionListener> mPostponedTransactions;
    boolean mStateSaved;
    Runnable[] mTmpActions;
    ArrayList<Fragment> mTmpAddedFragments;
    ArrayList<Boolean> mTmpIsPop;
    ArrayList<BackStackRecord> mTmpRecords;
    int mCurState = 0;
    Bundle mStateBundle = null;
    SparseArray<Parcelable> mStateArray = null;
    Runnable mExecCommit = new Runnable() { // from class: android.support.v4.app.FragmentManagerImpl.1
        @Override // java.lang.Runnable
        public void run() {
            FragmentManagerImpl.this.execPendingActions();
        }
    };

    /* loaded from: classes.jar:android/support/v4/app/FragmentManagerImpl$AnimateOnHWLayerIfNeededListener.class */
    static class AnimateOnHWLayerIfNeededListener implements Animation.AnimationListener {
        private Animation.AnimationListener mOriginalListener;
        private boolean mShouldRunOnHWLayer;
        View mView;

        public AnimateOnHWLayerIfNeededListener(View view, Animation animation) {
            if (view == null || animation == null) {
                return;
            }
            this.mView = view;
        }

        public AnimateOnHWLayerIfNeededListener(View view, Animation animation, Animation.AnimationListener animationListener) {
            if (view == null || animation == null) {
                return;
            }
            this.mOriginalListener = animationListener;
            this.mView = view;
            this.mShouldRunOnHWLayer = true;
        }

        @Override // android.view.animation.Animation.AnimationListener
        @CallSuper
        public void onAnimationEnd(Animation animation) {
            if (this.mView != null && this.mShouldRunOnHWLayer) {
                if (ViewCompat.isAttachedToWindow(this.mView) || BuildCompat.isAtLeastN()) {
                    this.mView.post(new Runnable() { // from class: android.support.v4.app.FragmentManagerImpl.AnimateOnHWLayerIfNeededListener.1
                        @Override // java.lang.Runnable
                        public void run() {
                            ViewCompat.setLayerType(AnimateOnHWLayerIfNeededListener.this.mView, 0, null);
                        }
                    });
                } else {
                    ViewCompat.setLayerType(this.mView, 0, null);
                }
            }
            if (this.mOriginalListener != null) {
                this.mOriginalListener.onAnimationEnd(animation);
            }
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationRepeat(Animation animation) {
            if (this.mOriginalListener != null) {
                this.mOriginalListener.onAnimationRepeat(animation);
            }
        }

        @Override // android.view.animation.Animation.AnimationListener
        @CallSuper
        public void onAnimationStart(Animation animation) {
            if (this.mOriginalListener != null) {
                this.mOriginalListener.onAnimationStart(animation);
            }
        }
    }

    /* loaded from: classes.jar:android/support/v4/app/FragmentManagerImpl$FragmentTag.class */
    static class FragmentTag {
        public static final int[] Fragment = {16842755, 16842960, 16842961};
        public static final int Fragment_id = 1;
        public static final int Fragment_name = 0;
        public static final int Fragment_tag = 2;

        FragmentTag() {
        }
    }

    /* loaded from: classes.jar:android/support/v4/app/FragmentManagerImpl$OpGenerator.class */
    interface OpGenerator {
        boolean generateOps(ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2);
    }

    /* loaded from: classes.jar:android/support/v4/app/FragmentManagerImpl$PopBackStackState.class */
    private class PopBackStackState implements OpGenerator {
        final int mFlags;
        final int mId;
        final String mName;

        PopBackStackState(String str, int i, int i2) {
            FragmentManagerImpl.this = r4;
            this.mName = str;
            this.mId = i;
            this.mFlags = i2;
        }

        @Override // android.support.v4.app.FragmentManagerImpl.OpGenerator
        public boolean generateOps(ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2) {
            return FragmentManagerImpl.this.popBackStackState(arrayList, arrayList2, this.mName, this.mId, this.mFlags);
        }
    }

    /* loaded from: classes.jar:android/support/v4/app/FragmentManagerImpl$StartEnterTransitionListener.class */
    static class StartEnterTransitionListener implements Fragment.OnStartEnterTransitionListener {
        private final boolean mIsBack;
        private int mNumPostponed;
        private final BackStackRecord mRecord;

        StartEnterTransitionListener(BackStackRecord backStackRecord, boolean z) {
            this.mIsBack = z;
            this.mRecord = backStackRecord;
        }

        public void cancelTransaction() {
            this.mRecord.mManager.completeExecute(this.mRecord, this.mIsBack, false, false);
        }

        public void completeTransaction() {
            boolean z = false;
            boolean z2 = this.mNumPostponed > 0;
            FragmentManagerImpl fragmentManagerImpl = this.mRecord.mManager;
            int size = fragmentManagerImpl.mAdded.size();
            for (int i = 0; i < size; i++) {
                Fragment fragment = fragmentManagerImpl.mAdded.get(i);
                fragment.setOnStartEnterTransitionListener(null);
                if (z2 && fragment.isPostponed()) {
                    fragment.startPostponedEnterTransition();
                }
            }
            FragmentManagerImpl fragmentManagerImpl2 = this.mRecord.mManager;
            BackStackRecord backStackRecord = this.mRecord;
            boolean z3 = this.mIsBack;
            if (!z2) {
                z = true;
            }
            fragmentManagerImpl2.completeExecute(backStackRecord, z3, z, true);
        }

        public boolean isReady() {
            return this.mNumPostponed == 0;
        }

        @Override // android.support.v4.app.Fragment.OnStartEnterTransitionListener
        public void onStartEnterTransition() {
            this.mNumPostponed--;
            if (this.mNumPostponed != 0) {
                return;
            }
            this.mRecord.mManager.scheduleCommit();
        }

        @Override // android.support.v4.app.Fragment.OnStartEnterTransitionListener
        public void startListening() {
            this.mNumPostponed++;
        }
    }

    static {
        boolean z = false;
        if (Build.VERSION.SDK_INT >= 11) {
            z = true;
        }
        HONEYCOMB = z;
        sAnimationListenerField = null;
        DECELERATE_QUINT = new DecelerateInterpolator(2.5f);
        DECELERATE_CUBIC = new DecelerateInterpolator(1.5f);
        ACCELERATE_QUINT = new AccelerateInterpolator(2.5f);
        ACCELERATE_CUBIC = new AccelerateInterpolator(1.5f);
    }

    FragmentManagerImpl() {
    }

    private void addAddedFragments(ArraySet<Fragment> arraySet) {
        if (this.mCurState < 1) {
            return;
        }
        int min = Math.min(this.mCurState, 4);
        int size = this.mAdded == null ? 0 : this.mAdded.size();
        for (int i = 0; i < size; i++) {
            Fragment fragment = this.mAdded.get(i);
            if (fragment.mState < min) {
                moveToState(fragment, min, fragment.getNextAnim(), fragment.getNextTransition(), false);
                if (fragment.mView != null && !fragment.mHidden && fragment.mIsNewlyAdded) {
                    arraySet.add(fragment);
                }
            }
        }
    }

    private void checkStateLoss() {
        if (this.mStateSaved) {
            throw new IllegalStateException("Can not perform this action after onSaveInstanceState");
        }
        if (this.mNoTransactionsBecause == null) {
            return;
        }
        throw new IllegalStateException("Can not perform this action inside of " + this.mNoTransactionsBecause);
    }

    private void cleanupExec() {
        this.mExecutingActions = false;
        this.mTmpIsPop.clear();
        this.mTmpRecords.clear();
    }

    public void completeExecute(BackStackRecord backStackRecord, boolean z, boolean z2, boolean z3) {
        ArrayList arrayList = new ArrayList(1);
        ArrayList arrayList2 = new ArrayList(1);
        arrayList.add(backStackRecord);
        arrayList2.add(Boolean.valueOf(z));
        executeOps(arrayList, arrayList2, 0, 1);
        if (z2) {
            FragmentTransition.startTransitions(this, arrayList, arrayList2, 0, 1, true);
        }
        if (z3) {
            moveToState(this.mCurState, true);
        }
        if (this.mActive != null) {
            int size = this.mActive.size();
            for (int i = 0; i < size; i++) {
                Fragment fragment = this.mActive.get(i);
                if (fragment != null && fragment.mView != null && fragment.mIsNewlyAdded && backStackRecord.interactsWith(fragment.mContainerId)) {
                    if (Build.VERSION.SDK_INT >= 11 && fragment.mPostponedAlpha > 0.0f) {
                        fragment.mView.setAlpha(fragment.mPostponedAlpha);
                    }
                    if (z3) {
                        fragment.mPostponedAlpha = 0.0f;
                    } else {
                        fragment.mPostponedAlpha = -1.0f;
                        fragment.mIsNewlyAdded = false;
                    }
                }
            }
        }
    }

    private void endAnimatingAwayFragments() {
        int size = this.mActive == null ? 0 : this.mActive.size();
        for (int i = 0; i < size; i++) {
            Fragment fragment = this.mActive.get(i);
            if (fragment != null && fragment.getAnimatingAway() != null) {
                int stateAfterAnimating = fragment.getStateAfterAnimating();
                View animatingAway = fragment.getAnimatingAway();
                fragment.setAnimatingAway(null);
                Animation animation = animatingAway.getAnimation();
                if (animation != null) {
                    animation.cancel();
                }
                moveToState(fragment, stateAfterAnimating, 0, 0, false);
            }
        }
    }

    private void ensureExecReady(boolean z) {
        if (this.mExecutingActions) {
            throw new IllegalStateException("FragmentManager is already executing transactions");
        }
        if (Looper.myLooper() != this.mHost.getHandler().getLooper()) {
            throw new IllegalStateException("Must be called from main thread of fragment host");
        }
        if (!z) {
            checkStateLoss();
        }
        if (this.mTmpRecords == null) {
            this.mTmpRecords = new ArrayList<>();
            this.mTmpIsPop = new ArrayList<>();
        }
        this.mExecutingActions = true;
        try {
            executePostponedTransaction(null, null);
        } finally {
            this.mExecutingActions = false;
        }
    }

    private static void executeOps(ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2, int i, int i2) {
        while (i < i2) {
            BackStackRecord backStackRecord = arrayList.get(i);
            if (arrayList2.get(i).booleanValue()) {
                backStackRecord.bumpBackStackNesting(-1);
                backStackRecord.executePopOps(i == i2 - 1);
            } else {
                backStackRecord.bumpBackStackNesting(1);
                backStackRecord.executeOps();
            }
            i++;
        }
    }

    private void executeOpsTogether(ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2, int i, int i2) {
        boolean z = arrayList.get(i).mAllowOptimization;
        boolean z2 = false;
        if (this.mTmpAddedFragments == null) {
            this.mTmpAddedFragments = new ArrayList<>();
        } else {
            this.mTmpAddedFragments.clear();
        }
        if (this.mAdded != null) {
            this.mTmpAddedFragments.addAll(this.mAdded);
        }
        for (int i3 = i; i3 < i2; i3++) {
            BackStackRecord backStackRecord = arrayList.get(i3);
            if (!arrayList2.get(i3).booleanValue()) {
                backStackRecord.expandReplaceOps(this.mTmpAddedFragments);
            } else {
                backStackRecord.trackAddedFragmentsInPop(this.mTmpAddedFragments);
            }
            z2 = z2 || backStackRecord.mAddToBackStack;
        }
        this.mTmpAddedFragments.clear();
        if (!z) {
            FragmentTransition.startTransitions(this, arrayList, arrayList2, i, i2, false);
        }
        executeOps(arrayList, arrayList2, i, i2);
        int i4 = i2;
        if (z) {
            ArraySet<Fragment> arraySet = new ArraySet<>();
            addAddedFragments(arraySet);
            i4 = postponePostponableTransactions(arrayList, arrayList2, i, i2, arraySet);
            makeRemovedFragmentsInvisible(arraySet);
        }
        if (i4 != i && z) {
            FragmentTransition.startTransitions(this, arrayList, arrayList2, i, i4, true);
            moveToState(this.mCurState, true);
        }
        while (i < i2) {
            BackStackRecord backStackRecord2 = arrayList.get(i);
            if (arrayList2.get(i).booleanValue() && backStackRecord2.mIndex >= 0) {
                freeBackStackIndex(backStackRecord2.mIndex);
                backStackRecord2.mIndex = -1;
            }
            i++;
        }
        if (z2) {
            reportBackStackChanged();
        }
    }

    private void executePostponedTransaction(ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2) {
        int i;
        int i2;
        int indexOf;
        int indexOf2;
        int size = this.mPostponedTransactions == null ? 0 : this.mPostponedTransactions.size();
        int i3 = 0;
        while (i3 < size) {
            StartEnterTransitionListener startEnterTransitionListener = this.mPostponedTransactions.get(i3);
            if (arrayList == null || startEnterTransitionListener.mIsBack || (indexOf2 = arrayList.indexOf(startEnterTransitionListener.mRecord)) == -1 || !arrayList2.get(indexOf2).booleanValue()) {
                if (!startEnterTransitionListener.isReady()) {
                    i = i3;
                    i2 = size;
                    if (arrayList != null) {
                        i = i3;
                        i2 = size;
                        if (!startEnterTransitionListener.mRecord.interactsWith(arrayList, 0, arrayList.size())) {
                        }
                    }
                }
                this.mPostponedTransactions.remove(i3);
                i = i3 - 1;
                i2 = size - 1;
                if (arrayList == null || startEnterTransitionListener.mIsBack || (indexOf = arrayList.indexOf(startEnterTransitionListener.mRecord)) == -1 || !arrayList2.get(indexOf).booleanValue()) {
                    startEnterTransitionListener.completeTransaction();
                } else {
                    startEnterTransitionListener.cancelTransaction();
                }
            } else {
                startEnterTransitionListener.cancelTransaction();
                i2 = size;
                i = i3;
            }
            i3 = i + 1;
            size = i2;
        }
    }

    private Fragment findFragmentUnder(Fragment fragment) {
        Fragment fragment2;
        ViewGroup viewGroup = fragment.mContainer;
        View view = fragment.mView;
        if (viewGroup != null && view != null) {
            int indexOf = this.mAdded.indexOf(fragment) - 1;
            while (true) {
                if (indexOf < 0) {
                    fragment2 = null;
                    break;
                }
                Fragment fragment3 = this.mAdded.get(indexOf);
                if (fragment3.mContainer == viewGroup) {
                    fragment2 = fragment3;
                    if (fragment3.mView != null) {
                        break;
                    }
                }
                indexOf--;
            }
        } else {
            fragment2 = null;
        }
        return fragment2;
    }

    private void forcePostponedTransactions() {
        if (this.mPostponedTransactions != null) {
            while (!this.mPostponedTransactions.isEmpty()) {
                this.mPostponedTransactions.remove(0).completeTransaction();
            }
        }
    }

    private boolean generateOpsForPendingActions(ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2) {
        boolean z;
        synchronized (this) {
            if (this.mPendingActions == null || this.mPendingActions.size() == 0) {
                z = false;
            } else {
                int size = this.mPendingActions.size();
                for (int i = 0; i < size; i++) {
                    this.mPendingActions.get(i).generateOps(arrayList, arrayList2);
                }
                this.mPendingActions.clear();
                this.mHost.getHandler().removeCallbacks(this.mExecCommit);
                z = size > 0;
            }
        }
        return z;
    }

    static Animation makeFadeAnimation(Context context, float f, float f2) {
        AlphaAnimation alphaAnimation = new AlphaAnimation(f, f2);
        alphaAnimation.setInterpolator(DECELERATE_CUBIC);
        alphaAnimation.setDuration(220L);
        return alphaAnimation;
    }

    static Animation makeOpenCloseAnimation(Context context, float f, float f2, float f3, float f4) {
        AnimationSet animationSet = new AnimationSet(false);
        ScaleAnimation scaleAnimation = new ScaleAnimation(f, f2, f, f2, 1, 0.5f, 1, 0.5f);
        scaleAnimation.setInterpolator(DECELERATE_QUINT);
        scaleAnimation.setDuration(220L);
        animationSet.addAnimation(scaleAnimation);
        AlphaAnimation alphaAnimation = new AlphaAnimation(f3, f4);
        alphaAnimation.setInterpolator(DECELERATE_CUBIC);
        alphaAnimation.setDuration(220L);
        animationSet.addAnimation(alphaAnimation);
        return animationSet;
    }

    private void makeRemovedFragmentsInvisible(ArraySet<Fragment> arraySet) {
        int size = arraySet.size();
        for (int i = 0; i < size; i++) {
            Fragment valueAt = arraySet.valueAt(i);
            if (!valueAt.mAdded) {
                View view = valueAt.getView();
                if (Build.VERSION.SDK_INT < 11) {
                    valueAt.getView().setVisibility(4);
                } else {
                    valueAt.mPostponedAlpha = view.getAlpha();
                    view.setAlpha(0.0f);
                }
            }
        }
    }

    static boolean modifiesAlpha(Animation animation) {
        boolean z;
        if (animation instanceof AlphaAnimation) {
            z = true;
        } else {
            if (animation instanceof AnimationSet) {
                List<Animation> animations = ((AnimationSet) animation).getAnimations();
                for (int i = 0; i < animations.size(); i++) {
                    z = true;
                    if (animations.get(i) instanceof AlphaAnimation) {
                        break;
                    }
                }
            }
            z = false;
        }
        return z;
    }

    private void optimizeAndExecuteOps(ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2) {
        if (arrayList == null || arrayList.isEmpty()) {
            return;
        }
        if (arrayList2 == null || arrayList.size() != arrayList2.size()) {
            throw new IllegalStateException("Internal error with the back stack records");
        }
        executePostponedTransaction(arrayList, arrayList2);
        int size = arrayList.size();
        int i = 0;
        int i2 = 0;
        while (i2 < size) {
            int i3 = i2;
            int i4 = i;
            if (!arrayList.get(i2).mAllowOptimization) {
                if (i != i2) {
                    executeOpsTogether(arrayList, arrayList2, i, i2);
                }
                int i5 = i2 + 1;
                int i6 = i5;
                if (arrayList2.get(i2).booleanValue()) {
                    while (true) {
                        i6 = i5;
                        if (i5 >= size) {
                            break;
                        }
                        i6 = i5;
                        if (!arrayList2.get(i5).booleanValue()) {
                            break;
                        }
                        i6 = i5;
                        if (arrayList.get(i5).mAllowOptimization) {
                            break;
                        }
                        i5++;
                    }
                }
                executeOpsTogether(arrayList, arrayList2, i2, i6);
                i3 = i6 - 1;
                i4 = i6;
            }
            i2 = i3 + 1;
            i = i4;
        }
        if (i == size) {
            return;
        }
        executeOpsTogether(arrayList, arrayList2, i, size);
    }

    private boolean popBackStackImmediate(String str, int i, int i2) {
        execPendingActions();
        ensureExecReady(true);
        boolean popBackStackState = popBackStackState(this.mTmpRecords, this.mTmpIsPop, str, i, i2);
        if (popBackStackState) {
            this.mExecutingActions = true;
            try {
                optimizeAndExecuteOps(this.mTmpRecords, this.mTmpIsPop);
            } finally {
                cleanupExec();
            }
        }
        doPendingDeferredStart();
        return popBackStackState;
    }

    private int postponePostponableTransactions(ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2, int i, int i2, ArraySet<Fragment> arraySet) {
        int i3 = i2;
        int i4 = i2 - 1;
        while (i4 >= i) {
            BackStackRecord backStackRecord = arrayList.get(i4);
            boolean booleanValue = arrayList2.get(i4).booleanValue();
            int i5 = i3;
            if (backStackRecord.isPostponed() && !backStackRecord.interactsWith(arrayList, i4 + 1, i2)) {
                if (this.mPostponedTransactions == null) {
                    this.mPostponedTransactions = new ArrayList<>();
                }
                StartEnterTransitionListener startEnterTransitionListener = new StartEnterTransitionListener(backStackRecord, booleanValue);
                this.mPostponedTransactions.add(startEnterTransitionListener);
                backStackRecord.setOnStartPostponedListener(startEnterTransitionListener);
                if (booleanValue) {
                    backStackRecord.executeOps();
                } else {
                    backStackRecord.executePopOps(false);
                }
                i5 = i3 - 1;
                if (i4 != i5) {
                    arrayList.remove(i4);
                    arrayList.add(i5, backStackRecord);
                }
                addAddedFragments(arraySet);
            }
            i4--;
            i3 = i5;
        }
        return i3;
    }

    public static int reverseTransit(int i) {
        int i2;
        switch (i) {
            case FragmentTransaction.TRANSIT_FRAGMENT_OPEN /* 4097 */:
                i2 = 8194;
                break;
            case FragmentTransaction.TRANSIT_FRAGMENT_FADE /* 4099 */:
                i2 = 4099;
                break;
            case 8194:
                i2 = 4097;
                break;
            default:
                i2 = 0;
                break;
        }
        return i2;
    }

    public void scheduleCommit() {
        boolean z = true;
        synchronized (this) {
            boolean z2 = this.mPostponedTransactions != null && !this.mPostponedTransactions.isEmpty();
            if (this.mPendingActions == null || this.mPendingActions.size() != 1) {
                z = false;
            }
            if (z2 || z) {
                this.mHost.getHandler().removeCallbacks(this.mExecCommit);
                this.mHost.getHandler().post(this.mExecCommit);
            }
        }
    }

    private void setHWLayerAnimListenerIfAlpha(View view, Animation animation) {
        if (view == null || animation == null || !shouldRunOnHWLayer(view, animation)) {
            return;
        }
        Animation.AnimationListener animationListener = null;
        try {
            if (sAnimationListenerField == null) {
                sAnimationListenerField = Animation.class.getDeclaredField("mListener");
                sAnimationListenerField.setAccessible(true);
            }
            animationListener = (Animation.AnimationListener) sAnimationListenerField.get(animation);
        } catch (IllegalAccessException e) {
            Log.e(TAG, "Cannot access Animation's mListener field", e);
        } catch (NoSuchFieldException e2) {
            Log.e(TAG, "No field with the name mListener is found in Animation class", e2);
        }
        ViewCompat.setLayerType(view, 2, null);
        animation.setAnimationListener(new AnimateOnHWLayerIfNeededListener(view, animation, animationListener));
    }

    static boolean shouldRunOnHWLayer(View view, Animation animation) {
        return Build.VERSION.SDK_INT >= 19 && ViewCompat.getLayerType(view) == 0 && ViewCompat.hasOverlappingRendering(view) && modifiesAlpha(animation);
    }

    private void throwException(RuntimeException runtimeException) {
        Log.e(TAG, runtimeException.getMessage());
        Log.e(TAG, "Activity state:");
        PrintWriter printWriter = new PrintWriter(new LogWriter(TAG));
        if (this.mHost != null) {
            try {
                this.mHost.onDump("  ", null, printWriter, new String[0]);
            } catch (Exception e) {
                Log.e(TAG, "Failed dumping state", e);
            }
        } else {
            try {
                dump("  ", null, printWriter, new String[0]);
            } catch (Exception e2) {
                Log.e(TAG, "Failed dumping state", e2);
            }
        }
        throw runtimeException;
    }

    public static int transitToStyleIndex(int i, boolean z) {
        int i2;
        switch (i) {
            case FragmentTransaction.TRANSIT_FRAGMENT_OPEN /* 4097 */:
                if (!z) {
                    i2 = 2;
                    break;
                } else {
                    i2 = 1;
                    break;
                }
            case FragmentTransaction.TRANSIT_FRAGMENT_FADE /* 4099 */:
                if (!z) {
                    i2 = 6;
                    break;
                } else {
                    i2 = 5;
                    break;
                }
            case 8194:
                if (!z) {
                    i2 = 4;
                    break;
                } else {
                    i2 = 3;
                    break;
                }
            default:
                i2 = -1;
                break;
        }
        return i2;
    }

    void addBackStackState(BackStackRecord backStackRecord) {
        if (this.mBackStack == null) {
            this.mBackStack = new ArrayList<>();
        }
        this.mBackStack.add(backStackRecord);
        reportBackStackChanged();
    }

    public void addFragment(Fragment fragment, boolean z) {
        if (this.mAdded == null) {
            this.mAdded = new ArrayList<>();
        }
        if (DEBUG) {
            Log.v(TAG, "add: " + fragment);
        }
        makeActive(fragment);
        if (!fragment.mDetached) {
            if (this.mAdded.contains(fragment)) {
                throw new IllegalStateException("Fragment already added: " + fragment);
            }
            this.mAdded.add(fragment);
            fragment.mAdded = true;
            fragment.mRemoving = false;
            if (fragment.mView == null) {
                fragment.mHiddenChanged = false;
            }
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            if (!z) {
                return;
            }
            moveToState(fragment);
        }
    }

    @Override // android.support.v4.app.FragmentManager
    public void addOnBackStackChangedListener(FragmentManager.OnBackStackChangedListener onBackStackChangedListener) {
        if (this.mBackStackChangeListeners == null) {
            this.mBackStackChangeListeners = new ArrayList<>();
        }
        this.mBackStackChangeListeners.add(onBackStackChangedListener);
    }

    public int allocBackStackIndex(BackStackRecord backStackRecord) {
        int i;
        synchronized (this) {
            if (this.mAvailBackStackIndices == null || this.mAvailBackStackIndices.size() <= 0) {
                if (this.mBackStackIndices == null) {
                    this.mBackStackIndices = new ArrayList<>();
                }
                i = this.mBackStackIndices.size();
                if (DEBUG) {
                    Log.v(TAG, "Setting back stack index " + i + " to " + backStackRecord);
                }
                this.mBackStackIndices.add(backStackRecord);
            } else {
                i = this.mAvailBackStackIndices.remove(this.mAvailBackStackIndices.size() - 1).intValue();
                if (DEBUG) {
                    Log.v(TAG, "Adding back stack index " + i + " with " + backStackRecord);
                }
                this.mBackStackIndices.set(i, backStackRecord);
            }
        }
        return i;
    }

    public void attachController(FragmentHostCallback fragmentHostCallback, FragmentContainer fragmentContainer, Fragment fragment) {
        if (this.mHost != null) {
            throw new IllegalStateException("Already attached");
        }
        this.mHost = fragmentHostCallback;
        this.mContainer = fragmentContainer;
        this.mParent = fragment;
    }

    public void attachFragment(Fragment fragment) {
        if (DEBUG) {
            Log.v(TAG, "attach: " + fragment);
        }
        if (fragment.mDetached) {
            fragment.mDetached = false;
            if (fragment.mAdded) {
                return;
            }
            if (this.mAdded == null) {
                this.mAdded = new ArrayList<>();
            }
            if (this.mAdded.contains(fragment)) {
                throw new IllegalStateException("Fragment already added: " + fragment);
            }
            if (DEBUG) {
                Log.v(TAG, "add from attach: " + fragment);
            }
            this.mAdded.add(fragment);
            fragment.mAdded = true;
            if (!fragment.mHasMenu || !fragment.mMenuVisible) {
                return;
            }
            this.mNeedMenuInvalidate = true;
        }
    }

    @Override // android.support.v4.app.FragmentManager
    public FragmentTransaction beginTransaction() {
        return new BackStackRecord(this);
    }

    void completeShowHideFragment(Fragment fragment) {
        if (fragment.mView != null) {
            Animation loadAnimation = loadAnimation(fragment, fragment.getNextTransition(), !fragment.mHidden, fragment.getNextTransitionStyle());
            if (loadAnimation != null) {
                setHWLayerAnimListenerIfAlpha(fragment.mView, loadAnimation);
                fragment.mView.startAnimation(loadAnimation);
                setHWLayerAnimListenerIfAlpha(fragment.mView, loadAnimation);
                loadAnimation.start();
            }
            fragment.mView.setVisibility((!fragment.mHidden || fragment.isHideReplaced()) ? 0 : 8);
            if (fragment.isHideReplaced()) {
                fragment.setHideReplaced(false);
            }
        }
        if (fragment.mAdded && fragment.mHasMenu && fragment.mMenuVisible) {
            this.mNeedMenuInvalidate = true;
        }
        fragment.mHiddenChanged = false;
        fragment.onHiddenChanged(fragment.mHidden);
    }

    public void detachFragment(Fragment fragment) {
        if (DEBUG) {
            Log.v(TAG, "detach: " + fragment);
        }
        if (!fragment.mDetached) {
            fragment.mDetached = true;
            if (!fragment.mAdded) {
                return;
            }
            if (this.mAdded != null) {
                if (DEBUG) {
                    Log.v(TAG, "remove from detach: " + fragment);
                }
                this.mAdded.remove(fragment);
            }
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.mAdded = false;
        }
    }

    public void dispatchActivityCreated() {
        this.mStateSaved = false;
        this.mExecutingActions = true;
        moveToState(2, false);
        this.mExecutingActions = false;
    }

    public void dispatchConfigurationChanged(Configuration configuration) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment fragment = this.mAdded.get(i);
                if (fragment != null) {
                    fragment.performConfigurationChanged(configuration);
                }
            }
        }
    }

    public boolean dispatchContextItemSelected(MenuItem menuItem) {
        boolean z;
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment fragment = this.mAdded.get(i);
                if (fragment != null && fragment.performContextItemSelected(menuItem)) {
                    z = true;
                    break;
                }
            }
        }
        z = false;
        return z;
    }

    public void dispatchCreate() {
        this.mStateSaved = false;
        this.mExecutingActions = true;
        moveToState(1, false);
        this.mExecutingActions = false;
    }

    public boolean dispatchCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        boolean z = false;
        boolean z2 = false;
        ArrayList<Fragment> arrayList = null;
        ArrayList<Fragment> arrayList2 = null;
        if (this.mAdded != null) {
            int i = 0;
            while (true) {
                arrayList = arrayList2;
                z = z2;
                if (i >= this.mAdded.size()) {
                    break;
                }
                Fragment fragment = this.mAdded.get(i);
                ArrayList<Fragment> arrayList3 = arrayList2;
                boolean z3 = z2;
                if (fragment != null) {
                    arrayList3 = arrayList2;
                    z3 = z2;
                    if (fragment.performCreateOptionsMenu(menu, menuInflater)) {
                        z3 = true;
                        arrayList3 = arrayList2;
                        if (arrayList2 == null) {
                            arrayList3 = new ArrayList<>();
                        }
                        arrayList3.add(fragment);
                    }
                }
                i++;
                arrayList2 = arrayList3;
                z2 = z3;
            }
        }
        if (this.mCreatedMenus != null) {
            for (int i2 = 0; i2 < this.mCreatedMenus.size(); i2++) {
                Fragment fragment2 = this.mCreatedMenus.get(i2);
                if (arrayList == null || !arrayList.contains(fragment2)) {
                    fragment2.onDestroyOptionsMenu();
                }
            }
        }
        this.mCreatedMenus = arrayList;
        return z;
    }

    public void dispatchDestroy() {
        this.mDestroyed = true;
        execPendingActions();
        this.mExecutingActions = true;
        moveToState(0, false);
        this.mExecutingActions = false;
        this.mHost = null;
        this.mContainer = null;
        this.mParent = null;
    }

    public void dispatchDestroyView() {
        this.mExecutingActions = true;
        moveToState(1, false);
        this.mExecutingActions = false;
    }

    public void dispatchLowMemory() {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment fragment = this.mAdded.get(i);
                if (fragment != null) {
                    fragment.performLowMemory();
                }
            }
        }
    }

    public void dispatchMultiWindowModeChanged(boolean z) {
        if (this.mAdded == null) {
            return;
        }
        for (int size = this.mAdded.size() - 1; size >= 0; size--) {
            Fragment fragment = this.mAdded.get(size);
            if (fragment != null) {
                fragment.performMultiWindowModeChanged(z);
            }
        }
    }

    void dispatchOnFragmentActivityCreated(Fragment fragment, Bundle bundle, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentActivityCreated(fragment, bundle, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentActivityCreated(this, fragment, bundle);
            }
        }
    }

    void dispatchOnFragmentAttached(Fragment fragment, Context context, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentAttached(fragment, context, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentAttached(this, fragment, context);
            }
        }
    }

    void dispatchOnFragmentCreated(Fragment fragment, Bundle bundle, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentCreated(fragment, bundle, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentCreated(this, fragment, bundle);
            }
        }
    }

    void dispatchOnFragmentDestroyed(Fragment fragment, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentDestroyed(fragment, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentDestroyed(this, fragment);
            }
        }
    }

    void dispatchOnFragmentDetached(Fragment fragment, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentDetached(fragment, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentDetached(this, fragment);
            }
        }
    }

    void dispatchOnFragmentPaused(Fragment fragment, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentPaused(fragment, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentPaused(this, fragment);
            }
        }
    }

    void dispatchOnFragmentPreAttached(Fragment fragment, Context context, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentPreAttached(fragment, context, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentPreAttached(this, fragment, context);
            }
        }
    }

    void dispatchOnFragmentResumed(Fragment fragment, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentResumed(fragment, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentResumed(this, fragment);
            }
        }
    }

    void dispatchOnFragmentSaveInstanceState(Fragment fragment, Bundle bundle, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentSaveInstanceState(fragment, bundle, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentSaveInstanceState(this, fragment, bundle);
            }
        }
    }

    void dispatchOnFragmentStarted(Fragment fragment, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentStarted(fragment, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentStarted(this, fragment);
            }
        }
    }

    void dispatchOnFragmentStopped(Fragment fragment, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentStopped(fragment, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentStopped(this, fragment);
            }
        }
    }

    void dispatchOnFragmentViewCreated(Fragment fragment, View view, Bundle bundle, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentViewCreated(fragment, view, bundle, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentViewCreated(this, fragment, view, bundle);
            }
        }
    }

    void dispatchOnFragmentViewDestroyed(Fragment fragment, boolean z) {
        if (this.mParent != null) {
            FragmentManager fragmentManager = this.mParent.getFragmentManager();
            if (fragmentManager instanceof FragmentManagerImpl) {
                ((FragmentManagerImpl) fragmentManager).dispatchOnFragmentViewDestroyed(fragment, true);
            }
        }
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        Iterator<Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean>> it = this.mLifecycleCallbacks.iterator();
        while (it.hasNext()) {
            Pair<FragmentManager.FragmentLifecycleCallbacks, Boolean> next = it.next();
            if (!z || next.second.booleanValue()) {
                next.first.onFragmentViewDestroyed(this, fragment);
            }
        }
    }

    public boolean dispatchOptionsItemSelected(MenuItem menuItem) {
        boolean z;
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment fragment = this.mAdded.get(i);
                if (fragment != null && fragment.performOptionsItemSelected(menuItem)) {
                    z = true;
                    break;
                }
            }
        }
        z = false;
        return z;
    }

    public void dispatchOptionsMenuClosed(Menu menu) {
        if (this.mAdded != null) {
            for (int i = 0; i < this.mAdded.size(); i++) {
                Fragment fragment = this.mAdded.get(i);
                if (fragment != null) {
                    fragment.performOptionsMenuClosed(menu);
                }
            }
        }
    }

    public void dispatchPause() {
        this.mExecutingActions = true;
        moveToState(4, false);
        this.mExecutingActions = false;
    }

    public void dispatchPictureInPictureModeChanged(boolean z) {
        if (this.mAdded == null) {
            return;
        }
        for (int size = this.mAdded.size() - 1; size >= 0; size--) {
            Fragment fragment = this.mAdded.get(size);
            if (fragment != null) {
                fragment.performPictureInPictureModeChanged(z);
            }
        }
    }

    public boolean dispatchPrepareOptionsMenu(Menu menu) {
        boolean z = false;
        boolean z2 = false;
        if (this.mAdded != null) {
            int i = 0;
            while (true) {
                z = z2;
                if (i >= this.mAdded.size()) {
                    break;
                }
                Fragment fragment = this.mAdded.get(i);
                boolean z3 = z2;
                if (fragment != null) {
                    z3 = z2;
                    if (fragment.performPrepareOptionsMenu(menu)) {
                        z3 = true;
                    }
                }
                i++;
                z2 = z3;
            }
        }
        return z;
    }

    public void dispatchReallyStop() {
        this.mExecutingActions = true;
        moveToState(2, false);
        this.mExecutingActions = false;
    }

    public void dispatchResume() {
        this.mStateSaved = false;
        this.mExecutingActions = true;
        moveToState(5, false);
        this.mExecutingActions = false;
    }

    public void dispatchStart() {
        this.mStateSaved = false;
        this.mExecutingActions = true;
        moveToState(4, false);
        this.mExecutingActions = false;
    }

    public void dispatchStop() {
        this.mStateSaved = true;
        this.mExecutingActions = true;
        moveToState(3, false);
        this.mExecutingActions = false;
    }

    void doPendingDeferredStart() {
        if (this.mHavePendingDeferredStart) {
            boolean z = false;
            int i = 0;
            while (i < this.mActive.size()) {
                Fragment fragment = this.mActive.get(i);
                boolean z2 = z;
                if (fragment != null) {
                    z2 = z;
                    if (fragment.mLoaderManager != null) {
                        z2 = z | fragment.mLoaderManager.hasRunningLoaders();
                    }
                }
                i++;
                z = z2;
            }
            if (z) {
                return;
            }
            this.mHavePendingDeferredStart = false;
            startPendingDeferredFragments();
        }
    }

    @Override // android.support.v4.app.FragmentManager
    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        int size;
        int size2;
        int size3;
        int size4;
        int size5;
        int size6;
        String str2 = str + "    ";
        if (this.mActive != null && (size6 = this.mActive.size()) > 0) {
            printWriter.print(str);
            printWriter.print("Active Fragments in ");
            printWriter.print(Integer.toHexString(System.identityHashCode(this)));
            printWriter.println(":");
            for (int i = 0; i < size6; i++) {
                Fragment fragment = this.mActive.get(i);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i);
                printWriter.print(": ");
                printWriter.println(fragment);
                if (fragment != null) {
                    fragment.dump(str2, fileDescriptor, printWriter, strArr);
                }
            }
        }
        if (this.mAdded != null && (size5 = this.mAdded.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Added Fragments:");
            for (int i2 = 0; i2 < size5; i2++) {
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i2);
                printWriter.print(": ");
                printWriter.println(this.mAdded.get(i2).toString());
            }
        }
        if (this.mCreatedMenus != null && (size4 = this.mCreatedMenus.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Fragments Created Menus:");
            for (int i3 = 0; i3 < size4; i3++) {
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i3);
                printWriter.print(": ");
                printWriter.println(this.mCreatedMenus.get(i3).toString());
            }
        }
        if (this.mBackStack != null && (size3 = this.mBackStack.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Back Stack:");
            for (int i4 = 0; i4 < size3; i4++) {
                BackStackRecord backStackRecord = this.mBackStack.get(i4);
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i4);
                printWriter.print(": ");
                printWriter.println(backStackRecord.toString());
                backStackRecord.dump(str2, fileDescriptor, printWriter, strArr);
            }
        }
        synchronized (this) {
            if (this.mBackStackIndices != null && (size2 = this.mBackStackIndices.size()) > 0) {
                printWriter.print(str);
                printWriter.println("Back Stack Indices:");
                for (int i5 = 0; i5 < size2; i5++) {
                    printWriter.print(str);
                    printWriter.print("  #");
                    printWriter.print(i5);
                    printWriter.print(": ");
                    printWriter.println((BackStackRecord) this.mBackStackIndices.get(i5));
                }
            }
            if (this.mAvailBackStackIndices != null && this.mAvailBackStackIndices.size() > 0) {
                printWriter.print(str);
                printWriter.print("mAvailBackStackIndices: ");
                printWriter.println(Arrays.toString(this.mAvailBackStackIndices.toArray()));
            }
        }
        if (this.mPendingActions != null && (size = this.mPendingActions.size()) > 0) {
            printWriter.print(str);
            printWriter.println("Pending Actions:");
            for (int i6 = 0; i6 < size; i6++) {
                printWriter.print(str);
                printWriter.print("  #");
                printWriter.print(i6);
                printWriter.print(": ");
                printWriter.println((OpGenerator) this.mPendingActions.get(i6));
            }
        }
        printWriter.print(str);
        printWriter.println("FragmentManager misc state:");
        printWriter.print(str);
        printWriter.print("  mHost=");
        printWriter.println(this.mHost);
        printWriter.print(str);
        printWriter.print("  mContainer=");
        printWriter.println(this.mContainer);
        if (this.mParent != null) {
            printWriter.print(str);
            printWriter.print("  mParent=");
            printWriter.println(this.mParent);
        }
        printWriter.print(str);
        printWriter.print("  mCurState=");
        printWriter.print(this.mCurState);
        printWriter.print(" mStateSaved=");
        printWriter.print(this.mStateSaved);
        printWriter.print(" mDestroyed=");
        printWriter.println(this.mDestroyed);
        if (this.mNeedMenuInvalidate) {
            printWriter.print(str);
            printWriter.print("  mNeedMenuInvalidate=");
            printWriter.println(this.mNeedMenuInvalidate);
        }
        if (this.mNoTransactionsBecause != null) {
            printWriter.print(str);
            printWriter.print("  mNoTransactionsBecause=");
            printWriter.println(this.mNoTransactionsBecause);
        }
        if (this.mAvailIndices == null || this.mAvailIndices.size() <= 0) {
            return;
        }
        printWriter.print(str);
        printWriter.print("  mAvailIndices: ");
        printWriter.println(Arrays.toString(this.mAvailIndices.toArray()));
    }

    public void enqueueAction(OpGenerator opGenerator, boolean z) {
        if (!z) {
            checkStateLoss();
        }
        synchronized (this) {
            if (this.mDestroyed || this.mHost == null) {
                throw new IllegalStateException("Activity has been destroyed");
            }
            if (this.mPendingActions == null) {
                this.mPendingActions = new ArrayList<>();
            }
            this.mPendingActions.add(opGenerator);
            scheduleCommit();
        }
    }

    public boolean execPendingActions() {
        ensureExecReady(true);
        boolean z = false;
        while (true) {
            boolean z2 = z;
            if (!generateOpsForPendingActions(this.mTmpRecords, this.mTmpIsPop)) {
                doPendingDeferredStart();
                return z2;
            }
            this.mExecutingActions = true;
            try {
                optimizeAndExecuteOps(this.mTmpRecords, this.mTmpIsPop);
                cleanupExec();
                z = true;
            } catch (Throwable th) {
                cleanupExec();
                throw th;
            }
        }
    }

    public void execSingleAction(OpGenerator opGenerator, boolean z) {
        ensureExecReady(z);
        if (opGenerator.generateOps(this.mTmpRecords, this.mTmpIsPop)) {
            this.mExecutingActions = true;
            try {
                optimizeAndExecuteOps(this.mTmpRecords, this.mTmpIsPop);
            } finally {
                cleanupExec();
            }
        }
        doPendingDeferredStart();
    }

    @Override // android.support.v4.app.FragmentManager
    public boolean executePendingTransactions() {
        boolean execPendingActions = execPendingActions();
        forcePostponedTransactions();
        return execPendingActions;
    }

    @Override // android.support.v4.app.FragmentManager
    public Fragment findFragmentById(int i) {
        Fragment fragment;
        if (this.mAdded != null) {
            for (int size = this.mAdded.size() - 1; size >= 0; size--) {
                fragment = this.mAdded.get(size);
                if (fragment != null && fragment.mFragmentId == i) {
                    break;
                }
            }
        }
        if (this.mActive != null) {
            for (int size2 = this.mActive.size() - 1; size2 >= 0; size2--) {
                Fragment fragment2 = this.mActive.get(size2);
                if (fragment2 != null) {
                    fragment = fragment2;
                    if (fragment2.mFragmentId == i) {
                        break;
                    }
                }
            }
        }
        fragment = null;
        return fragment;
    }

    @Override // android.support.v4.app.FragmentManager
    public Fragment findFragmentByTag(String str) {
        Fragment fragment;
        if (this.mAdded != null && str != null) {
            for (int size = this.mAdded.size() - 1; size >= 0; size--) {
                fragment = this.mAdded.get(size);
                if (fragment != null && str.equals(fragment.mTag)) {
                    break;
                }
            }
        }
        if (this.mActive != null && str != null) {
            for (int size2 = this.mActive.size() - 1; size2 >= 0; size2--) {
                Fragment fragment2 = this.mActive.get(size2);
                if (fragment2 != null) {
                    fragment = fragment2;
                    if (str.equals(fragment2.mTag)) {
                        break;
                    }
                }
            }
        }
        fragment = null;
        return fragment;
    }

    public Fragment findFragmentByWho(String str) {
        Fragment fragment;
        Fragment findFragmentByWho;
        if (this.mActive != null && str != null) {
            for (int size = this.mActive.size() - 1; size >= 0; size--) {
                Fragment fragment2 = this.mActive.get(size);
                if (fragment2 != null && (findFragmentByWho = fragment2.findFragmentByWho(str)) != null) {
                    fragment = findFragmentByWho;
                    break;
                }
            }
        }
        fragment = null;
        return fragment;
    }

    public void freeBackStackIndex(int i) {
        synchronized (this) {
            this.mBackStackIndices.set(i, null);
            if (this.mAvailBackStackIndices == null) {
                this.mAvailBackStackIndices = new ArrayList<>();
            }
            if (DEBUG) {
                Log.v(TAG, "Freeing back stack index " + i);
            }
            this.mAvailBackStackIndices.add(Integer.valueOf(i));
        }
    }

    @Override // android.support.v4.app.FragmentManager
    public FragmentManager.BackStackEntry getBackStackEntryAt(int i) {
        return this.mBackStack.get(i);
    }

    @Override // android.support.v4.app.FragmentManager
    public int getBackStackEntryCount() {
        return this.mBackStack != null ? this.mBackStack.size() : 0;
    }

    @Override // android.support.v4.app.FragmentManager
    public Fragment getFragment(Bundle bundle, String str) {
        Fragment fragment;
        int i = bundle.getInt(str, -1);
        if (i == -1) {
            fragment = null;
        } else {
            if (i >= this.mActive.size()) {
                throwException(new IllegalStateException("Fragment no longer exists for key " + str + ": index " + i));
            }
            Fragment fragment2 = this.mActive.get(i);
            fragment = fragment2;
            if (fragment2 == null) {
                throwException(new IllegalStateException("Fragment no longer exists for key " + str + ": index " + i));
                fragment = fragment2;
            }
        }
        return fragment;
    }

    @Override // android.support.v4.app.FragmentManager
    public List<Fragment> getFragments() {
        return this.mActive;
    }

    LayoutInflaterFactory getLayoutInflaterFactory() {
        return this;
    }

    public void hideFragment(Fragment fragment) {
        boolean z = true;
        if (DEBUG) {
            Log.v(TAG, "hide: " + fragment);
        }
        if (!fragment.mHidden) {
            fragment.mHidden = true;
            if (fragment.mHiddenChanged) {
                z = false;
            }
            fragment.mHiddenChanged = z;
        }
    }

    @Override // android.support.v4.app.FragmentManager
    public boolean isDestroyed() {
        return this.mDestroyed;
    }

    boolean isStateAtLeast(int i) {
        return this.mCurState >= i;
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x002d, code lost:
        if (r7 != null) goto L5;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    Animation loadAnimation(Fragment fragment, int i, boolean z, int i2) {
        Animation makeFadeAnimation;
        Animation onCreateAnimation = fragment.onCreateAnimation(i, z, fragment.getNextAnim());
        if (onCreateAnimation == null) {
            if (fragment.getNextAnim() != 0) {
                makeFadeAnimation = AnimationUtils.loadAnimation(this.mHost.getContext(), fragment.getNextAnim());
            }
            if (i != 0) {
                int transitToStyleIndex = transitToStyleIndex(i, z);
                if (transitToStyleIndex >= 0) {
                    switch (transitToStyleIndex) {
                        case 1:
                            makeFadeAnimation = makeOpenCloseAnimation(this.mHost.getContext(), 1.125f, 1.0f, 0.0f, 1.0f);
                            break;
                        case 2:
                            makeFadeAnimation = makeOpenCloseAnimation(this.mHost.getContext(), 1.0f, 0.975f, 1.0f, 0.0f);
                            break;
                        case 3:
                            makeFadeAnimation = makeOpenCloseAnimation(this.mHost.getContext(), 0.975f, 1.0f, 0.0f, 1.0f);
                            break;
                        case 4:
                            makeFadeAnimation = makeOpenCloseAnimation(this.mHost.getContext(), 1.0f, 1.075f, 1.0f, 0.0f);
                            break;
                        case 5:
                            makeFadeAnimation = makeFadeAnimation(this.mHost.getContext(), 0.0f, 1.0f);
                            break;
                        case 6:
                            makeFadeAnimation = makeFadeAnimation(this.mHost.getContext(), 1.0f, 0.0f);
                            break;
                        default:
                            int i3 = i2;
                            if (i2 == 0) {
                                i3 = i2;
                                if (this.mHost.onHasWindowAnimations()) {
                                    i3 = this.mHost.onGetWindowAnimations();
                                }
                            }
                            if (i3 != 0) {
                                makeFadeAnimation = null;
                                break;
                            } else {
                                makeFadeAnimation = null;
                                break;
                            }
                    }
                } else {
                    makeFadeAnimation = null;
                }
            } else {
                makeFadeAnimation = null;
            }
        } else {
            makeFadeAnimation = onCreateAnimation;
        }
        return makeFadeAnimation;
    }

    void makeActive(Fragment fragment) {
        if (fragment.mIndex >= 0) {
            return;
        }
        if (this.mAvailIndices == null || this.mAvailIndices.size() <= 0) {
            if (this.mActive == null) {
                this.mActive = new ArrayList<>();
            }
            fragment.setIndex(this.mActive.size(), this.mParent);
            this.mActive.add(fragment);
        } else {
            fragment.setIndex(this.mAvailIndices.remove(this.mAvailIndices.size() - 1).intValue(), this.mParent);
            this.mActive.set(fragment.mIndex, fragment);
        }
        if (!DEBUG) {
            return;
        }
        Log.v(TAG, "Allocated fragment index " + fragment);
    }

    void makeInactive(Fragment fragment) {
        if (fragment.mIndex < 0) {
            return;
        }
        if (DEBUG) {
            Log.v(TAG, "Freeing fragment index " + fragment);
        }
        this.mActive.set(fragment.mIndex, null);
        if (this.mAvailIndices == null) {
            this.mAvailIndices = new ArrayList<>();
        }
        this.mAvailIndices.add(Integer.valueOf(fragment.mIndex));
        this.mHost.inactivateFragment(fragment.mWho);
        fragment.initState();
    }

    void moveFragmentToExpectedState(Fragment fragment) {
        if (fragment == null) {
            return;
        }
        int i = this.mCurState;
        int i2 = i;
        if (fragment.mRemoving) {
            i2 = fragment.isInBackStack() ? Math.min(i, 1) : Math.min(i, 0);
        }
        moveToState(fragment, i2, fragment.getNextTransition(), fragment.getNextTransitionStyle(), false);
        if (fragment.mView != null) {
            Fragment findFragmentUnder = findFragmentUnder(fragment);
            if (findFragmentUnder != null) {
                View view = findFragmentUnder.mView;
                ViewGroup viewGroup = fragment.mContainer;
                int indexOfChild = viewGroup.indexOfChild(view);
                int indexOfChild2 = viewGroup.indexOfChild(fragment.mView);
                if (indexOfChild2 < indexOfChild) {
                    viewGroup.removeViewAt(indexOfChild2);
                    viewGroup.addView(fragment.mView, indexOfChild);
                }
            }
            if (fragment.mIsNewlyAdded && fragment.mContainer != null) {
                if (Build.VERSION.SDK_INT < 11) {
                    fragment.mView.setVisibility(0);
                } else if (fragment.mPostponedAlpha > 0.0f) {
                    fragment.mView.setAlpha(fragment.mPostponedAlpha);
                }
                fragment.mPostponedAlpha = 0.0f;
                fragment.mIsNewlyAdded = false;
                Animation loadAnimation = loadAnimation(fragment, fragment.getNextTransition(), true, fragment.getNextTransitionStyle());
                if (loadAnimation != null) {
                    setHWLayerAnimListenerIfAlpha(fragment.mView, loadAnimation);
                    fragment.mView.startAnimation(loadAnimation);
                }
            }
        }
        if (!fragment.mHiddenChanged) {
            return;
        }
        completeShowHideFragment(fragment);
    }

    void moveToState(int i, boolean z) {
        boolean z2;
        if (this.mHost != null || i == 0) {
            if (!z && i == this.mCurState) {
                return;
            }
            this.mCurState = i;
            if (this.mActive == null) {
                return;
            }
            boolean z3 = false;
            boolean z4 = false;
            if (this.mAdded != null) {
                int size = this.mAdded.size();
                int i2 = 0;
                while (true) {
                    z3 = z4;
                    if (i2 >= size) {
                        break;
                    }
                    Fragment fragment = this.mAdded.get(i2);
                    moveFragmentToExpectedState(fragment);
                    boolean z5 = z4;
                    if (fragment.mLoaderManager != null) {
                        z5 = z4 | fragment.mLoaderManager.hasRunningLoaders();
                    }
                    i2++;
                    z4 = z5;
                }
            }
            int size2 = this.mActive.size();
            int i3 = 0;
            while (true) {
                z2 = z3;
                if (i3 >= size2) {
                    break;
                }
                Fragment fragment2 = this.mActive.get(i3);
                z3 = z2;
                if (fragment2 != null) {
                    if (!fragment2.mRemoving) {
                        z3 = z2;
                        if (!fragment2.mDetached) {
                        }
                    }
                    z3 = z2;
                    if (!fragment2.mIsNewlyAdded) {
                        moveFragmentToExpectedState(fragment2);
                        z3 = z2;
                        if (fragment2.mLoaderManager != null) {
                            z3 = z2 | fragment2.mLoaderManager.hasRunningLoaders();
                        }
                    }
                }
                i3++;
            }
            if (!z2) {
                startPendingDeferredFragments();
            }
            if (!this.mNeedMenuInvalidate || this.mHost == null || this.mCurState != 5) {
                return;
            }
            this.mHost.onSupportInvalidateOptionsMenu();
            this.mNeedMenuInvalidate = false;
            return;
        }
        throw new IllegalStateException("No activity");
    }

    void moveToState(Fragment fragment) {
        moveToState(fragment, this.mCurState, 0, 0, false);
    }

    /* JADX WARN: Code restructure failed: missing block: B:5:0x000e, code lost:
        if (r9.mDetached != false) goto L6;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    void moveToState(final Fragment fragment, int i, int i2, int i3, boolean z) {
        int i4;
        int i5;
        String str;
        if (fragment.mAdded) {
            i4 = i;
        }
        i4 = i;
        if (i > 1) {
            i4 = 1;
        }
        int i6 = i4;
        if (fragment.mRemoving) {
            i6 = i4;
            if (i4 > fragment.mState) {
                i6 = fragment.mState;
            }
        }
        int i7 = i6;
        if (fragment.mDeferStart) {
            i7 = i6;
            if (fragment.mState < 4) {
                i7 = i6;
                if (i6 > 3) {
                    i7 = 3;
                }
            }
        }
        if (fragment.mState >= i7) {
            i5 = i7;
            if (fragment.mState > i7) {
                switch (fragment.mState) {
                    case 5:
                        if (i7 < 5) {
                            if (DEBUG) {
                                Log.v(TAG, "movefrom RESUMED: " + fragment);
                            }
                            fragment.performPause();
                            dispatchOnFragmentPaused(fragment, false);
                        }
                    case 4:
                        if (i7 < 4) {
                            if (DEBUG) {
                                Log.v(TAG, "movefrom STARTED: " + fragment);
                            }
                            fragment.performStop();
                            dispatchOnFragmentStopped(fragment, false);
                        }
                    case 3:
                        if (i7 < 3) {
                            if (DEBUG) {
                                Log.v(TAG, "movefrom STOPPED: " + fragment);
                            }
                            fragment.performReallyStop();
                        }
                    case 2:
                        if (i7 < 2) {
                            if (DEBUG) {
                                Log.v(TAG, "movefrom ACTIVITY_CREATED: " + fragment);
                            }
                            if (fragment.mView != null && this.mHost.onShouldSaveFragmentState(fragment) && fragment.mSavedViewState == null) {
                                saveFragmentViewState(fragment);
                            }
                            fragment.performDestroyView();
                            dispatchOnFragmentViewDestroyed(fragment, false);
                            if (fragment.mView != null && fragment.mContainer != null) {
                                Animation animation = null;
                                if (this.mCurState > 0) {
                                    animation = null;
                                    if (!this.mDestroyed) {
                                        animation = null;
                                        if (fragment.mView.getVisibility() == 0) {
                                            animation = null;
                                            if (fragment.mPostponedAlpha >= 0.0f) {
                                                animation = loadAnimation(fragment, i2, false, i3);
                                            }
                                        }
                                    }
                                }
                                fragment.mPostponedAlpha = 0.0f;
                                if (animation != null) {
                                    fragment.setAnimatingAway(fragment.mView);
                                    fragment.setStateAfterAnimating(i7);
                                    animation.setAnimationListener(new AnimateOnHWLayerIfNeededListener(fragment.mView, animation) { // from class: android.support.v4.app.FragmentManagerImpl.2
                                        @Override // android.support.v4.app.FragmentManagerImpl.AnimateOnHWLayerIfNeededListener, android.view.animation.Animation.AnimationListener
                                        public void onAnimationEnd(Animation animation2) {
                                            super.onAnimationEnd(animation2);
                                            if (fragment.getAnimatingAway() != null) {
                                                fragment.setAnimatingAway(null);
                                                FragmentManagerImpl.this.moveToState(fragment, fragment.getStateAfterAnimating(), 0, 0, false);
                                            }
                                        }
                                    });
                                    fragment.mView.startAnimation(animation);
                                }
                                fragment.mContainer.removeView(fragment.mView);
                            }
                            fragment.mContainer = null;
                            fragment.mView = null;
                            fragment.mInnerView = null;
                        }
                        break;
                    case 1:
                        i5 = i7;
                        if (i7 < 1) {
                            if (this.mDestroyed && fragment.getAnimatingAway() != null) {
                                View animatingAway = fragment.getAnimatingAway();
                                fragment.setAnimatingAway(null);
                                animatingAway.clearAnimation();
                            }
                            if (fragment.getAnimatingAway() == null) {
                                if (DEBUG) {
                                    Log.v(TAG, "movefrom CREATED: " + fragment);
                                }
                                if (!fragment.mRetaining) {
                                    fragment.performDestroy();
                                    dispatchOnFragmentDestroyed(fragment, false);
                                } else {
                                    fragment.mState = 0;
                                }
                                fragment.performDetach();
                                dispatchOnFragmentDetached(fragment, false);
                                i5 = i7;
                                if (!z) {
                                    if (fragment.mRetaining) {
                                        fragment.mHost = null;
                                        fragment.mParentFragment = null;
                                        fragment.mFragmentManager = null;
                                        i5 = i7;
                                        break;
                                    } else {
                                        makeInactive(fragment);
                                        i5 = i7;
                                        break;
                                    }
                                }
                            } else {
                                fragment.setStateAfterAnimating(i7);
                                i5 = 1;
                                break;
                            }
                        }
                        break;
                    default:
                        i5 = i7;
                        break;
                }
            }
        } else if (fragment.mFromLayout && !fragment.mInLayout) {
            return;
        } else {
            if (fragment.getAnimatingAway() != null) {
                fragment.setAnimatingAway(null);
                moveToState(fragment, fragment.getStateAfterAnimating(), 0, 0, true);
            }
            int i8 = i7;
            int i9 = i7;
            int i10 = i7;
            int i11 = i7;
            switch (fragment.mState) {
                case 0:
                    if (DEBUG) {
                        Log.v(TAG, "moveto CREATED: " + fragment);
                    }
                    int i12 = i7;
                    if (fragment.mSavedFragmentState != null) {
                        fragment.mSavedFragmentState.setClassLoader(this.mHost.getContext().getClassLoader());
                        fragment.mSavedViewState = fragment.mSavedFragmentState.getSparseParcelableArray(VIEW_STATE_TAG);
                        fragment.mTarget = getFragment(fragment.mSavedFragmentState, TARGET_STATE_TAG);
                        if (fragment.mTarget != null) {
                            fragment.mTargetRequestCode = fragment.mSavedFragmentState.getInt(TARGET_REQUEST_CODE_STATE_TAG, 0);
                        }
                        fragment.mUserVisibleHint = fragment.mSavedFragmentState.getBoolean(USER_VISIBLE_HINT_TAG, true);
                        i12 = i7;
                        if (!fragment.mUserVisibleHint) {
                            fragment.mDeferStart = true;
                            i12 = i7;
                            if (i7 > 3) {
                                i12 = 3;
                            }
                        }
                    }
                    fragment.mHost = this.mHost;
                    fragment.mParentFragment = this.mParent;
                    fragment.mFragmentManager = this.mParent != null ? this.mParent.mChildFragmentManager : this.mHost.getFragmentManagerImpl();
                    dispatchOnFragmentPreAttached(fragment, this.mHost.getContext(), false);
                    fragment.mCalled = false;
                    fragment.onAttach(this.mHost.getContext());
                    if (!fragment.mCalled) {
                        throw new SuperNotCalledException("Fragment " + fragment + " did not call through to super.onAttach()");
                    }
                    if (fragment.mParentFragment == null) {
                        this.mHost.onAttachFragment(fragment);
                    } else {
                        fragment.mParentFragment.onAttachFragment(fragment);
                    }
                    dispatchOnFragmentAttached(fragment, this.mHost.getContext(), false);
                    if (!fragment.mRetaining) {
                        fragment.performCreate(fragment.mSavedFragmentState);
                        dispatchOnFragmentCreated(fragment, fragment.mSavedFragmentState, false);
                    } else {
                        fragment.restoreChildFragmentState(fragment.mSavedFragmentState);
                        fragment.mState = 1;
                    }
                    fragment.mRetaining = false;
                    i8 = i12;
                    if (fragment.mFromLayout) {
                        fragment.mView = fragment.performCreateView(fragment.getLayoutInflater(fragment.mSavedFragmentState), null, fragment.mSavedFragmentState);
                        if (fragment.mView != null) {
                            fragment.mInnerView = fragment.mView;
                            if (Build.VERSION.SDK_INT >= 11) {
                                ViewCompat.setSaveFromParentEnabled(fragment.mView, false);
                            } else {
                                fragment.mView = NoSaveStateFrameLayout.wrap(fragment.mView);
                            }
                            if (fragment.mHidden) {
                                fragment.mView.setVisibility(8);
                            }
                            fragment.onViewCreated(fragment.mView, fragment.mSavedFragmentState);
                            dispatchOnFragmentViewCreated(fragment, fragment.mView, fragment.mSavedFragmentState, false);
                            i8 = i12;
                        } else {
                            fragment.mInnerView = null;
                            i8 = i12;
                        }
                    }
                case 1:
                    i9 = i8;
                    if (i8 > 1) {
                        if (DEBUG) {
                            Log.v(TAG, "moveto ACTIVITY_CREATED: " + fragment);
                        }
                        if (!fragment.mFromLayout) {
                            ViewGroup viewGroup = null;
                            if (fragment.mContainerId != 0) {
                                if (fragment.mContainerId == -1) {
                                    throwException(new IllegalArgumentException("Cannot create fragment " + fragment + " for a container view with no id"));
                                }
                                ViewGroup viewGroup2 = (ViewGroup) this.mContainer.onFindViewById(fragment.mContainerId);
                                viewGroup = viewGroup2;
                                if (viewGroup2 == null) {
                                    viewGroup = viewGroup2;
                                    if (!fragment.mRestored) {
                                        try {
                                            str = fragment.getResources().getResourceName(fragment.mContainerId);
                                        } catch (Resources.NotFoundException e) {
                                            str = EnvironmentCompat.MEDIA_UNKNOWN;
                                        }
                                        throwException(new IllegalArgumentException("No view found for id 0x" + Integer.toHexString(fragment.mContainerId) + " (" + str + ") for fragment " + fragment));
                                        viewGroup = viewGroup2;
                                    }
                                }
                            }
                            fragment.mContainer = viewGroup;
                            fragment.mView = fragment.performCreateView(fragment.getLayoutInflater(fragment.mSavedFragmentState), viewGroup, fragment.mSavedFragmentState);
                            if (fragment.mView != null) {
                                fragment.mInnerView = fragment.mView;
                                if (Build.VERSION.SDK_INT >= 11) {
                                    ViewCompat.setSaveFromParentEnabled(fragment.mView, false);
                                } else {
                                    fragment.mView = NoSaveStateFrameLayout.wrap(fragment.mView);
                                }
                                if (viewGroup != null) {
                                    viewGroup.addView(fragment.mView);
                                }
                                if (fragment.mHidden) {
                                    fragment.mView.setVisibility(8);
                                }
                                fragment.onViewCreated(fragment.mView, fragment.mSavedFragmentState);
                                dispatchOnFragmentViewCreated(fragment, fragment.mView, fragment.mSavedFragmentState, false);
                                fragment.mIsNewlyAdded = fragment.mView.getVisibility() == 0 && fragment.mContainer != null;
                            } else {
                                fragment.mInnerView = null;
                            }
                        }
                        fragment.performActivityCreated(fragment.mSavedFragmentState);
                        dispatchOnFragmentActivityCreated(fragment, fragment.mSavedFragmentState, false);
                        if (fragment.mView != null) {
                            fragment.restoreViewState(fragment.mSavedFragmentState);
                        }
                        fragment.mSavedFragmentState = null;
                        i9 = i8;
                    }
                    break;
                case 2:
                    i10 = i9;
                    if (i9 > 2) {
                        fragment.mState = 3;
                        i10 = i9;
                    }
                case 3:
                    i11 = i10;
                    if (i10 > 3) {
                        if (DEBUG) {
                            Log.v(TAG, "moveto STARTED: " + fragment);
                        }
                        fragment.performStart();
                        dispatchOnFragmentStarted(fragment, false);
                        i11 = i10;
                    }
                case 4:
                    i5 = i11;
                    if (i11 > 4) {
                        if (DEBUG) {
                            Log.v(TAG, "moveto RESUMED: " + fragment);
                        }
                        fragment.performResume();
                        dispatchOnFragmentResumed(fragment, false);
                        fragment.mSavedFragmentState = null;
                        fragment.mSavedViewState = null;
                        i5 = i11;
                        break;
                    }
                    break;
                default:
                    i5 = i7;
                    break;
            }
        }
        if (fragment.mState != i5) {
            Log.w(TAG, "moveToState: Fragment state for " + fragment + " not updated inline; expected state " + i5 + " found " + fragment.mState);
            fragment.mState = i5;
        }
    }

    public void noteStateNotSaved() {
        this.mStateSaved = false;
    }

    @Override // android.support.v4.view.LayoutInflaterFactory
    public View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        View view2;
        Fragment fragment;
        if (!"fragment".equals(str)) {
            view2 = null;
        } else {
            String attributeValue = attributeSet.getAttributeValue(null, "class");
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, FragmentTag.Fragment);
            String str2 = attributeValue;
            if (attributeValue == null) {
                str2 = obtainStyledAttributes.getString(0);
            }
            int resourceId = obtainStyledAttributes.getResourceId(1, -1);
            String string = obtainStyledAttributes.getString(2);
            obtainStyledAttributes.recycle();
            view2 = null;
            if (Fragment.isSupportFragmentClass(this.mHost.getContext(), str2)) {
                int id = view != null ? view.getId() : 0;
                if (id == -1 && resourceId == -1 && string == null) {
                    throw new IllegalArgumentException(attributeSet.getPositionDescription() + ": Must specify unique android:id, android:tag, or have a parent with an id for " + str2);
                }
                Fragment findFragmentById = resourceId != -1 ? findFragmentById(resourceId) : null;
                Fragment fragment2 = findFragmentById;
                if (findFragmentById == null) {
                    fragment2 = findFragmentById;
                    if (string != null) {
                        fragment2 = findFragmentByTag(string);
                    }
                }
                Fragment fragment3 = fragment2;
                if (fragment2 == null) {
                    fragment3 = fragment2;
                    if (id != -1) {
                        fragment3 = findFragmentById(id);
                    }
                }
                if (DEBUG) {
                    Log.v(TAG, "onCreateView: id=0x" + Integer.toHexString(resourceId) + " fname=" + str2 + " existing=" + fragment3);
                }
                if (fragment3 == null) {
                    fragment = Fragment.instantiate(context, str2);
                    fragment.mFromLayout = true;
                    fragment.mFragmentId = resourceId != 0 ? resourceId : id;
                    fragment.mContainerId = id;
                    fragment.mTag = string;
                    fragment.mInLayout = true;
                    fragment.mFragmentManager = this;
                    fragment.mHost = this.mHost;
                    fragment.onInflate(this.mHost.getContext(), attributeSet, fragment.mSavedFragmentState);
                    addFragment(fragment, true);
                } else if (fragment3.mInLayout) {
                    throw new IllegalArgumentException(attributeSet.getPositionDescription() + ": Duplicate id 0x" + Integer.toHexString(resourceId) + ", tag " + string + ", or parent id 0x" + Integer.toHexString(id) + " with another fragment for " + str2);
                } else {
                    fragment3.mInLayout = true;
                    fragment3.mHost = this.mHost;
                    fragment = fragment3;
                    if (!fragment3.mRetaining) {
                        fragment3.onInflate(this.mHost.getContext(), attributeSet, fragment3.mSavedFragmentState);
                        fragment = fragment3;
                    }
                }
                if (this.mCurState >= 1 || !fragment.mFromLayout) {
                    moveToState(fragment);
                } else {
                    moveToState(fragment, 1, 0, 0, false);
                }
                if (fragment.mView == null) {
                    throw new IllegalStateException("Fragment " + str2 + " did not create a view.");
                }
                if (resourceId != 0) {
                    fragment.mView.setId(resourceId);
                }
                if (fragment.mView.getTag() == null) {
                    fragment.mView.setTag(string);
                }
                view2 = fragment.mView;
            }
        }
        return view2;
    }

    public void performPendingDeferredStart(Fragment fragment) {
        if (fragment.mDeferStart) {
            if (this.mExecutingActions) {
                this.mHavePendingDeferredStart = true;
                return;
            }
            fragment.mDeferStart = false;
            moveToState(fragment, this.mCurState, 0, 0, false);
        }
    }

    @Override // android.support.v4.app.FragmentManager
    public void popBackStack() {
        enqueueAction(new PopBackStackState(null, -1, 0), false);
    }

    @Override // android.support.v4.app.FragmentManager
    public void popBackStack(int i, int i2) {
        if (i < 0) {
            throw new IllegalArgumentException("Bad id: " + i);
        }
        enqueueAction(new PopBackStackState(null, i, i2), false);
    }

    @Override // android.support.v4.app.FragmentManager
    public void popBackStack(String str, int i) {
        enqueueAction(new PopBackStackState(str, -1, i), false);
    }

    @Override // android.support.v4.app.FragmentManager
    public boolean popBackStackImmediate() {
        checkStateLoss();
        return popBackStackImmediate(null, -1, 0);
    }

    @Override // android.support.v4.app.FragmentManager
    public boolean popBackStackImmediate(int i, int i2) {
        checkStateLoss();
        execPendingActions();
        if (i < 0) {
            throw new IllegalArgumentException("Bad id: " + i);
        }
        return popBackStackImmediate(null, i, i2);
    }

    @Override // android.support.v4.app.FragmentManager
    public boolean popBackStackImmediate(String str, int i) {
        checkStateLoss();
        return popBackStackImmediate(str, -1, i);
    }

    boolean popBackStackState(ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2, String str, int i, int i2) {
        boolean z;
        if (this.mBackStack == null) {
            z = false;
        } else if (str == null && i < 0 && (i2 & 1) == 0) {
            int size = this.mBackStack.size() - 1;
            z = false;
            if (size >= 0) {
                arrayList.add(this.mBackStack.remove(size));
                arrayList2.add(true);
                z = true;
            }
        } else {
            int i3 = -1;
            if (str != null || i >= 0) {
                int size2 = this.mBackStack.size() - 1;
                while (size2 >= 0) {
                    BackStackRecord backStackRecord = this.mBackStack.get(size2);
                    if ((str != null && str.equals(backStackRecord.getName())) || (i >= 0 && i == backStackRecord.mIndex)) {
                        break;
                    }
                    size2--;
                }
                z = false;
                if (size2 >= 0) {
                    i3 = size2;
                    if ((i2 & 1) != 0) {
                        int i4 = size2 - 1;
                        while (true) {
                            i3 = i4;
                            if (i4 < 0) {
                                break;
                            }
                            BackStackRecord backStackRecord2 = this.mBackStack.get(i4);
                            if (str == null || !str.equals(backStackRecord2.getName())) {
                                i3 = i4;
                                if (i < 0) {
                                    break;
                                }
                                i3 = i4;
                                if (i != backStackRecord2.mIndex) {
                                    break;
                                }
                            }
                            i4--;
                        }
                    }
                }
            }
            z = false;
            if (i3 != this.mBackStack.size() - 1) {
                for (int size3 = this.mBackStack.size() - 1; size3 > i3; size3--) {
                    arrayList.add(this.mBackStack.remove(size3));
                    arrayList2.add(true);
                }
                z = true;
            }
        }
        return z;
    }

    @Override // android.support.v4.app.FragmentManager
    public void putFragment(Bundle bundle, String str, Fragment fragment) {
        if (fragment.mIndex < 0) {
            throwException(new IllegalStateException("Fragment " + fragment + " is not currently in the FragmentManager"));
        }
        bundle.putInt(str, fragment.mIndex);
    }

    @Override // android.support.v4.app.FragmentManager
    public void registerFragmentLifecycleCallbacks(FragmentManager.FragmentLifecycleCallbacks fragmentLifecycleCallbacks, boolean z) {
        if (this.mLifecycleCallbacks == null) {
            this.mLifecycleCallbacks = new CopyOnWriteArrayList<>();
        }
        this.mLifecycleCallbacks.add(new Pair<>(fragmentLifecycleCallbacks, Boolean.valueOf(z)));
    }

    public void removeFragment(Fragment fragment) {
        if (DEBUG) {
            Log.v(TAG, "remove: " + fragment + " nesting=" + fragment.mBackStackNesting);
        }
        boolean z = !fragment.isInBackStack();
        if (!fragment.mDetached || z) {
            if (this.mAdded != null) {
                this.mAdded.remove(fragment);
            }
            if (fragment.mHasMenu && fragment.mMenuVisible) {
                this.mNeedMenuInvalidate = true;
            }
            fragment.mAdded = false;
            fragment.mRemoving = true;
        }
    }

    @Override // android.support.v4.app.FragmentManager
    public void removeOnBackStackChangedListener(FragmentManager.OnBackStackChangedListener onBackStackChangedListener) {
        if (this.mBackStackChangeListeners != null) {
            this.mBackStackChangeListeners.remove(onBackStackChangedListener);
        }
    }

    void reportBackStackChanged() {
        if (this.mBackStackChangeListeners != null) {
            for (int i = 0; i < this.mBackStackChangeListeners.size(); i++) {
                this.mBackStackChangeListeners.get(i).onBackStackChanged();
            }
        }
    }

    void restoreAllState(Parcelable parcelable, FragmentManagerNonConfig fragmentManagerNonConfig) {
        if (parcelable == null) {
            return;
        }
        FragmentManagerState fragmentManagerState = (FragmentManagerState) parcelable;
        if (fragmentManagerState.mActive == null) {
            return;
        }
        List<FragmentManagerNonConfig> list = null;
        if (fragmentManagerNonConfig != null) {
            List<Fragment> fragments = fragmentManagerNonConfig.getFragments();
            List<FragmentManagerNonConfig> childNonConfigs = fragmentManagerNonConfig.getChildNonConfigs();
            int size = fragments != null ? fragments.size() : 0;
            int i = 0;
            while (true) {
                list = childNonConfigs;
                if (i >= size) {
                    break;
                }
                Fragment fragment = fragments.get(i);
                if (DEBUG) {
                    Log.v(TAG, "restoreAllState: re-attaching retained " + fragment);
                }
                FragmentState fragmentState = fragmentManagerState.mActive[fragment.mIndex];
                fragmentState.mInstance = fragment;
                fragment.mSavedViewState = null;
                fragment.mBackStackNesting = 0;
                fragment.mInLayout = false;
                fragment.mAdded = false;
                fragment.mTarget = null;
                if (fragmentState.mSavedFragmentState != null) {
                    fragmentState.mSavedFragmentState.setClassLoader(this.mHost.getContext().getClassLoader());
                    fragment.mSavedViewState = fragmentState.mSavedFragmentState.getSparseParcelableArray(VIEW_STATE_TAG);
                    fragment.mSavedFragmentState = fragmentState.mSavedFragmentState;
                }
                i++;
            }
        }
        this.mActive = new ArrayList<>(fragmentManagerState.mActive.length);
        if (this.mAvailIndices != null) {
            this.mAvailIndices.clear();
        }
        for (int i2 = 0; i2 < fragmentManagerState.mActive.length; i2++) {
            FragmentState fragmentState2 = fragmentManagerState.mActive[i2];
            if (fragmentState2 != null) {
                FragmentManagerNonConfig fragmentManagerNonConfig2 = null;
                if (list != null) {
                    fragmentManagerNonConfig2 = null;
                    if (i2 < list.size()) {
                        fragmentManagerNonConfig2 = list.get(i2);
                    }
                }
                Fragment instantiate = fragmentState2.instantiate(this.mHost, this.mParent, fragmentManagerNonConfig2);
                if (DEBUG) {
                    Log.v(TAG, "restoreAllState: active #" + i2 + ": " + instantiate);
                }
                this.mActive.add(instantiate);
                fragmentState2.mInstance = null;
            } else {
                this.mActive.add(null);
                if (this.mAvailIndices == null) {
                    this.mAvailIndices = new ArrayList<>();
                }
                if (DEBUG) {
                    Log.v(TAG, "restoreAllState: avail #" + i2);
                }
                this.mAvailIndices.add(Integer.valueOf(i2));
            }
        }
        if (fragmentManagerNonConfig != null) {
            List<Fragment> fragments2 = fragmentManagerNonConfig.getFragments();
            int size2 = fragments2 != null ? fragments2.size() : 0;
            for (int i3 = 0; i3 < size2; i3++) {
                Fragment fragment2 = fragments2.get(i3);
                if (fragment2.mTargetIndex >= 0) {
                    if (fragment2.mTargetIndex < this.mActive.size()) {
                        fragment2.mTarget = this.mActive.get(fragment2.mTargetIndex);
                    } else {
                        Log.w(TAG, "Re-attaching retained fragment " + fragment2 + " target no longer exists: " + fragment2.mTargetIndex);
                        fragment2.mTarget = null;
                    }
                }
            }
        }
        if (fragmentManagerState.mAdded != null) {
            this.mAdded = new ArrayList<>(fragmentManagerState.mAdded.length);
            for (int i4 = 0; i4 < fragmentManagerState.mAdded.length; i4++) {
                Fragment fragment3 = this.mActive.get(fragmentManagerState.mAdded[i4]);
                if (fragment3 == null) {
                    throwException(new IllegalStateException("No instantiated fragment for index #" + fragmentManagerState.mAdded[i4]));
                }
                fragment3.mAdded = true;
                if (DEBUG) {
                    Log.v(TAG, "restoreAllState: added #" + i4 + ": " + fragment3);
                }
                if (this.mAdded.contains(fragment3)) {
                    throw new IllegalStateException("Already added!");
                }
                this.mAdded.add(fragment3);
            }
        } else {
            this.mAdded = null;
        }
        if (fragmentManagerState.mBackStack == null) {
            this.mBackStack = null;
            return;
        }
        this.mBackStack = new ArrayList<>(fragmentManagerState.mBackStack.length);
        for (int i5 = 0; i5 < fragmentManagerState.mBackStack.length; i5++) {
            BackStackRecord instantiate2 = fragmentManagerState.mBackStack[i5].instantiate(this);
            if (DEBUG) {
                Log.v(TAG, "restoreAllState: back stack #" + i5 + " (index " + instantiate2.mIndex + "): " + instantiate2);
                PrintWriter printWriter = new PrintWriter(new LogWriter(TAG));
                instantiate2.dump("  ", printWriter, false);
                printWriter.close();
            }
            this.mBackStack.add(instantiate2);
            if (instantiate2.mIndex >= 0) {
                setBackStackIndex(instantiate2.mIndex, instantiate2);
            }
        }
    }

    FragmentManagerNonConfig retainNonConfig() {
        ArrayList arrayList = null;
        ArrayList arrayList2 = null;
        ArrayList arrayList3 = null;
        ArrayList arrayList4 = null;
        if (this.mActive != null) {
            int i = 0;
            while (true) {
                arrayList3 = arrayList4;
                arrayList = arrayList2;
                if (i >= this.mActive.size()) {
                    break;
                }
                Fragment fragment = this.mActive.get(i);
                ArrayList arrayList5 = arrayList4;
                ArrayList arrayList6 = arrayList2;
                if (fragment != null) {
                    ArrayList arrayList7 = arrayList2;
                    if (fragment.mRetainInstance) {
                        ArrayList arrayList8 = arrayList2;
                        if (arrayList2 == null) {
                            arrayList8 = new ArrayList();
                        }
                        arrayList8.add(fragment);
                        fragment.mRetaining = true;
                        fragment.mTargetIndex = fragment.mTarget != null ? fragment.mTarget.mIndex : -1;
                        arrayList7 = arrayList8;
                        if (DEBUG) {
                            Log.v(TAG, "retainNonConfig: keeping retained " + fragment);
                            arrayList7 = arrayList8;
                        }
                    }
                    boolean z = false;
                    ArrayList arrayList9 = arrayList4;
                    if (fragment.mChildFragmentManager != null) {
                        FragmentManagerNonConfig retainNonConfig = fragment.mChildFragmentManager.retainNonConfig();
                        z = false;
                        arrayList9 = arrayList4;
                        if (retainNonConfig != null) {
                            arrayList9 = arrayList4;
                            if (arrayList4 == null) {
                                ArrayList arrayList10 = new ArrayList();
                                int i2 = 0;
                                while (true) {
                                    arrayList9 = arrayList10;
                                    if (i2 >= i) {
                                        break;
                                    }
                                    arrayList10.add(null);
                                    i2++;
                                }
                            }
                            arrayList9.add(retainNonConfig);
                            z = true;
                        }
                    }
                    arrayList5 = arrayList9;
                    arrayList6 = arrayList7;
                    if (arrayList9 != null) {
                        arrayList5 = arrayList9;
                        arrayList6 = arrayList7;
                        if (!z) {
                            arrayList9.add(null);
                            arrayList6 = arrayList7;
                            arrayList5 = arrayList9;
                        }
                    }
                }
                i++;
                arrayList4 = arrayList5;
                arrayList2 = arrayList6;
            }
        }
        return (arrayList == null && arrayList3 == null) ? null : new FragmentManagerNonConfig(arrayList, arrayList3);
    }

    Parcelable saveAllState() {
        forcePostponedTransactions();
        endAnimatingAwayFragments();
        execPendingActions();
        if (HONEYCOMB) {
            this.mStateSaved = true;
        }
        FragmentManagerState fragmentManagerState = null;
        if (this.mActive != null) {
            if (this.mActive.size() <= 0) {
                fragmentManagerState = null;
            } else {
                int size = this.mActive.size();
                FragmentState[] fragmentStateArr = new FragmentState[size];
                boolean z = false;
                for (int i = 0; i < size; i++) {
                    Fragment fragment = this.mActive.get(i);
                    if (fragment != null) {
                        if (fragment.mIndex < 0) {
                            throwException(new IllegalStateException("Failure saving state: active " + fragment + " has cleared index: " + fragment.mIndex));
                        }
                        FragmentState fragmentState = new FragmentState(fragment);
                        fragmentStateArr[i] = fragmentState;
                        if (fragment.mState <= 0 || fragmentState.mSavedFragmentState != null) {
                            fragmentState.mSavedFragmentState = fragment.mSavedFragmentState;
                        } else {
                            fragmentState.mSavedFragmentState = saveFragmentBasicState(fragment);
                            if (fragment.mTarget != null) {
                                if (fragment.mTarget.mIndex < 0) {
                                    throwException(new IllegalStateException("Failure saving state: " + fragment + " has target not in fragment manager: " + fragment.mTarget));
                                }
                                if (fragmentState.mSavedFragmentState == null) {
                                    fragmentState.mSavedFragmentState = new Bundle();
                                }
                                putFragment(fragmentState.mSavedFragmentState, TARGET_STATE_TAG, fragment.mTarget);
                                if (fragment.mTargetRequestCode != 0) {
                                    fragmentState.mSavedFragmentState.putInt(TARGET_REQUEST_CODE_STATE_TAG, fragment.mTargetRequestCode);
                                }
                            }
                        }
                        z = true;
                        if (DEBUG) {
                            Log.v(TAG, "Saved state of " + fragment + ": " + fragmentState.mSavedFragmentState);
                            z = true;
                        }
                    }
                }
                if (!z) {
                    fragmentManagerState = null;
                    if (DEBUG) {
                        Log.v(TAG, "saveAllState: no fragments!");
                        fragmentManagerState = null;
                    }
                } else {
                    int[] iArr = null;
                    if (this.mAdded != null) {
                        int size2 = this.mAdded.size();
                        iArr = null;
                        if (size2 > 0) {
                            int[] iArr2 = new int[size2];
                            int i2 = 0;
                            while (true) {
                                iArr = iArr2;
                                if (i2 >= size2) {
                                    break;
                                }
                                iArr2[i2] = this.mAdded.get(i2).mIndex;
                                if (iArr2[i2] < 0) {
                                    throwException(new IllegalStateException("Failure saving state: active " + this.mAdded.get(i2) + " has cleared index: " + iArr2[i2]));
                                }
                                if (DEBUG) {
                                    Log.v(TAG, "saveAllState: adding fragment #" + i2 + ": " + this.mAdded.get(i2));
                                }
                                i2++;
                            }
                        }
                    }
                    BackStackState[] backStackStateArr = null;
                    if (this.mBackStack != null) {
                        int size3 = this.mBackStack.size();
                        backStackStateArr = null;
                        if (size3 > 0) {
                            BackStackState[] backStackStateArr2 = new BackStackState[size3];
                            int i3 = 0;
                            while (true) {
                                backStackStateArr = backStackStateArr2;
                                if (i3 >= size3) {
                                    break;
                                }
                                backStackStateArr2[i3] = new BackStackState(this.mBackStack.get(i3));
                                if (DEBUG) {
                                    Log.v(TAG, "saveAllState: adding back stack #" + i3 + ": " + this.mBackStack.get(i3));
                                }
                                i3++;
                            }
                        }
                    }
                    FragmentManagerState fragmentManagerState2 = new FragmentManagerState();
                    fragmentManagerState2.mActive = fragmentStateArr;
                    fragmentManagerState2.mAdded = iArr;
                    fragmentManagerState2.mBackStack = backStackStateArr;
                    fragmentManagerState = fragmentManagerState2;
                }
            }
        }
        return fragmentManagerState;
    }

    Bundle saveFragmentBasicState(Fragment fragment) {
        Bundle bundle = null;
        if (this.mStateBundle == null) {
            this.mStateBundle = new Bundle();
        }
        fragment.performSaveInstanceState(this.mStateBundle);
        dispatchOnFragmentSaveInstanceState(fragment, this.mStateBundle, false);
        if (!this.mStateBundle.isEmpty()) {
            bundle = this.mStateBundle;
            this.mStateBundle = null;
        }
        if (fragment.mView != null) {
            saveFragmentViewState(fragment);
        }
        Bundle bundle2 = bundle;
        if (fragment.mSavedViewState != null) {
            bundle2 = bundle;
            if (bundle == null) {
                bundle2 = new Bundle();
            }
            bundle2.putSparseParcelableArray(VIEW_STATE_TAG, fragment.mSavedViewState);
        }
        Bundle bundle3 = bundle2;
        if (!fragment.mUserVisibleHint) {
            bundle3 = bundle2;
            if (bundle2 == null) {
                bundle3 = new Bundle();
            }
            bundle3.putBoolean(USER_VISIBLE_HINT_TAG, fragment.mUserVisibleHint);
        }
        return bundle3;
    }

    @Override // android.support.v4.app.FragmentManager
    public Fragment.SavedState saveFragmentInstanceState(Fragment fragment) {
        if (fragment.mIndex < 0) {
            throwException(new IllegalStateException("Fragment " + fragment + " is not currently in the FragmentManager"));
        }
        Fragment.SavedState savedState = null;
        if (fragment.mState > 0) {
            Bundle saveFragmentBasicState = saveFragmentBasicState(fragment);
            savedState = null;
            if (saveFragmentBasicState != null) {
                savedState = new Fragment.SavedState(saveFragmentBasicState);
            }
        }
        return savedState;
    }

    void saveFragmentViewState(Fragment fragment) {
        if (fragment.mInnerView == null) {
            return;
        }
        if (this.mStateArray == null) {
            this.mStateArray = new SparseArray<>();
        } else {
            this.mStateArray.clear();
        }
        fragment.mInnerView.saveHierarchyState(this.mStateArray);
        if (this.mStateArray.size() <= 0) {
            return;
        }
        fragment.mSavedViewState = this.mStateArray;
        this.mStateArray = null;
    }

    public void setBackStackIndex(int i, BackStackRecord backStackRecord) {
        synchronized (this) {
            if (this.mBackStackIndices == null) {
                this.mBackStackIndices = new ArrayList<>();
            }
            int size = this.mBackStackIndices.size();
            if (i < size) {
                if (DEBUG) {
                    Log.v(TAG, "Setting back stack index " + i + " to " + backStackRecord);
                }
                this.mBackStackIndices.set(i, backStackRecord);
            } else {
                for (int i2 = size; i2 < i; i2++) {
                    this.mBackStackIndices.add(null);
                    if (this.mAvailBackStackIndices == null) {
                        this.mAvailBackStackIndices = new ArrayList<>();
                    }
                    if (DEBUG) {
                        Log.v(TAG, "Adding available back stack index " + i2);
                    }
                    this.mAvailBackStackIndices.add(Integer.valueOf(i2));
                }
                if (DEBUG) {
                    Log.v(TAG, "Adding back stack index " + i + " with " + backStackRecord);
                }
                this.mBackStackIndices.add(backStackRecord);
            }
        }
    }

    public void showFragment(Fragment fragment) {
        boolean z = false;
        if (DEBUG) {
            Log.v(TAG, "show: " + fragment);
        }
        if (fragment.mHidden) {
            fragment.mHidden = false;
            if (!fragment.mHiddenChanged) {
                z = true;
            }
            fragment.mHiddenChanged = z;
        }
    }

    void startPendingDeferredFragments() {
        if (this.mActive == null) {
            return;
        }
        for (int i = 0; i < this.mActive.size(); i++) {
            Fragment fragment = this.mActive.get(i);
            if (fragment != null) {
                performPendingDeferredStart(fragment);
            }
        }
    }

    public String toString() {
        StringBuilder sb = new StringBuilder(128);
        sb.append("FragmentManager{");
        sb.append(Integer.toHexString(System.identityHashCode(this)));
        sb.append(" in ");
        if (this.mParent != null) {
            DebugUtils.buildShortClassTag(this.mParent, sb);
        } else {
            DebugUtils.buildShortClassTag(this.mHost, sb);
        }
        sb.append("}}");
        return sb.toString();
    }

    @Override // android.support.v4.app.FragmentManager
    public void unregisterFragmentLifecycleCallbacks(FragmentManager.FragmentLifecycleCallbacks fragmentLifecycleCallbacks) {
        if (this.mLifecycleCallbacks == null) {
            return;
        }
        synchronized (this.mLifecycleCallbacks) {
            int i = 0;
            int size = this.mLifecycleCallbacks.size();
            while (true) {
                if (i >= size) {
                    break;
                } else if (this.mLifecycleCallbacks.get(i).first == fragmentLifecycleCallbacks) {
                    this.mLifecycleCallbacks.remove(i);
                    break;
                } else {
                    i++;
                }
            }
        }
    }
}
