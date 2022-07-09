.class public Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;
.super Ljava/lang/Object;
.source "Transcripts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TranscriptSummary"
.end annotation


# instance fields
.field private agentDetails:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;",
            ">;"
        }
    .end annotation
.end field

.field private joinTime:Ljava/util/Date;

.field private leftTime:Ljava/util/Date;

.field private sessionID:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;Ljava/util/List;)V
    .locals 0
    .param p1, "sessionID"    # Ljava/lang/String;
    .param p2, "joinTime"    # Ljava/util/Date;
    .param p3, "leftTime"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Date;",
            "Ljava/util/Date;",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 118
    .local p4, "agentDetails":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->sessionID:Ljava/lang/String;

    .line 120
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->joinTime:Ljava/util/Date;

    .line 121
    iput-object p3, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->leftTime:Ljava/util/Date;

    .line 122
    iput-object p4, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->agentDetails:Ljava/util/List;

    .line 123
    return-void
.end method


# virtual methods
.method public getAgentDetails()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;",
            ">;"
        }
    .end annotation

    .prologue
    .line 161
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->agentDetails:Ljava/util/List;

    return-object v0
.end method

.method public getJoinTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->joinTime:Ljava/util/Date;

    return-object v0
.end method

.method public getLeftTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->leftTime:Ljava/util/Date;

    return-object v0
.end method

.method public getSessionID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->sessionID:Ljava/lang/String;

    return-object v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 6

    .prologue
    .line 165
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 167
    .local v1, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v3, "<transcript sessionID=\""

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->sessionID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\">"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->joinTime:Ljava/util/Date;

    if-eqz v3, :cond_0

    .line 172
    const-string/jumbo v3, "<joinTime>"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->access$000()Ljava/text/SimpleDateFormat;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->joinTime:Ljava/util/Date;

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "</joinTime>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    :cond_0
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->leftTime:Ljava/util/Date;

    if-eqz v3, :cond_1

    .line 175
    const-string/jumbo v3, "<leftTime>"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->access$000()Ljava/text/SimpleDateFormat;

    move-result-object v4

    iget-object v5, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->leftTime:Ljava/util/Date;

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "</leftTime>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    :cond_1
    const-string/jumbo v3, "<agents>"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->agentDetails:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;

    .line 179
    .local v0, "agentDetail":Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 181
    .end local v0    # "agentDetail":Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;
    :cond_2
    const-string/jumbo v3, "</agents></transcript>"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
