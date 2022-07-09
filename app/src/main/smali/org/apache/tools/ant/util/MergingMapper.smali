.class public Lorg/apache/tools/ant/util/MergingMapper;
.super Ljava/lang/Object;
.source "MergingMapper.java"

# interfaces
.implements Lorg/apache/tools/ant/util/FileNameMapper;


# instance fields
.field protected mergedFile:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/util/MergingMapper;->mergedFile:[Ljava/lang/String;

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/util/MergingMapper;->mergedFile:[Ljava/lang/String;

    .line 40
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/util/MergingMapper;->setTo(Ljava/lang/String;)V

    .line 41
    return-void
.end method


# virtual methods
.method public mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p1, "sourceFileName"    # Ljava/lang/String;

    .prologue
    .line 64
    iget-object v0, p0, Lorg/apache/tools/ant/util/MergingMapper;->mergedFile:[Ljava/lang/String;

    return-object v0
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 48
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 2
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 55
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    iput-object v0, p0, Lorg/apache/tools/ant/util/MergingMapper;->mergedFile:[Ljava/lang/String;

    .line 56
    return-void
.end method
