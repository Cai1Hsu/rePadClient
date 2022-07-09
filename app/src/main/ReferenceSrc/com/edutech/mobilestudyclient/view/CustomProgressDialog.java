package com.edutech.mobilestudyclient.view;

import android.app.Dialog;
import android.content.Context;
import android.view.View;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.edutech.mobilestudyclient.ApkUpdateBean;
import com.launcher.activity.R;
import java.util.List;

/* loaded from: classes.dex */
public class CustomProgressDialog extends Dialog {
    private ApkUpdateAdapter apkUpdateAdapter;
    private List<ApkUpdateBean> apkUpdateList;
    private Context context;
    private ListView ctmdialog_list;

    public CustomProgressDialog(Context context, int theme) {
        super(context, theme);
    }

    public CustomProgressDialog(Context context, List<ApkUpdateBean> list) {
        super(context, R.style.CustomProgressDialog);
        this.apkUpdateList = list;
        this.context = context;
        setContentView(R.layout.customdialog_new);
        this.ctmdialog_list = (ListView) findViewById(R.id.ctmdialog_list);
        this.apkUpdateList = list;
        this.apkUpdateAdapter = new ApkUpdateAdapter(this.apkUpdateList, context);
        this.ctmdialog_list.setAdapter((ListAdapter) this.apkUpdateAdapter);
        getWindow().getAttributes().gravity = 17;
    }

    public CustomProgressDialog(Context context) {
        super(context);
    }

    public void setData(List<ApkUpdateBean> list) {
        this.apkUpdateList = list;
        this.apkUpdateAdapter.setData(this.apkUpdateList);
        this.apkUpdateAdapter.notifyDataSetChanged();
    }

    public void updateProgress(int itemIndex) {
        int visiblePosition = this.ctmdialog_list.getFirstVisiblePosition();
        if (itemIndex - visiblePosition >= 0) {
            View view = this.ctmdialog_list.getChildAt(itemIndex - visiblePosition);
            this.apkUpdateAdapter.updateView(view, itemIndex);
        }
    }

    public void resetData() {
        this.apkUpdateAdapter = null;
        this.apkUpdateList.clear();
        this.apkUpdateList = null;
        this.ctmdialog_list = null;
    }
}
