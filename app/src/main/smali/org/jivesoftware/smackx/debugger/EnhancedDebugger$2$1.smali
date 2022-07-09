.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2$1;
.super Ljava/lang/Object;
.source "EnhancedDebugger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2;->processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2;

.field final synthetic val$packet:Lorg/jivesoftware/smack/packet/Packet;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2;Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 0

    .prologue
    .line 191
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2;

    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2$1;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 193
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2;

    iget-object v0, v0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    iget-object v1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2$1;->this$1:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2;

    iget-object v1, v1, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2;->dateFormatter:Ljava/text/SimpleDateFormat;

    iget-object v2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$2$1;->val$packet:Lorg/jivesoftware/smack/packet/Packet;

    invoke-static {v0, v1, v2}, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;->access$100(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljava/text/SimpleDateFormat;Lorg/jivesoftware/smack/packet/Packet;)V

    .line 194
    return-void
.end method
