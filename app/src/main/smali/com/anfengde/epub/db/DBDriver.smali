.class public Lcom/anfengde/epub/db/DBDriver;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DBDriver.java"


# static fields
.field private static final DATABASE_NAME:Ljava/lang/String; = "afd.sqlite"

.field private static final DATABASE_VERSION:I = 0x1

.field private static final KEY_AUTHOR:Ljava/lang/String; = "author"

.field private static final KEY_BOOKPATH:Ljava/lang/String; = "bookPath"

.field private static final KEY_COVERIMAGE:Ljava/lang/String; = "coverimage"

.field private static final KEY_ID:Ljava/lang/String; = "identifier"

.field private static final KEY_NAME:Ljava/lang/String; = "name"

.field private static final TABLE_CONTACTS:Ljava/lang/String; = "books"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    const-string/jumbo v0, "afd.sqlite"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 33
    return-void
.end method


# virtual methods
.method public addBook(Lcom/anfengde/epub/db/DBBooks;)V
    .locals 4
    .param p1, "book"    # Lcom/anfengde/epub/db/DBBooks;

    .prologue
    .line 52
    invoke-virtual {p0}, Lcom/anfengde/epub/db/DBDriver;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 54
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 55
    .local v1, "values":Landroid/content/ContentValues;
    const-string/jumbo v2, "identifier"

    invoke-virtual {p1}, Lcom/anfengde/epub/db/DBBooks;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/anfengde/epub/db/DBDriver;->sqliteEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    const-string/jumbo v2, "name"

    invoke-virtual {p1}, Lcom/anfengde/epub/db/DBBooks;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/anfengde/epub/db/DBDriver;->sqliteEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    const-string/jumbo v2, "author"

    invoke-virtual {p1}, Lcom/anfengde/epub/db/DBBooks;->getAuthor()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/anfengde/epub/db/DBDriver;->sqliteEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    const-string/jumbo v2, "coverimage"

    invoke-virtual {p1}, Lcom/anfengde/epub/db/DBBooks;->getCoverimage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/anfengde/epub/db/DBDriver;->sqliteEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    const-string/jumbo v2, "bookPath"

    invoke-virtual {p1}, Lcom/anfengde/epub/db/DBBooks;->getBookpath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/anfengde/epub/db/DBDriver;->sqliteEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    const-string/jumbo v2, "books"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 63
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 64
    return-void
.end method

.method public deleteAllBook()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 103
    invoke-virtual {p0}, Lcom/anfengde/epub/db/DBDriver;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 104
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string/jumbo v1, "books"

    invoke-virtual {v0, v1, v2, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 105
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 106
    return-void
.end method

.method public deleteBook(Lcom/anfengde/epub/db/DBBooks;)V
    .locals 6
    .param p1, "book"    # Lcom/anfengde/epub/db/DBBooks;

    .prologue
    .line 96
    invoke-virtual {p0}, Lcom/anfengde/epub/db/DBDriver;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 97
    .local v0, "db":Landroid/database/sqlite/SQLiteDatabase;
    const-string/jumbo v1, "books"

    const-string/jumbo v2, "identifier = ?"

    .line 98
    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {p1}, Lcom/anfengde/epub/db/DBBooks;->getIdentifier()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 97
    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 99
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 100
    return-void
.end method

.method public getAllBooks()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/anfengde/epub/db/DBBooks;",
            ">;"
        }
    .end annotation

    .prologue
    .line 67
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .local v1, "bookList":Ljava/util/List;, "Ljava/util/List<Lcom/anfengde/epub/db/DBBooks;>;"
    const-string/jumbo v4, "SELECT  * FROM books"

    .line 71
    .local v4, "selectQuery":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/anfengde/epub/db/DBDriver;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 72
    .local v3, "db":Landroid/database/sqlite/SQLiteDatabase;
    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    .line 75
    .local v2, "cursor":Landroid/database/Cursor;
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 77
    :cond_0
    new-instance v0, Lcom/anfengde/epub/db/DBBooks;

    invoke-direct {v0}, Lcom/anfengde/epub/db/DBBooks;-><init>()V

    .line 78
    .local v0, "book":Lcom/anfengde/epub/db/DBBooks;
    const/4 v5, 0x0

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/anfengde/epub/db/DBBooks;->setIdentifier(Ljava/lang/String;)V

    .line 79
    const/4 v5, 0x1

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/anfengde/epub/db/DBBooks;->setName(Ljava/lang/String;)V

    .line 80
    const/4 v5, 0x2

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/anfengde/epub/db/DBBooks;->setAuthor(Ljava/lang/String;)V

    .line 81
    const/4 v5, 0x3

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/anfengde/epub/db/DBBooks;->setCoverimage(Ljava/lang/String;)V

    .line 82
    const/4 v5, 0x4

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/anfengde/epub/db/DBBooks;->setBookpath(Ljava/lang/String;)V

    .line 84
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-nez v5, :cond_0

    .line 88
    .end local v0    # "book":Lcom/anfengde/epub/db/DBBooks;
    :cond_1
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 89
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 91
    return-object v1
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 37
    const-string/jumbo v0, "CREATE TABLE IF NOT EXISTS books  (identifier VARCHAR PRIMARY KEY  NOT NULL  UNIQUE , name VARCHAR NOT NULL , author VARCHAR, coverimage VARCHAR, bookpath VARCHAR NOT NULL )"

    .line 38
    .local v0, "CREATE_BOOKS_TABLE":Ljava/lang/String;
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 39
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    .line 44
    const-string/jumbo v0, "DROP TABLE IF EXISTS books"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 47
    invoke-virtual {p0, p1}, Lcom/anfengde/epub/db/DBDriver;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 49
    return-void
.end method

.method public sqliteEscape(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 109
    const-string/jumbo v0, "\'"

    const-string/jumbo v1, "\'\'"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 110
    return-object p1
.end method
