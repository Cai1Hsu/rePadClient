.class Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;
.super Ljava/awt/event/MouseAdapter;
.source "LiteDebugger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/debugger/LiteDebugger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PopupListener"
.end annotation


# instance fields
.field popup:Ljavax/swing/JPopupMenu;

.field final synthetic this$0:Lorg/jivesoftware/smack/debugger/LiteDebugger;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;Ljavax/swing/JPopupMenu;)V
    .locals 0
    .param p2, "popupMenu"    # Ljavax/swing/JPopupMenu;

    .prologue
    .line 273
    iput-object p1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;->this$0:Lorg/jivesoftware/smack/debugger/LiteDebugger;

    invoke-direct {p0}, Ljava/awt/event/MouseAdapter;-><init>()V

    .line 274
    iput-object p2, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;->popup:Ljavax/swing/JPopupMenu;

    .line 275
    return-void
.end method

.method private maybeShowPopup(Ljava/awt/event/MouseEvent;)V
    .locals 4
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 286
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->isPopupTrigger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 287
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;->popup:Ljavax/swing/JPopupMenu;

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getComponent()Ljava/awt/Component;

    move-result-object v1

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getX()I

    move-result v2

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getY()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Ljavax/swing/JPopupMenu;->show(Ljava/awt/Component;II)V

    .line 289
    :cond_0
    return-void
.end method


# virtual methods
.method public mousePressed(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 278
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;->maybeShowPopup(Ljava/awt/event/MouseEvent;)V

    .line 279
    return-void
.end method

.method public mouseReleased(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 282
    invoke-direct {p0, p1}, Lorg/jivesoftware/smack/debugger/LiteDebugger$PopupListener;->maybeShowPopup(Ljava/awt/event/MouseEvent;)V

    .line 283
    return-void
.end method
