package com.edutech.cloudclientsetting.activity;

import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Environment;
import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.util.List;
import org.jivesoftware.smackx.packet.JingleContent;

/* loaded from: classes.dex */
public class SqliteForDiscuss {
    public SQLiteDatabase db = null;
    private Context mcontext;
    public static String DANAME = "discussdb";
    public static int VERSION = 1;
    public static String DISCUSS_TABLE = "discuss";
    public static String DETAILS_TABLE = "details";
    public static String DISCUSS_ID = "id";
    public static String DISCUSS_MSGID = "msgid";
    public static String DISCUSS_SUBJECT = "subject";
    public static String DISCUSS_CONTENT = JingleContent.NODENAME;
    public static String DISCUSS_CTIME = "ctime";
    public static String DISCUSS_SUBJID = "subjectid";
    public static String DISCUSS_SUBNAME = "subjectname";
    public static String DISCUSS_READ = "read";
    public static String DISCUSS_AUTHOR = "author";
    public static String DISCUSS_REPLY = "reply";
    public static String DISCUSS_GOOD = "good";
    public static String DISCUSS_ISGOOD = "isgood";
    public static String DISCUSS_DEFAULT = "lastone";
    public static String DISCUSS_ITEMS = "items";
    public static final String SQLFILEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/hudong/";

    public SqliteForDiscuss(Context context) {
        this.mcontext = context;
        initDataBaseFile();
    }

    private synchronized void initDataBaseFile() {
        File file = new File(SQLFILEPATH);
        if (!file.isDirectory()) {
            file.mkdir();
        }
        SharedPreferences sharePre = this.mcontext.getSharedPreferences("privatekey", 0);
        String username = sharePre.getString("name", "");
        File dbFile = new File(String.valueOf(SQLFILEPATH) + username + ".db");
        if (!dbFile.exists()) {
            try {
                dbFile.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (this.db == null) {
            this.db = SQLiteDatabase.openOrCreateDatabase(dbFile, (SQLiteDatabase.CursorFactory) null);
        }
        onCreateTable();
    }

    public boolean tabbleIsExist(String tableName) {
        boolean result = false;
        if (tableName == null) {
            return false;
        }
        Cursor cursor = null;
        try {
            try {
                String sql = "select count(*) as c from sqlite_master  where type ='table' and name ='" + tableName.trim() + "' ";
                cursor = this.db.rawQuery(sql, null);
                if (cursor.moveToNext()) {
                    int count = cursor.getInt(0);
                    if (count > 0) {
                        result = true;
                    }
                }
            } catch (Exception e) {
                Log.d("tabbleIsExist", "操作失败");
                if (cursor != null) {
                    cursor.close();
                }
            }
            return result;
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
    }

    public void onCreateTable() {
        String sqlStr = "CREATE TABLE IF NOT EXISTS " + DISCUSS_TABLE + "(" + DISCUSS_ID + " INTEGER PRIMARY KEY AUTOINCREMENT," + DISCUSS_MSGID + " TEXT," + DISCUSS_SUBJECT + " TEXT," + DISCUSS_CONTENT + " TEXT," + DISCUSS_CTIME + " TEXT," + DISCUSS_SUBJID + " TEXT," + DISCUSS_SUBNAME + " TEXT," + DISCUSS_READ + " INTEGER," + DISCUSS_AUTHOR + " TEXT," + DISCUSS_REPLY + " INTEGER," + DISCUSS_GOOD + " INTEGER," + DISCUSS_ISGOOD + " TEXT," + DISCUSS_DEFAULT + " TEXT);";
        this.db.execSQL(sqlStr);
    }

    public void onCreateDetailsTable() {
        String sqlStr = "CREATE TABLE IF NOT EXISTS " + DETAILS_TABLE + "(" + DISCUSS_ID + " INTEGER PRIMARY KEY AUTOINCREMENT," + DISCUSS_MSGID + " TEXT," + DISCUSS_ITEMS + " TEXT);";
        this.db.execSQL(sqlStr);
    }

    public void close() {
        synchronized (this.db) {
            if (this.db != null) {
                this.db.close();
                this.db = null;
            }
        }
    }

    public long insertDiscuss(String table, List<ContentValues> values) {
        long num = 0;
        synchronized (this.db) {
            if (this.db != null) {
                this.db.beginTransaction();
                for (int i = 0; i < values.size(); i++) {
                    ContentValues value = values.get(i);
                    if (value != null) {
                        num = this.db.insert(table, null, value);
                    }
                }
                this.db.setTransactionSuccessful();
                this.db.endTransaction();
            }
        }
        return num;
    }

    public long updateDiscuss(String table, ContentValues values, String whereClause, String[] whereArgs) {
        long num = 0;
        synchronized (this.db) {
            if (this.db != null) {
                num = this.db.update(table, values, whereClause, whereArgs);
            }
        }
        return num;
    }

    public long deleteDiscuss(String table, String whereClause, String[] whereArgs) {
        long num = 0;
        synchronized (this.db) {
            if (this.db != null) {
                num = this.db.delete(table, whereClause, whereArgs);
            }
        }
        return num;
    }

    public Cursor queryDiscuss(String table, String selection, String[] selectionArgs, String orderBy) {
        Cursor cursor = null;
        synchronized (this.db) {
            if (this.db != null) {
                cursor = this.db.query(table, null, selection, selectionArgs, null, null, orderBy, null);
            }
        }
        return cursor;
    }

    public boolean containColums(String table, String selection, String[] selectionArgs) {
        boolean boo = false;
        synchronized (this.db) {
            if (this.db != null) {
                Cursor cursor = this.db.query(table, null, selection, selectionArgs, null, null, null, null);
                if (cursor != null) {
                    boo = cursor.moveToFirst();
                }
                if (cursor != null) {
                    cursor.close();
                }
            }
        }
        return boo;
    }
}
