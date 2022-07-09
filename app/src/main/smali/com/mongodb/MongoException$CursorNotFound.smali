.class public Lcom/mongodb/MongoException$CursorNotFound;
.super Lcom/mongodb/MongoCursorNotFoundException;
.source "MongoException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/MongoException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CursorNotFound"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x342cc417e3aa748aL


# direct methods
.method public constructor <init>(JLcom/mongodb/ServerAddress;)V
    .locals 1
    .param p1, "cursorId"    # J
    .param p3, "serverAddress"    # Lcom/mongodb/ServerAddress;

    .prologue
    .line 150
    invoke-direct {p0, p1, p2, p3}, Lcom/mongodb/MongoCursorNotFoundException;-><init>(JLcom/mongodb/ServerAddress;)V

    .line 151
    return-void
.end method
