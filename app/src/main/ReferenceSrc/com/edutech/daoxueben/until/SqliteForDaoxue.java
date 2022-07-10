package com.edutech.daoxueben.until;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Environment;
import android.util.Log;
import com.edutech.daoxueben.sysconfig.AppEnvironment;
import com.edutech.publicedu.log.LogHelp;
import java.io.File;
import java.io.IOException;
import java.util.List;
/* loaded from: /home/caiyi/jadx/jadx-1.4.2/bin/classes.dex */
public class SqliteForDaoxue {
    public SQLiteDatabase db = null;
    private Context mcontext;
    public static String DANAME = "discussdb";
    public static int VERSION = 1;
    public static String DAOXUE_TABLE = "daoxue";
    public static String ID = "id";
    public static String DAOXUE_ID = "msgid";
    public static String DAOXUE_ISDOWNLOAD = "isdownload";
    public static String DAOXUE_BOOKID = "bookid";
    public static String DAOXUE_DEFAULT1 = "default1";
    public static String DAOXUE_DEFAULT2 = "default2";
    public static final String SQLFILEPATH = String.valueOf(Environment.getExternalStorageDirectory().getAbsolutePath()) + "/MobileStudyClient/.System/DaoXueBen/";

    public SqliteForDaoxue(Context context) {
        this.mcontext = context;
        initDataBaseFile();
    }

    private synchronized void initDataBaseFile() {
        File file = new File(SQLFILEPATH);
        if (!file.isDirectory()) {
            file.mkdirs();
        }
        File dbFile = new File(String.valueOf(SQLFILEPATH) + AppEnvironment.STUDENT_ID + ".db");
        if (!dbFile.exists()) {
            try {
                UpOrDownFile.firstInitSql = LogHelp.TYPE_GUIDANCE;
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
        String sqlStr = "CREATE TABLE IF NOT EXISTS " + DAOXUE_TABLE + "(" + ID + " INTEGER PRIMARY KEY AUTOINCREMENT," + DAOXUE_ID + " TEXT," + DAOXUE_ISDOWNLOAD + " TEXT," + DAOXUE_BOOKID + " TEXT," + DAOXUE_DEFAULT1 + " TEXT," + DAOXUE_DEFAULT2 + " TEXT);";
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

    public long insertDiscuss(String table, ContentValues value) {
        long num = 0;
        synchronized (this.db) {
            if (this.db != null) {
                this.db.beginTransaction();
                if (value != null) {
                    num = this.db.insert(table, null, value);
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
