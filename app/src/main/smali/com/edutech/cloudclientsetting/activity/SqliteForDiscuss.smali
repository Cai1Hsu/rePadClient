.class public Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;
.super Ljava/lang/Object;
.source "SqliteForDiscuss.java"


# static fields
.field public static DANAME:Ljava/lang/String;

.field public static DETAILS_TABLE:Ljava/lang/String;

.field public static DISCUSS_AUTHOR:Ljava/lang/String;

.field public static DISCUSS_CONTENT:Ljava/lang/String;

.field public static DISCUSS_CTIME:Ljava/lang/String;

.field public static DISCUSS_DEFAULT:Ljava/lang/String;

.field public static DISCUSS_GOOD:Ljava/lang/String;

.field public static DISCUSS_ID:Ljava/lang/String;

.field public static DISCUSS_ISGOOD:Ljava/lang/String;

.field public static DISCUSS_ITEMS:Ljava/lang/String;

.field public static DISCUSS_MSGID:Ljava/lang/String;

.field public static DISCUSS_READ:Ljava/lang/String;

.field public static DISCUSS_REPLY:Ljava/lang/String;

.field public static DISCUSS_SUBJECT:Ljava/lang/String;

.field public static DISCUSS_SUBJID:Ljava/lang/String;

.field public static DISCUSS_SUBNAME:Ljava/lang/String;

.field public static DISCUSS_TABLE:Ljava/lang/String;

.field public static final SQLFILEPATH:Ljava/lang/String;

.field public static VERSION:I


# instance fields
.field public db:Landroid/database/sqlite/SQLiteDatabase;

.field private mcontext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 20
    const-string/jumbo v0, "discussdb"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DANAME:Ljava/lang/String;

    .line 21
    const/4 v0, 0x1

    sput v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->VERSION:I

    .line 22
    const-string/jumbo v0, "discuss"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_TABLE:Ljava/lang/String;

    .line 23
    const-string/jumbo v0, "details"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DETAILS_TABLE:Ljava/lang/String;

    .line 24
    const-string/jumbo v0, "id"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_ID:Ljava/lang/String;

    .line 25
    const-string/jumbo v0, "msgid"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_MSGID:Ljava/lang/String;

    .line 26
    const-string/jumbo v0, "subject"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_SUBJECT:Ljava/lang/String;

    .line 27
    const-string/jumbo v0, "content"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_CONTENT:Ljava/lang/String;

    .line 28
    const-string/jumbo v0, "ctime"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_CTIME:Ljava/lang/String;

    .line 29
    const-string/jumbo v0, "subjectid"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_SUBJID:Ljava/lang/String;

    .line 30
    const-string/jumbo v0, "subjectname"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_SUBNAME:Ljava/lang/String;

    .line 31
    const-string/jumbo v0, "read"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_READ:Ljava/lang/String;

    .line 32
    const-string/jumbo v0, "author"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_AUTHOR:Ljava/lang/String;

    .line 33
    const-string/jumbo v0, "reply"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_REPLY:Ljava/lang/String;

    .line 34
    const-string/jumbo v0, "good"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_GOOD:Ljava/lang/String;

    .line 35
    const-string/jumbo v0, "isgood"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_ISGOOD:Ljava/lang/String;

    .line 36
    const-string/jumbo v0, "lastone"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_DEFAULT:Ljava/lang/String;

    .line 37
    const-string/jumbo v0, "items"

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_ITEMS:Ljava/lang/String;

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    const-string/jumbo v1, "/MobileStudyClient/.System/hudong/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->SQLFILEPATH:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 45
    iput-object p1, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->mcontext:Landroid/content/Context;

    .line 46
    invoke-direct {p0}, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->initDataBaseFile()V

    .line 47
    return-void
.end method

