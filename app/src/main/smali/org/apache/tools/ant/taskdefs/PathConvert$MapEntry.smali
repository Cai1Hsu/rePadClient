.class public Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;
.super Ljava/lang/Object;
.source "PathConvert.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/PathConvert;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MapEntry"
.end annotation


# instance fields
.field private from:Ljava/lang/String;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/PathConvert;

.field private to:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/PathConvert;)V
    .locals 1
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/PathConvert;

    .prologue
    const/4 v0, 0x0

    .line 110
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;->this$0:Lorg/apache/tools/ant/taskdefs/PathConvert;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;->from:Ljava/lang/String;

    .line 114
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;->to:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public apply(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "elem"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x5c

    const/16 v3, 0x2f

    .line 142
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;->from:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;->to:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 143
    :cond_0
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Both \'from\' and \'to\' must be set in a map entry"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 148
    :cond_1
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/PathConvert;->access$000()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "cmpElem":Ljava/lang/String;
    :goto_0
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/PathConvert;->access$000()Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;->from:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 156
    .local v1, "cmpFrom":Ljava/lang/String;
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;->to:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;->from:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .end local p1    # "elem":Ljava/lang/String;
    :cond_2
    return-object p1

    .end local v0    # "cmpElem":Ljava/lang/String;
    .end local v1    # "cmpFrom":Ljava/lang/String;
    .restart local p1    # "elem":Ljava/lang/String;
    :cond_3
    move-object v0, p1

    .line 148
    goto :goto_0

    .line 150
    .restart local v0    # "cmpElem":Ljava/lang/String;
    :cond_4
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;->from:Ljava/lang/String;

    goto :goto_1
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 124
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;->from:Ljava/lang/String;

    .line 125
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 0
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 132
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/PathConvert$MapEntry;->to:Ljava/lang/String;

    .line 133
    return-void
.end method
