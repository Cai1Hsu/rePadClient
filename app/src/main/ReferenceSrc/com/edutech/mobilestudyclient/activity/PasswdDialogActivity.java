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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    static /* synthetic */ void access$1(PasswdDialogActivity passwdDialogActivity, Integer num) {
        passwdDialogActivity.errorNum = num;
    }

    static /* synthetic */ Integer access$2(PasswdDialogActivity passwdDialogActivity) {
        return passwdDialogActivity.errorNum;
    }

    static /* synthetic */ int access$3(PasswdDialogActivity passwdDialogActivity) {
        return passwdDialogActivity.showWarning;
    }

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

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class HostPwd extends Thread {
        HostPwd() {
            PasswdDialogActivity.this = r1;
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
                String result = PasswdDialogActivity.access$0(PasswdDialogActivity.this, response);
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

    static /* synthetic */ String access$0(PasswdDialogActivity passwdDialogActivity, HttpResponse httpResponse) {
        return passwdDialogActivity.getJsonStringFromGZIP(httpResponse);
    }

    private String getJsonStringFromGZIP(HttpResponse response) {
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

    public void showDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this, 5);
        View view = LayoutInflater.from(this).inflate(R.layout.passwordshow, (ViewGroup) null);
        EditText passwdEdit = (EditText) view.findViewById(R.id.dialog_password_edit);
        TextView tv = (TextView) view.findViewById(R.id.dialog_password_txt);
        tv.setText(getResources().getString(R.string.lockwaring));
        passwdEdit.setText("");
        if (this.showWarning == 1 || this.showWarning == 2) {
            tv.setVisibility(0);
            if (this.showWarning == 2) {
                tv.setText(getResources().getString(R.string.lockwaring2));
            } else {
                tv.setText(getResources().getString(R.string.lockwaring));
            }
        } else if (this.showWarning == 0) {
            tv.setVisibility(0);
            if (this.showNumber > 0 && (this.totalNumber + 2) - this.showNumber > 0) {
                tv.setText("如果密码框一直弹，请长按电源键关机，重启平板。剩余次数：" + ((this.totalNumber + 2) - this.showNumber));
            } else {
                tv.setVisibility(8);
            }
        } else {
            return;
        }
        builder.setTitle(getResources().getString(R.string.hintpassword)).setIcon(17301659).setView(view).setPositiveButton(getResources().getString(R.string.appmanager_ok), new AnonymousClass1(passwdEdit)).setNegativeButton(getResources().getString(R.string.appmanager_cancel), new AnonymousClass2()).setOnCancelListener(new AnonymousClass3());
        this.mAlertDialog = builder.create();
        this.mAlertDialog.getContext().getTheme().applyStyle(16973834, true);
        this.mAlertDialog.getWindow().setType(2003);
        this.mAlertDialog.setOnKeyListener(new AnonymousClass4());
        this.mAlertDialog.show();
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.PasswdDialogActivity$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements DialogInterface.OnClickListener {
        private final /* synthetic */ EditText val$passwdEdit;

        AnonymousClass1(EditText editText) {
            PasswdDialogActivity.this = r1;
            this.val$passwdEdit = editText;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface arg0, int arg1) {
            String passwd = PasswdDialogActivity.this.PWD;
            if (passwd.length() == 0) {
                passwd = "ayjedutechyx@123456z";
            }
            if (this.val$passwdEdit.getText().toString().equals(passwd.trim())) {
                AppEnvironment.showDialogNumber = 0;
                AppEnvironment.startTime = 0L;
                Intent intentLock = new Intent("PASSWDPASS");
                PasswdDialogActivity.this.sendBroadcast(intentLock);
                PasswdDialogActivity.access$1(PasswdDialogActivity.this, 0);
                SharedPreferences spf = PasswdDialogActivity.this.getSharedPreferences("lockscreen", 4);
                spf.edit().putInt("tmplocked", 0).commit();
                spf.edit().putLong("showstarttime", 0L).commit();
                spf.edit().putInt("shownumber", 1).commit();
                PasswdDialogActivity.this.finish();
                return;
            }
            PasswdDialogActivity passwdDialogActivity = PasswdDialogActivity.this;
            PasswdDialogActivity.access$1(passwdDialogActivity, Integer.valueOf(PasswdDialogActivity.access$2(passwdDialogActivity).intValue() + 1));
            if (PasswdDialogActivity.access$2(PasswdDialogActivity.this).intValue() >= 3 || PasswdDialogActivity.access$3(PasswdDialogActivity.this) == 1) {
                if (PasswdDialogActivity.access$2(PasswdDialogActivity.this).intValue() >= 3) {
                    AppEnvironment.showDialogNumber++;
                }
                PasswdDialogActivity.access$1(PasswdDialogActivity.this, 0);
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
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.PasswdDialogActivity$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 implements DialogInterface.OnClickListener {
        AnonymousClass2() {
            PasswdDialogActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnClickListener
        public void onClick(DialogInterface arg0, int arg1) {
            PasswdDialogActivity.access$1(PasswdDialogActivity.this, 0);
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.setFlags(268468224);
            intent.addCategory("android.intent.category.LAUNCHER");
            ComponentName cn = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
            intent.setComponent(cn);
            PasswdDialogActivity.this.startActivity(intent);
            PasswdDialogActivity.this.finish();
        }
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.PasswdDialogActivity$3 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass3 implements DialogInterface.OnCancelListener {
        AnonymousClass3() {
            PasswdDialogActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnCancelListener
        public void onCancel(DialogInterface dialog) {
            PasswdDialogActivity.access$1(PasswdDialogActivity.this, 0);
            Intent intent = new Intent("android.intent.action.MAIN");
            intent.setFlags(268468224);
            intent.addCategory("android.intent.category.LAUNCHER");
            ComponentName cn = new ComponentName("com.launcher.activity", "com.edutech.mobilestudyclient.activity.CloudClientActivity");
            intent.setComponent(cn);
            PasswdDialogActivity.this.startActivity(intent);
            PasswdDialogActivity.this.finish();
        }
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.PasswdDialogActivity$4 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass4 implements DialogInterface.OnKeyListener {
        AnonymousClass4() {
            PasswdDialogActivity.this = r1;
        }

        @Override // android.content.DialogInterface.OnKeyListener
        public boolean onKey(DialogInterface arg0, int keyCode, KeyEvent event) {
            Log.d("LockTask", "onKey");
            if (keyCode == 4) {
                PasswdDialogActivity.access$1(PasswdDialogActivity.this, 0);
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
