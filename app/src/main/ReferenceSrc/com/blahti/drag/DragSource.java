package com.blahti.drag;

import android.view.View;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public interface DragSource {
    boolean allowDrag();

    void onDropCompleted(View view, boolean z);

    void setDragController(DragController dragController);
}
