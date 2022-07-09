.class public Lcom/mongodb/MongoClientException;
.super Lcom/mongodb/MongoInternalException;
.source "MongoClientException.java"


# static fields
.field private static final serialVersionUID:J = -0x47283c843dde6bb2L


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct {p0, p1}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;)V

    .line 33
    return-void
.end method
