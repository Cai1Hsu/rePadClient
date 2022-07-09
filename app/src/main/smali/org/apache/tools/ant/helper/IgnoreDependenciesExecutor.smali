.class public Lorg/apache/tools/ant/helper/IgnoreDependenciesExecutor;
.super Ljava/lang/Object;
.source "IgnoreDependenciesExecutor.java"

# interfaces
.implements Lorg/apache/tools/ant/Executor;


# static fields
.field private static final SUB_EXECUTOR:Lorg/apache/tools/ant/helper/SingleCheckExecutor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    new-instance v0, Lorg/apache/tools/ant/helper/SingleCheckExecutor;

    invoke-direct {v0}, Lorg/apache/tools/ant/helper/SingleCheckExecutor;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/helper/IgnoreDependenciesExecutor;->SUB_EXECUTOR:Lorg/apache/tools/ant/helper/SingleCheckExecutor;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public executeTargets(Lorg/apache/tools/ant/Project;[Ljava/lang/String;)V
    .locals 8
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "targetNames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 43
    invoke-virtual {p1}, Lorg/apache/tools/ant/Project;->getTargets()Ljava/util/Hashtable;

    move-result-object v3

    .line 44
    .local v3, "targets":Ljava/util/Hashtable;
    const/4 v4, 0x0

    .line 45
    .local v4, "thrownException":Lorg/apache/tools/ant/BuildException;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v5, p2

    if-ge v1, v5, :cond_2

    .line 47
    :try_start_0
    aget-object v5, p2, v1

    invoke-virtual {v3, v5}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/Target;

    .line 48
    .local v2, "t":Lorg/apache/tools/ant/Target;
    if-nez v2, :cond_0

    .line 49
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Unknown target "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    aget-object v7, p2, v1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .end local v2    # "t":Lorg/apache/tools/ant/Target;
    :catch_0
    move-exception v0

    .line 53
    .local v0, "ex":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {p1}, Lorg/apache/tools/ant/Project;->isKeepGoingMode()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 54
    move-object v4, v0

    .line 45
    .end local v0    # "ex":Lorg/apache/tools/ant/BuildException;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 51
    .restart local v2    # "t":Lorg/apache/tools/ant/Target;
    :cond_0
    :try_start_1
    invoke-virtual {v2}, Lorg/apache/tools/ant/Target;->performTasks()V
    :try_end_1
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 56
    .end local v2    # "t":Lorg/apache/tools/ant/Target;
    .restart local v0    # "ex":Lorg/apache/tools/ant/BuildException;
    :cond_1
    throw v0

    .line 60
    .end local v0    # "ex":Lorg/apache/tools/ant/BuildException;
    :cond_2
    if-eqz v4, :cond_3

    .line 61
    throw v4

    .line 63
    :cond_3
    return-void
.end method

.method public getSubProjectExecutor()Lorg/apache/tools/ant/Executor;
    .locals 1

    .prologue
    .line 67
    sget-object v0, Lorg/apache/tools/ant/helper/IgnoreDependenciesExecutor;->SUB_EXECUTOR:Lorg/apache/tools/ant/helper/SingleCheckExecutor;

    return-object v0
.end method
