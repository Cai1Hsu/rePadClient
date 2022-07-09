package com.pgyersdk.c;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/* loaded from: classes.dex */
public final class i {
    public static Bitmap a(String str) {
        try {
            return BitmapFactory.decodeStream(new FileInputStream(str));
        } catch (FileNotFoundException e) {
            return null;
        }
    }

    public static Boolean a(Bitmap bitmap, String str) {
        FileOutputStream fileOutputStream;
        Exception e;
        if (bitmap == null) {
            return false;
        }
        try {
            fileOutputStream = new FileOutputStream(str);
        } catch (Exception e2) {
            e = e2;
            fileOutputStream = null;
        }
        try {
            bitmap.compress(Bitmap.CompressFormat.JPEG, 100, fileOutputStream);
            fileOutputStream.close();
            return true;
        } catch (Exception e3) {
            e = e3;
            Log.e("PgyerSDK", "Could not save screenshot.", e);
            if (fileOutputStream != null) {
                try {
                    fileOutputStream.close();
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
            }
            return false;
        }
    }
}
