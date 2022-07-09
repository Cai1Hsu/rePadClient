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

/* loaded from: classes.jar:com/edutech/daoxueben/until/SqliteForDaoxue.class */
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

    private void initDataBaseFile() {
        synchronized (this) {
            File file = new File(SQLFILEPATH);
            if (!file.isDirectory()) {
                file.mkdirs();
            }
            File file2 = new File(String.valueOf(SQLFILEPATH) + AppEnvironment.STUDENT_ID + ".db");
            if (!file2.exists()) {
                try {
                    UpOrDownFile.firstInitSql = LogHelp.TYPE_GUIDANCE;
                    file2.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (this.db == null) {
                this.db = SQLiteDatabase.openOrCreateDatabase(file2, (SQLiteDatabase.CursorFactory) null);
            }
            onCreateTable();
        }
    }

    public void close() {
        synchronized (this.db) {
            if (this.db != null) {
                this.db.close();
                this.db = null;
            }
        }
    }

    public boolean containColums(String str, String str2, String[] strArr) {
        boolean z = false;
        boolean z2 = false;
        synchronized (this.db) {
            if (this.db != null) {
                Cursor query = this.db.query(str, null, str2, strArr, null, null, null, null);
                if (query != null) {
                    z2 = query.moveToFirst();
                }
                z = z2;
                if (query != null) {
                    query.close();
                    z = z2;
                }
            }
        }
        return z;
    }

    public long deleteDiscuss(String str, String str2, String[] strArr) {
        long j = 0;
        synchronized (this.db) {
            if (this.db != null) {
                j = this.db.delete(str, str2, strArr);
            }
        }
        return j;
    }

    public long insertDiscuss(String str, ContentValues contentValues) {
        long j;
        synchronized (this.db) {
            j = 0;
            if (this.db != null) {
                this.db.beginTransaction();
                j = 0;
                if (contentValues != null) {
                    j = this.db.insert(str, null, contentValues);
                }
                this.db.setTransactionSuccessful();
                this.db.endTransaction();
            }
        }
        return j;
    }

    public long insertDiscuss(String str, List<ContentValues> list) {
        long j;
        synchronized (this.db) {
            j = 0;
            if (this.db != null) {
                this.db.beginTransaction();
                j = 0;
                for (int i = 0; i < list.size(); i++) {
                    ContentValues contentValues = list.get(i);
                    if (contentValues != null) {
                        j = this.db.insert(str, null, contentValues);
                    }
                }
                this.db.setTransactionSuccessful();
                this.db.endTransaction();
            }
        }
        return j;
    }

    public void onCreateTable() {
        this.db.execSQL("CREATE TABLE IF NOT EXISTS " + DAOXUE_TABLE + "(" + ID + " INTEGER PRIMARY KEY AUTOINCREMENT," + DAOXUE_ID + " TEXT," + DAOXUE_ISDOWNLOAD + " TEXT," + DAOXUE_BOOKID + " TEXT," + DAOXUE_DEFAULT1 + " TEXT," + DAOXUE_DEFAULT2 + " TEXT);");
    }

    public Cursor queryDiscuss(String str, String str2, String[] strArr, String str3) {
        Cursor cursor = null;
        synchronized (this.db) {
            if (this.db != null) {
                cursor = this.db.query(str, null, str2, strArr, null, null, str3, null);
            }
        }
        return cursor;
    }

    /* JADX DEBUG: Another duplicated slice has different insns count: {[MOVE]}, finally: {[MOVE, MOVE, INVOKE, MOVE, INVOKE, IF] complete} */
    public boolean tabbleIsExist(String str) {
        boolean z;
        if (str == null) {
            z = false;
        } else {
            Cursor cursor = null;
            Cursor cursor2 = null;
            try {
                try {
                    Cursor rawQuery = this.db.rawQuery("select count(*) as c from sqlite_master  where type ='table' and name ='" + str.trim() + "' ", null);
                    boolean z2 = false;
                    if (rawQuery.moveToNext()) {
                        cursor = rawQuery;
                        cursor2 = rawQuery;
                        z2 = false;
                        if (rawQuery.getInt(0) > 0) {
                            z2 = true;
                        }
                    }
                    z = z2;
                    if (rawQuery != null) {
                        rawQuery.close();
                        z = z2;
                    }
                } catch (Exception e) {
                    cursor2 = cursor;
                    Log.d("tabbleIsExist", "操作失败");
                    z = false;
                    if (cursor != null) {
                        cursor.close();
                        z = false;
                    }
                }
            } catch (Throwable th) {
                if (cursor2 != null) {
                    cursor2.close();
                }
                throw th;
            }
        }
        return z;
    }

    public long updateDiscuss(String str, ContentValues contentValues, String str2, String[] strArr) {
        long j = 0;
        synchronized (this.db) {
            if (this.db != null) {
                j = this.db.update(str, contentValues, str2, strArr);
            }
        }
        return j;
    }
}
