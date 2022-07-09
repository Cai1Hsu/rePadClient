.class public Lcom/edutech/daoxueben/until/SqliteForDaoxue;
.super Ljava/lang/Object;
.source "SqliteForDaoxue.java"


# static fields
.field public static DANAME:Ljava/lang/String;

.field public static DAOXUE_BOOKID:Ljava/lang/String;

.field public static DAOXUE_DEFAULT1:Ljava/lang/String;

.field public static DAOXUE_DEFAULT2:Ljava/lang/String;

.field public static DAOXUE_ID:Ljava/lang/String;

.field public static DAOXUE_ISDOWNLOAD:Ljava/lang/String;

.field public static DAOXUE_TABLE:Ljava/lang/String;

.field public static ID:Ljava/lang/String;

.field public static final SQLFILEPATH:Ljava/lang/String;

.field public static VERSION:I


# instance fields
.field public db:Landroid/database/sqlite/SQLiteDatabase;

.field private mcontext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 22
    const-string/jumbo v0, "discussdb"

    sput-object v0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DANAME:Ljava/lang/String;

    .line 23
    const/4 v0, 0x1

    sput v0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->VERSION:I

    .line 24
    const-string/jumbo v0, "daoxue"

    sput-object v0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DAOXUE_TABLE:Ljava/lang/String;

    .line 25
    const-string/jumbo v0, "id"

    sput-object v0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->ID:Ljava/lang/String;

    .line 26
    const-string/jumbo v0, "msgid"

    sput-object v0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DAOXUE_ID:Ljava/lang/String;

    .line 27
    const-string/jumbo v0, "isdownload"

    sput-object v0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DAOXUE_ISDOWNLOAD:Ljava/lang/String;

    .line 28
    const-string/jumbo v0, "bookid"

    sput-object v0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DAOXUE_BOOKID:Ljava/lang/String;

    .line 29
    const-string/jumbo v0, "default1"

    sput-object v0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DAOXUE_DEFAULT1:Ljava/lang/String;

    .line 30
    const-string/jumbo v0, "default2"

    sput-object v0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DAOXUE_DEFAULT2:Ljava/lang/String;

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    const-string/jumbo v1, "/MobileStudyClient/.System/DaoXueBen/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->SQLFILEPATH:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 38
    iput-object p1, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->mcontext:Landroid/content/Context;

    .line 39
    invoke-direct {p0}, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->initDataBaseFile()V

    .line 40
    return-void
.end method

