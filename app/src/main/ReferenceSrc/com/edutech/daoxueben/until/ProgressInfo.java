package com.edutech.daoxueben.until;

/* loaded from: classes.jar:com/edutech/daoxueben/until/ProgressInfo.class */
public class ProgressInfo {
    private String book_id;
    private boolean ischange;
    private long newdownloadsize;
    private long olddownloadsize;
    private String section_newprogress;
    private String section_oldprogress;
    private String section_webpath;
    private long size;
    private String source_id;

    public ProgressInfo() {
        this.book_id = "";
        this.source_id = "";
        this.section_webpath = "";
        this.section_newprogress = "0";
        this.section_oldprogress = "0";
        this.newdownloadsize = 0L;
        this.olddownloadsize = 0L;
        this.size = 0L;
        this.ischange = false;
    }

    public ProgressInfo(ProgressInfo progressInfo) {
        this.book_id = progressInfo.book_id;
        this.source_id = progressInfo.source_id;
        this.section_webpath = progressInfo.section_webpath;
        this.section_newprogress = progressInfo.section_newprogress;
        this.section_oldprogress = progressInfo.section_oldprogress;
        this.newdownloadsize = progressInfo.newdownloadsize;
        this.olddownloadsize = progressInfo.olddownloadsize;
        this.size = progressInfo.size;
        this.ischange = progressInfo.ischange;
    }

    public ProgressInfo(String str, String str2, String str3, String str4, String str5, long j, long j2, long j3, boolean z) {
        this.book_id = str;
        this.source_id = str2;
        this.section_webpath = str3;
        this.section_newprogress = str4;
        this.section_oldprogress = str5;
        this.newdownloadsize = j;
        this.olddownloadsize = j2;
        this.size = j3;
        this.ischange = z;
    }

    public String getBook_id() {
        return this.book_id;
    }

    public long getNewdownloadsize() {
        return this.newdownloadsize;
    }

    public long getOlddownloadsize() {
        return this.olddownloadsize;
    }

    public ProgressInfo getProgressInfo() {
        return this;
    }

    public long getSize() {
        return this.size;
    }

    public String getSource_id() {
        return this.source_id;
    }

    public String getsection_newprogress() {
        return this.section_newprogress;
    }

    public String getsection_oldprogress() {
        return this.section_oldprogress;
    }

    public String getsection_webpath() {
        return this.section_webpath;
    }

    public boolean isIschange() {
        return this.ischange;
    }

    public void setBook_id(String str) {
        this.book_id = str;
    }

    public void setIschange(boolean z) {
        this.ischange = z;
    }

    public void setNewdownloadsize(long j) {
        this.newdownloadsize = j;
    }

    public void setOlddownloadsize(long j) {
        this.olddownloadsize = j;
    }

    public void setSize(long j) {
        this.size = j;
    }

    public void setSource_id(String str) {
        this.source_id = str;
    }

    public void setsection_newprogress(String str) {
        this.section_newprogress = str;
    }

    public void setsection_oldprogress(String str) {
        this.section_oldprogress = str;
    }

    public void setsection_webpath(String str) {
        this.section_webpath = str;
    }

    public String toString() {
        return "bookinfo \nbook_id = " + this.book_id + "\nsource_id = " + this.source_id + "\nsection_webpath = " + this.section_webpath + "\nsection_newprogress = " + this.section_newprogress + "\nsection_oldprogress = " + this.section_oldprogress + "\nnewdownloadsize = " + this.newdownloadsize + "\nolddownloadsize = " + this.olddownloadsize + "\nsize = " + this.size + "\nischange = " + this.ischange + "\n";
    }
}
