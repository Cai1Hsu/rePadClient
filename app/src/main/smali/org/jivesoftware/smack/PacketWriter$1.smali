.class Lorg/jivesoftware/smack/PacketWriter$1;
.super Ljava/lang/Thread;
.source "PacketWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/PacketWriter;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/PacketWriter;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/PacketWriter;)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketWriter$1;->this$0:Lorg/jivesoftware/smack/PacketWriter;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketWriter$1;->this$0:Lorg/jivesoftware/smack/PacketWriter;

    invoke-static {v0, p0}, Lorg/jivesoftware/smack/PacketWriter;->access$000(Lorg/jivesoftware/smack/PacketWriter;Ljava/lang/Thread;)V

    .line 70
    return-void
.end method
