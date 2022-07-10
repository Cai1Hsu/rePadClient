package com.pgyersdk.a;

import com.pgyersdk.crash.h;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.net.bsd.RCommandClient;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public final class b {
    private static final Map a;

    static {
        HashMap hashMap = new HashMap();
        a = hashMap;
        hashMap.put(256, "下载失败");
        a.put(257, "下载文件失败，请重试?");
        a.put(258, "取消");
        a.put(259, "重试");
        a.put(513, "更新提醒");
        a.put(Integer.valueOf((int) RCommandClient.DEFAULT_PORT), "无更新说明");
        a.put(515, "关闭");
        a.put(516, "下载");
        a.put(1044, "请输入内容");
    }

    public static String a() {
        return a(null, 1044);
    }

    public static String a(h hVar, int i) {
        String str = null;
        if (hVar != null) {
            str = hVar.getStringForResource(i);
        }
        return str == null ? (String) a.get(Integer.valueOf(i)) : str;
    }
}
