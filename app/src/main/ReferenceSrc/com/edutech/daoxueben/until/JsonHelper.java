package com.edutech.daoxueben.until;

import android.os.Environment;
import com.edutech.idauthentication.AppEnvironment;
import com.edutech.json.KeyEnvironment;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import org.apache.http.util.EncodingUtils;
import org.jivesoftware.smackx.Form;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONStringer;
import org.json.JSONTokener;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class JsonHelper {
    public static ArrayList<BookInfo> peerbookparserJson(ArrayList<BookInfo> book, String json) {
        int book_total = 0;
        int isnew_count = 0;
        book.clear();
        if (!"".equals(json)) {
            try {
                JSONTokener jsonTokener = new JSONTokener(json);
                JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
                String book_id = getPropertyName(jsonObject, "id");
                String book_name = getPropertyName(jsonObject, "name");
                long book_downloadsize = getLongPropertyName(jsonObject, KeyEnvironment.KEYDOWNLOADSIZE).longValue();
                long book_size = getLongPropertyName(jsonObject, "size").longValue();
                String book_updatetime = getPropertyName(jsonObject, "updatetime");
                JSONArray array = jsonObject.getJSONArray("data");
                for (int i = 0; i < array.length(); i++) {
                    JSONObject object = array.getJSONObject(i);
                    JSONTokener jsonTokener1 = new JSONTokener(object.toString());
                    JSONObject jsonObject1 = (JSONObject) jsonTokener1.nextValue();
                    String chapterid = getPropertyName(jsonObject1, "id");
                    String chaptername = getPropertyName(jsonObject1, "name");
                    String childjson = getPropertyName(jsonObject1, "children");
                    if ("".equals(childjson)) {
                        BookInfo bookinfo = new BookInfo();
                        bookinfo.setBook_id(book_id);
                        bookinfo.setBook_name(book_name);
                        bookinfo.setBookdownloadsize(book_downloadsize);
                        bookinfo.setBooksize(book_size);
                        bookinfo.setBook_updatetime(book_updatetime);
                        bookinfo.setChapter_id(chapterid);
                        bookinfo.setchapter_name(chaptername);
                        bookinfo.setParent(false);
                        book.add(bookinfo);
                    } else {
                        JSONArray array2 = new JSONArray(childjson);
                        if (array2.length() == 0) {
                            BookInfo bookinfo2 = new BookInfo();
                            bookinfo2.setBook_id(book_id);
                            bookinfo2.setBook_name(book_name);
                            bookinfo2.setBookdownloadsize(book_downloadsize);
                            bookinfo2.setBooksize(book_size);
                            bookinfo2.setBook_updatetime(book_updatetime);
                            bookinfo2.setChapter_id(chapterid);
                            bookinfo2.setchapter_name(chaptername);
                            bookinfo2.setParent(false);
                            book.add(bookinfo2);
                        } else {
                            for (int j = 0; j < array2.length(); j++) {
                                JSONObject object2 = array2.getJSONObject(j);
                                JSONTokener jsonTokener2 = new JSONTokener(object2.toString());
                                JSONObject jsonObject2 = (JSONObject) jsonTokener2.nextValue();
                                String section_id = getPropertyName(jsonObject2, "id");
                                String section_dxid = getPropertyName(jsonObject2, "dxid");
                                String section_name = getPropertyName(jsonObject2, "name");
                                String section_webpath = getPropertyName(jsonObject2, KeyEnvironment.KEYWEBPATH);
                                String section_path = getPropertyName(jsonObject2, "path");
                                String exams = getPropertyName(jsonObject2, "exams");
                                String exams_progress = getPropertyName(jsonObject2, "examsprogress");
                                ArrayList<ExamsInfo> examslist = parseExamsInfo(book_id, section_dxid, new ArrayList<>(), exams);
                                long sectionexamsize = 0;
                                Iterator<ExamsInfo> it = examslist.iterator();
                                while (it.hasNext()) {
                                    ExamsInfo tempexam = it.next();
                                    sectionexamsize += tempexam.getexams_totalsize();
                                }
                                String section_tag = getPropertyName(jsonObject2, "tag");
                                String section_updatetime = getPropertyName(jsonObject2, "updatetime");
                                String section_progress = getPropertyName(jsonObject2, "progress");
                                String downloadsize = getPropertyName(jsonObject2, KeyEnvironment.KEYDOWNLOADSIZE);
                                String size = getPropertyName(jsonObject2, "size");
                                boolean isdown = getBooleanPropertyName(jsonObject2, "isdown");
                                boolean isnew = getBooleanPropertyName(jsonObject2, AppEnvironment.ISNEW);
                                BookInfo bookinfo3 = new BookInfo();
                                bookinfo3.setBook_id(book_id);
                                bookinfo3.setBook_name(book_name);
                                bookinfo3.setBookdownloadsize(book_downloadsize);
                                bookinfo3.setBooksize(book_size);
                                bookinfo3.setBook_updatetime(book_updatetime);
                                bookinfo3.setChapter_id(chapterid);
                                bookinfo3.setchapter_name(chaptername);
                                bookinfo3.setSection_id(section_id);
                                bookinfo3.setSection_dxid(section_dxid);
                                bookinfo3.setsection_name(section_name);
                                bookinfo3.setExams(examslist);
                                bookinfo3.setSection_webpath(getJsonArray(section_webpath));
                                bookinfo3.setSection_path(getJsonArray(section_path));
                                int webpathsize = bookinfo3.getSection_webpath().size();
                                bookinfo3.setDownloadsize(getLongJsonArray(webpathsize, downloadsize));
                                bookinfo3.setSize(getLongJsonArray(webpathsize, size));
                                bookinfo3.setsection_tag(section_tag);
                                bookinfo3.setsection_updatetime(section_updatetime);
                                bookinfo3.setIsdown(isdown);
                                bookinfo3.setIsnew(isnew);
                                if ("".equals(exams_progress)) {
                                    if (sectionexamsize == 0) {
                                        bookinfo3.setexams_progress("100");
                                    } else {
                                        bookinfo3.setexams_progress("0");
                                    }
                                } else if (sectionexamsize == 0) {
                                    bookinfo3.setexams_progress("100");
                                } else {
                                    bookinfo3.setexams_progress(exams_progress);
                                }
                                if (!"".equals(section_progress)) {
                                    bookinfo3.setSection_progress(getJsonArray(section_progress));
                                } else if (bookinfo3.getSection_webpath().size() > 0) {
                                    ArrayList<String> progresslist = new ArrayList<>();
                                    for (int k = 0; k < webpathsize; k++) {
                                        progresslist.add("0");
                                    }
                                    bookinfo3.setSection_progress(progresslist);
                                }
                                bookinfo3.setParent(true);
                                book_total = bookinfo3.getSection_webpath().size() + book_total + bookinfo3.getExams().size();
                                if (bookinfo3.isIsnew()) {
                                    isnew_count++;
                                }
                                book.add(bookinfo3);
                            }
                        }
                    }
                }
                "".equals(book_id);
                if (!"".equals(book_id) && book.size() > 0) {
                    ArrayList<OldBooks> books = new ArrayList<>();
                    OldBooks newbook = new OldBooks();
                    newbook.setbook_id(book_id);
                    newbook.setbook_name(book_name);
                    newbook.setBookdownloadsize(book_downloadsize);
                    newbook.setBooksize(0L);
                    newbook.setBook_total(book_total);
                    newbook.setProgress("100");
                    newbook.setbook_path("../offlinedownload/" + book_id + "/");
                    newbook.setBook_updatetime(book_updatetime);
                    newbook.setBook_isnew(0);
                    ArrayList<OldBooks> books2 = booksparserJson(books);
                    boolean isnewbook = true;
                    Iterator<OldBooks> it2 = books2.iterator();
                    while (it2.hasNext()) {
                        OldBooks entry = it2.next();
                        if (newbook.getbook_id().equals(entry.getbook_id())) {
                            isnewbook = false;
                            entry.setbook_id(newbook.getbook_id());
                            entry.setbook_name(newbook.getbook_name());
                            entry.setbook_path(newbook.getbook_path());
                            entry.setBook_updatetime(newbook.getBook_updatetime());
                            entry.setBook_total(newbook.getBook_total());
                            if (isnew_count == 0) {
                                entry.setBook_isnew(newbook.getBook_isnew());
                            } else {
                                entry.setBook_isnew(1);
                            }
                        }
                    }
                    if (isnewbook) {
                        books2.add(newbook);
                        String Newjson = bookscreateJson(books2);
                        if (CreateFile(Newjson, com.edutech.daoxueben.sysconfig.AppEnvironment.JSON_BOOKS_File) && !"".equals(book_id)) {
                            String NewBookPath = String.valueOf(com.edutech.daoxueben.sysconfig.AppEnvironment.OFFLINE_DOWNLOAD) + book_id;
                            File offlinedownloaddir = new File(NewBookPath);
                            if (!offlinedownloaddir.exists()) {
                                offlinedownloaddir.mkdirs();
                            }
                        }
                    } else {
                        String Newjson2 = bookscreateJson(books2);
                        if (CreateFile(Newjson2, com.edutech.daoxueben.sysconfig.AppEnvironment.JSON_BOOKS_File)) {
                            "".equals(book_id);
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                book.clear();
            }
        }
        return book;
    }

    public static ArrayList<OldBooks> booksparserJson(ArrayList<OldBooks> books) {
        books.clear();
        File bookjson = new File(com.edutech.daoxueben.sysconfig.AppEnvironment.JSON_BOOKS_File);
        if (!bookjson.exists()) {
            try {
                bookjson.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            String json = getFileString(com.edutech.daoxueben.sysconfig.AppEnvironment.JSON_BOOKS_File);
            if (!"".equals(json)) {
                try {
                    JSONTokener jsonTokener = new JSONTokener(json);
                    JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
                    JSONArray array = jsonObject.getJSONArray("data");
                    for (int i = 0; i < array.length(); i++) {
                        JSONObject object = array.getJSONObject(i);
                        OldBooks book = new OldBooks();
                        String book_id = getPropertyName(object, "id");
                        String book_name = getPropertyName(object, "name");
                        long book_downloadsize = getLongPropertyName(object, KeyEnvironment.KEYDOWNLOADSIZE).longValue();
                        long book_size = getLongPropertyName(object, "size").longValue();
                        String book_path = getPropertyName(object, "path");
                        String book_progress = getPropertyName(object, "progress");
                        String book_updatetime = getPropertyName(object, "updatetime");
                        int book_isnew = getIntPropertyName(object, AppEnvironment.ISNEW);
                        int book_total = getIntPropertyName(object, "total");
                        book.setbook_id(book_id);
                        book.setbook_name(book_name);
                        book.setBookdownloadsize(book_downloadsize);
                        book.setBooksize(book_size);
                        book.setbook_path(book_path);
                        book.setProgress(book_progress);
                        book.setBook_updatetime(book_updatetime);
                        book.setBook_isnew(book_isnew);
                        book.setBook_total(book_total);
                        books.add(book);
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                }
            }
        }
        return books;
    }

    public static String peerbookcreateJson(ArrayList<BookInfo> book) {
        if (book.size() == 0) {
            return "";
        }
        String Book_id = book.get(0).getBook_id();
        String Book_name = book.get(0).getBook_name();
        long Book_downloadsize = book.get(0).getBookdownloadsize();
        long Book_size = book.get(0).getBooksize();
        String Book_updatetime = book.get(0).getBook_updatetime();
        JSONStringer jsonStringer = new JSONStringer();
        try {
            jsonStringer.object();
            jsonStringer.key("id").value(Book_id);
            jsonStringer.key("name").value(Book_name);
            jsonStringer.key(KeyEnvironment.KEYDOWNLOADSIZE).value(Book_downloadsize);
            jsonStringer.key("size").value(Book_size);
            jsonStringer.key("updatetime").value(Book_updatetime);
            jsonStringer.key("data");
            jsonStringer.array();
            int i = 0;
            while (i < book.size()) {
                BookInfo bookinfo = book.get(i);
                jsonStringer.object();
                String first_chapter_id = bookinfo.getChapter_id();
                String first_chapter_name = bookinfo.getchapter_name();
                jsonStringer.key("id").value(first_chapter_id);
                jsonStringer.key("name").value(first_chapter_name);
                if (!bookinfo.isParent()) {
                    i++;
                    jsonStringer.key("children");
                    jsonStringer.array();
                    jsonStringer.endArray();
                } else {
                    jsonStringer.key("children");
                    jsonStringer.array();
                    jsonStringer.object();
                    jsonStringer.key("id").value(bookinfo.getSection_id());
                    jsonStringer.key("dxid").value(bookinfo.getSection_dxid());
                    jsonStringer.key("name").value(bookinfo.getsection_name());
                    jsonStringer.key("examsprogress").value(bookinfo.getexams_progress());
                    jsonStringer.key("exams");
                    jsonStringer.array();
                    if (bookinfo.getExams().size() == 0) {
                        jsonStringer.endArray();
                    } else {
                        Iterator<ExamsInfo> it = bookinfo.getExams().iterator();
                        while (it.hasNext()) {
                            ExamsInfo tempexam = it.next();
                            jsonStringer.object();
                            jsonStringer.key("id").value(tempexam.getexams_id());
                            jsonStringer.key("questionid").value(tempexam.getquestion_id());
                            jsonStringer.key("body").value(tempexam.getexams_body());
                            jsonStringer.key("type").value(tempexam.getexams_type());
                            jsonStringer.key("answer").value(tempexam.getexams_answer());
                            jsonStringer.key(Form.TYPE_RESULT).value(tempexam.getexams_result());
                            jsonStringer.key("studentresult").value(tempexam.getexams_studentresult());
                            setJsonArray(jsonStringer, tempexam.getexams_webpath(), KeyEnvironment.KEYWEBPATH);
                            setJsonArray(jsonStringer, tempexam.getexams_path(), "path");
                            setLongJsonArray(jsonStringer, tempexam.getDownloadsize(), KeyEnvironment.KEYDOWNLOADSIZE);
                            setLongJsonArray(jsonStringer, tempexam.getSize(), "sizes");
                            setJsonArray(jsonStringer, tempexam.getexams_progress(), "progress");
                            jsonStringer.key("size").value(tempexam.getexams_totalsize());
                            jsonStringer.key("updatetime").value(tempexam.getExams_updatetime());
                            jsonStringer.endObject();
                        }
                        jsonStringer.endArray();
                    }
                    setJsonArray(jsonStringer, bookinfo.getSection_webpath(), KeyEnvironment.KEYWEBPATH);
                    setJsonArray(jsonStringer, bookinfo.getSection_path(), "path");
                    jsonStringer.key("tag").value(bookinfo.getsection_tag());
                    jsonStringer.key("updatetime").value(bookinfo.getsection_updatetime());
                    setJsonArray(jsonStringer, bookinfo.getSection_progress(), "progress");
                    setLongJsonArray(jsonStringer, bookinfo.getDownloadsize(), KeyEnvironment.KEYDOWNLOADSIZE);
                    setLongJsonArray(jsonStringer, bookinfo.getSize(), "size");
                    jsonStringer.key("isdown").value(book.get(i).isIsdown());
                    jsonStringer.key(AppEnvironment.ISNEW).value(book.get(i).isIsnew());
                    jsonStringer.endObject();
                    i++;
                    while (i < book.size() && first_chapter_name.equals(book.get(i).getchapter_name())) {
                        jsonStringer.object();
                        jsonStringer.key("id").value(book.get(i).getSection_id());
                        jsonStringer.key("dxid").value(book.get(i).getSection_dxid());
                        jsonStringer.key("name").value(book.get(i).getsection_name());
                        jsonStringer.key("examsprogress").value(book.get(i).getexams_progress());
                        jsonStringer.key("exams");
                        jsonStringer.array();
                        if (book.get(i).getExams().size() == 0) {
                            jsonStringer.endArray();
                        } else {
                            Iterator<ExamsInfo> it2 = book.get(i).getExams().iterator();
                            while (it2.hasNext()) {
                                ExamsInfo tempexam2 = it2.next();
                                jsonStringer.object();
                                jsonStringer.key("id").value(tempexam2.getexams_id());
                                jsonStringer.key("questionid").value(tempexam2.getquestion_id());
                                jsonStringer.key("body").value(tempexam2.getexams_body());
                                jsonStringer.key("type").value(tempexam2.getexams_type());
                                jsonStringer.key("answer").value(tempexam2.getexams_answer());
                                jsonStringer.key(Form.TYPE_RESULT).value(tempexam2.getexams_result());
                                jsonStringer.key("studentresult").value(tempexam2.getexams_studentresult());
                                setJsonArray(jsonStringer, tempexam2.getexams_webpath(), KeyEnvironment.KEYWEBPATH);
                                setJsonArray(jsonStringer, tempexam2.getexams_path(), "path");
                                setLongJsonArray(jsonStringer, tempexam2.getDownloadsize(), KeyEnvironment.KEYDOWNLOADSIZE);
                                setLongJsonArray(jsonStringer, tempexam2.getSize(), "sizes");
                                setJsonArray(jsonStringer, tempexam2.getexams_progress(), "progress");
                                jsonStringer.key("size").value(tempexam2.getexams_totalsize());
                                jsonStringer.key("updatetime").value(tempexam2.getExams_updatetime());
                                jsonStringer.endObject();
                            }
                            jsonStringer.endArray();
                        }
                        setJsonArray(jsonStringer, book.get(i).getSection_webpath(), KeyEnvironment.KEYWEBPATH);
                        setJsonArray(jsonStringer, book.get(i).getSection_path(), "path");
                        jsonStringer.key("tag").value(book.get(i).getsection_tag());
                        jsonStringer.key("updatetime").value(book.get(i).getsection_updatetime());
                        setJsonArray(jsonStringer, book.get(i).getSection_progress(), "progress");
                        setLongJsonArray(jsonStringer, book.get(i).getDownloadsize(), KeyEnvironment.KEYDOWNLOADSIZE);
                        setLongJsonArray(jsonStringer, book.get(i).getSize(), "size");
                        jsonStringer.key("isdown").value(book.get(i).isIsdown());
                        jsonStringer.key(AppEnvironment.ISNEW).value(book.get(i).isIsnew());
                        jsonStringer.endObject();
                        i++;
                    }
                    jsonStringer.endArray();
                }
                jsonStringer.endObject();
            }
            jsonStringer.endArray();
            jsonStringer.endObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonStringer.toString();
    }

    public static String bookscreateJson(ArrayList<OldBooks> books) {
        JSONStringer jsonStringer = new JSONStringer();
        try {
            jsonStringer.object();
            jsonStringer.key("data");
            jsonStringer.array();
            for (int i = 0; i < books.size(); i++) {
                OldBooks book = books.get(i);
                jsonStringer.object();
                String bookid = book.getbook_id();
                String bookname = book.getbook_name();
                long bookdownloadsize = book.getBookdownloadsize();
                long booksize = book.getBooksize();
                String bookpath = book.getbook_path();
                String bookprogress = book.getProgress();
                String book_updatetime = book.getBook_updatetime();
                int book_isnew = book.getBook_isnew();
                int book_total = book.getBook_total();
                jsonStringer.key("id").value(bookid);
                jsonStringer.key("name").value(bookname);
                jsonStringer.key("path").value(bookpath);
                jsonStringer.key(KeyEnvironment.KEYDOWNLOADSIZE).value(bookdownloadsize);
                jsonStringer.key("size").value(booksize);
                jsonStringer.key("progress").value(bookprogress);
                jsonStringer.key("updatetime").value(book_updatetime);
                jsonStringer.key(AppEnvironment.ISNEW).value(book_isnew);
                jsonStringer.key("total").value(book_total);
                jsonStringer.endObject();
            }
            jsonStringer.endArray();
            jsonStringer.endObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonStringer.toString();
    }

    public static ArrayList<BookInfo> getNeedDownloadList(ArrayList<BookInfo> peerbook, String downloadjson, String studentid) {
        ArrayList<ArrayList<String>> downloadjsonlist = new ArrayList<>();
        ArrayList<String> temp = new ArrayList<>();
        parsedownloadjson(downloadjson, downloadjsonlist, temp);
        int downloadjsonlistsize = downloadjsonlist.size();
        for (int i = 0; i < downloadjsonlistsize; i++) {
            int dipbook = downloadjsonlist.get(i).size();
            String bookid = "";
            String chapterid = "";
            String sectionid = "";
            for (int j = 0; j < dipbook; j++) {
                if (j == 0) {
                    String bookid2 = downloadjsonlist.get(i).get(j);
                    bookid = bookid2;
                } else if (j == 1) {
                    String chapterid2 = downloadjsonlist.get(i).get(j);
                    chapterid = chapterid2;
                } else if (j == 2) {
                    String sectionid2 = downloadjsonlist.get(i).get(j);
                    sectionid = sectionid2;
                }
            }
            if ("".equals(bookid) || "-2".equals(bookid)) {
                break;
            }
            if ("".equals(chapterid)) {
                Iterator<BookInfo> it = peerbook.iterator();
                while (it.hasNext()) {
                    BookInfo book = it.next();
                    if (bookid.equals(book.getBook_id())) {
                        book.setIsdown(true);
                        createExamsInfo(1, book.getBook_id(), book.getSection_dxid(), book.getExams(), studentid);
                    }
                }
            } else if ("".equals(sectionid)) {
                Iterator<BookInfo> it2 = peerbook.iterator();
                while (it2.hasNext()) {
                    BookInfo book2 = it2.next();
                    if (bookid.equals(book2.getBook_id()) && chapterid.equals(book2.getChapter_id())) {
                        book2.setIsdown(true);
                        createExamsInfo(1, book2.getBook_id(), book2.getSection_dxid(), book2.getExams(), studentid);
                    }
                }
            } else {
                Iterator<BookInfo> it3 = peerbook.iterator();
                while (it3.hasNext()) {
                    BookInfo book3 = it3.next();
                    if (bookid.equals(book3.getBook_id()) && chapterid.equals(book3.getChapter_id()) && sectionid.equals(book3.getSection_id())) {
                        book3.setIsdown(true);
                        createExamsInfo(1, book3.getBook_id(), book3.getSection_dxid(), book3.getExams(), studentid);
                    }
                }
            }
        }
        return peerbook;
    }

    public static void parsedownloadjson(String downloadjson, ArrayList<ArrayList<String>> downloadjsonlist, ArrayList<String> temp) {
        try {
            JSONObject jsonObject = new JSONObject(downloadjson);
            String id = getPropertyName(jsonObject, "id");
            String items = getPropertyName(jsonObject, "items");
            if (!"".equals(items)) {
                JSONArray array = jsonObject.getJSONArray("items");
                if (array.length() == 0) {
                    temp.add(id);
                    ArrayList<String> temp1 = new ArrayList<>();
                    Iterator<String> it = temp.iterator();
                    while (it.hasNext()) {
                        String s = it.next();
                        temp1.add(s);
                    }
                    downloadjsonlist.add(temp1);
                    if (temp.size() - 1 >= 0) {
                        temp.remove(temp.size() - 1);
                    }
                } else {
                    temp.add(id);
                }
                for (int i = 0; i < array.length(); i++) {
                    JSONObject object = array.getJSONObject(i);
                    parsedownloadjson(object.toString(), downloadjsonlist, temp);
                    if (i + 1 == array.length()) {
                        temp.remove(temp.size() - 1);
                    }
                }
                return;
            }
            temp.add(id);
            ArrayList<String> temp12 = new ArrayList<>();
            Iterator<String> it2 = temp.iterator();
            while (it2.hasNext()) {
                String s2 = it2.next();
                temp12.add(s2);
            }
            downloadjsonlist.add(temp12);
            if (temp.size() - 1 >= 0) {
                temp.remove(temp.size() - 1);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    public static void createExamsInfo(int jsupdate, String bookid, String dxid, ArrayList<ExamsInfo> exams, String studentid) {
        if (exams.size() > 0 && !"".equals(bookid) && !"".equals(dxid)) {
            JSONStringer jsonStringer = new JSONStringer();
            try {
                jsonStringer.object();
                jsonStringer.key("studentid").value(studentid);
                jsonStringer.key("exams");
                jsonStringer.array();
                Iterator<ExamsInfo> it = exams.iterator();
                while (it.hasNext()) {
                    ExamsInfo tempexam = it.next();
                    jsonStringer.object();
                    jsonStringer.key("id").value(tempexam.getexams_id());
                    jsonStringer.key("questionid").value(tempexam.getquestion_id());
                    jsonStringer.key("body").value(tempexam.getexams_body());
                    jsonStringer.key("type").value(tempexam.getexams_type());
                    jsonStringer.key("answer").value(tempexam.getexams_answer());
                    jsonStringer.key(Form.TYPE_RESULT).value(tempexam.getexams_result());
                    jsonStringer.key("studentresult").value(tempexam.getexams_studentresult());
                    setJsonArray(jsonStringer, tempexam.getexams_webpath(), KeyEnvironment.KEYWEBPATH);
                    setJsonArray(jsonStringer, tempexam.getexams_path(), "path");
                    setLongJsonArray(jsonStringer, tempexam.getDownloadsize(), KeyEnvironment.KEYDOWNLOADSIZE);
                    setLongJsonArray(jsonStringer, tempexam.getSize(), "sizes");
                    setJsonArray(jsonStringer, tempexam.getexams_progress(), "progress");
                    jsonStringer.key("size").value(tempexam.getexams_totalsize());
                    jsonStringer.key("updatetime").value(tempexam.getExams_updatetime());
                    jsonStringer.endObject();
                }
                jsonStringer.endArray();
                jsonStringer.endObject();
            } catch (JSONException e) {
                e.printStackTrace();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
            String json = jsonStringer.toString();
            String pathdir = String.valueOf(com.edutech.daoxueben.sysconfig.AppEnvironment.OFFLINE_DOWNLOAD) + bookid + "/" + dxid + "/" + studentid + "/";
            String path = String.valueOf(com.edutech.daoxueben.sysconfig.AppEnvironment.OFFLINE_DOWNLOAD) + bookid + "/" + dxid + "/" + studentid + "/" + dxid + ".json";
            File outFile = new File(path);
            if (jsupdate == 0) {
                if (!FileInOutHelper.fileIsExists(pathdir)) {
                    FileInOutHelper.createNewFile(outFile);
                    CreateFile(json, path);
                }
            } else if (jsupdate == 1) {
                if (outFile.exists()) {
                    outFile.delete();
                }
                FileInOutHelper.createNewFile(outFile);
                CreateFile(json, path);
            }
        }
    }

    public static ArrayList<ExamsInfo> parseExamsInfo(String bookid, String dxid, ArrayList<ExamsInfo> exams, String json) {
        try {
            JSONArray examsarray = new JSONArray(json);
            for (int i = 0; i < examsarray.length(); i++) {
                JSONObject examsobject = examsarray.getJSONObject(i);
                String exams_id = getPropertyName(examsobject, "id");
                String question_id = getPropertyName(examsobject, "questionid");
                String exams_body = getPropertyName(examsobject, "body");
                String exams_type = getPropertyName(examsobject, "type");
                int exams_answer = getIntPropertyName(examsobject, "answer");
                String exams_result = getPropertyName(examsobject, Form.TYPE_RESULT);
                String exams_studentresult = getPropertyName(examsobject, "studentresult");
                String exams_webpath = getPropertyName(examsobject, KeyEnvironment.KEYWEBPATH);
                String exams_path = getPropertyName(examsobject, "path");
                String downloadsize = getPropertyName(examsobject, KeyEnvironment.KEYDOWNLOADSIZE);
                long totalsize = getLongPropertyName(examsobject, "size").longValue();
                String size = getPropertyName(examsobject, "sizes");
                String exams_progress = getPropertyName(examsobject, "progress");
                String exams_updatetime = getPropertyName(examsobject, "updatetime");
                ExamsInfo examsinfo = new ExamsInfo();
                examsinfo.setexams_id(exams_id);
                examsinfo.setquestion_id(question_id);
                examsinfo.setexams_body(exams_body);
                examsinfo.setexams_type(exams_type);
                examsinfo.setexams_answer(exams_answer);
                examsinfo.setexams_result(exams_result);
                examsinfo.setexams_totalsize(totalsize);
                examsinfo.setexams_studentresult(exams_studentresult);
                examsinfo.setexams_webpath(getJsonArray(exams_webpath));
                examsinfo.setexams_path(getJsonArray(exams_path));
                examsinfo.setExams_updatetime(exams_updatetime);
                int webpathsize = examsinfo.getexams_webpath().size();
                examsinfo.setDownloadsize(getLongJsonArray(webpathsize, downloadsize));
                examsinfo.setSize(getLongJsonArray(webpathsize, size));
                if (!"".equals(exams_progress)) {
                    examsinfo.setexams_progress(getJsonArray(exams_progress));
                } else if (examsinfo.getexams_webpath().size() > 0) {
                    ArrayList<String> progresslist = new ArrayList<>();
                    for (int k = 0; k < webpathsize; k++) {
                        progresslist.add("0");
                    }
                    examsinfo.setexams_progress(progresslist);
                }
                exams.add(examsinfo);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        return exams;
    }

    public static int parseHttpPostReturnJson(String json) {
        if ("".equals(json)) {
            return 0;
        }
        try {
            JSONTokener jsonTokener = new JSONTokener(json);
            JSONObject jsonObject = (JSONObject) jsonTokener.nextValue();
            boolean status = getBooleanPropertyName(jsonObject, "status");
            int errorNum = getIntPropertyName(jsonObject, "errorNum");
            String errorInfo = getPropertyName(jsonObject, "errorInfo");
            if (!status || errorNum != 0) {
                return 0;
            }
            return "".equals(errorInfo) ? 1 : 0;
        } catch (JSONException e) {
            e.printStackTrace();
            return 0;
        } catch (Exception e2) {
            e2.printStackTrace();
            return 0;
        }
    }

    public static String bookUpdatePostCreateJson(ArrayList<BookUpdateInfo> updateinfo) {
        if (updateinfo.size() == 0) {
            return "";
        }
        JSONStringer jsonStringer = new JSONStringer();
        try {
            jsonStringer.object();
            jsonStringer.key("data");
            jsonStringer.array();
            for (int i = 0; i < updateinfo.size(); i++) {
                BookUpdateInfo bookupdateinfo = updateinfo.get(i);
                jsonStringer.object();
                String id = bookupdateinfo.getid();
                String type = bookupdateinfo.gettype();
                String source = bookupdateinfo.getsource();
                String updatetime = bookupdateinfo.getupdatetime();
                int total = bookupdateinfo.gettotal();
                jsonStringer.key("id").value(id);
                jsonStringer.key("type").value(type);
                jsonStringer.key("source").value(source);
                jsonStringer.key("updatetime").value(updatetime);
                jsonStringer.key("total").value(total);
                jsonStringer.endObject();
            }
            jsonStringer.endArray();
            jsonStringer.endObject();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonStringer.toString();
    }

    public static OldBooks getNewBooInfo(String id, String name, String path) {
        OldBooks book = new OldBooks();
        book.setbook_id(id);
        book.setbook_id(name);
        book.setbook_id(path);
        return book;
    }

    private static String CreateDir() {
        String SQLMessagePath = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + File.separatorChar + "JSONFile" + File.separatorChar;
        File sqlmessagepath = new File(SQLMessagePath);
        if (!sqlmessagepath.exists()) {
            sqlmessagepath.mkdirs();
        }
        return SQLMessagePath;
    }

    public static synchronized String getFileString(String path) {
        String str;
        synchronized (JsonHelper.class) {
            String res = "";
            File file = new File(path);
            if (!file.exists()) {
                str = res;
            } else {
                try {
                    FileInputStream fin = new FileInputStream(path);
                    int length = fin.available();
                    byte[] buffer = new byte[length];
                    fin.read(buffer);
                    res = EncodingUtils.getString(buffer, "UTF-8");
                    fin.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                str = res == null ? "" : res;
            }
        }
        return str;
    }

    public static synchronized boolean CreateFile(String Json, String path) {
        boolean z = false;
        synchronized (JsonHelper.class) {
            File newFile = new File(path);
            try {
                FileOutputStream fos = new FileOutputStream(newFile);
                try {
                    fos.write(Json.getBytes("UTF-8"));
                    fos.close();
                    z = true;
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } catch (FileNotFoundException e2) {
                e2.printStackTrace();
            }
        }
        return z;
    }

    public static String getPropertyName(JSONObject jsonObject, String propertyName) {
        if (!jsonObject.isNull(propertyName)) {
            try {
                String Name = jsonObject.getString(propertyName);
                return Name;
            } catch (JSONException e) {
                e.printStackTrace();
                return "";
            }
        }
        return "";
    }

    public static boolean getBooleanPropertyName(JSONObject jsonObject, String propertyName) {
        if (!jsonObject.isNull(propertyName)) {
            try {
                boolean Name = jsonObject.getBoolean(propertyName);
                return Name;
            } catch (JSONException e) {
                e.printStackTrace();
                return false;
            }
        }
        return false;
    }

    private static Long getLongPropertyName(JSONObject jsonObject, String propertyName) {
        long Name;
        if (!jsonObject.isNull(propertyName)) {
            try {
                Name = jsonObject.getLong(propertyName);
            } catch (JSONException e) {
                e.printStackTrace();
                Name = 0;
            }
        } else {
            Name = 0;
        }
        return Long.valueOf(Name);
    }

    public static int getIntPropertyName(JSONObject jsonObject, String propertyName) {
        if (!jsonObject.isNull(propertyName)) {
            try {
                int Name = jsonObject.getInt(propertyName);
                return Name;
            } catch (JSONException e) {
                e.printStackTrace();
                return 0;
            }
        }
        return 0;
    }

    public static boolean isJsonArray(String objectString) {
        if (objectString == null || "".equals(objectString)) {
            return false;
        }
        int start = objectString.indexOf("{");
        return start != -1;
    }

    public static ArrayList<String> getJsonArray(String objectString) {
        ArrayList<String> temparray = new ArrayList<>();
        try {
            JSONArray jsonarray = new JSONArray(objectString);
            for (int k = 0; k < jsonarray.length(); k++) {
                temparray.add(jsonarray.getString(k));
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return temparray;
    }

    public static ArrayList<Long> getLongJsonArray(int webpathsize, String objectString) {
        ArrayList<Long> temparray = new ArrayList<>();
        if (!"".equals(objectString)) {
            try {
                JSONArray jsonarray = new JSONArray(objectString);
                for (int k = 0; k < jsonarray.length(); k++) {
                    temparray.add(Long.valueOf(jsonarray.getLong(k)));
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        } else if (webpathsize > 0) {
            for (int k2 = 0; k2 < webpathsize; k2++) {
                temparray.add(0L);
            }
        }
        return temparray;
    }

    public static void setJsonArray(JSONStringer jsonStringer, ArrayList<String> arraylist, String propertyName) {
        int arraylistsize = arraylist.size();
        try {
            jsonStringer.key(propertyName);
            jsonStringer.array();
            for (int k = 0; k < arraylistsize; k++) {
                jsonStringer.value(arraylist.get(k));
            }
            jsonStringer.endArray();
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    public static void setLongJsonArray(JSONStringer jsonStringer, ArrayList<Long> arraylist, String propertyName) {
        int arraylistsize = arraylist.size();
        try {
            jsonStringer.key(propertyName);
            jsonStringer.array();
            for (int k = 0; k < arraylistsize; k++) {
                jsonStringer.value(arraylist.get(k));
            }
            jsonStringer.endArray();
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
}
