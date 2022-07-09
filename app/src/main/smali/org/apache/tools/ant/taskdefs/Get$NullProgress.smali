.class public Lorg/apache/tools/ant/taskdefs/Get$NullProgress;
.super Ljava/lang/Object;
.source "Get.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/Get$DownloadProgress;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Get;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NullProgress"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 471
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public beginDownload()V
    .locals 0

    .prologue
    .line 478
    return-void
.end method

.method public endDownload()V
    .locals 0

    .prologue
    .line 492
    return-void
.end method

.method public onTick()V
    .locals 0

    .prologue
    .line 485
    return-void
.end method
