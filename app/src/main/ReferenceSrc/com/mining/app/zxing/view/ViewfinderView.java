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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    public ViewfinderView(Context context, AttributeSet attrs) {
        super(context, attrs);
        Resources resources = getResources();
        this.maskColor = resources.getColor(R.color.viewfinder_mask);
        this.resultColor = resources.getColor(R.color.result_view);
        this.frameColor = resources.getColor(R.color.viewfinder_frame);
        this.laserColor = resources.getColor(R.color.viewfinder_laser);
        this.resultPointColor = resources.getColor(R.color.possible_result_points);
    }

    public void setCameraManager(CameraManager cameraManager) {
        this.cameraManager = cameraManager;
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        Rect frame = this.cameraManager.getFramingRect();
        if (frame != null) {
            int width = canvas.getWidth();
            int height = canvas.getHeight();
            this.paint.setColor(this.resultBitmap != null ? this.resultColor : this.maskColor);
            canvas.drawRect(0.0f, 0.0f, width, frame.top, this.paint);
            canvas.drawRect(0.0f, frame.top, frame.left, frame.bottom + 1, this.paint);
            canvas.drawRect(frame.right + 1, frame.top, width, frame.bottom + 1, this.paint);
            canvas.drawRect(0.0f, frame.bottom + 1, width, height, this.paint);
            if (this.resultBitmap != null) {
                this.paint.setAlpha(CURRENT_POINT_OPACITY);
                canvas.drawBitmap(this.resultBitmap, (Rect) null, frame, this.paint);
                return;
            }
            this.paint.setColor(this.frameColor);
            canvas.drawRect(frame.left, frame.top, frame.right + 1, frame.top + 2, this.paint);
            canvas.drawRect(frame.left, frame.top + 2, frame.left + 2, frame.bottom - 1, this.paint);
            canvas.drawRect(frame.right - 1, frame.top, frame.right + 1, frame.bottom - 1, this.paint);
            canvas.drawRect(frame.left, frame.bottom - 1, frame.right + 1, frame.bottom + 1, this.paint);
            this.paint.setColor(this.laserColor);
            this.paint.setAlpha(SCANNER_ALPHA[this.scannerAlpha]);
            this.scannerAlpha = (this.scannerAlpha + 1) % SCANNER_ALPHA.length;
            int middle = (frame.height() / 2) + frame.top;
            canvas.drawRect(frame.left + 2, middle - 1, frame.right - 1, middle + 2, this.paint);
            Rect previewFrame = this.cameraManager.getFramingRectInPreview();
            float scaleX = frame.width() / previewFrame.width();
            float scaleY = frame.height() / previewFrame.height();
            List<ResultPoint> currentPossible = this.possibleResultPoints;
            List<ResultPoint> currentLast = this.lastPossibleResultPoints;
            int frameLeft = frame.left;
            int frameTop = frame.top;
            if (currentPossible.isEmpty()) {
                this.lastPossibleResultPoints = null;
            } else {
                this.possibleResultPoints = new ArrayList(5);
                this.lastPossibleResultPoints = currentPossible;
                this.paint.setAlpha(CURRENT_POINT_OPACITY);
                this.paint.setColor(this.resultPointColor);
                synchronized (currentPossible) {
                    for (ResultPoint point : currentPossible) {
                        canvas.drawCircle(((int) (point.getX() * scaleX)) + frameLeft, ((int) (point.getY() * scaleY)) + frameTop, 6.0f, this.paint);
                    }
                }
            }
            if (currentLast != null) {
                this.paint.setAlpha(80);
                this.paint.setColor(this.resultPointColor);
                synchronized (currentLast) {
                    for (ResultPoint point2 : currentLast) {
                        canvas.drawCircle(((int) (point2.getX() * scaleX)) + frameLeft, ((int) (point2.getY() * scaleY)) + frameTop, 3.0f, this.paint);
                    }
                }
            }
            postInvalidateDelayed(ANIMATION_DELAY, frame.left - 6, frame.top - 6, frame.right + 6, frame.bottom + 6);
        }
    }

    public void drawViewfinder() {
        Bitmap resultBitmap = this.resultBitmap;
        this.resultBitmap = null;
        if (resultBitmap != null) {
            resultBitmap.recycle();
        }
        invalidate();
    }

    public void drawResultBitmap(Bitmap barcode) {
        this.resultBitmap = barcode;
        invalidate();
    }

    public void addPossibleResultPoint(ResultPoint point) {
        List<ResultPoint> points = this.possibleResultPoints;
        synchronized (points) {
            points.add(point);
            int size = points.size();
            if (size > 20) {
                points.subList(0, size - 10).clear();
            }
        }
    }
}
