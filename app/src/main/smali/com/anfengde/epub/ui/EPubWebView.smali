.class public Lcom/anfengde/epub/ui/EPubWebView;
.super Landroid/webkit/WebView;
.source "EPubWebView.java"

# interfaces
.implements Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/anfengde/android/QuickAction$OnDismissListener;
.implements Lcom/blahti/drag/DragListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;,
        Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;
    }
.end annotation


# static fields
.field static final COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams;

.field static final LOGTAG:Ljava/lang/String; = "EPubWebView"

.field private static final TAG:Ljava/lang/String; = "BTWebView"


# instance fields
.field private final SELECTION_END_HANDLE:I

.field private final SELECTION_START_HANDLE:I

.field public backReadingPage:Z

.field protected contentWidth:I

.field protected contextMenuVisible:Z

.field private drawSelectionHandlesHandler:Landroid/os/Handler;

.field private endSelectionModeHandler:Landroid/os/Handler;

.field protected inSelectionMode:Z

.field protected lastSelectedRegion:Landroid/graphics/Region;

.field private mBrowserFrameLayout:Landroid/widget/FrameLayout;

.field private mContentView:Landroid/widget/FrameLayout;

.field private mContext:Landroid/content/Context;

.field public mContextMenu:Lcom/anfengde/android/QuickAction;

.field public mCustomView:Landroid/view/View;

.field private mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

.field private mCustomViewContainer:Landroid/widget/FrameLayout;

.field private mDragController:Lcom/blahti/drag/DragController;

.field private mEndSelectionHandle:Landroid/widget/ImageView;

.field private mLastTouchX:F

.field private mLastTouchY:F

.field private mLastTouchedSelectionHandle:I

.field private mLayout:Landroid/widget/FrameLayout;

.field private mScrollDiffX:F

.field private mScrollDiffY:F

.field private mScrolling:Z

.field private mSelectionBounds:Landroid/graphics/Rect;

.field private mSelectionDragLayer:Lcom/blahti/drag/DragLayer;

.field private mStartSelectionHandle:Landroid/widget/ImageView;

.field private mWebChromeClient:Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;

.field private mWebViewClient:Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;

.field public onBookshelf:Z

.field protected selectedRange:Ljava/lang/String;

.field protected selectedText:Ljava/lang/String;

.field private startSelectionModeHandler:Landroid/os/Handler;

.field protected textSelectionJSInterface:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;

.field public touchOnUrl:Z

