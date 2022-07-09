package android.support.v4.content.res;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.support.annotation.AnyRes;
import android.support.annotation.RestrictTo;
import android.support.annotation.StyleableRes;
import android.util.TypedValue;

@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.jar:android/support/v4/content/res/TypedArrayUtils.class */
public class TypedArrayUtils {
    public static int getAttr(Context context, int i, int i2) {
        TypedValue typedValue = new TypedValue();
        context.getTheme().resolveAttribute(i, typedValue, true);
        if (typedValue.resourceId == 0) {
            i = i2;
        }
        return i;
    }

    public static boolean getBoolean(TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2, boolean z) {
        return typedArray.getBoolean(i, typedArray.getBoolean(i2, z));
    }

    public static Drawable getDrawable(TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2) {
        Drawable drawable = typedArray.getDrawable(i);
        Drawable drawable2 = drawable;
        if (drawable == null) {
            drawable2 = typedArray.getDrawable(i2);
        }
        return drawable2;
    }

    public static int getInt(TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2, int i3) {
        return typedArray.getInt(i, typedArray.getInt(i2, i3));
    }

    @AnyRes
    public static int getResourceId(TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2, @AnyRes int i3) {
        return typedArray.getResourceId(i, typedArray.getResourceId(i2, i3));
    }

    public static String getString(TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2) {
        String string = typedArray.getString(i);
        String str = string;
        if (string == null) {
            str = typedArray.getString(i2);
        }
        return str;
    }

    public static CharSequence getText(TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2) {
        CharSequence text = typedArray.getText(i);
        CharSequence charSequence = text;
        if (text == null) {
            charSequence = typedArray.getText(i2);
        }
        return charSequence;
    }

    public static CharSequence[] getTextArray(TypedArray typedArray, @StyleableRes int i, @StyleableRes int i2) {
        CharSequence[] textArray = typedArray.getTextArray(i);
        CharSequence[] charSequenceArr = textArray;
        if (textArray == null) {
            charSequenceArr = typedArray.getTextArray(i2);
        }
        return charSequenceArr;
    }
}
