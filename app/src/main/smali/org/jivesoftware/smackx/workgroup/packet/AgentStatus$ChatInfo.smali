.class public Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;
.super Ljava/lang/Object;
.source "AgentStatus.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChatInfo"
.end annotation


# instance fields
.field private date:Ljava/util/Date;

.field private email:Ljava/lang/String;

.field private question:Ljava/lang/String;

.field private sessionID:Ljava/lang/String;

.field private userID:Ljava/lang/String;

.field private username:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "sessionID"    # Ljava/lang/String;
    .param p2, "userID"    # Ljava/lang/String;
    .param p3, "date"    # Ljava/util/Date;
    .param p4, "email"    # Ljava/lang/String;
    .param p5, "username"    # Ljava/lang/String;
    .param p6, "question"    # Ljava/lang/String;

    .prologue
    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 124
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->sessionID:Ljava/lang/String;

    .line 125
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->userID:Ljava/lang/String;

    .line 126
    iput-object p3, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->date:Ljava/util/Date;

    .line 127
    iput-object p4, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->email:Ljava/lang/String;

    .line 128
    iput-object p5, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->username:Ljava/lang/String;

    .line 129
    iput-object p6, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->question:Ljava/lang/String;

    .line 130
    return-void
.end method


# virtual methods
.method public getDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->date:Ljava/util/Date;

    return-object v0
.end method

.method public getEmail()Ljava/lang/String;
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->email:Ljava/lang/String;

    return-object v0
.end method

.method public getQuestion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->question:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->sessionID:Ljava/lang/String;

    return-object v0
.end method

.method public getUserID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->userID:Ljava/lang/String;

    return-object v0
.end method

.method public getUsername()Ljava/lang/String;
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->username:Ljava/lang/String;

    return-object v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 4

    .prologue
    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 193
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<chat "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->sessionID:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 195
    const-string/jumbo v1, " sessionID=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->sessionID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 197
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->userID:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 198
    const-string/jumbo v1, " userID=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->userID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->date:Ljava/util/Date;

    if-eqz v1, :cond_2

    .line 201
    const-string/jumbo v1, " startTime=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus;->access$000()Ljava/text/SimpleDateFormat;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->date:Ljava/util/Date;

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    :cond_2
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->email:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 204
    const-string/jumbo v1, " email=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->email:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    :cond_3
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->username:Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 207
    const-string/jumbo v1, " username=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->username:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    :cond_4
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->question:Ljava/lang/String;

    if-eqz v1, :cond_5

    .line 210
    const-string/jumbo v1, " question=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/AgentStatus$ChatInfo;->question:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    :cond_5
    const-string/jumbo v1, "/>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
