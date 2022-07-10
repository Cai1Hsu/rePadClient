package com.edutech.idauthentication;

import android.os.Environment;
import java.io.File;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class AppEnvironment {
    public static final String APP_NAME = "appname";
    public static final String APP_WEBPATH = "appwebpath";
    public static final String BOOK_ID = "book_id";
    public static final String CreatTime = "createtime";
    public static final String DATA = "data";
    public static final String DaoXueBen = "DaoXueBen";
    public static final String DaoXueBenNew = "DaoXueBenNew";
    public static final String ErrorID = "ErrorID";
    public static final String GeRenChengZhang = "GeRenChengZhang";
    public static final String Homework = "Homework";
    public static final String ID = "id";
    public static final String ISNEW = "isnew";
    public static final String IS_DOWN_FINISH = "is_down_finish";
    public static final int LISTTASK_MAXSIZE = 5;
    public static final String LessonPlanning = "LessonPlanning";
    public static final String MyExaminationPaper = "MyExaminationPaper";
    public static final String PACKAGE_NAME = "packagename";
    public static final String PASSWORD = "password";
    public static final String REDOWNLOAD_COUNT = "redownload_count";
    public static final String SOURCE_ID = "source_id";
    public static final String SOURCE_PATH = "source_path";
    public static final String SOURCE_PROGRESS = "source_progress";
    public static final String SOURCE_SIZE = "source_size";
    public static final String SOURCE_WEBPATH = "source_webpath";
    public static final String Type = "type";
    public static final String VERSION_CODE = "versioncode";
    public static final String VERSION_NAME = "versionname";
    public static final String WrongQuestionSet = "WrongQuestionSet";
    public static final String ZuoYeFuDao = "ZuoYeFuDao";
    public static final String FOLDER_MAIN = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "HappyClass" + File.separatorChar + ".System" + File.separatorChar;
    public static final String FOLDER_EDUTECH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "HappyClass" + File.separatorChar + "Edutech" + File.separatorChar;
    public static final String FOLDER_MOBILESTUDYCLIENT_MAIN = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar;
    public static final String FOLDER_MOBILESTUDYCLIENT_EDUTECH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + "Edutech" + File.separatorChar;
    public static final String URLFILEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/CloudClient/.System/setting.xml";
    public static String SETTING_PWD_SAVE_FILEPATH = String.valueOf(FOLDER_MAIN) + "setting_pwd.xml";

    public static String LOGJSON_HTTPPOST_URL(String ip) {
        return "http://" + ip + "/student/fetchdata/set-log-by-textbook";
    }

    public static String SETTING_PWD_UPDATE_HTTPPOST_URL(String ip, String username) {
        return "http://" + ip + "/student/fetchdata/get-pad-pwd/usercode/" + username;
    }

    public static String SETTING_APK_UPDATE_HTTPPOST_URL(String ip, String username) {
        return "http://" + ip + "/student/fetchdata/get-apk-version/usercode/" + username;
    }

    public static String UPDATEJSON_HTTPPOST_URL(String ip, String stuid) {
        return "http://" + ip + "/default/index/check-update/studentid/" + stuid;
    }
}
