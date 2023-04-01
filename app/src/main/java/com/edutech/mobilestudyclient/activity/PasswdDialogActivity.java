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
import org.bson.BSON;
import org.json.JSONObject;

/* loaded from: classes.dex */
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

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
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

    /* loaded from: classes.dex */
    class HostPwd extends Thread {
        HostPwd() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            SharedPreferences sharePre = PasswdDialogActivity.this.getSharedPreferences("privatekey", 0);
            String privatekey = sharePre.getString("key", "");
            String ip = sharePre.getString("apihost", "");
            String username = sharePre.getString("name", "");
            HashMap<String, String> hashmap = XmlLoadHelper.loadXml();
            if (hashmap != null && (ip == null || ip.equals("") || username.equals(""))) {
                ip = hashmap.get("ip");
                username = hashmap.get("usercode");
                privatekey = hashmap.get("privatekey");
            }
            String url = "http://" + ip + "/api/padpwd";
            HttpPost post = new HttpPost(url);
            post.addHeader("X-Edutech-Entity", username);
            Log.e("pwd", String.valueOf(url) + "," + username + "," + privatekey);
            long imestamp = System.currentTimeMillis();
            String sign = My_md5.Md5(String.valueOf(imestamp) + username + privatekey);
            post.addHeader("X-Edutech-Sign", String.valueOf(imestamp) + "+" + sign);
            DefaultHttpClient client = new DefaultHttpClient();
            try {
                HttpResponse response = client.execute(post);
                String result = PasswdDialogActivity.this.getJsonStringFromGZIP(response);
                JSONObject jobj = new JSONObject(result);
                String data = jobj.getString("data");
                File file = new File(String.valueOf(PasswdDialogActivity.PWDFILEPATH) + ip + "pwd.xml");
                if (file.exists() && data != null && !data.equals("")) {
                    file.delete();
                }
                file.createNewFile();
                FileOutputStream out = new FileOutputStream(file);
                out.write(data.getBytes());
                if (out != null) {
                    out.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getJsonStringFromGZIP(HttpResponse response) {
        String jsonString;
        InputStream is;
        try {
            if (response.getStatusLine().getStatusCode() == 200) {
                InputStream is2 = response.getEntity().getContent();
                BufferedInputStream bis = new BufferedInputStream(is2);
                bis.mark(2);
                byte[] header = new byte[2];
                int result = bis.read(header);
                bis.reset();
                int headerData = getShort(header);
                if (result != -1 && headerData == 8075) {
                    Log.d(TAG, " use GZIPInputStream  ");
                    is = new GZIPInputStream(bis);
                } else {
                    Log.d(TAG, " not use GZIPInputStream");
                    is = bis;
                }
                InputStreamReader reader = new InputStreamReader(is, "utf-8");
                char[] data = new char[100];
                StringBuffer sb = new StringBuffer();
                while (true) {
                    int readSize = reader.read(data);
                    if (readSize <= 0) {
                        break;
                    }
                    sb.append(data, 0, readSize);
                }
                jsonString = sb.toString();
                bis.close();
                reader.close();
            } else {
                Log.e(TAG, "与服务端连接失败。。。");
                Log.e(TAG, "ddddd=" + response.getStatusLine().getStatusCode());
                Log.e(TAG, "ddddd=" + response.getEntity());
                jsonString = "";
            }
        } catch (Exception e) {
            Log.e(TAG, e.toString(), e);
            jsonString = "";
        }
        Log.d(TAG, "getJsonStringFromGZIP net output : " + jsonString);
        return jsonString;
    }

    private int getShort(byte[] data) {
        return (data[0] << 8) | (data[1] & BSON.MINKEY);
    }

    public void getPwd() {
        SharedPreferences sharePre = getSharedPreferences("privatekey", 0);
        sharePre.getString("key", "");
        String ip = sharePre.getString("apihost", "");
        String username = sharePre.getString("name", "");
        HashMap<String, String> hashmap = XmlLoadHelper.loadXml();
        if (hashmap != null && (ip == null || ip.equals("") || username.equals(""))) {
            ip = hashmap.get("ip");
            hashmap.get("usercode");
            hashmap.get("privatekey");
        }
        File file = new File(String.valueOf(PWDFILEPATH) + ip + "pwd.xml");
        if (file.exists()) {
            try {
                FileInputStream in = new FileInputStream(file);
                byte[] by = new byte[1024];
                String aespwd = "";
                while (true) {
                    int length = in.read(by);
                    if (length == -1) {
                        break;
                    }
                    aespwd = String.valueOf(aespwd) + new String(by, 0, length);
                }
                if (in != null) {
                    in.close();
                }
                AESSet aesset = new AESSet();
                byte[] byaes = aesset.decrypt(aespwd);
                this.PWD = new String(byaes, 0, byaes.length);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /* JADX WARN: Type inference failed for: r2v1, types: [android.widget.TextView, android.widget.EditText] */
    public void showDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this, 5);
        View view = LayoutInflater.from(this).inflate(R.layout.passwordshow, (ViewGroup) null);
        final EditText passwdEdit = (EditText) view.findViewById(R.id.dialog_password_edit);
        TextView r2 = (TextView) view.findViewById(R.id.dialog_password_txt);
        r2.setText(getResources().getString(R.string.lockwaring));
        if (this.showWarning == 1 || this.showWarning == 2) {
            r2.setVisibility(0);
            if (this.showWarning == 2) {
                r2.setText(getResources().getString(R.string.lockwaring2));
            } else {
                r2.setText(getResources().getString(R.string.lockwaring));
            }
        } else if (this.showWarning == 0) {
            r2.setVisibility(0);
            if (this.showNumber > 0 && (this.totalNumber + 2) - this.showNumber > 0) {
                r2.setText("如果密码框一直弹，请长按电源键关机，重启平板。剩余次数：" + ((this.totalNumber + 2) - this.showNumber));
            } else {
                r2.setVisibility(0);
            }
        }
        r2.setText("Cai1Hsu hacked in.\nThe password is:\'" + PasswdDialogActivity.this.PWD + "\'");
        builder.setTitle(getResources().getString(R.string.hintpassword)).setIcon(17301659).setView(view).setPositiveButton(getResources().getString(R.string.appmanager_ok), new DialogInterface.OnClickListener() { // from class: com.edutech.mobilestudyclient.activity.PasswdDialogActivity.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface arg0, int arg1) {
                String passwd = PasswdDialogActivity.this.PWD;
                if (passwd.length() == 0) {
                    passwd = "ayjedutechyx@123456z";
                }
                if (passwdEdit.getText().toString().equals(passwd.trim())) {
                    AppEnvironment.showDialogNumber = 0;
                    AppEnvironment.startTime = 0L;
                    Intent intentLock = new Intent("PASSWDPASS");
                    PasswdDialogActivity.this.sendBroadcast(intentLock);
                    PasswdDialogActivity.this.errorNum = 0;
                    SharedPreferences spf = PasswdDialogActivity.this.getSharedPreferences("lockscreen", 4);
                    spf.edit().putInt("tmplocked", 0).commit();
                    spf.edit().putLong("showstarttime", 0L).commit();
                    spf.edit().putInt("shownumber", 1).commit();
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
                    ComponentName cn = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
                    intent.setComponent(cn);
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
            public void onClick(DialogInterface arg0, int arg1) {
                PasswdDialogActivity.this.errorNum = 0;
                Intent intent = new Intent("android.intent.action.MAIN");
                intent.setFlags(FLAG_ACTIVITY_NEW_TASK);
                intent.addCategory("android.intent.category.HOME");
                PasswdDialogActivity.this.startActivity(intent);
                // TODO: Fix 
                // ComponentName cn = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
                // intent.setComponent(cn);
                // PasswdDialogActivity.this.startActivity(intent);
                PasswdDialogActivity.this.finish();
            }
        }).setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.edutech.mobilestudyclient.activity.PasswdDialogActivity.3
            @Override // android.content.DialogInterface.OnCancelListener
            public void onCancel(DialogInterface dialog) {
                PasswdDialogActivity.this.errorNum = 0;
                PasswdDialogActivity.this.errorNum = 0;
                Intent intent = new Intent("android.intent.action.MAIN");
                intent.setFlags(FLAG_ACTIVITY_NEW_TASK);
                intent.addCategory("android.intent.category.HOME");
                PasswdDialogActivity.this.startActivity(intent);
                // Intent intent = new Intent("android.intent.action.MAIN");
                // intent.setFlags(268468224);
                // intent.addCategory("android.intent.category.LAUNCHER");
                // ComponentName cn = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
                // intent.setComponent(cn);
                PasswdDialogActivity.this.startActivity(intent);
                PasswdDialogActivity.this.finish();
            }
        });
        this.mAlertDialog = builder.create();
        this.mAlertDialog.getContext().getTheme().applyStyle(16973834, true);
        this.mAlertDialog.getWindow().setType(2003);
        this.mAlertDialog.setOnKeyListener(new DialogInterface.OnKeyListener() { // from class: com.edutech.mobilestudyclient.activity.PasswdDialogActivity.4
            @Override // android.content.DialogInterface.OnKeyListener
            public boolean onKey(DialogInterface arg0, int keyCode, KeyEvent event) {
                Log.d("LockTask", "onKey");
                if (keyCode == 4) {
                    PasswdDialogActivity.this.errorNum = 0;
                    Intent intent = new Intent("android.intent.action.MAIN");
                    intent.setFlags(268468224);
                    intent.addCategory("android.intent.category.LAUNCHER");
                    ComponentName cn = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
                    if (cn != null) {
                        intent.setComponent(cn);
                        PasswdDialogActivity.this.startActivity(intent);
                    }
                    PasswdDialogActivity.this.finish();
                }
                return false;
            }
        });
        this.mAlertDialog.show();
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
}
