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

/* loaded from: classes.jar:com/anfengde/epub/ui/BookListAdapter.class */
public class BookListAdapter extends BaseAdapter {
    private Context context;
    private List<Map<String, Object>> mData;

    /* loaded from: classes.jar:com/anfengde/epub/ui/BookListAdapter$ViewHolder.class */
    public final class ViewHolder {
        public ImageView img;
        public TextView info;
        public TextView title;

        public ViewHolder() {
            BookListAdapter.this = r4;
        }
    }

    public BookListAdapter(Context context, List<Map<String, Object>> list) {
        this.mData = list;
        this.context = context;
    }

    @Override // android.widget.Adapter
    public int getCount() {
        return this.mData.size();
    }

    @Override // android.widget.Adapter
    public Object getItem(int i) {
        return this.mData.get(i);
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
            view = LayoutInflater.from(this.context).inflate(R.layout.afd_books_list_item, (ViewGroup) null);
            viewHolder.img = (ImageView) view.findViewById(R.id.afd_img);
            viewHolder.title = (TextView) view.findViewById(R.id.afd_title);
            viewHolder.info = (TextView) view.findViewById(R.id.afd_info);
            view.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) view.getTag();
        }
        viewHolder.img.setBackgroundResource(((Integer) this.mData.get(i).get("img")).intValue());
        viewHolder.title.setText((String) this.mData.get(i).get("title"));
        viewHolder.info.setText((String) this.mData.get(i).get("info"));
        return view;
    }
}
