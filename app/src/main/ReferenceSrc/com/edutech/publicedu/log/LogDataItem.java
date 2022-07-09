package com.edutech.publicedu.log;

/* loaded from: classes.jar:com/edutech/publicedu/log/LogDataItem.class */
public class LogDataItem {
    private String AssetsID;
    private String AssetsName;
    private String BookID;
    private String BookName;
    private String FirstTime;
    private String LastTime;
    private String SectionsID;
    private String SubjectID;
    private String TotalTime;
    private String Type;
    private String VisitCount;

    public String getAssetsID() {
        return this.AssetsID;
    }

    public String getAssetsName() {
        return this.AssetsName;
    }

    public String getBookID() {
        return this.BookID;
    }

    public String getBookName() {
        return this.BookName;
    }

    public String getFirstTime() {
        return this.FirstTime;
    }

    public String getLastTime() {
        return this.LastTime;
    }

    public String getSectionsID() {
        return this.SectionsID;
    }

    public String getSubjectID() {
        return this.SubjectID;
    }

    public String getTotalTime() {
        return this.TotalTime;
    }

    public String getType() {
        return this.Type;
    }

    public String getVisitCount() {
        return this.VisitCount;
    }

    public void setAssetsID(String str) {
        this.AssetsID = str;
    }

    public void setAssetsName(String str) {
        this.AssetsName = str;
    }

    public void setBookID(String str) {
        this.BookID = str;
    }

    public void setBookName(String str) {
        this.BookName = str;
    }

    public void setFirstTime(String str) {
        this.FirstTime = str;
    }

    public void setLastTime(String str) {
        this.LastTime = str;
    }

    public void setSectionsID(String str) {
        this.SectionsID = str;
    }

    public void setSubjectID(String str) {
        this.SubjectID = str;
    }

    public void setTotalTime(String str) {
        this.TotalTime = str;
    }

    public void setType(String str) {
        this.Type = str;
    }

    public void setVisitCount(String str) {
        this.VisitCount = str;
    }

    public String toString() {
        return "LogDataItem [Type=" + this.Type + ", SubjectID=" + this.SubjectID + ", BookID=" + this.BookID + ", BookName=" + this.BookName + ", SectionsID=" + this.SectionsID + ", AssetsID=" + this.AssetsID + ", AssetsName=" + this.AssetsName + ", FirstTime=" + this.FirstTime + ", LastTime=" + this.LastTime + ", TotalTime=" + this.TotalTime + ", VisitCount=" + this.VisitCount + "]";
    }
}
