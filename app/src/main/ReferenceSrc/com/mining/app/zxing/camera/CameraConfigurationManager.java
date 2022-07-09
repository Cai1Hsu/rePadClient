package com.mining.app.zxing.camera;

import android.content.Context;
import android.graphics.Point;
import android.hardware.Camera;
import android.os.Build;
import android.util.Log;
import android.view.Display;
import android.view.WindowManager;
import java.lang.reflect.Method;
import java.util.regex.Pattern;
import org.apache.commons.io.IOUtils;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.tools.ant.taskdefs.Execute;

/* loaded from: classes.dex */
final class CameraConfigurationManager {
    private static final int DESIRED_SHARPNESS = 30;
    private static final int TEN_DESIRED_ZOOM = 27;
    private Point cameraResolution;
    private final Context context;
    private int previewFormat;
    private String previewFormatString;
    private Point screenResolution;
    private static final String TAG = CameraConfigurationManager.class.getSimpleName();
    private static final Pattern COMMA_PATTERN = Pattern.compile(",");

    CameraConfigurationManager(Context context) {
        this.context = context;
    }

    void initFromCameraParameters(Camera camera) {
        Camera.Parameters parameters = camera.getParameters();
        this.previewFormat = parameters.getPreviewFormat();
        this.previewFormatString = parameters.get("preview-format");
        Log.d(TAG, "Default preview format: " + this.previewFormat + IOUtils.DIR_SEPARATOR_UNIX + this.previewFormatString);
        WindowManager manager = (WindowManager) this.context.getSystemService("window");
        Display display = manager.getDefaultDisplay();
        this.screenResolution = new Point(display.getWidth(), display.getHeight());
        Log.d(TAG, "Screen resolution: " + this.screenResolution);
        this.cameraResolution = getCameraResolution(parameters, this.screenResolution);
        Log.d(TAG, "Camera resolution: " + this.screenResolution);
    }

    void setDesiredCameraParameters(Camera camera) {
        Camera.Parameters parameters = camera.getParameters();
        Log.d(TAG, "Setting preview size: " + this.cameraResolution);
        parameters.setPreviewSize(this.cameraResolution.x, this.cameraResolution.y);
        setFlash(parameters);
        setZoom(parameters);
        camera.setParameters(parameters);
    }

    Point getCameraResolution() {
        return this.cameraResolution;
    }

    Point getScreenResolution() {
        return this.screenResolution;
    }

    int getPreviewFormat() {
        return this.previewFormat;
    }

    String getPreviewFormatString() {
        return this.previewFormatString;
    }

    private static Point getCameraResolution(Camera.Parameters parameters, Point screenResolution) {
        String previewSizeValueString = parameters.get("preview-size-values");
        if (previewSizeValueString == null) {
            previewSizeValueString = parameters.get("preview-size-value");
        }
        Point cameraResolution = null;
        if (previewSizeValueString != null) {
            Log.d(TAG, "preview-size-values parameter: " + previewSizeValueString);
            cameraResolution = findBestPreviewSizeValue(previewSizeValueString, screenResolution);
        }
        if (cameraResolution == null) {
            Point cameraResolution2 = new Point((screenResolution.x >> 3) << 3, (screenResolution.y >> 3) << 3);
            return cameraResolution2;
        }
        return cameraResolution;
    }

    private static Point findBestPreviewSizeValue(CharSequence previewSizeValueString, Point screenResolution) {
        int bestX = 0;
        int bestY = 0;
        int diff = Execute.INVALID;
        String[] split = COMMA_PATTERN.split(previewSizeValueString);
        int length = split.length;
        int i = 0;
        while (true) {
            if (i >= length) {
                break;
            }
            String previewSize = split[i].trim();
            int dimPosition = previewSize.indexOf(FTPReply.SERVICE_NOT_READY);
            if (dimPosition < 0) {
                Log.w(TAG, "Bad preview-size: " + previewSize);
            } else {
                try {
                    int newX = Integer.parseInt(previewSize.substring(0, dimPosition));
                    int newY = Integer.parseInt(previewSize.substring(dimPosition + 1));
                    int newDiff = Math.abs(newX - screenResolution.x) + Math.abs(newY - screenResolution.y);
                    if (newDiff == 0) {
                        bestX = newX;
                        bestY = newY;
                        break;
                    } else if (newDiff < diff) {
                        bestX = newX;
                        bestY = newY;
                        diff = newDiff;
                    }
                } catch (NumberFormatException e) {
                    Log.w(TAG, "Bad preview-size: " + previewSize);
                }
            }
            i++;
        }
        if (bestX > 0 && bestY > 0) {
            return new Point(bestX, bestY);
        }
        return null;
    }

