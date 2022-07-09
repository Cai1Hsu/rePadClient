.class public Lcom/mongodb/DuplicateKeyException;
.super Lcom/mongodb/WriteConcernException;
.source "DuplicateKeyException.java"


# static fields
.field private static final serialVersionUID:J = -0x3d463948dc511dfeL


# direct methods
.method constructor <init>(ILcom/mongodb/CommandResult;)V
    .locals 0
    .param p1, "code"    # I
    .param p2, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 38
    invoke-direct {p0, p1, p2}, Lcom/mongodb/WriteConcernException;-><init>(ILcom/mongodb/CommandResult;)V

    .line 39
    return-void
.end method

.method constructor <init>(Lcom/mongodb/CommandResult;)V
    .locals 0
    .param p1, "commandResult"    # Lcom/mongodb/CommandResult;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lcom/mongodb/WriteConcernException;-><init>(Lcom/mongodb/CommandResult;)V

    .line 35
    return-void
.end method
