.class public Lcom/mongodb/MongoException$DuplicateKey;
.super Lcom/mongodb/DuplicateKeyException;
.source "MongoException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/MongoException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DuplicateKey"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x5b018fee2ea9812eL


# direct methods
.method constructor <init>(ILcom/mongodb/CommandResult;)V
    .locals 0
    .param p1, "code"    # I
    .param p2, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 130
    invoke-direct {p0, p1, p2}, Lcom/mongodb/DuplicateKeyException;-><init>(ILcom/mongodb/CommandResult;)V

    .line 131
    return-void
.end method

.method public constructor <init>(Lcom/mongodb/CommandResult;)V
    .locals 0
    .param p1, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 126
    invoke-direct {p0, p1}, Lcom/mongodb/DuplicateKeyException;-><init>(Lcom/mongodb/CommandResult;)V

    .line 127
    return-void
.end method
