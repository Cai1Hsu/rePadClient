.class public Lorg/apache/tools/ant/taskdefs/condition/TypeFound;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "TypeFound.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field private name:Ljava/lang/String;

.field private uri:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    return-void
.end method


# virtual methods
.method protected doesTypeExist(Ljava/lang/String;)Z
    .locals 6
    .param p1, "typename"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 62
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/TypeFound;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/tools/ant/ComponentHelper;->getComponentHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/ComponentHelper;

    move-result-object v3

    .line 64
    .local v3, "helper":Lorg/apache/tools/ant/ComponentHelper;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/condition/TypeFound;->uri:Ljava/lang/String;

    invoke-static {v5, p1}, Lorg/apache/tools/ant/ProjectHelper;->genComponentName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 65
    .local v0, "componentName":Ljava/lang/String;
    invoke-virtual {v3, v0}, Lorg/apache/tools/ant/ComponentHelper;->getDefinition(Ljava/lang/String;)Lorg/apache/tools/ant/AntTypeDefinition;

    move-result-object v1

    .line 66
    .local v1, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    if-nez v1, :cond_1

    .line 75
    :cond_0
    :goto_0
    return v2

    .line 70
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/TypeFound;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/apache/tools/ant/AntTypeDefinition;->getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v5

    if-eqz v5, :cond_2

    const/4 v2, 0x1

    .line 71
    .local v2, "found":Z
    :cond_2
    if-nez v2, :cond_0

    .line 72
    const-string/jumbo v5, "type"

    invoke-virtual {v3, v0, v5}, Lorg/apache/tools/ant/ComponentHelper;->diagnoseCreationFailure(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 73
    .local v4, "text":Ljava/lang/String;
    const/4 v5, 0x3

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/condition/TypeFound;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public eval()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/TypeFound;->name:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 86
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "No type specified"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/TypeFound;->name:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/condition/TypeFound;->doesTypeExist(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/TypeFound;->name:Ljava/lang/String;

    .line 44
    return-void
.end method

.method public setURI(Ljava/lang/String;)V
    .locals 0
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 52
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/TypeFound;->uri:Ljava/lang/String;

    .line 53
    return-void
.end method
