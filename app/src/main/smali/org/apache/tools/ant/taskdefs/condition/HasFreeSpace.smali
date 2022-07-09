.class public Lorg/apache/tools/ant/taskdefs/condition/HasFreeSpace;
.super Ljava/lang/Object;
.source "HasFreeSpace.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field private needed:Ljava/lang/String;

.field private partition:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private validate()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 62
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/HasFreeSpace;->partition:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 63
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Please set the partition attribute."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/HasFreeSpace;->needed:Ljava/lang/String;

    if-nez v0, :cond_1

    .line 66
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Please set the needed attribute."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 68
    :cond_1
    return-void
.end method


# virtual methods
.method public eval()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/condition/HasFreeSpace;->validate()V

    .line 47
    :try_start_0
    const-string/jumbo v5, "1.6"

    invoke-static {v5}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isAtLeastJavaVersion(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 49
    new-instance v1, Ljava/io/File;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/condition/HasFreeSpace;->partition:Ljava/lang/String;

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 50
    .local v1, "fs":Ljava/io/File;
    new-instance v4, Lorg/apache/tools/ant/util/ReflectWrapper;

    invoke-direct {v4, v1}, Lorg/apache/tools/ant/util/ReflectWrapper;-><init>(Ljava/lang/Object;)V

    .line 51
    .local v4, "w":Lorg/apache/tools/ant/util/ReflectWrapper;
    const-string/jumbo v5, "getFreeSpace"

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/util/ReflectWrapper;->invoke(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    .line 52
    .local v2, "free":J
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/condition/HasFreeSpace;->needed:Ljava/lang/String;

    invoke-static {v5}, Lorg/apache/tools/ant/util/StringUtils;->parseHumanSizes(Ljava/lang/String;)J

    move-result-wide v6

    cmp-long v5, v2, v6

    if-ltz v5, :cond_0

    const/4 v5, 0x1

    :goto_0
    return v5

    :cond_0
    const/4 v5, 0x0

    goto :goto_0

    .line 54
    .end local v1    # "fs":Ljava/io/File;
    .end local v2    # "free":J
    .end local v4    # "w":Lorg/apache/tools/ant/util/ReflectWrapper;
    :cond_1
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "HasFreeSpace condition not supported on Java5 or less."

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    :catch_0
    move-exception v0

    .line 57
    .local v0, "e":Ljava/lang/Exception;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method public getNeeded()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/HasFreeSpace;->needed:Ljava/lang/String;

    return-object v0
.end method

.method public getPartition()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/HasFreeSpace;->partition:Ljava/lang/String;

    return-object v0
.end method

.method public setNeeded(Ljava/lang/String;)V
    .locals 0
    .param p1, "needed"    # Ljava/lang/String;

    .prologue
    .line 99
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/HasFreeSpace;->needed:Ljava/lang/String;

    .line 100
    return-void
.end method

.method public setPartition(Ljava/lang/String;)V
    .locals 0
    .param p1, "partition"    # Ljava/lang/String;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/HasFreeSpace;->partition:Ljava/lang/String;

    .line 84
    return-void
.end method
