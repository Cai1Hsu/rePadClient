package com.handmark.pulltorefresh.library;

import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface ILoadingLayout {
    void setLastUpdatedLabel(CharSequence charSequence);

    void setLoadingDrawable(Drawable drawable);

    void setPullLabel(CharSequence charSequence);

    void setRefreshingLabel(CharSequence charSequence);

    void setReleaseLabel(CharSequence charSequence);

    void setTextTypeface(Typeface typeface);
}
