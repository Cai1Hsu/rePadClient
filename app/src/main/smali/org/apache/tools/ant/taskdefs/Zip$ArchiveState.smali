.class public Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;
.super Ljava/lang/Object;
.source "Zip.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Zip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ArchiveState"
.end annotation


# instance fields
.field private outOfDate:Z

.field private resourcesToAdd:[[Lorg/apache/tools/ant/types/Resource;


# direct methods
.method constructor <init>(Z[[Lorg/apache/tools/ant/types/Resource;)V
    .locals 0
    .param p1, "state"    # Z
    .param p2, "r"    # [[Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 2104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2105
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->outOfDate:Z

    .line 2106
    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->resourcesToAdd:[[Lorg/apache/tools/ant/types/Resource;

    .line 2107
    return-void
.end method


# virtual methods
.method public getResourcesToAdd()[[Lorg/apache/tools/ant/types/Resource;
    .locals 1

    .prologue
    .line 2122
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->resourcesToAdd:[[Lorg/apache/tools/ant/types/Resource;

    return-object v0
.end method

.method public isOutOfDate()Z
    .locals 1

    .prologue
    .line 2114
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->outOfDate:Z

    return v0
.end method

.method public isWithoutAnyResources()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 2130
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->resourcesToAdd:[[Lorg/apache/tools/ant/types/Resource;

    if-nez v2, :cond_1

    .line 2140
    :cond_0
    :goto_0
    return v1

    .line 2133
    :cond_1
    const/4 v0, 0x0

    .local v0, "counter":I
    :goto_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->resourcesToAdd:[[Lorg/apache/tools/ant/types/Resource;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 2134
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->resourcesToAdd:[[Lorg/apache/tools/ant/types/Resource;

    aget-object v2, v2, v0

    if-eqz v2, :cond_2

    .line 2135
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->resourcesToAdd:[[Lorg/apache/tools/ant/types/Resource;

    aget-object v2, v2, v0

    array-length v2, v2

    if-lez v2, :cond_2

    .line 2136
    const/4 v1, 0x0

    goto :goto_0

    .line 2133
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
