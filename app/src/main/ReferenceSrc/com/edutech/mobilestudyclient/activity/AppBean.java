package com.edutech.mobilestudyclient.activity;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.HashMap;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class AppBean implements Parcelable {
    public static final Parcelable.Creator<AppBean> CREATOR = new AnonymousClass1();
    private String code;
    private String color;
    private HashMap<String, String> config;
    private int enable;
    private String icon;
    private String iconLocal;
    private String name;

    public AppBean() {
    }

    public AppBean(String code, String name, String color, String icon, int enable, HashMap<String, String> config, String iconLocal) {
        this.code = code;
        this.name = name;
        this.color = color;
        this.icon = icon;
        this.enable = enable;
        this.iconLocal = iconLocal;
        this.config = config;
    }

    public String getCode() {
        return this.code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getIcon() {
        return this.icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public int getEnable() {
        return this.enable;
    }

    public void setEnable(int enable) {
        this.enable = enable;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.code);
        dest.writeString(this.name);
        dest.writeString(this.color);
        dest.writeString(this.icon);
        dest.writeInt(this.enable);
    }

    protected AppBean(Parcel in) {
        this.code = in.readString();
        this.name = in.readString();
        this.color = in.readString();
        this.icon = in.readString();
        this.enable = in.readInt();
    }

    public HashMap<String, String> getConfig() {
        return this.config;
    }

    public void setConfig(HashMap<String, String> config) {
        this.config = config;
    }

    public String getIconLocal() {
        return this.iconLocal;
    }

    public void setIconLocal(String iconLocal) {
        this.iconLocal = iconLocal;
    }

    /* renamed from: com.edutech.mobilestudyclient.activity.AppBean$1 */
    /* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
    class AnonymousClass1 implements Parcelable.Creator<AppBean> {
        AnonymousClass1() {
        }

        @Override // android.os.Parcelable.Creator
        public AppBean createFromParcel(Parcel source) {
            return new AppBean(source);
        }

        @Override // android.os.Parcelable.Creator
        public AppBean[] newArray(int size) {
            return new AppBean[size];
        }
    }
}
