.class public Lorg/apache/tools/ant/helper/DefaultExecutor;
.super Ljava/lang/Object;
.source "DefaultExecutor.java"

# interfaces
.implements Lorg/apache/tools/ant/Executor;


# static fields
.field private static final SUB_EXECUTOR:Lorg/apache/tools/ant/helper/SingleCheckExecutor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    new-instance v0, Lorg/apache/tools/ant/helper/SingleCheckExecutor;

    invoke-direct {v0}, Lorg/apache/tools/ant/helper/SingleCheckExecutor;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/helper/DefaultExecutor;->SUB_EXECUTOR:Lorg/apache/tools/ant/helper/SingleCheckExecutor;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public executeTargets(Lorg/apache/tools/ant/Project;[Ljava/lang/String;)V
    .locals 4
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "targetNames"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 38
    const/4 v2, 0x0

    .line 39
    .local v2, "thrownException":Lorg/apache/tools/ant/BuildException;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, p2

    if-ge v1, v3, :cond_1

    .line 41
    :try_start_0
    aget-object v3, p2, v1

    invoke-virtual {p1, v3}, Lorg/apache/tools/ant/Project;->executeTarget(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 42
    :catch_0
    move-exception v0

    .line 43
    .local v0, "ex":Lorg/apache/tools/ant/BuildException;
    invoke-virtual {p1}, Lorg/apache/tools/ant/Project;->isKeepGoingMode()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 44
    move-object v2, v0

    goto :goto_1

    .line 46
    :cond_0
    throw v0

    .line 50
    .end local v0    # "ex":Lorg/apache/tools/ant/BuildException;
    :cond_1
    if-eqz v2, :cond_2

    .line 51
    throw v2

    .line 53
    :cond_2
    return-void
.end method

.method public getSubProjectExecutor()Lorg/apache/tools/ant/Executor;
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lorg/apache/tools/ant/helper/DefaultExecutor;->SUB_EXECUTOR:Lorg/apache/tools/ant/helper/SingleCheckExecutor;

    return-object v0
.end method
