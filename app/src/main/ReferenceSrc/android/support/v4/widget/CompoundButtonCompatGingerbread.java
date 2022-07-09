package android.support.v4.widget;

import android.annotation.TargetApi;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.support.annotation.RequiresApi;
import android.util.Log;
import android.widget.CompoundButton;
import java.lang.reflect.Field;

@RequiresApi(9)
@TargetApi(9)
/* loaded from: classes.jar:android/support/v4/widget/CompoundButtonCompatGingerbread.class */
class CompoundButtonCompatGingerbread {
    private static final String TAG = "CompoundButtonCompatGingerbread";
    private static Field sButtonDrawableField;
    private static boolean sButtonDrawableFieldFetched;

    CompoundButtonCompatGingerbread() {
    }

    static Drawable getButtonDrawable(CompoundButton compoundButton) {
        Drawable drawable;
        if (!sButtonDrawableFieldFetched) {
            try {
                sButtonDrawableField = CompoundButton.class.getDeclaredField("mButtonDrawable");
                sButtonDrawableField.setAccessible(true);
            } catch (NoSuchFieldException e) {
                Log.i(TAG, "Failed to retrieve mButtonDrawable field", e);
            }
            sButtonDrawableFieldFetched = true;
        }
        if (sButtonDrawableField != null) {
            try {
                drawable = (Drawable) sButtonDrawableField.get(compoundButton);
            } catch (IllegalAccessException e2) {
                Log.i(TAG, "Failed to get button drawable via reflection", e2);
                sButtonDrawableField = null;
            }
            return drawable;
        }
        drawable = null;
        return drawable;
    }

    static ColorStateList getButtonTintList(CompoundButton compoundButton) {
        return compoundButton instanceof TintableCompoundButton ? ((TintableCompoundButton) compoundButton).getSupportButtonTintList() : null;
    }

    static PorterDuff.Mode getButtonTintMode(CompoundButton compoundButton) {
        return compoundButton instanceof TintableCompoundButton ? ((TintableCompoundButton) compoundButton).getSupportButtonTintMode() : null;
    }

    static void setButtonTintList(CompoundButton compoundButton, ColorStateList colorStateList) {
        if (compoundButton instanceof TintableCompoundButton) {
            ((TintableCompoundButton) compoundButton).setSupportButtonTintList(colorStateList);
        }
    }

    static void setButtonTintMode(CompoundButton compoundButton, PorterDuff.Mode mode) {
        if (compoundButton instanceof TintableCompoundButton) {
            ((TintableCompoundButton) compoundButton).setSupportButtonTintMode(mode);
        }
    }
}
