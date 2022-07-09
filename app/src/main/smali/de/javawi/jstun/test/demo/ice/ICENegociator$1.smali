.class Lde/javawi/jstun/test/demo/ice/ICENegociator$1;
.super Ljava/lang/Object;
.source "ICENegociator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/javawi/jstun/test/demo/ice/ICENegociator;->gatherCandidateAddresses()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lde/javawi/jstun/test/demo/ice/ICENegociator;

.field final synthetic val$iface:Ljava/net/NetworkInterface;


# direct methods
.method constructor <init>(Lde/javawi/jstun/test/demo/ice/ICENegociator;Ljava/net/NetworkInterface;)V
    .locals 0

    .prologue
    .line 87
    iput-object p1, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator$1;->this$0:Lde/javawi/jstun/test/demo/ice/ICENegociator;

    iput-object p2, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator$1;->val$iface:Ljava/net/NetworkInterface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 88
    iget-object v0, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator$1;->this$0:Lde/javawi/jstun/test/demo/ice/ICENegociator;

    iget-object v1, p0, Lde/javawi/jstun/test/demo/ice/ICENegociator$1;->val$iface:Ljava/net/NetworkInterface;

    invoke-static {v0, v1}, Lde/javawi/jstun/test/demo/ice/ICENegociator;->access$000(Lde/javawi/jstun/test/demo/ice/ICENegociator;Ljava/net/NetworkInterface;)V

    .line 89
    return-void
.end method
