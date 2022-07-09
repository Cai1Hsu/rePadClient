.class Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$1;
.super Ljava/lang/Object;
.source "TransportCandidate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->check(Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 0

    .prologue
    .line 353
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 359
    :try_start_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    invoke-virtual {v3}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 360
    .local v0, "candAddress":Ljava/net/InetAddress;
    const/4 v2, 0x1

    .line 365
    .end local v0    # "candAddress":Ljava/net/InetAddress;
    .local v2, "isUsable":Z
    :goto_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    invoke-virtual {v3, v2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->triggerCandidateChecked(Z)V

    .line 369
    return-void

    .line 362
    .end local v2    # "isUsable":Z
    :catch_0
    move-exception v1

    .line 363
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    .restart local v2    # "isUsable":Z
    goto :goto_0
.end method
