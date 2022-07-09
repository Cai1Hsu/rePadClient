.class public Lcom/mongodb/MongoException$Network;
.super Lcom/mongodb/MongoSocketException;
.source "MongoException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/MongoException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Network"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x7413f5892ef67ae7L


# direct methods
.method public constructor <init>(Ljava/io/IOException;)V
    .locals 0
    .param p1, "ioe"    # Ljava/io/IOException;

    .prologue
    .line 110
    invoke-direct {p0, p1}, Lcom/mongodb/MongoSocketException;-><init>(Ljava/io/IOException;)V

    .line 111
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/IOException;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "ioe"    # Ljava/io/IOException;

    .prologue
    .line 103
    invoke-direct {p0, p1, p2}, Lcom/mongodb/MongoSocketException;-><init>(Ljava/lang/String;Ljava/io/IOException;)V

    .line 104
    return-void
.end method
