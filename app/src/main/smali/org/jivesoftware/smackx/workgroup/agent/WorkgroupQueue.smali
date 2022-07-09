.class public Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;
.super Ljava/lang/Object;
.source "WorkgroupQueue.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;
    }
.end annotation


# instance fields
.field private averageWaitTime:I

.field private currentChats:I

.field private maxChats:I

.field private name:Ljava/lang/String;

.field private oldestEntry:Ljava/util/Date;

.field private status:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

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
.method constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    sget-object v0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;->CLOSED:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    iput-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->status:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    .line 35
    const/4 v0, -0x1

    iput v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->averageWaitTime:I

    .line 36
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->oldestEntry:Ljava/util/Date;

    .line 37
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->users:Ljava/util/Set;

    .line 39
    iput v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->maxChats:I

    .line 40
    iput v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->currentChats:I

    .line 48
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->name:Ljava/lang/String;

    .line 49
    return-void
.end method


# virtual methods
.method public getAverageWaitTime()I
    .locals 1

    .prologue
    .line 111
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->averageWaitTime:I

    return v0
.end method

.method public getCurrentChats()I
    .locals 1

    .prologue
    .line 151
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->currentChats:I

    return v0
.end method

.method public getMaxChats()I
    .locals 1

    .prologue
    .line 138
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->maxChats:I

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOldestEntry()Ljava/util/Date;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->oldestEntry:Ljava/util/Date;

    return-object v0
.end method

.method public getStatus()Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;
    .locals 1

    .prologue
    .line 66
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->status:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    return-object v0
.end method

.method public getUserCount()I
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->users:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 81
    const/4 v0, 0x0

    .line 83
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->users:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    goto :goto_0
.end method

.method public getUsers()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/QueueUser;",
            ">;"
        }
    .end annotation

    .prologue
    .line 93
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->users:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 94
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 96
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->users:Ljava/util/Set;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    goto :goto_0
.end method

.method setAverageWaitTime(I)V
    .locals 0
    .param p1, "averageTime"    # I

    .prologue
    .line 115
    iput p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->averageWaitTime:I

    .line 116
    return-void
.end method

.method setCurrentChats(I)V
    .locals 0
    .param p1, "currentChats"    # I

    .prologue
    .line 155
    iput p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->currentChats:I

    .line 156
    return-void
.end method

.method setMaxChats(I)V
    .locals 0
    .param p1, "maxChats"    # I

    .prologue
    .line 142
    iput p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->maxChats:I

    .line 143
    return-void
.end method

.method setOldestEntry(Ljava/util/Date;)V
    .locals 0
    .param p1, "oldestEntry"    # Ljava/util/Date;

    .prologue
    .line 129
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->oldestEntry:Ljava/util/Date;

    .line 130
    return-void
.end method

.method setStatus(Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;)V
    .locals 0
    .param p1, "status"    # Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    .prologue
    .line 70
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->status:Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue$Status;

    .line 71
    return-void
.end method

.method setUsers(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/QueueUser;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 100
    .local p1, "users":Ljava/util/Set;, "Ljava/util/Set<Lorg/jivesoftware/smackx/workgroup/QueueUser;>;"
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/WorkgroupQueue;->users:Ljava/util/Set;

    .line 101
    return-void
.end method
