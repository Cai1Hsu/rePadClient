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

/* loaded from: classes.jar:com/mining/app/zxing/camera/CameraConfigurationManager.class */
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

    private static int findBestMotZoomValue(CharSequence charSequence, int i) {
        int i2 = 0;
        String[] split = COMMA_PATTERN.split(charSequence);
        int length = split.length;
        int i3 = 0;
        while (i3 < length) {
            try {
                double parseDouble = Double.parseDouble(split[i3].trim());
                int i4 = (int) (10.0d * parseDouble);
                int i5 = i2;
                if (Math.abs(i - parseDouble) < Math.abs(i - i2)) {
                    i5 = i4;
                }
                i3++;
                i2 = i5;
            } catch (NumberFormatException e) {
            }
        }
        i = i2;
        return i;
    }

    private static Point findBestPreviewSizeValue(CharSequence charSequence, Point point) {
        int i;
        int i2 = 0;
        int i3 = 0;
        int i4 = Integer.MAX_VALUE;
        String[] split = COMMA_PATTERN.split(charSequence);
        int length = split.length;
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                break;
            }
            String trim = split[i5].trim();
            int indexOf = trim.indexOf(120);
            if (indexOf < 0) {
                Log.w(TAG, "Bad preview-size: " + trim);
                i = i4;
            } else {
                try {
                    int parseInt = Integer.parseInt(trim.substring(0, indexOf));
                    int parseInt2 = Integer.parseInt(trim.substring(indexOf + 1));
                    int abs = Math.abs(parseInt - point.x) + Math.abs(parseInt2 - point.y);
                    if (abs == 0) {
                        i2 = parseInt;
                        i3 = parseInt2;
                        break;
                    }
                    i = i4;
                    if (abs < i4) {
                        i2 = parseInt;
                        i3 = parseInt2;
                        i = abs;
                    }
                } catch (NumberFormatException e) {
                    Log.w(TAG, "Bad preview-size: " + trim);
                    i = i4;
                }
            }
            i5++;
            i4 = i;
        }
        return (i2 <= 0 || i3 <= 0) ? null : new Point(i2, i3);
    }

    private static Point getCameraResolution(Camera.Parameters parameters, Point point) {
        String str = parameters.get("preview-size-values");
        String str2 = str;
        if (str == null) {
            str2 = parameters.get("preview-size-value");
        }
        Point point2 = null;
        if (str2 != null) {
            Log.d(TAG, "preview-size-values parameter: " + str2);
            point2 = findBestPreviewSizeValue(str2, point);
        }
        Point point3 = point2;
        if (point2 == null) {
            point3 = new Point((point.x >> 3) << 3, (point.y >> 3) << 3);
        }
        return point3;
    }

    public static int getDesiredSharpness() {
        return 30;
    }

    private void setFlash(Camera.Parameters parameters) {
        if (!Build.MODEL.contains("Behold II") || CameraManager.SDK_INT != 3) {
            parameters.set("flash-value", 2);
        } else {
            parameters.set("flash-value", 1);
        }
        parameters.set("flash-mode", "off");
    }

    private void setZoom(Camera.Parameters parameters) {
        String str = parameters.get("zoom-supported");
        if (str == null || Boolean.parseBoolean(str)) {
            String str2 = parameters.get("max-zoom");
            int i = 27;
            if (str2 != null) {
                try {
                    int parseDouble = (int) (10.0d * Double.parseDouble(str2));
                    i = 27;
                    if (27 > parseDouble) {
                        i = parseDouble;
                    }
                } catch (NumberFormatException e) {
                    Log.w(TAG, "Bad max-zoom: " + str2);
                    i = 27;
                }
            }
            String str3 = parameters.get("taking-picture-zoom-max");
            int i2 = i;
            if (str3 != null) {
                try {
                    int parseInt = Integer.parseInt(str3);
                    i2 = i;
                    if (i > parseInt) {
                        i2 = parseInt;
                    }
                } catch (NumberFormatException e2) {
                    Log.w(TAG, "Bad taking-picture-zoom-max: " + str3);
                    i2 = i;
                }
            }
            String str4 = parameters.get("mot-zoom-values");
            int i3 = i2;
            if (str4 != null) {
                i3 = findBestMotZoomValue(str4, i2);
            }
            String str5 = parameters.get("mot-zoom-step");
            int i4 = i3;
            if (str5 != null) {
                try {
                    int parseDouble2 = (int) (10.0d * Double.parseDouble(str5.trim()));
                    i4 = i3;
                    if (parseDouble2 > 1) {
                        i4 = i3 - (i3 % parseDouble2);
                    }
                } catch (NumberFormatException e3) {
                    i4 = i3;
                }
            }
            if (str2 != null || str4 != null) {
                parameters.set("zoom", String.valueOf(i4 / 10.0d));
            }
            if (str3 == null) {
                return;
            }
            parameters.set("taking-picture-zoom", i4);
        }
    }

    Point getCameraResolution() {
        return this.cameraResolution;
    }

    int getPreviewFormat() {
        return this.previewFormat;
    }

    String getPreviewFormatString() {
        return this.previewFormatString;
    }

    Point getScreenResolution() {
        return this.screenResolution;
    }

    void initFromCameraParameters(Camera camera) {
        Camera.Parameters parameters = camera.getParameters();
        this.previewFormat = parameters.getPreviewFormat();
        this.previewFormatString = parameters.get("preview-format");
        Log.d(TAG, "Default preview format: " + this.previewFormat + '/' + this.previewFormatString);
        Display defaultDisplay = ((WindowManager) this.context.getSystemService("window")).getDefaultDisplay();
        this.screenResolution = new Point(defaultDisplay.getWidth(), defaultDisplay.getHeight());
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

    protected void setDisplayOrientation(Camera camera, int i) {
        try {
            Method method = camera.getClass().getMethod("setDisplayOrientation", Integer.TYPE);
            if (method == null) {
                return;
            }
            method.invoke(camera, Integer.valueOf(i));
        } catch (Exception e) {
        }
    }
}
