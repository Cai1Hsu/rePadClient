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

/* loaded from: classes.jar:com/edutech/appmanage/DownLoadManage.class */
public class DownLoadManage extends Activity {
    static final DecimalFormat DOUBLE_DECIMAL_FORMAT = new DecimalFormat("0.##");
    public static final int KB_2_BYTE = 1024;
    public static final int MB_2_BYTE = 1048576;
    private MyAdapter adapter;
    private Handler handler;
    private ListView lv;
    private TextView none_down;
    Runnable runnableUi = new Runnable() { // from class: com.edutech.appmanage.DownLoadManage.1
        @Override // java.lang.Runnable
        public void run() {
            DownLoadManage.this.adapter.notifyDataSetChanged();
            if (HttpHelper.install_num == null || HttpHelper.install_num.size() == 0) {
                DownLoadManage.this.none_down.setVisibility(0);
            }
        }
    };
    private Thread thread;

    /* loaded from: classes.jar:com/edutech/appmanage/DownLoadManage$MyAdapter.class */
    class MyAdapter extends BaseAdapter {
        int click = -1;
        Context context;
        ViewHolder holder;
        private LayoutInflater mInflater;

        /* loaded from: classes.jar:com/edutech/appmanage/DownLoadManage$MyAdapter$ViewHolder.class */
        public final class ViewHolder {
            public Button downloadCancel;
            public TextView downloadPrecent;
            public ProgressBar downloadProgress;
            public TextView downloadSize;
            public TextView downloadTip;

            public ViewHolder() {
                MyAdapter.this = r4;
            }
        }

        MyAdapter(Context context) {
            DownLoadManage.this = r4;
            this.context = context;
            this.mInflater = LayoutInflater.from(context);
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return HttpHelper.install_num.size();
        }

        @Override // android.widget.Adapter
        public Object getItem(int i) {
            return Integer.valueOf(i);
        }

        @Override // android.widget.Adapter
        public long getItemId(int i) {
            return i;
        }

        @Override // android.widget.Adapter
        public View getView(final int i, View view, ViewGroup viewGroup) {
            if (view == null) {
                view = this.mInflater.inflate(R.layout.download_manager_demo, (ViewGroup) null);
                this.holder = new ViewHolder();
                this.holder.downloadCancel = (Button) view.findViewById(R.id.download_cancel);
                this.holder.downloadProgress = (ProgressBar) view.findViewById(R.id.download_progress);
                this.holder.downloadTip = (TextView) view.findViewById(R.id.download_tip);
                this.holder.downloadPrecent = (TextView) view.findViewById(R.id.download_precent);
                this.holder.downloadSize = (TextView) view.findViewById(R.id.download_size);
                view.setTag(this.holder);
            } else {
                this.holder = (ViewHolder) view.getTag();
            }
            int[] bytesAndStatus = MainActivity.downloadManagerPro.getBytesAndStatus(((Long) HttpHelper.install_num.get(i).get("downid")).longValue());
            if (DownLoadManage.isDownloading(bytesAndStatus[2])) {
                this.holder.downloadProgress.setVisibility(0);
                this.holder.downloadTip.setVisibility(0);
                this.holder.downloadProgress.setMax(0);
                this.holder.downloadProgress.setProgress(0);
                if (HttpHelper.install_num.get(i) != null) {
                    if (1 == ((Integer) HttpHelper.install_num.get(i).get("type")).intValue()) {
                        this.holder.downloadTip.setText(MainActivity.market_applist.get(((Integer) HttpHelper.install_num.get(i).get("position")).intValue()).appname);
                    } else {
                        this.holder.downloadTip.setText(MainActivity.market_applist.get(((Integer) HttpHelper.install_num.get(i).get("position")).intValue()).appname);
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
                this.holder.downloadCancel.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.appmanage.DownLoadManage.MyAdapter.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view2) {
                        MainActivity.downloadManager.remove(((Long) HttpHelper.install_num.get(i).get("downid")).longValue());
                        HttpHelper.install_num.remove(i);
                        DownLoadManage.this.handler.post(DownLoadManage.this.runnableUi);
                    }
                });
            } else {
                this.holder.downloadTip.setVisibility(8);
                this.holder.downloadProgress.setVisibility(8);
                this.holder.downloadProgress.setMax(0);
                this.holder.downloadProgress.setProgress(0);
                this.holder.downloadSize.setVisibility(8);
                this.holder.downloadPrecent.setVisibility(8);
                this.holder.downloadCancel.setVisibility(8);
            }
            return view;
        }
    }

    public static CharSequence getAppSize(long j) {
        return j <= 0 ? "0M" : j >= FileUtils.ONE_MB ? new StringBuilder(16).append(DOUBLE_DECIMAL_FORMAT.format(j / 1048576.0d)).append("M") : j >= 1024 ? new StringBuilder(16).append(DOUBLE_DECIMAL_FORMAT.format(j / 1024.0d)).append("K") : String.valueOf(j) + "B";
    }

    public static String getNotiPercent(long j, long j2) {
        return new StringBuilder(16).append((j <= 0 || j2 <= 0) ? 0 : j > j2 ? 100 : (int) ((j / j2) * 100.0d)).append("%").toString();
    }

    public static boolean isDownloading(int i) {
        boolean z = true;
        if (i != 2) {
            z = true;
            if (i != 4) {
                z = true;
                if (i != 1) {
                    z = false;
                }
            }
        }
        return z;
    }

    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.btn_return /* 2131361856 */:
                finish();
                return;
            default:
                return;
        }
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
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
        this.thread = new Thread() { // from class: com.edutech.appmanage.DownLoadManage.2
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                while (HttpHelper.install_num.size() != 0) {
                    try {
                        sleep(1000L);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    DownLoadManage.this.handler.post(DownLoadManage.this.runnableUi);
                }
            }
        };
        this.thread.start();
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
    }
}
