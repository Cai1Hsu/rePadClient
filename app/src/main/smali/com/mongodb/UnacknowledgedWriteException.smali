.class public Lcom/mongodb/UnacknowledgedWriteException;
.super Lcom/mongodb/MongoClientException;
.source "UnacknowledgedWriteException.java"


# static fields
.field private static final serialVersionUID:J = 0x60c9cedb2b66640dL


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/mongodb/MongoClientException;-><init>(Ljava/lang/String;)V

    .line 38
    return-void
.end method
