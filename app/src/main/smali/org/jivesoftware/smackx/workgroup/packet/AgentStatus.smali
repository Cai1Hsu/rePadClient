.class public Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;
.super Ljava/lang/Object;
.source "AgentStatus.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$Provider;,
        Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;
    }
.end annotation


# static fields
.field public static final ELEMENT_NAME:Ljava/lang/String; = "agent-status"

.field public static final NAMESPACE:Ljava/lang/String; = "http://jabber.org/protocol/workgroup"

.field private static final UTC_FORMAT:Ljava/text/SimpleDateFormat;


# instance fields
.field private currentChats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;",
            ">;"
        }
    .end annotation
.end field

.field private maxChats:I

.field private workgroupJID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 36
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyyMMdd\'T\'HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->UTC_FORMAT:Ljava/text/SimpleDateFormat;

    .line 39
    sget-object v0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->UTC_FORMAT:Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "GMT+0"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 40
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->currentChats:Ljava/util/List;

    .line 54
    const/4 v0, -0x1

    iput v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->maxChats:I

    .line 57
    return-void
.end method

.method static synthetic access$000()Ljava/text/SimpleDateFormat;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->UTC_FORMAT:Ljava/text/SimpleDateFormat;

    return-object v0
.end method

.method static synthetic access$102(Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 34
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->workgroupJID:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;

    .prologue
    .line 34
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->currentChats:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$302(Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;I)I
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;
    .param p1, "x1"    # I

    .prologue
    .line 34
    iput p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->maxChats:I

    return p1
.end method


# virtual methods
.method public getCurrentChats()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 71
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->currentChats:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    const-string/jumbo v0, "agent-status"

    return-object v0
.end method

.method public getMaxChats()I
    .locals 1

    .prologue
    .line 75
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->maxChats:I

    return v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 83
    const-string/jumbo v0, "http://jabber.org/protocol/workgroup"

    return-object v0
.end method

.method public getWorkgroupJID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->workgroupJID:Ljava/lang/String;

    return-object v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 4

    .prologue
    .line 87
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 89
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v2, "<"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "agent-status"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " xmlns=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "http://jabber.org/protocol/workgroup"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->workgroupJID:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 91
    const-string/jumbo v2, " jid=\""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->workgroupJID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    :cond_0
    const-string/jumbo v2, ">"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    iget v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->maxChats:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 95
    const-string/jumbo v2, "<max-chats>"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->maxChats:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "</max-chats>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    :cond_1
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->currentChats:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    .line 98
    const-string/jumbo v2, "<current-chats xmlns= \"http://jivesoftware.com/protocol/workgroup\">"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->currentChats:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 100
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->toXML()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 102
    :cond_2
    const-string/jumbo v2, "</current-chats>"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;>;"
    :cond_3
    const-string/jumbo v2, "</"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->getElementName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
