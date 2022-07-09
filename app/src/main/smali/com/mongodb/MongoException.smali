.class public Lcom/mongodb/MongoException;
.super Ljava/lang/RuntimeException;
.source "MongoException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/MongoException$CursorNotFound;,
        Lcom/mongodb/MongoException$DuplicateKey;,
        Lcom/mongodb/MongoException$Network;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3d463948dc511dfeL


# instance fields
.field final _code:I


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 47
    invoke-direct {p0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 48
    iput p1, p0, Lcom/mongodb/MongoException;->_code:I

    .line 49
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "code"    # I
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 68
    invoke-direct {p0, p2, p3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 69
    iput p1, p0, Lcom/mongodb/MongoException;->_code:I

    .line 70
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 38
    const/4 v0, -0x3

    iput v0, p0, Lcom/mongodb/MongoException;->_code:I

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 57
    invoke-direct {p0, p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 58
    const/4 v0, -0x4

    iput v0, p0, Lcom/mongodb/MongoException;->_code:I

    .line 59
    return-void
.end method

.method public constructor <init>(Lorg/bson/BSONObject;)V
    .locals 2
    .param p1, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 77
    invoke-static {p1}, Lcom/mongodb/ServerError;->getCode(Lorg/bson/BSONObject;)I

    move-result v0

    const-string/jumbo v1, "UNKNOWN"

    invoke-static {p1, v1}, Lcom/mongodb/ServerError;->getMsg(Lorg/bson/BSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/mongodb/MongoException;-><init>(ILjava/lang/String;)V

    .line 78
    return-void
.end method

.method static parse(Lorg/bson/BSONObject;)Lcom/mongodb/MongoException;
    .locals 3
    .param p0, "o"    # Lorg/bson/BSONObject;

    .prologue
    const/4 v1, 0x0

    .line 81
    invoke-static {p0, v1}, Lcom/mongodb/ServerError;->getMsg(Lorg/bson/BSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 84
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lcom/mongodb/MongoException;

    invoke-static {p0}, Lcom/mongodb/ServerError;->getCode(Lorg/bson/BSONObject;)I

    move-result v2

    invoke-direct {v1, v2, v0}, Lcom/mongodb/MongoException;-><init>(ILjava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public getCode()I
    .locals 1

    .prologue
    .line 159
    iget v0, p0, Lcom/mongodb/MongoException;->_code:I

    return v0
.end method
