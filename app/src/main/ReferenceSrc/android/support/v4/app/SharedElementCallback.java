package android.support.v4.app;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.View;
import android.widget.ImageView;
import java.util.List;
import java.util.Map;

/* loaded from: classes.jar:android/support/v4/app/SharedElementCallback.class */
public abstract class SharedElementCallback {
    private static final String BUNDLE_SNAPSHOT_BITMAP = "sharedElement:snapshot:bitmap";
    private static final String BUNDLE_SNAPSHOT_IMAGE_MATRIX = "sharedElement:snapshot:imageMatrix";
    private static final String BUNDLE_SNAPSHOT_IMAGE_SCALETYPE = "sharedElement:snapshot:imageScaleType";
    private static int MAX_IMAGE_SIZE = 1048576;
    private Matrix mTempMatrix;

    /* loaded from: classes.jar:android/support/v4/app/SharedElementCallback$OnSharedElementsReadyListener.class */
    public interface OnSharedElementsReadyListener {
        void onSharedElementsReady();
    }

    private static Bitmap createDrawableBitmap(Drawable drawable) {
        Bitmap bitmap;
        int intrinsicWidth = drawable.getIntrinsicWidth();
        int intrinsicHeight = drawable.getIntrinsicHeight();
        if (intrinsicWidth <= 0 || intrinsicHeight <= 0) {
            bitmap = null;
        } else {
            float min = Math.min(1.0f, MAX_IMAGE_SIZE / (intrinsicWidth * intrinsicHeight));
            if (!(drawable instanceof BitmapDrawable) || min != 1.0f) {
                int i = (int) (intrinsicWidth * min);
                int i2 = (int) (intrinsicHeight * min);
                Bitmap createBitmap = Bitmap.createBitmap(i, i2, Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(createBitmap);
                Rect bounds = drawable.getBounds();
                int i3 = bounds.left;
                int i4 = bounds.top;
                int i5 = bounds.right;
                int i6 = bounds.bottom;
                drawable.setBounds(0, 0, i, i2);
                drawable.draw(canvas);
                drawable.setBounds(i3, i4, i5, i6);
                bitmap = createBitmap;
            } else {
                bitmap = ((BitmapDrawable) drawable).getBitmap();
            }
        }
        return bitmap;
    }

    /* JADX DEBUG: Multi-variable search result rejected for r0v52, resolved type: android.os.Bundle */
    /* JADX WARN: Multi-variable type inference failed */
    public Parcelable onCaptureSharedElementSnapshot(View view, Matrix matrix, RectF rectF) {
        Bitmap bitmap;
        Bitmap createDrawableBitmap;
        if (view instanceof ImageView) {
            ImageView imageView = (ImageView) view;
            Drawable drawable = imageView.getDrawable();
            Drawable background = imageView.getBackground();
            if (drawable != null && background == null && (createDrawableBitmap = createDrawableBitmap(drawable)) != null) {
                Bundle bundle = new Bundle();
                bundle.putParcelable(BUNDLE_SNAPSHOT_BITMAP, createDrawableBitmap);
                bundle.putString(BUNDLE_SNAPSHOT_IMAGE_SCALETYPE, imageView.getScaleType().toString());
                bitmap = bundle;
                if (imageView.getScaleType() == ImageView.ScaleType.MATRIX) {
                    Matrix imageMatrix = imageView.getImageMatrix();
                    float[] fArr = new float[9];
                    imageMatrix.getValues(fArr);
                    bundle.putFloatArray(BUNDLE_SNAPSHOT_IMAGE_MATRIX, fArr);
                    bitmap = bundle;
                }
                return bitmap;
            }
        }
        int round = Math.round(rectF.width());
        int round2 = Math.round(rectF.height());
        Bitmap bitmap2 = null;
        if (round > 0) {
            bitmap2 = null;
            if (round2 > 0) {
                float min = Math.min(1.0f, MAX_IMAGE_SIZE / (round * round2));
                int i = (int) (round * min);
                int i2 = (int) (round2 * min);
                if (this.mTempMatrix == null) {
                    this.mTempMatrix = new Matrix();
                }
                this.mTempMatrix.set(matrix);
                this.mTempMatrix.postTranslate(-rectF.left, -rectF.top);
                this.mTempMatrix.postScale(min, min);
                bitmap2 = Bitmap.createBitmap(i, i2, Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(bitmap2);
                canvas.concat(this.mTempMatrix);
                view.draw(canvas);
            }
        }
        bitmap = bitmap2;
        return bitmap;
    }

    public View onCreateSnapshotView(Context context, Parcelable parcelable) {
        ImageView imageView;
        ImageView imageView2 = null;
        if (parcelable instanceof Bundle) {
            Bundle bundle = (Bundle) parcelable;
            Bitmap bitmap = (Bitmap) bundle.getParcelable(BUNDLE_SNAPSHOT_BITMAP);
            if (bitmap == null) {
                imageView = null;
                return imageView;
            }
            ImageView imageView3 = new ImageView(context);
            imageView3.setImageBitmap(bitmap);
            imageView3.setScaleType(ImageView.ScaleType.valueOf(bundle.getString(BUNDLE_SNAPSHOT_IMAGE_SCALETYPE)));
            imageView2 = imageView3;
            if (imageView3.getScaleType() == ImageView.ScaleType.MATRIX) {
                float[] floatArray = bundle.getFloatArray(BUNDLE_SNAPSHOT_IMAGE_MATRIX);
                Matrix matrix = new Matrix();
                matrix.setValues(floatArray);
                imageView3.setImageMatrix(matrix);
                imageView2 = imageView3;
            }
        } else if (parcelable instanceof Bitmap) {
            imageView2 = new ImageView(context);
            imageView2.setImageBitmap((Bitmap) parcelable);
        }
        imageView = imageView2;
        return imageView;
    }

    public void onMapSharedElements(List<String> list, Map<String, View> map) {
    }

    public void onRejectSharedElements(List<View> list) {
    }

    public void onSharedElementEnd(List<String> list, List<View> list2, List<View> list3) {
    }

    public void onSharedElementStart(List<String> list, List<View> list2, List<View> list3) {
    }

    public void onSharedElementsArrived(List<String> list, List<View> list2, OnSharedElementsReadyListener onSharedElementsReadyListener) {
        onSharedElementsReadyListener.onSharedElementsReady();
    }
}
