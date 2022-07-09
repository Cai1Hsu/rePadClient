package com.handmark.pulltorefresh.library;

import android.graphics.Typeface;
import android.graphics.drawable.Drawable;

/* loaded from: classes.jar:com/handmark/pulltorefresh/library/ILoadingLayout.class */
public interface ILoadingLayout {
    void setLastUpdatedLabel(CharSequence charSequence);

    void setLoadingDrawable(Drawable drawable);

    void setPullLabel(CharSequence charSequence);

    void setRefreshingLabel(CharSequence charSequence);

    void setReleaseLabel(CharSequence charSequence);

    void setTextTypeface(Typeface typeface);
}
