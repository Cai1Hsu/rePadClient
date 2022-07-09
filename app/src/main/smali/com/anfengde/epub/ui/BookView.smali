.class public Lcom/anfengde/epub/ui/BookView;
.super Landroid/widget/LinearLayout;
.source "BookView.java"

# interfaces
.implements Landroid/speech/tts/TextToSpeech$OnInitListener;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "NewApi"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/anfengde/epub/ui/BookView$DownloadFilesTask;,
        Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;
    }
.end annotation


# static fields
.field private static final LOGTAG:Ljava/lang/String; = "BookView"

.field private static final allowToModifyAd:Ljava/lang/Boolean;


# instance fields
.field private adUnitId:Ljava/lang/String;

.field private adView:Lcom/google/ads/AdView;

.field private afd_cachePath:Ljava/lang/String;

.field private afd_curContext:Landroid/content/Context;

.field private afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

.field private afd_tableContentView:Landroid/widget/FrameLayout;

.field private afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

.field private androidVersion:I

.field private bookListView:Landroid/widget/ListView;

.field private bookPath:Ljava/lang/String;

.field private bookSize:I

.field private chapterSize:I

.field private clickBk:Ljava/lang/String;

.field private currentPageNum:I

.field private current_chapter:I

.field private current_percent:I

.field private displayAd:Ljava/lang/Boolean;

.field private downloadCancel:Z

.field private final errorMessage:Ljava/lang/String;

.field private handler:Landroid/os/Handler;

.field private isDownloading:Z

.field private mBooksWindow:Landroid/widget/PopupWindow;

.field private mDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private mDir:Ljava/lang/String;

.field private pIndex:I

.field private sIndex:I

.field private size:I

.field private totalPages:I

