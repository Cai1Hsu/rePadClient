package com.edutech.daoxueben.until;

import java.util.ArrayList;

/* loaded from: classes.jar:com/edutech/daoxueben/until/BookInfo.class */
public class BookInfo {
    private String book_id;
    private String book_name;
    private String book_updatetime;
    private long bookdownloadsize;
    private long booksize;
    private String chapter_id;
    private String chapter_name;
    private ArrayList<Long> downloadsize;
    private ArrayList<ExamsInfo> exams;
    private String exams_progress;
    private boolean isParent;
    private boolean isdown;
    private boolean isnew;
    private String section_dxid;
    private String section_id;
    private String section_name;
    private ArrayList<String> section_path;
    private ArrayList<String> section_progress;
    private String section_tag;
    private String section_updatetime;
    private ArrayList<String> section_webpath;
    private ArrayList<Long> size;

    public BookInfo() {
        this.book_id = "";
        this.book_name = "";
        this.bookdownloadsize = 0L;
        this.booksize = 0L;
        this.chapter_name = "";
        this.section_name = "";
        this.section_webpath = new ArrayList<>();
        this.section_path = new ArrayList<>();
        this.section_tag = "";
        this.section_updatetime = "";
        this.section_progress = new ArrayList<>();
        this.downloadsize = new ArrayList<>();
        this.size = new ArrayList<>();
        this.isParent = true;
        this.book_updatetime = "";
        this.chapter_id = "";
        this.section_id = "";
        this.section_dxid = "";
        this.exams = new ArrayList<>();
        this.isdown = false;
        setexams_progress("");
        this.isnew = false;
    }

    public BookInfo(BookInfo bookInfo) {
        this.book_id = bookInfo.book_id;
        this.book_name = bookInfo.book_name;
        this.bookdownloadsize = bookInfo.bookdownloadsize;
        this.booksize = bookInfo.booksize;
        this.chapter_name = bookInfo.chapter_name;
        this.section_name = bookInfo.section_name;
        this.section_webpath = bookInfo.section_webpath;
        this.section_path = bookInfo.section_path;
        this.section_tag = bookInfo.section_tag;
        this.section_updatetime = bookInfo.section_updatetime;
        this.section_progress = bookInfo.section_progress;
        this.downloadsize = bookInfo.downloadsize;
        this.size = bookInfo.size;
        this.isParent = bookInfo.isParent;
        this.book_updatetime = bookInfo.book_updatetime;
        this.chapter_id = bookInfo.chapter_id;
        this.section_id = bookInfo.section_id;
        this.section_dxid = bookInfo.section_dxid;
        this.exams = bookInfo.exams;
        this.isdown = bookInfo.isdown;
        this.exams_progress = bookInfo.exams_progress;
        this.isnew = bookInfo.isnew;
    }

    public BookInfo(String str, String str2, Long l, Long l2, String str3, String str4, String str5, String str6, String str7, String str8, ArrayList<String> arrayList, ArrayList<String> arrayList2, String str9, ArrayList<ExamsInfo> arrayList3, String str10, String str11, ArrayList<String> arrayList4, ArrayList<Long> arrayList5, ArrayList<Long> arrayList6, boolean z, boolean z2, boolean z3) {
        this.book_id = str;
        this.book_name = str2;
        this.bookdownloadsize = l.longValue();
        this.booksize = l2.longValue();
        this.chapter_name = str5;
        this.section_name = str8;
        this.section_webpath = arrayList;
        this.section_path = arrayList2;
        this.section_tag = str10;
        this.section_updatetime = str11;
        this.section_progress = arrayList4;
        this.downloadsize = arrayList5;
        this.size = arrayList6;
        this.isParent = z3;
        this.book_updatetime = str3;
        this.chapter_id = str4;
        this.section_id = str6;
        this.section_dxid = str7;
        this.exams = arrayList3;
        this.isdown = z;
        this.exams_progress = str9;
        this.isnew = z2;
    }

