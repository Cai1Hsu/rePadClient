package com.anfengde.android;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;

/* loaded from: classes.jar:com/anfengde/android/ActionItem.class */
public class ActionItem {
    private int actionId;
    private Drawable icon;
    private boolean selected;
    private boolean sticky;
    private Bitmap thumb;
    private String title;

    public ActionItem() {
        this(-1, null, null);
    }

    public ActionItem(int i, Drawable drawable) {
        this(i, null, drawable);
    }

    public ActionItem(int i, String str) {
        this(i, str, null);
    }

    public ActionItem(int i, String str, Drawable drawable) {
        this.actionId = -1;
        this.title = str;
        this.icon = drawable;
        this.actionId = i;
    }

    public ActionItem(Drawable drawable) {
        this(-1, null, drawable);
    }

    public int getActionId() {
        return this.actionId;
    }

    public Drawable getIcon() {
        return this.icon;
    }

    public Bitmap getThumb() {
        return this.thumb;
    }

    public String getTitle() {
        return this.title;
    }

    public boolean isSelected() {
        return this.selected;
    }

    public boolean isSticky() {
        return this.sticky;
    }

    public void setActionId(int i) {
        this.actionId = i;
    }

    public void setIcon(Drawable drawable) {
        this.icon = drawable;
    }

    public void setSelected(boolean z) {
        this.selected = z;
    }

    public void setSticky(boolean z) {
        this.sticky = z;
    }

    public void setThumb(Bitmap bitmap) {
        this.thumb = bitmap;
    }

    public void setTitle(String str) {
        this.title = str;
    }
}
