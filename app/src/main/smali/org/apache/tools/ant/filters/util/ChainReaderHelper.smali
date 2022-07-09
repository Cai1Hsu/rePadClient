.class public final Lorg/apache/tools/ant/filters/util/ChainReaderHelper;
.super Ljava/lang/Object;
.source "ChainReaderHelper.java"


# static fields
.field private static final DEFAULT_BUFFER_SIZE:I = 0x2000

.field static class$java$io$FilterReader:Ljava/lang/Class;

.field static class$java$io$Reader:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$Parameterizable:Ljava/lang/Class;


# instance fields
.field public bufferSize:I

.field public filterChains:Ljava/util/Vector;

.field public primaryReader:Ljava/io/Reader;

.field private project:Lorg/apache/tools/ant/Project;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/16 v0, 0x2000

    iput v0, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->bufferSize:I

    .line 63
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->filterChains:Ljava/util/Vector;

    .line 66
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->project:Lorg/apache/tools/ant/Project;

    return-void
.end method

.method static access$000(Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Ljava/util/List;

    .prologue
    .line 45
    invoke-static {p0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->cleanUpClassLoaders(Ljava/util/List;)V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 241
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    return-object v1

    :catch_0
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-direct {v1}, Ljava/lang/NoClassDefFoundError;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/NoClassDefFoundError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v1

    throw v1
.end method

.method private static cleanUpClassLoaders(Ljava/util/List;)V
    .locals 2
    .param p0, "loaders"    # Ljava/util/List;

    .prologue
    .line 201
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 202
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v1}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    goto :goto_0

    .line 204
    :cond_0
    return-void
.end method

.method private expandReader(Lorg/apache/tools/ant/types/AntFilterReader;Ljava/io/Reader;Ljava/util/List;)Ljava/io/Reader;
    .locals 21
    .param p1, "filter"    # Lorg/apache/tools/ant/types/AntFilterReader;
    .param p2, "ancestor"    # Ljava/io/Reader;
    .param p3, "classLoadersToCleanUp"    # Ljava/util/List;

    .prologue
    .line 227
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/AntFilterReader;->getClassName()Ljava/lang/String;

    move-result-object v3

    .line 228
    .local v3, "className":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/AntFilterReader;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v4

    .line 229
    .local v4, "classpath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/AntFilterReader;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v15

    .line 230
    .local v15, "pro":Lorg/apache/tools/ant/Project;
    if-eqz v3, :cond_9

    .line 232
    const/4 v5, 0x0

    .line 233
    .local v5, "clazz":Ljava/lang/Class;
    if-nez v4, :cond_0

    .line 234
    :try_start_0
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    .line 240
    :goto_0
    if-eqz v5, :cond_9

    .line 241
    sget-object v18, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->class$java$io$FilterReader:Ljava/lang/Class;

    if-nez v18, :cond_1

    const-string/jumbo v18, "java.io.FilterReader"

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    sput-object v18, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->class$java$io$FilterReader:Ljava/lang/Class;

    :goto_1
    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v18

    if-nez v18, :cond_2

    .line 242
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, " does not extend"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, " java.io.FilterReader"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v18
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_3

    .line 272
    :catch_0
    move-exception v6

    .line 273
    .local v6, "cnfe":Ljava/lang/ClassNotFoundException;
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v18

    invoke-direct {v0, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v18

    .line 236
    .end local v6    # "cnfe":Ljava/lang/ClassNotFoundException;
    :cond_0
    :try_start_1
    invoke-virtual {v15, v4}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v2

    .line 237
    .local v2, "al":Lorg/apache/tools/ant/AntClassLoader;
    move-object/from16 v0, p3

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-static {v3, v0, v2}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v5

    goto :goto_0

    .line 241
    .end local v2    # "al":Lorg/apache/tools/ant/AntClassLoader;
    :cond_1
    sget-object v18, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->class$java$io$FilterReader:Ljava/lang/Class;

    goto :goto_1

    .line 245
    :cond_2
    invoke-virtual {v5}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v8

    .line 246
    .local v8, "constructors":[Ljava/lang/reflect/Constructor;
    const/4 v13, 0x0

    .line 247
    .local v13, "j":I
    const/4 v7, 0x0

    .line 248
    .local v7, "consPresent":Z
    :goto_2
    array-length v0, v8

    move/from16 v18, v0

    move/from16 v0, v18

    if-ge v13, v0, :cond_3

    .line 249
    aget-object v18, v8, v13

    invoke-virtual/range {v18 .. v18}, Ljava/lang/reflect/Constructor;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v17

    .line 250
    .local v17, "types":[Ljava/lang/Class;
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_5

    const/16 v18, 0x0

    aget-object v19, v17, v18

    sget-object v18, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->class$java$io$Reader:Ljava/lang/Class;

    if-nez v18, :cond_4

    const-string/jumbo v18, "java.io.Reader"

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    sput-object v18, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->class$java$io$Reader:Ljava/lang/Class;

    :goto_3
    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v18

    if-eqz v18, :cond_5

    .line 252
    const/4 v7, 0x1

    .line 256
    .end local v17    # "types":[Ljava/lang/Class;
    :cond_3
    if-nez v7, :cond_6

    .line 257
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, " does not define"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, " a public constructor"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, " that takes in a Reader"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    const-string/jumbo v20, " as its single argument."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v18
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_3

    .line 274
    .end local v7    # "consPresent":Z
    .end local v8    # "constructors":[Ljava/lang/reflect/Constructor;
    .end local v13    # "j":I
    :catch_1
    move-exception v10

    .line 275
    .local v10, "ie":Ljava/lang/InstantiationException;
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v18

    invoke-direct {v0, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v18

    .line 250
    .end local v10    # "ie":Ljava/lang/InstantiationException;
    .restart local v7    # "consPresent":Z
    .restart local v8    # "constructors":[Ljava/lang/reflect/Constructor;
    .restart local v13    # "j":I
    .restart local v17    # "types":[Ljava/lang/Class;
    :cond_4
    :try_start_2
    sget-object v18, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->class$java$io$Reader:Ljava/lang/Class;

    goto :goto_3

    .line 248
    :cond_5
    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    .line 262
    .end local v17    # "types":[Ljava/lang/Class;
    :cond_6
    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/io/Reader;

    move-object/from16 v16, v0

    const/16 v18, 0x0

    aput-object p2, v16, v18

    .line 263
    .local v16, "rdr":[Ljava/io/Reader;
    aget-object v18, v8, v13

    check-cast v16, [Ljava/lang/Object;

    .end local v16    # "rdr":[Ljava/io/Reader;
    move-object/from16 v0, v18

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/io/Reader;

    .line 265
    .local v11, "instream":Ljava/io/Reader;
    move-object/from16 v0, p0

    invoke-direct {v0, v11}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProjectOnObject(Ljava/lang/Object;)V

    .line 266
    sget-object v18, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->class$org$apache$tools$ant$types$Parameterizable:Ljava/lang/Class;

    if-nez v18, :cond_8

    const-string/jumbo v18, "org.apache.tools.ant.types.Parameterizable"

    invoke-static/range {v18 .. v18}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v18

    sput-object v18, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->class$org$apache$tools$ant$types$Parameterizable:Ljava/lang/Class;

    :goto_4
    move-object/from16 v0, v18

    invoke-virtual {v0, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v18

    if-eqz v18, :cond_7

    .line 267
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/AntFilterReader;->getParams()[Lorg/apache/tools/ant/types/Parameter;

    move-result-object v14

    .line 268
    .local v14, "params":[Lorg/apache/tools/ant/types/Parameter;
    move-object v0, v11

    check-cast v0, Lorg/apache/tools/ant/types/Parameterizable;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v14}, Lorg/apache/tools/ant/types/Parameterizable;->setParameters([Lorg/apache/tools/ant/types/Parameter;)V

    .line 285
    .end local v5    # "clazz":Ljava/lang/Class;
    .end local v7    # "consPresent":Z
    .end local v8    # "constructors":[Ljava/lang/reflect/Constructor;
    .end local v11    # "instream":Ljava/io/Reader;
    .end local v13    # "j":I
    .end local v14    # "params":[Lorg/apache/tools/ant/types/Parameter;
    :cond_7
    :goto_5
    return-object v11

    .line 266
    .restart local v5    # "clazz":Ljava/lang/Class;
    .restart local v7    # "consPresent":Z
    .restart local v8    # "constructors":[Ljava/lang/reflect/Constructor;
    .restart local v11    # "instream":Ljava/io/Reader;
    .restart local v13    # "j":I
    :cond_8
    sget-object v18, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->class$org$apache$tools$ant$types$Parameterizable:Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_4

    .line 276
    .end local v7    # "consPresent":Z
    .end local v8    # "constructors":[Ljava/lang/reflect/Constructor;
    .end local v11    # "instream":Ljava/io/Reader;
    .end local v13    # "j":I
    :catch_2
    move-exception v9

    .line 277
    .local v9, "iae":Ljava/lang/IllegalAccessException;
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v18

    invoke-direct {v0, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v18

    .line 278
    .end local v9    # "iae":Ljava/lang/IllegalAccessException;
    :catch_3
    move-exception v12

    .line 279
    .local v12, "ite":Ljava/lang/reflect/InvocationTargetException;
    new-instance v18, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v18

    invoke-direct {v0, v12}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v18

    .end local v5    # "clazz":Ljava/lang/Class;
    .end local v12    # "ite":Ljava/lang/reflect/InvocationTargetException;
    :cond_9
    move-object/from16 v11, p2

    .line 285
    goto :goto_5
.end method

.method private setProjectOnObject(Ljava/lang/Object;)V
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 187
    iget-object v0, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->project:Lorg/apache/tools/ant/Project;

    if-nez v0, :cond_0

    .line 195
    .end local p1    # "obj":Ljava/lang/Object;
    :goto_0
    return-void

    .line 190
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_0
    instance-of v0, p1, Lorg/apache/tools/ant/filters/BaseFilterReader;

    if-eqz v0, :cond_1

    .line 191
    check-cast p1, Lorg/apache/tools/ant/filters/BaseFilterReader;

    .end local p1    # "obj":Ljava/lang/Object;
    iget-object v0, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/filters/BaseFilterReader;->setProject(Lorg/apache/tools/ant/Project;)V

    goto :goto_0

    .line 194
    .restart local p1    # "obj":Ljava/lang/Object;
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/Project;->setProjectReference(Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public getAssembledReader()Ljava/io/Reader;
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 119
    iget-object v13, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->primaryReader:Ljava/io/Reader;

    if-nez v13, :cond_0

    .line 120
    new-instance v13, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v14, "primaryReader must not be null."

    invoke-direct {v13, v14}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 123
    :cond_0
    iget-object v8, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->primaryReader:Ljava/io/Reader;

    .line 124
    .local v8, "instream":Ljava/io/Reader;
    iget-object v13, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->filterChains:Ljava/util/Vector;

    invoke-virtual {v13}, Ljava/util/Vector;->size()I

    move-result v2

    .line 125
    .local v2, "filterReadersCount":I
    new-instance v5, Ljava/util/Vector;

    invoke-direct {v5}, Ljava/util/Vector;-><init>()V

    .line 126
    .local v5, "finalFilters":Ljava/util/Vector;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 129
    .local v0, "classLoadersToCleanUp":Ljava/util/ArrayList;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-ge v7, v2, :cond_2

    .line 130
    iget-object v13, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->filterChains:Ljava/util/Vector;

    invoke-virtual {v13, v7}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/FilterChain;

    .line 132
    .local v3, "filterchain":Lorg/apache/tools/ant/types/FilterChain;
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/FilterChain;->getFilterReaders()Ljava/util/Vector;

    move-result-object v1

    .line 133
    .local v1, "filterReaders":Ljava/util/Vector;
    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v11

    .line 134
    .local v11, "readerCount":I
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_1
    if-ge v9, v11, :cond_1

    .line 135
    invoke-virtual {v1, v9}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v5, v13}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 134
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 129
    :cond_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 139
    .end local v1    # "filterReaders":Ljava/util/Vector;
    .end local v3    # "filterchain":Lorg/apache/tools/ant/types/FilterChain;
    .end local v9    # "j":I
    .end local v11    # "readerCount":I
    :cond_2
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v4

    .line 141
    .local v4, "filtersCount":I
    if-lez v4, :cond_7

    .line 142
    const/4 v12, 0x0

    .line 144
    .local v12, "success":Z
    const/4 v7, 0x0

    :goto_2
    if-ge v7, v4, :cond_6

    .line 145
    :try_start_0
    invoke-virtual {v5, v7}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v10

    .line 147
    .local v10, "o":Ljava/lang/Object;
    instance-of v13, v10, Lorg/apache/tools/ant/types/AntFilterReader;

    if-eqz v13, :cond_4

    .line 148
    invoke-virtual {v5, v7}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/apache/tools/ant/types/AntFilterReader;

    invoke-direct {p0, v13, v8, v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->expandReader(Lorg/apache/tools/ant/types/AntFilterReader;Ljava/io/Reader;Ljava/util/List;)Ljava/io/Reader;

    move-result-object v8

    .line 144
    .end local v10    # "o":Ljava/lang/Object;
    :cond_3
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 151
    .restart local v10    # "o":Ljava/lang/Object;
    :cond_4
    instance-of v13, v10, Lorg/apache/tools/ant/filters/ChainableReader;

    if-eqz v13, :cond_3

    .line 152
    invoke-direct {p0, v10}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProjectOnObject(Ljava/lang/Object;)V

    .line 153
    check-cast v10, Lorg/apache/tools/ant/filters/ChainableReader;

    .end local v10    # "o":Ljava/lang/Object;
    invoke-interface {v10, v8}, Lorg/apache/tools/ant/filters/ChainableReader;->chain(Ljava/io/Reader;)Ljava/io/Reader;

    move-result-object v8

    .line 154
    invoke-direct {p0, v8}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->setProjectOnObject(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    .line 159
    :catchall_0
    move-exception v13

    if-nez v12, :cond_5

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-lez v14, :cond_5

    .line 160
    invoke-static {v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->cleanUpClassLoaders(Ljava/util/List;)V

    .line 159
    :cond_5
    throw v13

    .line 157
    :cond_6
    const/4 v12, 0x1

    .line 159
    if-nez v12, :cond_7

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-lez v13, :cond_7

    .line 160
    invoke-static {v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->cleanUpClassLoaders(Ljava/util/List;)V

    .line 164
    .end local v12    # "success":Z
    :cond_7
    move-object v6, v8

    .line 165
    .local v6, "finalReader":Ljava/io/Reader;
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v13

    if-nez v13, :cond_8

    .end local v6    # "finalReader":Ljava/io/Reader;
    :goto_4
    return-object v6

    .restart local v6    # "finalReader":Ljava/io/Reader;
    :cond_8
    new-instance v13, Lorg/apache/tools/ant/filters/util/ChainReaderHelper$1;

    invoke-direct {v13, p0, v6, v0}, Lorg/apache/tools/ant/filters/util/ChainReaderHelper$1;-><init>(Lorg/apache/tools/ant/filters/util/ChainReaderHelper;Ljava/io/Reader;Ljava/util/ArrayList;)V

    move-object v6, v13

    goto :goto_4
.end method

.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public readFully(Ljava/io/Reader;)Ljava/lang/String;
    .locals 1
    .param p1, "rdr"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 215
    iget v0, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->bufferSize:I

    invoke-static {p1, v0}, Lorg/apache/tools/ant/util/FileUtils;->readFully(Ljava/io/Reader;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setBufferSize(I)V
    .locals 0
    .param p1, "size"    # I

    .prologue
    .line 101
    iput p1, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->bufferSize:I

    .line 102
    return-void
.end method

.method public setFilterChains(Ljava/util/Vector;)V
    .locals 0
    .param p1, "fchain"    # Ljava/util/Vector;

    .prologue
    .line 110
    iput-object p1, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->filterChains:Ljava/util/Vector;

    .line 111
    return-void
.end method

.method public setPrimaryReader(Ljava/io/Reader;)V
    .locals 0
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 75
    iput-object p1, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->primaryReader:Ljava/io/Reader;

    .line 76
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/apache/tools/ant/filters/util/ChainReaderHelper;->project:Lorg/apache/tools/ant/Project;

    .line 84
    return-void
.end method
