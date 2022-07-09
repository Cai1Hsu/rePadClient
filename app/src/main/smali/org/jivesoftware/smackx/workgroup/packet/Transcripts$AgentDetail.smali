.class public Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;
.super Ljava/lang/Object;
.source "Transcripts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AgentDetail"
.end annotation


# instance fields
.field private agentJID:Ljava/lang/String;

.field private joinTime:Ljava/util/Date;

.field private leftTime:Ljava/util/Date;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;)V
    .locals 0
    .param p1, "agentJID"    # Ljava/lang/String;
    .param p2, "joinTime"    # Ljava/util/Date;
    .param p3, "leftTime"    # Ljava/util/Date;

    .prologue
    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 196
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->agentJID:Ljava/lang/String;

    .line 197
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->joinTime:Ljava/util/Date;

    .line 198
    iput-object p3, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->leftTime:Ljava/util/Date;

    .line 199
    return-void
.end method


# virtual methods
.method public getAgentJID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 207
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->agentJID:Ljava/lang/String;

    return-object v0
.end method

.method public getJoinTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->joinTime:Ljava/util/Date;

    return-object v0
.end method

.method public getLeftTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 225
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->leftTime:Ljava/util/Date;

    return-object v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 4

    .prologue
    .line 229
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 231
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v1, "<agent>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->agentJID:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 234
    const-string/jumbo v1, "<agentJID>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->agentJID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</agentJID>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    :cond_0
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->joinTime:Ljava/util/Date;

    if-eqz v1, :cond_1

    .line 237
    const-string/jumbo v1, "<joinTime>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->access$000()Ljava/text/SimpleDateFormat;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->joinTime:Ljava/util/Date;

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</joinTime>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    :cond_1
    iget-object v1, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->leftTime:Ljava/util/Date;

    if-eqz v1, :cond_2

    .line 240
    const-string/jumbo v1, "<leftTime>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->access$000()Ljava/text/SimpleDateFormat;

    move-result-object v2

    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->leftTime:Ljava/util/Date;

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "</leftTime>"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    :cond_2
    const-string/jumbo v1, "</agent>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 244
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