.field private tts:Landroid/speech/tts/TextToSpeech;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/anfengde/epub/ui/BookView;->allowToModifyAd:Ljava/lang/Boolean;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 135
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 69
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, p0, Lcom/anfengde/epub/ui/BookView;->displayAd:Ljava/lang/Boolean;

    .line 70
    const-string/jumbo v2, "a1502c86e3f3fcf"

    iput-object v2, p0, Lcom/anfengde/epub/ui/BookView;->adUnitId:Ljava/lang/String;

    .line 94
    const-string/jumbo v2, ""

    iput-object v2, p0, Lcom/anfengde/epub/ui/BookView;->afd_cachePath:Ljava/lang/String;

    .line 108
    iput v3, p0, Lcom/anfengde/epub/ui/BookView;->currentPageNum:I

    .line 119
    const-string/jumbo v2, "/sdcard"

    iput-object v2, p0, Lcom/anfengde/epub/ui/BookView;->mDir:Ljava/lang/String;

    .line 122
    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    iput-object v2, p0, Lcom/anfengde/epub/ui/BookView;->handler:Landroid/os/Handler;

    .line 126
    const-string/jumbo v2, "Download Error!"

    iput-object v2, p0, Lcom/anfengde/epub/ui/BookView;->errorMessage:Ljava/lang/String;

    .line 127
    iput-boolean v4, p0, Lcom/anfengde/epub/ui/BookView;->downloadCancel:Z

    .line 128
    iput-boolean v4, p0, Lcom/anfengde/epub/ui/BookView;->isDownloading:Z

    .line 136
    invoke-virtual {p0, v3}, Lcom/anfengde/epub/ui/BookView;->setOrientation(I)V

    .line 137
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    .line 139
    new-instance v2, Landroid/speech/tts/TextToSpeech;

    invoke-direct {v2, p1, p0}, Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;Landroid/speech/tts/TextToSpeech$OnInitListener;)V

    iput-object v2, p0, Lcom/anfengde/epub/ui/BookView;->tts:Landroid/speech/tts/TextToSpeech;

    .line 141
    new-instance v2, Lcom/anfengde/epub/ui/EPubWebView;

    invoke-direct {v2, p1}, Lcom/anfengde/epub/ui/EPubWebView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    .line 142
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .local v1, "metrics":Landroid/util/DisplayMetrics;
    move-object v2, p1

    .line 143
    check-cast v2, Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    .line 144
    invoke-virtual {v2, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 147
    const-string/jumbo v2, "layout_inflater"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 146
    check-cast v0, Landroid/view/LayoutInflater;

    .line 148
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v2, Lcom/anfengde/epub/ui/R$layout;->afd_bookview:I

    invoke-virtual {v0, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 149
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->init()V

    .line 150
    return-void
.end method

.method static synthetic access$0(Lcom/anfengde/epub/ui/BookView;)V
    .locals 0

    .prologue
    .line 326
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->exitApp()V

    return-void
.end method

.method static synthetic access$1(Lcom/anfengde/epub/ui/BookView;)V
    .locals 0

    .prologue
    .line 553
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->saveStatusData()V

    return-void
.end method

.method static synthetic access$10(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/core/EPubDriver;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    return-object v0
.end method

.method static synthetic access$11(Lcom/anfengde/epub/ui/BookView;I)V
    .locals 0

    .prologue
    .line 108
    iput p1, p0, Lcom/anfengde/epub/ui/BookView;->currentPageNum:I

    return-void
.end method

.method static synthetic access$12(Lcom/anfengde/epub/ui/BookView;I)V
    .locals 0

    .prologue
    .line 109
    iput p1, p0, Lcom/anfengde/epub/ui/BookView;->totalPages:I

    return-void
.end method

.method static synthetic access$13(Lcom/anfengde/epub/ui/BookView;)I
    .locals 1

    .prologue
    .line 108
    iget v0, p0, Lcom/anfengde/epub/ui/BookView;->currentPageNum:I

    return v0
.end method

.method static synthetic access$14(Lcom/anfengde/epub/ui/BookView;)I
    .locals 1

    .prologue
    .line 109
    iget v0, p0, Lcom/anfengde/epub/ui/BookView;->totalPages:I

    return v0
.end method

.method static synthetic access$15(Lcom/anfengde/epub/ui/BookView;)I
    .locals 1

    .prologue
    .line 116
    iget v0, p0, Lcom/anfengde/epub/ui/BookView;->bookSize:I

    return v0
.end method

.method static synthetic access$16(Lcom/anfengde/epub/ui/BookView;)I
    .locals 1

    .prologue
    .line 124
    iget v0, p0, Lcom/anfengde/epub/ui/BookView;->androidVersion:I

    return v0
.end method

.method static synthetic access$17(Lcom/anfengde/epub/ui/BookView;)I
    .locals 1

    .prologue
    .line 114
    iget v0, p0, Lcom/anfengde/epub/ui/BookView;->size:I

    return v0
.end method

.method static synthetic access$18(Lcom/anfengde/epub/ui/BookView;)I
    .locals 1

    .prologue
    .line 115
    iget v0, p0, Lcom/anfengde/epub/ui/BookView;->chapterSize:I

    return v0
.end method

.method static synthetic access$19(Lcom/anfengde/epub/ui/BookView;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_cachePath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2(Lcom/anfengde/epub/ui/BookView;I)V
    .locals 0

    .prologue
    .line 111
    iput p1, p0, Lcom/anfengde/epub/ui/BookView;->current_percent:I

    return-void
.end method

.method static synthetic access$20(Lcom/anfengde/epub/ui/BookView;)I
    .locals 1

    .prologue
    .line 111
    iget v0, p0, Lcom/anfengde/epub/ui/BookView;->current_percent:I

    return v0
.end method

.method static synthetic access$21(Lcom/anfengde/epub/ui/BookView;)I
    .locals 1

    .prologue
    .line 112
    iget v0, p0, Lcom/anfengde/epub/ui/BookView;->pIndex:I

    return v0
.end method

.method static synthetic access$22(Lcom/anfengde/epub/ui/BookView;)I
    .locals 1

    .prologue
    .line 113
    iget v0, p0, Lcom/anfengde/epub/ui/BookView;->sIndex:I

    return v0
.end method

.method static synthetic access$23(Lcom/anfengde/epub/ui/BookView;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->clickBk:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$24(Lcom/anfengde/epub/ui/BookView;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$25(Lcom/anfengde/epub/ui/BookView;)V
    .locals 0

    .prologue
    .line 562
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->createBookshelf()V

    return-void
.end method

.method static synthetic access$26(Lcom/anfengde/epub/ui/BookView;)V
    .locals 0

    .prologue
    .line 601
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->showAddbooksWindow()V

    return-void
.end method

.method static synthetic access$27(Lcom/anfengde/epub/ui/BookView;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 519
    invoke-direct {p0, p1}, Lcom/anfengde/epub/ui/BookView;->importBook(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$28(Lcom/anfengde/epub/ui/BookView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 118
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookView;->bookPath:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$29(Lcom/anfengde/epub/ui/BookView;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->bookPath:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3(Lcom/anfengde/epub/ui/BookView;I)V
    .locals 0

    .prologue
    .line 110
    iput p1, p0, Lcom/anfengde/epub/ui/BookView;->current_chapter:I

    return-void
.end method

.method static synthetic access$30(Lcom/anfengde/epub/ui/BookView;I)Z
    .locals 1

    .prologue
    .line 590
    invoke-direct {p0, p1}, Lcom/anfengde/epub/ui/BookView;->errorMessage(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$31(Lcom/anfengde/epub/ui/BookView;)V
    .locals 0

    .prologue
    .line 541
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->readReadingStatus()V

    return-void
.end method

.method static synthetic access$32(Lcom/anfengde/epub/ui/BookView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 789
    invoke-direct {p0, p1}, Lcom/anfengde/epub/ui/BookView;->speaking(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$33(Lcom/anfengde/epub/ui/BookView;Z)V
    .locals 0

    .prologue
    .line 127
    iput-boolean p1, p0, Lcom/anfengde/epub/ui/BookView;->downloadCancel:Z

    return-void
.end method

.method static synthetic access$34(Lcom/anfengde/epub/ui/BookView;)Z
    .locals 1

    .prologue
    .line 128
    iget-boolean v0, p0, Lcom/anfengde/epub/ui/BookView;->isDownloading:Z

    return v0
.end method

.method static synthetic access$35(Lcom/anfengde/epub/ui/BookView;Z)V
    .locals 0

    .prologue
    .line 128
    iput-boolean p1, p0, Lcom/anfengde/epub/ui/BookView;->isDownloading:Z

    return-void
.end method

.method static synthetic access$36(Lcom/anfengde/epub/ui/BookView;)Z
    .locals 1

    .prologue
    .line 804
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->isOnline()Z

    move-result v0

    return v0
.end method

.method static synthetic access$37(Lcom/anfengde/epub/ui/BookView;)Z
    .locals 1

    .prologue
    .line 127
    iget-boolean v0, p0, Lcom/anfengde/epub/ui/BookView;->downloadCancel:Z

    return v0
.end method

.method static synthetic access$38(Lcom/anfengde/epub/ui/BookView;)V
    .locals 0

    .prologue
    .line 161
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->doAdMob()V

    return-void
.end method

.method static synthetic access$39(Lcom/anfengde/epub/ui/BookView;)Ljava/util/List;
    .locals 1

    .prologue
    .line 120
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->mDataList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$4(Lcom/anfengde/epub/ui/BookView;)I
    .locals 1

    .prologue
    .line 110
    iget v0, p0, Lcom/anfengde/epub/ui/BookView;->current_chapter:I

    return v0
.end method

.method static synthetic access$40(Lcom/anfengde/epub/ui/BookView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 119
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookView;->mDir:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$41(Lcom/anfengde/epub/ui/BookView;)Ljava/util/List;
    .locals 1

    .prologue
    .line 640
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->getData()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$42(Lcom/anfengde/epub/ui/BookView;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 120
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookView;->mDataList:Ljava/util/List;

    return-void
.end method

.method static synthetic access$43(Lcom/anfengde/epub/ui/BookView;)Landroid/widget/ListView;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->bookListView:Landroid/widget/ListView;

    return-object v0
.end method

.method static synthetic access$44(Lcom/anfengde/epub/ui/BookView;)Landroid/widget/PopupWindow;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->mBooksWindow:Landroid/widget/PopupWindow;

    return-object v0
.end method

.method static synthetic access$5(Lcom/anfengde/epub/ui/BookView;)Lcom/anfengde/epub/ui/EPubWebView;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    return-object v0
.end method

.method static synthetic access$6(Lcom/anfengde/epub/ui/BookView;ILandroid/webkit/WebView;)V
    .locals 0

    .prologue
    .line 267
    invoke-direct {p0, p1, p2}, Lcom/anfengde/epub/ui/BookView;->openChapter(ILandroid/webkit/WebView;)V

    return-void
.end method

.method static synthetic access$7(Lcom/anfengde/epub/ui/BookView;I)V
    .locals 0

    .prologue
    .line 112
    iput p1, p0, Lcom/anfengde/epub/ui/BookView;->pIndex:I

    return-void
.end method

.method static synthetic access$8(Lcom/anfengde/epub/ui/BookView;I)V
    .locals 0

    .prologue
    .line 113
    iput p1, p0, Lcom/anfengde/epub/ui/BookView;->sIndex:I

    return-void
.end method

.method static synthetic access$9(Lcom/anfengde/epub/ui/BookView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 117
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookView;->clickBk:Ljava/lang/String;

    return-void
.end method

.method private closeBook()V
    .locals 1

    .prologue
    .line 242
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    invoke-virtual {v0}, Lcom/anfengde/epub/core/EPubDriver;->closeBook()I

    .line 243
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    invoke-virtual {v0}, Lcom/anfengde/epub/core/EPubDriver;->cleanUp()V

    .line 244
    return-void
.end method

.method private copyBooksToSdcard(Ljava/lang/String;)V
    .locals 11
    .param p1, "bookname"    # Ljava/lang/String;

    .prologue
    .line 856
    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v9, "/mnt/sdcard/epub/"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 859
    .local v7, "tempPath":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    const-string/jumbo v8, "/mnt/sdcard/epub"

    invoke-direct {v1, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 860
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_0

    .line 861
    invoke-virtual {v1}, Ljava/io/File;->mkdir()Z

    .line 864
    :cond_0
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 865
    .local v3, "f":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_1

    .line 867
    :try_start_0
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 868
    iget-object v8, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    invoke-virtual {v8}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v8

    .line 869
    new-instance v9, Ljava/lang/StringBuilder;

    const-string/jumbo v10, "books/"

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 868
    invoke-virtual {v8, v9}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v5

    .line 870
    .local v5, "is":Ljava/io/InputStream;
    invoke-virtual {v5}, Ljava/io/InputStream;->available()I

    move-result v6

    .line 871
    .local v6, "size":I
    new-array v0, v6, [B

    .line 872
    .local v0, "buffer":[B
    invoke-virtual {v5, v0}, Ljava/io/InputStream;->read([B)I

    .line 873
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 875
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 876
    .local v4, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {v4, v0}, Ljava/io/FileOutputStream;->write([B)V

    .line 877
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    .line 878
    invoke-direct {p0, v7}, Lcom/anfengde/epub/ui/BookView;->importBook(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 883
    .end local v0    # "buffer":[B
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v5    # "is":Ljava/io/InputStream;
    .end local v6    # "size":I
    :cond_1
    :goto_0
    return-void

    .line 879
    :catch_0
    move-exception v2

    .line 880
    .local v2, "e":Ljava/lang/Exception;
    const-string/jumbo v8, "copy error"

    const-string/jumbo v9, "can not copy the book to sdcard!"

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private createBookshelf()V
    .locals 9

    .prologue
    .line 563
    iget-object v6, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    const-string/jumbo v7, "javascript:$(\'#afd_books\').empty();"

    invoke-virtual {v6, v7}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 564
    new-instance v1, Lcom/anfengde/epub/db/DBDriver;

    iget-object v6, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    invoke-direct {v1, v6}, Lcom/anfengde/epub/db/DBDriver;-><init>(Landroid/content/Context;)V

    .line 565
    .local v1, "dbdriver":Lcom/anfengde/epub/db/DBDriver;
    invoke-virtual {v1}, Lcom/anfengde/epub/db/DBDriver;->getAllBooks()Ljava/util/List;

    move-result-object v0

    .line 566
    .local v0, "bookArray":Ljava/util/List;, "Ljava/util/List<Lcom/anfengde/epub/db/DBBooks;>;"
    invoke-virtual {v1}, Lcom/anfengde/epub/db/DBDriver;->close()V

    .line 567
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    if-lt v3, v6, :cond_0

    .line 588
    return-void

    .line 568
    :cond_0
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/anfengde/epub/db/DBBooks;

    invoke-virtual {v6}, Lcom/anfengde/epub/db/DBBooks;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/anfengde/epub/ui/BookView;->jsStringEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 569
    .local v5, "title":Ljava/lang/String;
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/anfengde/epub/db/DBBooks;

    invoke-virtual {v6}, Lcom/anfengde/epub/db/DBBooks;->getCoverimage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/anfengde/epub/ui/BookView;->jsStringEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 570
    .local v4, "image":Ljava/lang/String;
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/anfengde/epub/db/DBBooks;

    invoke-virtual {v6}, Lcom/anfengde/epub/db/DBBooks;->getCoverimage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/anfengde/epub/ui/BookView;->jsStringEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 571
    const-string/jumbo v7, "../image/afd_coverimg.png"

    .line 570
    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 571
    if-nez v6, :cond_1

    .line 572
    new-instance v2, Ljava/io/File;

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/anfengde/epub/db/DBBooks;

    .line 573
    invoke-virtual {v6}, Lcom/anfengde/epub/db/DBBooks;->getCoverimage()Ljava/lang/String;

    move-result-object v6

    .line 572
    invoke-virtual {p0, v6}, Lcom/anfengde/epub/ui/BookView;->jsStringEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 574
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_2

    .line 576
    const-string/jumbo v4, "../image/afd_coverimg.png"

    .line 581
    .end local v2    # "file":Ljava/io/File;
    :cond_1
    :goto_1
    iget-object v7, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    new-instance v8, Ljava/lang/StringBuilder;

    const-string/jumbo v6, "javascript:creatBookShelf(\'"

    invoke-direct {v8, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 582
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/anfengde/epub/db/DBBooks;

    invoke-virtual {v6}, Lcom/anfengde/epub/db/DBBooks;->getIdentifier()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/anfengde/epub/ui/BookView;->jsStringEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v8, "\',\'"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 583
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v8, "\',\'"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 584
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/anfengde/epub/db/DBBooks;

    invoke-virtual {v6}, Lcom/anfengde/epub/db/DBBooks;->getAuthor()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/anfengde/epub/ui/BookView;->jsStringEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v8, "\',\'"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 585
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v8, "\',\'"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    .line 586
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/anfengde/epub/db/DBBooks;

    invoke-virtual {v6}, Lcom/anfengde/epub/db/DBBooks;->getBookpath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/anfengde/epub/ui/BookView;->jsStringEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v8, "\');"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 581
    invoke-virtual {v7, v6}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 567
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 578
    .restart local v2    # "file":Ljava/io/File;
    :cond_2
    const-string/jumbo v5, " "

    goto :goto_1
.end method

.method private doAdMob()V
    .locals 6

    .prologue
    .line 162
    new-instance v2, Lcom/google/ads/AdView;

    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    sget-object v3, Lcom/google/ads/AdSize;->BANNER:Lcom/google/ads/AdSize;

    .line 163
    iget-object v4, p0, Lcom/anfengde/epub/ui/BookView;->adUnitId:Ljava/lang/String;

    invoke-direct {v2, v1, v3, v4}, Lcom/google/ads/AdView;-><init>(Landroid/app/Activity;Lcom/google/ads/AdSize;Ljava/lang/String;)V

    .line 162
    iput-object v2, p0, Lcom/anfengde/epub/ui/BookView;->adView:Lcom/google/ads/AdView;

    .line 164
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->adView:Lcom/google/ads/AdView;

    const/4 v2, 0x0

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 165
    const/4 v4, -0x1

    const/4 v5, -0x2

    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 164
    invoke-virtual {p0, v1, v2, v3}, Lcom/anfengde/epub/ui/BookView;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 166
    new-instance v0, Lcom/google/ads/AdRequest;

    invoke-direct {v0}, Lcom/google/ads/AdRequest;-><init>()V

    .line 168
    .local v0, "adRequest":Lcom/google/ads/AdRequest;
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->adView:Lcom/google/ads/AdView;

    invoke-virtual {v1, v0}, Lcom/google/ads/AdView;->loadAd(Lcom/google/ads/AdRequest;)V

    .line 169
    return-void
.end method

.method private errorMessage(I)Z
    .locals 3
    .param p1, "ret"    # I

    .prologue
    .line 591
    if-gtz p1, :cond_1

    .line 592
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    invoke-virtual {v1, p1}, Lcom/anfengde/epub/core/EPubDriver;->getErrorMessage(I)Ljava/lang/String;

    move-result-object v0

    .line 593
    .local v0, "errorMsg":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 594
    const-string/jumbo v0, "Unknown error"

    .line 595
    :cond_0
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    const/16 v2, 0x32

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 596
    const/4 v1, 0x1

    .line 598
    .end local v0    # "errorMsg":Ljava/lang/String;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private exitApp()V
    .locals 1

    .prologue
    .line 327
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    invoke-virtual {v0}, Lcom/anfengde/epub/core/EPubDriver;->cleanUp()V

    .line 328
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->tts:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->shutdown()V

    .line 329
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-virtual {v0}, Lcom/anfengde/epub/ui/EPubWebView;->destroy()V

    .line 330
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->closeBook()V

    .line 331
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 332
    return-void
.end method

.method private getData()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 641
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 642
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;>;"
    const/4 v5, 0x0

    .line 643
    .local v5, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v1, Ljava/io/File;

    iget-object v8, p0, Lcom/anfengde/epub/ui/BookView;->mDir:Ljava/lang/String;

    invoke-direct {v1, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 644
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 646
    .local v2, "files":[Ljava/io/File;
    iget-object v8, p0, Lcom/anfengde/epub/ui/BookView;->mDir:Ljava/lang/String;

    const-string/jumbo v9, "/"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_0

    .line 647
    new-instance v5, Ljava/util/HashMap;

    .end local v5    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 648
    .restart local v5    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v8, "title"

    const-string/jumbo v9, "Back to ../"

    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 649
    const-string/jumbo v8, "info"

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 650
    const-string/jumbo v8, "img"

    sget v9, Lcom/anfengde/epub/ui/R$drawable;->ex_folder:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 651
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 653
    :cond_0
    if-eqz v2, :cond_1

    .line 654
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v8, v2

    if-lt v3, v8, :cond_2

    .line 675
    .end local v3    # "i":I
    :cond_1
    return-object v4

    .line 655
    .restart local v3    # "i":I
    :cond_2
    new-instance v5, Ljava/util/HashMap;

    .end local v5    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 656
    .restart local v5    # "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string/jumbo v8, "title"

    aget-object v9, v2, v3

    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 657
    const-string/jumbo v8, "info"

    aget-object v9, v2, v3

    invoke-virtual {v9}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 658
    aget-object v8, v2, v3

    invoke-virtual {v8}, Ljava/io/File;->isDirectory()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 659
    const-string/jumbo v8, "img"

    sget v9, Lcom/anfengde/epub/ui/R$drawable;->ex_folder:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 672
    :goto_1
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 654
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 661
    :cond_4
    aget-object v8, v2, v3

    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    .line 662
    .local v7, "tempPath":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v6

    .line 663
    .local v6, "size":I
    const/4 v8, 0x4

    if-le v6, v8, :cond_3

    .line 665
    add-int/lit8 v8, v6, -0x4

    invoke-virtual {v7, v8, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 667
    .local v0, "epub":Ljava/lang/String;
    const-string/jumbo v8, "epub"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 668
    const-string/jumbo v8, "img"

    sget v9, Lcom/anfengde/epub/ui/R$drawable;->ex_doc:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v5, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method private getInnerBooks()V
    .locals 7

    .prologue
    .line 835
    iget-object v5, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 837
    .local v0, "assetManager":Landroid/content/res/AssetManager;
    :try_start_0
    const-string/jumbo v5, "books"

    invoke-virtual {v0, v5}, Landroid/content/res/AssetManager;->list(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 838
    .local v2, "files":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v2

    if-lt v3, v5, :cond_0

    .line 852
    .end local v2    # "files":[Ljava/lang/String;
    .end local v3    # "i":I
    :goto_1
    return-void

    .line 839
    .restart local v2    # "files":[Ljava/lang/String;
    .restart local v3    # "i":I
    :cond_0
    aget-object v4, v2, v3

    .line 840
    .local v4, "temp":Ljava/lang/String;
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x5

    if-le v5, v6, :cond_1

    .line 841
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x5

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, ".epub"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 843
    aget-object v5, v2, v3

    invoke-direct {p0, v5}, Lcom/anfengde/epub/ui/BookView;->copyBooksToSdcard(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 838
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 847
    .end local v2    # "files":[Ljava/lang/String;
    .end local v3    # "i":I
    .end local v4    # "temp":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 849
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1
.end method

.method private importBook(Ljava/lang/String;)Z
    .locals 6
    .param p1, "epubBookPath"    # Ljava/lang/String;

    .prologue
    .line 520
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    invoke-virtual {v3, p1}, Lcom/anfengde/epub/core/EPubDriver;->openBook(Ljava/lang/String;)I

    move-result v1

    .line 521
    .local v1, "ret":I
    if-nez v1, :cond_0

    .line 522
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    const-string/jumbo v4, "Import book error!"

    const/16 v5, 0x32

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 523
    const/4 v3, 0x0

    .line 535
    :goto_0
    return v3

    .line 525
    :cond_0
    new-instance v2, Lcom/anfengde/epub/db/DBBooks;

    invoke-direct {v2}, Lcom/anfengde/epub/db/DBBooks;-><init>()V

    .line 526
    .local v2, "testBook":Lcom/anfengde/epub/db/DBBooks;
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v3, v3, Lcom/anfengde/epub/core/EPubDriver;->mBook:Lcom/anfengde/epub/core/value/BookInfo;

    iget-object v3, v3, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v3, v3, Lcom/anfengde/epub/EPubMetadata;->identifier:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/anfengde/epub/db/DBBooks;->setIdentifier(Ljava/lang/String;)V

    .line 527
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v3, v3, Lcom/anfengde/epub/core/EPubDriver;->mBook:Lcom/anfengde/epub/core/value/BookInfo;

    iget-object v3, v3, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v3, v3, Lcom/anfengde/epub/EPubMetadata;->creator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/anfengde/epub/db/DBBooks;->setAuthor(Ljava/lang/String;)V

    .line 528
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    invoke-virtual {v3}, Lcom/anfengde/epub/core/EPubDriver;->getCoverImg()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/anfengde/epub/db/DBBooks;->setCoverimage(Ljava/lang/String;)V

    .line 529
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v3, v3, Lcom/anfengde/epub/core/EPubDriver;->mBook:Lcom/anfengde/epub/core/value/BookInfo;

    iget-object v3, v3, Lcom/anfengde/epub/core/value/BookInfo;->metadata:Lcom/anfengde/epub/EPubMetadata;

    iget-object v3, v3, Lcom/anfengde/epub/EPubMetadata;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/anfengde/epub/db/DBBooks;->setName(Ljava/lang/String;)V

    .line 530
    invoke-virtual {v2, p1}, Lcom/anfengde/epub/db/DBBooks;->setBookpath(Ljava/lang/String;)V

    .line 532
    new-instance v0, Lcom/anfengde/epub/db/DBDriver;

    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    invoke-direct {v0, v3}, Lcom/anfengde/epub/db/DBDriver;-><init>(Landroid/content/Context;)V

    .line 533
    .local v0, "dbdriver":Lcom/anfengde/epub/db/DBDriver;
    invoke-virtual {v0, v2}, Lcom/anfengde/epub/db/DBDriver;->addBook(Lcom/anfengde/epub/db/DBBooks;)V

    .line 534
    invoke-virtual {v0}, Lcom/anfengde/epub/db/DBDriver;->close()V

    .line 535
    const/4 v3, 0x1

    goto :goto_0
.end method

.method private init()V
    .locals 3

    .prologue
    .line 250
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/anfengde/epub/ui/BookView;->setFocusable(Z)V

    .line 251
    invoke-virtual {p0}, Lcom/anfengde/epub/ui/BookView;->requestFocus()Z

    .line 253
    sget v0, Lcom/anfengde/epub/ui/R$id;->afd_contentLayout:I

    invoke-virtual {p0, v0}, Lcom/anfengde/epub/ui/BookView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 252
    iput-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_tableContentView:Landroid/widget/FrameLayout;

    .line 254
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_tableContentView:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-virtual {v1}, Lcom/anfengde/epub/ui/EPubWebView;->getLayout()Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 255
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    .line 256
    new-instance v1, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;

    invoke-direct {v1, p0}, Lcom/anfengde/epub/ui/BookView$JavaScriptInterface;-><init>(Lcom/anfengde/epub/ui/BookView;)V

    const-string/jumbo v2, "Android"

    invoke-virtual {v0, v1, v2}, Lcom/anfengde/epub/ui/EPubWebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 257
    return-void
.end method

.method private isOnline()Z
    .locals 4

    .prologue
    .line 805
    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    .line 806
    const-string/jumbo v3, "connectivity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 805
    check-cast v0, Landroid/net/ConnectivityManager;

    .line 807
    .local v0, "cm":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 808
    .local v1, "netInfo":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 809
    const/4 v2, 0x1

    .line 811
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private openChapter(ILandroid/webkit/WebView;)V
    .locals 9
    .param p1, "chapNo"    # I
    .param p2, "webView"    # Landroid/webkit/WebView;

    .prologue
    const/4 v8, 0x0

    .line 269
    iget-object v5, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    iput-boolean v8, v5, Lcom/anfengde/epub/ui/EPubWebView;->backReadingPage:Z

    .line 270
    const/4 v1, 0x0

    .line 271
    .local v1, "chapter":Lcom/anfengde/epub/EPubChapter;
    const/4 v0, 0x0

    .line 272
    .local v0, "abChapterPath":Ljava/lang/String;
    const/4 v4, 0x0

    .line 273
    .local v4, "subChapterPath":Ljava/lang/String;
    iget-object v5, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v5, v5, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v5, p1}, Lcom/anfengde/epub/core/value/TableOfContent;->getChapter(I)Lcom/anfengde/epub/EPubChapter;

    move-result-object v1

    .line 274
    iget-object v5, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    invoke-virtual {v5}, Lcom/anfengde/epub/core/EPubDriver;->getBookSize()I

    move-result v5

    iput v5, p0, Lcom/anfengde/epub/ui/BookView;->bookSize:I

    .line 276
    :goto_0
    iget v5, p0, Lcom/anfengde/epub/ui/BookView;->bookSize:I

    if-eqz v5, :cond_0

    iget v5, v1, Lcom/anfengde/epub/EPubChapter;->csize:I

    if-eqz v5, :cond_0

    .line 289
    iget-object v4, v1, Lcom/anfengde/epub/EPubChapter;->href:Ljava/lang/String;

    .line 290
    new-instance v5, Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v6, v6, Lcom/anfengde/epub/core/EPubDriver;->mBook:Lcom/anfengde/epub/core/value/BookInfo;

    invoke-virtual {v6}, Lcom/anfengde/epub/core/value/BookInfo;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 292
    iput v8, p0, Lcom/anfengde/epub/ui/BookView;->size:I

    .line 293
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-lt v3, p1, :cond_1

    .line 296
    iget v5, v1, Lcom/anfengde/epub/EPubChapter;->csize:I

    iput v5, p0, Lcom/anfengde/epub/ui/BookView;->chapterSize:I

    .line 297
    iget-object v5, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-virtual {v5, v0}, Lcom/anfengde/epub/ui/EPubWebView;->loadDataWithString(Ljava/lang/String;)V

    .line 298
    iget-object v5, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    iput-boolean v8, v5, Lcom/anfengde/epub/ui/EPubWebView;->onBookshelf:Z

    .line 299
    return-void

    .line 278
    .end local v3    # "i":I
    :cond_0
    const-wide/16 v6, 0x32

    :try_start_0
    invoke-static {v6, v7}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 283
    :goto_2
    iget-object v5, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v5, v5, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v5}, Lcom/anfengde/epub/core/value/TableOfContent;->clearChapter()V

    .line 284
    iget-object v5, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v6, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget v6, v6, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    invoke-virtual {v5, v6}, Lcom/anfengde/epub/core/EPubDriver;->getToc(I)I

    .line 285
    iget-object v5, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v5, v5, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v5, p1}, Lcom/anfengde/epub/core/value/TableOfContent;->getChapter(I)Lcom/anfengde/epub/EPubChapter;

    move-result-object v1

    .line 286
    iget-object v5, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    invoke-virtual {v5}, Lcom/anfengde/epub/core/EPubDriver;->getBookSize()I

    move-result v5

    iput v5, p0, Lcom/anfengde/epub/ui/BookView;->bookSize:I

    goto :goto_0

    .line 279
    :catch_0
    move-exception v2

    .line 281
    .local v2, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_2

    .line 294
    .end local v2    # "e":Ljava/lang/InterruptedException;
    .restart local v3    # "i":I
    :cond_1
    iget v5, p0, Lcom/anfengde/epub/ui/BookView;->size:I

    iget-object v6, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v6, v6, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v6, v3}, Lcom/anfengde/epub/core/value/TableOfContent;->getChapter(I)Lcom/anfengde/epub/EPubChapter;

    move-result-object v6

    iget v6, v6, Lcom/anfengde/epub/EPubChapter;->csize:I

    add-int/2addr v5, v6

    iput v5, p0, Lcom/anfengde/epub/ui/BookView;->size:I

    .line 293
    add-int/lit8 v3, v3, 0x1

    goto :goto_1
.end method

.method private readReadingStatus()V
    .locals 3

    .prologue
    .line 542
    new-instance v0, Lcom/anfengde/epub/EPubReadingStatus;

    invoke-direct {v0}, Lcom/anfengde/epub/EPubReadingStatus;-><init>()V

    .line 543
    .local v0, "status":Lcom/anfengde/epub/EPubReadingStatus;
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v1, v1, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    .line 544
    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget v2, v2, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    .line 543
    invoke-virtual {v1, v0, v2}, Lcom/anfengde/epub/EPubJNI;->getEPubReadingStatus(Lcom/anfengde/epub/EPubReadingStatus;I)I

    .line 546
    iget v1, v0, Lcom/anfengde/epub/EPubReadingStatus;->current_chapter:I

    iput v1, p0, Lcom/anfengde/epub/ui/BookView;->current_chapter:I

    .line 547
    iget v1, v0, Lcom/anfengde/epub/EPubReadingStatus;->current_percent:I

    iput v1, p0, Lcom/anfengde/epub/ui/BookView;->current_percent:I

    .line 548
    return-void
.end method

.method private saveStatusData()V
    .locals 3

    .prologue
    .line 554
    new-instance v0, Lcom/anfengde/epub/EPubReadingStatus;

    invoke-direct {v0}, Lcom/anfengde/epub/EPubReadingStatus;-><init>()V

    .line 556
    .local v0, "status":Lcom/anfengde/epub/EPubReadingStatus;
    iget v1, p0, Lcom/anfengde/epub/ui/BookView;->current_chapter:I

    iput v1, v0, Lcom/anfengde/epub/EPubReadingStatus;->current_chapter:I

    .line 557
    iget v1, p0, Lcom/anfengde/epub/ui/BookView;->current_percent:I

    iput v1, v0, Lcom/anfengde/epub/EPubReadingStatus;->current_percent:I

    .line 558
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v1, v1, Lcom/anfengde/epub/core/EPubDriver;->clsEPub:Lcom/anfengde/epub/EPubJNI;

    .line 559
    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget v2, v2, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    .line 558
    invoke-virtual {v1, v0, v2}, Lcom/anfengde/epub/EPubJNI;->updateEPubReadingStatus(Lcom/anfengde/epub/EPubReadingStatus;I)I

    .line 560
    return-void
.end method

.method private showAddbooksWindow()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, -0x1

    .line 602
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->getData()Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/anfengde/epub/ui/BookView;->mDataList:Ljava/util/List;

    .line 604
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    .line 605
    .local v2, "mLayoutInflater":Landroid/view/LayoutInflater;
    sget v3, Lcom/anfengde/epub/ui/R$layout;->afd_books_list:I

    .line 606
    const/4 v4, 0x0

    .line 605
    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 607
    .local v1, "booksWindow":Landroid/view/View;
    sget v3, Lcom/anfengde/epub/ui/R$id;->afd_book_list:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ListView;

    iput-object v3, p0, Lcom/anfengde/epub/ui/BookView;->bookListView:Landroid/widget/ListView;

    .line 608
    new-instance v0, Lcom/anfengde/epub/ui/BookListAdapter;

    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/anfengde/epub/ui/BookView;->mDataList:Ljava/util/List;

    invoke-direct {v0, v3, v4}, Lcom/anfengde/epub/ui/BookListAdapter;-><init>(Landroid/content/Context;Ljava/util/List;)V

    .line 610
    .local v0, "adapter":Lcom/anfengde/epub/ui/BookListAdapter;
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->bookListView:Landroid/widget/ListView;

    invoke-virtual {v3, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 611
    new-instance v3, Landroid/widget/PopupWindow;

    .line 612
    invoke-direct {v3, v1, v5, v5, v7}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;IIZ)V

    .line 611
    iput-object v3, p0, Lcom/anfengde/epub/ui/BookView;->mBooksWindow:Landroid/widget/PopupWindow;

    .line 613
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->mBooksWindow:Landroid/widget/PopupWindow;

    invoke-virtual {v3, v7}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 614
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->mBooksWindow:Landroid/widget/PopupWindow;

    new-instance v4, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v4}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    invoke-virtual {v3, v4}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 615
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->mBooksWindow:Landroid/widget/PopupWindow;

    const/16 v4, 0x11

    invoke-virtual {v3, p0, v4, v6, v6}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 616
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->bookListView:Landroid/widget/ListView;

    invoke-virtual {v3}, Landroid/widget/ListView;->requestFocus()Z

    .line 617
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->bookListView:Landroid/widget/ListView;

    .line 618
    new-instance v4, Lcom/anfengde/epub/ui/BookView$2;

    invoke-direct {v4, p0}, Lcom/anfengde/epub/ui/BookView$2;-><init>(Lcom/anfengde/epub/ui/BookView;)V

    invoke-virtual {v3, v4}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 638
    return-void
.end method

.method private speaking(Ljava/lang/String;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 792
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->tts:Landroid/speech/tts/TextToSpeech;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/speech/tts/TextToSpeech;->speak(Ljava/lang/String;ILjava/util/HashMap;)I

    .line 794
    return-void
.end method


# virtual methods
.method public customizeAdMob(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 3
    .param p1, "display"    # Ljava/lang/Boolean;
    .param p2, "id"    # Ljava/lang/String;

    .prologue
    .line 153
    sget-object v0, Lcom/anfengde/epub/ui/BookView;->allowToModifyAd:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 154
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookView;->displayAd:Ljava/lang/Boolean;

    .line 155
    iput-object p2, p0, Lcom/anfengde/epub/ui/BookView;->adUnitId:Ljava/lang/String;

    .line 159
    :goto_0
    return-void

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    const-string/jumbo v1, "The free version doesn\'t support to customize the AdMob!"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    .line 303
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-nez v1, :cond_4

    .line 304
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_4

    .line 305
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-virtual {v1}, Lcom/anfengde/epub/ui/EPubWebView;->inCustomView()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 306
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-virtual {v1}, Lcom/anfengde/epub/ui/EPubWebView;->hideCustomView()V

    .line 323
    :cond_0
    :goto_0
    return v0

    .line 309
    :cond_1
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    iget-boolean v1, v1, Lcom/anfengde/epub/ui/EPubWebView;->touchOnUrl:Z

    if-eqz v1, :cond_2

    .line 310
    iget v1, p0, Lcom/anfengde/epub/ui/BookView;->current_chapter:I

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-direct {p0, v1, v2}, Lcom/anfengde/epub/ui/BookView;->openChapter(ILandroid/webkit/WebView;)V

    goto :goto_0

    .line 313
    :cond_2
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    iget-boolean v1, v1, Lcom/anfengde/epub/ui/EPubWebView;->touchOnUrl:Z

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    iget-boolean v1, v1, Lcom/anfengde/epub/ui/EPubWebView;->onBookshelf:Z

    if-nez v1, :cond_3

    .line 314
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-virtual {v1}, Lcom/anfengde/epub/ui/EPubWebView;->isInSelectionMode()Z

    move-result v1

    if-nez v1, :cond_0

    .line 316
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->saveStatusData()V

    .line 317
    invoke-virtual {p0}, Lcom/anfengde/epub/ui/BookView;->openShelf()V

    goto :goto_0

    .line 320
    :cond_3
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->exitApp()V

    goto :goto_0

    .line 323
    :cond_4
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method

.method public initBook()V
    .locals 6

    .prologue
    const/4 v3, -0x2

    .line 184
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->displayAd:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 185
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->handler:Landroid/os/Handler;

    new-instance v2, Lcom/anfengde/epub/ui/BookView$1;

    invoke-direct {v2, p0}, Lcom/anfengde/epub/ui/BookView$1;-><init>(Lcom/anfengde/epub/ui/BookView;)V

    .line 191
    const-wide/16 v4, 0x2710

    .line 185
    invoke-virtual {v1, v2, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 193
    :cond_0
    new-instance v1, Lcom/anfengde/epub/core/EPubDriver;

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView;->afd_cachePath:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/anfengde/epub/core/EPubDriver;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    .line 195
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    invoke-virtual {v1}, Lcom/anfengde/epub/core/EPubDriver;->initEPubJNI()I

    move-result v0

    .line 196
    .local v0, "ret":I
    if-ne v0, v3, :cond_1

    .line 197
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    invoke-virtual {v1}, Lcom/anfengde/epub/core/EPubDriver;->cleanUp()V

    .line 198
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    .line 199
    new-instance v1, Lcom/anfengde/epub/core/EPubDriver;

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView;->afd_cachePath:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/anfengde/epub/core/EPubDriver;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    .line 200
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    invoke-virtual {v1}, Lcom/anfengde/epub/core/EPubDriver;->initEPubJNI()I

    move-result v0

    .line 202
    :cond_1
    if-gtz v0, :cond_2

    if-eq v0, v3, :cond_2

    .line 203
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    const-string/jumbo v2, "Init Error!"

    const/16 v3, 0x32

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 204
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->closeBook()V

    .line 205
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->finish()V

    .line 207
    :cond_2
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    iput v1, p0, Lcom/anfengde/epub/ui/BookView;->androidVersion:I

    .line 209
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->afd_cachePath:Ljava/lang/String;

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    invoke-static {v1, v2}, Lcom/anfengde/epub/core/value/ResourceFiles;->copyResourceFiles(Ljava/lang/String;Landroid/content/Context;)V

    .line 211
    invoke-direct {p0}, Lcom/anfengde/epub/ui/BookView;->getInnerBooks()V

    .line 212
    return-void
.end method

.method public jsStringEscape(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "src"    # Ljava/lang/String;

    .prologue
    .line 797
    const-string/jumbo v0, "\'\'"

    const-string/jumbo v1, "\'"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 798
    const-string/jumbo v0, "\'"

    const-string/jumbo v1, "\\\'"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 801
    return-object p1
.end method

.method public onInit(I)V
    .locals 3
    .param p1, "status"    # I

    .prologue
    .line 817
    if-nez p1, :cond_2

    .line 818
    iget-object v1, p0, Lcom/anfengde/epub/ui/BookView;->tts:Landroid/speech/tts/TextToSpeech;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Landroid/speech/tts/TextToSpeech;->setLanguage(Ljava/util/Locale;)I

    move-result v0

    .line 821
    .local v0, "result":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 822
    const/4 v1, -0x2

    if-ne v0, v1, :cond_1

    .line 823
    :cond_0
    const-string/jumbo v1, "TTS"

    const-string/jumbo v2, "Language is not supported"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 832
    .end local v0    # "result":I
    :cond_1
    :goto_0
    return-void

    .line 830
    :cond_2
    const-string/jumbo v1, "TTS"

    const-string/jumbo v2, "Initilization Failed"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public openBookFromFileExplorer(Landroid/content/Intent;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    .line 223
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 224
    .local v0, "event":Ljava/lang/String;
    const-string/jumbo v3, "android.intent.action.VIEW"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 225
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    .line 226
    .local v2, "uri":Landroid/net/Uri;
    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    .line 227
    .local v1, "filePath":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/anfengde/epub/ui/BookView;->importBook(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 236
    .end local v1    # "filePath":Ljava/lang/String;
    .end local v2    # "uri":Landroid/net/Uri;
    :cond_0
    :goto_0
    return-void

    .line 229
    .restart local v1    # "filePath":Ljava/lang/String;
    .restart local v2    # "uri":Landroid/net/Uri;
    :cond_1
    iput v5, p0, Lcom/anfengde/epub/ui/BookView;->current_percent:I

    .line 230
    iput v5, p0, Lcom/anfengde/epub/ui/BookView;->current_chapter:I

    .line 231
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v3, v3, Lcom/anfengde/epub/core/EPubDriver;->mToc:Lcom/anfengde/epub/core/value/TableOfContent;

    invoke-virtual {v3}, Lcom/anfengde/epub/core/value/TableOfContent;->clearChapter()V

    .line 232
    iget-object v3, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget-object v4, p0, Lcom/anfengde/epub/ui/BookView;->afd_epubDriver:Lcom/anfengde/epub/core/EPubDriver;

    iget v4, v4, Lcom/anfengde/epub/core/EPubDriver;->handle:I

    invoke-virtual {v3, v4}, Lcom/anfengde/epub/core/EPubDriver;->getToc(I)I

    .line 233
    iput v5, p0, Lcom/anfengde/epub/ui/BookView;->bookSize:I

    .line 234
    iget v3, p0, Lcom/anfengde/epub/ui/BookView;->current_chapter:I

    iget-object v4, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    invoke-direct {p0, v3, v4}, Lcom/anfengde/epub/ui/BookView;->openChapter(ILandroid/webkit/WebView;)V

    goto :goto_0
.end method

.method public openShelf()V
    .locals 3

    .prologue
    .line 218
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/anfengde/epub/ui/BookView;->afd_cachePath:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "/html/index.html"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadDataWithURL(Ljava/lang/String;)V

    .line 219
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_webView:Lcom/anfengde/epub/ui/EPubWebView;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/anfengde/epub/ui/EPubWebView;->onBookshelf:Z

    .line 220
    return-void
.end method

.method public setPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "argCachePath"    # Ljava/lang/String;

    .prologue
    .line 180
    iput-object p1, p0, Lcom/anfengde/epub/ui/BookView;->afd_cachePath:Ljava/lang/String;

    .line 181
    return-void
.end method

.method public viewDestroy()V
    .locals 1

    .prologue
    .line 335
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->tts:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v0}, Landroid/speech/tts/TextToSpeech;->shutdown()V

    .line 336
    iget-object v0, p0, Lcom/anfengde/epub/ui/BookView;->afd_curContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 337
    return-void
.end method
