.class public Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;
.super Ljava/lang/Object;
.source "CvsTagEntry.java"


# instance fields
.field private filename:Ljava/lang/String;

.field private prevRevision:Ljava/lang/String;

.field private revision:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, p1, v0, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "revision"    # Ljava/lang/String;

    .prologue
    .line 48
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "revision"    # Ljava/lang/String;
    .param p3, "prevRevision"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->filename:Ljava/lang/String;

    .line 60
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->revision:Ljava/lang/String;

    .line 61
    iput-object p3, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->prevRevision:Ljava/lang/String;

    .line 62
    return-void
.end method


# virtual methods
.method public getFile()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public getPreviousRevision()Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->prevRevision:Ljava/lang/String;

    return-object v0
.end method

.method public getRevision()Ljava/lang/String;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->revision:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 93
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 94
    .local v0, "buffer":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->filename:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 95
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->revision:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 96
    const-string/jumbo v1, " was removed"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 97
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->prevRevision:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 98
    const-string/jumbo v1, "; previous revision was "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->prevRevision:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 107
    :cond_0
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 100
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->prevRevision:Ljava/lang/String;

    if-nez v1, :cond_2

    .line 101
    const-string/jumbo v1, " is new; current revision is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->revision:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 104
    :cond_2
    const-string/jumbo v1, " has changed from "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->prevRevision:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/CvsTagEntry;->revision:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0
.end method
