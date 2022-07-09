.class public Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheckinDefault;
.super Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;
.source "CCMCheckinDefault.java"


# static fields
.field public static final DEFAULT_TASK:Ljava/lang/String; = "default"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;-><init>()V

    .line 31
    const-string/jumbo v0, "ci"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheckinDefault;->setCcmAction(Ljava/lang/String;)V

    .line 32
    const-string/jumbo v0, "default"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheckinDefault;->setTask(Ljava/lang/String;)V

    .line 33
    return-void
.end method
