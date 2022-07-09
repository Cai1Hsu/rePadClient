.class public Lorg/apache/tools/ant/taskdefs/LoadResource;
.super Lorg/apache/tools/ant/Task;
.source "LoadResource.java"


# instance fields
.field private encoding:Ljava/lang/String;

.field private failOnError:Z

.field private final filterChains:Ljava/util/Vector;

.field private property:Ljava/lang/String;

.field private quiet:Z

.field private src:Lorg/apache/tools/ant/types/Resource;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 51
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/LoadResource;->failOnError:Z

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/LoadResource;->quiet:Z

    .line 62
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/LoadResource;->encoding:Ljava/lang/String;

    .line 67
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/LoadResource;->property:Ljava/lang/String;

    .line 72
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/LoadResource;->filterChains:Ljava/util/Vector;

    return-void
.end method


# virtual methods
.method public addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "a"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 228
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 229
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only single argument resource collections are supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 232
    :cond_0
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/LoadResource;->src:Lorg/apache/tools/ant/types/Resource;

    .line 233
    return-void
.end method

.method public final addFilterChain(Lorg/apache/tools/ant/types/FilterChain;)V
    .locals 1
    .param p1, "filter"    # Lorg/apache/tools/ant/types/FilterChain;

    .prologue
    .line 220
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/LoadResource;->filterChains:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 221
    return-void
.end method