.method private declared-synchronized initDataBaseFile()V
    .locals 8

    .prologue
    .line 50
    monitor-enter p0

    :try_start_0
    new-instance v2, Ljava/io/File;

    sget-object v5, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->SQLFILEPATH:Ljava/lang/String;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 51
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-nez v5, :cond_0

    .line 53
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    .line 55
    :cond_0
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->mcontext:Landroid/content/Context;

    const-string/jumbo v6, "privatekey"

    .line 56
    const/4 v7, 0x0

    .line 55
    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 57
    .local v3, "sharePre":Landroid/content/SharedPreferences;
    const-string/jumbo v5, "name"

    const-string/jumbo v6, ""

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 58
    .local v4, "username":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    sget-object v6, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->SQLFILEPATH:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, ".db"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 59
    .local v0, "dbFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-nez v5, :cond_1

    .line 62
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    :cond_1
    :goto_0
    :try_start_2
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v5, :cond_2

    .line 70
    const/4 v5, 0x0

    invoke-static {v0, v5}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    iput-object v5, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 72
    :cond_2
    invoke-virtual {p0}, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->onCreateTable()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 73
    monitor-exit p0

    return-void

    .line 63
    :catch_0
    move-exception v1

    .line 65
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 50
    .end local v0    # "dbFile":Ljava/io/File;
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "sharePre":Landroid/content/SharedPreferences;
    .end local v4    # "username":Ljava/lang/String;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 140
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v1

    .line 141
    :try_start_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 144
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    .line 140
    :cond_0
    monitor-exit v1

    .line 148
    return-void

    .line 140
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
    .line 212
    const/4 v9, 0x0

    .line 213
    .local v9, "boo":Z
    iget-object v11, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v11

    .line 214
    :try_start_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_1

    .line 216
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

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

    .line 217
    .local v10, "cursor":Landroid/database/Cursor;
    if-eqz v10, :cond_0

    .line 219
    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v9

    .line 221
    :cond_0
    if-eqz v10, :cond_1

    .line 223
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 213
    .end local v10    # "cursor":Landroid/database/Cursor;
    :cond_1
    monitor-exit v11

    .line 227
    return v9

    .line 213
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
    .line 187
    const-wide/16 v0, 0x0

    .line 188
    .local v0, "num":J
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v3

    .line 189
    :try_start_0
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v2, :cond_0

    .line 191
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, p1, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    int-to-long v0, v2

    .line 188
    :cond_0
    monitor-exit v3

    .line 195
    return-wide v0

    .line 188
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
    .line 151
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Landroid/content/ContentValues;>;"
    const-wide/16 v2, 0x0

    .line 152
    .local v2, "num":J
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v5

    .line 153
    :try_start_0
    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v4, :cond_0

    .line 155
    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 156
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v4

    if-lt v0, v4, :cond_1

    .line 164
    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 165
    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 152
    .end local v0    # "i":I
    :cond_0
    monitor-exit v5

    .line 169
    return-wide v2

    .line 158
    .restart local v0    # "i":I
    :cond_1
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ContentValues;

    .line 159
    .local v1, "value":Landroid/content/ContentValues;
    if-eqz v1, :cond_2

    .line 161
    iget-object v4, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    invoke-virtual {v4, p1, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    .line 156
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 152
    .end local v0    # "i":I
    .end local v1    # "value":Landroid/content/ContentValues;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4
.end method

.method public onCreateDetailsTable()V
    .locals 3

    .prologue
    .line 130
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "CREATE TABLE IF NOT EXISTS "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DETAILS_TABLE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 132
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_ID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 133
    const-string/jumbo v2, " INTEGER PRIMARY KEY AUTOINCREMENT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 134
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_MSGID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 135
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_ITEMS:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT);"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 130
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "sqlStr":Ljava/lang/String;
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method public onCreateTable()V
    .locals 3

    .prologue
    .line 110
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "CREATE TABLE IF NOT EXISTS "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 111
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_TABLE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 112
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_ID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 113
    const-string/jumbo v2, " INTEGER PRIMARY KEY AUTOINCREMENT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 114
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_MSGID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 115
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_SUBJECT:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 116
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_CONTENT:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 117
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_CTIME:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 118
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_SUBJID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 119
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_SUBNAME:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 120
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_READ:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " INTEGER,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 121
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_AUTHOR:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 122
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_REPLY:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " INTEGER,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 123
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_GOOD:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " INTEGER,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 124
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_ISGOOD:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT,"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 125
    sget-object v2, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->DISCUSS_DEFAULT:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " TEXT);"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 110
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "sqlStr":Ljava/lang/String;
    iget-object v1, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 127
    return-void
.end method

.method public queryDiscuss(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 11
    .param p1, "table"    # Ljava/lang/String;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;
    .param p4, "orderBy"    # Ljava/lang/String;

    .prologue
    .line 200
    const/4 v9, 0x0

    .line 201
    .local v9, "cursor":Landroid/database/Cursor;
    iget-object v10, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v10

    .line 202
    :try_start_0
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

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

    .line 201
    :cond_0
    monitor-exit v10

    .line 208
    return-object v9

    .line 201
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

    .line 76
    const/4 v3, 0x0

    .line 77
    .local v3, "result":Z
    if-nez p1, :cond_0

    .line 105
    :goto_0
    return v5

    .line 80
    :cond_0
    const/4 v1, 0x0

    .line 84
    .local v1, "cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "select count(*) as c from sqlite_master  where type =\'table\' and name =\'"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "\' "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 84
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 86
    .local v4, "sql":Ljava/lang/String;
    iget-object v5, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v6, 0x0

    invoke-virtual {v5, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    .line 87
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 88
    const/4 v5, 0x0

    invoke-interface {v1, v5}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 89
    .local v0, "count":I
    if-lez v0, :cond_1

    .line 90
    const/4 v3, 0x1

    .line 100
    .end local v0    # "count":I
    :cond_1
    if-eqz v1, :cond_2

    .line 101
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .end local v4    # "sql":Ljava/lang/String;
    :cond_2
    :goto_1
    move v5, v3

    .line 105
    goto :goto_0

    .line 94
    :catch_0
    move-exception v2

    .line 96
    .local v2, "e":Ljava/lang/Exception;
    :try_start_1
    const-string/jumbo v5, "tabbleIsExist"

    const-string/jumbo v6, "\u64cd\u4f5c\u5931\u8d25"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 100
    if-eqz v1, :cond_2

    .line 101
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_1

    .line 97
    .end local v2    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    .line 100
    if-eqz v1, :cond_3

    .line 101
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 104
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
    .line 174
    const-wide/16 v0, 0x0

    .line 175
    .local v0, "num":J
    iget-object v3, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    monitor-enter v3

    .line 176
    :try_start_0
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v2, :cond_0

    .line 178
    iget-object v2, p0, Lcom/edutech/cloudclientsetting/activity/SqliteForDiscuss;->db:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v2, p1, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    int-to-long v0, v2

    .line 175
    :cond_0
    monitor-exit v3

    .line 182
    return-wide v0

    .line 175
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method
