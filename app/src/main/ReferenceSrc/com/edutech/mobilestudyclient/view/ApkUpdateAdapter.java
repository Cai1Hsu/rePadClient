package com.edutech.mobilestudyclient.view;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ProgressBar;
import android.widget.TextView;
import com.edutech.mobilestudyclient.ApkUpdateBean;
import com.launcher.activity.R;
import java.text.DecimalFormat;
import java.util.List;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/view/ApkUpdateAdapter.class */
public class ApkUpdateAdapter extends BaseAdapter {
    private List<ApkUpdateBean> apkLists;
    private Context mContext;

    /* loaded from: classes.jar:com/edutech/mobilestudyclient/view/ApkUpdateAdapter$ViewHolder.class */
    class ViewHolder {
        TextView adapter_apk_nameTv;
        ProgressBar adapter_apk_progressPb;
        TextView adapter_apk_stateTv;

        ViewHolder() {
            ApkUpdateAdapter.this = r4;
        }
    }

    public ApkUpdateAdapter(List<ApkUpdateBean> list, Context context) {
        this.apkLists = list;
        this.mContext = context;
    }

    private void updateProgress(ViewHolder viewHolder, int i) {
        ApkUpdateBean apkUpdateBean = this.apkLists.get(i);
        viewHolder.adapter_apk_nameTv.setText(apkUpdateBean.getAppName());
        DecimalFormat decimalFormat = new DecimalFormat("##0.00");
        String str = String.valueOf(decimalFormat.format(((apkUpdateBean.getApkDownloadSize() * 1.0d) / 1024.0d) / 1024.0d)) + "MB/" + decimalFormat.format(((apkUpdateBean.getApkSize() * 1.0d) / 1024.0d) / 1024.0d) + "MB";
        viewHolder.adapter_apk_progressPb.setProgress((int) ((apkUpdateBean.getApkDownloadSize() * 100) / apkUpdateBean.getApkSize()));
        viewHolder.adapter_apk_stateTv.setVisibility(0);
        viewHolder.adapter_apk_stateTv.setTextColor(this.mContext.getResources().getColor(R.color.dialog_red));
        if (apkUpdateBean.getInstallState() == 0) {
            viewHolder.adapter_apk_stateTv.setText(this.mContext.getResources().getString(R.string.installing));
            viewHolder.adapter_apk_stateTv.setTextColor(this.mContext.getResources().getColor(R.color.lightyellow));
        } else if (apkUpdateBean.getInstallState() == 1) {
            viewHolder.adapter_apk_stateTv.setText(this.mContext.getResources().getString(R.string.installed));
            viewHolder.adapter_apk_stateTv.setTextColor(this.mContext.getResources().getColor(R.color.lightgreen));
        } else if (apkUpdateBean.getInstallState() == -2) {
            viewHolder.adapter_apk_stateTv.setText(this.mContext.getResources().getString(R.string.downloader_download_failed_ticker));
            viewHolder.adapter_apk_stateTv.setTextColor(this.mContext.getResources().getColor(R.color.dialog_red));
        } else {
            viewHolder.adapter_apk_stateTv.setText(str);
            viewHolder.adapter_apk_stateTv.setTextColor(this.mContext.getResources().getColor(R.color.dialog_lightgray));
        }
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.apkLists == null ? 0 : this.apkLists.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int i) {
        return this.apkLists.get(i);
    }

    @Override // android.widget.Adapter
    public long getItemId(int i) {
        return i;
    }

    @Override // android.widget.Adapter
    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder viewHolder;
        if (view == null) {
            viewHolder = new ViewHolder();
            view = LayoutInflater.from(this.mContext).inflate(R.layout.adapter_apkupdate, (ViewGroup) null);
            viewHolder.adapter_apk_nameTv = (TextView) view.findViewById(R.id.adapter_apk_nameTv);
            viewHolder.adapter_apk_progressPb = (ProgressBar) view.findViewById(R.id.adapter_apk_progressPb);
            viewHolder.adapter_apk_stateTv = (TextView) view.findViewById(R.id.adapter_apk_stateTv);
            view.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) view.getTag();
        }
        updateProgress(viewHolder, i);
        return view;
    }

    public void setData(List<ApkUpdateBean> list) {
        this.apkLists = list;
    }

    public void updateView(View view, int i) {
        ViewHolder viewHolder;
        if (view == null || (viewHolder = (ViewHolder) view.getTag()) == null) {
            return;
        }
        updateProgress(viewHolder, i);
    }
}
