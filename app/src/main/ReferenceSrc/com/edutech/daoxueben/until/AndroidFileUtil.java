package com.edutech.daoxueben.until;

import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import java.io.File;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;
import org.jivesoftware.smackx.packet.JingleContent;

/* loaded from: classes.jar:com/edutech/daoxueben/until/AndroidFileUtil.class */
public class AndroidFileUtil {
    public static Intent getAllIntent(String str) {
        Intent intent = new Intent();
        intent.addFlags(268435456);
        intent.setAction("android.intent.action.VIEW");
        intent.setDataAndType(Uri.fromFile(new File(str)), "*/*");
        return intent;
    }

    public static Intent getApkFileIntent(String str) {
        Intent intent = new Intent();
        intent.addFlags(268435456);
        intent.setAction("android.intent.action.VIEW");
        intent.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.android.package-archive");
        return intent;
    }

    public static Intent getAudioFileIntent(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addFlags(67108864);
        intent.putExtra("oneshot", 0);
        intent.putExtra("configchange", 0);
        intent.setDataAndType(Uri.fromFile(new File(str)), "audio/*");
        return intent;
    }

    public static Intent getChmFileIntent(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        intent.setDataAndType(Uri.fromFile(new File(str)), "application/x-chm");
        return intent;
    }

    public static Intent getExcelFileIntent(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        intent.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.ms-excel");
        return intent;
    }

    public static Intent getHtmlFileIntent(String str) {
        Uri build = Uri.parse(str).buildUpon().encodedAuthority("com.android.htmlfileprovider").scheme(JingleContent.NODENAME).encodedPath(str).build();
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setDataAndType(build, "text/html");
        return intent;
    }

    public static Intent getImageFileIntent(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        intent.setDataAndType(Uri.fromFile(new File(str)), "image/*");
        return intent;
    }

    public static Intent getPdfFileIntent(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        intent.setDataAndType(Uri.fromFile(new File(str)), "application/pdf");
        return intent;
    }

    public static Intent getPptFileIntent(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        intent.setDataAndType(Uri.fromFile(new File(str)), "application/vnd.ms-powerpoint");
        return intent;
    }

    public static Intent getRarFileIntent(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        intent.setDataAndType(Uri.fromFile(new File(str)), "application/x-rar-compressed");
        return intent;
    }

    public static Intent getTextFileIntent(String str, boolean z) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        if (z) {
            intent.setDataAndType(Uri.parse(str), "text/plain");
        } else {
            intent.setDataAndType(Uri.fromFile(new File(str)), "text/plain");
        }
        return intent;
    }

    public static Intent getVideoFileIntent(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addFlags(67108864);
        intent.putExtra("oneshot", 0);
        intent.putExtra("configchange", 0);
        intent.setDataAndType(Uri.fromFile(new File(str)), "video/*");
        return intent;
    }

    public static Intent getWordFileIntent(String str) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.addCategory("android.intent.category.DEFAULT");
        intent.addFlags(268435456);
        intent.setDataAndType(Uri.fromFile(new File(str)), "application/msword");
        return intent;
    }

    public static Intent openFile(String str) {
        Intent intent = null;
        File file = new File(str);
        if (file.exists()) {
            String lowerCase = file.getName().substring(file.getName().lastIndexOf(".") + 1, file.getName().length()).toLowerCase();
            Log.d("end:", lowerCase);
            if (lowerCase.equals("m4a") || lowerCase.equals("mp3") || lowerCase.equals("mid") || lowerCase.equals("xmf") || lowerCase.equals("ogg") || lowerCase.equals("wav")) {
                intent = getAudioFileIntent(str);
            } else if (lowerCase.equals("3gp") || lowerCase.equals("mp4") || lowerCase.equals("avi") || lowerCase.equals("rmvb") || lowerCase.equals("wmv") || lowerCase.equals("swf")) {
                intent = getVideoFileIntent(str);
            } else if (lowerCase.equals("jpg") || lowerCase.equals("gif") || lowerCase.equals("png") || lowerCase.equals("jpeg") || lowerCase.equals("bmp")) {
                intent = getImageFileIntent(str);
            } else if (lowerCase.equals("apk")) {
                intent = getApkFileIntent(str);
            } else if (lowerCase.equals("ppt") || lowerCase.equals("ppsx") || lowerCase.equals("pptx")) {
                intent = getPptFileIntent(str);
            } else if (lowerCase.equals("xls") || lowerCase.equals("xlsx")) {
                intent = getExcelFileIntent(str);
            } else if (lowerCase.equals("doc") || lowerCase.equals("docx")) {
                intent = getWordFileIntent(str);
            } else if (lowerCase.equals("pdf")) {
                intent = getPdfFileIntent(str);
            } else if (lowerCase.equals("chm")) {
                intent = getChmFileIntent(str);
            } else if (lowerCase.equals("txt")) {
                intent = getTextFileIntent(str, false);
            } else if (lowerCase.equals("html") || lowerCase.equals("htm") || lowerCase.equals("exm")) {
                intent = getHtmlFileIntent(str);
            } else if (lowerCase.equals("rar") || lowerCase.equals(ArchiveStreamFactory.ZIP)) {
                intent = getRarFileIntent(str);
            }
        }
        return intent;
    }
}
