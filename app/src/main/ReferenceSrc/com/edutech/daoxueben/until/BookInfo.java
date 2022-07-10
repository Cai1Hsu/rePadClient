package com.edutech.daoxueben.until;

import java.util.ArrayList;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
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

    public BookInfo(String book_id, String book_name, Long bookdownloadsize, Long booksize, String book_updatetime, String chapter_id, String chapter_name, String section_id, String section_dxid, String section_name, ArrayList<String> section_webpath, ArrayList<String> section_path, String exams_progress, ArrayList<ExamsInfo> exams, String section_tag, String section_updatetime, ArrayList<String> section_progress, ArrayList<Long> downloadsize, ArrayList<Long> size, boolean isdown, boolean isnew, boolean isParent) {
        this.book_id = book_id;
        this.book_name = book_name;
        this.bookdownloadsize = bookdownloadsize.longValue();
        this.booksize = booksize.longValue();
        this.chapter_name = chapter_name;
        this.section_name = section_name;
        this.section_webpath = section_webpath;
        this.section_path = section_path;
        this.section_tag = section_tag;
        this.section_updatetime = section_updatetime;
        this.section_progress = section_progress;
        this.downloadsize = downloadsize;
        this.size = size;
        this.isParent = isParent;
        this.book_updatetime = book_updatetime;
        this.chapter_id = chapter_id;
        this.section_id = section_id;
        this.section_dxid = section_dxid;
        this.exams = exams;
        this.isdown = isdown;
        this.exams_progress = exams_progress;
        this.isnew = isnew;
    }

    public BookInfo(BookInfo bookinfo) {
        this.book_id = bookinfo.book_id;
        this.book_name = bookinfo.book_name;
        this.bookdownloadsize = bookinfo.bookdownloadsize;
        this.booksize = bookinfo.booksize;
        this.chapter_name = bookinfo.chapter_name;
        this.section_name = bookinfo.section_name;
        this.section_webpath = bookinfo.section_webpath;
        this.section_path = bookinfo.section_path;
        this.section_tag = bookinfo.section_tag;
        this.section_updatetime = bookinfo.section_updatetime;
        this.section_progress = bookinfo.section_progress;
        this.downloadsize = bookinfo.downloadsize;
        this.size = bookinfo.size;
        this.isParent = bookinfo.isParent;
        this.book_updatetime = bookinfo.book_updatetime;
        this.chapter_id = bookinfo.chapter_id;
        this.section_id = bookinfo.section_id;
        this.section_dxid = bookinfo.section_dxid;
        this.exams = bookinfo.exams;
        this.isdown = bookinfo.isdown;
        this.exams_progress = bookinfo.exams_progress;
        this.isnew = bookinfo.isnew;
    }

    public BookInfo getbookinfo() {
        return this;
    }

    public void setchapter_name(String chapter_name) {
        this.chapter_name = chapter_name;
    }

    public String getchapter_name() {
        return this.chapter_name;
    }

    public void setsection_name(String section_name) {
        this.section_name = section_name;
    }

    public String getsection_name() {
        return this.section_name;
    }

    public void setsection_tag(String section_tag) {
        this.section_tag = section_tag;
    }

    public String getsection_tag() {
        return this.section_tag;
    }

    public void setsection_updatetime(String section_updatetime) {
        this.section_updatetime = section_updatetime;
    }

    public String getsection_updatetime() {
        return this.section_updatetime;
    }

    public String toString() {
        return "bookinfo \nbook_id = " + this.book_id + "\nbook_name = " + this.book_name + "\nbookdownloadsize = " + this.bookdownloadsize + "\nbooksize = " + this.booksize + "\nbook_updatetime = " + this.book_updatetime + "\nchapter_id = " + this.chapter_id + "\nchapter_name = " + this.chapter_name + "\nsection_id = " + this.section_id + "\nsection_dxid = " + this.section_dxid + "\nsection_name = " + this.section_name + "\nsection_webpath = " + this.section_webpath + "\nsection_path = " + this.section_path + "\nexams_progress = " + this.exams_progress + "\nexams = " + this.exams + "\nsection_tag = " + this.section_tag + "\nsection_updatetime = " + this.section_updatetime + "\nsection_progress = " + this.section_progress + "\ndownloadsize = " + this.downloadsize + "\nsize = " + this.size + "\nisdown = " + this.isdown + "\nisnew = " + this.isnew + "\nisParent = " + this.isParent + "\n";
    }

    public boolean isParent() {
        return this.isParent;
    }

    public void setParent(boolean isParent) {
        this.isParent = isParent;
    }

    public String getBook_id() {
        return this.book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public String getBook_name() {
        return this.book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public ArrayList<String> getSection_webpath() {
        return this.section_webpath;
    }

    public void setSection_webpath(ArrayList<String> section_webpath) {
        this.section_webpath = section_webpath;
    }

    public ArrayList<String> getSection_path() {
        return this.section_path;
    }

    public void setSection_path(ArrayList<String> section_path) {
        this.section_path = section_path;
    }

    public ArrayList<String> getSection_progress() {
        return this.section_progress;
    }

    public void setSection_progress(ArrayList<String> section_progress) {
        this.section_progress = section_progress;
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

    public ArrayList<Long> getDownloadsize() {
        return this.downloadsize;
    }

    public void setDownloadsize(ArrayList<Long> downloadsize) {
        this.downloadsize = downloadsize;
    }

    public ArrayList<Long> getSize() {
        return this.size;
    }

    public void setSize(ArrayList<Long> size) {
        this.size = size;
    }

    public String getBook_updatetime() {
        return this.book_updatetime;
    }

    public void setBook_updatetime(String book_updatetime) {
        this.book_updatetime = book_updatetime;
    }

    public String getChapter_id() {
        return this.chapter_id;
    }

    public void setChapter_id(String chapter_id) {
        this.chapter_id = chapter_id;
    }

    public String getSection_id() {
        return this.section_id;
    }

    public void setSection_id(String section_id) {
        this.section_id = section_id;
    }

    public String getSection_dxid() {
        return this.section_dxid;
    }

    public void setSection_dxid(String section_dxid) {
        this.section_dxid = section_dxid;
    }

    public ArrayList<ExamsInfo> getExams() {
        return this.exams;
    }

    public void setExams(ArrayList<ExamsInfo> exams) {
        this.exams = exams;
    }

    public boolean isIsdown() {
        return this.isdown;
    }

    public void setIsdown(boolean isdown) {
        this.isdown = isdown;
    }

    public String getexams_progress() {
        return this.exams_progress;
    }

    public void setexams_progress(String exams_progress) {
        this.exams_progress = exams_progress;
    }

    public boolean isIsnew() {
        return this.isnew;
    }

    public void setIsnew(boolean isnew) {
        this.isnew = isnew;
    }
}
