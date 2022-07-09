.class Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1$1;
.super Ljava/lang/Object;
.source "ICECandidate.java"

# interfaces
.implements Lorg/jivesoftware/smackx/jingle/nat/ResultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;

.field final synthetic val$result:Lorg/jivesoftware/smackx/jingle/nat/TestResult;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;Lorg/jivesoftware/smackx/jingle/nat/TestResult;)V
    .locals 0

    .prologue
    .line 242
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1$1;->this$1:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;

    iput-object p2, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1$1;->val$result:Lorg/jivesoftware/smackx/jingle/nat/TestResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public testFinished(Lorg/jivesoftware/smackx/jingle/nat/TestResult;Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;)V
    .locals 3
    .param p1, "testResult"    # Lorg/jivesoftware/smackx/jingle/nat/TestResult;
    .param p2, "candidate"    # Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;

    .prologue
    .line 244
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->isReachable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1$1;->this$1:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;

    iget-object v0, v0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->val$checkingCandidate:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 245
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1$1;->val$result:Lorg/jivesoftware/smackx/jingle/nat/TestResult;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->setResult(Z)V

    .line 246
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->access$000()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Candidate reachable: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getIp()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Lorg/jivesoftware/smackx/jingle/nat/TransportCandidate;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1$1;->this$1:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;

    iget-object v2, v2, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getIp()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1$1;->this$1:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;

    iget-object v2, v2, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate$1;->this$0:Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/jingle/nat/ICECandidate;->getPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 248
    :cond_0
    return-void
.end method
