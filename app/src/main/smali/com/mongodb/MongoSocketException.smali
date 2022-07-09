.class public Lcom/mongodb/MongoSocketException;
.super Lcom/mongodb/MongoException;
.source "MongoSocketException.java"


# static fields
.field private static final serialVersionUID:J = -0x3d463948dc511dfeL


# direct methods
.method constructor <init>(Ljava/io/IOException;)V
    .locals 1
    .param p1, "ioe"    # Ljava/io/IOException;

    .prologue
    .line 42
    invoke-virtual {p1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 43
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/io/IOException;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "ioe"    # Ljava/io/IOException;

    .prologue
    .line 35
    const/4 v0, -0x2

    invoke-direct {p0, v0, p1, p2}, Lcom/mongodb/MongoException;-><init>(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 36
    return-void
.end method
