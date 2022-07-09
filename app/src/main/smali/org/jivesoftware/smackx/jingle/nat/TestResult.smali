.class public Lorg/jivesoftware/smackx/jingle/nat/TestResult;
.super Ljava/lang/Object;
.source "TestResult.java"


# instance fields
.field private ip:Ljava/lang/String;

.field private port:I

.field private result:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-boolean v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->result:Z

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->ip:Ljava/lang/String;

    .line 30
    iput v1, p0, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->port:I

    return-void
.end method


# virtual methods
.method public getIp()Ljava/lang/String;
    .locals 1

    .prologue
    .line 41
    iget-object v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->ip:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->port:I

    return v0
.end method

.method public isReachable()Z
    .locals 1

    .prologue
    .line 33
    iget-boolean v0, p0, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->result:Z

    return v0
.end method

.method public setIp(Ljava/lang/String;)V
    .locals 0
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 45
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->ip:Ljava/lang/String;

    .line 46
    return-void
.end method

.method public setPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 53
    iput p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->port:I

    .line 54
    return-void
.end method

.method public setResult(Z)V
    .locals 0
    .param p1, "result"    # Z

    .prologue
    .line 37
    iput-boolean p1, p0, Lorg/jivesoftware/smackx/jingle/nat/TestResult;->result:Z

    .line 38
    return-void
.end method
