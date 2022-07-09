.class public Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;
.super Ljava/lang/Object;
.source "BookView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/anfengde/epub/ui/BookView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "JavaScriptInterface"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/anfengde/epub/ui/BookView;


# direct methods
.method public constructor <init>(Lcom/anfengde/epub/ui/BookView;)V
    .locals 0

    .prologue
    .line 344
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addBooks()V
    .locals 1

    .prologue
    .line 446
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$26(Lcom/anfengde/epub/ui/BookView;)V

    .line 447
    return-void
.end method

.method public back()V
    .locals 3

    .prologue
    .line 390
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$4(Lcom/anfengde/epub/ui/BookView;)I

    move-result v1

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/anfengde/epub/ui/BookView;->access$6(Lcom/anfengde/epub/ui/BookView;ILandroid/webkit/WebView;)V

    .line 391
    return-void
.end method

.method public bkOpenChapter(III)V
    .locals 3
    .param p1, "chapterIndex"    # I
    .param p2, "pIndexTemp"    # I
    .param p3, "sIndexTemp"    # I

    .prologue
    .line 365
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0, p1}, Lcom/anfengde/epub/ui/BookView;->access$3(Lcom/anfengde/epub/ui/BookView;I)V

    .line 366
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0, p2}, Lcom/anfengde/epub/ui/BookView;->access$7(Lcom/anfengde/epub/ui/BookView;I)V

    .line 367
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0, p3}, Lcom/anfengde/epub/ui/BookView;->access$8(Lcom/anfengde/epub/ui/BookView;I)V

    .line 368
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    const-string/jumbo v1, "clickBk"

    invoke-static {v0, v1}, Lcom/anfengde/epub/ui/BookView;->access$9(Lcom/anfengde/epub/ui/BookView;Ljava/lang/String;)V

    .line 369
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$4(Lcom/anfengde/epub/ui/BookView;)I

    move-result v1

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/anfengde/epub/ui/BookView;->access$6(Lcom/anfengde/epub/ui/BookView;ILandroid/webkit/WebView;)V

    .line 370
    return-void
.end method

.method public copySelectionText(Ljava/lang/String;)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 482
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$24(Lcom/anfengde/epub/ui/BookView;)Landroid/content/Context;

    move-result-object v1

    .line 483
    const-string/jumbo v2, "clipboard"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 482
    check-cast v0, Landroid/text/ClipboardManager;

    .line 484
    .local v0, "cm":Landroid/text/ClipboardManager;
    invoke-virtual {v0, p1}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 485
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$24(Lcom/anfengde/epub/ui/BookView;)Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "Text copied to clipboard"

    const/16 v3, 0x32

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 486
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 487
    return-void
.end method

.method public currentReadingData(II)V
    .locals 3
    .param p1, "num"    # I
    .param p2, "pages"    # I

    .prologue
    .line 384
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0, p1}, Lcom/anfengde/epub/ui/BookView;->access$11(Lcom/anfengde/epub/ui/BookView;I)V

    .line 385
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0, p2}, Lcom/anfengde/epub/ui/BookView;->access$12(Lcom/anfengde/epub/ui/BookView;I)V

    .line 386
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$13(Lcom/anfengde/epub/ui/BookView;)I

    move-result v1

    mul-int/lit16 v1, v1, 0x2710

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$14(Lcom/anfengde/epub/ui/BookView;)I

    move-result v2

    div-int/2addr v1, v2

    invoke-static {v0, v1}, Lcom/anfengde/epub/ui/BookView;->access$2(Lcom/anfengde/epub/ui/BookView;I)V

    .line 387
    return-void
.end method

