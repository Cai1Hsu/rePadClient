.class public abstract Lorg/apache/tools/ant/types/selectors/MappingSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseSelector;
.source "MappingSelector.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field protected granularity:I

.field protected map:Lorg/apache/tools/ant/util/FileNameMapper;

.field protected mapperElement:Lorg/apache/tools/ant/types/Mapper;

.field protected targetdir:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 51
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;-><init>()V

    .line 40
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->targetdir:Ljava/io/File;

    .line 41
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 42
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->granularity:I

    .line 52
    sget-object v0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/FileUtils;->getFileTimestampGranularity()J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->granularity:I

    .line 53
    return-void
.end method


# virtual methods
.method public addConfigured(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 2
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 86
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_1

    .line 87
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define more than one mapper"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 89
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 90
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
    .line 72
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_1

    .line 73
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define more than one mapper"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/MappingSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 76
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    return-object v0
.end method

.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 7
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    const/4 v3, 0x0

    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/MappingSelector;->validate()V

    .line 127
    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    invoke-interface {v4, p2}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 130
    .local v1, "destfiles":[Ljava/lang/String;
    if-nez v1, :cond_0

    .line 142
    :goto_0
    return v3

    .line 134
    :cond_0
    array-length v4, v1

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    aget-object v4, v1, v3

    if-nez v4, :cond_2

    .line 135
    :cond_1
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Invalid destination file results for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->targetdir:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " with filename "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 138
    :cond_2
    aget-object v2, v1, v3

    .line 139
    .local v2, "destname":Ljava/lang/String;
    sget-object v4, Lorg/apache/tools/ant/types/selectors/MappingSelector;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v5, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->targetdir:Ljava/io/File;

    invoke-virtual {v4, v5, v2}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 141
    .local v0, "destfile":Ljava/io/File;
    invoke-virtual {p0, p3, v0}, Lorg/apache/tools/ant/types/selectors/MappingSelector;->selectionTest(Ljava/io/File;Ljava/io/File;)Z

    move-result v3

    .line 142
    .local v3, "selected":Z
    goto :goto_0
.end method

.method protected abstract selectionTest(Ljava/io/File;Ljava/io/File;)Z
.end method

.method public setGranularity(I)V
    .locals 0
    .param p1, "granularity"    # I

    .prologue
    .line 160
    iput p1, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->granularity:I

    .line 161
    return-void
.end method

.method public setTargetdir(Ljava/io/File;)V
    .locals 0
    .param p1, "targetdir"    # Ljava/io/File;

    .prologue
    .line 63
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->targetdir:Ljava/io/File;

    .line 64
    return-void
.end method

.method public verifySettings()V
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->targetdir:Ljava/io/File;

    if-nez v0, :cond_0

    .line 98
    const-string/jumbo v0, "The targetdir attribute is required."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/MappingSelector;->setError(Ljava/lang/String;)V

    .line 100
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    if-nez v0, :cond_1

    .line 101
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-nez v0, :cond_2

    .line 102
    new-instance v0, Lorg/apache/tools/ant/util/IdentityMapper;

    invoke-direct {v0}, Lorg/apache/tools/ant/util/IdentityMapper;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 110
    :cond_1
    :goto_0
    return-void

    .line 104
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 105
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/MappingSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    if-nez v0, :cond_1

    .line 106
    const-string/jumbo v0, "Could not set <mapper> element."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/MappingSelector;->setError(Ljava/lang/String;)V

    goto :goto_0
.end method
