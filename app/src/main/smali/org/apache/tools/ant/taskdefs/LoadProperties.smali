.class public Lorg/apache/tools/ant/taskdefs/LoadProperties;
.super Lorg/apache/tools/ant/Task;
.source "LoadProperties.java"


# instance fields
.field private encoding:Ljava/lang/String;

.field private final filterChains:Ljava/util/Vector;

.field private prefix:Ljava/lang/String;

.field private prefixValues:Z

.field private src:Lorg/apache/tools/ant/types/Resource;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 48
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 53
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    .line 58
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->filterChains:Ljava/util/Vector;

    .line 63
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->encoding:Ljava/lang/String;

    .line 68
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->prefix:Ljava/lang/String;

    .line 69
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->prefixValues:Z

    return-void
.end method

.method private declared-synchronized getRequiredJavaResource()Lorg/apache/tools/ant/types/resources/JavaResource;
    .locals 2

    .prologue
    .line 239
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v0, :cond_1

    .line 240
    new-instance v0, Lorg/apache/tools/ant/types/resources/JavaResource;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/JavaResource;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    .line 241
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/LoadProperties;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Resource;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 245
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    check-cast v0, Lorg/apache/tools/ant/types/resources/JavaResource;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 242
    :cond_1
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    instance-of v0, v0, Lorg/apache/tools/ant/types/resources/JavaResource;

    if-nez v0, :cond_0

    .line 243
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "expected a java resource as source"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 239
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "a"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 228
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    if-eqz v0, :cond_0

    .line 229
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only a single source is supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 228
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 231
    :cond_0
    :try_start_1
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 232
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only single-element resource collections are supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 235
    :cond_1
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 236
    monitor-exit p0

    return-void
.end method

