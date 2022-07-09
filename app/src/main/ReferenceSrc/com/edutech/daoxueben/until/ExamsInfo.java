package com.edutech.daoxueben.until;

import java.util.ArrayList;

/* loaded from: classes.jar:com/edutech/daoxueben/until/ExamsInfo.class */
public class ExamsInfo {
    private ArrayList<Long> downloadsize;
    private int exams_answer;
    private String exams_body;
    private String exams_id;
    private ArrayList<String> exams_path;
    private ArrayList<String> exams_progress;
    private String exams_result;
    private String exams_studentresult;
    private long exams_totalsize;
    private String exams_type;
    private String exams_updatetime;
    private ArrayList<String> exams_webpath;
    private String question_id;
    private ArrayList<Long> size;

    public ExamsInfo() {
        this.exams_id = "";
        this.question_id = "";
        this.exams_body = "";
        this.exams_type = "";
        this.exams_webpath = new ArrayList<>();
        this.exams_path = new ArrayList<>();
        this.exams_result = "";
        this.exams_answer = 0;
        this.exams_progress = new ArrayList<>();
        this.downloadsize = new ArrayList<>();
        this.size = new ArrayList<>();
        this.exams_studentresult = "";
        this.exams_totalsize = 0L;
        this.exams_updatetime = "";
    }

    public ExamsInfo(ExamsInfo examsInfo) {
        this.exams_id = examsInfo.exams_id;
        this.question_id = examsInfo.question_id;
        this.exams_body = examsInfo.exams_body;
        this.exams_type = examsInfo.exams_type;
        this.exams_webpath = examsInfo.exams_webpath;
        this.exams_path = examsInfo.exams_path;
        this.exams_result = examsInfo.exams_result;
        this.exams_answer = examsInfo.exams_answer;
        this.exams_progress = examsInfo.exams_progress;
        this.downloadsize = examsInfo.downloadsize;
        this.size = examsInfo.size;
        this.exams_studentresult = examsInfo.exams_studentresult;
        this.exams_totalsize = examsInfo.exams_totalsize;
        this.exams_updatetime = examsInfo.exams_updatetime;
    }

    public ExamsInfo(String str, String str2, String str3, String str4, long j, ArrayList<String> arrayList, ArrayList<String> arrayList2, String str5, int i, ArrayList<String> arrayList3, ArrayList<Long> arrayList4, ArrayList<Long> arrayList5, String str6, String str7) {
        this.exams_id = str;
        this.question_id = str2;
        this.exams_body = str3;
        this.exams_type = str4;
        this.exams_webpath = arrayList;
        this.exams_path = arrayList2;
        this.exams_result = str5;
        this.exams_answer = i;
        this.exams_progress = arrayList3;
        this.downloadsize = arrayList4;
        this.size = arrayList5;
        this.exams_studentresult = str6;
        this.exams_totalsize = j;
        this.exams_updatetime = str7;
    }

    public ArrayList<Long> getDownloadsize() {
        return this.downloadsize;
    }

    public String getExams_updatetime() {
        return this.exams_updatetime;
    }

    public ArrayList<Long> getSize() {
        return this.size;
    }

    public int getexams_answer() {
        return this.exams_answer;
    }

    public String getexams_body() {
        return this.exams_body;
    }

    public String getexams_id() {
        return this.exams_id;
    }

    public ArrayList<String> getexams_path() {
        return this.exams_path;
    }

    public ArrayList<String> getexams_progress() {
        return this.exams_progress;
    }

    public String getexams_result() {
        return this.exams_result;
    }

    public String getexams_studentresult() {
        return this.exams_studentresult;
    }

    public long getexams_totalsize() {
        return this.exams_totalsize;
    }

    public String getexams_type() {
        return this.exams_type;
    }

    public ArrayList<String> getexams_webpath() {
        return this.exams_webpath;
    }

    public ExamsInfo getexamsinfo() {
        return this;
    }

    public String getquestion_id() {
        return this.question_id;
    }

    public void setDownloadsize(ArrayList<Long> arrayList) {
        this.downloadsize = arrayList;
    }

    public void setExams_updatetime(String str) {
        this.exams_updatetime = str;
    }

    public void setSize(ArrayList<Long> arrayList) {
        this.size = arrayList;
    }

    public void setexams_answer(int i) {
        this.exams_answer = i;
    }

    public void setexams_body(String str) {
        this.exams_body = str;
    }

    public void setexams_id(String str) {
        this.exams_id = str;
    }

    public void setexams_path(ArrayList<String> arrayList) {
        this.exams_path = arrayList;
    }

    public void setexams_progress(ArrayList<String> arrayList) {
        this.exams_progress = arrayList;
    }

    public void setexams_result(String str) {
        this.exams_result = str;
    }

    public void setexams_studentresult(String str) {
        this.exams_studentresult = str;
    }

    public void setexams_totalsize(long j) {
        this.exams_totalsize = j;
    }

    public void setexams_type(String str) {
        this.exams_type = str;
    }

    public void setexams_webpath(ArrayList<String> arrayList) {
        this.exams_webpath = arrayList;
    }

    public void setquestion_id(String str) {
        this.question_id = str;
    }

    public String toString() {
        return "bookinfo \nexams_id = " + this.exams_id + "\nquestion_id = " + this.question_id + "\nexams_body = " + this.exams_body + "\nexams_type = " + this.exams_type + "\nexams_totalsize = " + this.exams_totalsize + "\nexams_webpath = " + this.exams_webpath + "\nexams_path = " + this.exams_path + "\nexams_result = " + this.exams_result + "\nexams_answer = " + this.exams_answer + "\nexams_progress = " + this.exams_progress + "\ndownloadsize = " + this.downloadsize + "\nsize = " + this.size + "\nexams_studentresult = " + this.exams_studentresult + "\nexams_updatetime = " + this.exams_updatetime + "\n";
    }
}
