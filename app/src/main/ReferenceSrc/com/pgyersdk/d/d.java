package com.pgyersdk.d;

import android.widget.CompoundButton;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
final class d implements CompoundButton.OnCheckedChangeListener {
    final /* synthetic */ a a;

    public d(a aVar) {
        this.a = aVar;
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public final void onCheckedChanged(CompoundButton compoundButton, boolean isChecked) {
        if (isChecked) {
            a.a(this.a).setVisibility(0);
        } else {
            a.a(this.a).setVisibility(8);
        }
    }
}
