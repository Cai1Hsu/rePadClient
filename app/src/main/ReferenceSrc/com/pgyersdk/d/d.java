package com.pgyersdk.d;

import android.widget.CompoundButton;
import android.widget.ImageView;

/* loaded from: classes.dex */
final class d implements CompoundButton.OnCheckedChangeListener {
    final /* synthetic */ a a;

    d(a aVar) {
        this.a = aVar;
    }

    @Override // android.widget.CompoundButton.OnCheckedChangeListener
    public final void onCheckedChanged(CompoundButton compoundButton, boolean isChecked) {
        ImageView imageView;
        ImageView imageView2;
        if (isChecked) {
            imageView2 = this.a.f;
            imageView2.setVisibility(0);
            return;
        }
        imageView = this.a.f;
        imageView.setVisibility(8);
    }
}
