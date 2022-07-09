.class Lorg/jivesoftware/smack/PacketReader$1;
.super Ljava/lang/Thread;
.source "PacketReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smack/PacketReader;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smack/PacketReader;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smack/PacketReader;)V
    .locals 0

    .prologue
    .line 68
    iput-object p1, p0, Lorg/jivesoftware/smack/PacketReader$1;->this$0:Lorg/jivesoftware/smack/PacketReader;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lorg/jivesoftware/smack/PacketReader$1;->this$0:Lorg/jivesoftware/smack/PacketReader;

    invoke-static {v0, p0}, Lorg/jivesoftware/smack/PacketReader;->access$000(Lorg/jivesoftware/smack/PacketReader;Ljava/lang/Thread;)V

    .line 71
    return-void
.end method
