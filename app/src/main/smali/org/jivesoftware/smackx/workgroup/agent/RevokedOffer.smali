.class public Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;
.super Ljava/lang/Object;
.source "RevokedOffer.java"


# instance fields
.field private reason:Ljava/lang/String;

.field private sessionID:Ljava/lang/String;

.field private timestamp:Ljava/util/Date;

.field private userID:Ljava/lang/String;

.field private userJID:Ljava/lang/String;

.field private workgroupName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V
    .locals 0
    .param p1, "userJID"    # Ljava/lang/String;
    .param p2, "userID"    # Ljava/lang/String;
    .param p3, "workgroupName"    # Ljava/lang/String;
    .param p4, "sessionID"    # Ljava/lang/String;
    .param p5, "reason"    # Ljava/lang/String;
    .param p6, "timestamp"    # Ljava/util/Date;

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;->userJID:Ljava/lang/String;

    .line 53
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;->userID:Ljava/lang/String;

    .line 54
    iput-object p3, p0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;->workgroupName:Ljava/lang/String;

    .line 55
    iput-object p4, p0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;->sessionID:Ljava/lang/String;

    .line 56
    iput-object p5, p0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;->reason:Ljava/lang/String;

    .line 57
    iput-object p6, p0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;->timestamp:Ljava/util/Date;

    .line 58
    return-void
.end method


# virtual methods
.method public getReason()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;->reason:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;->sessionID:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestamp()Ljava/util/Date;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;->timestamp:Ljava/util/Date;

    return-object v0
.end method

.method public getUserID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;->userID:Ljava/lang/String;

    return-object v0
.end method

.method public getUserJID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;->userJID:Ljava/lang/String;

    return-object v0
.end method

.method public getWorkgroupName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/RevokedOffer;->workgroupName:Ljava/lang/String;

    return-object v0
.end method
