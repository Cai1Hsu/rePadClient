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

/* loaded from: classes.dex */
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

    public DragView(Context context, Bitmap bitmap, int registrationX, int registrationY, int left, int top, int width, int height) {
        super(context);
        this.mWindowManager = (WindowManager) context.getSystemService("window");
        Matrix scale = new Matrix();
        float scaleFactor = width;
        float scaleFactor2 = (0.0f + scaleFactor) / scaleFactor;
        this.mScale = scaleFactor2;
        scale.setScale(scaleFactor2, scaleFactor2);
        this.mBitmap = Bitmap.createBitmap(bitmap, left, top, width, height, scale, true);
        this.mRegistrationX = registrationX + 0;
        this.mRegistrationY = registrationY + 0;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(this.mBitmap.getWidth(), this.mBitmap.getHeight());
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        float scale = this.mAnimationScale;
        if (scale < 0.999f) {
            float width = this.mBitmap.getWidth();
            float offset = (width - (width * scale)) / 2.0f;
            canvas.translate(offset, offset);
            canvas.scale(scale, scale);
        }
        canvas.drawBitmap(this.mBitmap, 0.0f, 0.0f, this.mPaint);
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mBitmap.recycle();
    }

    public void setPaint(Paint paint) {
        this.mPaint = paint;
        invalidate();
    }

    public void show(IBinder windowToken, int touchX, int touchY) {
        WindowManager.LayoutParams lp = new WindowManager.LayoutParams(-2, -2, touchX - this.mRegistrationX, touchY - this.mRegistrationY, PointerIconCompat.TYPE_HAND, 768, -3);
        lp.gravity = 51;
        lp.token = windowToken;
        lp.setTitle("DragView");
        this.mLayoutParams = lp;
        this.mWindowManager.addView(this, lp);
    }

    void move(int touchX, int touchY) {
        WindowManager.LayoutParams lp = this.mLayoutParams;
        lp.x = touchX - this.mRegistrationX;
        lp.y = touchY - this.mRegistrationY;
        this.mWindowManager.updateViewLayout(this, lp);
    }

    void remove() {
        this.mWindowManager.removeView(this);
    }
}
