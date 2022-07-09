package com.edutech.daoxueben.until;

/* loaded from: classes.jar:com/edutech/daoxueben/until/BookUpdateInfo.class */
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

    public BookUpdateInfo(BookUpdateInfo bookUpdateInfo) {
        this.id = bookUpdateInfo.id;
        this.type = bookUpdateInfo.type;
        this.updated = bookUpdateInfo.updated;
        this.source = bookUpdateInfo.source;
        this.updatetime = bookUpdateInfo.updatetime;
        this.book_isnew = bookUpdateInfo.book_isnew;
        this.total = bookUpdateInfo.total;
    }

    public BookUpdateInfo(String str, String str2, boolean z, String str3, String str4, int i, int i2) {
        this.id = str;
        this.type = str2;
        this.updated = z;
        this.source = str3;
        this.updatetime = str4;
        this.book_isnew = i;
        this.total = i2;
    }

    public BookUpdateInfo getBookUpdateInfo() {
        return this;
    }

    public int getBook_isnew() {
        return this.book_isnew;
    }

    public String getid() {
        return this.id;
    }

    public String getsource() {
        return this.source;
    }

    public int gettotal() {
        return this.total;
    }

    public String gettype() {
        return this.type;
    }

    public boolean getupdated() {
        return this.updated;
    }

    public String getupdatetime() {
        return this.updatetime;
    }

    public void setBook_isnew(int i) {
        this.book_isnew = i;
    }

    public void setid(String str) {
        this.id = str;
    }

    public void setsource(String str) {
        this.source = str;
    }

    public void settotal(int i) {
        this.total = i;
    }

    public void settype(String str) {
        this.type = str;
    }

    public void setupdated(boolean z) {
        this.updated = z;
    }

    public void setupdatetime(String str) {
        this.updatetime = str;
    }

    public String toString() {
        return "bookinfo \nid = " + this.id + "\ntype = " + this.type + "\nupdated = " + this.updated + "\nsource = " + this.source + "\nupdatetime = " + this.updatetime + "\nbook_isnew = " + this.book_isnew + "\ntotal = " + this.total + "\n";
    }
}
