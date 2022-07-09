.class public Lorg/apache/tools/ant/types/resources/ResourceList;
.super Lorg/apache/tools/ant/types/DataType;
.source "ResourceList.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# instance fields
.field private volatile cached:Z

.field private final cachedResources:Lorg/apache/tools/ant/types/resources/Union;

.field private encoding:Ljava/lang/String;

.field private final filterChains:Ljava/util/Vector;

.field private final textDocuments:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 53
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 47
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->filterChains:Ljava/util/Vector;

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->textDocuments:Ljava/util/ArrayList;

    .line 49
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->cachedResources:Lorg/apache/tools/ant/types/resources/Union;

    .line 50
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->cached:Z

    .line 51
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->encoding:Ljava/lang/String;

    .line 54
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->cachedResources:Lorg/apache/tools/ant/types/resources/Union;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/Union;->setCache(Z)V

    .line 55
    return-void
.end method

.method private declared-synchronized cache()Lorg/apache/tools/ant/types/ResourceCollection;
    .locals 5

    .prologue
    .line 174
    monitor-enter p0

    :try_start_0
    iget-boolean v3, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->cached:Z

    if-nez v3, :cond_2

    .line 175
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->dieOnCircularReference()V

    .line 176
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->textDocuments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 177
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/ResourceCollection;

    .line 178
    .local v2, "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    invoke-interface {v2}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "r":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 179
    iget-object v4, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->cachedResources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/Resource;

    invoke-direct {p0, v3}, Lorg/apache/tools/ant/types/resources/ResourceList;->read(Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v3

    invoke-virtual {v4, v3}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 174
    .end local v0    # "iter":Ljava/util/Iterator;
    .end local v1    # "r":Ljava/util/Iterator;
    .end local v2    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 182
    .restart local v0    # "iter":Ljava/util/Iterator;
    :cond_1
    const/4 v3, 0x1

    :try_start_1
    iput-boolean v3, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->cached:Z

    .line 184
    .end local v0    # "iter":Ljava/util/Iterator;
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->cachedResources:Lorg/apache/tools/ant/types/resources/Union;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v3
.end method

.method private parse(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;
    .locals 5
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 221
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v3

    .line 223
    .local v3, "propertyHelper":Lorg/apache/tools/ant/PropertyHelper;
    invoke-virtual {v3, p1}, Lorg/apache/tools/ant/PropertyHelper;->parseProperties(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 224
    .local v1, "expanded":Ljava/lang/Object;
    instance-of v4, v1, Lorg/apache/tools/ant/types/Resource;

    if-eqz v4, :cond_0

    .line 225
    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    .line 240
    .end local v1    # "expanded":Ljava/lang/Object;
    :goto_0
    return-object v1

    .line 227
    .restart local v1    # "expanded":Ljava/lang/Object;
    :cond_0
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 228
    .local v2, "expandedLine":Ljava/lang/String;
    const-string/jumbo v4, ":"

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 229
    .local v0, "colon":I
    const/4 v4, -0x1

    if-eq v0, v4, :cond_1

    .line 232
    :try_start_0
    new-instance v1, Lorg/apache/tools/ant/types/resources/URLResource;

    .end local v1    # "expanded":Ljava/lang/Object;
    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/resources/URLResource;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 233
    :catch_0
    move-exception v4

    .line 240
    :cond_1
    new-instance v1, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-direct {v1, v4, v2}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private read(Lorg/apache/tools/ant/types/Resource;)Lorg/apache/tools/ant/types/ResourceCollection;
    .locals 11
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 188
    const/4 v0, 0x0

    .line 190
    .local v0, "bis":Ljava/io/BufferedInputStream;
    :try_start_0
    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v1, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .local v1, "bis":Ljava/io/BufferedInputStream;
    const/4 v3, 0x0

    .line 192
    .local v3, "input":Ljava/io/Reader;
    :try_start_1
    iget-object v8, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->encoding:Ljava/lang/String;

    if-nez v8, :cond_0

    .line 193
    new-instance v3, Ljava/io/InputStreamReader;

    .end local v3    # "input":Ljava/io/Reader;
    invoke-direct {v3, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 197
    .restart local v3    # "input":Ljava/io/Reader;
    :goto_0
    new-instance v2, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;

    invoke-direct {v2}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;-><init>()V

    .line 198
    .local v2, "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setPrimaryReader(Ljava/io/Reader;)V

    .line 199
    iget-object v8, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->filterChains:Ljava/util/Vector;

    invoke-virtual {v2, v8}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setFilterChains(Ljava/util/Vector;)V

    .line 200
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v2, v8}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 201
    new-instance v6, Ljava/io/BufferedReader;

    invoke-virtual {v2}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->getAssembledReader()Ljava/io/Reader;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 203
    .local v6, "reader":Ljava/io/BufferedReader;
    new-instance v7, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v7}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    .line 204
    .local v7, "streamResources":Lorg/apache/tools/ant/types/resources/Union;
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/resources/Union;->setCache(Z)V

    .line 206
    const/4 v5, 0x0

    .line 207
    .local v5, "line":Ljava/lang/String;
    :goto_1
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 208
    invoke-direct {p0, v5}, Lorg/apache/tools/ant/types/resources/ResourceList;->parse(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    .line 212
    .end local v2    # "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    .end local v3    # "input":Ljava/io/Reader;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "reader":Ljava/io/BufferedReader;
    .end local v7    # "streamResources":Lorg/apache/tools/ant/types/resources/Union;
    :catch_0
    move-exception v4

    move-object v0, v1

    .line 213
    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    .local v4, "ioe":Ljava/io/IOException;
    :goto_2
    :try_start_2
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Unable to read resource "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v10, ": "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v8, v9, v4, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 216
    .end local v4    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v8

    :goto_3
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v8

    .line 195
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .restart local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "input":Ljava/io/Reader;
    :cond_0
    :try_start_3
    new-instance v3, Ljava/io/InputStreamReader;

    .end local v3    # "input":Ljava/io/Reader;
    iget-object v8, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->encoding:Ljava/lang/String;

    invoke-direct {v3, v1, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .restart local v3    # "input":Ljava/io/Reader;
    goto :goto_0

    .line 216
    .restart local v2    # "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v6    # "reader":Ljava/io/BufferedReader;
    .restart local v7    # "streamResources":Lorg/apache/tools/ant/types/resources/Union;
    :cond_1
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    return-object v7

    .end local v2    # "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    .end local v3    # "input":Ljava/io/Reader;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "reader":Ljava/io/BufferedReader;
    .end local v7    # "streamResources":Lorg/apache/tools/ant/types/resources/Union;
    :catchall_1
    move-exception v8

    move-object v0, v1

    .end local v1    # "bis":Ljava/io/BufferedInputStream;
    .restart local v0    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_3

    .line 212
    :catch_1
    move-exception v4

    goto :goto_2
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 61
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 64
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->textDocuments:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/ResourceList;->setChecked(Z)V

    .line 66
    return-void
.end method

.method public final addFilterChain(Lorg/apache/tools/ant/types/FilterChain;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/types/FilterChain;

    .prologue
    .line 72
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 75
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->filterChains:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 76
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/ResourceList;->setChecked(Z)V

    .line 77
    return-void
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 4
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 153
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    if-eqz v3, :cond_0

    .line 171
    :goto_0
    monitor-exit p0

    return-void

    .line 156
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->isReference()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 157
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 153
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 159
    :cond_1
    :try_start_2
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->textDocuments:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iter":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 160
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 161
    .local v2, "o":Ljava/lang/Object;
    instance-of v3, v2, Lorg/apache/tools/ant/types/DataType;

    if-eqz v3, :cond_2

    .line 162
    check-cast v2, Lorg/apache/tools/ant/types/DataType;

    .end local v2    # "o":Ljava/lang/Object;
    invoke-static {v2, p1, p2}, Lorg/apache/tools/ant/types/resources/ResourceList;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_1

    .line 165
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->filterChains:Ljava/util/Vector;

    invoke-virtual {v3}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 166
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/FilterChain;

    .line 167
    .local v0, "fc":Lorg/apache/tools/ant/types/FilterChain;
    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/ResourceList;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_2

    .line 169
    .end local v0    # "fc":Lorg/apache/tools/ant/types/FilterChain;
    :cond_4
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/types/resources/ResourceList;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 138
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/ResourceList;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/ResourceList;->isFilesystemOnly()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 141
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->cache()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 138
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 116
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 117
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/ResourceList;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/ResourceList;->iterator()Ljava/util/Iterator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 119
    :goto_0
    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->cache()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    goto :goto_0

    .line 116
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final setEncoding(Ljava/lang/String;)V
    .locals 1
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 92
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->encoding:Ljava/lang/String;

    .line 93
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->encoding:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 101
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 103
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->filterChains:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-gtz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/ResourceList;->textDocuments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 104
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 106
    :cond_2
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 107
    return-void
.end method

.method public declared-synchronized size()I
    .locals 1

    .prologue
    .line 127
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 128
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->getCheckedRef()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/ResourceList;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/ResourceList;->size()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    .line 130
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/ResourceList;->cache()Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    goto :goto_0

    .line 127
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
