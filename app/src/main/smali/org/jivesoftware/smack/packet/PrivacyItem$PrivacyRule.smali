.class public Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;
.super Ljava/lang/Object;
.source "PrivacyItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/packet/PrivacyItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PrivacyRule"
.end annotation


# static fields
.field public static final SUBSCRIPTION_BOTH:Ljava/lang/String; = "both"

.field public static final SUBSCRIPTION_FROM:Ljava/lang/String; = "from"

.field public static final SUBSCRIPTION_NONE:Ljava/lang/String; = "none"

.field public static final SUBSCRIPTION_TO:Ljava/lang/String; = "to"


# instance fields
.field private type:Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 313
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;
    .locals 2
    .param p0, "value"    # Ljava/lang/String;

    .prologue
    .line 342
    if-nez p0, :cond_0

    .line 343
    const/4 v0, 0x0

    .line 347
    :goto_0
    return-object v0

    .line 345
    :cond_0
    new-instance v0, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;-><init>()V

    .line 346
    .local v0, "rule":Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;
    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/jivesoftware/smack/packet/PrivacyItem$Type;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->setType(Lorg/jivesoftware/smack/packet/PrivacyItem$Type;)V

    goto :goto_0
.end method

.method private setSuscriptionValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 412
    if-nez p1, :cond_0

    .line 415
    :cond_0
    const-string/jumbo v1, "both"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 416
    const-string/jumbo v0, "both"

    .line 431
    .local v0, "setValue":Ljava/lang/String;
    :goto_0
    iput-object v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->value:Ljava/lang/String;

    .line 432
    return-void

    .line 418
    .end local v0    # "setValue":Ljava/lang/String;
    :cond_1
    const-string/jumbo v1, "to"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 419
    const-string/jumbo v0, "to"

    .restart local v0    # "setValue":Ljava/lang/String;
    goto :goto_0

    .line 421
    .end local v0    # "setValue":Ljava/lang/String;
    :cond_2
    const-string/jumbo v1, "from"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 422
    const-string/jumbo v0, "from"

    .restart local v0    # "setValue":Ljava/lang/String;
    goto :goto_0

    .line 424
    .end local v0    # "setValue":Ljava/lang/String;
    :cond_3
    const-string/jumbo v1, "none"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 425
    const-string/jumbo v0, "none"

    .restart local v0    # "setValue":Ljava/lang/String;
    goto :goto_0

    .line 429
    .end local v0    # "setValue":Ljava/lang/String;
    :cond_4
    const/4 v0, 0x0

    .restart local v0    # "setValue":Ljava/lang/String;
    goto :goto_0
.end method

.method private setType(Lorg/jivesoftware/smack/packet/PrivacyItem$Type;)V
    .locals 0
    .param p1, "type"    # Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    .prologue
    .line 366
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->type:Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    .line 367
    return-void
.end method


# virtual methods
.method public getType()Lorg/jivesoftware/smack/packet/PrivacyItem$Type;
    .locals 1

    .prologue
    .line 357
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->type:Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 381
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->value:Ljava/lang/String;

    return-object v0
.end method

.method public isSuscription()Z
    .locals 2

    .prologue
    .line 440
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->getType()Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    move-result-object v0

    sget-object v1, Lorg/jivesoftware/smack/packet/PrivacyItem$Type;->subscription:Lorg/jivesoftware/smack/packet/PrivacyItem$Type;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected setValue(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 396
    invoke-virtual {p0}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->isSuscription()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 397
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->setSuscriptionValue(Ljava/lang/String;)V

    .line 401
    :goto_0
    return-void

    .line 399
    :cond_0
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/PrivacyItem$PrivacyRule;->value:Ljava/lang/String;

    goto :goto_0
.end method
