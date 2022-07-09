package com.mobilestudyclient.application;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import com.edutech.mobilestudyclient.SysConfig.AppEnvironment;
import com.pgyersdk.crash.PgyCrashManager;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes.dex */
public class My_Application extends Application {
    private static final String AUTH_ON = "on";
    public static int Class_Type = 0;
    public static String LoginName = null;
    private static final String POLICY_ALWAYS_NEW_CLIENT = "always new client";
    private static final String POLICY_SINGLE_SESSION_PER_ACCOUNT = "single session per account";
    private static Context mContext;
    private static final String TAG = My_Application.class.getSimpleName();
    public static boolean Listener_Flag = false;
    public static String UserName = null;
    public static int UserType = -1;
    public static boolean Flag = false;
    public static Map<String, Integer> map_weidu = new HashMap();
    public static Map<String, String> map_file_DBID = new HashMap();
    public static Map<String, String> map_file_DBID_MD5 = new HashMap();
    public static boolean Login_Success = false;
    public static boolean Login_eD = false;
    public static boolean WelcomeActivity_Runing = false;
    public static boolean Setting_Config_infor_Runing = false;
    public static boolean MainActivity_Runing = false;
    public static boolean InfomationActivity = false;
    public static int net_work_state = 0;
    public static int chat_window_number = 0;
    public static int allfriendsNumber = 0;
    public static boolean Clound_Flag = false;
    public static boolean Notice_New = false;
    public static List<List<String>> Offline_Chat = new ArrayList();
    public static List<Activity> JXHD_activity = new ArrayList();
    public static boolean Allow_Flag = false;
    public static List<String> Room_Not_Exit = new ArrayList();
    public static List<String> MyRoomList_JidS = new ArrayList();
    public static boolean Crowded_Dropped = false;
    public static boolean muc_query_Over_loading = false;
    public static long Archive_Time_S = 0;
    public static long Net_System_time_ss = 0;

    @Override // android.app.Application
    public void onCreate() {
        super.onCreate();
        PgyCrashManager.register(this, AppEnvironment.My_APPID);
    }
}