    public String getBook_id() {
        return this.book_id;
    }

    public String getBook_name() {
        return this.book_name;
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

    public String getChapter_id() {
        return this.chapter_id;
    }

    public ArrayList<Long> getDownloadsize() {
        return this.downloadsize;
    }

    public ArrayList<ExamsInfo> getExams() {
        return this.exams;
    }

    public String getSection_dxid() {
        return this.section_dxid;
    }

    public String getSection_id() {
        return this.section_id;
    }

    public ArrayList<String> getSection_path() {
        return this.section_path;
    }

    public ArrayList<String> getSection_progress() {
        return this.section_progress;
    }

    public ArrayList<String> getSection_webpath() {
        return this.section_webpath;
    }

    public ArrayList<Long> getSize() {
        return this.size;
    }

    public BookInfo getbookinfo() {
        return this;
    }

    public String getchapter_name() {
        return this.chapter_name;
    }

    public String getexams_progress() {
        return this.exams_progress;
    }

    public String getsection_name() {
        return this.section_name;
    }

    public String getsection_tag() {
        return this.section_tag;
    }

    public String getsection_updatetime() {
        return this.section_updatetime;
    }

    public boolean isIsdown() {
        return this.isdown;
    }

    public boolean isIsnew() {
        return this.isnew;
    }

    public boolean isParent() {
        return this.isParent;
    }

    public void setBook_id(String str) {
        this.book_id = str;
    }

    public void setBook_name(String str) {
        this.book_name = str;
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

    public void setChapter_id(String str) {
        this.chapter_id = str;
    }

    public void setDownloadsize(ArrayList<Long> arrayList) {
        this.downloadsize = arrayList;
    }

    public void setExams(ArrayList<ExamsInfo> arrayList) {
        this.exams = arrayList;
    }

    public void setIsdown(boolean z) {
        this.isdown = z;
    }

    public void setIsnew(boolean z) {
        this.isnew = z;
    }

    public void setParent(boolean z) {
        this.isParent = z;
    }

    public void setSection_dxid(String str) {
        this.section_dxid = str;
    }

    public void setSection_id(String str) {
        this.section_id = str;
    }

    public void setSection_path(ArrayList<String> arrayList) {
        this.section_path = arrayList;
    }

    public void setSection_progress(ArrayList<String> arrayList) {
        this.section_progress = arrayList;
    }

    public void setSection_webpath(ArrayList<String> arrayList) {
        this.section_webpath = arrayList;
    }

    public void setSize(ArrayList<Long> arrayList) {
        this.size = arrayList;
    }

    public void setchapter_name(String str) {
        this.chapter_name = str;
    }

    public void setexams_progress(String str) {
        this.exams_progress = str;
    }

    public void setsection_name(String str) {
        this.section_name = str;
    }

    public void setsection_tag(String str) {
        this.section_tag = str;
    }

    public void setsection_updatetime(String str) {
        this.section_updatetime = str;
    }

    public String toString() {
        return "bookinfo \nbook_id = " + this.book_id + "\nbook_name = " + this.book_name + "\nbookdownloadsize = " + this.bookdownloadsize + "\nbooksize = " + this.booksize + "\nbook_updatetime = " + this.book_updatetime + "\nchapter_id = " + this.chapter_id + "\nchapter_name = " + this.chapter_name + "\nsection_id = " + this.section_id + "\nsection_dxid = " + this.section_dxid + "\nsection_name = " + this.section_name + "\nsection_webpath = " + this.section_webpath + "\nsection_path = " + this.section_path + "\nexams_progress = " + this.exams_progress + "\nexams = " + this.exams + "\nsection_tag = " + this.section_tag + "\nsection_updatetime = " + this.section_updatetime + "\nsection_progress = " + this.section_progress + "\ndownloadsize = " + this.downloadsize + "\nsize = " + this.size + "\nisdown = " + this.isdown + "\nisnew = " + this.isnew + "\nisParent = " + this.isParent + "\n";
    }
}
