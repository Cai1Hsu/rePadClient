package com.edutech.daoxueben.sysconfig;

import android.media.MediaPlayer;
import android.os.Environment;
import java.io.File;

/* loaded from: classes.jar:com/edutech/daoxueben/sysconfig/AppEnvironment.class */
public class AppEnvironment {
    public static final String BOOK_ID = "book_id";
    public static final String BOOK_ID_NAME = "bookid=";
    public static final String BOOK_NAME = "book_name";
    public static final int CAMERA_CODE = 2;
    public static final String CHAPTER_NAME = "chapter_name";
    public static final String DX_ID_NAME = "dxid=";
    public static final String DaoXueBen = "DaoXueBen";
    public static final String DaoXueBenNew = "DaoXueBenNew";
    public static final String EXAMID_BACK = "BACKEXAMID";
    public static final int EXAM_EXAMID_BACK = 12;
    public static final int EXAM_URL_BACK = 2;
    public static final int FILE_SELECTED = 1;
    public static final int HEIGHT = 400;
    public static final String ID = "id";
    public static final int LISTTASK_MAXSIZE = 20;
    public static final String PREF_DEFAULT_URL = "http://192.168.0.88/index/student-pad/method/6/user/02/pass/1";
    public static final String PREF_PREFERENCE_NAME = "cloudclientpreference";
    public static final String PREF_SETTING_URL = "pref_setting_url";
    public static final String SECTION_NAME = "section_name";
    public static final String SECTION_PATH = "section_path";
    public static final String SECTION_PROGRESS = "section_progress";
    public static final String SECTION_TAG = "section_tag";
    public static final String SECTION_UPDATETIME = "section_updatetime";
    public static final String SECTION_WEBPATH = "section_webpath";
    public static final String SIZE = "size";
    public static final String SOURCE_ID = "source_id";
    public static final String SOURCE_ISDOWN = "source_isdown";
    public static final String SOURCE_PATH = "source_path";
    public static final String SOURCE_PROGRESS = "source_progress";
    public static final String SOURCE_SIZE = "source_size";
    public static final String SOURCE_WEBPATH = "source_webpath";
    public static final String URL_BACK = "BACKURL";
    public static final int VIDEO_BACK = 1024;
    public static final String WrongQuestionSet = "WrongQuestionSet";
    public static final String ZuoYeFuDao = "ZuoYeFuDao";
    public static MediaPlayer mediaPlayer;
    public static final String BOOKPIC = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/bookpics/";
    public static final String URLFILEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/setting.xml";
    public static final String PWDFILEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/pwd.xml";
    public static final String FOLDER_MAIN = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "DaoXueBen" + File.separatorChar;
    public static final String ASSETS_DOWNLOAD_DIR = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar;
    public static final String JSON_BOOKS_File = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "DaoXueBen" + File.separatorChar + "Books.json";
    public static final String JSON_JSON_File = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "DaoXueBen" + File.separatorChar + "json.txt";
    public static final String FOLDER_MAIN_HTML_FOLDER = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "DaoXueBen" + File.separatorChar + "HTML" + File.separatorChar + "index.html";
    public static final String OFFLINE_DOWNLOAD = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "DaoXueBen" + File.separatorChar + "offlineDownload" + File.separatorChar;
    public static final String FOLDER_JSON_TREE = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "DaoXueBen" + File.separatorChar + "jsonTree" + File.separatorChar;
    public static final String STBFILEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "MobileStudyClient" + File.separatorChar + ".System" + File.separatorChar + "DaoXueBen" + File.separatorChar + "offlineDownload" + File.separatorChar + "stb.json";
    public static String StudentId = "-1";
    public static String DOWNFILENAME = "";
    public static boolean is_PRO_END_EXAM = false;
    public static String DX_ID_LOG = "";
    public static String BOOK_ID_LOG = "";
    public static String EXAM_ID = "";
    public static int SCREENWIDTH = 1024;
    public static int SCREENHEIGHT = 720;
    public static int WIDTH = SCREENWIDTH - 20;
    public static int EXM_HEIGHT = (WIDTH * 140) / 500;
    public static String FILENAME = String.valueOf(EXAM_ID) + "userinfo.exm";
    public static String TEMP_FILENAME = String.valueOf(EXAM_ID) + "temp_userinfo.exm";
    public static String SUBJECT_ID = "";
    public static String STUDENT_ID = "";
    public static boolean ShowExist = false;
    public static String WEB_EX_URL = "http://10.10.10.111";
    public static String WEB_EX_FILENAME = "";
    public static String SUCCESS_EXAM_ID = "";
    public static String SUCCESS_SUBJECT_ID = "";

    public static String GET_JSON_LOG_File(String str) {
        return String.valueOf(FOLDER_MAIN) + str + "Log.json";
    }

    public static String GET_SETTING_URL(String str) {
        return "http://" + str;
    }

    public static String LOGJSON_HTTPPOST_URL(String str) {
        return "http://" + str + "/api/padlog";
    }

    public static String UPDATEJSON_HTTPPOST_URL(String str, String str2) {
        return "http://" + str + "/default/index/check-update/studentid/" + str2;
    }

    public static MediaPlayer getMedia() {
        if (mediaPlayer == null) {
            mediaPlayer = new MediaPlayer();
        }
        return mediaPlayer;
    }
}
