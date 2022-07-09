package com.edutech.mobilestudyclient.activity;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import com.edutech.idauthentication.AESSet;
import com.edutech.mobilestudyclient.SysConfig.AppEnvironment;
import com.edutech.mobilestudyclient.util.My_md5;
import com.edutech.mobilestudyclient.util.XmlLoadHelper;
import com.launcher.activity.R;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.zip.GZIPInputStream;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONObject;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/PasswdDialogActivity.class */
public class PasswdDialogActivity extends Activity {
    public static final String PWDFILEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/";
    private static final String TAG = "PasswordActivity";
    private HostPwd hostpwdThread;
    private AlertDialog mAlertDialog;
    Button okButton;
    EditText passwordEditText;
    private boolean mFinish = false;
    private Integer errorNum = 0;
    public String PWD = "";
    private int showWarning = 0;
    private int showNumber = 9;
    private int totalNumber = 7;

    /* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/PasswdDialogActivity$HostPwd.class */
    class HostPwd extends Thread {
        HostPwd() {
            PasswdDialogActivity.this = r4;
        }

        /* JADX WARN: Code restructure failed: missing block: B:9:0x005d, code lost:
            if (r0.equals("") != false) goto L10;
         */
        @Override // java.lang.Thread, java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public void run() {
            String str;
            SharedPreferences sharedPreferences = PasswdDialogActivity.this.getSharedPreferences("privatekey", 0);
            String string = sharedPreferences.getString("key", "");
            String string2 = sharedPreferences.getString("apihost", "");
            String string3 = sharedPreferences.getString("name", "");
            HashMap<String, String> loadXml = XmlLoadHelper.loadXml();
            String str2 = string2;
            String str3 = string;
            String str4 = string3;
            if (loadXml != null) {
                if (string2 != null && !string2.equals("")) {
                    str2 = string2;
                    str3 = string;
                    str4 = string3;
                }
                str2 = loadXml.get("ip");
                str4 = loadXml.get("usercode");
                str3 = loadXml.get("privatekey");
            }
            HttpPost httpPost = new HttpPost("http://" + str2 + "/api/padpwd");
            httpPost.addHeader("X-Edutech-Entity", str4);
            Log.e("pwd", String.valueOf(str) + "," + str4 + "," + str3);
            long currentTimeMillis = System.currentTimeMillis();
            httpPost.addHeader("X-Edutech-Sign", String.valueOf(currentTimeMillis) + "+" + My_md5.Md5(String.valueOf(currentTimeMillis) + str4 + str3));
            try {
                String string4 = new JSONObject(PasswdDialogActivity.this.getJsonStringFromGZIP(new DefaultHttpClient().execute(httpPost))).getString("data");
                File file = new File(String.valueOf(PasswdDialogActivity.PWDFILEPATH) + str2 + "pwd.xml");
                if (file.exists() && string4 != null && !string4.equals("")) {
                    file.delete();
                }
                file.createNewFile();
                FileOutputStream fileOutputStream = new FileOutputStream(file);
                fileOutputStream.write(string4.getBytes());
                if (fileOutputStream == null) {
                    return;
                }
                fileOutputStream.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public String getJsonStringFromGZIP(HttpResponse httpResponse) {
        String str;
        InputStream inputStream;
        try {
            if (httpResponse.getStatusLine().getStatusCode() == 200) {
                BufferedInputStream bufferedInputStream = new BufferedInputStream(httpResponse.getEntity().getContent());
                bufferedInputStream.mark(2);
                byte[] bArr = new byte[2];
                int read = bufferedInputStream.read(bArr);
                bufferedInputStream.reset();
                int i = getShort(bArr);
                if (read == -1 || i != 8075) {
                    Log.d(TAG, " not use GZIPInputStream");
                    inputStream = bufferedInputStream;
                } else {
                    Log.d(TAG, " use GZIPInputStream  ");
                    inputStream = new GZIPInputStream(bufferedInputStream);
                }
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");
                char[] cArr = new char[100];
                StringBuffer stringBuffer = new StringBuffer();
                while (true) {
                    int read2 = inputStreamReader.read(cArr);
                    if (read2 <= 0) {
                        break;
                    }
                    stringBuffer.append(cArr, 0, read2);
                }
                str = stringBuffer.toString();
                bufferedInputStream.close();
                inputStreamReader.close();
            } else {
                Log.e(TAG, "与服务端连接失败。。。");
                Log.e(TAG, "ddddd=" + httpResponse.getStatusLine().getStatusCode());
                Log.e(TAG, "ddddd=" + httpResponse.getEntity());
                str = "";
            }
        } catch (Exception e) {
            Log.e(TAG, e.toString(), e);
            str = "";
        }
        Log.d(TAG, "getJsonStringFromGZIP net output : " + str);
        return str;
    }

    private int getShort(byte[] bArr) {
        return (bArr[0] << 8) | (bArr[1] & 255);
    }

    /* JADX WARN: Code restructure failed: missing block: B:9:0x004a, code lost:
        if (r0.equals("") != false) goto L10;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void getPwd() {
        int read;
        SharedPreferences sharedPreferences = getSharedPreferences("privatekey", 0);
        sharedPreferences.getString("key", "");
        String string = sharedPreferences.getString("apihost", "");
        String string2 = sharedPreferences.getString("name", "");
        HashMap<String, String> loadXml = XmlLoadHelper.loadXml();
        String str = string;
        if (loadXml != null) {
            if (string != null && !string.equals("")) {
                str = string;
            }
            str = loadXml.get("ip");
            loadXml.get("usercode");
            loadXml.get("privatekey");
        }
        File file = new File(String.valueOf(PWDFILEPATH) + str + "pwd.xml");
        if (file.exists()) {
            try {
                FileInputStream fileInputStream = new FileInputStream(file);
                byte[] bArr = new byte[1024];
                String str2 = "";
                while (true) {
                    if (fileInputStream.read(bArr) == -1) {
                        break;
                    }
                    str2 = String.valueOf(str2) + new String(bArr, 0, read);
                }
                if (fileInputStream != null) {
                    fileInputStream.close();
                }
                byte[] decrypt = new AESSet().decrypt(str2);
                this.PWD = new String(decrypt, 0, decrypt.length);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getPwd();
        Intent intent = getIntent();
        if (intent != null) {
            this.showWarning = intent.getIntExtra("lockwarning", 0);
            this.showNumber = intent.getIntExtra("number", 0);
        }
        if (AppEnvironment.isLJLD) {
            this.totalNumber = 7;
        } else {
            this.totalNumber = 5;
        }
        if (this.hostpwdThread == null) {
            this.hostpwdThread = new HostPwd();
            this.hostpwdThread.start();
        }
        showDialog();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        if (this.mAlertDialog != null) {
            this.mAlertDialog.dismiss();
        }
        if (this.hostpwdThread != null) {
            this.hostpwdThread = null;
        }
        super.onDestroy();
    }

    @Override // android.app.Activity
    public void onPause() {
        super.onPause();
    }

    @Override // android.app.Activity
    public void onResume() {
        super.onResume();
        this.mFinish = false;
    }

    /* JADX WARN: Type inference failed for: r0v9, types: [android.widget.TextView, android.widget.EditText] */
    public void showDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this, 5);
        View inflate = LayoutInflater.from(this).inflate(R.layout.passwordshow, (ViewGroup) null);
        final EditText editText = (EditText) inflate.findViewById(R.id.dialog_password_edit);
        ?? r0 = (TextView) inflate.findViewById(R.id.dialog_password_txt);
        r0.setText(getResources().getString(R.string.lockwaring));
        r0.setText("Password:");
        if (this.showWarning == 1 || this.showWarning == 2) {
            r0.setVisibility(0);
            if (this.showWarning == 2) {
                r0.setText(getResources().getString(R.string.lockwaring2));
            } else {
                r0.setText(getResources().getString(R.string.lockwaring));
            }
        } else if (this.showWarning != 0) {
            return;
        } else {
            r0.setVisibility(0);
            if (this.showNumber <= 0 || (this.totalNumber + 2) - this.showNumber <= 0) {
                r0.setVisibility(0);
            } else {
                r0.setText("如果密码框一直弹，请长按电源键关机，重启平板。剩余次数：" + ((this.totalNumber + 2) - this.showNumber));
            }
        }
        builder.setTitle(getResources().getString(R.string.hintpassword)).setIcon(17301659).setView(inflate).setPositiveButton(getResources().getString(R.string.appmanager_ok), new DialogInterface.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.PasswdDialogActivity.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                String str = PasswdDialogActivity.this.PWD;
                String str2 = str;
                if (str.length() == 0) {
                    str2 = "ayjedutechyx@123456z";
                }
                if (editText.getText().toString().equals(str2.trim())) {
                    AppEnvironment.showDialogNumber = 0;
                    AppEnvironment.startTime = 0L;
                    PasswdDialogActivity.this.sendBroadcast(new Intent("PASSWDPASS"));
                    PasswdDialogActivity.this.errorNum = 0;
                    SharedPreferences sharedPreferences = PasswdDialogActivity.this.getSharedPreferences("lockscreen", 4);
                    sharedPreferences.edit().putInt("tmplocked", 0).commit();
                    sharedPreferences.edit().putLong("showstarttime", 0L).commit();
                    sharedPreferences.edit().putInt("shownumber", 1).commit();
                    PasswdDialogActivity.this.finish();
                    return;
                }
                PasswdDialogActivity passwdDialogActivity = PasswdDialogActivity.this;
                passwdDialogActivity.errorNum = Integer.valueOf(passwdDialogActivity.errorNum.intValue() + 1);
                if (PasswdDialogActivity.this.errorNum.intValue() >= 3 || PasswdDialogActivity.this.showWarning == 1) {
                    if (PasswdDialogActivity.this.errorNum.intValue() >= 3) {
                        AppEnvironment.showDialogNumber++;
                    }
                    PasswdDialogActivity.this.errorNum = 0;
                    Intent intent = new Intent("android.intent.action.MAIN");
                    intent.setFlags(268468224);
                    intent.addCategory("android.intent.category.LAUNCHER");
                    intent.setComponent(new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity"));
                    PasswdDialogActivity.this.startActivity(intent);
                    PasswdDialogActivity.this.finish();
                }
                try {
                    Thread.sleep(200L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                PasswdDialogActivity.this.showDialog();
            }
        }).setNegativeButton(getResources().getString(R.string.appmanager_cancel), new DialogInterface.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.PasswdDialogActivity.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                PasswdDialogActivity.this.errorNum = 0;
                Intent intent = new Intent("android.intent.action.MAIN");
                intent.setFlags(268468224);
                intent.addCategory("android.intent.category.LAUNCHER");
                intent.setComponent(new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity"));
                PasswdDialogActivity.this.startActivity(intent);
                PasswdDialogActivity.this.finish();
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.edutech.mobilestudyclient.activity.PasswdDialogActivity.3
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialogInterface) {
                PasswdDialogActivity.this.errorNum = 0;
                Intent intent = new Intent("android.intent.action.MAIN");
                intent.setFlags(268468224);
                intent.addCategory("android.intent.category.LAUNCHER");
                intent.setComponent(new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity"));
                PasswdDialogActivity.this.startActivity(intent);
                PasswdDialogActivity.this.finish();
            }
        });
        this.mAlertDialog = builder.create();
        this.mAlertDialog.getContext().getTheme().applyStyle(16973834, true);
        this.mAlertDialog.getWindow().setType(2003);
        this.mAlertDialog.setOnKeyListener(new DialogInterface.OnKeyListener() { // from class: com.edutech.mobilestudyclient.activity.PasswdDialogActivity.4
            @Override // android.content.DialogInterface.OnKeyListener
            public boolean onKey(DialogInterface dialogInterface, int i, KeyEvent keyEvent) {
                Log.d("LockTask", "onKey");
                if (i == 4) {
                    PasswdDialogActivity.this.errorNum = 0;
                    Intent intent = new Intent("android.intent.action.MAIN");
                    intent.setFlags(268468224);
                    intent.addCategory("android.intent.category.LAUNCHER");
                    ComponentName componentName = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
                    if (componentName != null) {
                        intent.setComponent(componentName);
                        PasswdDialogActivity.this.startActivity(intent);
                    }
                    PasswdDialogActivity.this.finish();
                    return false;
                }
                return false;
            }
        });
        this.mAlertDialog.show();
    }
}
