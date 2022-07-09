.class public Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheckin;
.super Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;
.source "CCMCheckin.java"


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;-><init>()V

    .line 34
    const-string/jumbo v0, "ci"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheckin;->setCcmAction(Ljava/lang/String;)V

    .line 35
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Checkin "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheckin;->setComment(Ljava/lang/String;)V

    .line 36
    return-void
.end method
