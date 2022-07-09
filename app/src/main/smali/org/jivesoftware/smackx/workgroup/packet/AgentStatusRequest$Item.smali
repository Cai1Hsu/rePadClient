.class public Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Item;
.super Ljava/lang/Object;
.source "AgentStatusRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Item"
.end annotation


# instance fields
.field private jid:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "jid"    # Ljava/lang/String;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Item;->jid:Ljava/lang/String;

    .line 99
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Item;->type:Ljava/lang/String;

    .line 100
    iput-object p3, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Item;->name:Ljava/lang/String;

    .line 101
    return-void
.end method


# virtual methods
.method public getJID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Item;->jid:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Item;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatusRequest$Item;->type:Ljava/lang/String;

    return-object v0
.end method