.method public deleteBooks(Ljava/lang/String;)V
    .locals 8
    .param p1, "bookString"    # Ljava/lang/String;

    .prologue
    .line 427
    new-instance v2, Lcom/anfengde/epub/db/DBDriver;

    iget-object v6, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v6}, Lcom/anfengde/epub/ui/BookView;->access$24(Lcom/anfengde/epub/ui/BookView;)Landroid/content/Context;

    move-result-object v6

    invoke-direct {v2, v6}, Lcom/anfengde/epub/db/DBDriver;-><init>(Landroid/content/Context;)V

    .line 428
    .local v2, "dbdriver":Lcom/anfengde/epub/db/DBDriver;
    invoke-virtual {v2}, Lcom/anfengde/epub/db/DBDriver;->getAllBooks()Ljava/util/List;

    move-result-object v1

    .line 429
    .local v1, "bookArray":Ljava/util/List;, "Ljava/util/List<Lcom/anfengde/epub/db/DBBooks;>;"
    const-string/jumbo v6, "afd"

    invoke-virtual {p1, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 430
    .local v5, "index":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v6, v5

    if-lt v4, v6, :cond_0

    .line 440
    invoke-virtual {v2}, Lcom/anfengde/epub/db/DBDriver;->close()V

    .line 441
    iget-object v6, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v6}, Lcom/anfengde/epub/ui/BookView;->access$25(Lcom/anfengde/epub/ui/BookView;)V

    .line 442
    iget-object v6, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v6}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v6

    const-string/jumbo v7, "javascript:$(\'.afd_selectBg\').show()"

    invoke-virtual {v6, v7}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 443
    return-void

    .line 431
    :cond_0
    aget-object v6, v5, v4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/anfengde/epub/db/DBBooks;

    .line 432
    .local v0, "book":Lcom/anfengde/epub/db/DBBooks;
    invoke-virtual {v2, v0}, Lcom/anfengde/epub/db/DBDriver;->deleteBook(Lcom/anfengde/epub/db/DBBooks;)V

    .line 433
    iget-object v6, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v6}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v6

    iget-object v6, v6, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    .line 434
    invoke-virtual {v0}, Lcom/anfengde/epub/db/DBBooks;->getBookpath()Ljava/lang/String;

    move-result-object v7

    .line 433
    invoke-virtual {v6, v7}, Lcom/anfengde/epub/EPubJNI;->openEPubBook(Ljava/lang/String;)I

    move-result v3

    .line 435
    .local v3, "handle":I
    if-nez v3, :cond_1

    .line 436
    iget-object v6, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v6}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v6

    iget-object v6, v6, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    invoke-virtual {v6, v3}, Lcom/anfengde/epub/EPubJNI;->cleanEPubBookCache(I)I

    .line 430
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public downloadBook(Ljava/lang/String;)V
    .locals 3
    .param p1, "fileUrl"    # Ljava/lang/String;

    .prologue
    .line 478
    new-instance v0, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;

    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;-><init>(Lcom/anfengde/epub/ui/BookView;Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 479
    return-void
.end method

.method public downloadCancel()V
    .locals 2

    .prologue
    .line 508
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/anfengde/epub/ui/BookView;->access$33(Lcom/anfengde/epub/ui/BookView;Z)V

    .line 509
    return-void
.end method

.method public exit()V
    .locals 1

    .prologue
    .line 346
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$0(Lcom/anfengde/epub/ui/BookView;)V

    .line 347
    return-void
.end method

.method public getAllBooks()V
    .locals 1

    .prologue
    .line 458
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$25(Lcom/anfengde/epub/ui/BookView;)V

    .line 459
    return-void
.end method

.method public getChapter()V
    .locals 6

    .prologue
    .line 373
    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v2

    iget-object v2, v2, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v2}, Lcom/anfengde/epub/core/value/TableOfContent;->getChapterList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 374
    .local v1, "num":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_0

    .line 381
    return-void

    .line 375
    :cond_0
    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "javascript:getChapter(\'"

    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 376
    iget-object v5, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v2

    iget-object v2, v2, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v2}, Lcom/anfengde/epub/core/value/TableOfContent;->getChapterList()Ljava/util/ArrayList;

    move-result-object v2

    .line 377
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/anfengde/epub/EPubChapter;

    iget-object v2, v2, Lcom/anfengde/epub/EPubChapter;->title:Ljava/lang/String;

    .line 376
    invoke-virtual {v5, v2}, Lcom/anfengde/epub/ui/BookView;->jsStringEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 377
    const-string/jumbo v4, "\',"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 378
    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v2

    iget-object v2, v2, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v2}, Lcom/anfengde/epub/core/value/TableOfContent;->getChapterList()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/anfengde/epub/EPubChapter;

    iget v2, v2, Lcom/anfengde/epub/EPubChapter;->level:I

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 379
    const-string/jumbo v4, ","

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, ","

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v4}, Lcom/anfengde/epub/ui/BookView;->access$4(Lcom/anfengde/epub/ui/BookView;)I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, ")"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 375
    invoke-virtual {v3, v2}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 374
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public jsImportBook(Ljava/lang/String;)V
    .locals 3
    .param p1, "epubBookPath"    # Ljava/lang/String;

    .prologue
    .line 450
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$24(Lcom/anfengde/epub/ui/BookView;)Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "Importing..."

    .line 451
    const/4 v2, 0x1

    .line 450
    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 451
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 452
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0, p1}, Lcom/anfengde/epub/ui/BookView;->access$27(Lcom/anfengde/epub/ui/BookView;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 455
    :goto_0
    return-void

    .line 454
    :cond_0
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$25(Lcom/anfengde/epub/ui/BookView;)V

    goto :goto_0
.end method

.method public jsOpenChapter(ILjava/lang/String;)V
    .locals 3
    .param p1, "i"    # I
    .param p2, "order"    # Ljava/lang/String;

    .prologue
    .line 355
    const-string/jumbo v0, "preceding"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 356
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    const/16 v1, 0x2710

    invoke-static {v0, v1}, Lcom/anfengde/epub/ui/BookView;->access$2(Lcom/anfengde/epub/ui/BookView;I)V

    .line 359
    :goto_0
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0, p1}, Lcom/anfengde/epub/ui/BookView;->access$3(Lcom/anfengde/epub/ui/BookView;I)V

    .line 360
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$4(Lcom/anfengde/epub/ui/BookView;)I

    move-result v1

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/anfengde/epub/ui/BookView;->access$6(Lcom/anfengde/epub/ui/BookView;ILandroid/webkit/WebView;)V

    .line 361
    return-void

    .line 358
    :cond_0
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/anfengde/epub/ui/BookView;->access$2(Lcom/anfengde/epub/ui/BookView;I)V

    goto :goto_0