.field public touchOnVideo:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 491
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    sput-object v0, Lcom/anfengde/epub/ui/EPubWebView;->COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams;

    .line 493
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 307
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    .line 81
    iput v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->touchOnVideo:I

    .line 82
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->touchOnUrl:Z

    .line 83
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->backReadingPage:Z

    .line 84
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->onBookshelf:Z

    .line 104
    iput-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionBounds:Landroid/graphics/Rect;

    .line 107
    iput-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->lastSelectedRegion:Landroid/graphics/Region;

    .line 110
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->selectedRange:Ljava/lang/String;

    .line 113
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->selectedText:Ljava/lang/String;

    .line 116
    iput-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->textSelectionJSInterface:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;

    .line 119
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->inSelectionMode:Z

    .line 122
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->contextMenuVisible:Z

    .line 125
    iput v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->contentWidth:I

    .line 129
    iput v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->SELECTION_START_HANDLE:I

    .line 132
    const/4 v0, 0x1

    iput v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->SELECTION_END_HANDLE:I

    .line 135
    const/4 v0, -0x1

    iput v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchedSelectionHandle:I

    .line 549
    new-instance v0, Lcom/anfengde/epub/ui/EPubWebView$1;

    invoke-direct {v0, p0}, Lcom/anfengde/epub/ui/EPubWebView$1;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->startSelectionModeHandler:Landroid/os/Handler;

    .line 585
    new-instance v0, Lcom/anfengde/epub/ui/EPubWebView$2;

    invoke-direct {v0, p0}, Lcom/anfengde/epub/ui/EPubWebView$2;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->endSelectionModeHandler:Landroid/os/Handler;

    .line 625
    new-instance v0, Lcom/anfengde/epub/ui/EPubWebView$3;

    invoke-direct {v0, p0}, Lcom/anfengde/epub/ui/EPubWebView$3;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->drawSelectionHandlesHandler:Landroid/os/Handler;

    .line 926
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrolling:Z

    .line 927
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffY:F

    .line 928
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchY:F

    .line 929
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffX:F

    .line 930
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchX:F

    .line 308
    invoke-direct {p0, p1}, Lcom/anfengde/epub/ui/EPubWebView;->init(Landroid/content/Context;)V

    .line 309
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 319
    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 81
    iput v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->touchOnVideo:I

    .line 82
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->touchOnUrl:Z

    .line 83
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->backReadingPage:Z

    .line 84
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->onBookshelf:Z

    .line 104
    iput-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionBounds:Landroid/graphics/Rect;

    .line 107
    iput-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->lastSelectedRegion:Landroid/graphics/Region;

    .line 110
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->selectedRange:Ljava/lang/String;

    .line 113
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->selectedText:Ljava/lang/String;

    .line 116
    iput-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->textSelectionJSInterface:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;

    .line 119
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->inSelectionMode:Z

    .line 122
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->contextMenuVisible:Z

    .line 125
    iput v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->contentWidth:I

    .line 129
    iput v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->SELECTION_START_HANDLE:I

    .line 132
    const/4 v0, 0x1

    iput v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->SELECTION_END_HANDLE:I

    .line 135
    const/4 v0, -0x1

    iput v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchedSelectionHandle:I

    .line 549
    new-instance v0, Lcom/anfengde/epub/ui/EPubWebView$1;

    invoke-direct {v0, p0}, Lcom/anfengde/epub/ui/EPubWebView$1;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->startSelectionModeHandler:Landroid/os/Handler;

    .line 585
    new-instance v0, Lcom/anfengde/epub/ui/EPubWebView$2;

    invoke-direct {v0, p0}, Lcom/anfengde/epub/ui/EPubWebView$2;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->endSelectionModeHandler:Landroid/os/Handler;

    .line 625
    new-instance v0, Lcom/anfengde/epub/ui/EPubWebView$3;

    invoke-direct {v0, p0}, Lcom/anfengde/epub/ui/EPubWebView$3;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->drawSelectionHandlesHandler:Landroid/os/Handler;

    .line 926
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrolling:Z

    .line 927
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffY:F

    .line 928
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchY:F

    .line 929
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffX:F

    .line 930
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchX:F

    .line 320
    invoke-direct {p0, p1}, Lcom/anfengde/epub/ui/EPubWebView;->init(Landroid/content/Context;)V

    .line 321
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 333
    invoke-direct {p0, p1, p2, p3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 81
    iput v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->touchOnVideo:I

    .line 82
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->touchOnUrl:Z

    .line 83
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->backReadingPage:Z

    .line 84
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->onBookshelf:Z

    .line 104
    iput-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionBounds:Landroid/graphics/Rect;

    .line 107
    iput-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->lastSelectedRegion:Landroid/graphics/Region;

    .line 110
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->selectedRange:Ljava/lang/String;

    .line 113
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->selectedText:Ljava/lang/String;

    .line 116
    iput-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->textSelectionJSInterface:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;

    .line 119
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->inSelectionMode:Z

    .line 122
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->contextMenuVisible:Z

    .line 125
    iput v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->contentWidth:I

    .line 129
    iput v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->SELECTION_START_HANDLE:I

    .line 132
    const/4 v0, 0x1

    iput v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->SELECTION_END_HANDLE:I

    .line 135
    const/4 v0, -0x1

    iput v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchedSelectionHandle:I

    .line 549
    new-instance v0, Lcom/anfengde/epub/ui/EPubWebView$1;

    invoke-direct {v0, p0}, Lcom/anfengde/epub/ui/EPubWebView$1;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->startSelectionModeHandler:Landroid/os/Handler;

    .line 585
    new-instance v0, Lcom/anfengde/epub/ui/EPubWebView$2;

    invoke-direct {v0, p0}, Lcom/anfengde/epub/ui/EPubWebView$2;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->endSelectionModeHandler:Landroid/os/Handler;

    .line 625
    new-instance v0, Lcom/anfengde/epub/ui/EPubWebView$3;

    invoke-direct {v0, p0}, Lcom/anfengde/epub/ui/EPubWebView$3;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->drawSelectionHandlesHandler:Landroid/os/Handler;

    .line 926
    iput-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrolling:Z

    .line 927
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffY:F

    .line 928
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchY:F

    .line 929
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffX:F

    .line 930
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchX:F

    .line 334
    invoke-direct {p0, p1}, Lcom/anfengde/epub/ui/EPubWebView;->init(Landroid/content/Context;)V

    .line 335
    return-void
.end method

.method static synthetic access$0(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/graphics/Rect;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionBounds:Landroid/graphics/Rect;

    return-object v0
.end method

.method static synthetic access$1(Lcom/anfengde/epub/ui/EPubWebView;)Lcom/blahti/drag/DragLayer;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionDragLayer:Lcom/blahti/drag/DragLayer;

    return-object v0
.end method

.method static synthetic access$10(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/webkit/WebChromeClient$CustomViewCallback;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    return-object v0
.end method

.method static synthetic access$11(Lcom/anfengde/epub/ui/EPubWebView;Landroid/view/View;)Z
    .locals 1

    .prologue
    .line 672
    invoke-direct {p0, p1}, Lcom/anfengde/epub/ui/EPubWebView;->startDrag(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$2(Lcom/anfengde/epub/ui/EPubWebView;)V
    .locals 0

    .prologue
    .line 618
    invoke-direct {p0}, Lcom/anfengde/epub/ui/EPubWebView;->drawSelectionHandles()V

    return-void
.end method

.method static synthetic access$3(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$4(Lcom/anfengde/epub/ui/EPubWebView;Landroid/graphics/Rect;)V
    .locals 0

    .prologue
    .line 104
    iput-object p1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionBounds:Landroid/graphics/Rect;

    return-void
.end method

.method static synthetic access$5(Lcom/anfengde/epub/ui/EPubWebView;I)V
    .locals 0

    .prologue
    .line 135
    iput p1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchedSelectionHandle:I

    return-void
.end method

.method static synthetic access$6(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/ImageView;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mStartSelectionHandle:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$7(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/ImageView;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mEndSelectionHandle:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$8(Lcom/anfengde/epub/ui/EPubWebView;)Landroid/widget/FrameLayout;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mCustomViewContainer:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method static synthetic access$9(Lcom/anfengde/epub/ui/EPubWebView;Landroid/webkit/WebChromeClient$CustomViewCallback;)V
    .locals 0

    .prologue
    .line 76
    iput-object p1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mCustomViewCallback:Landroid/webkit/WebChromeClient$CustomViewCallback;

    return-void
.end method

.method private drawSelectionHandles()V
    .locals 2

    .prologue
    .line 619
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->drawSelectionHandlesHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 620
    return-void
.end method

.method private getFilePath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 242
    const-string/jumbo v1, ""

    .line 243
    .local v1, "path":Ljava/lang/String;
    const-string/jumbo v2, "#"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 244
    .local v0, "i":I
    const/4 v2, -0x1

    if-ne v2, v0, :cond_0

    .line 245
    move-object v1, p1

    .line 249
    :goto_0
    return-object v1

    .line 247
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private init(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 144
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->setHorizontalScrollBarEnabled(Z)V

    .line 145
    iput-object p1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    .line 146
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    .line 147
    .local v0, "a":Landroid/app/Activity;
    new-instance v1, Landroid/widget/FrameLayout;

    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLayout:Landroid/widget/FrameLayout;

    .line 148
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 149
    sget v2, Lcom/anfengde/epub/ui/R$layout;->afd_custom_screen:I

    .line 148
    invoke-virtual {v1, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mBrowserFrameLayout:Landroid/widget/FrameLayout;

    .line 150
    iget-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mBrowserFrameLayout:Landroid/widget/FrameLayout;

    .line 151
    sget v2, Lcom/anfengde/epub/ui/R$id;->afd_main_content:I

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    .line 150
    iput-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContentView:Landroid/widget/FrameLayout;

    .line 152
    iget-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mBrowserFrameLayout:Landroid/widget/FrameLayout;

    .line 153
    sget v2, Lcom/anfengde/epub/ui/R$id;->afd_fullscreen_custom_content:I

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    .line 152
    iput-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mCustomViewContainer:Landroid/widget/FrameLayout;

    .line 154
    iget-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLayout:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mBrowserFrameLayout:Landroid/widget/FrameLayout;

    sget-object v3, Lcom/anfengde/epub/ui/EPubWebView;->COVER_SCREEN_PARAMS:Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v1, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 155
    new-instance v1, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;

    invoke-direct {v1, p0, v4}, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;-><init>(Lcom/anfengde/epub/ui/EPubWebView;Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;)V

    iput-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mWebChromeClient:Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;

    .line 157
    invoke-direct {p0}, Lcom/anfengde/epub/ui/EPubWebView;->webSetting()V

    .line 159
    iget-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContentView:Landroid/widget/FrameLayout;

    invoke-virtual {v1, p0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 161
    return-void
.end method

.method private showContextMenu(Landroid/graphics/Rect;)V
    .locals 6
    .param p1, "displayRect"    # Landroid/graphics/Rect;

    .prologue
    const/4 v5, 0x1

    .line 735
    iget-boolean v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->contextMenuVisible:Z

    if-eqz v3, :cond_1

    .line 804
    :cond_0
    :goto_0
    return-void

    .line 741
    :cond_1
    iget v3, p1, Landroid/graphics/Rect;->right:I

    iget v4, p1, Landroid/graphics/Rect;->left:I

    if-le v3, v4, :cond_0

    .line 745
    new-instance v0, Lcom/anfengde/android/ActionItem;

    invoke-direct {v0}, Lcom/anfengde/android/ActionItem;-><init>()V

    .line 746
    .local v0, "buttonCopy":Lcom/anfengde/android/ActionItem;
    const-string/jumbo v3, "Copy"

    invoke-virtual {v0, v3}, Lcom/anfengde/android/ActionItem;->setTitle(Ljava/lang/String;)V

    .line 747
    invoke-virtual {v0, v5}, Lcom/anfengde/android/ActionItem;->setActionId(I)V

    .line 750
    new-instance v1, Lcom/anfengde/android/ActionItem;

    invoke-direct {v1}, Lcom/anfengde/android/ActionItem;-><init>()V

    .line 752
    .local v1, "buttonShare":Lcom/anfengde/android/ActionItem;
    const-string/jumbo v3, "Share"

    invoke-virtual {v1, v3}, Lcom/anfengde/android/ActionItem;->setTitle(Ljava/lang/String;)V

    .line 753
    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Lcom/anfengde/android/ActionItem;->setActionId(I)V

    .line 757
    new-instance v2, Lcom/anfengde/android/ActionItem;

    invoke-direct {v2}, Lcom/anfengde/android/ActionItem;-><init>()V

    .line 759
    .local v2, "buttonSpeak":Lcom/anfengde/android/ActionItem;
    const-string/jumbo v3, "Speak"

    invoke-virtual {v2, v3}, Lcom/anfengde/android/ActionItem;->setTitle(Ljava/lang/String;)V

    .line 760
    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Lcom/anfengde/android/ActionItem;->setActionId(I)V

    .line 763
    new-instance v3, Lcom/anfengde/android/QuickAction;

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/anfengde/android/QuickAction;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContextMenu:Lcom/anfengde/android/QuickAction;

    .line 764
    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContextMenu:Lcom/anfengde/android/QuickAction;

    invoke-virtual {v3, p0}, Lcom/anfengde/android/QuickAction;->setOnDismissListener(Lcom/anfengde/android/QuickAction$OnDismissListener;)V

    .line 766
    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContextMenu:Lcom/anfengde/android/QuickAction;

    invoke-virtual {v3, v0}, Lcom/anfengde/android/QuickAction;->addActionItem(Lcom/anfengde/android/ActionItem;)V

    .line 767
    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContextMenu:Lcom/anfengde/android/QuickAction;

    invoke-virtual {v3, v1}, Lcom/anfengde/android/QuickAction;->addActionItem(Lcom/anfengde/android/ActionItem;)V

    .line 768
    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContextMenu:Lcom/anfengde/android/QuickAction;

    invoke-virtual {v3, v2}, Lcom/anfengde/android/QuickAction;->addActionItem(Lcom/anfengde/android/ActionItem;)V

    .line 770
    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContextMenu:Lcom/anfengde/android/QuickAction;

    new-instance v4, Lcom/anfengde/epub/ui/EPubWebView$5;

    invoke-direct {v4, p0}, Lcom/anfengde/epub/ui/EPubWebView$5;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    invoke-virtual {v3, v4}, Lcom/anfengde/android/QuickAction;->setOnActionItemClickListener(Lcom/anfengde/android/QuickAction$OnActionItemClickListener;)V

    .line 802
    iput-boolean v5, p0, Lcom/anfengde/epub/ui/EPubWebView;->contextMenuVisible:Z

    .line 803
    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContextMenu:Lcom/anfengde/android/QuickAction;

    invoke-virtual {v3, p0, p1}, Lcom/anfengde/android/QuickAction;->show(Landroid/view/View;Landroid/graphics/Rect;)V

    goto :goto_0
.end method

.method private startDrag(Landroid/view/View;)Z
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 677
    move-object v0, p1

    .line 678
    .local v0, "dragInfo":Landroid/view/View;
    iget-object v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mDragController:Lcom/blahti/drag/DragController;

    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionDragLayer:Lcom/blahti/drag/DragLayer;

    sget v3, Lcom/blahti/drag/DragController;->DRAG_ACTION_MOVE:I

    invoke-virtual {v1, p1, v2, v0, v3}, Lcom/blahti/drag/DragController;->startDrag(Landroid/view/View;Lcom/blahti/drag/DragSource;Ljava/lang/Object;I)V

    .line 679
    const/4 v1, 0x1

    return v1
.end method

.method private webSetting()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 167
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mWebChromeClient:Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;

    invoke-virtual {p0, v2}, Lcom/anfengde/epub/ui/EPubWebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    .line 168
    new-instance v2, Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;-><init>(Lcom/anfengde/epub/ui/EPubWebView;Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;)V

    iput-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mWebViewClient:Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;

    .line 169
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mWebViewClient:Lcom/anfengde/epub/ui/EPubWebView$MyWebViewClient;

    invoke-virtual {p0, v2}, Lcom/anfengde/epub/ui/EPubWebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 170
    invoke-virtual {p0, v5}, Lcom/anfengde/epub/ui/EPubWebView;->setScrollBarStyle(I)V

    .line 172
    invoke-virtual {p0, p0}, Lcom/anfengde/epub/ui/EPubWebView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 173
    invoke-virtual {p0, p0}, Lcom/anfengde/epub/ui/EPubWebView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 174
    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 175
    .local v1, "s":Landroid/webkit/WebSettings;
    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setSupportZoom(Z)V

    .line 176
    invoke-virtual {v1, v5}, Landroid/webkit/WebSettings;->setBuiltInZoomControls(Z)V

    .line 177
    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    .line 179
    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    .line 180
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "/data/data/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "/app_databases/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setDatabasePath(Ljava/lang/String;)V

    .line 181
    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    .line 185
    sget-object v2, Landroid/webkit/WebSettings$LayoutAlgorithm;->NARROW_COLUMNS:Landroid/webkit/WebSettings$LayoutAlgorithm;

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setLayoutAlgorithm(Landroid/webkit/WebSettings$LayoutAlgorithm;)V

    .line 186
    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setSavePassword(Z)V

    .line 187
    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setSaveFormData(Z)V

    .line 188
    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 190
    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    .line 191
    new-instance v2, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;

    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3, p0}, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;-><init>(Landroid/content/Context;Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;)V

    iput-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->textSelectionJSInterface:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;

    .line 192
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->textSelectionJSInterface:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;

    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->textSelectionJSInterface:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;

    invoke-virtual {v3}, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->getInterfaceName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/anfengde/epub/ui/EPubWebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 193
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v2}, Lcom/anfengde/epub/ui/EPubWebView;->createSelectionLayer(Landroid/content/Context;)V

    .line 194
    new-instance v0, Landroid/graphics/Region;

    invoke-direct {v0}, Landroid/graphics/Region;-><init>()V

    .line 195
    .local v0, "region":Landroid/graphics/Region;
    invoke-virtual {v0}, Landroid/graphics/Region;->setEmpty()V

    .line 196
    iput-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->lastSelectedRegion:Landroid/graphics/Region;

    .line 198
    return-void
.end method


# virtual methods
.method protected createSelectionLayer(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 501
    const-string/jumbo v2, "layout_inflater"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 502
    .local v1, "inflater":Landroid/view/LayoutInflater;
    sget v2, Lcom/anfengde/epub/ui/R$layout;->selection_drag_layer:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/blahti/drag/DragLayer;

    iput-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionDragLayer:Lcom/blahti/drag/DragLayer;

    .line 506
    new-instance v2, Lcom/blahti/drag/DragController;

    invoke-direct {v2, p1}, Lcom/blahti/drag/DragController;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mDragController:Lcom/blahti/drag/DragController;

    .line 507
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mDragController:Lcom/blahti/drag/DragController;

    invoke-virtual {v2, p0}, Lcom/blahti/drag/DragController;->setDragListener(Lcom/blahti/drag/DragListener;)V

    .line 508
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mDragController:Lcom/blahti/drag/DragController;

    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionDragLayer:Lcom/blahti/drag/DragLayer;

    invoke-virtual {v2, v3}, Lcom/blahti/drag/DragController;->addDropTarget(Lcom/blahti/drag/DropTarget;)V

    .line 509
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionDragLayer:Lcom/blahti/drag/DragLayer;

    iget-object v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mDragController:Lcom/blahti/drag/DragController;

    invoke-virtual {v2, v3}, Lcom/blahti/drag/DragLayer;->setDragController(Lcom/blahti/drag/DragController;)V

    .line 512
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionDragLayer:Lcom/blahti/drag/DragLayer;

    sget v3, Lcom/anfengde/epub/ui/R$id;->startHandle:I

    invoke-virtual {v2, v3}, Lcom/blahti/drag/DragLayer;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mStartSelectionHandle:Landroid/widget/ImageView;

    .line 513
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mStartSelectionHandle:Landroid/widget/ImageView;

    new-instance v3, Ljava/lang/Integer;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 514
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionDragLayer:Lcom/blahti/drag/DragLayer;

    sget v3, Lcom/anfengde/epub/ui/R$id;->endHandle:I

    invoke-virtual {v2, v3}, Lcom/blahti/drag/DragLayer;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    iput-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mEndSelectionHandle:Landroid/widget/ImageView;

    .line 515
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mEndSelectionHandle:Landroid/widget/ImageView;

    new-instance v3, Ljava/lang/Integer;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 517
    new-instance v0, Lcom/anfengde/epub/ui/EPubWebView$4;

    invoke-direct {v0, p0}, Lcom/anfengde/epub/ui/EPubWebView$4;-><init>(Lcom/anfengde/epub/ui/EPubWebView;)V

    .line 540
    .local v0, "handleTouchListener":Landroid/view/View$OnTouchListener;
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mStartSelectionHandle:Landroid/widget/ImageView;

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 541
    iget-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mEndSelectionHandle:Landroid/widget/ImageView;

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 544
    return-void
.end method

.method public endSelectionMode()V
    .locals 2

    .prologue
    .line 611
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->endSelectionModeHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 613
    return-void
.end method

.method public getDensityDependentValue(FLandroid/content/Context;)F
    .locals 4
    .param p1, "val"    # F
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 898
    const-string/jumbo v2, "window"

    invoke-virtual {p2, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 901
    .local v0, "display":Landroid/view/Display;
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 902
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 903
    iget v2, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v2, v2

    const/high16 v3, 0x43200000    # 160.0f

    div-float/2addr v2, v3

    mul-float/2addr v2, p1

    return v2
.end method

.method public getDensityIndependentValue(FLandroid/content/Context;)F
    .locals 4
    .param p1, "val"    # F
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 916
    const-string/jumbo v2, "window"

    invoke-virtual {p2, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .line 919
    .local v0, "display":Landroid/view/Display;
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 920
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 922
    iget v2, v1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float v2, v2

    const/high16 v3, 0x43200000    # 160.0f

    div-float/2addr v2, v3

    div-float v2, p1, v2

    return v2
.end method

.method public getLayout()Landroid/widget/FrameLayout;
    .locals 1

    .prologue
    .line 341
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLayout:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public hideCustomView()V
    .locals 1

    .prologue
    .line 357
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mWebChromeClient:Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;

    invoke-virtual {v0}, Lcom/anfengde/epub/ui/EPubWebView$MyWebChromeClient;->onHideCustomView()V

    .line 358
    return-void
.end method

.method public inCustomView()Z
    .locals 1

    .prologue
    .line 350
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mCustomView:Landroid/view/View;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isInSelectionMode()Z
    .locals 1

    .prologue
    .line 657
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionDragLayer:Lcom/blahti/drag/DragLayer;

    invoke-virtual {v0}, Lcom/blahti/drag/DragLayer;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public loadDataWithString(Ljava/lang/String;)V
    .locals 11
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 221
    const-string/jumbo v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 222
    .local v8, "temp":[Ljava/lang/String;
    array-length v0, v8

    add-int/lit8 v0, v0, -0x1

    aget-object v10, v8, v0

    .line 223
    .local v10, "tempUrl":Ljava/lang/String;
    const/4 v7, 0x0

    .line 224
    .local v7, "length":I
    const-string/jumbo v0, "#"

    invoke-virtual {v10, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 225
    const-string/jumbo v0, "#"

    invoke-virtual {v10, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v9

    .line 226
    .local v9, "tempSUrl":[Ljava/lang/String;
    array-length v0, v9

    add-int/lit8 v0, v0, -0x1

    aget-object v0, v9, v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v7, v0, 0x1

    .line 228
    .end local v9    # "tempSUrl":[Ljava/lang/String;
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "file://"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v7

    invoke-virtual {p1, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 229
    .local v1, "baseUrl":Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/anfengde/epub/ui/EPubWebView;->getFilePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 230
    .local v6, "filePath":Ljava/lang/String;
    invoke-virtual {p0, v6}, Lcom/anfengde/epub/ui/EPubWebView;->readData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 232
    .local v2, "text":Ljava/lang/String;
    const-string/jumbo v3, "text/html"

    const-string/jumbo v4, "utf-8"

    const-string/jumbo v5, ""

    move-object v0, p0

    invoke-super/range {v0 .. v5}, Landroid/webkit/WebView;->loadDataWithBaseURL(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    return-void
.end method

.method public loadDataWithURL(Ljava/lang/String;)V
    .locals 4
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 207
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "file://"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 208
    .local v0, "baseUrl":Ljava/lang/String;
    const-string/jumbo v1, "EPubWebView"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "baseUrl: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    invoke-virtual {p0, v0}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 210
    return-void
.end method

.method public onDismiss()V
    .locals 1

    .prologue
    .line 811
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->contextMenuVisible:Z

    .line 812
    return-void
.end method

.method public onDragEnd()V
    .locals 13

    .prologue
    .line 693
    iget-object v9, p0, Lcom/anfengde/epub/ui/EPubWebView;->mStartSelectionHandle:Landroid/widget/ImageView;

    invoke-virtual {v9}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    check-cast v6, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;

    .line 694
    .local v6, "startHandleParams":Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;
    iget-object v9, p0, Lcom/anfengde/epub/ui/EPubWebView;->mEndSelectionHandle:Landroid/widget/ImageView;

    invoke-virtual {v9}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;

    .line 696
    .local v0, "endHandleParams":Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;
    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getScale()F

    move-result v9

    iget-object v10, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v9, v10}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityIndependentValue(FLandroid/content/Context;)F

    move-result v5

    .line 698
    .local v5, "scale":F
    iget v9, v6, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->x:I

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getScrollX()I

    move-result v10

    sub-int/2addr v9, v10

    int-to-float v7, v9

    .line 699
    .local v7, "startX":F
    iget v9, v6, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->y:I

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getScrollY()I

    move-result v10

    sub-int/2addr v9, v10

    int-to-float v8, v9

    .line 700
    .local v8, "startY":F
    iget v9, v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->x:I

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getScrollX()I

    move-result v10

    sub-int/2addr v9, v10

    int-to-float v1, v9

    .line 701
    .local v1, "endX":F
    iget v9, v0, Lcom/blahti/drag/MyAbsoluteLayout$LayoutParams;->y:I

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getScrollY()I

    move-result v10

    sub-int/2addr v9, v10

    int-to-float v2, v9

    .line 703
    .local v2, "endY":F
    iget-object v9, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v7, v9}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityIndependentValue(FLandroid/content/Context;)F

    move-result v9

    div-float v7, v9, v5

    .line 704
    iget-object v9, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v8, v9}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityIndependentValue(FLandroid/content/Context;)F

    move-result v9

    div-float v8, v9, v5

    .line 705
    iget-object v9, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v1, v9}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityIndependentValue(FLandroid/content/Context;)F

    move-result v9

    div-float v1, v9, v5

    .line 706
    iget-object v9, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v2, v9}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityIndependentValue(FLandroid/content/Context;)F

    move-result v9

    div-float v2, v9, v5

    .line 709
    iget v9, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchedSelectionHandle:I

    if-nez v9, :cond_0

    const/4 v9, 0x0

    cmpl-float v9, v7, v9

    if-lez v9, :cond_0

    const/4 v9, 0x0

    cmpl-float v9, v8, v9

    if-lez v9, :cond_0

    .line 710
    const-string/jumbo v9, "javascript: android.selection.setStartPos(%f, %f);"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 711
    .local v4, "saveStartString":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 714
    .end local v4    # "saveStartString":Ljava/lang/String;
    :cond_0
    iget v9, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchedSelectionHandle:I

    const/4 v10, 0x1

    if-ne v9, v10, :cond_1

    const/4 v9, 0x0

    cmpl-float v9, v1, v9

    if-lez v9, :cond_1

    const/4 v9, 0x0

    cmpl-float v9, v2, v9

    if-lez v9, :cond_1

    .line 715
    const-string/jumbo v9, "javascript: android.selection.setEndPos(%f, %f);"

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    aput-object v12, v10, v11

    const/4 v11, 0x1

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 716
    .local v3, "saveEndString":Ljava/lang/String;
    invoke-virtual {p0, v3}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 719
    .end local v3    # "saveEndString":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public onDragStart(Lcom/blahti/drag/DragSource;Ljava/lang/Object;I)V
    .locals 0
    .param p1, "source"    # Lcom/blahti/drag/DragSource;
    .param p2, "info"    # Ljava/lang/Object;
    .param p3, "dragAction"    # I

    .prologue
    .line 687
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v0, 0x1

    .line 982
    iget-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->backReadingPage:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->onBookshelf:Z

    if-eqz v1, :cond_1

    :cond_0
    const/4 v0, 0x0

    .line 986
    :goto_0
    return v0

    .line 983
    :cond_1
    const-string/jumbo v1, "javascript:android.selection.longTouch();"

    invoke-virtual {p0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 984
    const-string/jumbo v1, "javascript:androidLongtouchModel(1);"

    invoke-virtual {p0, v1}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    .line 985
    iput-boolean v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrolling:Z

    goto :goto_0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 11
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v10, 0x2

    const/high16 v9, 0x41200000    # 10.0f

    const/4 v8, 0x0

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 934
    iget-boolean v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->backReadingPage:Z

    if-nez v3, :cond_0

    iget-boolean v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->onBookshelf:Z

    if-eqz v3, :cond_1

    .line 977
    :cond_0
    :goto_0
    return v6

    .line 935
    :cond_1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    iget-object v4, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v3, v4}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityIndependentValue(FLandroid/content/Context;)F

    move-result v3

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getScale()F

    move-result v4

    iget-object v5, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v4, v5}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityIndependentValue(FLandroid/content/Context;)F

    move-result v4

    div-float v1, v3, v4

    .line 936
    .local v1, "xPoint":F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    iget-object v4, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v3, v4}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityIndependentValue(FLandroid/content/Context;)F

    move-result v3

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getScale()F

    move-result v4

    iget-object v5, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v4, v5}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityIndependentValue(FLandroid/content/Context;)F

    move-result v4

    div-float v2, v3, v4

    .line 940
    .local v2, "yPoint":F
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-nez v3, :cond_2

    .line 942
    const-string/jumbo v3, "javascript:android.selection.startTouch(%f, %f);"

    new-array v4, v10, [Ljava/lang/Object;

    .line 943
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v4, v7

    .line 942
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 945
    .local v0, "startTouchUrl":Ljava/lang/String;
    iput v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchX:F

    .line 946
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchY:F

    .line 948
    invoke-virtual {p0, v0}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 950
    .end local v0    # "startTouchUrl":Ljava/lang/String;
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-ne v3, v7, :cond_4

    .line 952
    iget-boolean v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrolling:Z

    if-nez v3, :cond_3

    .line 953
    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->endSelectionMode()V

    .line 956
    :cond_3
    iput v8, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffX:F

    .line 957
    iput v8, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffY:F

    .line 958
    iput-boolean v6, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrolling:Z

    .line 959
    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->isInSelectionMode()Z

    move-result v3

    if-nez v3, :cond_0

    .line 960
    const-string/jumbo v3, "javascript:androidLongtouchModel(0);"

    invoke-virtual {p0, v3}, Lcom/anfengde/epub/ui/EPubWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 963
    :cond_4
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v3

    if-ne v3, v10, :cond_0

    .line 965
    iget v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffX:F

    iget v4, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchX:F

    sub-float v4, v1, v4

    add-float/2addr v3, v4

    iput v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffX:F

    .line 966
    iget v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffY:F

    iget v4, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchY:F

    sub-float v4, v2, v4

    add-float/2addr v3, v4

    iput v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffY:F

    .line 968
    iput v1, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchX:F

    .line 969
    iput v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mLastTouchY:F

    .line 972
    iget v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffX:F

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v3, v3, v9

    if-gtz v3, :cond_5

    iget v3, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrollDiffY:F

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v3, v3, v9

    if-lez v3, :cond_0

    .line 973
    :cond_5
    iput-boolean v7, p0, Lcom/anfengde/epub/ui/EPubWebView;->mScrolling:Z

    goto/16 :goto_0
.end method

.method public readData(Ljava/lang/String;)Ljava/lang/String;
    .locals 17
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 261
    const/4 v6, 0x1

    .line 262
    .local v6, "fileExist":Z
    const-string/jumbo v7, ""

    .line 264
    .local v7, "html":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 265
    .local v13, "text":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 268
    .local v2, "br":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v14, Ljava/io/FileReader;

    move-object/from16 v0, p1

    invoke-direct {v14, v0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v14}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2    # "br":Ljava/io/BufferedReader;
    .local v3, "br":Ljava/io/BufferedReader;
    move-object v2, v3

    .line 273
    .end local v3    # "br":Ljava/io/BufferedReader;
    .restart local v2    # "br":Ljava/io/BufferedReader;
    :goto_0
    if-eqz v6, :cond_1

    .line 276
    :goto_1
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v9

    .local v9, "line":Ljava/lang/String;
    if-nez v9, :cond_0

    .line 280
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 284
    .end local v9    # "line":Ljava/lang/String;
    :goto_2
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 288
    :goto_3
    const-string/jumbo v8, "<script type=\'text/javascript\' src=\'/sdcard/epub/js/jquery.min.js\'></script><script type=\'text/javascript\'>var afdjQuery = jQuery.noConflict(true);</script>"

    .line 289
    .local v8, "jquery":Ljava/lang/String;
    const-string/jumbo v11, "<script type=\'text/javascript\' src=\'/sdcard/epub/js/rangyserializer.js\'></script>"

    .line 290
    .local v11, "rangyserializer":Ljava/lang/String;
    const-string/jumbo v10, "<script type=\'text/javascript\' src=\'/sdcard/epub/js/rangycore.js\'></script>"

    .line 291
    .local v10, "rangcore":Ljava/lang/String;
    const-string/jumbo v1, "<script type=\'text/javascript\' src=\'/sdcard/epub/js/androidselection.js\'></script>"

    .line 292
    .local v1, "androidselection":Ljava/lang/String;
    const-string/jumbo v4, "<script type=\'text/javascript\' src=\'/sdcard/epub/js/control.js\'></script>"

    .line 293
    .local v4, "control":Ljava/lang/String;
    const-string/jumbo v12, "<link type=\'text/css\' rel=\'stylesheet\' href=\'/sdcard/epub/css/readpage.css\'/>"

    .line 294
    .local v12, "readpage":Ljava/lang/String;
    const-string/jumbo v14, "</head>"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-static {v12}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, "<script></script></head>"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v7, v14, v15}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 295
    const-string/jumbo v14, "<title/>"

    const-string/jumbo v15, " "

    invoke-virtual {v7, v14, v15}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 297
    return-object v7

    .line 270
    .end local v1    # "androidselection":Ljava/lang/String;
    .end local v4    # "control":Ljava/lang/String;
    .end local v8    # "jquery":Ljava/lang/String;
    .end local v10    # "rangcore":Ljava/lang/String;
    .end local v11    # "rangyserializer":Ljava/lang/String;
    .end local v12    # "readpage":Ljava/lang/String;
    :catch_0
    move-exception v5

    .line 271
    .local v5, "e":Ljava/io/FileNotFoundException;
    const/4 v6, 0x0

    goto :goto_0

    .line 277
    .end local v5    # "e":Ljava/io/FileNotFoundException;
    .restart local v9    # "line":Ljava/lang/String;
    :cond_0
    :try_start_2
    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    const/16 v14, 0xa

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 281
    .end local v9    # "line":Ljava/lang/String;
    :catch_1
    move-exception v5

    .line 282
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 286
    .end local v5    # "e":Ljava/io/IOException;
    :cond_1
    const-string/jumbo v7, "<head></head><body>FileNotFound</body>"

    goto :goto_3
.end method

.method public startSelectionMode()V
    .locals 2

    .prologue
    .line 580
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->startSelectionModeHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 582
    return-void
.end method

.method public tsjiEndSelectionMode()V
    .locals 0

    .prologue
    .line 833
    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->endSelectionMode()V

    .line 834
    return-void
.end method

.method public tsjiJSError(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 818
    const-string/jumbo v0, "BTWebView"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "JSError: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 819
    return-void
.end method

.method public tsjiSelectionChanged(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "range"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "handleBounds"    # Ljava/lang/String;
    .param p4, "menuBounds"    # Ljava/lang/String;

    .prologue
    .line 847
    :try_start_0
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 849
    .local v5, "selectionBoundsObject":Lorg/json/JSONObject;
    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getScale()F

    move-result v6

    iget-object v7, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v6, v7}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityIndependentValue(FLandroid/content/Context;)F

    move-result v4

    .line 851
    .local v4, "scale":F
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 852
    .local v2, "handleRect":Landroid/graphics/Rect;
    const-string/jumbo v6, "left"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityDependentValue(FLandroid/content/Context;)F

    move-result v6

    mul-float/2addr v6, v4

    float-to-int v6, v6

    iput v6, v2, Landroid/graphics/Rect;->left:I

    .line 853
    const-string/jumbo v6, "top"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityDependentValue(FLandroid/content/Context;)F

    move-result v6

    mul-float/2addr v6, v4

    float-to-int v6, v6

    iput v6, v2, Landroid/graphics/Rect;->top:I

    .line 854
    const-string/jumbo v6, "right"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityDependentValue(FLandroid/content/Context;)F

    move-result v6

    mul-float/2addr v6, v4

    float-to-int v6, v6

    iput v6, v2, Landroid/graphics/Rect;->right:I

    .line 855
    const-string/jumbo v6, "bottom"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityDependentValue(FLandroid/content/Context;)F

    move-result v6

    mul-float/2addr v6, v4

    float-to-int v6, v6

    iput v6, v2, Landroid/graphics/Rect;->bottom:I

    .line 857
    iput-object v2, p0, Lcom/anfengde/epub/ui/EPubWebView;->mSelectionBounds:Landroid/graphics/Rect;

    .line 858
    iput-object p1, p0, Lcom/anfengde/epub/ui/EPubWebView;->selectedRange:Ljava/lang/String;

    .line 859
    iput-object p2, p0, Lcom/anfengde/epub/ui/EPubWebView;->selectedText:Ljava/lang/String;

    .line 861
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 863
    .local v3, "menuBoundsObject":Lorg/json/JSONObject;
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 864
    .local v0, "displayRect":Landroid/graphics/Rect;
    const-string/jumbo v6, "left"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityDependentValue(FLandroid/content/Context;)F

    move-result v6

    mul-float/2addr v6, v4

    float-to-int v6, v6

    iput v6, v0, Landroid/graphics/Rect;->left:I

    .line 865
    const-string/jumbo v6, "top"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    add-int/lit8 v6, v6, -0x19

    int-to-float v6, v6

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityDependentValue(FLandroid/content/Context;)F

    move-result v6

    mul-float/2addr v6, v4

    float-to-int v6, v6

    iput v6, v0, Landroid/graphics/Rect;->top:I

    .line 866
    const-string/jumbo v6, "right"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityDependentValue(FLandroid/content/Context;)F

    move-result v6

    mul-float/2addr v6, v4

    float-to-int v6, v6

    iput v6, v0, Landroid/graphics/Rect;->right:I

    .line 867
    const-string/jumbo v6, "bottom"

    invoke-virtual {v3, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    add-int/lit8 v6, v6, 0x19

    int-to-float v6, v6

    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {p0, v6, v7}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityDependentValue(FLandroid/content/Context;)F

    move-result v6

    mul-float/2addr v6, v4

    float-to-int v6, v6

    iput v6, v0, Landroid/graphics/Rect;->bottom:I

    .line 869
    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->isInSelectionMode()Z

    move-result v6

    if-nez v6, :cond_0

    .line 870
    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->startSelectionMode()V

    .line 873
    :cond_0
    invoke-direct {p0, v0}, Lcom/anfengde/epub/ui/EPubWebView;->showContextMenu(Landroid/graphics/Rect;)V

    .line 874
    invoke-direct {p0}, Lcom/anfengde/epub/ui/EPubWebView;->drawSelectionHandles()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 879
    .end local v0    # "displayRect":Landroid/graphics/Rect;
    .end local v2    # "handleRect":Landroid/graphics/Rect;
    .end local v3    # "menuBoundsObject":Lorg/json/JSONObject;
    .end local v4    # "scale":F
    .end local v5    # "selectionBoundsObject":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 875
    :catch_0
    move-exception v1

    .line 877
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public tsjiSetContentWidth(F)V
    .locals 1
    .param p1, "contentWidth"    # F

    .prologue
    .line 886
    iget-object v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->mContext:Landroid/content/Context;

    invoke-virtual {p0, p1, v0}, Lcom/anfengde/epub/ui/EPubWebView;->getDensityDependentValue(FLandroid/content/Context;)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/anfengde/epub/ui/EPubWebView;->contentWidth:I

    .line 887
    return-void
.end method

.method public tsjiStartSelectionMode()V
    .locals 0

    .prologue
    .line 826
    invoke-virtual {p0}, Lcom/anfengde/epub/ui/EPubWebView;->startSelectionMode()V

    .line 827
    return-void
.end method
