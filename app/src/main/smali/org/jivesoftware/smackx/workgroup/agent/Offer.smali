.class public Lorg/jivesoftware/smackx/workgroup/agent/Offer;
.super Ljava/lang/Object;
.source "Offer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/agent/Offer$AcceptPacket;,
        Lorg/jivesoftware/smackx/workgroup/agent/Offer$RejectPacket;
    }
.end annotation


# instance fields
.field private accepted:Z

.field private connection:Lorg/jivesoftware/smack/Connection;

.field private content:Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;

.field private expiresDate:Ljava/util/Date;

.field private metaData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private rejected:Z

.field private session:Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;

.field private sessionID:Ljava/lang/String;

.field private userID:Ljava/lang/String;

.field private userJID:Ljava/lang/String;

.field private workgroupName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/Connection;Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Ljava/util/Map;Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;)V
    .locals 1
    .param p1, "conn"    # Lorg/jivesoftware/smack/Connection;
    .param p2, "agentSession"    # Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;
    .param p3, "userID"    # Ljava/lang/String;
    .param p4, "userJID"    # Ljava/lang/String;
    .param p5, "workgroupName"    # Ljava/lang/String;
    .param p6, "expiresDate"    # Ljava/util/Date;
    .param p7, "sessionID"    # Ljava/lang/String;
    .param p9, "content"    # Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smack/Connection;",
            "Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Date;",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;",
            "Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;",
            ")V"
        }
    .end annotation

    .prologue
    .local p8, "metaData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v0, 0x0

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-boolean v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->accepted:Z

    .line 52
    iput-boolean v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->rejected:Z

    .line 72
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->connection:Lorg/jivesoftware/smack/Connection;

    .line 73
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->session:Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;

    .line 74
    iput-object p3, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->userID:Ljava/lang/String;

    .line 75
    iput-object p4, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->userJID:Ljava/lang/String;

    .line 76
    iput-object p5, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->workgroupName:Ljava/lang/String;

    .line 77
    iput-object p6, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->expiresDate:Ljava/util/Date;

    .line 78
    iput-object p7, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->sessionID:Ljava/lang/String;

    .line 79
    iput-object p8, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->metaData:Ljava/util/Map;

    .line 80
    iput-object p9, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->content:Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;

    .line 81
    return-void
.end method


# virtual methods
.method public accept()V
    .locals 2

    .prologue
    .line 87
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/agent/Offer$AcceptPacket;

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->session:Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->getWorkgroupJID()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/jivesoftware/smackx/workgroup/agent/Offer$AcceptPacket;-><init>(Lorg/jivesoftware/smackx/workgroup/agent/Offer;Ljava/lang/String;)V

    .line 88
    .local v0, "acceptPacket":Lorg/jivesoftware/smack/packet/Packet;
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 90
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->accepted:Z

    .line 91
    return-void
.end method

.method public getContent()Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->content:Lorg/jivesoftware/smackx/workgroup/agent/OfferContent;

    return-object v0
.end method

.method public getExpiresDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->expiresDate:Ljava/util/Date;

    return-object v0
.end method

.method public getMetaData()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 160
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->metaData:Ljava/util/Map;

    return-object v0
.end method

.method public getSessionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->sessionID:Ljava/lang/String;

    return-object v0
.end method

.method public getUserID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->userID:Ljava/lang/String;

    return-object v0
.end method

.method public getUserJID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->userJID:Ljava/lang/String;

    return-object v0
.end method

.method public getWorkgroupName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 130
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->workgroupName:Ljava/lang/String;

    return-object v0
.end method

.method public isAccepted()Z
    .locals 1

    .prologue
    .line 179
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->accepted:Z

    return v0
.end method

.method public isRejected()Z
    .locals 1

    .prologue
    .line 188
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->rejected:Z

    return v0
.end method

.method public reject()V
    .locals 2

    .prologue
    .line 97
    new-instance v0, Lorg/jivesoftware/smackx/workgroup/agent/Offer$RejectPacket;

    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->session:Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/workgroup/agent/AgentSession;->getWorkgroupJID()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lorg/jivesoftware/smackx/workgroup/agent/Offer$RejectPacket;-><init>(Lorg/jivesoftware/smackx/workgroup/agent/Offer;Ljava/lang/String;)V

    .line 98
    .local v0, "rejectPacket":Lorg/jivesoftware/smackx/workgroup/agent/Offer$RejectPacket;
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->connection:Lorg/jivesoftware/smack/Connection;

    invoke-virtual {v1, v0}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 100
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jivesoftware/smackx/workgroup/agent/Offer;->rejected:Z

    .line 101
    return-void
.end method