.end method

.method public message(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 500
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$24(Lcom/anfengde/epub/ui/BookView;)Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x32

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 501
    return-void
.end method

.method public openBook(Ljava/lang/String;)V
    .locals 4
    .param p1, "epubBookPath"    # Ljava/lang/String;

    .prologue
    .line 462
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$24(Lcom/anfengde/epub/ui/BookView;)Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "Opening book..."

    .line 463
    const/4 v3, 0x1

    .line 462
    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    .line 463
    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 464
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v1

    iget-object v1, v1, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v1}, Lcom/anfengde/epub/core/value/TableOfContent;->clearChapter()V

    .line 465
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1, p1}, Lcom/anfengde/epub/ui/BookView;->access$28(Lcom/anfengde/epub/ui/BookView;Ljava/lang/String;)V

    .line 467
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v1

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$29(Lcom/anfengde/epub/ui/BookView;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/anfengde/epub/core/EPubDriver;->openBook(Ljava/lang/String;)I

    move-result v0

    .line 468
    .local v0, "ret":I
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1, v0}, Lcom/anfengde/epub/ui/BookView;->access$30(Lcom/anfengde/epub/ui/BookView;I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 475
    :goto_0
    return-void

    .line 471
    :cond_0
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$31(Lcom/anfengde/epub/ui/BookView;)V

    .line 473
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$4(Lcom/anfengde/epub/ui/BookView;)I

    move-result v2

    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v3}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/anfengde/epub/ui/BookView;->access$6(Lcom/anfengde/epub/ui/BookView;ILandroid/webkit/WebView;)V

    goto :goto_0
.end method

.method public openBookshelf()V
    .locals 1

    .prologue
    .line 350
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$1(Lcom/anfengde/epub/ui/BookView;)V

    .line 351
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-virtual {v0}, Lcom/anfengde/epub/ui/BookView;->openShelf()V

    .line 352
    return-void
.end method

