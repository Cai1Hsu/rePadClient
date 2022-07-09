.class public Lorg/apache/tools/ant/taskdefs/Componentdef;
.super Lorg/apache/tools/ant/taskdefs/Definer;
.source "Componentdef.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Definer;-><init>()V

    .line 39
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Componentdef;->setRestrict(Z)V

    .line 40
    return-void
.end method
