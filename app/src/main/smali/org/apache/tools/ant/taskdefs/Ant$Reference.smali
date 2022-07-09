.class public Lorg/apache/tools/ant/taskdefs/Ant$Reference;
.super Lorg/apache/tools/ant/types/Reference;
.source "Ant.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Ant;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Reference"
.end annotation


# instance fields
.field private targetid:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 779
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Reference;-><init>()V

    .line 782
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant$Reference;->targetid:Ljava/lang/String;

    .line 780
    return-void
.end method


# virtual methods
.method public getToRefid()Ljava/lang/String;
    .locals 1

    .prologue
    .line 801
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ant$Reference;->targetid:Ljava/lang/String;

    return-object v0
.end method

.method public setToRefid(Ljava/lang/String;)V
    .locals 0
    .param p1, "targetid"    # Ljava/lang/String;

    .prologue
    .line 791
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Ant$Reference;->targetid:Ljava/lang/String;

    .line 792
    return-void
.end method
