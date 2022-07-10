package com.anfengde.epub.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import java.util.ArrayList;
import java.util.List;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class DBDriver extends SQLiteOpenHelper {
    private static final String DATABASE_NAME = "afd.sqlite";
    private static final int DATABASE_VERSION = 1;
    private static final String KEY_AUTHOR = "author";
    private static final String KEY_BOOKPATH = "bookPath";
    private static final String KEY_COVERIMAGE = "coverimage";
    private static final String KEY_ID = "identifier";
    private static final String KEY_NAME = "name";
    private static final String TABLE_CONTACTS = "books";

    public DBDriver(Context context) {
        super(context, DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, 1);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE IF NOT EXISTS books  (identifier VARCHAR PRIMARY KEY  NOT NULL  UNIQUE , name VARCHAR NOT NULL , author VARCHAR, coverimage VARCHAR, bookpath VARCHAR NOT NULL )");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS books");
        onCreate(db);
    }

    public void addBook(DBBooks book) {
        SQLiteDatabase db = getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(KEY_ID, sqliteEscape(book.getIdentifier()));
        values.put("name", sqliteEscape(book.getName()));
        values.put(KEY_AUTHOR, sqliteEscape(book.getAuthor()));
        values.put(KEY_COVERIMAGE, sqliteEscape(book.getCoverimage()));
        values.put(KEY_BOOKPATH, sqliteEscape(book.getBookpath()));
        db.insert(TABLE_CONTACTS, null, values);
        db.close();
    }

    public List<DBBooks> getAllBooks() {
        List<DBBooks> bookList = new ArrayList<>();
        SQLiteDatabase db = getWritableDatabase();
        Cursor cursor = db.rawQuery("SELECT  * FROM books", null);
        if (cursor.moveToFirst()) {
            do {
                DBBooks book = new DBBooks();
                book.setIdentifier(cursor.getString(0));
                book.setName(cursor.getString(1));
                book.setAuthor(cursor.getString(2));
                book.setCoverimage(cursor.getString(3));
                book.setBookpath(cursor.getString(4));
                bookList.add(book);
            } while (cursor.moveToNext());
            cursor.close();
            db.close();
            return bookList;
        }
        cursor.close();
        db.close();
        return bookList;
    }

    public void deleteBook(DBBooks book) {
        SQLiteDatabase db = getWritableDatabase();
        db.delete(TABLE_CONTACTS, "identifier = ?", new String[]{book.getIdentifier()});
        db.close();
    }

    public void deleteAllBook() {
        SQLiteDatabase db = getWritableDatabase();
        db.delete(TABLE_CONTACTS, null, null);
        db.close();
    }

    public String sqliteEscape(String src) {
        return src.replace("'", "''");
    }
}
