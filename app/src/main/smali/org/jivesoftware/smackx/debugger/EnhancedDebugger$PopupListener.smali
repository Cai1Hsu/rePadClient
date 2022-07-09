.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;
.super Ljava/awt/event/MouseAdapter;
.source "EnhancedDebugger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PopupListener"
.end annotation


# instance fields
.field popup:Ljavax/swing/JPopupMenu;

.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljavax/swing/JPopupMenu;)V
    .locals 0
    .param p2, "popupMenu"    # Ljavax/swing/JPopupMenu;

    .prologue
    .line 979
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-direct {p0}, Ljava/awt/event/MouseAdapter;-><init>()V

    .line 980
    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;->popup:Ljavax/swing/JPopupMenu;

    .line 981
    return-void
.end method

.method private maybeShowPopup(Ljava/awt/event/MouseEvent;)V
    .locals 4
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 992
    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->isPopupTrigger()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 993
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;->popup:Ljavax/swing/JPopupMenu;

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getComponent()Ljava/awt/Component;

    move-result-object v1

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getX()I

    move-result v2

    invoke-virtual {p1}, Ljava/awt/event/MouseEvent;->getY()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Ljavax/swing/JPopupMenu;->show(Ljava/awt/Component;II)V

    .line 995
    :cond_0
    return-void
.end method


# virtual methods
.method public mousePressed(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 984
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;->maybeShowPopup(Ljava/awt/event/MouseEvent;)V

    .line 985
    return-void
.end method

.method public mouseReleased(Ljava/awt/event/MouseEvent;)V
    .locals 0
    .param p1, "e"    # Ljava/awt/event/MouseEvent;

    .prologue
    .line 988
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$PopupListener;->maybeShowPopup(Ljava/awt/event/MouseEvent;)V

    .line 989
    return-void
.end method
