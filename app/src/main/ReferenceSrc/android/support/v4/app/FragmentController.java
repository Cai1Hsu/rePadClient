package android.support.v4.app;

import android.content.Context;
import android.content.res.Configuration;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import android.support.v4.util.SimpleArrayMap;
import android.util.AttributeSet;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.jar:android/support/v4/app/FragmentController.class */
public class FragmentController {
    private final FragmentHostCallback<?> mHost;

    private FragmentController(FragmentHostCallback<?> fragmentHostCallback) {
        this.mHost = fragmentHostCallback;
    }

    public static final FragmentController createController(FragmentHostCallback<?> fragmentHostCallback) {
        return new FragmentController(fragmentHostCallback);
    }

    public void attachHost(Fragment fragment) {
        this.mHost.mFragmentManager.attachController(this.mHost, this.mHost, fragment);
    }

    public void dispatchActivityCreated() {
        this.mHost.mFragmentManager.dispatchActivityCreated();
    }

    public void dispatchConfigurationChanged(Configuration configuration) {
        this.mHost.mFragmentManager.dispatchConfigurationChanged(configuration);
    }

    public boolean dispatchContextItemSelected(MenuItem menuItem) {
        return this.mHost.mFragmentManager.dispatchContextItemSelected(menuItem);
    }

    public void dispatchCreate() {
        this.mHost.mFragmentManager.dispatchCreate();
    }

    public boolean dispatchCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        return this.mHost.mFragmentManager.dispatchCreateOptionsMenu(menu, menuInflater);
    }

    public void dispatchDestroy() {
        this.mHost.mFragmentManager.dispatchDestroy();
    }

    public void dispatchDestroyView() {
        this.mHost.mFragmentManager.dispatchDestroyView();
    }

    public void dispatchLowMemory() {
        this.mHost.mFragmentManager.dispatchLowMemory();
    }

    public void dispatchMultiWindowModeChanged(boolean z) {
        this.mHost.mFragmentManager.dispatchMultiWindowModeChanged(z);
    }

    public boolean dispatchOptionsItemSelected(MenuItem menuItem) {
        return this.mHost.mFragmentManager.dispatchOptionsItemSelected(menuItem);
    }

    public void dispatchOptionsMenuClosed(Menu menu) {
        this.mHost.mFragmentManager.dispatchOptionsMenuClosed(menu);
    }

    public void dispatchPause() {
        this.mHost.mFragmentManager.dispatchPause();
    }

    public void dispatchPictureInPictureModeChanged(boolean z) {
        this.mHost.mFragmentManager.dispatchPictureInPictureModeChanged(z);
    }

    public boolean dispatchPrepareOptionsMenu(Menu menu) {
        return this.mHost.mFragmentManager.dispatchPrepareOptionsMenu(menu);
    }

    public void dispatchReallyStop() {
        this.mHost.mFragmentManager.dispatchReallyStop();
    }

    public void dispatchResume() {
        this.mHost.mFragmentManager.dispatchResume();
    }

    public void dispatchStart() {
        this.mHost.mFragmentManager.dispatchStart();
    }

    public void dispatchStop() {
        this.mHost.mFragmentManager.dispatchStop();
    }

    public void doLoaderDestroy() {
        this.mHost.doLoaderDestroy();
    }

    public void doLoaderRetain() {
        this.mHost.doLoaderRetain();
    }

    public void doLoaderStart() {
        this.mHost.doLoaderStart();
    }

    public void doLoaderStop(boolean z) {
        this.mHost.doLoaderStop(z);
    }

    public void dumpLoaders(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        this.mHost.dumpLoaders(str, fileDescriptor, printWriter, strArr);
    }

    public boolean execPendingActions() {
        return this.mHost.mFragmentManager.execPendingActions();
    }

    @Nullable
    public Fragment findFragmentByWho(String str) {
        return this.mHost.mFragmentManager.findFragmentByWho(str);
    }

    public List<Fragment> getActiveFragments(List<Fragment> list) {
        List<Fragment> list2;
        if (this.mHost.mFragmentManager.mActive == null) {
            list2 = null;
        } else {
            ArrayList arrayList = list;
            if (list == null) {
                arrayList = new ArrayList(getActiveFragmentsCount());
            }
            arrayList.addAll(this.mHost.mFragmentManager.mActive);
            list2 = arrayList;
        }
        return list2;
    }

    public int getActiveFragmentsCount() {
        ArrayList<Fragment> arrayList = this.mHost.mFragmentManager.mActive;
        return arrayList == null ? 0 : arrayList.size();
    }

    public FragmentManager getSupportFragmentManager() {
        return this.mHost.getFragmentManagerImpl();
    }

    public LoaderManager getSupportLoaderManager() {
        return this.mHost.getLoaderManagerImpl();
    }

    public void noteStateNotSaved() {
        this.mHost.mFragmentManager.noteStateNotSaved();
    }

    public View onCreateView(View view, String str, Context context, AttributeSet attributeSet) {
        return this.mHost.mFragmentManager.onCreateView(view, str, context, attributeSet);
    }

    public void reportLoaderStart() {
        this.mHost.reportLoaderStart();
    }

    public void restoreAllState(Parcelable parcelable, FragmentManagerNonConfig fragmentManagerNonConfig) {
        this.mHost.mFragmentManager.restoreAllState(parcelable, fragmentManagerNonConfig);
    }

    @Deprecated
    public void restoreAllState(Parcelable parcelable, List<Fragment> list) {
        this.mHost.mFragmentManager.restoreAllState(parcelable, new FragmentManagerNonConfig(list, null));
    }

    public void restoreLoaderNonConfig(SimpleArrayMap<String, LoaderManager> simpleArrayMap) {
        this.mHost.restoreLoaderNonConfig(simpleArrayMap);
    }

    public SimpleArrayMap<String, LoaderManager> retainLoaderNonConfig() {
        return this.mHost.retainLoaderNonConfig();
    }

    public FragmentManagerNonConfig retainNestedNonConfig() {
        return this.mHost.mFragmentManager.retainNonConfig();
    }

    @Deprecated
    public List<Fragment> retainNonConfig() {
        FragmentManagerNonConfig retainNonConfig = this.mHost.mFragmentManager.retainNonConfig();
        return retainNonConfig != null ? retainNonConfig.getFragments() : null;
    }

    public Parcelable saveAllState() {
        return this.mHost.mFragmentManager.saveAllState();
    }
}
