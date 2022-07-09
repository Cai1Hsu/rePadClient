package com.handmark.pulltorefresh.library;

import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import com.handmark.pulltorefresh.library.internal.LoadingLayout;
import java.util.HashSet;
import java.util.Iterator;

/* loaded from: classes.jar:com/handmark/pulltorefresh/library/LoadingLayoutProxy.class */
public class LoadingLayoutProxy implements ILoadingLayout {
    private final HashSet<LoadingLayout> mLoadingLayouts = new HashSet<>();

    LoadingLayoutProxy() {
    }

    public void addLayout(LoadingLayout loadingLayout) {
        if (loadingLayout != null) {
            this.mLoadingLayouts.add(loadingLayout);
        }
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setLastUpdatedLabel(CharSequence charSequence) {
        Iterator<LoadingLayout> it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            it.next().setLastUpdatedLabel(charSequence);
        }
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setLoadingDrawable(Drawable drawable) {
        Iterator<LoadingLayout> it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            it.next().setLoadingDrawable(drawable);
        }
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setPullLabel(CharSequence charSequence) {
        Iterator<LoadingLayout> it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            it.next().setPullLabel(charSequence);
        }
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setRefreshingLabel(CharSequence charSequence) {
        Iterator<LoadingLayout> it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            it.next().setRefreshingLabel(charSequence);
        }
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setReleaseLabel(CharSequence charSequence) {
        Iterator<LoadingLayout> it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            it.next().setReleaseLabel(charSequence);
        }
    }

    @Override // com.handmark.pulltorefresh.library.ILoadingLayout
    public void setTextTypeface(Typeface typeface) {
        Iterator<LoadingLayout> it = this.mLoadingLayouts.iterator();
        while (it.hasNext()) {
            it.next().setTextTypeface(typeface);
        }
    }
}
