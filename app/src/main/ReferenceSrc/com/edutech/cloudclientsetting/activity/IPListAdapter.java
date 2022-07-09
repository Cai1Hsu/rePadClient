package com.edutech.cloudclientsetting.activity;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.launcher.activity.R;
import java.util.List;

/* loaded from: classes.dex */
public class IPListAdapter extends BaseAdapter {
    IpInterface ipControl;
    List<String> ips;
    Context mcontext;

    /* loaded from: classes.dex */
    public interface IpInterface {
        void deleteIp(String str);

        void okIp(String str);
    }

    public IPListAdapter(List<String> ips, Context mcontext, IpInterface ipcontrol) {
        this.ips = ips;
        this.mcontext = mcontext;
        this.ipControl = ipcontrol;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        if (this.ips == null) {
            return 0;
        }
        return this.ips.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return (this.ips == null || this.ips.size() <= position) ? "" : this.ips.get(position);
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }

    @Override // android.widget.Adapter
    public View getView(final int position, View convertView, ViewGroup parent) {
        IpHolder holder = new IpHolder();
        if (convertView == null) {
            convertView = LayoutInflater.from(this.mcontext).inflate(R.layout.adapter_iplist, (ViewGroup) null);
            holder.tv_ip = (TextView) convertView.findViewById(R.id.adapter_tv_ip);
            holder.tv_delete = (TextView) convertView.findViewById(R.id.adapter_tv_delete);
            convertView.setTag(holder);
        } else {
            holder = (IpHolder) convertView.getTag();
        }
        holder.tv_ip.setText(this.ips.get(position));
        holder.tv_delete.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.IPListAdapter.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (IPListAdapter.this.ipControl != null) {
                    IPListAdapter.this.ipControl.deleteIp(IPListAdapter.this.ips.get(position));
                }
            }
        });
        holder.tv_ip.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.IPListAdapter.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                if (IPListAdapter.this.ipControl != null) {
                    IPListAdapter.this.ipControl.okIp(IPListAdapter.this.ips.get(position));
                }
            }
        });
        return convertView;
    }

    public void setIps(List<String> ips) {
        this.ips = ips;
    }

    /* loaded from: classes.dex */
    class IpHolder {
        TextView tv_delete;
        TextView tv_ip;

        IpHolder() {
            IPListAdapter.this = r1;
        }
    }
}
