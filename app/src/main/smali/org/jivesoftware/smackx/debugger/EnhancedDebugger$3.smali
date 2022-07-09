.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Lorg/jivesoftware/smack/ConnectionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->createDebug()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V
    .locals 0

    .prologue
    .line 201
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public connectionClosed()V
    .locals 1

    .prologue
    .line 203
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$1;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$1;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 210
    return-void
.end method

.method public connectionClosedOnError(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 213
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$2;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$2;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;Ljava/lang/Exception;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 220
    return-void
.end method

.method public reconnectingIn(I)V
    .locals 1
    .param p1, "seconds"    # I

    .prologue
    .line 222
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$3;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$3;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;I)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 227
    return-void
.end method

.method public reconnectionFailed(Ljava/lang/Exception;)V
    .locals 1
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 239
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$5;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$5;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 244
    return-void
.end method

.method public reconnectionSuccessful()V
    .locals 1

    .prologue
    .line 230
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$4;

    invoke-direct {v0, p0}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3$4;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$3;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 236
    return-void
.end method
