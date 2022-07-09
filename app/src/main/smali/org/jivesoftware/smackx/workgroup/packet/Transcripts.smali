.class public Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;
.super Lorg/jivesoftware/smack/packet/IQ;
.source "Transcripts.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$AgentDetail;,
        Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;
    }
.end annotation


# static fields
.field private static final UTC_FORMAT:Ljava/text/SimpleDateFormat;


# instance fields
.field private summaries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;",
            ">;"
        }
    .end annotation
.end field

.field private userID:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 36
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "yyyyMMdd\'T\'HH:mm:ss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->UTC_FORMAT:Ljava/text/SimpleDateFormat;

    .line 38
    sget-object v0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->UTC_FORMAT:Ljava/text/SimpleDateFormat;

    const-string/jumbo v1, "GMT+0"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 39
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "userID"    # Ljava/lang/String;

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 51
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->userID:Ljava/lang/String;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->summaries:Ljava/util/List;

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .param p1, "userID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 62
    .local p2, "summaries":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;>;"
    invoke-direct {p0}, Lorg/jivesoftware/smack/packet/IQ;-><init>()V

    .line 63
    iput-object p1, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->userID:Ljava/lang/String;

    .line 64
    iput-object p2, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->summaries:Ljava/util/List;

    .line 65
    return-void
.end method

.method static synthetic access$000()Ljava/text/SimpleDateFormat;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->UTC_FORMAT:Ljava/text/SimpleDateFormat;

    return-object v0
.end method


# virtual methods
.method public getChildElementXML()Ljava/lang/String;
    .locals 5

    .prologue
    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 94
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string/jumbo v3, "<transcripts xmlns=\"http://jivesoftware.com/protocol/workgroup\" userID=\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->userID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\">"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    iget-object v3, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->summaries:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;

    .line 99
    .local v2, "transcriptSummary":Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;
    invoke-virtual {v2}, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 102
    .end local v2    # "transcriptSummary":Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;
    :cond_0
    const-string/jumbo v3, "</transcripts>"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getSummaries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/workgroup/packet/Transcripts$TranscriptSummary;",
            ">;"
        }
    .end annotation

    .prologue
    .line 88
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->summaries:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getUserID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lorg/jivesoftware/smackx/workgroup/packet/Transcripts;->userID:Ljava/lang/String;

    return-object v0
.end method
