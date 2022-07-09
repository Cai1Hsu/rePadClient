package com.anfengde.android;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;

/* loaded from: classes.dex */
public class ActionItem {
    private int actionId;
    private Drawable icon;
    private boolean selected;
    private boolean sticky;
    private Bitmap thumb;
    private String title;

    public ActionItem(int actionId, String title, Drawable icon) {
        this.actionId = -1;
        this.title = title;
        this.icon = icon;
        this.actionId = actionId;
    }

    public ActionItem() {
        this(-1, null, null);
    }

    public ActionItem(int actionId, String title) {
        this(actionId, title, null);
    }

    public ActionItem(Drawable icon) {
        this(-1, null, icon);
    }

    public ActionItem(int actionId, Drawable icon) {
        this(actionId, null, icon);
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return this.title;
    }

    public void setIcon(Drawable icon) {
        this.icon = icon;
    }

    public Drawable getIcon() {
        return this.icon;
    }

    public void setActionId(int actionId) {
        this.actionId = actionId;
    }

    public int getActionId() {
        return this.actionId;
    }

    public void setSticky(boolean sticky) {
        this.sticky = sticky;
    }

    public boolean isSticky() {
        return this.sticky;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }

    public boolean isSelected() {
        return this.selected;
    }

    public void setThumb(Bitmap thumb) {
        this.thumb = thumb;
    }

    public Bitmap getThumb() {
        return this.thumb;
    }
}
