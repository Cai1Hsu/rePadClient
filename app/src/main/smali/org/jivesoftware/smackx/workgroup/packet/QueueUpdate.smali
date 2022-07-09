.class public Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;
.super Ljava/lang/Object;
.source "QueueUpdate.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate$Provider;
    }
.end annotation


# static fields
.field public static final ELEMENT_NAME:Ljava/lang/String; = "queue-status"

.field public static final NAMESPACE:Ljava/lang/String; = "http://jabber.org/protocol/workgroup"


# instance fields
.field private position:I

.field private remainingTime:I


# direct methods
.method public constructor <init>(II)V
    .locals 0
    .param p1, "position"    # I
    .param p2, "remainingTime"    # I

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;->position:I

    .line 48
    iput p2, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;->remainingTime:I

    .line 49
    return-void
.end method


# virtual methods
.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    const-string/jumbo v0, "queue-status"

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 89
    const-string/jumbo v0, "http://jabber.org/protocol/workgroup"

    return-object v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 58
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;->position:I

    return v0
.end method

.method public getRemaingTime()I
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;->remainingTime:I

    return v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v3, -0x1

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<queue-status xmlns=\"http://jabber.org/protocol/workgroup\">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    iget v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;->position:I

    if-eq v1, v3, :cond_0

    .line 75
    const-string/jumbo v1, "<position>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;->position:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</position>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    :cond_0
    iget v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;->remainingTime:I

    if-eq v1, v3, :cond_1

    .line 78
    const-string/jumbo v1, "<time>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/QueueUpdate;->remainingTime:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</time>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    :cond_1
    const-string/jumbo v1, "</queue-status>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
