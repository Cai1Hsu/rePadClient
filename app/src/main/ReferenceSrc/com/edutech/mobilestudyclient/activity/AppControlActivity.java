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

/* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/AppControlActivity.class */
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
    View.OnClickListener cleanListener = new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.AppControlActivity.1
        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            Toast.makeText(AppControlActivity.this, (int) R.string.appcleanok, 0).show();
        }
    };
    Handler handler = new Handler() { // from class: com.edutech.mobilestudyclient.activity.AppControlActivity.2
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    AppControlActivity.this.searchApps((String) message.obj);
                    if (AppControlActivity.this.adapter == null || AppControlActivity.this.appSearchList == null) {
                        return;
                    }
                    AppControlActivity.this.adapter.setDetails(AppControlActivity.this.appSearchList);
                    AppControlActivity.this.adapter.notifyDataSetChanged();
                    return;
                case 2:
                    if (AppControlActivity.this.adapter != null && AppControlActivity.this.appInfoList != null) {
                        AppControlActivity.this.adapter.setDetails(AppControlActivity.this.appInfoList);
                        AppControlActivity.this.adapter.notifyDataSetChanged();
                    }
                    AppControlActivity.this.btn_search.setEnabled(true);
                    return;
                default:
                    return;
            }
        }
    };
    View.OnClickListener backListener = new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.AppControlActivity.3
        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            AppControlActivity.this.finish();
        }
    };
    View.OnClickListener searchListener = new View.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.AppControlActivity.4
        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            AppControlActivity.this.edt_search.setText("");
            if (AppControlActivity.this.edt_search.getVisibility() != 8) {
                AppControlActivity.this.edt_search.setVisibility(8);
                AppControlActivity.this.btn_search.setText(AppControlActivity.this.getResources().getString(R.string.appsearch));
                Message obtainMessage = AppControlActivity.this.handler.obtainMessage();
                obtainMessage.what = 2;
                obtainMessage.sendToTarget();
                return;
            }
            AppControlActivity.this.edt_search.setVisibility(0);
            AppControlActivity.this.btn_search.setText(AppControlActivity.this.getResources().getString(R.string.apphide));
            Message obtainMessage2 = AppControlActivity.this.handler.obtainMessage();
            obtainMessage2.what = 1;
            obtainMessage2.obj = "";
            obtainMessage2.sendToTarget();
        }
    };
    AdapterView.OnItemClickListener appClickListener = new AdapterView.OnItemClickListener() { // from class: com.edutech.mobilestudyclient.activity.AppControlActivity.5
        @Override // android.widget.AdapterView.OnItemClickListener
        public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
            if (AppControlActivity.this.edt_search.getVisibility() == 8) {
                if (AppControlActivity.this.appInfoList.size() <= i) {
                    return;
                }
                String appPackageName = ((AppDetails) AppControlActivity.this.appInfoList.get(i)).getAppPackageName();
                AppEnvironment.CleaningPackage = appPackageName;
                AppControlActivity.this.startActivity(new Intent("android.settings.APPLICATION_DETAILS_SETTINGS", Uri.parse("package:" + appPackageName)));
            } else if (AppControlActivity.this.appSearchList.size() <= i) {
            } else {
                String appPackageName2 = ((AppDetails) AppControlActivity.this.appSearchList.get(i)).getAppPackageName();
                AppEnvironment.CleaningPackage = appPackageName2;
                AppControlActivity.this.startActivity(new Intent("android.settings.APPLICATION_DETAILS_SETTINGS", Uri.parse("package:" + appPackageName2)));
            }
        }
    };

    /* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/AppControlActivity$ShowAppsThread.class */
    class ShowAppsThread extends Thread {
        ShowAppsThread() {
            AppControlActivity.this = r4;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            AppControlActivity.this.initApps();
            Message obtainMessage = AppControlActivity.this.handler.obtainMessage();
            obtainMessage.what = 2;
            obtainMessage.sendToTarget();
        }
    }

    private static void cleanCacheFile(String str) {
        File[] listFiles;
        Log.e("sdcard", str);
        File file = new File(str);
        if (!file.isDirectory() || (listFiles = file.listFiles()) == null) {
            return;
        }
        for (File file2 : listFiles) {
            file2.delete();
        }
    }

    public static void cleanExternalCache(Context context) {
        if (Environment.getExternalStorageState().equals("mounted")) {
            Log.e(TAG, context.getExternalCacheDir().getAbsolutePath());
            deleteFilesByDirectory(context.getExternalCacheDir());
        }
    }

    public static void cleanFiles(Context context) {
        deleteFilesByDirectory(context.getFilesDir());
    }

    public static void cleanInternalCache(Context context) {
        Log.e(TAG, context.getCacheDir().getAbsolutePath());
        deleteFilesByDirectory(context.getCacheDir());
    }

    public static void cleanSharedPreference(Context context) {
        deleteFilesByDirectory(new File("/data/data/" + context.getPackageName() + "/shared_prefs"));
    }

    private static void deleteFilesByDirectory(File file) {
        Log.e("cleaning", file.getAbsolutePath());
        if (file == null || !file.exists() || !file.isDirectory() || file.listFiles() == null) {
            return;
        }
        for (File file2 : file.listFiles()) {
            file2.delete();
        }
    }

    @SuppressLint({"NewApi"})
    public void initApps() {
        new ArrayList();
        this.appInfoList = new ArrayList();
        this.selfApps = new ArrayList();
        this.selfApps.add("com.launcher.activity");
        this.selfApps.add("com.edutech.firewall");
        this.selfApps.add("com.edutech.assistantdemo");
        List<PackageInfo> installedPackages = getPackageManager().getInstalledPackages(0);
        if (installedPackages == null || installedPackages.size() <= 0) {
            return;
        }
        for (int i = 0; i < installedPackages.size(); i++) {
            PackageInfo packageInfo = installedPackages.get(i);
            AppDetails appDetails = new AppDetails();
            String str = packageInfo.packageName;
            if (!this.selfApps.contains(str) && !str.contains("com.edutech.myfiles") && !str.contains("com.edutech.protect") && (str.contains("com.edutech") || str.contains("cn.wps.moffice_eng"))) {
                String charSequence = packageInfo.applicationInfo.loadLabel(getPackageManager()).toString();
                String str2 = packageInfo.versionName;
                String sb = new StringBuilder(String.valueOf(packageInfo.versionCode)).toString();
                Drawable drawable = getResources().getDrawable(2130837884);
                try {
                    drawable = packageInfo.applicationInfo.loadIcon(getPackageManager());
                } catch (Exception e) {
                }
                if (charSequence != null && str != null && str2 != null && sb != null && drawable != null && !this.selfApps.contains(str)) {
                    appDetails.setAppIcon(drawable);
                    appDetails.setAppName(charSequence);
                    appDetails.setAppPackageName(str);
                    appDetails.setAppVersion(str2);
                    appDetails.setAppVersionCode(sb);
                    this.appInfoList.add(appDetails);
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
        this.edt_search.addTextChangedListener(new TextWatcher() { // from class: com.edutech.mobilestudyclient.activity.AppControlActivity.6
            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable editable) {
                String editable2 = editable.toString();
                Message obtainMessage = AppControlActivity.this.handler.obtainMessage();
                obtainMessage.obj = editable2;
                obtainMessage.what = 1;
                obtainMessage.sendToTarget();
            }

            @Override // android.text.TextWatcher
            public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }

            @Override // android.text.TextWatcher
            public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
            }
        });
    }

    public void searchApps(String str) {
        this.appSearchList = new ArrayList();
        if (str == null || str.equals("")) {
            return;
        }
        for (int i = 0; i < this.appInfoList.size(); i++) {
            AppDetails appDetails = this.appInfoList.get(i);
            if (appDetails.getAppName().contains(str)) {
                this.appSearchList.add(appDetails);
            }
        }
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper
    protected void attachBaseContext(Context context) {
        try {
            super.attachBaseContext(LanguageUtils.attachBaseContext(context, context.getSharedPreferences("language", 0).getString("language", "chinese")));
        } catch (Exception e) {
        }
    }

    public void cleanApplicationData(Context context) {
        cleanInternalCache(context);
        cleanExternalCache(context);
        cleanSharedPreference(context);
        SharedPreferences sharedPreferences = getSharedPreferences("lockscreen", 0);
        sharedPreferences.edit().putLong("installtime", this.installTime).commit();
        sharedPreferences.edit().putString("installpkg", this.installPkg).commit();
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.appcontrol);
        initWidget();
        AppEnvironment.CleaningPackage = "";
        if (!getSharedPreferences("language", 0).getString("language", "chinese").equals("en")) {
            LanguageUtils.SetLanguage(this, "chinese");
        } else {
            LanguageUtils.SetLanguage(this, "en");
        }
        new ShowAppsThread().start();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        AppEnvironment.CleaningPackage = "";
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        return super.onKeyDown(i, keyEvent);
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        AppEnvironment.CleaningPackage = "";
    }
}
