.class Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$1;
.super Ljava/awt/event/WindowAdapter;
.source "EnhancedDebuggerWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->createDebug()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;)V
    .locals 0

    .prologue
    .line 196
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$1;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-direct {p0}, Ljava/awt/event/WindowAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public windowClosing(Ljava/awt/event/WindowEvent;)V
    .locals 1
    .param p1, "evt"    # Ljava/awt/event/WindowEvent;

    .prologue
    .line 198
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow$1;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebuggerWindow;->rootWindowClosing(Ljava/awt/event/WindowEvent;)V

    .line 199
    return-void
.end method
