package com.edutech.json;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class Books {
    private String book_id;
    private int book_isnew;
    private String book_name;
    private String book_path;
    private int book_total;
    private String book_updatetime;
    private long bookdownloadsize;
    private long booksize;
    private String progress;

    public Books() {
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

    public Books(String book_id, String book_name, Long bookdownloadsize, Long booksize, String book_path, String progress, String book_updatetime, int book_isnew, int book_total) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.bookdownloadsize = bookdownloadsize.longValue();
        this.booksize = booksize.longValue();
        this.book_path = book_path;
        this.progress = progress;
        this.book_updatetime = book_updatetime;
        this.book_isnew = book_isnew;
        this.book_total = book_total;
    }

    public Books(Books book) {
        this.book_id = book.book_id;
        this.book_name = book.book_name;
        this.bookdownloadsize = book.bookdownloadsize;
        this.booksize = book.booksize;
        this.book_path = book.book_path;
        this.progress = book.progress;
        this.book_updatetime = book.book_updatetime;
        this.book_isnew = book.book_isnew;
        this.book_total = book.book_total;
    }

    public Books getbooks() {
        return this;
    }

    public void setbook_id(String book_id) {
        this.book_id = book_id;
    }

    public String getbook_id() {
        return this.book_id;
    }

    public void setbook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getbook_name() {
        return this.book_name;
    }

    public long getBookdownloadsize() {
        return this.bookdownloadsize;
    }

    public void setBookdownloadsize(long bookdownloadsize) {
        this.bookdownloadsize = bookdownloadsize;
    }

    public long getBooksize() {
        return this.booksize;
    }

    public void setBooksize(long booksize) {
        this.booksize = booksize;
    }

    public void setbook_path(String book_path) {
        this.book_path = book_path;
    }

    public String getbook_path() {
        return this.book_path;
    }

    public String getProgress() {
        return this.progress;
    }

    public void setProgress(String progress) {
        this.progress = progress;
    }

    public String getBook_updatetime() {
        return this.book_updatetime;
    }

    public void setBook_updatetime(String book_updatetime) {
        this.book_updatetime = book_updatetime;
    }

    public int getBook_isnew() {
        return this.book_isnew;
    }

    public void setBook_isnew(int book_isnew) {
        this.book_isnew = book_isnew;
    }

    public int getBook_total() {
        return this.book_total;
    }

    public void setBook_total(int book_total) {
        this.book_total = book_total;
    }

    public String toString() {
        return "bookinfo \nbook_id = " + this.book_id + "\nbook_name = " + this.book_name + "\nbookdownloadsize = " + this.bookdownloadsize + "\nbooksize = " + this.booksize + "\nbook_path = " + this.book_path + "\nprogress = " + this.progress + "\nbook_updatetime = " + this.book_updatetime + "\nbook_isnew = " + this.book_isnew + "\nbook_total = " + this.book_total + "\n";
    }
}
