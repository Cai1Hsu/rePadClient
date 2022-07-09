package com.anfengde.android;

import android.content.Context;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.PopupWindow;

/* loaded from: classes.jar:com/anfengde/android/PopupWindows.class */
public class PopupWindows {
    protected Drawable mBackground = null;
    protected Context mContext;
    protected View mRootView;
    protected PopupWindow mWindow;
    protected WindowManager mWindowManager;

    public PopupWindows(Context context) {
        this.mContext = context;
        this.mWindow = new PopupWindow(context);
        this.mWindow.setTouchInterceptor(new View.OnTouchListener() { // from class: com.anfengde.android.PopupWindows.1
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if (motionEvent.getAction() == 4) {
                    PopupWindows.this.mWindow.dismiss();
                    return false;
                }
                return false;
            }
        });
        this.mWindowManager = (WindowManager) context.getSystemService("window");
    }

    public void dismiss() {
        this.mWindow.dismiss();
    }

    protected void onDismiss() {
    }

    protected void onShow() {
    }

    protected void preShow() {
        if (this.mRootView == null) {
            throw new IllegalStateException("setContentView was not called with a view to display.");
        }
        onShow();
        if (this.mBackground == null) {
            this.mWindow.setBackgroundDrawable(new BitmapDrawable());
        } else {
            this.mWindow.setBackgroundDrawable(this.mBackground);
        }
        this.mWindow.setWidth(-2);
        this.mWindow.setHeight(-2);
        this.mWindow.setTouchable(true);
        this.mWindow.setOutsideTouchable(true);
        this.mWindow.setContentView(this.mRootView);
    }

    public void setBackgroundDrawable(Drawable drawable) {
        this.mBackground = drawable;
    }

    public void setContentView(int i) {
        setContentView(((LayoutInflater) this.mContext.getSystemService("layout_inflater")).inflate(i, (ViewGroup) null));
    }

    public void setContentView(View view) {
        this.mRootView = view;
        this.mWindow.setContentView(view);
    }

    public void setOnDismissListener(PopupWindow.OnDismissListener onDismissListener) {
        this.mWindow.setOnDismissListener(onDismissListener);
    }
}
