.class public Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;
.super Ljava/lang/Object;
.source "QueueOverview.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview$Provider;
    }
.end annotation


# static fields
.field private static final DATE_FORMAT:Ljava/lang/String; = "yyyyMMdd\'T\'HH:mm:ss"

.field public static ELEMENT_NAME:Ljava/lang/String;

.field public static NAMESPACE:Ljava/lang/String;


# instance fields
.field private averageWaitTime:I

.field private dateFormat:Ljava/text/SimpleDateFormat;

.field private oldestEntry:Ljava/util/Date;

.field private status:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

.field private userCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    const-string/jumbo v0, "notify-queue"

    sput-object v0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->ELEMENT_NAME:Ljava/lang/String;

    .line 40
    const-string/jumbo v0, "http://jabber.org/protocol/workgroup"

    sput-object v0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->NAMESPACE:Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, -0x1

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyyMMdd\'T\'HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->dateFormat:Ljava/text/SimpleDateFormat;

    .line 51
    iput v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->averageWaitTime:I

    .line 52
    iput-object v3, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->oldestEntry:Ljava/util/Date;

    .line 53
    iput v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->userCount:I

    .line 54
    iput-object v3, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->status:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    .line 55
    return-void
.end method


# virtual methods
.method public getAverageWaitTime()I
    .locals 1

    .prologue
    .line 62
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->averageWaitTime:I

    return v0
.end method

.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    sget-object v0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->ELEMENT_NAME:Ljava/lang/String;

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    sget-object v0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->NAMESPACE:Ljava/lang/String;

    return-object v0
.end method

.method public getOldestEntry()Ljava/util/Date;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->oldestEntry:Ljava/util/Date;

    return-object v0
.end method

.method public getStatus()Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->status:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    return-object v0
.end method

.method public getUserCount()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->userCount:I

    return v0
.end method

.method setAverageWaitTime(I)V
    .locals 0
    .param p1, "averageWaitTime"    # I

    .prologue
    .line 58
    iput p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->averageWaitTime:I

    .line 59
    return-void
.end method

.method setOldestEntry(Ljava/util/Date;)V
    .locals 0
    .param p1, "oldestEntry"    # Ljava/util/Date;

    .prologue
    .line 66
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->oldestEntry:Ljava/util/Date;

    .line 67
    return-void
.end method

.method setStatus(Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;)V
    .locals 0
    .param p1, "status"    # Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    .prologue
    .line 86
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->status:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    .line 87
    return-void
.end method

.method setUserCount(I)V
    .locals 0
    .param p1, "userCount"    # I

    .prologue
    .line 74
    iput p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->userCount:I

    .line 75
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v4, -0x1

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->ELEMENT_NAME:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " xmlns=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->NAMESPACE:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    iget v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->userCount:I

    if-eq v1, v4, :cond_0

    .line 102
    const-string/jumbo v1, "<count>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->userCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</count>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->oldestEntry:Ljava/util/Date;

    if-eqz v1, :cond_1

    .line 105
    const-string/jumbo v1, "<oldest>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->dateFormat:Ljava/text/SimpleDateFormat;

    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->oldestEntry:Ljava/util/Date;

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</oldest>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    :cond_1
    iget v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->averageWaitTime:I

    if-eq v1, v4, :cond_2

    .line 108
    const-string/jumbo v1, "<time>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->averageWaitTime:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</time>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    :cond_2
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->status:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    if-eqz v1, :cond_3

    .line 111
    const-string/jumbo v1, "<status>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->status:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</status>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    :cond_3
    const-string/jumbo v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lorg/jivesoftware/smackx/workgroup/packet/QueueOverview;->ELEMENT_NAME:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
