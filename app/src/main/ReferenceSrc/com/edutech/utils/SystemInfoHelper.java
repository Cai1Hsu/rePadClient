package com.edutech.utils;

import android.content.Context;
import android.content.pm.PackageInfo;
import com.edutech.idauthentication.Async;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes.jar:com/edutech/utils/SystemInfoHelper.class */
public class SystemInfoHelper {
    public static void compareAppInfo(ArrayList<HashMap<String, String>> arrayList, ArrayList<HashMap<String, String>> arrayList2, ArrayList<HashMap<String, String>> arrayList3, ArrayList<HashMap<String, String>> arrayList4) {
        Iterator<HashMap<String, String>> it = arrayList2.iterator();
        while (it.hasNext()) {
            HashMap<String, String> next = it.next();
            if (next.get("packagename") != null && next.get("versionname") != null && next.get("versioncode") != null && next.get("appname") != null && next.get("appwebpath") != null) {
                boolean z = false;
                Iterator<HashMap<String, String>> it2 = arrayList4.iterator();
                while (it2.hasNext()) {
                    HashMap<String, String> next2 = it2.next();
                    if (next2.get("packagename") != null && next.get("packagename").equals(next2.get("packagename"))) {
                        z = true;
                        if ((next2.get("versioncode") == null || next2.get("versionname") == null || next.get("versioncode").equals(next2.get("versioncode"))) && next.get("versionname").equals(next2.get("versionname"))) {
                            break;
                        }
                        z = true;
                        if (!isInDownloadList(arrayList, next.get("packagename"))) {
                            arrayList.add(next);
                            z = true;
                        }
                    }
                }
                if (!z && !isInDownloadList(arrayList, next.get("packagename"))) {
                    arrayList.add(next);
                }
            }
        }
    }

    public static ArrayList<HashMap<String, String>> getSystemInfo(ArrayList<HashMap<String, String>> arrayList, Context context) {
        List<PackageInfo> installedPackages = context.getPackageManager().getInstalledPackages(0);
        for (int i = 0; i < installedPackages.size(); i++) {
            PackageInfo packageInfo = installedPackages.get(i);
            HashMap<String, String> hashMap = new HashMap<>();
            hashMap.put("appname", packageInfo.applicationInfo.loadLabel(context.getPackageManager()).toString());
            hashMap.put("packagename", packageInfo.packageName);
            hashMap.put("versioncode", Integer.toString(packageInfo.versionCode));
            hashMap.put("versionname", packageInfo.versionName);
            arrayList.add(hashMap);
        }
        return arrayList;
    }

    public static boolean isInDownloadList(ArrayList<HashMap<String, String>> arrayList, String str) {
        boolean z;
        Iterator<HashMap<String, String>> it = arrayList.iterator();
        while (true) {
            if (it.hasNext()) {
                String str2 = it.next().get("packagename");
                if (str2 != null && str != null && str2.equals(str)) {
                    z = true;
                    break;
                }
            } else {
                z = false;
                break;
            }
        }
        return z;
    }

    public static void startDownLoadList(ArrayList<HashMap<String, String>> arrayList, ArrayList<Map<String, Async>> arrayList2) {
        boolean z;
        for (int i = 0; i < arrayList.size(); i++) {
            if (arrayList2 != null && arrayList2.size() >= 5) {
                return;
            }
            String str = arrayList.get(i).get("appname");
            String str2 = arrayList.get(i).get("appwebpath");
            int i2 = 0;
            while (true) {
                if (i2 >= arrayList2.size()) {
                    z = false;
                    break;
                } else if (arrayList2.get(i2).get(str2) != null) {
                    z = true;
                    break;
                } else {
                    i2++;
                }
            }
            if (!z) {
                Async async = new Async();
                Hashtable hashtable = new Hashtable();
                hashtable.put(str2, async);
                arrayList2.add(hashtable);
                async.execute(str, str2);
            }
        }
    }
}
