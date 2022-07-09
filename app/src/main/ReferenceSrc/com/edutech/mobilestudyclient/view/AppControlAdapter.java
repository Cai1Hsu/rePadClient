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

/* loaded from: classes.jar:com/edutech/mobilestudyclient/view/AppControlAdapter.class */
public class AppControlAdapter extends BaseAdapter {
    private List<AppDetails> details;
    private Context mContext;

    /* loaded from: classes.jar:com/edutech/mobilestudyclient/view/AppControlAdapter$ViewHolder.class */
    class ViewHolder {
        ImageView img_icon;
        TextView tv_name;
        TextView tv_version;

        ViewHolder() {
            AppControlAdapter.this = r4;
        }
    }

    public AppControlAdapter(List<AppDetails> list, Context context) {
        this.details = list;
        this.mContext = context;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.details == null ? 0 : this.details.size();
    }

    public List<AppDetails> getDetails() {
        return this.details;
    }

    @Override // android.widget.Adapter
    public Object getItem(int i) {
        return this.details == null ? null : this.details.get(i);
    }

    @Override // android.widget.Adapter
    public long getItemId(int i) {
        return i;
    }

    @Override // android.widget.Adapter
    public View getView(int i, View view, ViewGroup viewGroup) {
        ViewHolder viewHolder;
        if (view == null) {
            view = LayoutInflater.from(this.mContext).inflate(R.layout.appcontroladapter, (ViewGroup) null);
            viewHolder = new ViewHolder();
            viewHolder.img_icon = (ImageView) view.findViewById(R.id.img_icon);
            viewHolder.tv_name = (TextView) view.findViewById(R.id.tv_name);
            viewHolder.tv_version = (TextView) view.findViewById(R.id.tv_version);
            view.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) view.getTag();
        }
        if (this.details.size() > i) {
            AppDetails appDetails = this.details.get(i);
            Drawable appIcon = appDetails.getAppIcon();
            String appName = appDetails.getAppName();
            String appVersion = appDetails.getAppVersion();
            if (appIcon != null) {
                viewHolder.img_icon.setBackgroundDrawable(appIcon);
            }
            if (appName != null) {
                viewHolder.tv_name.setText(appName);
            }
            if (appVersion != null) {
                viewHolder.tv_version.setText("V: " + appVersion);
            }
        }
        return view;
    }

    public void setDetails(List<AppDetails> list) {
        this.details = list;
    }
}
