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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class NameListAdapter extends BaseAdapter {
    Context mcontext;
    NameHistoryInterface nameControl;
    List<HashMap<String, String>> names;

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    public interface NameHistoryInterface {
        void deleteName(String str);

        void okName(String str);
    }

    public NameListAdapter(List<HashMap<String, String>> names, Context mcontext, NameHistoryInterface nameControl) {
        this.names = names;
        this.mcontext = mcontext;
        this.nameControl = nameControl;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        if (this.names == null) {
            return 0;
        }
        return this.names.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return (this.names == null || this.names.size() <= position) ? "" : this.names.get(position);
    }

    @Override // android.widget.Adapter
    public long getItemId(int position) {
        return position;
    }

    @Override // android.widget.Adapter
    public View getView(int position, View convertView, ViewGroup parent) {
        IpHolder holder = new IpHolder();
        if (convertView == null) {
            convertView = LayoutInflater.from(this.mcontext).inflate(R.layout.adapter_iplist, (ViewGroup) null);
            holder.tv_ip = (TextView) convertView.findViewById(R.id.adapter_tv_ip);
            holder.tv_delete = (TextView) convertView.findViewById(R.id.adapter_tv_delete);
            convertView.setTag(holder);
        } else {
            holder = (IpHolder) convertView.getTag();
        }
        HashMap<String, String> infoMap = this.names.get(position);
        String info = "";
        if (infoMap.containsKey("name") && infoMap.containsKey("code")) {
            info = String.valueOf(infoMap.get("code")) + ":  " + infoMap.get("name");
        }
        holder.tv_ip.setText(info);
        holder.tv_delete.setOnClickListener(new AnonymousClass1(position));
        holder.tv_ip.setOnClickListener(new AnonymousClass2(position));
        return convertView;
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.NameListAdapter$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements View.OnClickListener {
        private final /* synthetic */ int val$position;

        AnonymousClass1(int i) {
            NameListAdapter.this = r1;
            this.val$position = i;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (NameListAdapter.this.nameControl != null && NameListAdapter.this.names.get(this.val$position).containsKey("code")) {
                NameListAdapter.this.nameControl.deleteName(NameListAdapter.this.names.get(this.val$position).get("code"));
            }
        }
    }

    /* renamed from: com.edutech.cloudclientsetting.activity.NameListAdapter$2 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass2 implements View.OnClickListener {
        private final /* synthetic */ int val$position;

        AnonymousClass2(int i) {
            NameListAdapter.this = r1;
            this.val$position = i;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (NameListAdapter.this.nameControl != null && NameListAdapter.this.names.get(this.val$position).containsKey("code")) {
                NameListAdapter.this.nameControl.okName(NameListAdapter.this.names.get(this.val$position).get("code"));
            }
        }
    }

    public void setIps(List<HashMap<String, String>> names) {
        this.names = names;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class IpHolder {
        TextView tv_delete;
        TextView tv_ip;

        IpHolder() {
            NameListAdapter.this = r1;
        }
    }
}
