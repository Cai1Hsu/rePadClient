.class public Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType$Audio;
.super Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;
.source "JingleContentDescription.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Audio"
.end annotation


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;)V
    .locals 0
    .param p1, "audio"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .prologue
    .line 282
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V

    .line 283
    return-void
.end method


# virtual methods
.method protected getChildAttributes()Ljava/lang/String;
    .locals 5

    .prologue
    .line 286
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 287
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/JingleContentDescription$JinglePayloadType$Audio;->getPayloadType()Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    move-result-object v1

    .line 288
    .local v1, "pt":Lorg/jivesoftware/smackx/jingle/media/PayloadType;
    instance-of v3, v1, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    if-eqz v3, :cond_0

    move-object v2, v1

    .line 289
    check-cast v2, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .line 291
    .local v2, "pta":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    const-string/jumbo v3, " clockrate=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->getClockRate()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\" "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    .end local v2    # "pta":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
