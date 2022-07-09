package com.blahti.drag;

import android.view.View;

/* loaded from: classes.dex */
public interface DragSource {
    boolean allowDrag();

    void onDropCompleted(View view, boolean z);

    void setDragController(DragController dragController);
}
