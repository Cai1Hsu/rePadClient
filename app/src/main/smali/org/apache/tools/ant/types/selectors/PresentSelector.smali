.class public Lorg/apache/tools/ant/types/selectors/PresentSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseSelector;
.source "PresentSelector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/selectors/PresentSelector$FilePresence;
    }
.end annotation


# instance fields
.field private destmustexist:Z

.field private map:Lorg/apache/tools/ant/util/FileNameMapper;

.field private mapperElement:Lorg/apache/tools/ant/types/Mapper;

.field private targetdir:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 48
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;-><init>()V

    .line 39
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->targetdir:Ljava/io/File;

    .line 40
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 41
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 42
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->destmustexist:Z

    .line 49
    return-void
.end method


# virtual methods
.method public addConfigured(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 2
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 106
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_1

    .line 107
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define more than one mapper"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 110
    return-void
.end method

.method public createMapper()Lorg/apache/tools/ant/types/Mapper;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 92
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_1

    .line 93
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define more than one mapper"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/PresentSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 96
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    return-object v0
.end method

.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 7
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 162
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/PresentSelector;->validate()V

    .line 165
    iget-object v5, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    invoke-interface {v5, p2}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 168
    .local v1, "destfiles":[Ljava/lang/String;
    if-nez v1, :cond_0

    .line 178
    :goto_0
    return v4

    .line 172
    :cond_0
    array-length v5, v1

    if-ne v5, v3, :cond_1

    aget-object v5, v1, v4

    if-nez v5, :cond_2

    .line 173
    :cond_1
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Invalid destination file results for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->targetdir:Ljava/io/File;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " with filename "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 176
    :cond_2
    aget-object v2, v1, v4

    .line 177
    .local v2, "destname":Ljava/lang/String;
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->targetdir:Ljava/io/File;

    invoke-virtual {v5, v6, v2}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 178
    .local v0, "destfile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    iget-boolean v6, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->destmustexist:Z

    if-ne v5, v6, :cond_3

    :goto_1
    move v4, v3

    goto :goto_0

    :cond_3
    move v3, v4

    goto :goto_1
.end method

.method public setPresent(Lorg/apache/tools/ant/types/selectors/PresentSelector$FilePresence;)V
    .locals 1
    .param p1, "fp"    # Lorg/apache/tools/ant/types/selectors/PresentSelector$FilePresence;

    .prologue
    .line 125
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/selectors/PresentSelector$FilePresence;->getIndex()I

    move-result v0

    if-nez v0, :cond_0

    .line 126
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->destmustexist:Z

    .line 128
    :cond_0
    return-void
.end method

.method public setTargetdir(Ljava/io/File;)V
    .locals 0
    .param p1, "targetdir"    # Ljava/io/File;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->targetdir:Ljava/io/File;

    .line 84
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 55
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "{presentselector targetdir: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 56
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->targetdir:Ljava/io/File;

    if-nez v1, :cond_1

    .line 57
    const-string/jumbo v1, "NOT YET SET"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 61
    :goto_0
    const-string/jumbo v1, " present: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 62
    iget-boolean v1, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->destmustexist:Z

    if-eqz v1, :cond_2

    .line 63
    const-string/jumbo v1, "both"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 67
    :goto_1
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    if-eqz v1, :cond_3

    .line 68
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 72
    :cond_0
    :goto_2
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 59
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->targetdir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 65
    :cond_2
    const-string/jumbo v1, "srconly"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 69
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v1, :cond_0

    .line 70
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Mapper;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2
.end method

.method public verifySettings()V
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->targetdir:Ljava/io/File;

    if-nez v0, :cond_0

    .line 136
    const-string/jumbo v0, "The targetdir attribute is required."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/PresentSelector;->setError(Ljava/lang/String;)V

    .line 138
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    if-nez v0, :cond_1

    .line 139
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-nez v0, :cond_2

    .line 140
    new-instance v0, Lorg/apache/tools/ant/util/IdentityMapper;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/IdentityMapper;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 148
    :cond_1
    :goto_0
    return-void

    .line 142
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 143
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/PresentSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    if-nez v0, :cond_1

    .line 144
    const-string/jumbo v0, "Could not set <mapper> element."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/PresentSelector;->setError(Ljava/lang/String;)V

    goto :goto_0
.end method
