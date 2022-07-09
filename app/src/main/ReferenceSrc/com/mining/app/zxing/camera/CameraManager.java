package com.mining.app.zxing.camera;

import android.content.Context;
import android.graphics.Point;
import android.graphics.Rect;
import android.hardware.Camera;
import android.os.Build;
import android.os.Handler;
import android.util.Log;
import android.view.SurfaceHolder;
import java.io.IOException;

/* loaded from: classes.jar:com/mining/app/zxing/camera/CameraManager.class */
public final class CameraManager {
    private static final int MAX_FRAME_HEIGHT = 675;
    private static final int MAX_FRAME_WIDTH = 1200;
    private static final int MIN_FRAME_HEIGHT = 240;
    private static final int MIN_FRAME_WIDTH = 240;
    static final int SDK_INT;
    private static final String TAG = CameraManager.class.getSimpleName();
    private static CameraManager cameraManager;
    private final AutoFocusCallback autoFocusCallback;
    private Camera camera;
    private final CameraConfigurationManager configManager;
    private final Context context;
    private Rect framingRect;
    private Rect framingRectInPreview;
    private boolean initialized;
    private final PreviewCallback previewCallback;
    private boolean previewing;
    private final boolean useOneShotPreviewCallback;

    static {
        int i;
        try {
            i = Integer.parseInt(Build.VERSION.SDK);
        } catch (NumberFormatException e) {
            i = 10000;
        }
        SDK_INT = i;
    }

    private CameraManager(Context context) {
        this.context = context;
        this.configManager = new CameraConfigurationManager(context);
        this.useOneShotPreviewCallback = Integer.parseInt(Build.VERSION.SDK) > 3;
        this.previewCallback = new PreviewCallback(this.configManager, this.useOneShotPreviewCallback);
        this.autoFocusCallback = new AutoFocusCallback();
    }

    private static int findDesiredDimensionInRange(int i, int i2, int i3) {
        int i4 = (i * 5) / 8;
        if (i4 >= i2) {
            i2 = i4 > i3 ? i3 : i4;
        }
        return i2;
    }

    public static CameraManager get() {
        return cameraManager;
    }

    public static void init(Context context) {
        if (cameraManager == null) {
            cameraManager = new CameraManager(context);
        }
    }

    public PlanarYUVLuminanceSource buildLuminanceSource(byte[] bArr, int i, int i2) {
        PlanarYUVLuminanceSource planarYUVLuminanceSource;
        Rect framingRectInPreview = getFramingRectInPreview();
        int previewFormat = this.configManager.getPreviewFormat();
        String previewFormatString = this.configManager.getPreviewFormatString();
        Log.i(TAG, "width = " + i + " height = " + i2 + " rect.left = " + framingRectInPreview.left + " rect.top = " + framingRectInPreview.top + " rect.width = " + framingRectInPreview.width() + " rect.height = " + framingRectInPreview.height());
        switch (previewFormat) {
            case 16:
            case 17:
                planarYUVLuminanceSource = new PlanarYUVLuminanceSource(bArr, i, i2, framingRectInPreview.left, framingRectInPreview.top, framingRectInPreview.width(), framingRectInPreview.height());
                break;
            default:
                if (!"yuv420p".equals(previewFormatString)) {
                    throw new IllegalArgumentException("Unsupported picture format: " + previewFormat + '/' + previewFormatString);
                }
                planarYUVLuminanceSource = new PlanarYUVLuminanceSource(bArr, i, i2, framingRectInPreview.left, framingRectInPreview.top, framingRectInPreview.width(), framingRectInPreview.height());
                break;
        }
        return planarYUVLuminanceSource;
    }

    public void closeDriver() {
        if (this.camera != null) {
            FlashlightManager.disableFlashlight();
            this.camera.release();
            this.camera = null;
        }
    }

    public Context getContext() {
        return this.context;
    }

    public Rect getFramingRect() {
        Point screenResolution;
        Rect rect = null;
        synchronized (this) {
            if (this.framingRect == null) {
                if (this.camera != null && (screenResolution = this.configManager.getScreenResolution()) != null) {
                    int findDesiredDimensionInRange = findDesiredDimensionInRange(screenResolution.x, 240, MAX_FRAME_WIDTH);
                    int findDesiredDimensionInRange2 = findDesiredDimensionInRange(screenResolution.y, 240, MAX_FRAME_HEIGHT);
                    int i = (screenResolution.x - findDesiredDimensionInRange) / 2;
                    int i2 = (screenResolution.y - findDesiredDimensionInRange2) / 2;
                    this.framingRect = new Rect(i, i2, i + findDesiredDimensionInRange, i2 + findDesiredDimensionInRange2);
                    Log.d(TAG, "Calculated framing rect: " + this.framingRect);
                }
            }
            rect = this.framingRect;
        }
        return rect;
    }

    public Rect getFramingRectInPreview() {
        if (this.framingRectInPreview == null) {
            Rect rect = new Rect(getFramingRect());
            Point cameraResolution = this.configManager.getCameraResolution();
            Point screenResolution = this.configManager.getScreenResolution();
            rect.left = (rect.left * cameraResolution.x) / screenResolution.x;
            rect.right = (rect.right * cameraResolution.x) / screenResolution.x;
            rect.top = (rect.top * cameraResolution.y) / screenResolution.y;
            rect.bottom = (rect.bottom * cameraResolution.y) / screenResolution.y;
            Log.i(TAG, "rect = " + rect);
            this.framingRectInPreview = rect;
        }
        return this.framingRectInPreview;
    }

    public void openDriver(SurfaceHolder surfaceHolder) throws IOException {
        if (this.camera == null) {
            this.camera = Camera.open();
            if (this.camera == null) {
                throw new IOException();
            }
            this.camera.setPreviewDisplay(surfaceHolder);
            if (!this.initialized) {
                this.initialized = true;
                this.configManager.initFromCameraParameters(this.camera);
            }
            this.configManager.setDesiredCameraParameters(this.camera);
            FlashlightManager.enableFlashlight();
        }
    }

    public void requestAutoFocus(Handler handler, int i) {
        if (this.camera == null || !this.previewing) {
            return;
        }
        this.autoFocusCallback.setHandler(handler, i);
        this.camera.autoFocus(this.autoFocusCallback);
    }

    public void requestPreviewFrame(Handler handler, int i) {
        if (this.camera == null || !this.previewing) {
            return;
        }
        this.previewCallback.setHandler(handler, i);
        if (this.useOneShotPreviewCallback) {
            this.camera.setOneShotPreviewCallback(this.previewCallback);
        } else {
            this.camera.setPreviewCallback(this.previewCallback);
        }
    }

    public void startPreview() {
        if (this.camera == null || this.previewing) {
            return;
        }
        this.camera.startPreview();
        this.previewing = true;
    }

    public void stopPreview() {
        if (this.camera == null || !this.previewing) {
            return;
        }
        if (!this.useOneShotPreviewCallback) {
            this.camera.setPreviewCallback(null);
        }
        this.camera.stopPreview();
        this.previewCallback.setHandler(null, 0);
        this.autoFocusCallback.setHandler(null, 0);
        this.previewing = false;
    }
}
