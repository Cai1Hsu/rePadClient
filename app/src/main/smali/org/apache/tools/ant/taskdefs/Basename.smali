.class public Lorg/apache/tools/ant/taskdefs/Basename;
.super Lorg/apache/tools/ant/Task;
.source "Basename.java"


# instance fields
.field private file:Ljava/io/File;

.field private property:Ljava/lang/String;

.field private suffix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

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
    const/16 v5, 0x2e

    const/4 v4, 0x0

    .line 88
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Basename;->property:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 89
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "property attribute required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Basename;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 91
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Basename;->file:Ljava/io/File;

    if-nez v2, :cond_1

    .line 92
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "file attribute required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Basename;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 94
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Basename;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    .line 95
    .local v1, "value":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Basename;->suffix:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Basename;->suffix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 99
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Basename;->suffix:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    sub-int v0, v2, v3

    .line 100
    .local v0, "pos":I
    if-lez v0, :cond_2

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Basename;->suffix:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v5, :cond_2

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v5, :cond_2

    .line 102
    add-int/lit8 v0, v0, -0x1

    .line 104
    :cond_2
    invoke-virtual {v1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 106
    .end local v0    # "pos":I
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Basename;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Basename;->property:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 63
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Basename;->file:Ljava/io/File;

    .line 64
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 71
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Basename;->property:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public setSuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "suffix"    # Ljava/lang/String;

    .prologue
    .line 79
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Basename;->suffix:Ljava/lang/String;

    .line 80
    return-void
.end method
