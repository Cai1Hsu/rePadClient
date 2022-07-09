.class public Lde/javawi/jstun/test/demo/ice/Candidate;
.super Ljava/lang/Object;
.source "Candidate.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    }
.end annotation


# instance fields
.field private base:Lde/javawi/jstun/test/demo/ice/Candidate;

.field private componentId:S

.field private foundationId:I

.field private isInUse:Z

.field private priority:I

.field private socket:Ljava/net/DatagramSocket;

.field private type:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;


# direct methods
.method public constructor <init>(Lde/javawi/jstun/util/Address;Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;SLde/javawi/jstun/test/demo/ice/Candidate;)V
    .locals 3
    .param p1, "address"    # Lde/javawi/jstun/util/Address;
    .param p2, "type"    # Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    .param p3, "componentId"    # S
    .param p4, "base"    # Lde/javawi/jstun/test/demo/ice/Candidate;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;,
            Ljava/net/UnknownHostException;,
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/net/DatagramSocket;

    invoke-virtual {p1}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Ljava/net/DatagramSocket;-><init>(ILjava/net/InetAddress;)V

    iput-object v0, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->socket:Ljava/net/DatagramSocket;

    .line 45
    iput-object p2, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->type:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    .line 46
    invoke-virtual {p0, p3}, Lde/javawi/jstun/test/demo/ice/Candidate;->setComponentId(S)V

    .line 47
    iput v2, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->priority:I

    .line 48
    iput-object p4, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->base:Lde/javawi/jstun/test/demo/ice/Candidate;

    .line 49
    iput-boolean v2, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->isInUse:Z

    .line 50
    return-void
.end method

.method public constructor <init>(Lde/javawi/jstun/util/Address;S)V
    .locals 3
    .param p1, "address"    # Lde/javawi/jstun/util/Address;
    .param p2, "componentId"    # S
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/SocketException;,
            Ljava/net/UnknownHostException;,
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/net/DatagramSocket;

    invoke-virtual {p1}, Lde/javawi/jstun/util/Address;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Ljava/net/DatagramSocket;-><init>(ILjava/net/InetAddress;)V

    iput-object v0, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->socket:Ljava/net/DatagramSocket;

    .line 36
    sget-object v0, Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;->Local:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    iput-object v0, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->type:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    .line 37
    iput-short p2, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->componentId:S

    .line 38
    iput v2, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->priority:I

    .line 39
    iput-object p0, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->base:Lde/javawi/jstun/test/demo/ice/Candidate;

    .line 40
    iput-boolean v2, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->isInUse:Z

    .line 41
    return-void
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .locals 3
    .param p1, "arg0"    # Ljava/lang/Object;

    .prologue
    .line 106
    move-object v0, p1

    check-cast v0, Lde/javawi/jstun/test/demo/ice/Candidate;

    .line 107
    .local v0, "cand":Lde/javawi/jstun/test/demo/ice/Candidate;
    invoke-virtual {v0}, Lde/javawi/jstun/test/demo/ice/Candidate;->getPriority()I

    move-result v1

    invoke-virtual {p0}, Lde/javawi/jstun/test/demo/ice/Candidate;->getPriority()I

    move-result v2

    sub-int/2addr v1, v2

    return v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 111
    if-nez p1, :cond_0

    move v0, v1

    .line 113
    .end local p1    # "o":Ljava/lang/Object;
    :goto_0
    return v0

    .restart local p1    # "o":Ljava/lang/Object;
    :cond_0
    move-object v0, p1

    .line 112
    check-cast v0, Lde/javawi/jstun/test/demo/ice/Candidate;

    iget-object v0, v0, Lde/javawi/jstun/test/demo/ice/Candidate;->socket:Ljava/net/DatagramSocket;

    iget-object v2, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    check-cast p1, Lde/javawi/jstun/test/demo/ice/Candidate;

    .end local p1    # "o":Ljava/lang/Object;
    iget-object v0, p1, Lde/javawi/jstun/test/demo/ice/Candidate;->base:Lde/javawi/jstun/test/demo/ice/Candidate;

    iget-object v2, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->base:Lde/javawi/jstun/test/demo/ice/Candidate;

    invoke-virtual {v0, v2}, Lde/javawi/jstun/test/demo/ice/Candidate;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    move v0, v1

    .line 113
    goto :goto_0
.end method

.method public getAddress()Lde/javawi/jstun/util/Address;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lde/javawi/jstun/util/UtilityException;
        }
    .end annotation

    .prologue
    .line 90
    new-instance v0, Lde/javawi/jstun/util/Address;

    iget-object v1, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v1}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v1

    invoke-direct {v0, v1}, Lde/javawi/jstun/util/Address;-><init>([B)V

    return-object v0
.end method

.method public getBase()Lde/javawi/jstun/test/demo/ice/Candidate;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->base:Lde/javawi/jstun/test/demo/ice/Candidate;

    return-object v0
.end method

.method public getCandidateType()Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->type:Lde/javawi/jstun/test/demo/ice/Candidate$CandidateType;

    return-object v0
.end method

.method public getComponentId()S
    .locals 1

    .prologue
    .line 70
    iget-short v0, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->componentId:S

    return v0
.end method

.method public getFoundationId()I
    .locals 1

    .prologue
    .line 78
    iget v0, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->foundationId:I

    return v0
.end method

.method public getInUse()Z
    .locals 1

    .prologue
    .line 102
    iget-boolean v0, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->isInUse:Z

    return v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->socket:Ljava/net/DatagramSocket;

    invoke-virtual {v0}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v0

    return v0
.end method

.method public getPriority()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->priority:I

    return v0
.end method

.method public setBase(Lde/javawi/jstun/test/demo/ice/Candidate;)V
    .locals 0
    .param p1, "base"    # Lde/javawi/jstun/test/demo/ice/Candidate;

    .prologue
    .line 53
    iput-object p1, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->base:Lde/javawi/jstun/test/demo/ice/Candidate;

    .line 54
    return-void
.end method

.method public setComponentId(S)V
    .locals 3
    .param p1, "componentId"    # S

    .prologue
    .line 65
    const/4 v0, 0x1

    if-lt p1, v0, :cond_0

    const/16 v0, 0x100

    if-le p1, v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " is not between 1 and 256 inclusive."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_1
    iput-short p1, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->componentId:S

    .line 67
    return-void
.end method

.method public setFoundationId(I)V
    .locals 0
    .param p1, "foundationId"    # I

    .prologue
    .line 74
    iput p1, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->foundationId:I

    .line 75
    return-void
.end method

.method public setInUse(Z)V
    .locals 0
    .param p1, "isInUse"    # Z

    .prologue
    .line 98
    iput-boolean p1, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->isInUse:Z

    .line 99
    return-void
.end method

.method public setPriority(I)V
    .locals 0
    .param p1, "priority"    # I

    .prologue
    .line 82
    iput p1, p0, Lde/javawi/jstun/test/demo/ice/Candidate;->priority:I

    .line 83
    return-void
.end method
