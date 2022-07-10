package com.pgyersdk.d;

import android.view.MotionEvent;
import android.view.View;
import android.view.inputmethod.InputMethodManager;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class c implements View.OnTouchListener {
    final /* synthetic */ a a;

    public c(a aVar) {
        this.a = aVar;
    }

    @Override // android.view.View.OnTouchListener
    public final boolean onTouch(View v, MotionEvent motionEvent) {
        if (a.c(this.a) != null) {
            ((InputMethodManager) a.c(this.a).getSystemService("input_method")).hideSoftInputFromWindow(v.getWindowToken(), 2);
            return false;
        }
        return false;
    }
}
