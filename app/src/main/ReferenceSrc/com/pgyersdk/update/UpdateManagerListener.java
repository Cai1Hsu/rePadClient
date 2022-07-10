package com.pgyersdk.update;

import com.pgyersdk.crash.h;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public abstract class UpdateManagerListener extends h {
    public abstract void onNoUpdateAvailable();

    public abstract void onUpdateAvailable();

    public void onUpdateAvailable(String str, String str2) {
        onUpdateAvailable();
    }
}
