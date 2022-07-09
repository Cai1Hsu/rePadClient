package com.edutech.mobilestudyclient.activity;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.HashMap;

/* loaded from: classes.jar:com/edutech/mobilestudyclient/activity/AppBean.class */
public class AppBean implements Parcelable {
    public static final Parcelable.Creator<AppBean> CREATOR = new Parcelable.Creator<AppBean>() { // from class: com.edutech.mobilestudyclient.activity.AppBean.1
        @Override // android.os.Parcelable.Creator
        public AppBean createFromParcel(Parcel parcel) {
            return new AppBean(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public AppBean[] newArray(int i) {
            return new AppBean[i];
        }
    };
    private String code;
    private String color;
    private HashMap<String, String> config;
    private int enable;
    private String icon;
    private String iconLocal;
    private String name;

    public AppBean() {
    }

    protected AppBean(Parcel parcel) {
        this.code = parcel.readString();
        this.name = parcel.readString();
        this.color = parcel.readString();
        this.icon = parcel.readString();
        this.enable = parcel.readInt();
    }

    public AppBean(String str, String str2, String str3, String str4, int i, HashMap<String, String> hashMap, String str5) {
        this.code = str;
        this.name = str2;
        this.color = str3;
        this.icon = str4;
        this.enable = i;
        this.iconLocal = str5;
        this.config = hashMap;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public String getCode() {
        return this.code;
    }

    public String getColor() {
        return this.color;
    }

    public HashMap<String, String> getConfig() {
        return this.config;
    }

    public int getEnable() {
        return this.enable;
    }

    public String getIcon() {
        return this.icon;
    }

    public String getIconLocal() {
        return this.iconLocal;
    }

    public String getName() {
        return this.name;
    }

    public void setCode(String str) {
        this.code = str;
    }

    public void setColor(String str) {
        this.color = str;
    }

    public void setConfig(HashMap<String, String> hashMap) {
        this.config = hashMap;
    }

    public void setEnable(int i) {
        this.enable = i;
    }

    public void setIcon(String str) {
        this.icon = str;
    }

    public void setIconLocal(String str) {
        this.iconLocal = str;
    }

    public void setName(String str) {
        this.name = str;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.code);
        parcel.writeString(this.name);
        parcel.writeString(this.color);
        parcel.writeString(this.icon);
        parcel.writeInt(this.enable);
    }
}
