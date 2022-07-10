package com.handmark.pulltorefresh.library;

import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import com.handmark.pulltorefresh.library.internal.LoadingLayout;
import java.util.HashSet;
import java.util.Iterator;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class LoadingLayoutProxy implements ILoadingLayout {
    private final HashSet<LoadingLayout> mLoadingLayouts = new HashSet<>();

    public void addLayout(LoadingLayout layout) {
        if (layout != null) {
            this.mLoadingLayouts.add(layout);
        }
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setLastUpdatedLabel(CharSequence label) {
        Iterator<LoadingLayout> it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            LoadingLayout layout = it.next();
            layout.setLastUpdatedLabel(label);
        }
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setLoadingDrawable(Drawable drawable) {
        Iterator<LoadingLayout> it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            LoadingLayout layout = it.next();
            layout.setLoadingDrawable(drawable);
        }
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setRefreshingLabel(CharSequence refreshingLabel) {
        Iterator<LoadingLayout> it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            LoadingLayout layout = it.next();
            layout.setRefreshingLabel(refreshingLabel);
        }
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setPullLabel(CharSequence label) {
        Iterator<LoadingLayout> it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            LoadingLayout layout = it.next();
            layout.setPullLabel(label);
        }
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setReleaseLabel(CharSequence label) {
        Iterator<LoadingLayout> it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            LoadingLayout layout = it.next();
            layout.setReleaseLabel(label);
        }
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setTextTypeface(Typeface tf) {
        Iterator<LoadingLayout> it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            LoadingLayout layout = it.next();
            layout.setTextTypeface(tf);
        }
    }
}
