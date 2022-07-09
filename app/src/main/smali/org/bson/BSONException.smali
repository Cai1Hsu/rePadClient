.class public Lorg/bson/BSONException;
.super Ljava/lang/RuntimeException;
.source "BSONException.java"


# static fields
.field private static final serialVersionUID:J = -0x3d463948dc511dfeL


# instance fields
.field private _errorCode:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "errorCode"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-direct {p0, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/bson/BSONException;->_errorCode:Ljava/lang/Integer;

    .line 39
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/bson/BSONException;->_errorCode:Ljava/lang/Integer;

    .line 40
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "errorCode"    # I
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 56
    invoke-direct {p0, p2, p3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/bson/BSONException;->_errorCode:Ljava/lang/Integer;

    .line 57
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/bson/BSONException;->_errorCode:Ljava/lang/Integer;

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/bson/BSONException;->_errorCode:Ljava/lang/Integer;

    .line 31
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 47
    invoke-direct {p0, p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/bson/BSONException;->_errorCode:Ljava/lang/Integer;

    .line 48
    return-void
.end method


# virtual methods
.method public getErrorCode()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lorg/bson/BSONException;->_errorCode:Ljava/lang/Integer;

    return-object v0
.end method

.method public hasErrorCode()Z
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/bson/BSONException;->_errorCode:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
