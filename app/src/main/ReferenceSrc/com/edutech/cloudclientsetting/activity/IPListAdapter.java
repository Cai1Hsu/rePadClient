package com.edutech.cloudclientsetting.activity;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.launcher.activity.R;
import java.util.List;

/* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/IPListAdapter.class */
public class IPListAdapter extends BaseAdapter {
    IpInterface ipControl;
    List<String> ips;
    Context mcontext;

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/IPListAdapter$IpHolder.class */
    class IpHolder {
        TextView tv_delete;
        TextView tv_ip;

        IpHolder() {
            IPListAdapter.this = r4;
        }
    }

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/IPListAdapter$IpInterface.class */
    public interface IpInterface {
        void deleteIp(String str);

        void okIp(String str);
    }

    public IPListAdapter(List<String> list, Context context, IpInterface ipInterface) {
        this.ips = list;
        this.mcontext = context;
        this.ipControl = ipInterface;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.ips == null ? 0 : this.ips.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int i) {
        return (this.ips == null || this.ips.size() <= i) ? "" : this.ips.get(i);
    }

    @Override // android.widget.Adapter
    public long getItemId(int i) {
        return i;
    }

    @Override // android.widget.Adapter
    public View getView(final int i, View view, ViewGroup viewGroup) {
        IpHolder ipHolder = new IpHolder();
        if (view == null) {
            view = LayoutInflater.from(this.mcontext).inflate(R.layout.adapter_iplist, (ViewGroup) null);
            ipHolder.tv_ip = (TextView) view.findViewById(R.id.adapter_tv_ip);
            ipHolder.tv_delete = (TextView) view.findViewById(R.id.adapter_tv_delete);
            view.setTag(ipHolder);
        } else {
            ipHolder = (IpHolder) view.getTag();
        }
        ipHolder.tv_ip.setText(this.ips.get(i));
        ipHolder.tv_delete.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.IPListAdapter.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                if (IPListAdapter.this.ipControl != null) {
                    IPListAdapter.this.ipControl.deleteIp(IPListAdapter.this.ips.get(i));
                }
            }
        });
        ipHolder.tv_ip.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.IPListAdapter.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                if (IPListAdapter.this.ipControl != null) {
                    IPListAdapter.this.ipControl.okIp(IPListAdapter.this.ips.get(i));
                }
            }
        });
        return view;
    }

    public void setIps(List<String> list) {
        this.ips = list;
    }
}
