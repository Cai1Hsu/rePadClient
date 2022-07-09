.class public Lorg/apache/tools/ant/taskdefs/DefaultExcludes;
.super Lorg/apache/tools/ant/Task;
.source "DefaultExcludes.java"


# instance fields
.field private add:Ljava/lang/String;

.field private defaultrequested:Z

.field private echo:Z

.field private logLevel:I

.field private remove:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 35
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->add:Ljava/lang/String;

    .line 36
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->remove:Ljava/lang/String;

    .line 37
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->defaultrequested:Z

    .line 38
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->echo:Z

    .line 41
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->logLevel:I

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 49
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->defaultrequested:Z

    if-nez v3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->add:Ljava/lang/String;

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->remove:Ljava/lang/String;

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->echo:Z

    if-nez v3, :cond_0

    .line 50
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "<defaultexcludes> task must set at least one attribute (echo=\"false\" doesn\'t count since that is the default"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 54
    :cond_0
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->defaultrequested:Z

    if-eqz v3, :cond_1

    .line 55
    invoke-static {}, Lorg/apache/tools/ant/DirectoryScanner;->resetDefaultExcludes()V

    .line 57
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->add:Ljava/lang/String;

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 58
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->add:Ljava/lang/String;

    invoke-static {v3}, Lorg/apache/tools/ant/DirectoryScanner;->addDefaultExclude(Ljava/lang/String;)Z

    .line 60
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->remove:Ljava/lang/String;

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 61
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->remove:Ljava/lang/String;

    invoke-static {v3}, Lorg/apache/tools/ant/DirectoryScanner;->removeDefaultExclude(Ljava/lang/String;)Z

    .line 63
    :cond_3
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->echo:Z

    if-eqz v3, :cond_5

    .line 64
    new-instance v2, Ljava/lang/StringBuffer;

    const-string/jumbo v3, "Current Default Excludes:"

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 66
    .local v2, "message":Ljava/lang/StringBuffer;
    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 67
    invoke-static {}, Lorg/apache/tools/ant/DirectoryScanner;->getDefaultExcludes()[Ljava/lang/String;

    move-result-object v0

    .line 68
    .local v0, "excludes":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_4

    .line 69
    const-string/jumbo v3, "  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 70
    aget-object v3, v0, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 71
    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 68
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 73
    :cond_4
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->logLevel:I

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->log(Ljava/lang/String;I)V

    .line 75
    .end local v0    # "excludes":[Ljava/lang/String;
    .end local v1    # "i":I
    .end local v2    # "message":Ljava/lang/StringBuffer;
    :cond_5
    return-void
.end method

.method public setAdd(Ljava/lang/String;)V
    .locals 0
    .param p1, "add"    # Ljava/lang/String;

    .prologue
    .line 91
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->add:Ljava/lang/String;

    .line 92
    return-void
.end method

.method public setDefault(Z)V
    .locals 0
    .param p1, "def"    # Z

    .prologue
    .line 83
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->defaultrequested:Z

    .line 84
    return-void
.end method

.method public setEcho(Z)V
    .locals 0
    .param p1, "echo"    # Z

    .prologue
    .line 111
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->echo:Z

    .line 112
    return-void
.end method

.method public setRemove(Ljava/lang/String;)V
    .locals 0
    .param p1, "remove"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/DefaultExcludes;->remove:Ljava/lang/String;

    .line 102
    return-void
.end method
