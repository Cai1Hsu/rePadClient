package com.pgyersdk.update;

import com.pgyersdk.crash.h;

/* loaded from: classes.dex */
public abstract class UpdateManagerListener extends h {
    public abstract void onNoUpdateAvailable();

    public abstract void onUpdateAvailable();

    public void onUpdateAvailable(String str, String str2) {
        onUpdateAvailable();
    }
}
