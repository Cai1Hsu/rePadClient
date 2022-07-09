package com.edutech.json;

import com.edutech.idauthentication.JsonHelper;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes.jar:com/edutech/json/BookJsonHelper.class */
public class BookJsonHelper {
    public static void addBookToBooksJson(String str, String str2, long j, long j2, String str3) {
        if (!"".equals(str)) {
            ArrayList arrayList = new ArrayList();
            Books books = new Books();
            books.setbook_id(str);
            books.setbook_name(str2);
            books.setBookdownloadsize(j);
            books.setBooksize(j2);
            books.setProgress("0");
            books.setbook_path("../offlinedownload/" + str + "/");
            ArrayList<Books> parseBooksJson = JsonParse.parseBooksJson(arrayList, str3);
            boolean z = true;
            Iterator<Books> it = parseBooksJson.iterator();
            while (it.hasNext()) {
                Books next = it.next();
                if (books.getbook_id().equals(next.getbook_id())) {
                    z = false;
                    next.setbook_id(books.getbook_id());
                    next.setbook_name(books.getbook_name());
                    next.setBooksize(books.getBooksize());
                    next.setbook_path(books.getbook_path());
                }
            }
            if (z) {
                parseBooksJson.add(books);
            }
            writeToLocal(parseBooksJson, str, str3);
        }
    }

    public static void deleteBooksJsonInfo(String str, String str2) {
        boolean z = false;
        ArrayList<Books> parseBooksJson = JsonParse.parseBooksJson(new ArrayList(), str2);
        Books books = new Books();
        Iterator<Books> it = parseBooksJson.iterator();
        while (it.hasNext()) {
            Books next = it.next();
            if (str.equals(next.getbook_id())) {
                z = true;
                books = next;
            }
        }
        if (z) {
            parseBooksJson.remove(books);
        }
        writeToLocal(parseBooksJson, str, str2);
    }

    public static void getBooks(Books books, String str) {
        ArrayList<Books> arrayList = new ArrayList<>();
        String str2 = books.getbook_id();
        ArrayList<Books> arrayList2 = arrayList;
        boolean z = true;
        if (str2 != null) {
            arrayList2 = arrayList;
            z = true;
            if (!"".equals(str2)) {
                arrayList2 = JsonParse.parseBooksJson(arrayList, str);
                Iterator<Books> it = arrayList2.iterator();
                z = true;
                while (it.hasNext()) {
                    Books next = it.next();
                    if (str2.equals(next.getbook_id())) {
                        z = false;
                        next.setbook_name(books.getbook_name());
                        next.setbook_path(books.getbook_path());
                        next.setBook_updatetime(books.getBook_updatetime());
                        next.setBook_total(books.getBook_total());
                        next.setBook_isnew(books.getBook_isnew());
                        next.setBookdownloadsize(books.getBookdownloadsize());
                        next.setBooksize(books.getBooksize());
                        next.setProgress(books.getProgress());
                    }
                }
            }
        }
        if (z) {
            arrayList2.add(books);
        }
        writeToLocal(arrayList2, str2, str);
    }

    public static long getLongDefault(Object obj) {
        return obj == null ? 0L : Long.valueOf(obj.toString()).longValue();
    }

    public static String getStringDefault(Object obj) {
        return obj == null ? "" : obj.toString();
    }

    public static void updateIsNewToBooksJson(String str, String str2) {
        if (!"".equals(str)) {
            ArrayList<Books> parseBooksJson = JsonParse.parseBooksJson(new ArrayList(), str2);
            Iterator<Books> it = parseBooksJson.iterator();
            while (it.hasNext()) {
                Books next = it.next();
                if (str.equals(next.getbook_id())) {
                    next.setBook_isnew(1);
                }
            }
            writeToLocal(parseBooksJson, str, str2);
        }
    }

    private static void writeToLocal(ArrayList<Books> arrayList, String str, String str2) {
        if (JsonHelper.CreateFile(JsonCreate.createBooksJson(arrayList), str2)) {
            "".equals(str);
        }
    }
}
