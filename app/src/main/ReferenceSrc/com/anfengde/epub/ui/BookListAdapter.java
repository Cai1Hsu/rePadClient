package com.anfengde.epub.ui;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import java.util.List;
import java.util.Map;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class BookListAdapter extends BaseAdapter {
    private Context context;
    private List<Map<String, Object>> mData;

    public BookListAdapter(Context context, List<Map<String, Object>> list) {
        this.mData = list;
        this.context = context;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.mData.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int position) {
        return this.mData.get(position);
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
            convertView = LayoutInflater.from(this.context).inflate(R.layout.afd_books_list_item, (ViewGroup) null);
            holder.img = (ImageView) convertView.findViewById(R.id.afd_img);
            holder.title = (TextView) convertView.findViewById(R.id.afd_title);
            holder.info = (TextView) convertView.findViewById(R.id.afd_info);
            convertView.setTag(holder);
        } else {
            holder = (ViewHolder) convertView.getTag();
        }
        holder.img.setBackgroundResource(((Integer) this.mData.get(position).get("img")).intValue());
        holder.title.setText((String) this.mData.get(position).get("title"));
        holder.info.setText((String) this.mData.get(position).get("info"));
        return convertView;
    }

    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    public final class ViewHolder {
        public ImageView img;
        public TextView info;
        public TextView title;

        public ViewHolder() {
            BookListAdapter.this = r1;
        }
    }
}