    private static int findBestMotZoomValue(CharSequence stringValues, int tenDesiredZoom) {
        String[] split;
        int tenBestValue = 0;
        for (String stringValue : COMMA_PATTERN.split(stringValues)) {
            try {
                double value = Double.parseDouble(stringValue.trim());
                int tenValue = (int) (10.0d * value);
                if (Math.abs(tenDesiredZoom - value) < Math.abs(tenDesiredZoom - tenBestValue)) {
                    tenBestValue = tenValue;
                }
            } catch (NumberFormatException e) {
                return tenDesiredZoom;
            }
        }
        return tenBestValue;
    }

    private void setFlash(Camera.Parameters parameters) {
        if (Build.MODEL.contains("Behold II") && CameraManager.SDK_INT == 3) {
            parameters.set("flash-value", 1);
        } else {
            parameters.set("flash-value", 2);
        }
        parameters.set("flash-mode", "off");
    }

    private void setZoom(Camera.Parameters parameters) {
        String zoomSupportedString = parameters.get("zoom-supported");
        if (zoomSupportedString == null || Boolean.parseBoolean(zoomSupportedString)) {
            int tenDesiredZoom = 27;
            String maxZoomString = parameters.get("max-zoom");
            if (maxZoomString != null) {
                try {
                    int tenMaxZoom = (int) (10.0d * Double.parseDouble(maxZoomString));
                    if (27 > tenMaxZoom) {
                        tenDesiredZoom = tenMaxZoom;
                    }
                } catch (NumberFormatException e) {
                    Log.w(TAG, "Bad max-zoom: " + maxZoomString);
                }
            }
            String takingPictureZoomMaxString = parameters.get("taking-picture-zoom-max");
            if (takingPictureZoomMaxString != null) {
                try {
                    int tenMaxZoom2 = Integer.parseInt(takingPictureZoomMaxString);
                    if (tenDesiredZoom > tenMaxZoom2) {
                        tenDesiredZoom = tenMaxZoom2;
                    }
                } catch (NumberFormatException e2) {
                    Log.w(TAG, "Bad taking-picture-zoom-max: " + takingPictureZoomMaxString);
                }
            }
            String motZoomValuesString = parameters.get("mot-zoom-values");
            if (motZoomValuesString != null) {
                tenDesiredZoom = findBestMotZoomValue(motZoomValuesString, tenDesiredZoom);
            }
            String motZoomStepString = parameters.get("mot-zoom-step");
            if (motZoomStepString != null) {
                try {
                    double motZoomStep = Double.parseDouble(motZoomStepString.trim());
                    int tenZoomStep = (int) (10.0d * motZoomStep);
                    if (tenZoomStep > 1) {
                        tenDesiredZoom -= tenDesiredZoom % tenZoomStep;
                    }
                } catch (NumberFormatException e3) {
                }
            }
            if (maxZoomString != null || motZoomValuesString != null) {
                parameters.set("zoom", String.valueOf(tenDesiredZoom / 10.0d));
            }
            if (takingPictureZoomMaxString != null) {
                parameters.set("taking-picture-zoom", tenDesiredZoom);
            }
        }
    }

    public static int getDesiredSharpness() {
        return 30;
    }

    protected void setDisplayOrientation(Camera camera, int angle) {
        try {
            Method downPolymorphic = camera.getClass().getMethod("setDisplayOrientation", Integer.TYPE);
            if (downPolymorphic != null) {
                downPolymorphic.invoke(camera, Integer.valueOf(angle));
            }
        } catch (Exception e) {
        }
    }
}
