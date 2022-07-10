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
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class PopupWindows {
    protected Drawable mBackground = null;
    protected Context mContext;
    protected View mRootView;
    protected PopupWindow mWindow;
    protected WindowManager mWindowManager;

    public PopupWindows(Context context) {
        this.mContext = context;
        this.mWindow = new PopupWindow(context);
        this.mWindow.setTouchInterceptor(new AnonymousClass1());
        this.mWindowManager = (WindowManager) context.getSystemService("window");
    }

    /* renamed from: com.anfengde.android.PopupWindows$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements View.OnTouchListener {
        AnonymousClass1() {
            PopupWindows.this = r1;
        }

        @Override // android.view.View.OnTouchListener
        public boolean onTouch(View v, MotionEvent event) {
            if (event.getAction() == 4) {
                PopupWindows.this.mWindow.dismiss();
            }
            return false;
        }
    }

    public void onDismiss() {
    }

    protected void onShow() {
    }

    public void preShow() {
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

    public void setBackgroundDrawable(Drawable background) {
        this.mBackground = background;
    }

    public void setContentView(View root) {
        this.mRootView = root;
        this.mWindow.setContentView(root);
    }

    public void setContentView(int layoutResID) {
        LayoutInflater inflator = (LayoutInflater) this.mContext.getSystemService("layout_inflater");
        setContentView(inflator.inflate(layoutResID, (ViewGroup) null));
    }

    public void setOnDismissListener(PopupWindow.OnDismissListener listener) {
        this.mWindow.setOnDismissListener(listener);
    }

    public void dismiss() {
        this.mWindow.dismiss();
    }
}
