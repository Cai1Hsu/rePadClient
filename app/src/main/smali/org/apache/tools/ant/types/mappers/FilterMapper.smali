.class public Lorg/apache/tools/ant/types/mappers/FilterMapper;
.super Lorg/apache/tools/ant/types/FilterChain;
.source "FilterMapper.java"

# interfaces
.implements Lorg/apache/tools/ant/util/FileNameMapper;


# static fields
.field private static final BUFFER_SIZE:I = 0x2000


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Lorg/apache/tools/ant/types/FilterChain;-><init>()V

    return-void
.end method


# virtual methods
.method public mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 7
    .param p1, "sourceFileName"    # Ljava/lang/String;

    .prologue
    .line 68
    :try_start_0
    new-instance v4, Ljava/io/StringReader;

    invoke-direct {v4, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    .line 69
    .local v4, "stringReader":Ljava/io/Reader;
    new-instance v2, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;

    invoke-direct {v2}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;-><init>()V

    .line 70
    .local v2, "helper":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    const/16 v5, 0x2000

    invoke-virtual {v2, v5}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setBufferSize(I)V

    .line 71
    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setPrimaryReader(Ljava/io/Reader;)V

    .line 72
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/mappers/FilterMapper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 73
    new-instance v1, Ljava/util/Vector;

    invoke-direct {v1}, Ljava/util/Vector;-><init>()V

    .line 74
    .local v1, "filterChains":Ljava/util/Vector;
    invoke-virtual {v1, p0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 75
    invoke-virtual {v2, v1}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setFilterChains(Ljava/util/Vector;)V

    .line 76
    invoke-virtual {v2}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->getAssembledReader()Ljava/io/Reader;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->safeReadFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v3

    .line 77
    .local v3, "result":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_0

    .line 78
    const/4 v5, 0x0

    .line 80
    :goto_0
    return-object v5

    :cond_0
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object v3, v5, v6
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 82
    .end local v1    # "filterChains":Ljava/util/Vector;
    .end local v2    # "helper":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    .end local v3    # "result":Ljava/lang/String;
    .end local v4    # "stringReader":Ljava/io/Reader;
    :catch_0
    move-exception v0

    .line 83
    .local v0, "ex":Lorg/apache/tools/ant/BuildException;
    throw v0

    .line 84
    .end local v0    # "ex":Lorg/apache/tools/ant/BuildException;
    :catch_1
    move-exception v0

    .line 85
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 3
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 46
    new-instance v0, Lorg/apache/tools/ant/UnsupportedAttributeException;

    const-string/jumbo v1, "filtermapper doesn\'t support the \"from\" attribute."

    const-string/jumbo v2, "from"

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/UnsupportedAttributeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 3
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 56
    new-instance v0, Lorg/apache/tools/ant/UnsupportedAttributeException;

    const-string/jumbo v1, "filtermapper doesn\'t support the \"to\" attribute."

    const-string/jumbo v2, "to"

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/UnsupportedAttributeException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v0
.end method
