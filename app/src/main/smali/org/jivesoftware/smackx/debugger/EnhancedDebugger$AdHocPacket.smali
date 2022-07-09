.class Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$AdHocPacket;
.super Lorg/jivesoftware/smack/packet/Packet;
.source "EnhancedDebugger.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AdHocPacket"
.end annotation


# instance fields
.field private text:Ljava/lang/String;

.field final synthetic this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;Ljava/lang/String;)V
    .locals 0
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 962
    iput-object p1, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$AdHocPacket;->this$0:Lorg/jivesoftware/smackx/debugger/EnhancedDebugger;

    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/Packet;-><init>()V

    .line 963
    iput-object p2, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$AdHocPacket;->text:Ljava/lang/String;

    .line 964
    return-void
.end method


# virtual methods
.method public toXML()Ljava/lang/String;
    .locals 1

    .prologue
    .line 967
    iget-object v0, p0, Lorg/jivesoftware/smackx/debugger/EnhancedDebugger$AdHocPacket;->text:Ljava/lang/String;

    return-object v0
.end method
