.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$1;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->createDebug()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field dateFormatter:Ljava/text/SimpleDateFormat;

.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;)V
    .locals 2

    .prologue
    .line 172
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$1;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 173
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "hh:mm:ss:SS aaa"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$1;->dateFormatter:Ljava/text/SimpleDateFormat;

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 1
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 176
    new-instance v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$1$1;

    invoke-direct {v0, p0, p1}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$1$1;-><init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$1;Lorg/jivesoftware/smack/packet/Packet;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    .line 182
    return-void
.end method
