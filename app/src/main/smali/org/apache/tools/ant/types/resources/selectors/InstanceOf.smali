.class public Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;
.super Ljava/lang/Object;
.source "InstanceOf.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# static fields
.field private static final ONE_ONLY:Ljava/lang/String; = "Exactly one of class|type must be set."


# instance fields
.field private clazz:Ljava/lang/Class;

.field private project:Lorg/apache/tools/ant/Project;

.field private type:Ljava/lang/String;

.field private uri:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCheckClass()Ljava/lang/Class;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->clazz:Ljava/lang/Class;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getURI()Ljava/lang/String;
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->uri:Ljava/lang/String;

    return-object v0
.end method

.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 7
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 106
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->clazz:Ljava/lang/Class;

    if-nez v3, :cond_0

    move v3, v4

    :goto_0
    iget-object v6, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->type:Ljava/lang/String;

    if-nez v6, :cond_1

    :goto_1
    if-ne v3, v4, :cond_2

    .line 107
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Exactly one of class|type must be set."

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    move v3, v5

    .line 106
    goto :goto_0

    :cond_1
    move v4, v5

    goto :goto_1

    .line 109
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->clazz:Ljava/lang/Class;

    .line 110
    .local v0, "c":Ljava/lang/Class;
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->type:Ljava/lang/String;

    if-eqz v3, :cond_5

    .line 111
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->project:Lorg/apache/tools/ant/Project;

    if-nez v3, :cond_3

    .line 112
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "No project set for InstanceOf ResourceSelector; the type attribute is invalid."

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 116
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->project:Lorg/apache/tools/ant/Project;

    invoke-static {v3}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->uri:Ljava/lang/String;

    iget-object v5, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->type:Ljava/lang/String;

    invoke-static {v4, v5}, Lorg/apache/tools/ant/ProjectHelper;->genComponentName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/ComponentHelper;->getDefinition(Ljava/lang/String;)Lorg/apache/tools/ant/AntTypeDefinition;

    move-result-object v1

    .line 118
    .local v1, "d":Lorg/apache/tools/ant/AntTypeDefinition;
    if-nez v1, :cond_4

    .line 119
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->type:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " not found."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 122
    :cond_4
    :try_start_0
    invoke-virtual {v1}, Lorg/apache/tools/ant/AntTypeDefinition;->innerGetTypeClass()Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 127
    .end local v1    # "d":Lorg/apache/tools/ant/AntTypeDefinition;
    :cond_5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    return v3

    .line 123
    .restart local v1    # "d":Lorg/apache/tools/ant/AntTypeDefinition;
    :catch_0
    move-exception v2

    .line 124
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method public setClass(Ljava/lang/Class;)V
    .locals 2
    .param p1, "c"    # Ljava/lang/Class;

    .prologue
    .line 53
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->clazz:Ljava/lang/Class;

    if-eqz v0, :cond_0

    .line 54
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "The class attribute has already been set."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->clazz:Ljava/lang/Class;

    .line 57
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 45
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->project:Lorg/apache/tools/ant/Project;

    .line 46
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 64
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->type:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setURI(Ljava/lang/String;)V
    .locals 0
    .param p1, "u"    # Ljava/lang/String;

    .prologue
    .line 72
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/InstanceOf;->uri:Ljava/lang/String;

    .line 73
    return-void
.end method
