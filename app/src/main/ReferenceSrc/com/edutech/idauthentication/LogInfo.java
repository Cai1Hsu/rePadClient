package com.edutech.idauthentication;

import java.util.ArrayList;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class LogInfo {
    private String AssetsID;
    private String AssetsName;
    private String BookID;
    private String BookName;
    private String ChapterID;
    private String FirstTime;
    private String LastTime;
    private String MachineID;
    private String PartID;
    private ArrayList<String> SectionsID;
    private String SubjectID;
    private long TotalTime;
    private String Type;
    private String UserID;
    private long VisitCount;

    public LogInfo() {
        this.UserID = "";
        this.MachineID = "";
        this.Type = "";
        this.SubjectID = "";
        this.BookID = "";
        this.BookName = "";
        this.ChapterID = "";
        this.PartID = "";
        this.AssetsID = "";
        this.AssetsName = "";
        this.FirstTime = "";
        this.LastTime = "";
        this.TotalTime = 0L;
        this.VisitCount = 0L;
        this.SectionsID = new ArrayList<>();
    }

    public LogInfo(String MachineID, String Type, String UserID, String SubjectID, String BookID, String BookName, ArrayList<String> SectionsID, String ChapterID, String PartID, String AssetsID, String AssetsName, String FirstTime, String LastTime, long TotalTime, long VisitCount) {
        this.MachineID = MachineID;
        this.Type = Type;
        this.UserID = UserID;
        this.SubjectID = SubjectID;
        this.BookID = BookID;
        this.BookName = BookName;
        this.ChapterID = ChapterID;
        this.PartID = PartID;
        this.AssetsID = AssetsID;
        this.AssetsName = AssetsName;
        this.FirstTime = FirstTime;
        this.LastTime = LastTime;
        this.TotalTime = TotalTime;
        this.VisitCount = VisitCount;
        this.SectionsID = SectionsID;
    }

    public LogInfo(LogInfo loginfo) {
        this.MachineID = loginfo.MachineID;
        this.Type = loginfo.Type;
        this.UserID = loginfo.UserID;
        this.SubjectID = loginfo.SubjectID;
        this.BookID = loginfo.BookID;
        this.BookName = loginfo.BookName;
        this.ChapterID = loginfo.ChapterID;
        this.PartID = loginfo.PartID;
        this.AssetsID = loginfo.AssetsID;
        this.AssetsName = loginfo.AssetsName;
        this.FirstTime = loginfo.FirstTime;
        this.LastTime = loginfo.LastTime;
        this.TotalTime = loginfo.TotalTime;
        this.VisitCount = loginfo.VisitCount;
        this.SectionsID = loginfo.SectionsID;
    }

    public LogInfo getlogs() {
        return this;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    public String getType() {
        return this.Type;
    }

    public void setUserID(String UserID) {
        this.UserID = UserID;
    }

    public String getUserID() {
        return this.UserID;
    }

    public void setChapterID(String ChapterID) {
        this.ChapterID = ChapterID;
    }

    public String getChapterID() {
        return this.ChapterID;
    }

    public String getPartID() {
        return this.PartID;
    }

    public void setPartID(String partID) {
        this.PartID = partID;
    }

    public long getTotalTime() {
        return this.TotalTime;
    }

    public void setTotalTime(long totalTime) {
        this.TotalTime = totalTime;
    }

    public String toString() {
        return "bookinfo\nMachineID = " + this.MachineID + "\nType = " + this.Type + "\nUserID = " + this.UserID + "\nSubjectID = " + this.SubjectID + "\nBookID = " + this.BookID + "\nBookName = " + this.BookName + "\nChapterID = " + this.ChapterID + "\nPartID = " + this.PartID + "\nAssetsID = " + this.AssetsID + "\nAssetsName = " + this.AssetsName + "\nFirstTime = " + this.FirstTime + "\nLastTime = " + this.LastTime + "\nTotalTime = " + this.TotalTime + "\nVisitCount = " + this.VisitCount + "\n";
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

    public long getVisitCount() {
        return this.VisitCount;
    }

    public void setVisitCount(long visitCount) {
        this.VisitCount = visitCount;
    }

    public String getMachineID() {
        return this.MachineID;
    }

    public void setMachineID(String machineID) {
        this.MachineID = machineID;
    }

    public String getAssetsID() {
        return this.AssetsID;
    }

    public void setAssetsID(String assetsID) {
        this.AssetsID = assetsID;
    }

    public ArrayList<String> getSectionsID() {
        return this.SectionsID;
    }

    public void setSectionsID(ArrayList<String> sectionsID) {
        this.SectionsID = sectionsID;
    }
}
