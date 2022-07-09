package com.edutech.publicedu.log;

import java.util.List;

/* loaded from: classes.jar:com/edutech/publicedu/log/LogInfo.class */
public class LogInfo {
    private String MachineID;
    private String UserID;
    private List<LogDataItem> data;

    public List<LogDataItem> getData() {
        return this.data;
    }

    public String getMachineID() {
        return this.MachineID;
    }

    public String getUserID() {
        return this.UserID;
    }

    public void setData(List<LogDataItem> list) {
        this.data = list;
    }

    public void setMachineID(String str) {
        this.MachineID = str;
    }

    public void setUserID(String str) {
        this.UserID = str;
    }

    public String toString() {
        return "LogItem [UserID=" + this.UserID + ", MachineID=" + this.MachineID + ", data=" + this.data + "]";
    }
}
