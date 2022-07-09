.class public Lorg/jivesoftware/smackx/FormField$Option;
.super Ljava/lang/Object;
.source "FormField.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/FormField;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Option"
.end annotation


# instance fields
.field private label:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 331
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 332
    iput-object p1, p0, Lorg/jivesoftware/smackx/FormField$Option;->value:Ljava/lang/String;

    .line 333
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "label"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 335
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 336
    iput-object p1, p0, Lorg/jivesoftware/smackx/FormField$Option;->label:Ljava/lang/String;

    .line 337
    iput-object p2, p0, Lorg/jivesoftware/smackx/FormField$Option;->value:Ljava/lang/String;

    .line 338
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 380
    if-nez p1, :cond_1

    .line 398
    :cond_0
    :goto_0
    return v3

    .line 382
    :cond_1
    if-ne p1, p0, :cond_2

    move v3, v4

    .line 383
    goto :goto_0

    .line 384
    :cond_2
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    if-ne v5, v6, :cond_0

    move-object v0, p1

    .line 387
    check-cast v0, Lorg/jivesoftware/smackx/FormField$Option;

    .line 389
    .local v0, "other":Lorg/jivesoftware/smackx/FormField$Option;
    iget-object v5, p0, Lorg/jivesoftware/smackx/FormField$Option;->value:Ljava/lang/String;

    iget-object v6, v0, Lorg/jivesoftware/smackx/FormField$Option;->value:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 392
    iget-object v5, p0, Lorg/jivesoftware/smackx/FormField$Option;->label:Ljava/lang/String;

    if-nez v5, :cond_3

    const-string/jumbo v2, ""

    .line 393
    .local v2, "thisLabel":Ljava/lang/String;
    :goto_1
    iget-object v5, v0, Lorg/jivesoftware/smackx/FormField$Option;->label:Ljava/lang/String;

    if-nez v5, :cond_4

    const-string/jumbo v1, ""

    .line 395
    .local v1, "otherLabel":Ljava/lang/String;
    :goto_2
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v3, v4

    .line 398
    goto :goto_0

    .line 392
    .end local v1    # "otherLabel":Ljava/lang/String;
    .end local v2    # "thisLabel":Ljava/lang/String;
    :cond_3
    iget-object v2, p0, Lorg/jivesoftware/smackx/FormField$Option;->label:Ljava/lang/String;

    goto :goto_1

    .line 393
    .restart local v2    # "thisLabel":Ljava/lang/String;
    :cond_4
    iget-object v1, v0, Lorg/jivesoftware/smackx/FormField$Option;->label:Ljava/lang/String;

    goto :goto_2
.end method

.method public getLabel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 346
    iget-object v0, p0, Lorg/jivesoftware/smackx/FormField$Option;->label:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 355
    iget-object v0, p0, Lorg/jivesoftware/smackx/FormField$Option;->value:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 403
    const/4 v0, 0x1

    .line 404
    .local v0, "result":I
    iget-object v1, p0, Lorg/jivesoftware/smackx/FormField$Option;->value:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    add-int/lit8 v0, v1, 0x25

    .line 405
    mul-int/lit8 v2, v0, 0x25

    iget-object v1, p0, Lorg/jivesoftware/smackx/FormField$Option;->label:Ljava/lang/String;

    if-nez v1, :cond_0

    const/4 v1, 0x0

    :goto_0
    add-int v0, v2, v1

    .line 406
    return v0

    .line 405
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/FormField$Option;->label:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 360
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/FormField$Option;->getLabel()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 3

    .prologue
    .line 364
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 365
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<option"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/FormField$Option;->getLabel()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 368
    const-string/jumbo v1, " label=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/FormField$Option;->getLabel()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    :cond_0
    const-string/jumbo v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 372
    const-string/jumbo v1, "<value>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/FormField$Option;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/jivesoftware/smack/util/StringUtils;->escapeForXML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</value>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 374
    const-string/jumbo v1, "</option>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 375
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
