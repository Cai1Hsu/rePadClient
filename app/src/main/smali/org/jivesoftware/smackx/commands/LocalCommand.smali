.class public abstract Lorg/jivesoftware/smackx/commands/LocalCommand;
.super Lorg/jivesoftware/smackx/commands/AdHocCommand;
.source "LocalCommand.java"


# instance fields
.field private creationDate:J

.field private currenStage:I

.field private ownerJID:Ljava/lang/String;

.field private sessionID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/jivesoftware/smackx/commands/AdHocCommand;-><init>()V

    .line 67
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->creationDate:J

    .line 68
    const/4 v0, -0x1

    iput v0, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->currenStage:I

    .line 69
    return-void
.end method


# virtual methods
.method decrementStage()V
    .locals 1

    .prologue
    .line 167
    iget v0, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->currenStage:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->currenStage:I

    .line 168
    return-void
.end method

.method public getCreationDate()J
    .locals 2

    .prologue
    .line 112
    iget-wide v0, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->creationDate:J

    return-wide v0
.end method

.method public getCurrentStage()I
    .locals 1

    .prologue
    .line 143
    iget v0, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->currenStage:I

    return v0
.end method

.method public getOwnerJID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->ownerJID:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->sessionID:Ljava/lang/String;

    return-object v0
.end method

.method public abstract hasPermission(Ljava/lang/String;)Z
.end method

.method incrementStage()V
    .locals 1

    .prologue
    .line 158
    iget v0, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->currenStage:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->currenStage:I

    .line 159
    return-void
.end method

.method public abstract isLastStage()Z
.end method

.method setData(Lorg/jivesoftware/smackx/packet/AdHocCommandData;)V
    .locals 1
    .param p1, "data"    # Lorg/jivesoftware/smackx/packet/AdHocCommandData;

    .prologue
    .line 148
    iget-object v0, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->sessionID:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setSessionID(Ljava/lang/String;)V

    .line 149
    invoke-super {p0, p1}, Lorg/jivesoftware/smackx/commands/AdHocCommand;->setData(Lorg/jivesoftware/smackx/packet/AdHocCommandData;)V

    .line 150
    return-void
.end method

.method public setOwnerJID(Ljava/lang/String;)V
    .locals 0
    .param p1, "ownerJID"    # Ljava/lang/String;

    .prologue
    .line 98
    iput-object p1, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->ownerJID:Ljava/lang/String;

    .line 99
    return-void
.end method

.method public setSessionID(Ljava/lang/String;)V
    .locals 1
    .param p1, "sessionID"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lorg/jivesoftware/smackx/commands/LocalCommand;->sessionID:Ljava/lang/String;

    .line 79
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/commands/LocalCommand;->getData()Lorg/jivesoftware/smackx/packet/AdHocCommandData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/packet/AdHocCommandData;->setSessionID(Ljava/lang/String;)V

    .line 80
    return-void
.end method
