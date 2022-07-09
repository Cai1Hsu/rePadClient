.class public Lorg/jivesoftware/smackx/workgroup/QueueUser;
.super Ljava/lang/Object;
.source "QueueUser.java"


# instance fields
.field private estimatedTime:I

.field private joinDate:Ljava/util/Date;

.field private queuePosition:I

.field private userID:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;IILjava/util/Date;)V
    .locals 0
    .param p1, "uid"    # Ljava/lang/String;
    .param p2, "position"    # I
    .param p3, "time"    # I
    .param p4, "joinedAt"    # Ljava/util/Date;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/QueueUser;->userID:Ljava/lang/String;

    .line 49
    iput p2, p0, Lorg/jivesoftware/smackx/workgroup/QueueUser;->queuePosition:I

    .line 50
    iput p3, p0, Lorg/jivesoftware/smackx/workgroup/QueueUser;->estimatedTime:I

    .line 51
    iput-object p4, p0, Lorg/jivesoftware/smackx/workgroup/QueueUser;->joinDate:Ljava/util/Date;

    .line 52
    return-void
.end method


# virtual methods
.method public getEstimatedRemainingTime()I
    .locals 1

    .prologue
    .line 74
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/QueueUser;->estimatedTime:I

    return v0
.end method

.method public getQueueJoinTimestamp()Ljava/util/Date;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/QueueUser;->joinDate:Ljava/util/Date;

    return-object v0
.end method

.method public getQueuePosition()I
    .locals 1

    .prologue
    .line 66
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/QueueUser;->queuePosition:I

    return v0
.end method

.method public getUserID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/QueueUser;->userID:Ljava/lang/String;

    return-object v0
.end method
