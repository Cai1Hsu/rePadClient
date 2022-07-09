.class Lorg/jivesoftware/smackx/workgroup/user/Workgroup$3;
.super Ljava/lang/Object;
.source "Workgroup.java"

# interfaces
.implements Lorg/jivesoftware/smack/PacketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/workgroup/user/Workgroup;-><init>(Ljava/lang/String;Lorg/jivesoftware/smack/Connection;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/workgroup/user/Workgroup;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;)V
    .locals 0

    .prologue
    .line 126
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$3;->this$0:Lorg/jivesoftware/smackx/workgroup/user/Workgroup;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public processPacket(Lorg/jivesoftware/smack/packet/Packet;)V
    .locals 1
    .param p1, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 128
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/user/Workgroup$3;->this$0:Lorg/jivesoftware/smackx/workgroup/user/Workgroup;

    invoke-static {v0, p1}, Lorg/jivesoftware/smackx/workgroup/user/Workgroup;->access$300(Lorg/jivesoftware/smackx/workgroup/user/Workgroup;Lorg/jivesoftware/smack/packet/Packet;)V

    .line 129
    return-void
.end method
