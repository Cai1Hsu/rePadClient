package com.edutech.appmanage;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.launcher.activity.R;
import java.text.DecimalFormat;
import org.apache.commons.io.FileUtils;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class DownLoadManage extends Activity {
    static final DecimalFormat DOUBLE_DECIMAL_FORMAT = new DecimalFormat("0.##");
    public static final int KB_2_BYTE = 1024;
    public static final int MB_2_BYTE = 1048576;
    private MyAdapter adapter;
    private Handler handler;
    private ListView lv;
    private TextView none_down;
    Runnable runnableUi = new AnonymousClass1();
    private Thread thread;

    static /* synthetic */ MyAdapter access$0(DownLoadManage downLoadManage) {
        return downLoadManage.adapter;
    }

    static /* synthetic */ Handler access$2(DownLoadManage downLoadManage) {
        return downLoadManage.handler;
    }

    static /* synthetic */ TextView access$1(DownLoadManage downLoadManage) {
        return downLoadManage.none_down;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setFlags(1024, 1024);
        setContentView(R.layout.download_listview);
        this.none_down = (TextView) findViewById(R.id.tv_nonedown);
        if (HttpHelper.install_num != null && HttpHelper.install_num.size() != 0) {
            this.none_down.setVisibility(8);
        }
        this.lv = (ListView) findViewById(R.id.listView_download);
        this.handler = new Handler();
        this.adapter = new MyAdapter(this);
        this.lv.setAdapter((ListAdapter) this.adapter);
        this.thread = new AnonymousClass2();
        this.thread.start();
    }

    /* renamed from: com.edutech.appmanage.DownLoadManage$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 extends Thread {
        AnonymousClass2() {
            DownLoadManage.this = r1;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            super.run();
            while (HttpHelper.install_num.size() != 0) {
                try {
                    sleep(1000L);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                DownLoadManage.access$2(DownLoadManage.this).post(DownLoadManage.this.runnableUi);
            }
        }
    }

    /* renamed from: com.edutech.appmanage.DownLoadManage$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements Runnable {
        AnonymousClass1() {
            DownLoadManage.this = r1;
        }

        @Override // java.lang.Runnable
        public void run() {
            DownLoadManage.access$0(DownLoadManage.this).notifyDataSetChanged();
            if (HttpHelper.install_num == null || HttpHelper.install_num.size() == 0) {
                DownLoadManage.access$1(DownLoadManage.this).setVisibility(0);
            }
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
    }

    public static CharSequence getAppSize(long size) {
        if (size <= 0) {
            return "0M";
        }
        if (size >= FileUtils.ONE_MB) {
            return new StringBuilder(16).append(DOUBLE_DECIMAL_FORMAT.format(size / 1048576.0d)).append("M");
        }
        if (size >= 1024) {
            return new StringBuilder(16).append(DOUBLE_DECIMAL_FORMAT.format(size / 1024.0d)).append("K");
        }
        return String.valueOf(size) + "B";
    }

    public static String getNotiPercent(long progress, long max) {
        int rate;
        if (progress <= 0 || max <= 0) {
            rate = 0;
        } else if (progress > max) {
            rate = 100;
        } else {
            rate = (int) ((progress / max) * 100.0d);
        }
        return new StringBuilder(16).append(rate).append("%").toString();
    }

    public static boolean isDownloading(int downloadManagerStatus) {
        return downloadManagerStatus == 2 || downloadManagerStatus == 4 || downloadManagerStatus == 1;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class MyAdapter extends BaseAdapter {
        int click = -1;
        Context context;
        ViewHolder holder;
        private LayoutInflater mInflater;

        static /* synthetic */ DownLoadManage access$0(MyAdapter myAdapter) {
            return DownLoadManage.this;
        }

        MyAdapter(Context context) {
            DownLoadManage.this = r2;
            this.context = context;
            this.mInflater = LayoutInflater.from(context);
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return HttpHelper.install_num.size();
        }

        @Override // android.widget.Adapter
        public Object getItem(int item) {
            return Integer.valueOf(item);
        }

        @Override // android.widget.Adapter
        public long getItemId(int id) {
            return id;
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            if (convertView == null) {
                convertView = this.mInflater.inflate(R.layout.download_manager_demo, (ViewGroup) null);
                this.holder = new ViewHolder();
                this.holder.downloadCancel = (Button) convertView.findViewById(R.id.download_cancel);
                this.holder.downloadProgress = (ProgressBar) convertView.findViewById(R.id.download_progress);
                this.holder.downloadTip = (TextView) convertView.findViewById(R.id.download_tip);
                this.holder.downloadPrecent = (TextView) convertView.findViewById(R.id.download_precent);
                this.holder.downloadSize = (TextView) convertView.findViewById(R.id.download_size);
                convertView.setTag(this.holder);
            } else {
                this.holder = (ViewHolder) convertView.getTag();
            }
            int[] bytesAndStatus = MainActivity.downloadManagerPro.getBytesAndStatus(((Long) HttpHelper.install_num.get(position).get("downid")).longValue());
            int status = bytesAndStatus[2];
            if (DownLoadManage.isDownloading(status)) {
                this.holder.downloadProgress.setVisibility(0);
                this.holder.downloadTip.setVisibility(0);
                this.holder.downloadProgress.setMax(0);
                this.holder.downloadProgress.setProgress(0);
                if (HttpHelper.install_num.get(position) != null) {
                    if (1 == ((Integer) HttpHelper.install_num.get(position).get("type")).intValue()) {
                        this.holder.downloadTip.setText(MainActivity.market_applist.get(((Integer) HttpHelper.install_num.get(position).get("position")).intValue()).appname);
                    } else {
                        this.holder.downloadTip.setText(MainActivity.market_applist.get(((Integer) HttpHelper.install_num.get(position).get("position")).intValue()).appname);
                    }
                }
                this.holder.downloadSize.setVisibility(0);
                this.holder.downloadPrecent.setVisibility(0);
                this.holder.downloadCancel.setVisibility(0);
                if (bytesAndStatus[1] < 0) {
                    this.holder.downloadProgress.setIndeterminate(true);
                    this.holder.downloadPrecent.setText("0%");
                    this.holder.downloadSize.setText("0M/0M");
                } else {
                    this.holder.downloadProgress.setIndeterminate(false);
                    this.holder.downloadProgress.setMax(bytesAndStatus[1]);
                    this.holder.downloadProgress.setProgress(bytesAndStatus[0]);
                    this.holder.downloadPrecent.setText(DownLoadManage.getNotiPercent(bytesAndStatus[0], bytesAndStatus[1]));
                    this.holder.downloadSize.setText(((Object) DownLoadManage.getAppSize(bytesAndStatus[0])) + "/" + ((Object) DownLoadManage.getAppSize(bytesAndStatus[1])));
                }
                this.holder.downloadCancel.setOnClickListener(new AnonymousClass1(position));
            } else {
                this.holder.downloadTip.setVisibility(8);
                this.holder.downloadProgress.setVisibility(8);
                this.holder.downloadProgress.setMax(0);
                this.holder.downloadProgress.setProgress(0);
                this.holder.downloadSize.setVisibility(8);
                this.holder.downloadPrecent.setVisibility(8);
                this.holder.downloadCancel.setVisibility(8);
            }
            return convertView;
        }

        /* renamed from: com.edutech.appmanage.DownLoadManage$MyAdapter$1 */
        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        class AnonymousClass1 implements View.OnClickListener {
            private final /* synthetic */ int val$position;

            AnonymousClass1(int i) {
                MyAdapter.this = r1;
                this.val$position = i;
            }

            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                MainActivity.downloadManager.remove(((Long) HttpHelper.install_num.get(this.val$position).get("downid")).longValue());
                HttpHelper.install_num.remove(this.val$position);
                DownLoadManage.access$2(MyAdapter.access$0(MyAdapter.this)).post(MyAdapter.access$0(MyAdapter.this).runnableUi);
            }
        }

        /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
        public final class ViewHolder {
            public Button downloadCancel;
            public TextView downloadPrecent;
            public ProgressBar downloadProgress;
            public TextView downloadSize;
            public TextView downloadTip;

            public ViewHolder() {
                MyAdapter.this = r1;
            }
        }
    }

    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.btn_return /* 2131361856 */:
                finish();
                return;
            default:
                return;
        }
    }
}