.method private declared-synchronized initDataBaseFile()V
    .locals 5

    .prologue
    .line 43
    monitor-enter p0

    :try_start_0
    new-instance v2, Ljava/io/File;

    sget-object v3, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->SQLFILEPATH:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 44
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_0

    .line 46
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 48
    :cond_0
    new-instance v0, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    sget-object v4, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->SQLFILEPATH:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Lcom/edutech/daoxueben/sysconfig/AppEnvironment;->STUDENT_ID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ".db"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 49
    .local v0, "dbFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-nez v3, :cond_1

    .line 52
    :try_start_1
    const-string/jumbo v3, "1"

    sput-object v3, Lcom/edutech/daoxueben/until/UpOrDownFile;->firstInitSql:Ljava/lang/String;

    .line 53
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    :cond_1
    :goto_0
    :try_start_2
    iget-object v3, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v3, :cond_2

    .line 61
    const/4 v3, 0x0

    invoke-static {v0, v3}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    iput-object v3, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 63
    :cond_2
    invoke-virtual {p0}, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->onCreateTable()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 64
    monitor-exit p0

    return-void

    .line 54
    :catch_0
    move-exception v1

    .line 56
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 43
    .end local v0    # "dbFile":Ljava/io/File;
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "file":Ljava/io/File;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 114
    iget-object v1, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v1

    .line 115
    :try_start_0
    iget-object v0, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 118
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 114
    :cond_0
    monitor-exit v1

    .line 122
    return-void

    .line 114
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public containColums(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Z
    .locals 12
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 204
    const/4 v9, 0x0

    .line 205
    .local v9, "boo":Z
    iget-object v11, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v11

    .line 206
    :try_start_0
    iget-object v0, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_1

    .line 208
    iget-object v0, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 209
    .local v10, "cursor":Landroid/database/Cursor;
    if-eqz v10, :cond_0

    .line 211
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v9

    .line 213
    :cond_0
    if-eqz v10, :cond_1

    .line 215
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 205
    .end local v10    # "cursor":Landroid/database/Cursor;
    :cond_1
    monitor-exit v11

    .line 219
    return v9

    .line 205
    :catchall_0
    move-exception v0

    monitor-exit v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public deleteDiscuss(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)J
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "whereClause"    # Ljava/lang/String;
    .param p3, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 179
    const-wide/16 v0, 0x0

    .line 180
    .local v0, "num":J
    iget-object v3, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v3

    .line 181
    :try_start_0
    iget-object v2, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v2, :cond_0

    .line 183
    iget-object v2, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, p1, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    int-to-long v0, v2

    .line 180
    :cond_0
    monitor-exit v3

    .line 187
    return-wide v0

    .line 180
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public insertDiscuss(Ljava/lang/String;Landroid/content/ContentValues;)J
    .locals 5
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "value"    # Landroid/content/ContentValues;

    .prologue
    .line 147
    const-wide/16 v0, 0x0

    .line 148
    .local v0, "num":J
    iget-object v3, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v3

    .line 149
    :try_start_0
    iget-object v2, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v2, :cond_1

    .line 151
    iget-object v2, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 153
    if-eqz p2, :cond_0

    .line 155
    iget-object v2, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v4, 0x0

    invoke-virtual {v2, p1, v4, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 157
    :cond_0
    iget-object v2, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 158
    iget-object v2, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 148
    :cond_1
    monitor-exit v3

    .line 162
    return-wide v0

    .line 148
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method public insertDiscuss(Ljava/lang/String;Ljava/util/List;)J
    .locals 7
    .param p1, "table"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Landroid/content/ContentValues;",
            ">;)J"
        }
    .end annotation

    .prologue
    .line 125
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    const-wide/16 v2, 0x0

    .line 126
    .local v2, "num":J
    iget-object v5, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v5

    .line 127
    :try_start_0
    iget-object v4, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v4, :cond_0

    .line 129
    iget-object v4, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 130
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    if-lt v0, v4, :cond_1

    .line 138
    iget-object v4, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 139
    iget-object v4, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 126
    .end local v0    # "i":I
    :cond_0
    monitor-exit v5

    .line 143
    return-wide v2

    .line 132
    .restart local v0    # "i":I
    :cond_1
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ContentValues;

    .line 133
    .local v1, "value":Landroid/content/ContentValues;
    if-eqz v1, :cond_2

    .line 135
    iget-object v4, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    invoke-virtual {v4, p1, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    .line 130
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 126
    .end local v0    # "i":I
    .end local v1    # "value":Landroid/content/ContentValues;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public onCreateTable()V
    .locals 3

    .prologue
    .line 101
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "CREATE TABLE IF NOT EXISTS "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    sget-object v2, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DAOXUE_TABLE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 103
    sget-object v2, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->ID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 104
    const-string/jumbo v2, " INTEGER PRIMARY KEY AUTOINCREMENT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 105
    sget-object v2, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DAOXUE_ID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 106
    sget-object v2, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DAOXUE_ISDOWNLOAD:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 107
    sget-object v2, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DAOXUE_BOOKID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 108
    sget-object v2, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DAOXUE_DEFAULT1:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 109
    sget-object v2, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->DAOXUE_DEFAULT2:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT);"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 101
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 110
    .local v0, "sqlStr":Ljava/lang/String;
    iget-object v1, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 111
    return-void
.end method

.method public queryDiscuss(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 11
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .param p4, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 192
    const/4 v9, 0x0

    .line 193
    .local v9, "cursor":Landroid/database/Cursor;
    iget-object v10, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v10

    .line 194
    :try_start_0
    iget-object v0, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    .line 196
    iget-object v0, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    move-object v7, p4

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 193
    :cond_0
    monitor-exit v10

    .line 200
    return-object v9

    .line 193
    :catchall_0
    move-exception v0

    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public tabbleIsExist(Ljava/lang/String;)Z
    .locals 7
    .param p1, "tableName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 67
    const/4 v3, 0x0

    .line 68
    .local v3, "result":Z
    if-nez p1, :cond_0

    .line 96
    :goto_0
    return v5

    .line 71
    :cond_0
    const/4 v1, 0x0

    .line 75
    .local v1, "cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "select count(*) as c from sqlite_master  where type =\'table\' and name =\'"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\' "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 75
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 77
    .local v4, "sql":Ljava/lang/String;
    iget-object v5, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    invoke-virtual {v5, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 78
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 79
    const/4 v5, 0x0

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 80
    .local v0, "count":I
    if-lez v0, :cond_1

    .line 81
    const/4 v3, 0x1

    .line 91
    .end local v0    # "count":I
    :cond_1
    if-eqz v1, :cond_2

    .line 92
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .end local v4    # "sql":Ljava/lang/String;
    :cond_2
    :goto_1
    move v5, v3

    .line 96
    goto :goto_0

    .line 85
    :catch_0
    move-exception v2

    .line 87
    .local v2, "e":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v5, "tabbleIsExist"

    const-string/jumbo v6, "\u64cd\u4f5c\u5931\u8d25"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 91
    if-eqz v1, :cond_2

    .line 92
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 88
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    .line 91
    if-eqz v1, :cond_3

    .line 92
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 95
    :cond_3
    throw v5
.end method

.method public updateDiscuss(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)J
    .locals 4
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "whereClause"    # Ljava/lang/String;
    .param p4, "whereArgs"    # [Ljava/lang/String;

    .prologue
    .line 166
    const-wide/16 v0, 0x0

    .line 167
    .local v0, "num":J
    iget-object v3, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v3

    .line 168
    :try_start_0
    iget-object v2, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v2, :cond_0

    .line 170
    iget-object v2, p0, Lcom/edutech/daoxueben/until/SqliteForDaoxue;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    int-to-long v0, v2

    .line 167
    :cond_0
    monitor-exit v3

    .line 174
    return-wide v0

    .line 167
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
