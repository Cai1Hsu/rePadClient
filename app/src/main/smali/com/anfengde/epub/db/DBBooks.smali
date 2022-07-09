.class public Lcom/anfengde/epub/db/DBBooks;
.super Ljava/lang/Object;
.source "DBBooks.java"


# instance fields
.field private _author:Ljava/lang/String;

.field private _bookpath:Ljava/lang/String;

.field private _coverimage:Ljava/lang/String;

.field private _identifier:Ljava/lang/String;

.field private _name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "identifier"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "author"    # Ljava/lang/String;
    .param p4, "coverimage"    # Ljava/lang/String;
    .param p5, "bookpath"    # Ljava/lang/String;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    invoke-virtual {p0, p1}, Lcom/anfengde/epub/db/DBBooks;->setIdentifier(Ljava/lang/String;)V

    .line 19
    invoke-virtual {p0, p2}, Lcom/anfengde/epub/db/DBBooks;->setName(Ljava/lang/String;)V

    .line 20
    invoke-virtual {p0, p3}, Lcom/anfengde/epub/db/DBBooks;->setAuthor(Ljava/lang/String;)V

    .line 21
    invoke-virtual {p0, p4}, Lcom/anfengde/epub/db/DBBooks;->setCoverimage(Ljava/lang/String;)V

    .line 22
    invoke-virtual {p0, p5}, Lcom/anfengde/epub/db/DBBooks;->setBookpath(Ljava/lang/String;)V

    .line 23
    return-void
.end method


# virtual methods
.method public getAuthor()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/anfengde/epub/db/DBBooks;->_author:Ljava/lang/String;

    return-object v0
.end method

.method public getBookpath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lcom/anfengde/epub/db/DBBooks;->_bookpath:Ljava/lang/String;

    return-object v0
.end method

.method public getCoverimage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/anfengde/epub/db/DBBooks;->_coverimage:Ljava/lang/String;

    return-object v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/anfengde/epub/db/DBBooks;->_identifier:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/anfengde/epub/db/DBBooks;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public setAuthor(Ljava/lang/String;)V
    .locals 0
    .param p1, "author"    # Ljava/lang/String;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/anfengde/epub/db/DBBooks;->_author:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public setBookpath(Ljava/lang/String;)V
    .locals 0
    .param p1, "bookpath"    # Ljava/lang/String;

    .prologue
    .line 62
    iput-object p1, p0, Lcom/anfengde/epub/db/DBBooks;->_bookpath:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public setCoverimage(Ljava/lang/String;)V
    .locals 0
    .param p1, "coverimage"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lcom/anfengde/epub/db/DBBooks;->_coverimage:Ljava/lang/String;

    .line 55
    return-void
.end method

.method public setIdentifier(Ljava/lang/String;)V
    .locals 0
    .param p1, "identifier"    # Ljava/lang/String;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/anfengde/epub/db/DBBooks;->_identifier:Ljava/lang/String;

    .line 31
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/anfengde/epub/db/DBBooks;->_name:Ljava/lang/String;

    .line 39
    return-void
.end method
