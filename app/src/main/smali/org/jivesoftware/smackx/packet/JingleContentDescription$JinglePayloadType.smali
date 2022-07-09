.class public Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;
.super Ljava/lang/Object;
.source "JingleContentDescription.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/packet/JingleContentDescription;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "JinglePayloadType"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType$Audio;
    }
.end annotation


# static fields
.field public static final NODENAME:Ljava/lang/String; = "payload-type"


# instance fields
.field private payload:Lorg/jivesoftware/smackx/jingle/media/PayloadType;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 219
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V

    .line 220
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V
    .locals 0
    .param p1, "payload"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .prologue
    .line 211
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 212
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->payload:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 213
    return-void
.end method

.method public static getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 228
    const-string/jumbo v0, "payload-type"

    return-object v0
.end method


# virtual methods
.method protected getChildAttributes()Ljava/lang/String;
    .locals 1

    .prologue
    .line 250
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPayloadType()Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    .locals 1

    .prologue
    .line 237
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->payload:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    return-object v0
.end method

.method public setPayload(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V
    .locals 0
    .param p1, "payload"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .prologue
    .line 246
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->payload:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .line 247
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 256
    .local v0, "buf":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->payload:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    if-eqz v1, :cond_4

    .line 257
    const-string/jumbo v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->getElementName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->payload:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v1

    sget v2, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->INVALID_PT:I

    if-eq v1, v2, :cond_0

    .line 261
    const-string/jumbo v1, " id=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->payload:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->payload:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 264
    const-string/jumbo v1, " name=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->payload:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->payload:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getChannels()I

    move-result v1

    if-eqz v1, :cond_2

    .line 267
    const-string/jumbo v1, " channels=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->payload:Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->getChannels()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    :cond_2
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->getChildAttributes()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 270
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;->getChildAttributes()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    :cond_3
    const-string/jumbo v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
