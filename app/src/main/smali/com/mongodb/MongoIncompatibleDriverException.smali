.class public Lcom/mongodb/MongoIncompatibleDriverException;
.super Lcom/mongodb/MongoException;
.source "MongoIncompatibleDriverException.java"


# static fields
.field private static final serialVersionUID:J = -0x4859a6b85bcfdba2L


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    .line 30
    return-void
.end method
