package com.edutech.daoxueben.until;

import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import java.io.File;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;
import org.jivesoftware.smackx.packet.JingleContent;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class AndroidFileUtil {
    public static Intent openFile(String filePath) {
        File file = new File(filePath);
        if (!file.exists()) {
            return null;
        }
        String end = file.getName().substring(file.getName().lastIndexOf(".") + 1, file.getName().length()).toLowerCase();
        Log.d("end:", end);
        if (end.equals("m4a") || end.equals("mp3") || end.equals("mid") || end.equals("xmf") || end.equals("ogg") || end.equals("wav")) {
            return getAudioFileIntent(filePath);
        }
        if (end.equals("3gp") || end.equals("mp4") || end.equals("avi") || end.equals("rmvb") || end.equals("wmv") || end.equals("swf")) {
            return getVideoFileIntent(filePath);
        }
        if (end.equals("jpg") || end.equals("gif") || end.equals("png") || end.equals("jpeg") || end.equals("bmp")) {
            return getImageFileIntent(filePath);
        }
        if (end.equals("apk")) {
            return getApkFileIntent(filePath);
        }
        if (end.equals("ppt") || end.equals("ppsx") || end.equals("pptx")) {
            return getPptFileIntent(filePath);
        }
        if (end.equals("xls") || end.equals("xlsx")) {
            return getExcelFileIntent(filePath);
        }
        if (end.equals("doc") || end.equals("docx")) {
            return getWordFileIntent(filePath);
        }
        if (end.equals("pdf")) {
            return getPdfFileIntent(filePath);
        }
        if (end.equals("chm")) {
            return getChmFileIntent(filePath);
        }
        if (end.equals("txt")) {
            return getTextFileIntent(filePath, false);
        }
        if (end.equals("html") || end.equals("htm") || end.equals("exm")) {
            return getHtmlFileIntent(filePath);
        }
        if (!end.equals("rar") && !end.equals(ArchiveStreamFactory.ZIP)) {
            return null;
        }
        return getRarFileIntent(filePath);
    }

    public static Intent getAllIntent(String param) {
        Intent intent = new Intent();
        intent.addFlags(268435456);
        intent.setAction("android.intent.action.VIEW");
        Uri uri = Uri.fromFile(new File(param));
        intent.setDataAndType(uri, "*/*");
        return intent;
    }

    public static Intent getApkFileIntent(String param) {
        Intent intent = new Intent();
        intent.addFlags(268435456);
        intent.setAction("android.intent.action.VIEW");
        Uri uri = Uri.fromFile(new File(param));
        intent.setDataAndType(uri, "application/vnd.android.package-archive");
        return intent;
    }

    public static Intent getVideoFileIntent(String param) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addFlags(67108864);
        intent.putExtra("oneshot", 0);
        intent.putExtra("configchange", 0);
        Uri uri = Uri.fromFile(new File(param));
        intent.setDataAndType(uri, "video/*");
        return intent;
    }

    public static Intent getAudioFileIntent(String param) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addFlags(67108864);
        intent.putExtra("oneshot", 0);
        intent.putExtra("configchange", 0);
        Uri uri = Uri.fromFile(new File(param));
        intent.setDataAndType(uri, "audio/*");
        return intent;
    }

    public static Intent getHtmlFileIntent(String param) {
        Uri uri = Uri.parse(param).buildUpon().encodedAuthority("com.android.htmlfileprovider").scheme(JingleContent.NODENAME).encodedPath(param).build();
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setDataAndType(uri, "text/html");
        return intent;
    }

    public static Intent getImageFileIntent(String param) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        Uri uri = Uri.fromFile(new File(param));
        intent.setDataAndType(uri, "image/*");
        return intent;
    }

    public static Intent getPptFileIntent(String param) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        Uri uri = Uri.fromFile(new File(param));
        intent.setDataAndType(uri, "application/vnd.ms-powerpoint");
        return intent;
    }

    public static Intent getExcelFileIntent(String param) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        Uri uri = Uri.fromFile(new File(param));
        intent.setDataAndType(uri, "application/vnd.ms-excel");
        return intent;
    }

    public static Intent getWordFileIntent(String param) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        Uri uri = Uri.fromFile(new File(param));
        intent.setDataAndType(uri, "application/msword");
        return intent;
    }

    public static Intent getChmFileIntent(String param) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        Uri uri = Uri.fromFile(new File(param));
        intent.setDataAndType(uri, "application/x-chm");
        return intent;
    }

    public static Intent getTextFileIntent(String param, boolean paramBoolean) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        if (paramBoolean) {
            Uri uri1 = Uri.parse(param);
            intent.setDataAndType(uri1, "text/plain");
        } else {
            Uri uri2 = Uri.fromFile(new File(param));
            intent.setDataAndType(uri2, "text/plain");
        }
        return intent;
    }

    public static Intent getPdfFileIntent(String param) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        Uri uri = Uri.fromFile(new File(param));
        intent.setDataAndType(uri, "application/pdf");
        return intent;
    }

    public static Intent getRarFileIntent(String param) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        Uri uri = Uri.fromFile(new File(param));
        intent.setDataAndType(uri, "application/x-rar-compressed");
        return intent;
    }
}
