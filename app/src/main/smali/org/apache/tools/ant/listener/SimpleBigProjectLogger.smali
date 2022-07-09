.class public Lorg/apache/tools/ant/listener/SimpleBigProjectLogger;
.super Lorg/apache/tools/ant/NoBannerLogger;
.source "SimpleBigProjectLogger.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/apache/tools/ant/NoBannerLogger;-><init>()V

    return-void
.end method


# virtual methods
.method protected extractTargetName(Lorg/apache/tools/ant/BuildEvent;)Ljava/lang/String;
    .locals 4
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 37
    invoke-super {p0, p1}, Lorg/apache/tools/ant/NoBannerLogger;->extractTargetName(Lorg/apache/tools/ant/BuildEvent;)Ljava/lang/String;

    move-result-object v1

    .line 38
    .local v1, "targetName":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/listener/SimpleBigProjectLogger;->extractProjectName(Lorg/apache/tools/ant/BuildEvent;)Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "projectName":Ljava/lang/String;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 40
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const/16 v3, 0x2e

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 42
    .end local v1    # "targetName":Ljava/lang/String;
    :cond_0
    return-object v1
.end method
