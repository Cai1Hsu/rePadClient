.class public Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;
.super Ljava/lang/Object;
.source "RoomTransfer.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$1;,
        Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Provider;,
        Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;
    }
.end annotation


# static fields
.field public static final ELEMENT_NAME:Ljava/lang/String; = "transfer"

.field public static final NAMESPACE:Ljava/lang/String; = "http://jabber.org/protocol/workgroup"


# instance fields
.field private invitee:Ljava/lang/String;

.field private inviter:Ljava/lang/String;

.field private reason:Ljava/lang/String;

.field private room:Ljava/lang/String;

.field private sessionID:Ljava/lang/String;

.field private type:Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    return-void
.end method

.method synthetic constructor <init>(Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$1;

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;
    .param p2, "invitee"    # Ljava/lang/String;
    .param p3, "sessionID"    # Ljava/lang/String;
    .param p4, "reason"    # Ljava/lang/String;

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->type:Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;

    .line 71
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->invitee:Ljava/lang/String;

    .line 72
    iput-object p3, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->sessionID:Ljava/lang/String;

    .line 73
    iput-object p4, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->reason:Ljava/lang/String;

    .line 74
    return-void
.end method

.method static synthetic access$102(Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;)Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;
    .param p1, "x1"    # Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;

    .prologue
    .line 31
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->type:Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;

    return-object p1
.end method

.method static synthetic access$202(Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->sessionID:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$302(Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->invitee:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$402(Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->inviter:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$502(Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->reason:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$602(Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->room:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    const-string/jumbo v0, "transfer"

    return-object v0
.end method

.method public getInviter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->inviter:Ljava/lang/String;

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    const-string/jumbo v0, "http://jabber.org/protocol/workgroup"

    return-object v0
.end method

.method public getReason()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->reason:Ljava/lang/String;

    return-object v0
.end method

.method public getRoom()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->room:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->sessionID:Ljava/lang/String;

    return-object v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "transfer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " xmlns=\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "http://jabber.org/protocol/workgroup"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    const-string/jumbo v1, "\" type=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->type:Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer$Type;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    const-string/jumbo v1, "<session xmlns=\"http://jivesoftware.com/protocol/workgroup\" id=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->sessionID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\"></session>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->invitee:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 110
    const-string/jumbo v1, "<invitee>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->invitee:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</invitee>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->inviter:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 113
    const-string/jumbo v1, "<inviter>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->inviter:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</inviter>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->reason:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 116
    const-string/jumbo v1, "<reason>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/RoomTransfer;->reason:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</reason>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    :cond_2
    const-string/jumbo v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "transfer"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
