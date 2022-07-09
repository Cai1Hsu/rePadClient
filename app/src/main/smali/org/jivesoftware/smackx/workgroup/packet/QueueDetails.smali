.class public Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;
.super Ljava/lang/Object;
.source "QueueDetails.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails$1;,
        Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails$Provider;
    }
.end annotation


# static fields
.field private static final DATE_FORMAT:Ljava/lang/String; = "yyyyMMdd\'T\'HH:mm:ss"

.field public static final ELEMENT_NAME:Ljava/lang/String; = "notify-queue-details"

.field public static final NAMESPACE:Ljava/lang/String; = "http://jabber.org/protocol/workgroup"


# instance fields
.field private dateFormat:Ljava/text/SimpleDateFormat;

.field private users:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/QueueUser;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 2

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyyMMdd\'T\'HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->dateFormat:Ljava/text/SimpleDateFormat;

    .line 61
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->users:Ljava/util/Set;

    .line 62
    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails$1;

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;Lorg/jivesoftware/smackx/workgroup/QueueUser;)V
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;
    .param p1, "x1"    # Lorg/jivesoftware/smackx/workgroup/QueueUser;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->addUser(Lorg/jivesoftware/smackx/workgroup/QueueUser;)V

    return-void
.end method

.method private addUser(Lorg/jivesoftware/smackx/workgroup/QueueUser;)V
    .locals 2
    .param p1, "user"    # Lorg/jivesoftware/smackx/workgroup/QueueUser;

    .prologue
    .line 92
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->users:Ljava/util/Set;

    monitor-enter v1

    .line 93
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->users:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 94
    monitor-exit v1

    .line 95
    return-void

    .line 94
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    const-string/jumbo v0, "notify-queue-details"

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    const-string/jumbo v0, "http://jabber.org/protocol/workgroup"

    return-object v0
.end method

.method public getUserCount()I
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->users:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    return v0
.end method

.method public getUsers()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/QueueUser;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->users:Ljava/util/Set;

    monitor-enter v1

    .line 82
    :try_start_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->users:Ljava/util/Set;

    monitor-exit v1

    return-object v0

    .line 83
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 10

    .prologue
    const/4 v9, -0x1

    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v6, "<"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "notify-queue-details"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " xmlns=\""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "http://jabber.org/protocol/workgroup"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "\">"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    iget-object v7, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->users:Ljava/util/Set;

    monitor-enter v7

    .line 110
    :try_start_0
    iget-object v6, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->users:Ljava/util/Set;

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/QueueUser;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 111
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jivesoftware/smackx/workgroup/QueueUser;

    .line 112
    .local v5, "user":Lorg/jivesoftware/smackx/workgroup/QueueUser;
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/workgroup/QueueUser;->getQueuePosition()I

    move-result v2

    .line 113
    .local v2, "position":I
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/workgroup/QueueUser;->getEstimatedRemainingTime()I

    move-result v3

    .line 114
    .local v3, "timeRemaining":I
    invoke-virtual {v5}, Lorg/jivesoftware/smackx/workgroup/QueueUser;->getQueueJoinTimestamp()Ljava/util/Date;

    move-result-object v4

    .line 116
    .local v4, "timestamp":Ljava/util/Date;
    const-string/jumbo v6, "<user jid=\""

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Lorg/jivesoftware/smackx/workgroup/QueueUser;->getUserID()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v8, "\">"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    if-eq v2, v9, :cond_0

    .line 119
    const-string/jumbo v6, "<position>"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v8, "</position>"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    :cond_0
    if-eq v3, v9, :cond_1

    .line 123
    const-string/jumbo v6, "<time>"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v8, "</time>"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    :cond_1
    if-eqz v4, :cond_2

    .line 127
    const-string/jumbo v6, "<join-time>"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    iget-object v6, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueDetails;->dateFormat:Ljava/text/SimpleDateFormat;

    invoke-virtual {v6, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    const-string/jumbo v6, "</join-time>"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    :cond_2
    const-string/jumbo v6, "</user>"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 134
    .end local v1    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/QueueUser;>;"
    .end local v2    # "position":I
    .end local v3    # "timeRemaining":I
    .end local v4    # "timestamp":Ljava/util/Date;
    .end local v5    # "user":Lorg/jivesoftware/smackx/workgroup/QueueUser;
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6

    .restart local v1    # "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/QueueUser;>;"
    :cond_3
    :try_start_1
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 135
    const-string/jumbo v6, "</"

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "notify-queue-details"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ">"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method