.method public final execute()V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 129
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->src:Lorg/apache/tools/ant/types/Resource;

    if-nez v15, :cond_0

    .line 130
    new-instance v15, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v16, "source resource not defined"

    invoke-direct/range {v15 .. v16}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 132
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->property:Ljava/lang/String;

    if-nez v15, :cond_1

    .line 133
    new-instance v15, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v16, "output property not defined"

    invoke-direct/range {v15 .. v16}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 135
    :cond_1
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->quiet:Z

    if-eqz v15, :cond_2

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->failOnError:Z

    if-eqz v15, :cond_2

    .line 136
    new-instance v15, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v16, "quiet and failonerror cannot both be set to true"

    invoke-direct/range {v15 .. v16}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 139
    :cond_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v15}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v15

    if-nez v15, :cond_5

    .line 140
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->src:Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v15

    const-string/jumbo v16, " doesn\'t exist"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    .line 141
    .local v12, "message":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->failOnError:Z

    if-eqz v15, :cond_3

    .line 142
    new-instance v15, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v15, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 144
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->quiet:Z

    if-eqz v15, :cond_4

    const/4 v15, 0x1

    :goto_0
    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v15}, Lorg/apache/tools/ant/taskdefs/LoadResource;->log(Ljava/lang/String;I)V

    .line 213
    .end local v12    # "message":Ljava/lang/String;
    :goto_1
    return-void

    .line 144
    .restart local v12    # "message":Ljava/lang/String;
    :cond_4
    const/4 v15, 0x0

    goto :goto_0

    .line 148
    .end local v12    # "message":Ljava/lang/String;
    :cond_5
    const/4 v9, 0x0

    .line 149
    .local v9, "is":Ljava/io/InputStream;
    const/4 v3, 0x0

    .line 150
    .local v3, "bis":Ljava/io/BufferedInputStream;
    const/4 v6, 0x0

    .line 151
    .local v6, "instream":Ljava/io/Reader;
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "loading "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->src:Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v15

    const-string/jumbo v16, " into property "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->property:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Lorg/apache/tools/ant/taskdefs/LoadResource;->log(Ljava/lang/String;I)V

    .line 154
    :try_start_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v15}, Lorg/apache/tools/ant/types/Resource;->getSize()J

    move-result-wide v10

    .line 155
    .local v10, "len":J
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "resource size = "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v16

    const-wide/16 v18, -0x1

    cmp-long v15, v10, v18

    if-eqz v15, :cond_8

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v15

    :goto_2
    move-object/from16 v0, v16

    invoke-virtual {v0, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Lorg/apache/tools/ant/taskdefs/LoadResource;->log(Ljava/lang/String;I)V

    .line 159
    long-to-int v13, v10

    .line 161
    .local v13, "size":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->src:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v15}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    .line 162
    new-instance v4, Ljava/io/BufferedInputStream;

    invoke-direct {v4, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 163
    .end local v3    # "bis":Ljava/io/BufferedInputStream;
    .local v4, "bis":Ljava/io/BufferedInputStream;
    :try_start_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->encoding:Ljava/lang/String;

    if-nez v15, :cond_9

    .line 164
    new-instance v7, Ljava/io/InputStreamReader;

    invoke-direct {v7, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .end local v6    # "instream":Ljava/io/Reader;
    .local v7, "instream":Ljava/io/Reader;
    move-object v6, v7

    .line 169
    .end local v7    # "instream":Ljava/io/Reader;
    .restart local v6    # "instream":Ljava/io/Reader;
    :goto_3
    const-string/jumbo v14, ""

    .line 170
    .local v14, "text":Ljava/lang/String;
    if-eqz v13, :cond_a

    .line 171
    new-instance v5, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;

    invoke-direct {v5}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;-><init>()V

    .line 172
    .local v5, "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    const-wide/16 v16, -0x1

    cmp-long v15, v10, v16

    if-eqz v15, :cond_6

    .line 173
    invoke-virtual {v5, v13}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setBufferSize(I)V

    .line 175
    :cond_6
    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setPrimaryReader(Ljava/io/Reader;)V

    .line 176
    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->filterChains:Ljava/util/Vector;

    invoke-virtual {v5, v15}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setFilterChains(Ljava/util/Vector;)V

    .line 177
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/LoadResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v15

    invoke-virtual {v5, v15}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 178
    invoke-virtual {v5}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->getAssembledReader()Ljava/io/Reader;

    move-result-object v6

    .line 180
    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v14

    .line 186
    .end local v5    # "crh":Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
    :goto_4
    if-eqz v14, :cond_7

    .line 187
    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v15

    if-lez v15, :cond_7

    .line 188
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/LoadResource;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->property:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-virtual {v15, v0, v14}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "loaded "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v15

    const-string/jumbo v16, " characters"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Lorg/apache/tools/ant/taskdefs/LoadResource;->log(Ljava/lang/String;I)V

    .line 191
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->property:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    const-string/jumbo v16, " := "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    const/16 v16, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-virtual {v0, v15, v1}, Lorg/apache/tools/ant/taskdefs/LoadResource;->log(Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 211
    :cond_7
    invoke-static {v9}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    move-object v3, v4

    .line 212
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "bis":Ljava/io/BufferedInputStream;
    goto/16 :goto_1

    .line 155
    .end local v13    # "size":I
    .end local v14    # "text":Ljava/lang/String;
    :cond_8
    :try_start_2
    const-string/jumbo v15, "unknown"
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_2

    .line 166
    .end local v3    # "bis":Ljava/io/BufferedInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v13    # "size":I
    :cond_9
    :try_start_3
    new-instance v7, Ljava/io/InputStreamReader;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->encoding:Ljava/lang/String;

    invoke-direct {v7, v4, v15}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .end local v6    # "instream":Ljava/io/Reader;
    .restart local v7    # "instream":Ljava/io/Reader;
    move-object v6, v7

    .end local v7    # "instream":Ljava/io/Reader;
    .restart local v6    # "instream":Ljava/io/Reader;
    goto/16 :goto_3

    .line 182
    .restart local v14    # "text":Ljava/lang/String;
    :cond_a
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "Do not set property "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->property:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    const-string/jumbo v16, " as its length is 0."

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->quiet:Z

    if-eqz v15, :cond_b

    const/4 v15, 0x3

    :goto_5
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v15}, Lorg/apache/tools/ant/taskdefs/LoadResource;->log(Ljava/lang/String;I)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto/16 :goto_4

    .line 195
    .end local v14    # "text":Ljava/lang/String;
    :catch_0
    move-exception v8

    move-object v3, v4

    .line 196
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .end local v10    # "len":J
    .end local v13    # "size":I
    .restart local v3    # "bis":Ljava/io/BufferedInputStream;
    .local v8, "ioe":Ljava/io/IOException;
    :goto_6
    :try_start_4
    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "Unable to load resource: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v8}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    .line 198
    .restart local v12    # "message":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->failOnError:Z

    if-eqz v15, :cond_c

    .line 199
    new-instance v15, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/LoadResource;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v15, v12, v8, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v15
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 211
    .end local v8    # "ioe":Ljava/io/IOException;
    .end local v12    # "message":Ljava/lang/String;
    :catchall_0
    move-exception v15

    :goto_7
    invoke-static {v9}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v15

    .line 182
    .end local v3    # "bis":Ljava/io/BufferedInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v10    # "len":J
    .restart local v13    # "size":I
    .restart local v14    # "text":Ljava/lang/String;
    :cond_b
    const/4 v15, 0x2

    goto :goto_5

    .line 201
    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .end local v10    # "len":J
    .end local v13    # "size":I
    .end local v14    # "text":Ljava/lang/String;
    .restart local v3    # "bis":Ljava/io/BufferedInputStream;
    .restart local v8    # "ioe":Ljava/io/IOException;
    .restart local v12    # "message":Ljava/lang/String;
    :cond_c
    :try_start_5
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->quiet:Z

    if-eqz v15, :cond_d

    const/4 v15, 0x3

    :goto_8
    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v15}, Lorg/apache/tools/ant/taskdefs/LoadResource;->log(Ljava/lang/String;I)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 211
    invoke-static {v9}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto/16 :goto_1

    .line 201
    :cond_d
    const/4 v15, 0x0

    goto :goto_8

    .line 203
    .end local v8    # "ioe":Ljava/io/IOException;
    .end local v12    # "message":Ljava/lang/String;
    :catch_1
    move-exception v2

    .line 204
    .local v2, "be":Lorg/apache/tools/ant/BuildException;
    :goto_9
    :try_start_6
    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->failOnError:Z

    if-eqz v15, :cond_e

    .line 205
    throw v2

    .line 207
    :cond_e
    invoke-virtual {v2}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lorg/apache/tools/ant/taskdefs/LoadResource;->quiet:Z

    if-eqz v15, :cond_f

    const/4 v15, 0x3

    :goto_a
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v15}, Lorg/apache/tools/ant/taskdefs/LoadResource;->log(Ljava/lang/String;I)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 211
    invoke-static {v9}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto/16 :goto_1

    .line 207
    :cond_f
    const/4 v15, 0x0

    goto :goto_a

    .line 211
    .end local v2    # "be":Lorg/apache/tools/ant/BuildException;
    .end local v3    # "bis":Ljava/io/BufferedInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v10    # "len":J
    .restart local v13    # "size":I
    :catchall_1
    move-exception v15

    move-object v3, v4

    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_7

    .line 203
    .end local v3    # "bis":Ljava/io/BufferedInputStream;
    .restart local v4    # "bis":Ljava/io/BufferedInputStream;
    :catch_2
    move-exception v2

    move-object v3, v4

    .end local v4    # "bis":Ljava/io/BufferedInputStream;
    .restart local v3    # "bis":Ljava/io/BufferedInputStream;
    goto :goto_9

    .line 195
    .end local v10    # "len":J
    .end local v13    # "size":I
    :catch_3
    move-exception v8

    goto :goto_6
.end method

.method public final setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 87
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/LoadResource;->encoding:Ljava/lang/String;

    .line 88
    return-void
.end method

.method public final setFailonerror(Z)V
    .locals 0
    .param p1, "fail"    # Z

    .prologue
    .line 106
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/LoadResource;->failOnError:Z

    .line 107
    return-void
.end method

.method public final setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 97
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/LoadResource;->property:Ljava/lang/String;

    .line 98
    return-void
.end method

.method public setQuiet(Z)V
    .locals 1
    .param p1, "quiet"    # Z

    .prologue
    .line 115
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/LoadResource;->quiet:Z

    .line 116
    if-eqz p1, :cond_0

    .line 117
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/LoadResource;->failOnError:Z

    .line 119
    :cond_0
    return-void
.end method
