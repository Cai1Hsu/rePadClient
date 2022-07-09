package android.support.v4.app;

import android.graphics.Rect;
import android.os.Build;
import android.support.v4.app.BackStackRecord;
import android.support.v4.util.ArrayMap;
import android.support.v4.view.ViewCompat;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import java.util.ArrayList;
import java.util.Collection;

/* loaded from: classes.jar:android/support/v4/app/FragmentTransition.class */
class FragmentTransition {
    private static final int[] INVERSE_OPS = {0, 3, 0, 1, 5, 4, 7, 6};

    /* loaded from: classes.jar:android/support/v4/app/FragmentTransition$FragmentContainerTransition.class */
    static class FragmentContainerTransition {
        public Fragment firstOut;
        public boolean firstOutIsPop;
        public BackStackRecord firstOutTransaction;
        public Fragment lastIn;
        public boolean lastInIsPop;
        public BackStackRecord lastInTransaction;

        FragmentContainerTransition() {
        }
    }

    FragmentTransition() {
    }

    private static void addSharedElementsWithMatchingNames(ArrayList<View> arrayList, ArrayMap<String, View> arrayMap, Collection<String> collection) {
        for (int size = arrayMap.size() - 1; size >= 0; size--) {
            View valueAt = arrayMap.valueAt(size);
            if (collection.contains(ViewCompat.getTransitionName(valueAt))) {
                arrayList.add(valueAt);
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x0104, code lost:
        if (r8.firstOut == null) goto L36;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private static void addToFirstInLastOut(BackStackRecord backStackRecord, BackStackRecord.Op op, SparseArray<FragmentContainerTransition> sparseArray, boolean z, boolean z2) {
        Fragment fragment = op.fragment;
        int i = fragment.mContainerId;
        if (i == 0) {
            return;
        }
        boolean z3 = false;
        boolean z4 = false;
        boolean z5 = false;
        boolean z6 = false;
        switch (z ? INVERSE_OPS[op.cmd] : op.cmd) {
            case 1:
            case 7:
                z4 = z2 ? fragment.mIsNewlyAdded : !fragment.mAdded && !fragment.mHidden;
                z5 = true;
                z3 = false;
                z6 = false;
                break;
            case 2:
                break;
            case 3:
            case 6:
                z3 = z2 ? !fragment.mAdded && fragment.mView != null && fragment.mView.getVisibility() == 0 && fragment.mPostponedAlpha >= 0.0f : fragment.mAdded && !fragment.mHidden;
                z6 = true;
                z4 = false;
                z5 = false;
                break;
            case 4:
                z3 = z2 ? fragment.mHiddenChanged && fragment.mAdded && fragment.mHidden : fragment.mAdded && !fragment.mHidden;
                z6 = true;
                z4 = false;
                z5 = false;
                break;
            case 5:
                z4 = z2 ? fragment.mHiddenChanged && !fragment.mHidden && fragment.mAdded : fragment.mHidden;
                z5 = true;
                z3 = false;
                z6 = false;
                break;
            default:
                z6 = false;
                z5 = false;
                z4 = false;
                z3 = false;
                break;
        }
        FragmentContainerTransition fragmentContainerTransition = sparseArray.get(i);
        FragmentContainerTransition fragmentContainerTransition2 = fragmentContainerTransition;
        if (z4) {
            fragmentContainerTransition2 = ensureContainer(fragmentContainerTransition, sparseArray, i);
            fragmentContainerTransition2.lastIn = fragment;
            fragmentContainerTransition2.lastInIsPop = z;
            fragmentContainerTransition2.lastInTransaction = backStackRecord;
        }
        if (!z2 && z5) {
            if (fragmentContainerTransition2 != null && fragmentContainerTransition2.firstOut == fragment) {
                fragmentContainerTransition2.firstOut = null;
            }
            FragmentManagerImpl fragmentManagerImpl = backStackRecord.mManager;
            if (fragment.mState < 1 && fragmentManagerImpl.mCurState >= 1 && !backStackRecord.mAllowOptimization) {
                fragmentManagerImpl.makeActive(fragment);
                fragmentManagerImpl.moveToState(fragment, 1, 0, 0, false);
            }
        }
        FragmentContainerTransition fragmentContainerTransition3 = fragmentContainerTransition2;
        if (z3) {
            if (fragmentContainerTransition2 != null) {
                fragmentContainerTransition3 = fragmentContainerTransition2;
            }
            fragmentContainerTransition3 = ensureContainer(fragmentContainerTransition2, sparseArray, i);
            fragmentContainerTransition3.firstOut = fragment;
            fragmentContainerTransition3.firstOutIsPop = z;
            fragmentContainerTransition3.firstOutTransaction = backStackRecord;
        }
        if (z2 || !z6 || fragmentContainerTransition3 == null || fragmentContainerTransition3.lastIn != fragment) {
            return;
        }
        fragmentContainerTransition3.lastIn = null;
    }

    public static void calculateFragments(BackStackRecord backStackRecord, SparseArray<FragmentContainerTransition> sparseArray, boolean z) {
        int size = backStackRecord.mOps.size();
        for (int i = 0; i < size; i++) {
            addToFirstInLastOut(backStackRecord, backStackRecord.mOps.get(i), sparseArray, false, z);
        }
    }

    private static ArrayMap<String, String> calculateNameOverrides(int i, ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2, int i2, int i3) {
        ArrayList<String> arrayList3;
        ArrayList<String> arrayList4;
        ArrayMap<String, String> arrayMap = new ArrayMap<>();
        while (true) {
            i3--;
            if (i3 >= i2) {
                BackStackRecord backStackRecord = arrayList.get(i3);
                if (backStackRecord.interactsWith(i)) {
                    boolean booleanValue = arrayList2.get(i3).booleanValue();
                    if (backStackRecord.mSharedElementSourceNames != null) {
                        int size = backStackRecord.mSharedElementSourceNames.size();
                        if (booleanValue) {
                            arrayList4 = backStackRecord.mSharedElementSourceNames;
                            arrayList3 = backStackRecord.mSharedElementTargetNames;
                        } else {
                            arrayList3 = backStackRecord.mSharedElementSourceNames;
                            arrayList4 = backStackRecord.mSharedElementTargetNames;
                        }
                        for (int i4 = 0; i4 < size; i4++) {
                            String str = arrayList3.get(i4);
                            String str2 = arrayList4.get(i4);
                            String remove = arrayMap.remove(str2);
                            if (remove != null) {
                                arrayMap.put(str, remove);
                            } else {
                                arrayMap.put(str, str2);
                            }
                        }
                    }
                }
            } else {
                return arrayMap;
            }
        }
    }

    public static void calculatePopFragments(BackStackRecord backStackRecord, SparseArray<FragmentContainerTransition> sparseArray, boolean z) {
        if (!backStackRecord.mManager.mContainer.onHasView()) {
            return;
        }
        for (int size = backStackRecord.mOps.size() - 1; size >= 0; size--) {
            addToFirstInLastOut(backStackRecord, backStackRecord.mOps.get(size), sparseArray, true, z);
        }
    }

    public static void callSharedElementStartEnd(Fragment fragment, Fragment fragment2, boolean z, ArrayMap<String, View> arrayMap, boolean z2) {
        SharedElementCallback enterTransitionCallback = z ? fragment2.getEnterTransitionCallback() : fragment.getEnterTransitionCallback();
        if (enterTransitionCallback != null) {
            ArrayList arrayList = new ArrayList();
            ArrayList arrayList2 = new ArrayList();
            int size = arrayMap == null ? 0 : arrayMap.size();
            for (int i = 0; i < size; i++) {
                arrayList2.add(arrayMap.keyAt(i));
                arrayList.add(arrayMap.valueAt(i));
            }
            if (z2) {
                enterTransitionCallback.onSharedElementStart(arrayList2, arrayList, null);
            } else {
                enterTransitionCallback.onSharedElementEnd(arrayList2, arrayList, null);
            }
        }
    }

    public static ArrayMap<String, View> captureInSharedElements(ArrayMap<String, String> arrayMap, Object obj, FragmentContainerTransition fragmentContainerTransition) {
        ArrayMap<String, View> arrayMap2;
        SharedElementCallback enterTransitionCallback;
        ArrayList<String> arrayList;
        String findKeyForValue;
        Fragment fragment = fragmentContainerTransition.lastIn;
        View view = fragment.getView();
        if (arrayMap.isEmpty() || obj == null || view == null) {
            arrayMap.clear();
            arrayMap2 = null;
        } else {
            ArrayMap<String, View> arrayMap3 = new ArrayMap<>();
            FragmentTransitionCompat21.findNamedViews(arrayMap3, view);
            BackStackRecord backStackRecord = fragmentContainerTransition.lastInTransaction;
            if (fragmentContainerTransition.lastInIsPop) {
                enterTransitionCallback = fragment.getExitTransitionCallback();
                arrayList = backStackRecord.mSharedElementSourceNames;
            } else {
                enterTransitionCallback = fragment.getEnterTransitionCallback();
                arrayList = backStackRecord.mSharedElementTargetNames;
            }
            if (arrayList != null) {
                arrayMap3.retainAll(arrayList);
            }
            if (enterTransitionCallback != null) {
                enterTransitionCallback.onMapSharedElements(arrayList, arrayMap3);
                int size = arrayList.size() - 1;
                while (true) {
                    arrayMap2 = arrayMap3;
                    if (size < 0) {
                        break;
                    }
                    String str = arrayList.get(size);
                    View view2 = arrayMap3.get(str);
                    if (view2 == null) {
                        String findKeyForValue2 = findKeyForValue(arrayMap, str);
                        if (findKeyForValue2 != null) {
                            arrayMap.remove(findKeyForValue2);
                        }
                    } else if (!str.equals(ViewCompat.getTransitionName(view2)) && (findKeyForValue = findKeyForValue(arrayMap, str)) != null) {
                        arrayMap.put(findKeyForValue, ViewCompat.getTransitionName(view2));
                    }
                    size--;
                }
            } else {
                retainValues(arrayMap, arrayMap3);
                arrayMap2 = arrayMap3;
            }
        }
        return arrayMap2;
    }

    private static ArrayMap<String, View> captureOutSharedElements(ArrayMap<String, String> arrayMap, Object obj, FragmentContainerTransition fragmentContainerTransition) {
        ArrayMap<String, View> arrayMap2;
        SharedElementCallback exitTransitionCallback;
        ArrayList<String> arrayList;
        if (arrayMap.isEmpty() || obj == null) {
            arrayMap.clear();
            arrayMap2 = null;
        } else {
            Fragment fragment = fragmentContainerTransition.firstOut;
            ArrayMap<String, View> arrayMap3 = new ArrayMap<>();
            FragmentTransitionCompat21.findNamedViews(arrayMap3, fragment.getView());
            BackStackRecord backStackRecord = fragmentContainerTransition.firstOutTransaction;
            if (fragmentContainerTransition.firstOutIsPop) {
                exitTransitionCallback = fragment.getEnterTransitionCallback();
                arrayList = backStackRecord.mSharedElementTargetNames;
            } else {
                exitTransitionCallback = fragment.getExitTransitionCallback();
                arrayList = backStackRecord.mSharedElementSourceNames;
            }
            arrayMap3.retainAll(arrayList);
            if (exitTransitionCallback != null) {
                exitTransitionCallback.onMapSharedElements(arrayList, arrayMap3);
                int size = arrayList.size() - 1;
                while (true) {
                    arrayMap2 = arrayMap3;
                    if (size < 0) {
                        break;
                    }
                    String str = arrayList.get(size);
                    View view = arrayMap3.get(str);
                    if (view == null) {
                        arrayMap.remove(str);
                    } else if (!str.equals(ViewCompat.getTransitionName(view))) {
                        arrayMap.put(ViewCompat.getTransitionName(view), arrayMap.remove(str));
                    }
                    size--;
                }
            } else {
                arrayMap.retainAll(arrayMap3.keySet());
                arrayMap2 = arrayMap3;
            }
        }
        return arrayMap2;
    }

    public static ArrayList<View> configureEnteringExitingViews(Object obj, Fragment fragment, ArrayList<View> arrayList, View view) {
        ArrayList<View> arrayList2 = null;
        if (obj != null) {
            ArrayList<View> arrayList3 = new ArrayList<>();
            View view2 = fragment.getView();
            if (view2 != null) {
                FragmentTransitionCompat21.captureTransitioningViews(arrayList3, view2);
            }
            if (arrayList != null) {
                arrayList3.removeAll(arrayList);
            }
            arrayList2 = arrayList3;
            if (!arrayList3.isEmpty()) {
                arrayList3.add(view);
                FragmentTransitionCompat21.addTargets(obj, arrayList3);
                arrayList2 = arrayList3;
            }
        }
        return arrayList2;
    }

    private static Object configureSharedElementsOptimized(ViewGroup viewGroup, View view, ArrayMap<String, String> arrayMap, FragmentContainerTransition fragmentContainerTransition, ArrayList<View> arrayList, ArrayList<View> arrayList2, Object obj, Object obj2) {
        Object obj3;
        Rect rect;
        View view2;
        final Fragment fragment = fragmentContainerTransition.lastIn;
        final Fragment fragment2 = fragmentContainerTransition.firstOut;
        if (fragment != null) {
            fragment.getView().setVisibility(0);
        }
        if (fragment == null || fragment2 == null) {
            obj3 = null;
        } else {
            final boolean z = fragmentContainerTransition.lastInIsPop;
            Object sharedElementTransition = arrayMap.isEmpty() ? null : getSharedElementTransition(fragment, fragment2, z);
            ArrayMap<String, View> captureOutSharedElements = captureOutSharedElements(arrayMap, sharedElementTransition, fragmentContainerTransition);
            final ArrayMap<String, View> captureInSharedElements = captureInSharedElements(arrayMap, sharedElementTransition, fragmentContainerTransition);
            if (arrayMap.isEmpty()) {
                if (captureOutSharedElements != null) {
                    captureOutSharedElements.clear();
                }
                obj3 = null;
                if (captureInSharedElements != null) {
                    captureInSharedElements.clear();
                    obj3 = null;
                }
            } else {
                addSharedElementsWithMatchingNames(arrayList, captureOutSharedElements, arrayMap.keySet());
                addSharedElementsWithMatchingNames(arrayList2, captureInSharedElements, arrayMap.values());
                obj3 = sharedElementTransition;
            }
            if (obj == null && obj2 == null && obj3 == null) {
                obj3 = null;
            } else {
                callSharedElementStartEnd(fragment, fragment2, z, captureOutSharedElements, true);
                if (obj3 != null) {
                    arrayList2.add(view);
                    FragmentTransitionCompat21.setSharedElementTargets(obj3, view, arrayList);
                    setOutEpicenter(obj3, obj2, captureOutSharedElements, fragmentContainerTransition.firstOutIsPop, fragmentContainerTransition.firstOutTransaction);
                    Rect rect2 = new Rect();
                    View inEpicenterView = getInEpicenterView(captureInSharedElements, fragmentContainerTransition, obj, z);
                    view2 = inEpicenterView;
                    rect = rect2;
                    if (inEpicenterView != null) {
                        FragmentTransitionCompat21.setEpicenter(obj, rect2);
                        rect = rect2;
                        view2 = inEpicenterView;
                    }
                } else {
                    rect = null;
                    view2 = null;
                }
                final View view3 = view2;
                final Rect rect3 = rect;
                OneShotPreDrawListener.add(viewGroup, new Runnable() { // from class: android.support.v4.app.FragmentTransition.3
                    @Override // java.lang.Runnable
                    public void run() {
                        FragmentTransition.callSharedElementStartEnd(fragment, fragment2, z, captureInSharedElements, false);
                        if (view3 != null) {
                            FragmentTransitionCompat21.getBoundsOnScreen(view3, rect3);
                        }
                    }
                });
            }
        }
        return obj3;
    }

    private static Object configureSharedElementsUnoptimized(ViewGroup viewGroup, final View view, final ArrayMap<String, String> arrayMap, final FragmentContainerTransition fragmentContainerTransition, final ArrayList<View> arrayList, final ArrayList<View> arrayList2, final Object obj, Object obj2) {
        Object obj3;
        Rect rect;
        final Fragment fragment = fragmentContainerTransition.lastIn;
        final Fragment fragment2 = fragmentContainerTransition.firstOut;
        if (fragment == null || fragment2 == null) {
            obj3 = null;
        } else {
            final boolean z = fragmentContainerTransition.lastInIsPop;
            obj3 = arrayMap.isEmpty() ? null : getSharedElementTransition(fragment, fragment2, z);
            ArrayMap<String, View> captureOutSharedElements = captureOutSharedElements(arrayMap, obj3, fragmentContainerTransition);
            if (arrayMap.isEmpty()) {
                obj3 = null;
            } else {
                arrayList.addAll(captureOutSharedElements.values());
            }
            if (obj == null && obj2 == null && obj3 == null) {
                obj3 = null;
            } else {
                callSharedElementStartEnd(fragment, fragment2, z, captureOutSharedElements, true);
                if (obj3 != null) {
                    Rect rect2 = new Rect();
                    FragmentTransitionCompat21.setSharedElementTargets(obj3, view, arrayList);
                    setOutEpicenter(obj3, obj2, captureOutSharedElements, fragmentContainerTransition.firstOutIsPop, fragmentContainerTransition.firstOutTransaction);
                    rect = rect2;
                    if (obj != null) {
                        FragmentTransitionCompat21.setEpicenter(obj, rect2);
                        rect = rect2;
                    }
                } else {
                    rect = null;
                }
                final Object obj4 = obj3;
                final Rect rect3 = rect;
                OneShotPreDrawListener.add(viewGroup, new Runnable() { // from class: android.support.v4.app.FragmentTransition.4
                    @Override // java.lang.Runnable
                    public void run() {
                        ArrayMap captureInSharedElements = FragmentTransition.captureInSharedElements(arrayMap, obj4, fragmentContainerTransition);
                        if (captureInSharedElements != null) {
                            arrayList2.addAll(captureInSharedElements.values());
                            arrayList2.add(view);
                        }
                        FragmentTransition.callSharedElementStartEnd(fragment, fragment2, z, captureInSharedElements, false);
                        if (obj4 != null) {
                            FragmentTransitionCompat21.swapSharedElementTargets(obj4, arrayList, arrayList2);
                            View inEpicenterView = FragmentTransition.getInEpicenterView(captureInSharedElements, fragmentContainerTransition, obj, z);
                            if (inEpicenterView == null) {
                                return;
                            }
                            FragmentTransitionCompat21.getBoundsOnScreen(inEpicenterView, rect3);
                        }
                    }
                });
            }
        }
        return obj3;
    }

    private static void configureTransitionsOptimized(FragmentManagerImpl fragmentManagerImpl, int i, FragmentContainerTransition fragmentContainerTransition, View view, ArrayMap<String, String> arrayMap) {
        ViewGroup viewGroup = null;
        if (fragmentManagerImpl.mContainer.onHasView()) {
            viewGroup = (ViewGroup) fragmentManagerImpl.mContainer.onFindViewById(i);
        }
        if (viewGroup == null) {
            return;
        }
        Fragment fragment = fragmentContainerTransition.lastIn;
        Fragment fragment2 = fragmentContainerTransition.firstOut;
        boolean z = fragmentContainerTransition.lastInIsPop;
        boolean z2 = fragmentContainerTransition.firstOutIsPop;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        Object enterTransition = getEnterTransition(fragment, z);
        Object exitTransition = getExitTransition(fragment2, z2);
        Object configureSharedElementsOptimized = configureSharedElementsOptimized(viewGroup, view, arrayMap, fragmentContainerTransition, arrayList2, arrayList, enterTransition, exitTransition);
        if (enterTransition == null && configureSharedElementsOptimized == null && exitTransition == null) {
            return;
        }
        ArrayList<View> configureEnteringExitingViews = configureEnteringExitingViews(exitTransition, fragment2, arrayList2, view);
        ArrayList<View> configureEnteringExitingViews2 = configureEnteringExitingViews(enterTransition, fragment, arrayList, view);
        setViewVisibility(configureEnteringExitingViews2, 4);
        Object mergeTransitions = mergeTransitions(enterTransition, exitTransition, configureSharedElementsOptimized, fragment, z);
        if (mergeTransitions == null) {
            return;
        }
        replaceHide(exitTransition, fragment2, configureEnteringExitingViews);
        ArrayList<String> prepareSetNameOverridesOptimized = FragmentTransitionCompat21.prepareSetNameOverridesOptimized(arrayList);
        FragmentTransitionCompat21.scheduleRemoveTargets(mergeTransitions, enterTransition, configureEnteringExitingViews2, exitTransition, configureEnteringExitingViews, configureSharedElementsOptimized, arrayList);
        FragmentTransitionCompat21.beginDelayedTransition(viewGroup, mergeTransitions);
        FragmentTransitionCompat21.setNameOverridesOptimized(viewGroup, arrayList2, arrayList, prepareSetNameOverridesOptimized, arrayMap);
        setViewVisibility(configureEnteringExitingViews2, 0);
        FragmentTransitionCompat21.swapSharedElementTargets(configureSharedElementsOptimized, arrayList2, arrayList);
    }

    private static void configureTransitionsUnoptimized(FragmentManagerImpl fragmentManagerImpl, int i, FragmentContainerTransition fragmentContainerTransition, View view, ArrayMap<String, String> arrayMap) {
        ViewGroup viewGroup = null;
        if (fragmentManagerImpl.mContainer.onHasView()) {
            viewGroup = (ViewGroup) fragmentManagerImpl.mContainer.onFindViewById(i);
        }
        if (viewGroup == null) {
            return;
        }
        Fragment fragment = fragmentContainerTransition.lastIn;
        Fragment fragment2 = fragmentContainerTransition.firstOut;
        boolean z = fragmentContainerTransition.lastInIsPop;
        boolean z2 = fragmentContainerTransition.firstOutIsPop;
        Object enterTransition = getEnterTransition(fragment, z);
        Object exitTransition = getExitTransition(fragment2, z2);
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        Object configureSharedElementsUnoptimized = configureSharedElementsUnoptimized(viewGroup, view, arrayMap, fragmentContainerTransition, arrayList, arrayList2, enterTransition, exitTransition);
        if (enterTransition == null && configureSharedElementsUnoptimized == null && exitTransition == null) {
            return;
        }
        ArrayList<View> configureEnteringExitingViews = configureEnteringExitingViews(exitTransition, fragment2, arrayList, view);
        if (configureEnteringExitingViews == null || configureEnteringExitingViews.isEmpty()) {
            exitTransition = null;
        }
        FragmentTransitionCompat21.addTarget(enterTransition, view);
        Object mergeTransitions = mergeTransitions(enterTransition, exitTransition, configureSharedElementsUnoptimized, fragment, fragmentContainerTransition.lastInIsPop);
        if (mergeTransitions == null) {
            return;
        }
        ArrayList arrayList3 = new ArrayList();
        FragmentTransitionCompat21.scheduleRemoveTargets(mergeTransitions, enterTransition, arrayList3, exitTransition, configureEnteringExitingViews, configureSharedElementsUnoptimized, arrayList2);
        scheduleTargetChange(viewGroup, fragment, view, arrayList2, enterTransition, arrayList3, exitTransition, configureEnteringExitingViews);
        FragmentTransitionCompat21.setNameOverridesUnoptimized(viewGroup, arrayList2, arrayMap);
        FragmentTransitionCompat21.beginDelayedTransition(viewGroup, mergeTransitions);
        FragmentTransitionCompat21.scheduleNameReset(viewGroup, arrayList2, arrayMap);
    }

    private static FragmentContainerTransition ensureContainer(FragmentContainerTransition fragmentContainerTransition, SparseArray<FragmentContainerTransition> sparseArray, int i) {
        FragmentContainerTransition fragmentContainerTransition2 = fragmentContainerTransition;
        if (fragmentContainerTransition == null) {
            fragmentContainerTransition2 = new FragmentContainerTransition();
            sparseArray.put(i, fragmentContainerTransition2);
        }
        return fragmentContainerTransition2;
    }

    private static String findKeyForValue(ArrayMap<String, String> arrayMap, String str) {
        String str2;
        int size = arrayMap.size();
        int i = 0;
        while (true) {
            if (i >= size) {
                str2 = null;
                break;
            } else if (str.equals(arrayMap.valueAt(i))) {
                str2 = arrayMap.keyAt(i);
                break;
            } else {
                i++;
            }
        }
        return str2;
    }

    private static Object getEnterTransition(Fragment fragment, boolean z) {
        Object cloneTransition;
        if (fragment == null) {
            cloneTransition = null;
        } else {
            cloneTransition = FragmentTransitionCompat21.cloneTransition(z ? fragment.getReenterTransition() : fragment.getEnterTransition());
        }
        return cloneTransition;
    }

    private static Object getExitTransition(Fragment fragment, boolean z) {
        Object cloneTransition;
        if (fragment == null) {
            cloneTransition = null;
        } else {
            cloneTransition = FragmentTransitionCompat21.cloneTransition(z ? fragment.getReturnTransition() : fragment.getExitTransition());
        }
        return cloneTransition;
    }

    public static View getInEpicenterView(ArrayMap<String, View> arrayMap, FragmentContainerTransition fragmentContainerTransition, Object obj, boolean z) {
        View view;
        BackStackRecord backStackRecord = fragmentContainerTransition.lastInTransaction;
        if (obj == null || arrayMap == null || backStackRecord.mSharedElementSourceNames == null || backStackRecord.mSharedElementSourceNames.isEmpty()) {
            view = null;
        } else {
            view = arrayMap.get(z ? backStackRecord.mSharedElementSourceNames.get(0) : backStackRecord.mSharedElementTargetNames.get(0));
        }
        return view;
    }

    private static Object getSharedElementTransition(Fragment fragment, Fragment fragment2, boolean z) {
        Object obj;
        if (fragment == null || fragment2 == null) {
            obj = null;
        } else {
            obj = FragmentTransitionCompat21.wrapTransitionInSet(FragmentTransitionCompat21.cloneTransition(z ? fragment2.getSharedElementReturnTransition() : fragment.getSharedElementEnterTransition()));
        }
        return obj;
    }

    private static Object mergeTransitions(Object obj, Object obj2, Object obj3, Fragment fragment, boolean z) {
        boolean z2 = true;
        if (obj != null) {
            z2 = true;
            if (obj2 != null) {
                z2 = true;
                if (fragment != null) {
                    z2 = z ? fragment.getAllowReturnTransitionOverlap() : fragment.getAllowEnterTransitionOverlap();
                }
            }
        }
        return z2 ? FragmentTransitionCompat21.mergeTransitionsTogether(obj2, obj, obj3) : FragmentTransitionCompat21.mergeTransitionsInSequence(obj2, obj, obj3);
    }

    private static void replaceHide(Object obj, Fragment fragment, final ArrayList<View> arrayList) {
        if (fragment == null || obj == null || !fragment.mAdded || !fragment.mHidden || !fragment.mHiddenChanged) {
            return;
        }
        fragment.setHideReplaced(true);
        FragmentTransitionCompat21.scheduleHideFragmentView(obj, fragment.getView(), arrayList);
        OneShotPreDrawListener.add(fragment.mContainer, new Runnable() { // from class: android.support.v4.app.FragmentTransition.1
            @Override // java.lang.Runnable
            public void run() {
                FragmentTransition.setViewVisibility(arrayList, 4);
            }
        });
    }

    private static void retainValues(ArrayMap<String, String> arrayMap, ArrayMap<String, View> arrayMap2) {
        for (int size = arrayMap.size() - 1; size >= 0; size--) {
            if (!arrayMap2.containsKey(arrayMap.valueAt(size))) {
                arrayMap.removeAt(size);
            }
        }
    }

    private static void scheduleTargetChange(ViewGroup viewGroup, final Fragment fragment, final View view, final ArrayList<View> arrayList, final Object obj, final ArrayList<View> arrayList2, final Object obj2, final ArrayList<View> arrayList3) {
        OneShotPreDrawListener.add(viewGroup, new Runnable() { // from class: android.support.v4.app.FragmentTransition.2
            @Override // java.lang.Runnable
            public void run() {
                if (obj != null) {
                    FragmentTransitionCompat21.removeTarget(obj, view);
                    arrayList2.addAll(FragmentTransition.configureEnteringExitingViews(obj, fragment, arrayList, view));
                }
                if (arrayList3 != null) {
                    if (obj2 != null) {
                        ArrayList arrayList4 = new ArrayList();
                        arrayList4.add(view);
                        FragmentTransitionCompat21.replaceTargets(obj2, arrayList3, arrayList4);
                    }
                    arrayList3.clear();
                    arrayList3.add(view);
                }
            }
        });
    }

    private static void setOutEpicenter(Object obj, Object obj2, ArrayMap<String, View> arrayMap, boolean z, BackStackRecord backStackRecord) {
        if (backStackRecord.mSharedElementSourceNames == null || backStackRecord.mSharedElementSourceNames.isEmpty()) {
            return;
        }
        View view = arrayMap.get(z ? backStackRecord.mSharedElementTargetNames.get(0) : backStackRecord.mSharedElementSourceNames.get(0));
        FragmentTransitionCompat21.setEpicenter(obj, view);
        if (obj2 == null) {
            return;
        }
        FragmentTransitionCompat21.setEpicenter(obj2, view);
    }

    public static void setViewVisibility(ArrayList<View> arrayList, int i) {
        if (arrayList == null) {
            return;
        }
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            arrayList.get(size).setVisibility(i);
        }
    }

    static void startTransitions(FragmentManagerImpl fragmentManagerImpl, ArrayList<BackStackRecord> arrayList, ArrayList<Boolean> arrayList2, int i, int i2, boolean z) {
        if (fragmentManagerImpl.mCurState < 1 || Build.VERSION.SDK_INT < 21) {
            return;
        }
        SparseArray sparseArray = new SparseArray();
        for (int i3 = i; i3 < i2; i3++) {
            BackStackRecord backStackRecord = arrayList.get(i3);
            if (arrayList2.get(i3).booleanValue()) {
                calculatePopFragments(backStackRecord, sparseArray, z);
            } else {
                calculateFragments(backStackRecord, sparseArray, z);
            }
        }
        if (sparseArray.size() == 0) {
            return;
        }
        View view = new View(fragmentManagerImpl.mHost.getContext());
        int size = sparseArray.size();
        for (int i4 = 0; i4 < size; i4++) {
            int keyAt = sparseArray.keyAt(i4);
            ArrayMap<String, String> calculateNameOverrides = calculateNameOverrides(keyAt, arrayList, arrayList2, i, i2);
            FragmentContainerTransition fragmentContainerTransition = (FragmentContainerTransition) sparseArray.valueAt(i4);
            if (z) {
                configureTransitionsOptimized(fragmentManagerImpl, keyAt, fragmentContainerTransition, view, calculateNameOverrides);
            } else {
                configureTransitionsUnoptimized(fragmentManagerImpl, keyAt, fragmentContainerTransition, view, calculateNameOverrides);
            }
        }
    }
}
