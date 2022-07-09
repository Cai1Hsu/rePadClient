package com.anfengde.epub.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes.jar:com/anfengde/epub/db/DBDriver.class */
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

    public void addBook(DBBooks dBBooks) {
        SQLiteDatabase writableDatabase = getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put(KEY_ID, sqliteEscape(dBBooks.getIdentifier()));
        contentValues.put("name", sqliteEscape(dBBooks.getName()));
        contentValues.put(KEY_AUTHOR, sqliteEscape(dBBooks.getAuthor()));
        contentValues.put(KEY_COVERIMAGE, sqliteEscape(dBBooks.getCoverimage()));
        contentValues.put(KEY_BOOKPATH, sqliteEscape(dBBooks.getBookpath()));
        writableDatabase.insert(TABLE_CONTACTS, null, contentValues);
        writableDatabase.close();
    }

    public void deleteAllBook() {
        SQLiteDatabase writableDatabase = getWritableDatabase();
        writableDatabase.delete(TABLE_CONTACTS, null, null);
        writableDatabase.close();
    }

    public void deleteBook(DBBooks dBBooks) {
        SQLiteDatabase writableDatabase = getWritableDatabase();
        writableDatabase.delete(TABLE_CONTACTS, "identifier = ?", new String[]{dBBooks.getIdentifier()});
        writableDatabase.close();
    }

    public List<DBBooks> getAllBooks() {
        ArrayList arrayList = new ArrayList();
        SQLiteDatabase writableDatabase = getWritableDatabase();
        Cursor rawQuery = writableDatabase.rawQuery("SELECT  * FROM books", null);
        if (!rawQuery.moveToFirst()) {
            rawQuery.close();
            writableDatabase.close();
            return arrayList;
        }
        do {
            DBBooks dBBooks = new DBBooks();
            dBBooks.setIdentifier(rawQuery.getString(0));
            dBBooks.setName(rawQuery.getString(1));
            dBBooks.setAuthor(rawQuery.getString(2));
            dBBooks.setCoverimage(rawQuery.getString(3));
            dBBooks.setBookpath(rawQuery.getString(4));
            arrayList.add(dBBooks);
        } while (rawQuery.moveToNext());
        rawQuery.close();
        writableDatabase.close();
        return arrayList;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("CREATE TABLE IF NOT EXISTS books  (identifier VARCHAR PRIMARY KEY  NOT NULL  UNIQUE , name VARCHAR NOT NULL , author VARCHAR, coverimage VARCHAR, bookpath VARCHAR NOT NULL )");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS books");
        onCreate(sQLiteDatabase);
    }

    public String sqliteEscape(String str) {
        return str.replace("'", "''");
    }
}