.method public final addFilterChain(Lorg/apache/tools/ant/types/FilterChain;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/types/FilterChain;

    .prologue
    .line 219
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->filterChains:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 220
    return-void
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 117
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/LoadProperties;->getRequiredJavaResource()Lorg/apache/tools/ant/types/resources/JavaResource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/JavaResource;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public final execute()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 162
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v11, :cond_0

    .line 163
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v12, "A source resource is required."

    invoke-direct {v11, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 165
    :cond_0
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v11

    if-nez v11, :cond_2

    .line 166
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    instance-of v11, v11, Lorg/apache/tools/ant/types/resources/JavaResource;

    if-eqz v11, :cond_1

    .line 168
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Unable to find resource "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x1

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/LoadProperties;->log(Ljava/lang/String;I)V

    .line 212
    :goto_0
    return-void

    .line 171
    :cond_1
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Source resource does not exist: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 173
    :cond_2
    const/4 v0, 0x0

    .line 174
    .local v0, "bis":Ljava/io/BufferedInputStream;
    const/4 v3, 0x0

    .line 175
    .local v3, "instream":Ljava/io/Reader;
    const/4 v9, 0x0

    .line 178
    .local v9, "tis":Ljava/io/ByteArrayInputStream;
    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v11

    invoke-direct {v1, v11}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 179
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .local v1, "bis":Ljava/io/BufferedInputStream;
    :try_start_1
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->encoding:Ljava/lang/String;

    if-nez v11, :cond_5

    .line 180
    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .end local v3    # "instream":Ljava/io/Reader;
    .local v4, "instream":Ljava/io/Reader;
    move-object v3, v4

    .line 184
    .end local v4    # "instream":Ljava/io/Reader;
    .restart local v3    # "instream":Ljava/io/Reader;
    :goto_1
    new-instance v2, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;

    invoke-direct {v2}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;-><init>()V

    .line 185
    .local v2, "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setPrimaryReader(Ljava/io/Reader;)V

    .line 186
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->filterChains:Ljava/util/Vector;

    invoke-virtual {v2, v11}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setFilterChains(Ljava/util/Vector;)V

    .line 187
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/LoadProperties;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    invoke-virtual {v2, v11}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 188
    invoke-virtual {v2}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->getAssembledReader()Ljava/io/Reader;

    move-result-object v3

    .line 190
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v8

    .line 192
    .local v8, "text":Ljava/lang/String;
    if-eqz v8, :cond_4

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_4

    .line 193
    const-string/jumbo v11, "\n"

    invoke-virtual {v8, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_3

    .line 194
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v11, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    .line 196
    :cond_3
    new-instance v10, Ljava/io/ByteArrayInputStream;

    const-string/jumbo v11, "ISO-8859-1"

    invoke-virtual {v8, v11}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 197
    .end local v9    # "tis":Ljava/io/ByteArrayInputStream;
    .local v10, "tis":Ljava/io/ByteArrayInputStream;
    :try_start_2
    new-instance v7, Ljava/util/Properties;

    invoke-direct {v7}, Ljava/util/Properties;-><init>()V

    .line 198
    .local v7, "props":Ljava/util/Properties;
    invoke-virtual {v7, v10}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 200
    new-instance v6, Lorg/apache/tools/ant/taskdefs/Property;

    invoke-direct {v6}, Lorg/apache/tools/ant/taskdefs/Property;-><init>()V

    .line 201
    .local v6, "propertyTask":Lorg/apache/tools/ant/taskdefs/Property;
    invoke-virtual {v6, p0}, Lorg/apache/tools/ant/taskdefs/Property;->bindToOwner(Lorg/apache/tools/ant/Task;)V

    .line 202
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->prefix:Ljava/lang/String;

    invoke-virtual {v6, v11}, Lorg/apache/tools/ant/taskdefs/Property;->setPrefix(Ljava/lang/String;)V

    .line 203
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->prefixValues:Z

    invoke-virtual {v6, v11}, Lorg/apache/tools/ant/taskdefs/Property;->setPrefixValues(Z)V

    .line 204
    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/taskdefs/Property;->addProperties(Ljava/util/Properties;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-object v9, v10

    .line 209
    .end local v6    # "propertyTask":Lorg/apache/tools/ant/taskdefs/Property;
    .end local v7    # "props":Ljava/util/Properties;
    .end local v10    # "tis":Ljava/io/ByteArrayInputStream;
    .restart local v9    # "tis":Ljava/io/ByteArrayInputStream;
    :cond_4
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 210
    invoke-static {v9}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto/16 :goto_0

    .line 182
    .end local v2    # "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    .end local v8    # "text":Ljava/lang/String;
    :cond_5
    :try_start_3
    new-instance v4, Ljava/io/InputStreamReader;

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->encoding:Ljava/lang/String;

    invoke-direct {v4, v1, v11}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .end local v3    # "instream":Ljava/io/Reader;
    .restart local v4    # "instream":Ljava/io/Reader;
    move-object v3, v4

    .end local v4    # "instream":Ljava/io/Reader;
    .restart local v3    # "instream":Ljava/io/Reader;
    goto :goto_1

    .line 206
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    :catch_0
    move-exception v5

    .line 207
    .local v5, "ioe":Ljava/io/IOException;
    :goto_2
    :try_start_4
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Unable to load file: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/LoadProperties;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v13

    invoke-direct {v11, v12, v5, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 209
    .end local v5    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v11

    :goto_3
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 210
    invoke-static {v9}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v11

    .line 209
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    :catchall_1
    move-exception v11

    move-object v0, v1

    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_3

    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v9    # "tis":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v2    # "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    .restart local v8    # "text":Ljava/lang/String;
    .restart local v10    # "tis":Ljava/io/ByteArrayInputStream;
    :catchall_2
    move-exception v11

    move-object v9, v10

    .end local v10    # "tis":Ljava/io/ByteArrayInputStream;
    .restart local v9    # "tis":Ljava/io/ByteArrayInputStream;
    move-object v0, v1

    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_3

    .line 206
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v2    # "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    .end local v8    # "text":Ljava/lang/String;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    :catch_1
    move-exception v5

    move-object v0, v1

    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_2

    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v9    # "tis":Ljava/io/ByteArrayInputStream;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v2    # "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    .restart local v8    # "text":Ljava/lang/String;
    .restart local v10    # "tis":Ljava/io/ByteArrayInputStream;
    :catch_2
    move-exception v5

    move-object v9, v10

    .end local v10    # "tis":Ljava/io/ByteArrayInputStream;
    .restart local v9    # "tis":Ljava/io/ByteArrayInputStream;
    move-object v0, v1

    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_2
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 134
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/LoadProperties;->getRequiredJavaResource()Lorg/apache/tools/ant/types/resources/JavaResource;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/JavaResource;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 109
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/LoadProperties;->getRequiredJavaResource()Lorg/apache/tools/ant/types/resources/JavaResource;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/JavaResource;->setClasspath(Lorg/apache/tools/ant/types/Path;)V

    .line 110
    return-void
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 126
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/LoadProperties;->getRequiredJavaResource()Lorg/apache/tools/ant/types/resources/JavaResource;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/JavaResource;->setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V

    .line 127
    return-void
.end method

.method public final setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->encoding:Ljava/lang/String;

    .line 102
    return-void
.end method

.method public setPrefix(Ljava/lang/String;)V
    .locals 0
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 142
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->prefix:Ljava/lang/String;

    .line 143
    return-void
.end method

.method public setPrefixValues(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 152
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/LoadProperties;->prefixValues:Z

    .line 153
    return-void
.end method

.method public setResource(Ljava/lang/String;)V
    .locals 1
    .param p1, "resource"    # Ljava/lang/String;

    .prologue
    .line 86
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/LoadProperties;->getRequiredJavaResource()Lorg/apache/tools/ant/types/resources/JavaResource;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/JavaResource;->setName(Ljava/lang/String;)V

    .line 87
    return-void
.end method

.method public final setSrcFile(Ljava/io/File;)V
    .locals 1
    .param p1, "srcFile"    # Ljava/io/File;

    .prologue
    .line 77
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/LoadProperties;->addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 78
    return-void
.end method
