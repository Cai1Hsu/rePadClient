package com.edutech.mobilestudyclient.view;

import android.app.Dialog;
import android.content.Context;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.edutech.mobilestudyclient.ApkUpdateBean;
import com.launcher.activity.R;
import java.util.List;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/view/CustomProgressDialog.class */
public class CustomProgressDialog extends Dialog {
    private ApkUpdateAdapter apkUpdateAdapter;
    private List<ApkUpdateBean> apkUpdateList;
    private Context context;
    private ListView ctmdialog_list;

    public CustomProgressDialog(Context context) {
        super(context);
    }

    public CustomProgressDialog(Context context, int i) {
        super(context, i);
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

    public void resetData() {
        this.apkUpdateAdapter = null;
        this.apkUpdateList.clear();
        this.apkUpdateList = null;
        this.ctmdialog_list = null;
    }

    public void setData(List<ApkUpdateBean> list) {
        this.apkUpdateList = list;
        this.apkUpdateAdapter.setData(this.apkUpdateList);
        this.apkUpdateAdapter.notifyDataSetChanged();
    }

    public void updateProgress(int i) {
        int firstVisiblePosition = this.ctmdialog_list.getFirstVisiblePosition();
        if (i - firstVisiblePosition >= 0) {
            this.apkUpdateAdapter.updateView(this.ctmdialog_list.getChildAt(i - firstVisiblePosition), i);
        }
    }
}