.method public resizePage()V
    .locals 4

    .prologue
    .line 411
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "javascript:getAndroidVersion("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 412
    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$16(Lcom/anfengde/epub/ui/BookView;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ");"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 411
    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 413
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "javascript:getBookData("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$17(Lcom/anfengde/epub/ui/BookView;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 414
    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$18(Lcom/anfengde/epub/ui/BookView;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$15(Lcom/anfengde/epub/ui/BookView;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$4(Lcom/anfengde/epub/ui/BookView;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 415
    const-string/jumbo v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v2

    iget-object v2, v2, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v2}, Lcom/anfengde/epub/core/value/TableOfContent;->getTotalSize()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ",\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 416
    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v3}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v3

    iget-object v3, v3, Lcom/anfengde/epub/core/EPubDriver;->mBook:Lcom/anfengde/epub/core/value/BookInfo;

    iget-object v3, v3, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v3, v3, Lcom/anfengde/epub/EPubMetadata;->identifier:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/anfengde/epub/ui/BookView;->jsStringEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 417
    const-string/jumbo v2, "\',\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$19(Lcom/anfengde/epub/ui/BookView;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\',\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 418
    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v3}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v3

    iget-object v3, v3, Lcom/anfengde/epub/core/EPubDriver;->mBook:Lcom/anfengde/epub/core/value/BookInfo;

    iget-object v3, v3, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v3, v3, Lcom/anfengde/epub/EPubMetadata;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/anfengde/epub/ui/BookView;->jsStringEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 419
    const-string/jumbo v2, "\');"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 413
    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 420
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "javascript:resizePage("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$20(Lcom/anfengde/epub/ui/BookView;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 421
    const-string/jumbo v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$21(Lcom/anfengde/epub/ui/BookView;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$22(Lcom/anfengde/epub/ui/BookView;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ",\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v2}, Lcom/anfengde/epub/ui/BookView;->access$23(Lcom/anfengde/epub/ui/BookView;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\');"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 420
    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 422
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    const-string/jumbo v1, ""

    invoke-static {v0, v1}, Lcom/anfengde/epub/ui/BookView;->access$9(Lcom/anfengde/epub/ui/BookView;Ljava/lang/String;)V

    .line 423
    return-void
.end method

.method public shareText(Ljava/lang/String;)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 491
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 492
    .local v0, "sendIntent":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.action.SEND"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 493
    const-string/jumbo v1, "android.intent.extra.TEXT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 494
    const-string/jumbo v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 495
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$24(Lcom/anfengde/epub/ui/BookView;)Landroid/content/Context;

    move-result-object v1

    .line 496
    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-virtual {v2}, Lcom/anfengde/epub/ui/BookView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Lcom/anfengde/epub/ui/R$string;->send_to:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    .line 495
    invoke-static {v0, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 497
    return-void
.end method

.method public sliderBarListener(F)V
    .locals 8
    .param p1, "percent"    # F

    .prologue
    .line 394
    const/4 v1, 0x0

    .line 395
    .local v1, "tSize":I
    const/4 v2, 0x0

    .line 396
    .local v2, "tempSize":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v3}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v3

    iget-object v3, v3, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v3}, Lcom/anfengde/epub/core/value/TableOfContent;->getTotalSize()I

    move-result v3

    if-lt v0, v3, :cond_0

    .line 404
    :goto_1
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    int-to-double v4, v2

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    mul-double/2addr v4, v6

    iget-object v6, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v6}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v6

    iget-object v6, v6, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    .line 405
    iget-object v7, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v7}, Lcom/anfengde/epub/ui/BookView;->access$4(Lcom/anfengde/epub/ui/BookView;)I

    move-result v7

    invoke-virtual {v6, v7}, Lcom/anfengde/epub/core/value/TableOfContent;->getChapter(I)Lcom/anfengde/epub/EPubChapter;

    move-result-object v6

    iget v6, v6, Lcom/anfengde/epub/EPubChapter;->csize:I

    int-to-double v6, v6

    div-double/2addr v4, v6

    const-wide v6, 0x40c3880000000000L    # 10000.0

    mul-double/2addr v4, v6

    double-to-int v4, v4

    .line 404
    invoke-static {v3, v4}, Lcom/anfengde/epub/ui/BookView;->access$2(Lcom/anfengde/epub/ui/BookView;I)V

    .line 406
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    iget-object v4, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v4}, Lcom/anfengde/epub/ui/BookView;->access$4(Lcom/anfengde/epub/ui/BookView;)I

    move-result v4

    iget-object v5, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v5}, Lcom/anfengde/epub/ui/BookView;->access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/anfengde/epub/ui/BookView;->access$6(Lcom/anfengde/epub/ui/BookView;ILandroid/webkit/WebView;)V

    .line 407
    return-void

    .line 397
    :cond_0
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v3}, Lcom/anfengde/epub/ui/BookView;->access$15(Lcom/anfengde/epub/ui/BookView;)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, p1

    int-to-float v4, v1

    sub-float/2addr v3, v4

    float-to-int v2, v3

    .line 398
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v3}, Lcom/anfengde/epub/ui/BookView;->access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;

    move-result-object v3

    iget-object v3, v3, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v3, v0}, Lcom/anfengde/epub/core/value/TableOfContent;->getChapter(I)Lcom/anfengde/epub/EPubChapter;

    move-result-object v3

    iget v3, v3, Lcom/anfengde/epub/EPubChapter;->csize:I

    add-int/2addr v1, v3

    .line 399
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v3}, Lcom/anfengde/epub/ui/BookView;->access$15(Lcom/anfengde/epub/ui/BookView;)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, p1

    int-to-float v4, v1

    sub-float/2addr v3, v4

    float-to-int v3, v3

    if-gez v3, :cond_1

    .line 400
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v3, v0}, Lcom/anfengde/epub/ui/BookView;->access$3(Lcom/anfengde/epub/ui/BookView;I)V

    goto :goto_1

    .line 396
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public textToSpeak(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 504
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v0, p1}, Lcom/anfengde/epub/ui/BookView;->access$32(Lcom/anfengde/epub/ui/BookView;Ljava/lang/String;)V

    .line 505
    return-void
.end method

.method public ttsSetting()V
    .locals 2

    .prologue
    .line 512
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 513
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "com.android.settings.TTS_SETTINGS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 514
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 515
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;->this$0:Lcom/anfengde/epub/ui/BookView;

    invoke-static {v1}, Lcom/anfengde/epub/ui/BookView;->access$24(Lcom/anfengde/epub/ui/BookView;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 516
    return-void
.end method
