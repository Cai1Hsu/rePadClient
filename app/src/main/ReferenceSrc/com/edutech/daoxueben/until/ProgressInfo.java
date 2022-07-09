package com.edutech.daoxueben.until;

/* loaded from: classes.dex */
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

    public ProgressInfo(String book_id, String source_id, String section_webpath, String section_newprogress, String section_oldprogress, long newdownloadsize, long olddownloadsize, long size, boolean ischange) {
        this.book_id = book_id;
        this.source_id = source_id;
        this.section_webpath = section_webpath;
        this.section_newprogress = section_newprogress;
        this.section_oldprogress = section_oldprogress;
        this.newdownloadsize = newdownloadsize;
        this.olddownloadsize = olddownloadsize;
        this.size = size;
        this.ischange = ischange;
    }

    public ProgressInfo(ProgressInfo progress) {
        this.book_id = progress.book_id;
        this.source_id = progress.source_id;
        this.section_webpath = progress.section_webpath;
        this.section_newprogress = progress.section_newprogress;
        this.section_oldprogress = progress.section_oldprogress;
        this.newdownloadsize = progress.newdownloadsize;
        this.olddownloadsize = progress.olddownloadsize;
        this.size = progress.size;
        this.ischange = progress.ischange;
    }

    public ProgressInfo getProgressInfo() {
        return this;
    }

    public void setsection_webpath(String section_webpath) {
        this.section_webpath = section_webpath;
    }

    public String getsection_webpath() {
        return this.section_webpath;
    }

    public void setsection_newprogress(String section_newprogress) {
        this.section_newprogress = section_newprogress;
    }

    public String getsection_newprogress() {
        return this.section_newprogress;
    }

    public void setsection_oldprogress(String section_oldprogress) {
        this.section_oldprogress = section_oldprogress;
    }

    public String getsection_oldprogress() {
        return this.section_oldprogress;
    }

    public String toString() {
        return "bookinfo \nbook_id = " + this.book_id + "\nsource_id = " + this.source_id + "\nsection_webpath = " + this.section_webpath + "\nsection_newprogress = " + this.section_newprogress + "\nsection_oldprogress = " + this.section_oldprogress + "\nnewdownloadsize = " + this.newdownloadsize + "\nolddownloadsize = " + this.olddownloadsize + "\nsize = " + this.size + "\nischange = " + this.ischange + "\n";
    }

    public boolean isIschange() {
        return this.ischange;
    }

    public void setIschange(boolean ischange) {
        this.ischange = ischange;
    }

    public String getBook_id() {
        return this.book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public long getNewdownloadsize() {
        return this.newdownloadsize;
    }

    public void setNewdownloadsize(long newdownloadsize) {
        this.newdownloadsize = newdownloadsize;
    }

    public long getOlddownloadsize() {
        return this.olddownloadsize;
    }

    public void setOlddownloadsize(long olddownloadsize) {
        this.olddownloadsize = olddownloadsize;
    }

    public long getSize() {
        return this.size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public String getSource_id() {
        return this.source_id;
    }

    public void setSource_id(String source_id) {
        this.source_id = source_id;
    }
}
