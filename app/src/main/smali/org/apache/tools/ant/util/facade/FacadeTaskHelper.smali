.class public Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;
.super Ljava/lang/Object;
.source "FacadeTaskHelper.java"


# instance fields
.field private args:Ljava/util/List;

.field private defaultValue:Ljava/lang/String;

.field private implementationClasspath:Lorg/apache/tools/ant/types/Path;

.field private magicValue:Ljava/lang/String;

.field private userChoice:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "defaultValue"    # Ljava/lang/String;
    .param p2, "magicValue"    # Ljava/lang/String;

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->args:Ljava/util/List;

    .line 77
    iput-object p1, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->defaultValue:Ljava/lang/String;

    .line 78
    iput-object p2, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->magicValue:Ljava/lang/String;

    .line 79
    return-void
.end method


# virtual methods
.method public addImplementationArgument(Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;)V
    .locals 1
    .param p1, "arg"    # Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;

    .prologue
    .line 120
    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->args:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    return-void
.end method

.method public getArgs()[Ljava/lang/String;
    .locals 7

    .prologue
    .line 129
    new-instance v5, Ljava/util/ArrayList;

    iget-object v6, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->args:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 130
    .local v5, "tmp":Ljava/util/List;
    iget-object v6, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->args:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "e":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 131
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;

    .line 133
    .local v0, "arg":Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getImplementation()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;->getParts(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 134
    .local v1, "curr":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v6, v1

    if-ge v3, v6, :cond_0

    .line 135
    aget-object v6, v1, v3

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 138
    .end local v0    # "arg":Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;
    .end local v1    # "curr":[Ljava/lang/String;
    .end local v3    # "i":I
    :cond_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    new-array v4, v6, [Ljava/lang/String;

    .line 139
    .local v4, "res":[Ljava/lang/String;
    invoke-interface {v5, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    return-object v6
.end method

.method public getExplicitChoice()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->userChoice:Ljava/lang/String;

    return-object v0
.end method

.method public getImplementation()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->userChoice:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->userChoice:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->magicValue:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->magicValue:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->defaultValue:Ljava/lang/String;

    goto :goto_0
.end method

.method public getImplementationClasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;
    .locals 1
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 160
    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->implementationClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 161
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->implementationClasspath:Lorg/apache/tools/ant/types/Path;

    .line 163
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->implementationClasspath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public hasBeenSet()Z
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->userChoice:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->magicValue:Ljava/lang/String;

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setImplementation(Ljava/lang/String;)V
    .locals 0
    .param p1, "userChoice"    # Ljava/lang/String;

    .prologue
    .line 94
    iput-object p1, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->userChoice:Ljava/lang/String;

    .line 95
    return-void
.end method

.method public setMagicValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "magicValue"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->magicValue:Ljava/lang/String;

    .line 87
    return-void
.end method
