package com.edutech.publicedu.log;

import java.util.List;

/* loaded from: classes.dex */
public class LogInfo {
    private String MachineID;
    private String UserID;
    private List<LogDataItem> data;

    public String getUserID() {
        return this.UserID;
    }

    public void setUserID(String userID) {
        this.UserID = userID;
    }

    public String getMachineID() {
        return this.MachineID;
    }

    public void setMachineID(String machineID) {
        this.MachineID = machineID;
    }

    public List<LogDataItem> getData() {
        return this.data;
    }

    public void setData(List<LogDataItem> data) {
        this.data = data;
    }

    public String toString() {
        return "LogItem [UserID=" + this.UserID + ", MachineID=" + this.MachineID + ", data=" + this.data + "]";
    }
}
