package com.edutech.daoxueben.until;

/* loaded from: classes.jar:com/edutech/daoxueben/until/OldBooks.class */
public class OldBooks {
    private String book_id;
    private int book_isnew;
    private String book_name;
    private String book_path;
    private int book_total;
    private String book_updatetime;
    private long bookdownloadsize;
    private long booksize;
    private String progress;

    public OldBooks() {
        this.book_id = "";
        this.book_name = "";
        this.bookdownloadsize = 0L;
        this.booksize = 0L;
        this.book_path = "";
        this.progress = "0";
        this.book_updatetime = "";
        this.book_isnew = 0;
        this.book_total = 0;
    }

    public OldBooks(OldBooks oldBooks) {
        this.book_id = oldBooks.book_id;
        this.book_name = oldBooks.book_name;
        this.bookdownloadsize = oldBooks.bookdownloadsize;
        this.booksize = oldBooks.booksize;
        this.book_path = oldBooks.book_path;
        this.progress = oldBooks.progress;
        this.book_updatetime = oldBooks.book_updatetime;
        this.book_isnew = oldBooks.book_isnew;
        this.book_total = oldBooks.book_total;
    }

    public OldBooks(String str, String str2, Long l, Long l2, String str3, String str4, String str5, int i, int i2) {
        this.book_id = str;
        this.book_name = str2;
        this.bookdownloadsize = l.longValue();
        this.booksize = l2.longValue();
        this.book_path = str3;
        this.progress = str4;
        this.book_updatetime = str5;
        this.book_isnew = i;
        this.book_total = i2;
    }

    public int getBook_isnew() {
        return this.book_isnew;
    }

    public int getBook_total() {
        return this.book_total;
    }

    public String getBook_updatetime() {
        return this.book_updatetime;
    }

    public long getBookdownloadsize() {
        return this.bookdownloadsize;
    }

    public long getBooksize() {
        return this.booksize;
    }

    public String getProgress() {
        return this.progress;
    }

    public String getbook_id() {
        return this.book_id;
    }

    public String getbook_name() {
        return this.book_name;
    }

    public String getbook_path() {
        return this.book_path;
    }

    public OldBooks getbooks() {
        return this;
    }

    public void setBook_isnew(int i) {
        this.book_isnew = i;
    }

    public void setBook_total(int i) {
        this.book_total = i;
    }

    public void setBook_updatetime(String str) {
        this.book_updatetime = str;
    }

    public void setBookdownloadsize(long j) {
        this.bookdownloadsize = j;
    }

    public void setBooksize(long j) {
        this.booksize = j;
    }

    public void setProgress(String str) {
        this.progress = str;
    }

    public void setbook_id(String str) {
        this.book_id = str;
    }

    public void setbook_name(String str) {
        this.book_name = str;
    }

    public void setbook_path(String str) {
        this.book_path = str;
    }

    public String toString() {
        return "bookinfo \nbook_id = " + this.book_id + "\nbook_name = " + this.book_name + "\nbookdownloadsize = " + this.bookdownloadsize + "\nbooksize = " + this.booksize + "\nbook_path = " + this.book_path + "\nprogress = " + this.progress + "\nbook_updatetime = " + this.book_updatetime + "\nbook_isnew = " + this.book_isnew + "\nbook_total = " + this.book_total + "\n";
    }
}
