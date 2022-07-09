.class public Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
.super Ljava/lang/Object;
.source "DiscoverInfo.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/packet/DiscoverInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Identity"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;",
        ">;"
    }
.end annotation


# instance fields
.field private category:Ljava/lang/String;

.field private lang:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 274
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 275
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    .line 276
    iput-object p2, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    .line 277
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "category"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 288
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 289
    if-eqz p1, :cond_0

    if-nez p3, :cond_1

    .line 290
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "category and type cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 292
    :cond_1
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    .line 293
    iput-object p2, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    .line 294
    iput-object p3, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    .line 295
    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 260
    check-cast p1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->compareTo(Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;)I
    .locals 6
    .param p1, "other"    # Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .prologue
    .line 429
    iget-object v4, p1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    if-nez v4, :cond_0

    const-string/jumbo v0, ""

    .line 430
    .local v0, "otherLang":Ljava/lang/String;
    :goto_0
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    if-nez v4, :cond_1

    const-string/jumbo v2, ""

    .line 433
    .local v2, "thisLang":Ljava/lang/String;
    :goto_1
    iget-object v4, p1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    if-nez v4, :cond_2

    const-string/jumbo v1, ""

    .line 434
    .local v1, "otherType":Ljava/lang/String;
    :goto_2
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    if-nez v4, :cond_3

    const-string/jumbo v3, ""

    .line 436
    .local v3, "thisType":Ljava/lang/String;
    :goto_3
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    iget-object v5, p1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 437
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 438
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 441
    const/4 v4, 0x0

    .line 449
    :goto_4
    return v4

    .line 429
    .end local v0    # "otherLang":Ljava/lang/String;
    .end local v1    # "otherType":Ljava/lang/String;
    .end local v2    # "thisLang":Ljava/lang/String;
    .end local v3    # "thisType":Ljava/lang/String;
    :cond_0
    iget-object v0, p1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    goto :goto_0

    .line 430
    .restart local v0    # "otherLang":Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    goto :goto_1

    .line 433
    .restart local v2    # "thisLang":Ljava/lang/String;
    :cond_2
    iget-object v1, p1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    goto :goto_2

    .line 434
    .restart local v1    # "otherType":Ljava/lang/String;
    :cond_3
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    goto :goto_3

    .line 443
    .restart local v3    # "thisType":Ljava/lang/String;
    :cond_4
    invoke-virtual {v2, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    goto :goto_4

    .line 446
    :cond_5
    invoke-virtual {v3, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    goto :goto_4

    .line 449
    :cond_6
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    iget-object v5, p1, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    goto :goto_4
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 11
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 380
    if-nez p1, :cond_1

    .line 407
    :cond_0
    :goto_0
    return v7

    .line 382
    :cond_1
    if-ne p1, p0, :cond_2

    move v7, v8

    .line 383
    goto :goto_0

    .line 384
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    if-ne v9, v10, :cond_0

    move-object v0, p1

    .line 387
    check-cast v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;

    .line 388
    .local v0, "other":Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;
    iget-object v9, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    iget-object v10, v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 391
    iget-object v9, v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    if-nez v9, :cond_3

    const-string/jumbo v1, ""

    .line 392
    .local v1, "otherLang":Ljava/lang/String;
    :goto_1
    iget-object v9, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    if-nez v9, :cond_4

    const-string/jumbo v4, ""

    .line 393
    .local v4, "thisLang":Ljava/lang/String;
    :goto_2
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 397
    iget-object v9, v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    if-nez v9, :cond_5

    const-string/jumbo v3, ""

    .line 398
    .local v3, "otherType":Ljava/lang/String;
    :goto_3
    iget-object v9, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    if-nez v9, :cond_6

    const-string/jumbo v6, ""

    .line 399
    .local v6, "thisType":Ljava/lang/String;
    :goto_4
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 402
    iget-object v9, v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    if-nez v9, :cond_7

    const-string/jumbo v2, ""

    .line 403
    .local v2, "otherName":Ljava/lang/String;
    :goto_5
    iget-object v9, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    if-nez v9, :cond_8

    const-string/jumbo v5, ""

    .line 404
    .local v5, "thisName":Ljava/lang/String;
    :goto_6
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    move v7, v8

    .line 407
    goto :goto_0

    .line 391
    .end local v1    # "otherLang":Ljava/lang/String;
    .end local v2    # "otherName":Ljava/lang/String;
    .end local v3    # "otherType":Ljava/lang/String;
    .end local v4    # "thisLang":Ljava/lang/String;
    .end local v5    # "thisName":Ljava/lang/String;
    .end local v6    # "thisType":Ljava/lang/String;
    :cond_3
    iget-object v1, v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    goto :goto_1

    .line 392
    .restart local v1    # "otherLang":Ljava/lang/String;
    :cond_4
    iget-object v4, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    goto :goto_2

    .line 397
    .restart local v4    # "thisLang":Ljava/lang/String;
    :cond_5
    iget-object v3, v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    goto :goto_3

    .line 398
    .restart local v3    # "otherType":Ljava/lang/String;
    :cond_6
    iget-object v6, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    goto :goto_4

    .line 402
    .restart local v6    # "thisType":Ljava/lang/String;
    :cond_7
    iget-object v2, v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    goto :goto_5

    .line 403
    .restart local v2    # "otherName":Ljava/lang/String;
    :cond_8
    iget-object v5, v0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    goto :goto_6
.end method

.method public getCategory()Ljava/lang/String;
    .locals 1

    .prologue
    .line 304
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    return-object v0
.end method

.method public getLanguage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 352
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 313
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 323
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 412
    const/4 v0, 0x1

    .line 413
    .local v0, "result":I
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/lit8 v0, v1, 0x25

    .line 414
    mul-int/lit8 v3, v0, 0x25

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    if-nez v1, :cond_0

    move v1, v2

    :goto_0
    add-int v0, v3, v1

    .line 415
    mul-int/lit8 v3, v0, 0x25

    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    if-nez v1, :cond_1

    move v1, v2

    :goto_1
    add-int v0, v3, v1

    .line 416
    mul-int/lit8 v1, v0, 0x25

    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    if-nez v3, :cond_2

    :goto_2
    add-int v0, v1, v2

    .line 417
    return v0

    .line 414
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_0

    .line 415
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_1

    .line 416
    :cond_2
    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_2
.end method

.method public setLanguage(Ljava/lang/String;)V
    .locals 0
    .param p1, "lang"    # Ljava/lang/String;

    .prologue
    .line 343
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    .line 344
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 334
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    .line 335
    return-void
.end method

.method public toXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 356
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 357
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<identity"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 360
    const-string/jumbo v1, " xml:lang=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->lang:Ljava/lang/String;

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    :cond_0
    const-string/jumbo v1, " category=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->category:Ljava/lang/String;

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 364
    const-string/jumbo v1, " name=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->name:Ljava/lang/String;

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 366
    iget-object v1, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 367
    const-string/jumbo v1, " type=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/packet/DiscoverInfo$Identity;->type:Ljava/lang/String;

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    :cond_1
    const-string/jumbo v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
