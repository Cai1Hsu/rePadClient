package com.mining.app.zxing.view;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import com.google.zxing.ResultPoint;
import com.launcher.activity.R;
import com.mining.app.zxing.camera.CameraManager;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.jar:com/mining/app/zxing/view/ViewfinderView.class */
public final class ViewfinderView extends View {
    private static final long ANIMATION_DELAY = 80;
    private static final int CURRENT_POINT_OPACITY = 160;
    private static final int MAX_RESULT_POINTS = 20;
    private static final int POINT_SIZE = 6;
    private static final int[] SCANNER_ALPHA = {0, 64, 128, 192, 255, 192, 128, 64};
    private CameraManager cameraManager;
    private final int frameColor;
    private final int laserColor;
    private final int maskColor;
    private Bitmap resultBitmap;
    private final int resultColor;
    private final int resultPointColor;
    private final Paint paint = new Paint(1);
    private int scannerAlpha = 0;
    private List<ResultPoint> possibleResultPoints = new ArrayList(5);
    private List<ResultPoint> lastPossibleResultPoints = null;

    public ViewfinderView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        Resources resources = getResources();
        this.maskColor = resources.getColor(R.color.viewfinder_mask);
        this.resultColor = resources.getColor(R.color.result_view);
        this.frameColor = resources.getColor(R.color.viewfinder_frame);
        this.laserColor = resources.getColor(R.color.viewfinder_laser);
        this.resultPointColor = resources.getColor(R.color.possible_result_points);
    }

    public void addPossibleResultPoint(ResultPoint resultPoint) {
        List<ResultPoint> list = this.possibleResultPoints;
        synchronized (list) {
            list.add(resultPoint);
            int size = list.size();
            if (size > 20) {
                list.subList(0, size - 10).clear();
            }
        }
    }

    public void drawResultBitmap(Bitmap bitmap) {
        this.resultBitmap = bitmap;
        invalidate();
    }

    public void drawViewfinder() {
        Bitmap bitmap = this.resultBitmap;
        this.resultBitmap = null;
        if (bitmap != null) {
            bitmap.recycle();
        }
        invalidate();
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        Rect framingRect = this.cameraManager.getFramingRect();
        if (framingRect == null) {
            return;
        }
        int width = canvas.getWidth();
        int height = canvas.getHeight();
        this.paint.setColor(this.resultBitmap != null ? this.resultColor : this.maskColor);
        canvas.drawRect(0.0f, 0.0f, width, framingRect.top, this.paint);
        canvas.drawRect(0.0f, framingRect.top, framingRect.left, framingRect.bottom + 1, this.paint);
        canvas.drawRect(framingRect.right + 1, framingRect.top, width, framingRect.bottom + 1, this.paint);
        canvas.drawRect(0.0f, framingRect.bottom + 1, width, height, this.paint);
        if (this.resultBitmap != null) {
            this.paint.setAlpha(CURRENT_POINT_OPACITY);
            canvas.drawBitmap(this.resultBitmap, (Rect) null, framingRect, this.paint);
            return;
        }
        this.paint.setColor(this.frameColor);
        canvas.drawRect(framingRect.left, framingRect.top, framingRect.right + 1, framingRect.top + 2, this.paint);
        canvas.drawRect(framingRect.left, framingRect.top + 2, framingRect.left + 2, framingRect.bottom - 1, this.paint);
        canvas.drawRect(framingRect.right - 1, framingRect.top, framingRect.right + 1, framingRect.bottom - 1, this.paint);
        canvas.drawRect(framingRect.left, framingRect.bottom - 1, framingRect.right + 1, framingRect.bottom + 1, this.paint);
        this.paint.setColor(this.laserColor);
        this.paint.setAlpha(SCANNER_ALPHA[this.scannerAlpha]);
        this.scannerAlpha = (this.scannerAlpha + 1) % SCANNER_ALPHA.length;
        int height2 = (framingRect.height() / 2) + framingRect.top;
        canvas.drawRect(framingRect.left + 2, height2 - 1, framingRect.right - 1, height2 + 2, this.paint);
        Rect framingRectInPreview = this.cameraManager.getFramingRectInPreview();
        float width2 = framingRect.width() / framingRectInPreview.width();
        float height3 = framingRect.height() / framingRectInPreview.height();
        List<ResultPoint> list = this.possibleResultPoints;
        List<ResultPoint> list2 = this.lastPossibleResultPoints;
        int i = framingRect.left;
        int i2 = framingRect.top;
        if (list.isEmpty()) {
            this.lastPossibleResultPoints = null;
        } else {
            this.possibleResultPoints = new ArrayList(5);
            this.lastPossibleResultPoints = list;
            this.paint.setAlpha(CURRENT_POINT_OPACITY);
            this.paint.setColor(this.resultPointColor);
            synchronized (list) {
                for (ResultPoint resultPoint : list) {
                    canvas.drawCircle(((int) (resultPoint.getX() * width2)) + i, ((int) (resultPoint.getY() * height3)) + i2, 6.0f, this.paint);
                }
            }
        }
        if (list2 != null) {
            this.paint.setAlpha(80);
            this.paint.setColor(this.resultPointColor);
            synchronized (list2) {
                for (ResultPoint resultPoint2 : list2) {
                    canvas.drawCircle(((int) (resultPoint2.getX() * width2)) + i, ((int) (resultPoint2.getY() * height3)) + i2, 3.0f, this.paint);
                }
            }
        }
        postInvalidateDelayed(ANIMATION_DELAY, framingRect.left - 6, framingRect.top - 6, framingRect.right + 6, framingRect.bottom + 6);
    }

    public void setCameraManager(CameraManager cameraManager) {
        this.cameraManager = cameraManager;
    }
}
