.class public Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;
.super Lorg/jivesoftware/smackx/jingle/media/ContentInfo;
.source "ContentInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/media/ContentInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Audio"
.end annotation


# static fields
.field public static final BUSY:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

.field public static final HOLD:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

.field public static final MUTE:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

.field public static final QUEUED:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

.field public static final RINGING:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 37
    new-instance v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    const-string/jumbo v1, "busy"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;->BUSY:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    .line 39
    new-instance v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    const-string/jumbo v1, "hold"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;->HOLD:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    .line 41
    new-instance v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    const-string/jumbo v1, "mute"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;->MUTE:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    .line 43
    new-instance v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    const-string/jumbo v1, "queued"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;->QUEUED:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    .line 45
    new-instance v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    const-string/jumbo v1, "ringing"

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;->RINGING:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/media/ContentInfo;-><init>()V

    .line 50
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;->value:Ljava/lang/String;

    .line 51
    return-void
.end method

.method public static fromString(Ljava/lang/String;)Lorg/jivesoftware/smackx/jingle/media/ContentInfo;
    .locals 1
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 61
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    .line 62
    const-string/jumbo v0, "busy"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 63
    sget-object v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;->BUSY:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    .line 73
    :goto_0
    return-object v0

    .line 64
    :cond_0
    const-string/jumbo v0, "hold"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 65
    sget-object v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;->HOLD:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    goto :goto_0

    .line 66
    :cond_1
    const-string/jumbo v0, "mute"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 67
    sget-object v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;->MUTE:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    goto :goto_0

    .line 68
    :cond_2
    const-string/jumbo v0, "queued"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 69
    sget-object v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;->QUEUED:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    goto :goto_0

    .line 70
    :cond_3
    const-string/jumbo v0, "ringing"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 71
    sget-object v0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;->RINGING:Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;

    goto :goto_0

    .line 73
    :cond_4
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/media/ContentInfo$Audio;->value:Ljava/lang/String;

    return-object v0
.end method
