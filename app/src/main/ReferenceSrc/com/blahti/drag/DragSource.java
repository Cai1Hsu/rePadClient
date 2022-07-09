package com.blahti.drag;

import android.view.View;

/* loaded from: classes.jar:com/blahti/drag/DragSource.class */
public interface DragSource {
    boolean allowDrag();

    void onDropCompleted(View view, boolean z);

    void setDragController(DragController dragController);
}
