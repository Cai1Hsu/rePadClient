.class public Lcom/anfengde/epub/core/value/ResourceFiles;
.super Ljava/lang/Object;
.source "ResourceFiles.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static copyResourceFiles(Ljava/lang/String;Landroid/content/Context;)V
    .locals 5
    .param p0, "cachePath"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 483
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 484
    .local v2, "imageArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/anfengde/epub/core/value/ResourceData;>;"
    invoke-static {}, Lcom/anfengde/epub/core/value/ResourceFiles;->getImageResourceArray()Ljava/util/ArrayList;

    move-result-object v2

    .line 485
    const-string/jumbo v4, "image"

    invoke-static {v2, v4, p0, p1}, Lcom/anfengde/epub/core/value/ResourceFiles;->writeFilesToSdacrd(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 487
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 488
    .local v1, "htmlArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/anfengde/epub/core/value/ResourceData;>;"
    invoke-static {}, Lcom/anfengde/epub/core/value/ResourceFiles;->getHtmlResourceArray()Ljava/util/ArrayList;

    move-result-object v1

    .line 489
    const-string/jumbo v4, "html"

    invoke-static {v1, v4, p0, p1}, Lcom/anfengde/epub/core/value/ResourceFiles;->writeFilesToSdacrd(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 491
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 492
    .local v3, "jsArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/anfengde/epub/core/value/ResourceData;>;"
    invoke-static {}, Lcom/anfengde/epub/core/value/ResourceFiles;->getJSResourceArray()Ljava/util/ArrayList;

    move-result-object v3

    .line 493
    const-string/jumbo v4, "js"

    invoke-static {v3, v4, p0, p1}, Lcom/anfengde/epub/core/value/ResourceFiles;->writeFilesToSdacrd(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 495
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 496
    .local v0, "cssArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/anfengde/epub/core/value/ResourceData;>;"
    invoke-static {}, Lcom/anfengde/epub/core/value/ResourceFiles;->getCSSResourceArray()Ljava/util/ArrayList;

    move-result-object v0

    .line 497
    const-string/jumbo v4, "css"

    invoke-static {v0, v4, p0, p1}, Lcom/anfengde/epub/core/value/ResourceFiles;->writeFilesToSdacrd(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 498
    return-void
.end method

.method private static getCSSResourceArray()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/anfengde/epub/core/value/ResourceData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 412
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 413
    .local v0, "resourceArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/anfengde/epub/core/value/ResourceData;>;"
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 415
    .local v1, "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->sindex:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 416
    const-string/jumbo v2, "sindex.css"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 417
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 418
    const/4 v1, 0x0

    .line 420
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 421
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->readpage:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 422
    const-string/jumbo v2, "readpage.css"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 423
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 424
    const/4 v1, 0x0

    .line 426
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 427
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->ssetting:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 428
    const-string/jumbo v2, "ssetting.css"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 429
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 430
    const/4 v1, 0x0

    .line 432
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 433
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->stoc:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 434
    const-string/jumbo v2, "stoc.css"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 435
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 436
    const/4 v1, 0x0

    .line 438
    return-object v0
.end method

.method private static getHtmlResourceArray()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/anfengde/epub/core/value/ResourceData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 331
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 332
    .local v0, "resourceArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/anfengde/epub/core/value/ResourceData;>;"
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 334
    .local v1, "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->toc:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 335
    const-string/jumbo v2, "toc.html"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 336
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 337
    const/4 v1, 0x0

    .line 339
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 340
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->index:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 341
    const-string/jumbo v2, "index.html"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 342
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 343
    const/4 v1, 0x0

    .line 345
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 346
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->setting:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 347
    const-string/jumbo v2, "setting.html"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 348
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 349
    const/4 v1, 0x0

    .line 352
    return-object v0
.end method

.method private static getImageResourceArray()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/anfengde/epub/core/value/ResourceData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .local v0, "resourceArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/anfengde/epub/core/value/ResourceData;>;"
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 20
    .local v1, "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_back:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 21
    const-string/jumbo v2, "afd_back.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 22
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    const/4 v1, 0x0

    .line 25
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 26
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_tablecontentsbtn:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 27
    const-string/jumbo v2, "afd_tablecontentsbtn.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 28
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 29
    const/4 v1, 0x0

    .line 31
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 32
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_fontsize:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 33
    const-string/jumbo v2, "afd_fontsize.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 34
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 35
    const/4 v1, 0x0

    .line 37
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 38
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_font_zoomin:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 39
    const-string/jumbo v2, "afd_font_zoomin.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 40
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 41
    const/4 v1, 0x0

    .line 43
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 44
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_font_zoomout:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 45
    const-string/jumbo v2, "afd_font_zoomout.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 46
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    const/4 v1, 0x0

    .line 49
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 50
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_bookmark:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 51
    const-string/jumbo v2, "afd_bookmark.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 52
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    const/4 v1, 0x0

    .line 55
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 56
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_topmenu:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 57
    const-string/jumbo v2, "afd_topmenu.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 58
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    const/4 v1, 0x0

    .line 61
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 62
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_backreadview:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 63
    const-string/jumbo v2, "afd_backreadview.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 64
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    const/4 v1, 0x0

    .line 67
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 68
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_white_left:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 69
    const-string/jumbo v2, "afd_white_left.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 70
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    const/4 v1, 0x0

    .line 73
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 74
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_white_right:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 75
    const-string/jumbo v2, "afd_white_right.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 76
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 77
    const/4 v1, 0x0

    .line 79
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 80
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_green_left:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 81
    const-string/jumbo v2, "afd_green_left.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 82
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 83
    const/4 v1, 0x0

    .line 85
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 86
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_green_right:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 87
    const-string/jumbo v2, "afd_green_right.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 88
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    const/4 v1, 0x0

    .line 91
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 92
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_bookmark_yellow:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 93
    const-string/jumbo v2, "afd_bookmark_yellow.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 94
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 95
    const/4 v1, 0x0

    .line 97
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 98
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_deletebg:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 99
    const-string/jumbo v2, "afd_deletebg.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 100
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    const/4 v1, 0x0

    .line 103
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 104
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_delete:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 105
    const-string/jumbo v2, "afd_delete.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 106
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 107
    const/4 v1, 0x0

    .line 109
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 110
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_drug:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 111
    const-string/jumbo v2, "afd_drug.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 112
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    const/4 v1, 0x0

    .line 115
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 116
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_prev:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 117
    const-string/jumbo v2, "afd_prev.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 118
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    const/4 v1, 0x0

    .line 121
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 122
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_next:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 123
    const-string/jumbo v2, "afd_next.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 124
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    const/4 v1, 0x0

    .line 127
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 128
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_skip:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 129
    const-string/jumbo v2, "afd_skip.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 130
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 131
    const/4 v1, 0x0

    .line 133
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 134
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_setting:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 135
    const-string/jumbo v2, "afd_setting.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 136
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    const/4 v1, 0x0

    .line 139
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 140
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_bright:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 141
    const-string/jumbo v2, "afd_bright.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 142
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 143
    const/4 v1, 0x0

    .line 145
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 146
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_day:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 147
    const-string/jumbo v2, "afd_day.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 148
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 149
    const/4 v1, 0x0

    .line 151
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 152
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_divide:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 153
    const-string/jumbo v2, "afd_divide.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 154
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    const/4 v1, 0x0

    .line 157
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 158
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_night:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 159
    const-string/jumbo v2, "afd_night.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 160
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    const/4 v1, 0x0

    .line 163
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 164
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_index_add:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 165
    const-string/jumbo v2, "afd_index_add.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 166
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 167
    const/4 v1, 0x0

    .line 169
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 170
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_index_bg_image:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 171
    const-string/jumbo v2, "afd_index_bg_image.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 172
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 173
    const/4 v1, 0x0

    .line 175
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 176
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_index_bookbase:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 177
    const-string/jumbo v2, "afd_index_bookbase.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 178
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    const/4 v1, 0x0

    .line 181
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 182
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_index_edit:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 183
    const-string/jumbo v2, "afd_index_edit.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 184
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 185
    const/4 v1, 0x0

    .line 187
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 188
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_index_quit:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 189
    const-string/jumbo v2, "afd_index_quit.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 190
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 191
    const/4 v1, 0x0

    .line 193
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 194
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_coverimg:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 195
    const-string/jumbo v2, "afd_coverimg.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 196
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 197
    const/4 v1, 0x0

    .line 199
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 200
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_edit_allorang:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 201
    const-string/jumbo v2, "afd_edit_allorang.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 202
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 203
    const/4 v1, 0x0

    .line 205
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 206
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_edit_all:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 207
    const-string/jumbo v2, "afd_edit_all.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 208
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 209
    const/4 v1, 0x0

    .line 211
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 212
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_edit_back:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 213
    const-string/jumbo v2, "afd_edit_back.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 214
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 215
    const/4 v1, 0x0

    .line 217
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 218
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_edit_cancel:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 219
    const-string/jumbo v2, "afd_edit_cancel.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 220
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 221
    const/4 v1, 0x0

    .line 223
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 224
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_edit_del:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 225
    const-string/jumbo v2, "afd_edit_del.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 226
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 227
    const/4 v1, 0x0

    .line 229
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 230
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_edit_selected:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 231
    const-string/jumbo v2, "afd_edit_selected.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 232
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 233
    const/4 v1, 0x0

    .line 235
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 237
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_import_currenth3bg:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 238
    const-string/jumbo v2, "afd_import_currenth3bg.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 239
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 240
    const/4 v1, 0x0

    .line 242
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 243
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_import_h3bg:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 244
    const-string/jumbo v2, "afd_import_h3bg.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 245
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 246
    const/4 v1, 0x0

    .line 248
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 249
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_import_local:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 250
    const-string/jumbo v2, "afd_import_local.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 251
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 252
    const/4 v1, 0x0

    .line 254
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 255
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_import_net:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 256
    const-string/jumbo v2, "afd_import_net.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 257
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 258
    const/4 v1, 0x0

    .line 260
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 261
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_import_popuptabbg:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 262
    const-string/jumbo v2, "afd_import_popuptabbg.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 263
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 264
    const/4 v1, 0x0

    .line 266
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 267
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_import_titlebg:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 268
    const-string/jumbo v2, "afd_import_titlebg.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 269
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    const/4 v1, 0x0

    .line 272
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 273
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_import_wifi:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 274
    const-string/jumbo v2, "afd_import_wifi.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 275
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 276
    const/4 v1, 0x0

    .line 278
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 279
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_tts:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 280
    const-string/jumbo v2, "afd_tts.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 281
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 282
    const/4 v1, 0x0

    .line 284
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 285
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->twitter_bird_callout:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 286
    const-string/jumbo v2, "twitter_bird_callout.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 287
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 288
    const/4 v1, 0x0

    .line 290
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 291
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->gplus_64:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 292
    const-string/jumbo v2, "gplus_64.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 293
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 294
    const/4 v1, 0x0

    .line 296
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 297
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_bookshelf:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 298
    const-string/jumbo v2, "afd_bookshelf.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 299
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 300
    const/4 v1, 0x0

    .line 302
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 303
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_bookbase:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 304
    const-string/jumbo v2, "afd_bookbase.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 305
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 306
    const/4 v1, 0x0

    .line 308
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 309
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_quit:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 310
    const-string/jumbo v2, "afd_quit.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 311
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 312
    const/4 v1, 0x0

    .line 314
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 315
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_storemenu:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 316
    const-string/jumbo v2, "afd_storemenu.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 317
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 318
    const/4 v1, 0x0

    .line 320
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 321
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$drawable;->afd_bookshelf_border:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 322
    const-string/jumbo v2, "afd_bookshelf_border.png"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 323
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 324
    const/4 v1, 0x0

    .line 326
    return-object v0
.end method

.method private static getJSResourceArray()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/anfengde/epub/core/value/ResourceData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 357
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 358
    .local v0, "resourceArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/anfengde/epub/core/value/ResourceData;>;"
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 360
    .local v1, "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->control:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 361
    const-string/jumbo v2, "control.js"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 362
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 363
    const/4 v1, 0x0

    .line 365
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 366
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->jtoc:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 367
    const-string/jumbo v2, "jtoc.js"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 368
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 369
    const/4 v1, 0x0

    .line 371
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 372
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->jquery:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 373
    const-string/jumbo v2, "jquery.min.js"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 374
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 375
    const/4 v1, 0x0

    .line 377
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 378
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->jsetting:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 379
    const-string/jumbo v2, "jsetting.js"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 380
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 381
    const/4 v1, 0x0

    .line 383
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 384
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->jindex:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 385
    const-string/jumbo v2, "jindex.js"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 386
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 387
    const/4 v1, 0x0

    .line 389
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 390
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->rangyserializer:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 391
    const-string/jumbo v2, "rangyserializer.js"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 392
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 393
    const/4 v1, 0x0

    .line 395
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 396
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->rangycore:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 397
    const-string/jumbo v2, "rangycore.js"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 398
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 399
    const/4 v1, 0x0

    .line 401
    new-instance v1, Lcom/anfengde/epub/core/value/ResourceData;

    .end local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    invoke-direct {v1}, Lcom/anfengde/epub/core/value/ResourceData;-><init>()V

    .line 402
    .restart local v1    # "resourceData":Lcom/anfengde/epub/core/value/ResourceData;
    sget v2, Lcom/anfengde/epub/ui/R$raw;->androidselection:I

    iput v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 403
    const-string/jumbo v2, "androidselection.js"

    iput-object v2, v1, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 404
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 405
    const/4 v1, 0x0

    .line 407
    return-object v0
.end method

.method private static writeFilesToSdacrd(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 14
    .param p1, "folder"    # Ljava/lang/String;
    .param p2, "afd_cachePath"    # Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/anfengde/epub/core/value/ResourceData;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/content/Context;",
            ")V"
        }
    .end annotation

    .prologue
    .line 446
    .local p0, "resourceArray":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/anfengde/epub/core/value/ResourceData;>;"
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-lt v6, v12, :cond_0

    .line 480
    return-void

    .line 447
    :cond_0
    invoke-virtual {p0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/anfengde/epub/core/value/ResourceData;

    iget v4, v12, Lcom/anfengde/epub/core/value/ResourceData;->resourceId:I

    .line 448
    .local v4, "fileID":I
    invoke-virtual {p0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/anfengde/epub/core/value/ResourceData;

    iget-object v5, v12, Lcom/anfengde/epub/core/value/ResourceData;->resourceName:Ljava/lang/String;

    .line 449
    .local v5, "fileName":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 450
    .local v11, "pathName":Ljava/lang/String;
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 451
    .local v3, "file":Ljava/io/File;
    const/4 v9, 0x0

    .line 452
    .local v9, "output":Ljava/io/OutputStream;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_1

    .line 454
    :try_start_0
    invoke-virtual/range {p3 .. p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v12

    invoke-virtual {v12, v4}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v7

    .line 457
    .local v7, "input":Ljava/io/InputStream;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 458
    .local v1, "dir":Ljava/lang/String;
    new-instance v12, Ljava/io/File;

    invoke-direct {v12, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/io/File;->mkdir()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 461
    :goto_1
    :try_start_1
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 468
    :try_start_2
    new-instance v10, Ljava/io/FileOutputStream;

    invoke-direct {v10, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 469
    .end local v9    # "output":Ljava/io/OutputStream;
    .local v10, "output":Ljava/io/OutputStream;
    const/16 v12, 0x1000

    :try_start_3
    new-array v0, v12, [B

    .line 471
    .local v0, "buffer":[B
    :goto_2
    invoke-virtual {v7, v0}, Ljava/io/InputStream;->read([B)I

    move-result v8

    .local v8, "len":I
    const/4 v12, -0x1

    if-ne v8, v12, :cond_2

    .line 474
    invoke-virtual {v10}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    move-object v9, v10

    .line 446
    .end local v0    # "buffer":[B
    .end local v1    # "dir":Ljava/lang/String;
    .end local v7    # "input":Ljava/io/InputStream;
    .end local v8    # "len":I
    .end local v10    # "output":Ljava/io/OutputStream;
    .restart local v9    # "output":Ljava/io/OutputStream;
    :cond_1
    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    .line 464
    .restart local v1    # "dir":Ljava/lang/String;
    .restart local v7    # "input":Ljava/io/InputStream;
    :catch_0
    move-exception v2

    .line 465
    .local v2, "e":Ljava/lang/Exception;
    const-wide/16 v12, 0x32

    :try_start_4
    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_1

    .line 475
    .end local v1    # "dir":Ljava/lang/String;
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v7    # "input":Ljava/io/InputStream;
    :catch_1
    move-exception v2

    .line 476
    .restart local v2    # "e":Ljava/lang/Exception;
    :goto_4
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 472
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v9    # "output":Ljava/io/OutputStream;
    .restart local v0    # "buffer":[B
    .restart local v1    # "dir":Ljava/lang/String;
    .restart local v7    # "input":Ljava/io/InputStream;
    .restart local v8    # "len":I
    .restart local v10    # "output":Ljava/io/OutputStream;
    :cond_2
    const/4 v12, 0x0

    :try_start_5
    invoke-virtual {v10, v0, v12, v8}, Ljava/io/OutputStream;->write([BII)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    goto :goto_2

    .line 475
    .end local v0    # "buffer":[B
    .end local v8    # "len":I
    :catch_2
    move-exception v2

    move-object v9, v10

    .end local v10    # "output":Ljava/io/OutputStream;
    .restart local v9    # "output":Ljava/io/OutputStream;
    goto :goto_4
.end method
