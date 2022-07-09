.class public Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;
.super Ljava/lang/Object;
.source "TextSelectionJavascriptInterface.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "TextSelectionJavascriptInterface"


# instance fields
.field private final interfaceName:Ljava/lang/String;

.field private listener:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

.field mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "c"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string/jumbo v0, "TextSelection"

    iput-object v0, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->interfaceName:Ljava/lang/String;

    .line 32
    iput-object p1, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->mContext:Landroid/content/Context;

    .line 33
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;)V
    .locals 1
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    const-string/jumbo v0, "TextSelection"

    iput-object v0, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->interfaceName:Ljava/lang/String;

    .line 41
    iput-object p1, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->mContext:Landroid/content/Context;

    .line 42
    iput-object p2, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->listener:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

    .line 43
    return-void
.end method


# virtual methods
.method public endSelectionMode()V
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->listener:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

    if-eqz v0, :cond_0

    .line 79
    iget-object v0, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->listener:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

    invoke-interface {v0}, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;->tsjiEndSelectionMode()V

    .line 81
    :cond_0
    return-void
.end method

.method public getInterfaceName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 60
    const-string/jumbo v0, "TextSelection"

    return-object v0
.end method

.method public jsError(Ljava/lang/String;)V
    .locals 1
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->listener:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->listener:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

    invoke-interface {v0, p1}, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;->tsjiJSError(Ljava/lang/String;)V

    .line 53
    :cond_0
    return-void
.end method

.method public selectionChanged(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "range"    # Ljava/lang/String;
    .param p2, "text"    # Ljava/lang/String;
    .param p3, "handleBounds"    # Ljava/lang/String;
    .param p4, "menuBounds"    # Ljava/lang/String;

    .prologue
    .line 92
    iget-object v0, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->listener:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

    if-eqz v0, :cond_0

    .line 93
    iget-object v0, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->listener:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;->tsjiSelectionChanged(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    :cond_0
    return-void
.end method

.method public setContentWidth(F)V
    .locals 1
    .param p1, "contentWidth"    # F

    .prologue
    .line 98
    iget-object v0, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->listener:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->listener:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

    invoke-interface {v0, p1}, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;->tsjiSetContentWidth(F)V

    .line 100
    :cond_0
    return-void
.end method

.method public startSelectionMode()V
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->listener:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterface;->listener:Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;

    invoke-interface {v0}, Lcom/brandontate/androidwebviewselection/TextSelectionJavascriptInterfaceListener;->tsjiStartSelectionMode()V

    .line 71
    :cond_0
    return-void
.end method
