.class public Lcom/mongodb/MongoExecutionTimeoutException;
.super Lcom/mongodb/MongoException;
.source "MongoExecutionTimeoutException.java"


# static fields
.field private static final serialVersionUID:J = 0x52a6c9837be096a2L


# direct methods
.method constructor <init>(ILjava/lang/String;)V
    .locals 0
    .param p1, "code"    # I
    .param p2, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lcom/mongodb/MongoException;-><init>(ILjava/lang/String;)V

    .line 29
    return-void
.end method
