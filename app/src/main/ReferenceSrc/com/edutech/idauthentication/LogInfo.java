package com.edutech.idauthentication;

import java.util.ArrayList;

/* loaded from: classes.jar:com/edutech/idauthentication/LogInfo.class */
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

    public LogInfo(LogInfo logInfo) {
        this.MachineID = logInfo.MachineID;
        this.Type = logInfo.Type;
        this.UserID = logInfo.UserID;
        this.SubjectID = logInfo.SubjectID;
        this.BookID = logInfo.BookID;
        this.BookName = logInfo.BookName;
        this.ChapterID = logInfo.ChapterID;
        this.PartID = logInfo.PartID;
        this.AssetsID = logInfo.AssetsID;
        this.AssetsName = logInfo.AssetsName;
        this.FirstTime = logInfo.FirstTime;
        this.LastTime = logInfo.LastTime;
        this.TotalTime = logInfo.TotalTime;
        this.VisitCount = logInfo.VisitCount;
        this.SectionsID = logInfo.SectionsID;
    }

    public LogInfo(String str, String str2, String str3, String str4, String str5, String str6, ArrayList<String> arrayList, String str7, String str8, String str9, String str10, String str11, String str12, long j, long j2) {
        this.MachineID = str;
        this.Type = str2;
        this.UserID = str3;
        this.SubjectID = str4;
        this.BookID = str5;
        this.BookName = str6;
        this.ChapterID = str7;
        this.PartID = str8;
        this.AssetsID = str9;
        this.AssetsName = str10;
        this.FirstTime = str11;
        this.LastTime = str12;
        this.TotalTime = j;
        this.VisitCount = j2;
        this.SectionsID = arrayList;
    }

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

    public String getChapterID() {
        return this.ChapterID;
    }

    public String getFirstTime() {
        return this.FirstTime;
    }

    public String getLastTime() {
        return this.LastTime;
    }

    public String getMachineID() {
        return this.MachineID;
    }

    public String getPartID() {
        return this.PartID;
    }

    public ArrayList<String> getSectionsID() {
        return this.SectionsID;
    }

    public String getSubjectID() {
        return this.SubjectID;
    }

    public long getTotalTime() {
        return this.TotalTime;
    }

    public String getType() {
        return this.Type;
    }

    public String getUserID() {
        return this.UserID;
    }

    public long getVisitCount() {
        return this.VisitCount;
    }

    public LogInfo getlogs() {
        return this;
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

    public void setChapterID(String str) {
        this.ChapterID = str;
    }

    public void setFirstTime(String str) {
        this.FirstTime = str;
    }

    public void setLastTime(String str) {
        this.LastTime = str;
    }

    public void setMachineID(String str) {
        this.MachineID = str;
    }

    public void setPartID(String str) {
        this.PartID = str;
    }

    public void setSectionsID(ArrayList<String> arrayList) {
        this.SectionsID = arrayList;
    }

    public void setSubjectID(String str) {
        this.SubjectID = str;
    }

    public void setTotalTime(long j) {
        this.TotalTime = j;
    }

    public void setType(String str) {
        this.Type = str;
    }

    public void setUserID(String str) {
        this.UserID = str;
    }

    public void setVisitCount(long j) {
        this.VisitCount = j;
    }

    public String toString() {
        return "bookinfo\nMachineID = " + this.MachineID + "\nType = " + this.Type + "\nUserID = " + this.UserID + "\nSubjectID = " + this.SubjectID + "\nBookID = " + this.BookID + "\nBookName = " + this.BookName + "\nChapterID = " + this.ChapterID + "\nPartID = " + this.PartID + "\nAssetsID = " + this.AssetsID + "\nAssetsName = " + this.AssetsName + "\nFirstTime = " + this.FirstTime + "\nLastTime = " + this.LastTime + "\nTotalTime = " + this.TotalTime + "\nVisitCount = " + this.VisitCount + "\n";
    }
}
