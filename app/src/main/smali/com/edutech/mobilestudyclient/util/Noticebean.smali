.class public Lcom/edutech/mobilestudyclient/util/Noticebean;
.super Ljava/lang/Object;
.source "Noticebean.java"


# instance fields
.field private actionid:Ljava/lang/String;

.field private creattime:Ljava/lang/String;

.field private message:Ljava/lang/String;

.field private messageid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getActionid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/util/Noticebean;->actionid:Ljava/lang/String;

    return-object v0
.end method

.method public getCreattime()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/util/Noticebean;->creattime:Ljava/lang/String;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/util/Noticebean;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 10
    iget-object v0, p0, Lcom/edutech/mobilestudyclient/util/Noticebean;->messageid:Ljava/lang/String;

    return-object v0
.end method

.method public setActionid(Ljava/lang/String;)V
    .locals 0
    .param p1, "actionid"    # Ljava/lang/String;

    .prologue
    .line 19
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/util/Noticebean;->actionid:Ljava/lang/String;

    .line 20
    return-void
.end method

.method public setCreattime(Ljava/lang/String;)V
    .locals 0
    .param p1, "creattime"    # Ljava/lang/String;

    .prologue
    .line 25
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/util/Noticebean;->creattime:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/util/Noticebean;->message:Ljava/lang/String;

    .line 32
    return-void
.end method

.method public setMessageid(Ljava/lang/String;)V
    .locals 0
    .param p1, "messageid"    # Ljava/lang/String;

    .prologue
    .line 13
    iput-object p1, p0, Lcom/edutech/mobilestudyclient/util/Noticebean;->messageid:Ljava/lang/String;

    .line 14
    return-void
.end method
