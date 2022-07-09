.class public Lorg/apache/tools/ant/taskdefs/BindTargets;
.super Lorg/apache/tools/ant/Task;
.source "BindTargets.java"


# instance fields
.field private extensionPoint:Ljava/lang/String;

.field private onMissingExtensionPoint:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

.field private targets:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/BindTargets;->targets:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 67
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/BindTargets;->extensionPoint:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 68
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "extensionPoint required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/BindTargets;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 71
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/BindTargets;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v2

    if-eqz v2, :cond_1

    const-string/jumbo v2, ""

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/BindTargets;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 73
    :cond_1
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "bindtargets only allowed as a top-level task"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 77
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/BindTargets;->onMissingExtensionPoint:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    if-nez v2, :cond_3

    .line 78
    sget-object v2, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->FAIL:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/BindTargets;->onMissingExtensionPoint:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    .line 80
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/BindTargets;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    const-string/jumbo v3, "ant.projectHelper"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/ProjectHelper;

    .line 83
    .local v0, "helper":Lorg/apache/tools/ant/ProjectHelper;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/BindTargets;->targets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 84
    .local v1, "itTarget":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 85
    invoke-virtual {v0}, Lorg/apache/tools/ant/ProjectHelper;->getExtensionStack()Ljava/util/List;

    move-result-object v3

    const/4 v2, 0x3

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/BindTargets;->extensionPoint:Ljava/lang/String;

    aput-object v5, v4, v2

    const/4 v5, 0x1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    aput-object v2, v4, v5

    const/4 v2, 0x2

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/BindTargets;->onMissingExtensionPoint:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    invoke-virtual {v5}, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 90
    :cond_4
    return-void
.end method

.method public setExtensionPoint(Ljava/lang/String;)V
    .locals 0
    .param p1, "extensionPoint"    # Ljava/lang/String;

    .prologue
    .line 41
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/BindTargets;->extensionPoint:Ljava/lang/String;

    .line 42
    return-void
.end method

.method public setOnMissingExtensionPoint(Ljava/lang/String;)V
    .locals 4
    .param p1, "onMissingExtensionPoint"    # Ljava/lang/String;

    .prologue
    .line 46
    :try_start_0
    invoke-static {p1}, Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;->valueOf(Ljava/lang/String;)Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/BindTargets;->onMissingExtensionPoint:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    return-void

    .line 47
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Invalid onMissingExtensionPoint: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setOnMissingExtensionPoint(Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;)V
    .locals 0
    .param p1, "onMissingExtensionPoint"    # Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    .prologue
    .line 53
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/BindTargets;->onMissingExtensionPoint:Lorg/apache/tools/ant/ProjectHelper$OnMissingExtensionPoint;

    .line 54
    return-void
.end method

.method public setTargets(Ljava/lang/String;)V
    .locals 4
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 57
    const-string/jumbo v3, ","

    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 58
    .local v2, "inputs":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_1

    .line 59
    aget-object v3, v2, v0

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 60
    .local v1, "input":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 61
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/BindTargets;->targets:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 64
    .end local v1    # "input":Ljava/lang/String;
    :cond_1
    return-void
.end method
