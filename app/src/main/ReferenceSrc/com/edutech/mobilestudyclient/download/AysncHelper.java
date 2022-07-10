package com.edutech.mobilestudyclient.download;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.util.Log;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class AysncHelper {
    public static ArrayList<HashMap<String, String>> getSystemInfo(ArrayList<HashMap<String, String>> appInfoList, Context mContext) {
        List<PackageInfo> packages = mContext.getPackageManager().getInstalledPackages(0);
        for (int i = 0; i < packages.size(); i++) {
            PackageInfo packageInfo = packages.get(i);
            HashMap<String, String> tmpInfo = new HashMap<>();
            tmpInfo.put("appname", packageInfo.applicationInfo.loadLabel(mContext.getPackageManager()).toString());
            tmpInfo.put("packagename", packageInfo.packageName);
            tmpInfo.put("versioncode", Integer.toString(packageInfo.versionCode));
            tmpInfo.put("versionname", packageInfo.versionName);
            appInfoList.add(tmpInfo);
        }
        return appInfoList;
    }

    public static void compareAppInfo(ArrayList<HashMap<String, String>> downAppinfo, ArrayList<HashMap<String, String>> jsonAppinfo, ArrayList<HashMap<String, String>> localjsonAppinfo, ArrayList<HashMap<String, String>> localAppinfo) {
        Iterator<HashMap<String, String>> it = jsonAppinfo.iterator();
        while (it.hasNext()) {
            HashMap<String, String> jsonTempApp = it.next();
            if (jsonTempApp.get("packagename") != null && jsonTempApp.get("versionname") != null && jsonTempApp.get("versioncode") != null && jsonTempApp.get("appname") != null && jsonTempApp.get("appwebpath") != null) {
                boolean isInstall = false;
                Iterator<HashMap<String, String>> it2 = localAppinfo.iterator();
                while (it2.hasNext()) {
                    HashMap<String, String> localTempApp = it2.next();
                    if (localTempApp.get("packagename") != null && jsonTempApp.get("packagename").equals(localTempApp.get("packagename"))) {
                        isInstall = true;
                        if ((localTempApp.get("versioncode") == null || localTempApp.get("versionname") == null || jsonTempApp.get("versioncode").equals(localTempApp.get("versioncode"))) && jsonTempApp.get("versionname").equals(localTempApp.get("versionname"))) {
                            break;
                        }
                        boolean isExistDownload = isInDownloadList(downAppinfo, jsonTempApp.get("packagename"));
                        if (!isExistDownload) {
                            downAppinfo.add(jsonTempApp);
                        }
                    }
                }
                if (!isInstall) {
                    boolean isExistDownload2 = isInDownloadList(downAppinfo, jsonTempApp.get("packagename"));
                    if (!isExistDownload2) {
                        downAppinfo.add(jsonTempApp);
                    }
                }
            }
        }
    }

    public static boolean isInDownloadList(ArrayList<HashMap<String, String>> downAppinfo, String jsonpackagename) {
        Iterator<HashMap<String, String>> it = downAppinfo.iterator();
        while (it.hasNext()) {
            HashMap<String, String> tempDownAppInfo = it.next();
            String packageName = tempDownAppInfo.get("packagename");
            if (packageName != null && jsonpackagename != null && packageName.equals(jsonpackagename)) {
                return true;
            }
        }
        return false;
    }

    public static void startDownLoadList(ArrayList<HashMap<String, String>> downloadlist, ArrayList<Map<String, Async>> listTask) {
        Log.d("wpdemo", "downloadlist = " + downloadlist.size());
        Log.d("wpdemo", "downloadlist = " + downloadlist.toString());
        for (int i = 0; i < downloadlist.size(); i++) {
            if (listTask == null || listTask.size() < 10) {
                boolean isHas = false;
                String apkname = downloadlist.get(i).get("appname");
                String webpath = downloadlist.get(i).get("appwebpath");
                Log.d("wpdemo", "add 下载连接的个数 listTask.size:" + webpath);
                int j = 0;
                while (true) {
                    if (j >= listTask.size()) {
                        break;
                    }
                    Async startTask = listTask.get(j).get(webpath);
                    if (startTask == null) {
                        j++;
                    } else {
                        isHas = true;
                        break;
                    }
                }
                if (!isHas) {
                    Async asyncTask = new Async();
                    Map<String, Async> map = new Hashtable<>();
                    map.put(webpath, asyncTask);
                    listTask.add(map);
                    asyncTask.execute(apkname, webpath);
                }
                Log.d("wpdemo", "add 下载连接的个数 listTask.size:" + listTask.size());
            } else {
                return;
            }
        }
    }
}
