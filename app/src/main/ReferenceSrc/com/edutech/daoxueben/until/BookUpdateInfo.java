package com.edutech.daoxueben.until;

/* loaded from: classes.dex */
public class BookUpdateInfo {
    private int book_isnew;
    private String id;
    private String source;
    private int total;
    private String type;
    private boolean updated;
    private String updatetime;

    public BookUpdateInfo() {
        this.id = "";
        this.type = "";
        this.updated = false;
        this.source = "";
        this.updatetime = "";
        this.book_isnew = 0;
        this.total = 0;
    }

    public BookUpdateInfo(String id, String type, boolean updated, String source, String updatetime, int book_isnew, int total) {
        this.id = id;
        this.type = type;
        this.updated = updated;
        this.source = source;
        this.updatetime = updatetime;
        this.book_isnew = book_isnew;
        this.total = total;
    }

    public BookUpdateInfo(BookUpdateInfo bookupdateinfo) {
        this.id = bookupdateinfo.id;
        this.type = bookupdateinfo.type;
        this.updated = bookupdateinfo.updated;
        this.source = bookupdateinfo.source;
        this.updatetime = bookupdateinfo.updatetime;
        this.book_isnew = bookupdateinfo.book_isnew;
        this.total = bookupdateinfo.total;
    }

    public BookUpdateInfo getBookUpdateInfo() {
        return this;
    }

    public void setid(String id) {
        this.id = id;
    }

    public String getid() {
        return this.id;
    }

    public void settype(String type) {
        this.type = type;
    }

    public String gettype() {
        return this.type;
    }

    public boolean getupdated() {
        return this.updated;
    }

    public void setupdated(boolean updated) {
        this.updated = updated;
    }

    public void setsource(String source) {
        this.source = source;
    }

    public String getsource() {
        return this.source;
    }

    public String getupdatetime() {
        return this.updatetime;
    }

    public void setupdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public int getBook_isnew() {
        return this.book_isnew;
    }

    public void setBook_isnew(int book_isnew) {
        this.book_isnew = book_isnew;
    }

    public int gettotal() {
        return this.total;
    }

    public void settotal(int total) {
        this.total = total;
    }

    public String toString() {
        return "bookinfo \nid = " + this.id + "\ntype = " + this.type + "\nupdated = " + this.updated + "\nsource = " + this.source + "\nupdatetime = " + this.updatetime + "\nbook_isnew = " + this.book_isnew + "\ntotal = " + this.total + "\n";
    }
}
