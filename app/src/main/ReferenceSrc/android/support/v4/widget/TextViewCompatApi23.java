package android.support.v4.widget;

import android.annotation.TargetApi;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresApi;
import android.support.annotation.StyleRes;
import android.widget.TextView;

@RequiresApi(23)
@TargetApi(23)
/* loaded from: classes.jar:android/support/v4/widget/TextViewCompatApi23.class */
class TextViewCompatApi23 {
    TextViewCompatApi23() {
    }

    public static void setTextAppearance(@NonNull TextView textView, @StyleRes int i) {
        textView.setTextAppearance(i);
    }
}
