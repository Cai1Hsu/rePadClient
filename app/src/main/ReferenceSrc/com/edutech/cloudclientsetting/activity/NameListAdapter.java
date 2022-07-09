package com.edutech.cloudclientsetting.activity;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;
import com.launcher.activity.R;
import java.util.HashMap;
import java.util.List;

/* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/NameListAdapter.class */
public class NameListAdapter extends BaseAdapter {
    Context mcontext;
    NameHistoryInterface nameControl;
    List<HashMap<String, String>> names;

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/NameListAdapter$IpHolder.class */
    class IpHolder {
        TextView tv_delete;
        TextView tv_ip;

        IpHolder() {
            NameListAdapter.this = r4;
        }
    }

    /* loaded from: classes.jar:com/edutech/cloudclientsetting/activity/NameListAdapter$NameHistoryInterface.class */
    public interface NameHistoryInterface {
        void deleteName(String str);

        void okName(String str);
    }

    public NameListAdapter(List<HashMap<String, String>> list, Context context, NameHistoryInterface nameHistoryInterface) {
        this.names = list;
        this.mcontext = context;
        this.nameControl = nameHistoryInterface;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.names == null ? 0 : this.names.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int i) {
        return (this.names == null || this.names.size() <= i) ? "" : this.names.get(i);
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
        HashMap<String, String> hashMap = this.names.get(i);
        String str = "";
        if (hashMap.containsKey("name")) {
            str = "";
            if (hashMap.containsKey("code")) {
                str = String.valueOf(hashMap.get("code")) + ":  " + hashMap.get("name");
            }
        }
        ipHolder.tv_ip.setText(str);
        ipHolder.tv_delete.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.NameListAdapter.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                if (NameListAdapter.this.nameControl == null || !NameListAdapter.this.names.get(i).containsKey("code")) {
                    return;
                }
                NameListAdapter.this.nameControl.deleteName(NameListAdapter.this.names.get(i).get("code"));
            }
        });
        ipHolder.tv_ip.setOnClickListener(new View.OnClickListener() { // from class: com.edutech.cloudclientsetting.activity.NameListAdapter.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view2) {
                if (NameListAdapter.this.nameControl == null || !NameListAdapter.this.names.get(i).containsKey("code")) {
                    return;
                }
                NameListAdapter.this.nameControl.okName(NameListAdapter.this.names.get(i).get("code"));
            }
        });
        return view;
    }

    public void setIps(List<HashMap<String, String>> list) {
        this.names = list;
    }
}
