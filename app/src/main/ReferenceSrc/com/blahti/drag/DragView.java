package com.blahti.drag;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.os.IBinder;
import android.support.v4.view.PointerIconCompat;
import android.view.View;
import android.view.WindowManager;

/* loaded from: classes.jar:com/blahti/drag/DragView.class */
public class DragView extends View {
    private static final int DRAG_SCALE = 0;
    private float mAnimationScale = 1.0f;
    private Bitmap mBitmap;
    private WindowManager.LayoutParams mLayoutParams;
    private Paint mPaint;
    private int mRegistrationX;
    private int mRegistrationY;
    private float mScale;
    private WindowManager mWindowManager;

    public DragView(Context context, Bitmap bitmap, int i, int i2, int i3, int i4, int i5, int i6) {
        super(context);
        this.mWindowManager = (WindowManager) context.getSystemService("window");
        Matrix matrix = new Matrix();
        float f = i5;
        float f2 = (0.0f + f) / f;
        this.mScale = f2;
        matrix.setScale(f2, f2);
        this.mBitmap = Bitmap.createBitmap(bitmap, i3, i4, i5, i6, matrix, true);
        this.mRegistrationX = i + 0;
        this.mRegistrationY = i2 + 0;
    }

    void move(int i, int i2) {
        WindowManager.LayoutParams layoutParams = this.mLayoutParams;
        layoutParams.x = i - this.mRegistrationX;
        layoutParams.y = i2 - this.mRegistrationY;
        this.mWindowManager.updateViewLayout(this, layoutParams);
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mBitmap.recycle();
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        float f = this.mAnimationScale;
        if (f < 0.999f) {
            float width = this.mBitmap.getWidth();
            float f2 = (width - (width * f)) / 2.0f;
            canvas.translate(f2, f2);
            canvas.scale(f, f);
        }
        canvas.drawBitmap(this.mBitmap, 0.0f, 0.0f, this.mPaint);
    }

    @Override // android.view.View
    protected void onMeasure(int i, int i2) {
        setMeasuredDimension(this.mBitmap.getWidth(), this.mBitmap.getHeight());
    }

    void remove() {
        this.mWindowManager.removeView(this);
    }

    public void setPaint(Paint paint) {
        this.mPaint = paint;
        invalidate();
    }

    public void show(IBinder iBinder, int i, int i2) {
        WindowManager.LayoutParams layoutParams = new WindowManager.LayoutParams(-2, -2, i - this.mRegistrationX, i2 - this.mRegistrationY, PointerIconCompat.TYPE_HAND, 768, -3);
        layoutParams.gravity = 51;
        layoutParams.token = iBinder;
        layoutParams.setTitle("DragView");
        this.mLayoutParams = layoutParams;
        this.mWindowManager.addView(this, layoutParams);
    }
}
