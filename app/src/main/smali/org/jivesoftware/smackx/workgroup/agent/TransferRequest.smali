.class public Lorg/jivesoftware/smackx/workgroup/agent/TransferRequest;
.super Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;
.source "TransferRequest.java"


# instance fields
.field private inviter:Ljava/lang/String;

.field private reason:Ljava/lang/String;

.field private room:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "inviter"    # Ljava/lang/String;
    .param p2, "room"    # Ljava/lang/String;
    .param p3, "reason"    # Ljava/lang/String;

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;-><init>()V

    .line 34
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/TransferRequest;->inviter:Ljava/lang/String;

    .line 35
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/agent/TransferRequest;->room:Ljava/lang/String;

    .line 36
    iput-object p3, p0, Lorg/jivesoftware/smackx/workgroup/agent/TransferRequest;->reason:Ljava/lang/String;

    .line 37
    return-void
.end method


# virtual methods
.method public getInviter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/TransferRequest;->inviter:Ljava/lang/String;

    return-object v0
.end method

.method public getReason()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/TransferRequest;->reason:Ljava/lang/String;

    return-object v0
.end method

.method public getRoom()Ljava/lang/String;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/TransferRequest;->room:Ljava/lang/String;

    return-object v0
.end method

.method isInvitation()Z
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x0

    return v0
.end method

.method isTransfer()Z
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x1

    return v0
.end method

.method isUserRequest()Z
    .locals 1

    .prologue
    .line 52
    const/4 v0, 0x0

    return v0
.end method
