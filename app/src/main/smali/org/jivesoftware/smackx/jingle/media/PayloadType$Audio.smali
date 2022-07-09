.class public Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
.super Lorg/jivesoftware/smackx/jingle/media/PayloadType;
.source "PayloadType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/media/PayloadType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Audio"
.end annotation


# instance fields
.field private clockRate:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 281
    invoke-direct {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;-><init>()V

    .line 282
    const/4 v0, 0x0

    iput v0, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->clockRate:I

    .line 283
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 292
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;-><init>(ILjava/lang/String;)V

    .line 293
    const/4 v0, 0x0

    iput v0, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->clockRate:I

    .line 294
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;I)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "rate"    # I

    .prologue
    .line 273
    invoke-direct {p0, p1, p2}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;-><init>(ILjava/lang/String;)V

    .line 274
    iput p3, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->clockRate:I

    .line 275
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;II)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "channels"    # I
    .param p4, "rate"    # I

    .prologue
    .line 261
    invoke-direct {p0, p1, p2, p3}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;-><init>(ILjava/lang/String;I)V

    .line 262
    iput p4, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->clockRate:I

    .line 263
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;)V
    .locals 1
    .param p1, "pt"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .prologue
    .line 312
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V

    .line 313
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->getClockRate()I

    move-result v0

    iput v0, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->clockRate:I

    .line 314
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V
    .locals 1
    .param p1, "pt"    # Lorg/jivesoftware/smackx/jingle/media/PayloadType;

    .prologue
    .line 302
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;-><init>(Lorg/jivesoftware/smackx/jingle/media/PayloadType;)V

    .line 303
    const/4 v0, 0x0

    iput v0, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->clockRate:I

    .line 304
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 352
    if-ne p0, p1, :cond_1

    .line 365
    :cond_0
    :goto_0
    return v1

    .line 355
    :cond_1
    invoke-super {p0, p1}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    move v1, v2

    .line 356
    goto :goto_0

    .line 358
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 359
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 361
    check-cast v0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;

    .line 362
    .local v0, "other":Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->getClockRate()I

    move-result v3

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->getClockRate()I

    move-result v4

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 363
    goto :goto_0
.end method

.method public getClockRate()I
    .locals 1

    .prologue
    .line 322
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->clockRate:I

    return v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 340
    const/16 v0, 0x1f

    .line 341
    .local v0, "PRIME":I
    invoke-super {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType;->hashCode()I

    move-result v1

    .line 342
    .local v1, "result":I
    mul-int/lit8 v2, v1, 0x1f

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->getClockRate()I

    move-result v3

    add-int v1, v2, v3

    .line 343
    return v1
.end method

.method public setClockRate(I)V
    .locals 0
    .param p1, "rate"    # I

    .prologue
    .line 331
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/media/PayloadType$Audio;->clockRate:I

    .line 332
    return-void
.end method
