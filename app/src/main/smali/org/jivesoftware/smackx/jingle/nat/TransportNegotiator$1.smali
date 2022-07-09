.class Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$1;
.super Ljava/lang/Object;
.source "TransportNegotiator.java"

# interfaces
.implements Lorg/jivesoftware/smackx/jingle/nat/TransportResolverListener$Checker;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->checkRemoteCandidate(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

.field final synthetic val$offeredCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 0

    .prologue
    .line 248
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$1;->val$offeredCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public candidateChecked(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;Z)V
    .locals 2
    .param p1, "cand"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;
    .param p2, "validCandidate"    # Z

    .prologue
    .line 250
    if-eqz p2, :cond_0

    .line 251
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->getNegotiatorState()Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    move-result-object v0

    sget-object v1, Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;->PENDING:Lorg/jivesoftware/smackx/jingle/JingleNegotiatorState;

    if-ne v0, v1, :cond_0

    .line 252
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;

    iget-object v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator$1;->val$offeredCandidate:Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    invoke-static {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;->access$000(Lorg/jivesoftware/smackx/jingle/nat/TransportNegotiator;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V

    .line 254
    :cond_0
    return-void
.end method

.method public candidateChecking(Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 0
    .param p1, "cand"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 257
    return-void
.end method
