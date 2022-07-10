package com.edutech.publicedu.log;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    public String getType() {
        return this.Type;
    }

    public void setType(String type) {
        this.Type = type;
    }

    public String getSubjectID() {
        return this.SubjectID;
    }

    public void setSubjectID(String subjectID) {
        this.SubjectID = subjectID;
    }

    public String getBookID() {
        return this.BookID;
    }

    public void setBookID(String bookID) {
        this.BookID = bookID;
    }

    public String getBookName() {
        return this.BookName;
    }

    public void setBookName(String bookName) {
        this.BookName = bookName;
    }

    public String getSectionsID() {
        return this.SectionsID;
    }

    public void setSectionsID(String sectionsID) {
        this.SectionsID = sectionsID;
    }

    public String getAssetsID() {
        return this.AssetsID;
    }

    public void setAssetsID(String assetsID) {
        this.AssetsID = assetsID;
    }

    public String getAssetsName() {
        return this.AssetsName;
    }

    public void setAssetsName(String assetsName) {
        this.AssetsName = assetsName;
    }

    public String getFirstTime() {
        return this.FirstTime;
    }

    public void setFirstTime(String firstTime) {
        this.FirstTime = firstTime;
    }

    public String getLastTime() {
        return this.LastTime;
    }

    public void setLastTime(String lastTime) {
        this.LastTime = lastTime;
    }

    public String getTotalTime() {
        return this.TotalTime;
    }

    public void setTotalTime(String totalTime) {
        this.TotalTime = totalTime;
    }

    public String getVisitCount() {
        return this.VisitCount;
    }

    public void setVisitCount(String visitCount) {
        this.VisitCount = visitCount;
    }

    public String toString() {
        return "LogDataItem [Type=" + this.Type + ", SubjectID=" + this.SubjectID + ", BookID=" + this.BookID + ", BookName=" + this.BookName + ", SectionsID=" + this.SectionsID + ", AssetsID=" + this.AssetsID + ", AssetsName=" + this.AssetsName + ", FirstTime=" + this.FirstTime + ", LastTime=" + this.LastTime + ", TotalTime=" + this.TotalTime + ", VisitCount=" + this.VisitCount + "]";
    }
}
