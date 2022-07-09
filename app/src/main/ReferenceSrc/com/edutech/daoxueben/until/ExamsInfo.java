package com.edutech.daoxueben.until;

import java.util.ArrayList;

/* loaded from: classes.dex */
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

    public ExamsInfo(String exams_id, String question_id, String exams_body, String exams_type, long exams_totalsize, ArrayList<String> exams_webpath, ArrayList<String> exams_path, String exams_result, int exams_answer, ArrayList<String> exams_progress, ArrayList<Long> downloadsize, ArrayList<Long> size, String exams_studentresult, String exams_updatetime) {
        this.exams_id = exams_id;
        this.question_id = question_id;
        this.exams_body = exams_body;
        this.exams_type = exams_type;
        this.exams_webpath = exams_webpath;
        this.exams_path = exams_path;
        this.exams_result = exams_result;
        this.exams_answer = exams_answer;
        this.exams_progress = exams_progress;
        this.downloadsize = downloadsize;
        this.size = size;
        this.exams_studentresult = exams_studentresult;
        this.exams_totalsize = exams_totalsize;
        this.exams_updatetime = exams_updatetime;
    }

    public ExamsInfo(ExamsInfo examsinfo) {
        this.exams_id = examsinfo.exams_id;
        this.question_id = examsinfo.question_id;
        this.exams_body = examsinfo.exams_body;
        this.exams_type = examsinfo.exams_type;
        this.exams_webpath = examsinfo.exams_webpath;
        this.exams_path = examsinfo.exams_path;
        this.exams_result = examsinfo.exams_result;
        this.exams_answer = examsinfo.exams_answer;
        this.exams_progress = examsinfo.exams_progress;
        this.downloadsize = examsinfo.downloadsize;
        this.size = examsinfo.size;
        this.exams_studentresult = examsinfo.exams_studentresult;
        this.exams_totalsize = examsinfo.exams_totalsize;
        this.exams_updatetime = examsinfo.exams_updatetime;
    }

    public ExamsInfo getexamsinfo() {
        return this;
    }

    public void setexams_body(String exams_body) {
        this.exams_body = exams_body;
    }

    public String getexams_body() {
        return this.exams_body;
    }

    public void setexams_type(String exams_type) {
        this.exams_type = exams_type;
    }

    public String getexams_type() {
        return this.exams_type;
    }

    public void setexams_result(String exams_result) {
        this.exams_result = exams_result;
    }

    public String getexams_result() {
        return this.exams_result;
    }

    public void setexams_answer(int exams_answer) {
        this.exams_answer = exams_answer;
    }

    public int getexams_answer() {
        return this.exams_answer;
    }

    public String toString() {
        return "bookinfo \nexams_id = " + this.exams_id + "\nquestion_id = " + this.question_id + "\nexams_body = " + this.exams_body + "\nexams_type = " + this.exams_type + "\nexams_totalsize = " + this.exams_totalsize + "\nexams_webpath = " + this.exams_webpath + "\nexams_path = " + this.exams_path + "\nexams_result = " + this.exams_result + "\nexams_answer = " + this.exams_answer + "\nexams_progress = " + this.exams_progress + "\ndownloadsize = " + this.downloadsize + "\nsize = " + this.size + "\nexams_studentresult = " + this.exams_studentresult + "\nexams_updatetime = " + this.exams_updatetime + "\n";
    }

    public String getexams_studentresult() {
        return this.exams_studentresult;
    }

    public void setexams_studentresult(String exams_studentresult) {
        this.exams_studentresult = exams_studentresult;
    }

    public String getexams_id() {
        return this.exams_id;
    }

    public void setexams_id(String exams_id) {
        this.exams_id = exams_id;
    }

    public String getquestion_id() {
        return this.question_id;
    }

    public void setquestion_id(String question_id) {
        this.question_id = question_id;
    }

    public ArrayList<String> getexams_webpath() {
        return this.exams_webpath;
    }

    public void setexams_webpath(ArrayList<String> exams_webpath) {
        this.exams_webpath = exams_webpath;
    }

    public ArrayList<String> getexams_path() {
        return this.exams_path;
    }

    public void setexams_path(ArrayList<String> exams_path) {
        this.exams_path = exams_path;
    }

    public ArrayList<String> getexams_progress() {
        return this.exams_progress;
    }

    public void setexams_progress(ArrayList<String> exams_progress) {
        this.exams_progress = exams_progress;
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

    public long getexams_totalsize() {
        return this.exams_totalsize;
    }

    public void setexams_totalsize(long exams_totalsize) {
        this.exams_totalsize = exams_totalsize;
    }

    public String getExams_updatetime() {
        return this.exams_updatetime;
    }

    public void setExams_updatetime(String exams_updatetime) {
        this.exams_updatetime = exams_updatetime;
    }
}
