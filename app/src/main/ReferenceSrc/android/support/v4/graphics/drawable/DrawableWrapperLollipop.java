package android.support.v4.graphics.drawable;

import android.annotation.TargetApi;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Outline;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.DrawableContainer;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RequiresApi;
import android.support.v4.graphics.drawable.DrawableWrapperGingerbread;

@RequiresApi(21)
@TargetApi(21)
/* loaded from: classes.jar:android/support/v4/graphics/drawable/DrawableWrapperLollipop.class */
class DrawableWrapperLollipop extends DrawableWrapperKitKat {

    /* loaded from: classes.jar:android/support/v4/graphics/drawable/DrawableWrapperLollipop$DrawableWrapperStateLollipop.class */
    private static class DrawableWrapperStateLollipop extends DrawableWrapperGingerbread.DrawableWrapperState {
        DrawableWrapperStateLollipop(@Nullable DrawableWrapperGingerbread.DrawableWrapperState drawableWrapperState, @Nullable Resources resources) {
            super(drawableWrapperState, resources);
        }

        @Override // android.support.v4.graphics.drawable.DrawableWrapperGingerbread.DrawableWrapperState, android.graphics.drawable.Drawable.ConstantState
        public Drawable newDrawable(@Nullable Resources resources) {
            return new DrawableWrapperLollipop(this, resources);
        }
    }

    DrawableWrapperLollipop(Drawable drawable) {
        super(drawable);
    }

    DrawableWrapperLollipop(DrawableWrapperGingerbread.DrawableWrapperState drawableWrapperState, Resources resources) {
        super(drawableWrapperState, resources);
    }

    @Override // android.graphics.drawable.Drawable
    public Rect getDirtyBounds() {
        return this.mDrawable.getDirtyBounds();
    }

    @Override // android.graphics.drawable.Drawable
    public void getOutline(Outline outline) {
        this.mDrawable.getOutline(outline);
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x0025, code lost:
        if ((r0 instanceof android.graphics.drawable.InsetDrawable) != false) goto L10;
     */
    @Override // android.support.v4.graphics.drawable.DrawableWrapperGingerbread
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    protected boolean isCompatTintEnabled() {
        boolean z = false;
        if (Build.VERSION.SDK_INT == 21) {
            Drawable drawable = this.mDrawable;
            if (!(drawable instanceof GradientDrawable) && !(drawable instanceof DrawableContainer)) {
                z = false;
            }
            z = true;
        }
        return z;
    }

    @Override // android.support.v4.graphics.drawable.DrawableWrapperKitKat, android.support.v4.graphics.drawable.DrawableWrapperHoneycomb, android.support.v4.graphics.drawable.DrawableWrapperGingerbread
    @NonNull
    DrawableWrapperGingerbread.DrawableWrapperState mutateConstantState() {
        return new DrawableWrapperStateLollipop(this.mState, null);
    }

    @Override // android.graphics.drawable.Drawable
    public void setHotspot(float f, float f2) {
        this.mDrawable.setHotspot(f, f2);
    }

    @Override // android.graphics.drawable.Drawable
    public void setHotspotBounds(int i, int i2, int i3, int i4) {
        this.mDrawable.setHotspotBounds(i, i2, i3, i4);
    }

    @Override // android.support.v4.graphics.drawable.DrawableWrapperGingerbread, android.graphics.drawable.Drawable
    public boolean setState(int[] iArr) {
        boolean z;
        if (super.setState(iArr)) {
            invalidateSelf();
            z = true;
        } else {
            z = false;
        }
        return z;
    }

    @Override // android.support.v4.graphics.drawable.DrawableWrapperGingerbread, android.graphics.drawable.Drawable, android.support.v4.graphics.drawable.TintAwareDrawable
    public void setTint(int i) {
        if (isCompatTintEnabled()) {
            super.setTint(i);
        } else {
            this.mDrawable.setTint(i);
        }
    }

    @Override // android.support.v4.graphics.drawable.DrawableWrapperGingerbread, android.graphics.drawable.Drawable, android.support.v4.graphics.drawable.TintAwareDrawable
    public void setTintList(ColorStateList colorStateList) {
        if (isCompatTintEnabled()) {
            super.setTintList(colorStateList);
        } else {
            this.mDrawable.setTintList(colorStateList);
        }
    }

    @Override // android.support.v4.graphics.drawable.DrawableWrapperGingerbread, android.graphics.drawable.Drawable, android.support.v4.graphics.drawable.TintAwareDrawable
    public void setTintMode(PorterDuff.Mode mode) {
        if (isCompatTintEnabled()) {
            super.setTintMode(mode);
        } else {
            this.mDrawable.setTintMode(mode);
        }
    }
}
