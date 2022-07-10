package com.edutech.mobilestudyclient.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
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
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class Utils {
    public static Utils utils;

    public static Utils init() {
        if (utils == null) {
            utils = new Utils();
        }
        return utils;
    }

    public void copyBinFile(String fileFromPath, String fileToPath) {
        FileNotFoundException e;
        InputStream in;
        createFileIfNotExist(fileFromPath);
        createNewFile(fileToPath);
        InputStream in2 = null;
        OutputStream out = null;
        try {
            in = new FileInputStream(fileFromPath);
        } catch (FileNotFoundException e2) {
            e = e2;
        }
        try {
            OutputStream out2 = new FileOutputStream(fileToPath);
            out = out2;
            in2 = in;
        } catch (FileNotFoundException e3) {
            e = e3;
            in2 = in;
            e.printStackTrace();
            copyBinFile(in2, out);
        }
        copyBinFile(in2, out);
    }

    public void copyBinFile(InputStream in, OutputStream out) {
        InputStream inBuffer = new BufferedInputStream(in);
        OutputStream outBuffer = new BufferedOutputStream(out);
        while (true) {
            try {
                try {
                    int byteData = inBuffer.read();
                    if (byteData == -1) {
                        break;
                    }
                    out.write(byteData);
                } catch (IOException e) {
                    e.printStackTrace();
                    if (inBuffer != null) {
                        try {
                            inBuffer.close();
                        } catch (IOException e2) {
                            e2.printStackTrace();
                            return;
                        }
                    }
                    if (outBuffer != null) {
                        outBuffer.close();
                        return;
                    }
                    return;
                }
            } finally {
                if (inBuffer != null) {
                    try {
                        inBuffer.close();
                    } catch (IOException e3) {
                        e3.printStackTrace();
                    }
                }
                if (outBuffer != null) {
                    outBuffer.close();
                }
            }
        }
        if (inBuffer != null) {
            try {
            } catch (IOException e32) {
                return;
            }
        }
    }

    public void copyFile(InputStream in, String targetFilePath) {
        createNewFile(targetFilePath);
        OutputStream out = null;
        try {
            OutputStream out2 = new FileOutputStream(targetFilePath);
            out = out2;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        copyFile(in, out);
    }

    /* JADX WARN: Removed duplicated region for block: B:13:0x0031 A[Catch: IOException -> 0x0049, all -> 0x0059, LOOP:0: B:28:0x001f->B:13:0x0031, LOOP_END, TRY_ENTER, TRY_LEAVE, TryCatch #0 {IOException -> 0x0049, blocks: (B:7:0x001f, B:13:0x0031), top: B:28:0x001f, outer: #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0025 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void copyFile(InputStream in, OutputStream out) {
        UnsupportedEncodingException e;
        String data;
        BufferedReader br;
        BufferedReader br2 = null;
        BufferedWriter bw = null;
        try {
            br = new BufferedReader(new InputStreamReader(in, "UTF-8"));
        } catch (UnsupportedEncodingException e2) {
            e = e2;
        }
        try {
            BufferedWriter bw2 = new BufferedWriter(new OutputStreamWriter(out, "UTF-8"));
            bw = bw2;
            br2 = br;
        } catch (UnsupportedEncodingException e3) {
            e = e3;
            br2 = br;
            e.printStackTrace();
            while (true) {
                try {
                    try {
                        data = br2.readLine();
                        if (data == null) {
                        }
                        bw.write(String.valueOf(data) + "\n");
                    } catch (IOException e4) {
                        e4.printStackTrace();
                        try {
                            br2.close();
                            bw.close();
                            return;
                        } catch (IOException e5) {
                            e5.printStackTrace();
                            return;
                        }
                    }
                } finally {
                    try {
                        br2.close();
                        bw.close();
                    } catch (IOException e6) {
                        e6.printStackTrace();
                    }
                }
            }
        }
        while (true) {
            data = br2.readLine();
            if (data == null) {
                bw.write(String.valueOf(data) + "\n");
            } else {
                try {
                    return;
                } catch (IOException e62) {
                    return;
                }
            }
        }
    }

    public void createNewFile(String targetFilePath) {
        createFileIfNotExist(targetFilePath);
        File targetFile = new File(targetFilePath);
        targetFile.delete();
        try {
            targetFile.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public File createFileIfNotExist(String path) {
        File file = new File(path);
        if (!file.exists()) {
            try {
                new File(path.substring(0, path.lastIndexOf(File.separator))).mkdirs();
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return file;
    }

    public boolean isExist(String path) {
        File file = new File(path);
        return file.exists();
    }

    public void copyDictFile(InputStream inStream, String newPath) {
        try {
            createNewFile(newPath);
            int bytesum = 0;
            FileOutputStream fs = new FileOutputStream(newPath);
            byte[] buffer = new byte[1444];
            while (true) {
                int byteread = inStream.read(buffer);
                if (byteread != -1) {
                    bytesum += byteread;
                    fs.write(buffer, 0, byteread);
                } else {
                    inStream.close();
                    return;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void copyDictUTFFile(InputStream inStream, String filePath) throws UnsupportedEncodingException, FileNotFoundException {
        try {
            createNewFile(filePath);
            int bytesum = 0;
            FileOutputStream fs = new FileOutputStream(filePath);
            byte[] buffer = new byte[512];
            while (true) {
                int byteread = inStream.read(buffer);
                if (byteread != -1) {
                    bytesum += byteread;
                    fs.write(buffer, 0, byteread);
                } else {
                    inStream.close();
                    return;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void merge(String[] fileNames, String TargetFileName, Context mContext) throws Exception {
        createNewFile(TargetFileName);
        try {
            File fout = new File(TargetFileName);
            FileOutputStream out = new FileOutputStream(fout);
            for (String str : fileNames) {
                InputStream in = mContext.getAssets().open(str);
                byte[] b = new byte[102400];
                while (true) {
                    int c = in.read(b);
                    if (c == -1) {
                        break;
                    }
                    out.write(b, 0, c);
                }
                in.close();
            }
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void copyDictUTFFile2(InputStream inStream, String filePath) {
        Throwable th;
        createNewFile(filePath);
        BufferedReader br = null;
        StringBuffer sb = new StringBuffer();
        try {
            try {
                BufferedReader br2 = new BufferedReader(new InputStreamReader(inStream, "UTF-8"));
                while (true) {
                    try {
                        try {
                            String line = br2.readLine();
                            if (line == null) {
                                break;
                            }
                            sb.append(String.valueOf(line) + "\n");
                        } catch (IOException e) {
                            e = e;
                            br = br2;
                            e.printStackTrace();
                            try {
                                br.close();
                                return;
                            } catch (IOException e2) {
                                e2.printStackTrace();
                                return;
                            }
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        br = br2;
                        try {
                            br.close();
                        } catch (IOException e3) {
                            e3.printStackTrace();
                        }
                        throw th;
                    }
                }
                File file2 = new File(filePath);
                Writer writer = null;
                try {
                    writer = new OutputStreamWriter(new FileOutputStream(file2), "UTF-8");
                } catch (FileNotFoundException e1) {
                    e1.printStackTrace();
                } catch (UnsupportedEncodingException e12) {
                    e12.printStackTrace();
                }
                String s3 = sb.toString();
                try {
                    writer.write(s3);
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
                try {
                    writer.close();
                } catch (IOException e5) {
                    e5.printStackTrace();
                }
                try {
                    br2.close();
                } catch (IOException e6) {
                    e6.printStackTrace();
                }
            } catch (Throwable th3) {
                th = th3;
            }
        } catch (IOException e7) {
            e = e7;
        }
    }

    public void Unzip(InputStream inStream, String targetDir) {
        Exception cwj;
        BufferedOutputStream dest;
        try {
            ZipInputStream zis = new ZipInputStream(new BufferedInputStream(inStream));
            BufferedOutputStream dest2 = null;
            while (true) {
                try {
                    ZipEntry entry = zis.getNextEntry();
                    if (entry != null) {
                        try {
                            byte[] data = new byte[102400];
                            String strEntry = entry.getName();
                            File entryFile = new File(String.valueOf(targetDir) + strEntry);
                            File entryDir = new File(entryFile.getParent());
                            if (!entryDir.exists()) {
                                entryDir.mkdirs();
                            }
                            FileOutputStream fos = new FileOutputStream(entryFile);
                            dest = new BufferedOutputStream(fos, 102400);
                            while (true) {
                                try {
                                    int count = zis.read(data, 0, 102400);
                                    if (count == -1) {
                                        break;
                                    }
                                    dest.write(data, 0, count);
                                } catch (Exception e) {
                                    ex = e;
                                    ex.printStackTrace();
                                    dest2 = dest;
                                }
                            }
                            dest.flush();
                            dest.close();
                            dest2 = dest;
                        } catch (Exception e2) {
                            ex = e2;
                            dest = dest2;
                        }
                    } else {
                        zis.close();
                        return;
                    }
                } catch (Exception e3) {
                    cwj = e3;
                    cwj.printStackTrace();
                    return;
                }
            }
        } catch (Exception e4) {
            cwj = e4;
        }
    }

    public static void saveUpdateApks(List<ApkUpdateBean> apks, Context context, String ip) {
        if (apks == null || apks.size() <= 0 || context == null || TextUtils.isEmpty(ip)) {
            clearUpdateAPks(context, ip);
            return;
        }
        SharedPreferences sp = context.getSharedPreferences("updateapks", 0);
        sp.edit().putString("apks_" + ip, apks.toString()).commit();
    }

    public static void clearUpdateAPks(Context context, String ip) {
        SharedPreferences sp = context.getSharedPreferences("updateapks", 0);
        sp.edit().putString("apks_" + ip, "").commit();
    }

    public static List<String> getFailedEbagUpdated(Context context, String ip) {
        List<String> apkFailedList = new ArrayList<>();
        if (context != null) {
            SharedPreferences sp = context.getSharedPreferences("updateapks", 0);
            String apkJsonStr = sp.getString("apks_" + ip, "");
            if (!TextUtils.isEmpty(apkJsonStr)) {
                try {
                    JSONArray jsonArray = new JSONArray(apkJsonStr);
                    boolean isFailed = false;
                    for (int i = 0; i < jsonArray.length(); i++) {
                        JSONObject jsonObject = jsonArray.getJSONObject(i);
                        String pkgName = jsonObject.getString("packagename");
                        String vcode = jsonObject.getString("versioncode");
                        String vname = jsonObject.getString("versionname");
                        String name = jsonObject.getString("appname");
                        boolean isNeed = needUpdate(pkgName, context, vcode);
                        if (isNeed) {
                            isFailed = true;
                            String appName = getAppName(pkgName, context);
                            if (TextUtils.isEmpty(appName) && !TextUtils.isEmpty(name)) {
                                int length = name.length() > 16 ? 16 : name.length();
                                if (name.contains("_")) {
                                    length = name.indexOf("_");
                                }
                                try {
                                    appName = name.substring(0, length);
                                } catch (Exception e) {
                                }
                            }
                            apkFailedList.add(String.valueOf(appName) + ": v" + vname);
                        }
                    }
                    if (!isFailed) {
                        sp.edit().putString("apks_" + ip, "").commit();
                    }
                } catch (JSONException e2) {
                    e2.printStackTrace();
                } catch (Exception e3) {
                }
                return new ArrayList<>();
            }
            return apkFailedList;
        }
        return apkFailedList;
    }

    public static boolean needUpdate(String packagename, Context context, String code) {
        Log.e("AppUtils", String.valueOf(packagename) + "," + code);
        boolean need = false;
        int vcode = 1;
        try {
            vcode = Integer.parseInt(code);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        try {
            PackageInfo info = context.getPackageManager().getPackageInfo(packagename, 0);
            int versionCode = info.versionCode;
            if (vcode > versionCode) {
                need = true;
            }
            Log.e("AppUtils", String.valueOf(packagename) + "," + vcode + "," + versionCode);
            return need;
        } catch (Exception e3) {
            return true;
        }
    }

    public static String getAppName(String packagename, Context context) {
        try {
            PackageManager pm = context.getPackageManager();
            ApplicationInfo appInfo = pm.getApplicationInfo(packagename, 128);
            String appName = pm.getApplicationLabel(appInfo).toString();
            return appName;
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }
}
