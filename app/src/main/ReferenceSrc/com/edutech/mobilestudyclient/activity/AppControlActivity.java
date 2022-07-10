package com.edutech.mobilestudyclient.activity;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.Toast;
import com.edutech.mobilestudyclient.LanguageUtils;
import com.edutech.mobilestudyclient.SysConfig.AppEnvironment;
import com.edutech.mobilestudyclient.util.AppDetails;
import com.edutech.mobilestudyclient.view.AppControlAdapter;
import com.launcher.activity.R;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class AppControlActivity extends Activity {
    private static String TAG = " ";
    private AppControlAdapter adapter;
    private List<AppDetails> appInfoList;
    private ListView appLv;
    private List<AppDetails> appSearchList;
    private Button btn_back;
    private Button btn_clean;
    private Button btn_search;
    private EditText edt_search;
    private List<String> selfApps;
    private String installPkg = "";
    private long installTime = 0;
    View.OnClickListener cleanListener = new AnonymousClass1();
    Handler handler = new AnonymousClass2();
    View.OnClickListener backListener = new AnonymousClass3();
    View.OnClickListener searchListener = new AnonymousClass4();
    AdapterView.OnItemClickListener appClickListener = new AnonymousClass5();

    static /* synthetic */ List access$3(AppControlActivity appControlActivity) {
        return appControlActivity.appInfoList;
    }

    static /* synthetic */ List access$2(AppControlActivity appControlActivity) {
        return appControlActivity.appSearchList;
    }

    static /* synthetic */ AppControlAdapter access$1(AppControlActivity appControlActivity) {
        return appControlActivity.adapter;
    }

    static /* synthetic */ Button access$4(AppControlActivity appControlActivity) {
        return appControlActivity.btn_search;
    }

    static /* synthetic */ EditText access$5(AppControlActivity appControlActivity) {
        return appControlActivity.edt_search;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.appcontrol);
        initWidget();
        AppEnvironment.CleaningPackage = "";
        SharedPreferences sp = getSharedPreferences("language", 0);
        String type = sp.getString("language", "chinese");
        if (!type.equals("en")) {
            LanguageUtils.SetLanguage(this, "chinese");
        } else {
            LanguageUtils.SetLanguage(this, "en");
        }
        new ShowAppsThread().start();
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context newBase) {
        try {
            SharedPreferences sp = newBase.getSharedPreferences("language", 0);
            String type = sp.getString("language", "chinese");
            super.attachBaseContext(LanguageUtils.attachBaseContext(newBase, type));
        } catch (Exception e) {
        }
    }

    public static void cleanInternalCache(Context context) {
        Log.e(TAG, context.getCacheDir().getAbsolutePath());
        deleteFilesByDirectory(context.getCacheDir());
    }

    public static void cleanSharedPreference(Context context) {
        deleteFilesByDirectory(new File("/data/data/" + context.getPackageName() + "/shared_prefs"));
    }

    public static void cleanFiles(Context context) {
        deleteFilesByDirectory(context.getFilesDir());
    }

    public static void cleanExternalCache(Context context) {
        if (Environment.getExternalStorageState().equals("mounted")) {
            Log.e(TAG, context.getExternalCacheDir().getAbsolutePath());
            deleteFilesByDirectory(context.getExternalCacheDir());
        }
    }

    public void cleanApplicationData(Context context) {
        cleanInternalCache(context);
        cleanExternalCache(context);
        cleanSharedPreference(context);
        SharedPreferences sp = getSharedPreferences("lockscreen", 0);
        sp.edit().putLong("installtime", this.installTime).commit();
        sp.edit().putString("installpkg", this.installPkg).commit();
    }

    private static void deleteFilesByDirectory(File directory) {
        File[] listFiles;
        Log.e("cleaning", directory.getAbsolutePath());
        if (directory != null && directory.exists() && directory.isDirectory()) {
            File[] items = directory.listFiles();
            if (items != null) {
                for (File item : directory.listFiles()) {
                    item.delete();
                }
            }
        }
    }

    private static void cleanCacheFile(String path) {
        File[] files;
        Log.e("sdcard", path);
        File file = new File(path);
        if (file.isDirectory() && (files = file.listFiles()) != null) {
            for (File tep : files) {
                tep.delete();
            }
        }
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class ShowAppsThread extends Thread {
        ShowAppsThread() {
            AppControlActivity.this = r1;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            AppControlActivity.access$6(AppControlActivity.this);
            Message msg = AppControlActivity.this.handler.obtainMessage();
            msg.what = 2;
            msg.sendToTarget();
        }
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        AppEnvironment.CleaningPackage = "";
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        AppEnvironment.CleaningPackage = "";
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        return super.onKeyDown(keyCode, event);
    }

    static /* synthetic */ void access$6(AppControlActivity appControlActivity) {
        appControlActivity.initApps();
    }

    @SuppressLint({"NewApi"})
    private void initApps() {
        new ArrayList();
        this.appInfoList = new ArrayList();
        this.selfApps = new ArrayList();
        this.selfApps.add("com.launcher.activity");
        this.selfApps.add("com.edutech.firewall");
        this.selfApps.add("com.edutech.assistantdemo");
        List<PackageInfo> packages = getPackageManager().getInstalledPackages(0);
        if (packages != null && packages.size() > 0) {
            for (int i = 0; i < packages.size(); i++) {
                PackageInfo info = packages.get(i);
                AppDetails detail = new AppDetails();
                String pkName = info.packageName;
                if (!this.selfApps.contains(pkName) && !pkName.contains("com.edutech.myfiles") && !pkName.contains("com.edutech.protect") && (pkName.contains("com.edutech") || pkName.contains("cn.wps.moffice_eng"))) {
                    String name = info.applicationInfo.loadLabel(getPackageManager()).toString();
                    String version = info.versionName;
                    String vcode = new StringBuilder(String.valueOf(info.versionCode)).toString();
                    Drawable icon = getResources().getDrawable(2130837884);
                    try {
                        icon = info.applicationInfo.loadIcon(getPackageManager());
                    } catch (Exception e) {
                    }
                    if (name != null && pkName != null && version != null && vcode != null && icon != null && !this.selfApps.contains(pkName)) {
                        detail.setAppIcon(icon);
                        detail.setAppName(name);
                        detail.setAppPackageName(pkName);
                        detail.setAppVersion(version);
                        detail.setAppVersionCode(vcode);
                        this.appInfoList.add(detail);
                    }
                }
            }
        }
    }

    private void initWidget() {
        this.appInfoList = new ArrayList();
        this.adapter = new AppControlAdapter(this.appInfoList, this);
        this.appLv = (ListView) findViewById(R.id.appcontrol_lv);
        this.appLv.setAdapter((ListAdapter) this.adapter);
        this.btn_back = (Button) findViewById(R.id.btnBack);
        this.btn_search = (Button) findViewById(R.id.btnSearch);
        this.edt_search = (EditText) findViewById(R.id.et_appsearch);
        this.btn_clean = (Button) findViewById(R.id.btnClean);
        this.edt_search.setVisibility(8);
        this.btn_back.setOnClickListener(this.backListener);
        this.btn_search.setOnClickListener(this.searchListener);
        this.btn_search.setEnabled(false);
        this.btn_clean.setOnClickListener(this.cleanListener);
        this.edt_search.addTextChangedListener(new AnonymousClass6());
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.AppControlActivity$6 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass6 implements TextWatcher {
        AnonymousClass6() {
            AppControlActivity.this = r1;
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence arg0, int arg1, int arg2, int arg3) {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable arg0) {
            String key = arg0.toString();
            Message msg = AppControlActivity.this.handler.obtainMessage();
            msg.obj = key;
            msg.what = 1;
            msg.sendToTarget();
        }
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.AppControlActivity$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements View.OnClickListener {
        AnonymousClass1() {
            AppControlActivity.this = r1;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View arg0) {
            Toast.makeText(AppControlActivity.this, (int) R.string.appcleanok, 0).show();
        }
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.AppControlActivity$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 extends Handler {
        AnonymousClass2() {
            AppControlActivity.this = r1;
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            int what = msg.what;
            switch (what) {
                case 1:
                    String keywords = (String) msg.obj;
                    AppControlActivity.access$0(AppControlActivity.this, keywords);
                    if (AppControlActivity.access$1(AppControlActivity.this) != null && AppControlActivity.access$2(AppControlActivity.this) != null) {
                        AppControlActivity.access$1(AppControlActivity.this).setDetails(AppControlActivity.access$2(AppControlActivity.this));
                        AppControlActivity.access$1(AppControlActivity.this).notifyDataSetChanged();
                        return;
                    }
                    return;
                case 2:
                    if (AppControlActivity.access$1(AppControlActivity.this) != null && AppControlActivity.access$3(AppControlActivity.this) != null) {
                        AppControlActivity.access$1(AppControlActivity.this).setDetails(AppControlActivity.access$3(AppControlActivity.this));
                        AppControlActivity.access$1(AppControlActivity.this).notifyDataSetChanged();
                    }
                    AppControlActivity.access$4(AppControlActivity.this).setEnabled(true);
                    return;
                default:
                    return;
            }
        }
    }

    static /* synthetic */ void access$0(AppControlActivity appControlActivity, String str) {
        appControlActivity.searchApps(str);
    }

    private void searchApps(String keywords) {
        this.appSearchList = new ArrayList();
        if (keywords != null && !keywords.equals("")) {
            for (int i = 0; i < this.appInfoList.size(); i++) {
                AppDetails detail = this.appInfoList.get(i);
                if (detail.getAppName().contains(keywords)) {
                    this.appSearchList.add(detail);
                }
            }
        }
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.AppControlActivity$3 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass3 implements View.OnClickListener {
        AnonymousClass3() {
            AppControlActivity.this = r1;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View arg0) {
            AppControlActivity.this.finish();
        }
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.AppControlActivity$4 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass4 implements View.OnClickListener {
        AnonymousClass4() {
            AppControlActivity.this = r1;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View arg0) {
            AppControlActivity.access$5(AppControlActivity.this).setText("");
            if (AppControlActivity.access$5(AppControlActivity.this).getVisibility() == 8) {
                AppControlActivity.access$5(AppControlActivity.this).setVisibility(0);
                AppControlActivity.access$4(AppControlActivity.this).setText(AppControlActivity.this.getResources().getString(R.string.apphide));
                Message msg = AppControlActivity.this.handler.obtainMessage();
                msg.what = 1;
                msg.obj = "";
                msg.sendToTarget();
                return;
            }
            AppControlActivity.access$5(AppControlActivity.this).setVisibility(8);
            AppControlActivity.access$4(AppControlActivity.this).setText(AppControlActivity.this.getResources().getString(R.string.appsearch));
            Message msg2 = AppControlActivity.this.handler.obtainMessage();
            msg2.what = 2;
            msg2.sendToTarget();
        }
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.AppControlActivity$5 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass5 implements AdapterView.OnItemClickListener {
        AnonymousClass5() {
            AppControlActivity.this = r1;
        }

        @Override // android.widget.AdapterView.OnItemClickListener
        public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
            if (AppControlActivity.access$5(AppControlActivity.this).getVisibility() == 8) {
                if (AppControlActivity.access$3(AppControlActivity.this).size() > arg2) {
                    AppDetails detail = (AppDetails) AppControlActivity.access$3(AppControlActivity.this).get(arg2);
                    String packageName = detail.getAppPackageName();
                    AppEnvironment.CleaningPackage = packageName;
                    Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS", Uri.parse("package:" + packageName));
                    AppControlActivity.this.startActivity(intent);
                }
            } else if (AppControlActivity.access$2(AppControlActivity.this).size() > arg2) {
                AppDetails detail2 = (AppDetails) AppControlActivity.access$2(AppControlActivity.this).get(arg2);
                String packageName2 = detail2.getAppPackageName();
                AppEnvironment.CleaningPackage = packageName2;
                Intent intent2 = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS", Uri.parse("package:" + packageName2));
                AppControlActivity.this.startActivity(intent2);
            }
        }
    }
}
