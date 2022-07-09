.class Lorg/jivesoftware/smack/debugger/LiteDebugger$1;
.super Ljava/awt/event/WindowAdapter;
.source "LiteDebugger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/debugger/LiteDebugger;->createDebug()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/debugger/LiteDebugger;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/debugger/LiteDebugger;)V
    .locals 0

    .prologue
    .line 69
    iput-object p1, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$1;->this$0:Lorg/jivesoftware/smack/debugger/LiteDebugger;

    invoke-direct {p0}, Ljava/awt/event/WindowAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public windowClosing(Ljava/awt/event/WindowEvent;)V
    .locals 1
    .param p1, "evt"    # Ljava/awt/event/WindowEvent;

    .prologue
    .line 71
    iget-object v0, p0, Lorg/jivesoftware/smack/debugger/LiteDebugger$1;->this$0:Lorg/jivesoftware/smack/debugger/LiteDebugger;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smack/debugger/LiteDebugger;->rootWindowClosing(Ljava/awt/event/WindowEvent;)V

    .line 72
    return-void
.end method
