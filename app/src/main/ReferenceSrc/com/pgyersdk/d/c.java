package com.pgyersdk.d;

import android.app.Activity;
import android.view.MotionEvent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;

/* loaded from: classes.jar:com/pgyersdk/d/c.class */
final class c implements View.OnTouchListener {
    final /* synthetic */ a a;

    c(a aVar) {
        this.a = aVar;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View view, MotionEvent motionEvent) {
        Activity activity;
        Activity activity2;
        activity = this.a.c;
        if (activity != null) {
            activity2 = this.a.c;
            ((InputMethodManager) activity2.getSystemService("input_method")).hideSoftInputFromWindow(view.getWindowToken(), 2);
            return false;
        }
        return false;
    }
}