.class public Lorg/apache/tools/ant/types/selectors/DependSelector;
.super Lorg/apache/tools/ant/types/selectors/MappingSelector;
.source "DependSelector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/MappingSelector;-><init>()V

    .line 39
    return-void
.end method


# virtual methods
.method public selectionTest(Ljava/io/File;Ljava/io/File;)Z
    .locals 2
    .param p1, "srcfile"    # Ljava/io/File;
    .param p2, "destfile"    # Ljava/io/File;

    .prologue
    .line 72
    iget v1, p0, Lorg/apache/tools/ant/types/selectors/DependSelector;->granularity:I

    invoke-static {p1, p2, v1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->isOutOfDate(Ljava/io/File;Ljava/io/File;I)Z

    move-result v0

    .line 74
    .local v0, "selected":Z
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 45
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "{dependselector targetdir: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 46
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/DependSelector;->targetdir:Ljava/io/File;

    if-nez v1, :cond_1

    .line 47
    const-string/jumbo v1, "NOT YET SET"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 51
    :goto_0
    const-string/jumbo v1, " granularity: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 52
    iget v1, p0, Lorg/apache/tools/ant/types/selectors/DependSelector;->granularity:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 53
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/DependSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    if-eqz v1, :cond_2

    .line 54
    const-string/jumbo v1, " mapper: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 55
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/DependSelector;->map:Lorg/apache/tools/ant/util/FileNameMapper;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 60
    :cond_0
    :goto_1
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 61
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 49
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/DependSelector;->targetdir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 56
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/DependSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v1, :cond_0

    .line 57
    const-string/jumbo v1, " mapper: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 58
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/DependSelector;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Mapper;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method
