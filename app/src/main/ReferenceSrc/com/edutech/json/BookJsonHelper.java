package com.edutech.json;

import com.edutech.idauthentication.JsonHelper;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes.dex */
public class BookJsonHelper {
    public static void addBookToBooksJson(String book_id, String book_name, long book_downloadsize, long book_size, String booksJsonPath) {
        if (!"".equals(book_id)) {
            ArrayList<Books> books = new ArrayList<>();
            Books newbook = new Books();
            newbook.setbook_id(book_id);
            newbook.setbook_name(book_name);
            newbook.setBookdownloadsize(book_downloadsize);
            newbook.setBooksize(book_size);
            newbook.setProgress("0");
            newbook.setbook_path("../offlinedownload/" + book_id + "/");
            ArrayList<Books> books2 = JsonParse.parseBooksJson(books, booksJsonPath);
            boolean isnewbook = true;
            Iterator<Books> it = books2.iterator();
            while (it.hasNext()) {
                Books entry = it.next();
                if (newbook.getbook_id().equals(entry.getbook_id())) {
                    isnewbook = false;
                    entry.setbook_id(newbook.getbook_id());
                    entry.setbook_name(newbook.getbook_name());
                    entry.setBooksize(newbook.getBooksize());
                    entry.setbook_path(newbook.getbook_path());
                }
            }
            if (isnewbook) {
                books2.add(newbook);
            }
            writeToLocal(books2, book_id, booksJsonPath);
        }
    }

    public static void getBooks(Books book, String booksJsonPath) {
        ArrayList<Books> books = new ArrayList<>();
        String bookid = book.getbook_id();
        boolean isnewbook = true;
        if (bookid != null && !"".equals(bookid)) {
            books = JsonParse.parseBooksJson(books, booksJsonPath);
            Iterator<Books> it = books.iterator();
            while (it.hasNext()) {
                Books entry = it.next();
                if (bookid.equals(entry.getbook_id())) {
                    isnewbook = false;
                    entry.setbook_name(book.getbook_name());
                    entry.setbook_path(book.getbook_path());
                    entry.setBook_updatetime(book.getBook_updatetime());
                    entry.setBook_total(book.getBook_total());
                    entry.setBook_isnew(book.getBook_isnew());
                    entry.setBookdownloadsize(book.getBookdownloadsize());
                    entry.setBooksize(book.getBooksize());
                    entry.setProgress(book.getProgress());
                }
            }
        }
        if (isnewbook) {
            books.add(book);
        }
        writeToLocal(books, bookid, booksJsonPath);
    }

    public static void deleteBooksJsonInfo(String bookid, String booksJsonPath) {
        boolean isexistbook = false;
        ArrayList<Books> books = JsonParse.parseBooksJson(new ArrayList<>(), booksJsonPath);
        Books newbook = new Books();
        Iterator<Books> it = books.iterator();
        while (it.hasNext()) {
            Books entry = it.next();
            if (bookid.equals(entry.getbook_id())) {
                isexistbook = true;
                newbook = entry;
            }
        }
        if (isexistbook) {
            books.remove(newbook);
        }
        writeToLocal(books, bookid, booksJsonPath);
    }

    public static void updateIsNewToBooksJson(String book_id, String booksJsonPath) {
        if (!"".equals(book_id)) {
            ArrayList<Books> books = JsonParse.parseBooksJson(new ArrayList<>(), booksJsonPath);
            Iterator<Books> it = books.iterator();
            while (it.hasNext()) {
                Books entry = it.next();
                if (book_id.equals(entry.getbook_id())) {
                    entry.setBook_isnew(1);
                }
            }
            writeToLocal(books, book_id, booksJsonPath);
        }
    }

    private static void writeToLocal(ArrayList<Books> books, String book_id, String booksJsonPath) {
        String Newjson = JsonCreate.createBooksJson(books);
        if (JsonHelper.CreateFile(Newjson, booksJsonPath)) {
            "".equals(book_id);
        }
    }

    public static String getStringDefault(Object object) {
        return object == null ? "" : object.toString();
    }

    public static long getLongDefault(Object object) {
        if (object == null) {
            return 0L;
        }
        return Long.valueOf(object.toString()).longValue();
    }
}
