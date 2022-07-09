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

/* loaded from: classes.dex */
public class ApkUpdateAdapter extends BaseAdapter {
    private List<ApkUpdateBean> apkLists;
    private Context mContext;

    public ApkUpdateAdapter(List<ApkUpdateBean> apkLists, Context mContext) {
        this.apkLists = apkLists;
        this.mContext = mContext;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        if (this.apkLists == null) {
            return 0;
        }
        return this.apkLists.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return this.apkLists.get(position);
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        ViewHolder holder;
        if (convertView == null) {
            holder = new ViewHolder();
            convertView = LayoutInflater.from(this.mContext).inflate(R.layout.adapter_apkupdate, (ViewGroup) null);
            holder.adapter_apk_nameTv = (TextView) convertView.findViewById(R.id.adapter_apk_nameTv);
            holder.adapter_apk_progressPb = (ProgressBar) convertView.findViewById(R.id.adapter_apk_progressPb);
            holder.adapter_apk_stateTv = (TextView) convertView.findViewById(R.id.adapter_apk_stateTv);
            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }
        updateProgress(holder, position);
        return convertView;
    }

    public void setData(List<ApkUpdateBean> lists) {
        this.apkLists = lists;
    }

    public void updateView(View view, int index) {
        ViewHolder holder;
        if (view != null && (holder = (ViewHolder) view.getTag()) != null) {
            updateProgress(holder, index);
        }
    }

    private void updateProgress(ViewHolder holder, int position) {
        ApkUpdateBean bean = this.apkLists.get(position);
        holder.adapter_apk_nameTv.setText(bean.getAppName());
        DecimalFormat df = new DecimalFormat("##0.00");
        String alllength = df.format(((bean.getApkSize() * 1.0d) / 1024.0d) / 1024.0d);
        String currentPosition = df.format(((bean.getApkDownloadSize() * 1.0d) / 1024.0d) / 1024.0d);
        String allStateString = String.valueOf(currentPosition) + "MB/" + alllength + "MB";
        holder.adapter_apk_progressPb.setProgress((int) ((bean.getApkDownloadSize() * 100) / bean.getApkSize()));
        holder.adapter_apk_stateTv.setVisibility(0);
        holder.adapter_apk_stateTv.setTextColor(this.mContext.getResources().getColor(R.color.dialog_red));
        if (bean.getInstallState() == 0) {
            holder.adapter_apk_stateTv.setText(this.mContext.getResources().getString(R.string.installing));
            holder.adapter_apk_stateTv.setTextColor(this.mContext.getResources().getColor(R.color.lightyellow));
        } else if (bean.getInstallState() == 1) {
            holder.adapter_apk_stateTv.setText(this.mContext.getResources().getString(R.string.installed));
            holder.adapter_apk_stateTv.setTextColor(this.mContext.getResources().getColor(R.color.lightgreen));
        } else if (bean.getInstallState() == -2) {
            holder.adapter_apk_stateTv.setText(this.mContext.getResources().getString(R.string.downloader_download_failed_ticker));
            holder.adapter_apk_stateTv.setTextColor(this.mContext.getResources().getColor(R.color.dialog_red));
        } else {
            holder.adapter_apk_stateTv.setText(allStateString);
            holder.adapter_apk_stateTv.setTextColor(this.mContext.getResources().getColor(R.color.dialog_lightgray));
        }
    }

    /* loaded from: classes.dex */
    class ViewHolder {
        TextView adapter_apk_nameTv;
        ProgressBar adapter_apk_progressPb;
        TextView adapter_apk_stateTv;

        ViewHolder() {
            ApkUpdateAdapter.this = r1;
        }
    }
}
