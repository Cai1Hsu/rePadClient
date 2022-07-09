package com.pgyersdk.c;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/* loaded from: classes.jar:com/pgyersdk/c/i.class */
public final class i {
    public static Bitmap a(String str) {
        Bitmap bitmap;
        try {
            bitmap = BitmapFactory.decodeStream(new FileInputStream(str));
        } catch (FileNotFoundException e) {
            bitmap = null;
        }
        return bitmap;
    }

    public static Boolean a(Bitmap bitmap, String str) {
        Exception e;
        FileOutputStream fileOutputStream;
        Boolean bool;
        if (bitmap == null) {
            bool = false;
        } else {
            try {
                FileOutputStream fileOutputStream2 = new FileOutputStream(str);
                try {
                    bitmap.compress(Bitmap.CompressFormat.JPEG, 100, fileOutputStream2);
                    fileOutputStream2.close();
                    bool = true;
                } catch (Exception e2) {
                    e = e2;
                    fileOutputStream = fileOutputStream2;
                    Log.e("PgyerSDK", "Could not save screenshot.", e);
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (IOException e3) {
                            e3.printStackTrace();
                        }
                    }
                    bool = false;
                    return bool;
                }
            } catch (Exception e4) {
                e = e4;
                fileOutputStream = null;
            }
        }
        return bool;
    }
}
