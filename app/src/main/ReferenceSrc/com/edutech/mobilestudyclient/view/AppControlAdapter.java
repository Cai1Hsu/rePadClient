package com.edutech.mobilestudyclient.view;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.edutech.mobilestudyclient.util.AppDetails;
import com.launcher.activity.R;
import java.util.List;

/* loaded from: classes.dex */
public class AppControlAdapter extends BaseAdapter {
    private List<AppDetails> details;
    private Context mContext;

    public AppControlAdapter(List<AppDetails> details, Context mContext) {
        this.details = details;
        this.mContext = mContext;
    }

    public List<AppDetails> getDetails() {
        return this.details;
    }

    public void setDetails(List<AppDetails> details) {
        this.details = details;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        if (this.details == null) {
            return 0;
        }
        return this.details.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int arg0) {
        if (this.details == null) {
            return null;
        }
        return this.details.get(arg0);
    }

    @Override // android.widget.Adapter
    public long getItemId(int arg0) {
        return arg0;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup arg2) {
        ViewHolder holder;
        if (convertView == null) {
            convertView = LayoutInflater.from(this.mContext).inflate(R.layout.appcontroladapter, (ViewGroup) null);
            holder = new ViewHolder();
            holder.img_icon = (ImageView) convertView.findViewById(R.id.img_icon);
            holder.tv_name = (TextView) convertView.findViewById(R.id.tv_name);
            holder.tv_version = (TextView) convertView.findViewById(R.id.tv_version);
            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }
        if (this.details.size() > position) {
            AppDetails appinfo = this.details.get(position);
            Drawable icon = appinfo.getAppIcon();
            String name = appinfo.getAppName();
            String version = appinfo.getAppVersion();
            if (icon != null) {
                holder.img_icon.setBackgroundDrawable(icon);
            }
            if (name != null) {
                holder.tv_name.setText(name);
            }
            if (version != null) {
                holder.tv_version.setText("V: " + version);
            }
        }
        return convertView;
    }

    /* loaded from: classes.dex */
    class ViewHolder {
        ImageView img_icon;
        TextView tv_name;
        TextView tv_version;

        ViewHolder() {
            AppControlAdapter.this = r1;
        }
    }
}
