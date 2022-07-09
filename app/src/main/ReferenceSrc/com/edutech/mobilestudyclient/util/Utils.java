package com.edutech.mobilestudyclient.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.text.TextUtils;
import android.util.Log;
import com.edutech.mobilestudyclient.ApkUpdateBean;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/util/Utils.class */
public class Utils {
    public static Utils utils;

    public static void clearUpdateAPks(Context context, String str) {
        context.getSharedPreferences("updateapks", 0).edit().putString("apks_" + str, "").commit();
    }

    public static String getAppName(String str, Context context) {
        String str2;
        try {
            PackageManager packageManager = context.getPackageManager();
            str2 = packageManager.getApplicationLabel(packageManager.getApplicationInfo(str, 128)).toString();
        } catch (Exception e) {
            e.printStackTrace();
            str2 = "";
        }
        return str2;
    }

    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:47:0x014c -> B:16:0x0087). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:49:0x0154 -> B:41:0x0113). Please submit an issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:50:0x015a -> B:16:0x0087). Please submit an issue!!! */
    public static List<String> getFailedEbagUpdated(Context context, String str) {
        ArrayList arrayList;
        ArrayList arrayList2 = new ArrayList();
        if (context == null) {
            arrayList = arrayList2;
        } else {
            SharedPreferences sharedPreferences = context.getSharedPreferences("updateapks", 0);
            String string = sharedPreferences.getString("apks_" + str, "");
            arrayList = arrayList2;
            if (!TextUtils.isEmpty(string)) {
                try {
                    JSONArray jSONArray = new JSONArray(string);
                    boolean z = false;
                    for (int i = 0; i < jSONArray.length(); i++) {
                        JSONObject jSONObject = jSONArray.getJSONObject(i);
                        String string2 = jSONObject.getString("packagename");
                        String string3 = jSONObject.getString("versioncode");
                        String string4 = jSONObject.getString("versionname");
                        String string5 = jSONObject.getString("appname");
                        if (needUpdate(string2, context, string3)) {
                            String appName = getAppName(string2, context);
                            String str2 = appName;
                            if (TextUtils.isEmpty(appName)) {
                                str2 = appName;
                                if (!TextUtils.isEmpty(string5)) {
                                    int length = string5.length() > 16 ? 16 : string5.length();
                                    if (string5.contains("_")) {
                                        length = string5.indexOf("_");
                                    }
                                    try {
                                        str2 = string5.substring(0, length);
                                    } catch (Exception e) {
                                        str2 = appName;
                                    }
                                }
                            }
                            arrayList2.add(String.valueOf(str2) + ": v" + string4);
                            z = true;
                        }
                    }
                    if (!z) {
                        sharedPreferences.edit().putString("apks_" + str, "").commit();
                    }
                } catch (JSONException e2) {
                    e2.printStackTrace();
                } catch (Exception e3) {
                }
                arrayList = new ArrayList();
            }
        }
        return arrayList;
    }

    public static Utils init() {
        if (utils == null) {
            utils = new Utils();
        }
        return utils;
    }

    public static boolean needUpdate(String str, Context context, String str2) {
        int i;
        Log.e("AppUtils", String.valueOf(str) + "," + str2);
        boolean z = false;
        try {
            i = Integer.parseInt(str2);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            i = 1;
        } catch (Exception e2) {
            e2.printStackTrace();
            i = 1;
        }
        try {
            int i2 = context.getPackageManager().getPackageInfo(str, 0).versionCode;
            if (i > i2) {
                z = true;
            }
            Log.e("AppUtils", String.valueOf(str) + "," + i + "," + i2);
        } catch (Exception e3) {
            z = true;
        }
        return z;
    }

    public static void saveUpdateApks(List<ApkUpdateBean> list, Context context, String str) {
        if (list == null || list.size() <= 0 || context == null || TextUtils.isEmpty(str)) {
            clearUpdateAPks(context, str);
        } else {
            context.getSharedPreferences("updateapks", 0).edit().putString("apks_" + str, list.toString()).commit();
        }
    }

    public void Unzip(InputStream inputStream, String str) {
        Exception e;
        Exception e2;
        try {
            ZipInputStream zipInputStream = new ZipInputStream(new BufferedInputStream(inputStream));
            while (true) {
                try {
                    ZipEntry nextEntry = zipInputStream.getNextEntry();
                    if (nextEntry == null) {
                        zipInputStream.close();
                        return;
                    }
                    try {
                        byte[] bArr = new byte[102400];
                        File file = new File(String.valueOf(str) + nextEntry.getName());
                        File file2 = new File(file.getParent());
                        if (!file2.exists()) {
                            file2.mkdirs();
                        }
                        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(file), 102400);
                        while (true) {
                            try {
                                int read = zipInputStream.read(bArr, 0, 102400);
                                if (read == -1) {
                                    break;
                                }
                                bufferedOutputStream.write(bArr, 0, read);
                            } catch (Exception e3) {
                                e2 = e3;
                                e2.printStackTrace();
                            }
                        }
                        bufferedOutputStream.flush();
                        bufferedOutputStream.close();
                    } catch (Exception e4) {
                        e2 = e4;
                    }
                } catch (Exception e5) {
                    e = e5;
                    e.printStackTrace();
                    return;
                }
            }
        } catch (Exception e6) {
            e = e6;
        }
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[]}, finally: {[INVOKE, MOVE_EXCEPTION, INVOKE, IF, INVOKE, MOVE_EXCEPTION, INVOKE, IF, INVOKE, INVOKE, MOVE_EXCEPTION, IF] complete} */
    public void copyBinFile(InputStream inputStream, OutputStream outputStream) {
        BufferedInputStream bufferedInputStream = new BufferedInputStream(inputStream);
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(outputStream);
        while (true) {
            try {
                try {
                    int read = bufferedInputStream.read();
                    if (read == -1) {
                        break;
                    }
                    outputStream.write(read);
                } catch (IOException e) {
                    e.printStackTrace();
                    if (bufferedInputStream != null) {
                        try {
                            bufferedInputStream.close();
                        } catch (IOException e2) {
                            e2.printStackTrace();
                            return;
                        }
                    }
                    if (bufferedOutputStream == null) {
                        return;
                    }
                    bufferedOutputStream.close();
                    return;
                }
            } finally {
                if (bufferedInputStream != null) {
                    try {
                        bufferedInputStream.close();
                    } catch (IOException e3) {
                        e3.printStackTrace();
                    }
                }
                if (bufferedOutputStream != null) {
                    bufferedOutputStream.close();
                }
            }
        }
        if (bufferedInputStream != null) {
            try {
            } catch (IOException e32) {
                return;
            }
        }
    }

    public void copyBinFile(String str, String str2) {
        FileNotFoundException e;
        FileInputStream fileInputStream;
        FileOutputStream fileOutputStream;
        FileInputStream fileInputStream2;
        createFileIfNotExist(str);
        createNewFile(str2);
        try {
            fileInputStream2 = new FileInputStream(str);
        } catch (FileNotFoundException e2) {
            e = e2;
            fileInputStream = null;
        }
        try {
            fileOutputStream = new FileOutputStream(str2);
            fileInputStream = fileInputStream2;
        } catch (FileNotFoundException e3) {
            e = e3;
            fileInputStream = fileInputStream2;
            e.printStackTrace();
            fileOutputStream = null;
            copyBinFile(fileInputStream, fileOutputStream);
        }
        copyBinFile(fileInputStream, fileOutputStream);
    }

    public void copyDictFile(InputStream inputStream, String str) {
        try {
            createNewFile(str);
            int i = 0;
            FileOutputStream fileOutputStream = new FileOutputStream(str);
            byte[] bArr = new byte[1444];
            while (true) {
                int read = inputStream.read(bArr);
                if (read == -1) {
                    inputStream.close();
                    return;
                } else {
                    i += read;
                    fileOutputStream.write(bArr, 0, read);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void copyDictUTFFile(InputStream inputStream, String str) throws UnsupportedEncodingException, FileNotFoundException {
        try {
            createNewFile(str);
            int i = 0;
            FileOutputStream fileOutputStream = new FileOutputStream(str);
            byte[] bArr = new byte[512];
            while (true) {
                int read = inputStream.read(bArr);
                if (read == -1) {
                    inputStream.close();
                    return;
                } else {
                    i += read;
                    fileOutputStream.write(bArr, 0, read);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX DEBUG: Failed to insert an additional move for type inference into block B:51:0x00f8 */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v7, types: [java.io.BufferedReader] */
    public void copyDictUTFFile2(InputStream inputStream, String str) {
        Throwable th;
        BufferedReader bufferedReader;
        String readLine;
        createNewFile(str);
        StringBuffer stringBuffer = new StringBuffer();
        BufferedReader bufferedReader2 = null;
        try {
            try {
                BufferedReader bufferedReader3 = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
                while (true) {
                    try {
                        try {
                            if (bufferedReader3.readLine() == null) {
                                break;
                            }
                            stringBuffer.append(String.valueOf(readLine) + "\n");
                        } catch (Throwable th2) {
                            th = th2;
                            bufferedReader2 = bufferedReader3;
                            try {
                                bufferedReader2.close();
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                            throw th;
                        }
                    } catch (IOException e2) {
                        e = e2;
                        bufferedReader = bufferedReader3;
                        e.printStackTrace();
                        try {
                            bufferedReader.close();
                            return;
                        } catch (IOException e3) {
                            e3.printStackTrace();
                            return;
                        }
                    }
                }
                bufferedReader2 = new File(str);
                OutputStreamWriter outputStreamWriter = null;
                try {
                    outputStreamWriter = new OutputStreamWriter(new FileOutputStream(bufferedReader2), "UTF-8");
                } catch (FileNotFoundException e4) {
                    e4.printStackTrace();
                } catch (UnsupportedEncodingException e5) {
                    e5.printStackTrace();
                }
                try {
                    outputStreamWriter.write(stringBuffer.toString());
                } catch (IOException e6) {
                    e6.printStackTrace();
                }
                try {
                    outputStreamWriter.close();
                } catch (IOException e7) {
                    e7.printStackTrace();
                }
                try {
                    bufferedReader3.close();
                } catch (IOException e8) {
                    e8.printStackTrace();
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (IOException e9) {
            e = e9;
            bufferedReader = null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x005a A[Catch: IOException -> 0x007b, all -> 0x0095, LOOP:0: B:35:0x0037->B:14:0x005a, LOOP_END, TRY_ENTER, TRY_LEAVE, TryCatch #6 {IOException -> 0x007b, blocks: (B:7:0x0037, B:14:0x005a), top: B:35:0x0037, outer: #2 }] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0042 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void copyFile(InputStream inputStream, OutputStream outputStream) {
        BufferedReader bufferedReader;
        BufferedWriter bufferedWriter;
        String readLine;
        UnsupportedEncodingException e;
        BufferedReader bufferedReader2;
        try {
            BufferedReader bufferedReader3 = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
            try {
                bufferedWriter = new BufferedWriter(new OutputStreamWriter(outputStream, "UTF-8"));
                bufferedReader = bufferedReader3;
            } catch (UnsupportedEncodingException e2) {
                e = e2;
                bufferedReader2 = bufferedReader3;
                e.printStackTrace();
                bufferedReader = bufferedReader2;
                bufferedWriter = null;
                while (true) {
                    try {
                        try {
                            if (bufferedReader.readLine() != null) {
                            }
                            bufferedWriter.write(String.valueOf(readLine) + "\n");
                        } finally {
                            try {
                                bufferedReader.close();
                                bufferedWriter.close();
                            } catch (IOException e3) {
                                e3.printStackTrace();
                            }
                        }
                    } catch (IOException e4) {
                        e4.printStackTrace();
                        try {
                            bufferedReader.close();
                            bufferedWriter.close();
                            return;
                        } catch (IOException e5) {
                            e5.printStackTrace();
                            return;
                        }
                    }
                }
            }
        } catch (UnsupportedEncodingException e6) {
            e = e6;
            bufferedReader2 = null;
        }
        while (true) {
            if (bufferedReader.readLine() != null) {
                try {
                    return;
                } catch (IOException e32) {
                    return;
                }
            }
            bufferedWriter.write(String.valueOf(readLine) + "\n");
        }
    }

    public void copyFile(InputStream inputStream, String str) {
        FileOutputStream fileOutputStream;
        createNewFile(str);
        try {
            fileOutputStream = new FileOutputStream(str);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            fileOutputStream = null;
        }
        copyFile(inputStream, fileOutputStream);
    }

    public File createFileIfNotExist(String str) {
        File file = new File(str);
        if (!file.exists()) {
            try {
                new File(str.substring(0, str.lastIndexOf(File.separator))).mkdirs();
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return file;
    }

    public void createNewFile(String str) {
        createFileIfNotExist(str);
        File file = new File(str);
        file.delete();
        try {
            file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean isExist(String str) {
        return new File(str).exists();
    }

    public void merge(String[] strArr, String str, Context context) throws Exception {
        createNewFile(str);
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(new File(str));
            for (String str2 : strArr) {
                InputStream open = context.getAssets().open(str2);
                byte[] bArr = new byte[102400];
                while (true) {
                    int read = open.read(bArr);
                    if (read == -1) {
                        break;
                    }
                    fileOutputStream.write(bArr, 0, read);
                }
                open.close();
            }
            fileOutputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
