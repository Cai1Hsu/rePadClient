.class public Lorg/apache/tools/ant/taskdefs/Expand;
.super Lorg/apache/tools/ant/Task;
.source "Expand.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x400

.field public static final ERROR_MULTIPLE_MAPPERS:Ljava/lang/String; = "Cannot define more than one mapper"

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field public static final NATIVE_ENCODING:Ljava/lang/String; = "native-encoding"

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private dest:Ljava/io/File;

.field private encoding:Ljava/lang/String;

.field private failOnEmptyArchive:Z

.field private mapperElement:Lorg/apache/tools/ant/types/Mapper;

.field private overwrite:Z

.field private patternsets:Ljava/util/Vector;

.field private resources:Lorg/apache/tools/ant/types/resources/Union;

.field private resourcesSpecified:Z

.field private scanForUnicodeExtraFields:Z

.field private source:Ljava/io/File;

.field private stripAbsolutePathSpec:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 79
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Expand;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 60
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 64
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Expand;->overwrite:Z

    .line 65
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 66
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->patternsets:Ljava/util/Vector;

    .line 67
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->resources:Lorg/apache/tools/ant/types/resources/Union;

    .line 68
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Expand;->resourcesSpecified:Z

    .line 69
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Expand;->failOnEmptyArchive:Z

    .line 70
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Expand;->stripAbsolutePathSpec:Z

    .line 71
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Expand;->scanForUnicodeExtraFields:Z

    .line 75
    const-string/jumbo v0, "UTF8"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->encoding:Ljava/lang/String;

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 143
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


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 415
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->resourcesSpecified:Z

    .line 416
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 417
    return-void
.end method

.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 1
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 440
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Expand;->createMapper()Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Mapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 441
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 0
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 406
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Expand;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 407
    return-void
.end method

.method public addPatternset(Lorg/apache/tools/ant/types/PatternSet;)V
    .locals 1
    .param p1, "set"    # Lorg/apache/tools/ant/types/PatternSet;

    .prologue
    .line 398
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->patternsets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 399
    return-void
.end method

.method public createMapper()Lorg/apache/tools/ant/types/Mapper;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 426
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_0

    .line 427
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Cannot define more than one mapper"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Expand;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 430
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Expand;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 431
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    return-object v0
.end method

.method public execute()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 105
    const-string/jumbo v3, "expand"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Expand;->getTaskType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 106
    const-string/jumbo v3, "!! expand is deprecated. Use unzip instead. !!"

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/Expand;->log(Ljava/lang/String;)V

    .line 109
    :cond_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Expand;->source:Ljava/io/File;

    if-nez v3, :cond_1

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Expand;->resourcesSpecified:Z

    if-nez v3, :cond_1

    .line 110
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "src attribute and/or resources must be specified"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 114
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Expand;->dest:Ljava/io/File;

    if-nez v3, :cond_2

    .line 115
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Dest attribute must be specified"

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 119
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Expand;->dest:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Expand;->dest:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-nez v3, :cond_3

    .line 120
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Dest must be a directory."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Expand;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 123
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Expand;->source:Ljava/io/File;

    if-eqz v3, :cond_7

    .line 124
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Expand;->source:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 125
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Src must not be a directory. Use nested filesets instead."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Expand;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 127
    :cond_4
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Expand;->source:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_5

    .line 128
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "src \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Expand;->source:Ljava/io/File;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\' doesn\'t exist."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 129
    :cond_5
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Expand;->source:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->canRead()Z

    move-result v3

    if-nez v3, :cond_6

    .line 130
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "src \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Expand;->source:Ljava/io/File;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\' cannot be read."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 132
    :cond_6
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Expand;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Expand;->source:Ljava/io/File;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Expand;->dest:Ljava/io/File;

    invoke-virtual {p0, v3, v4, v5}, Lorg/apache/tools/ant/taskdefs/Expand;->expandFile(Lorg/apache/tools/ant/util/FileUtils;Ljava/io/File;Ljava/io/File;)V

    .line 135
    :cond_7
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Expand;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 136
    .local v1, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_b

    .line 137
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Resource;

    .line 138
    .local v2, "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v3

    if-nez v3, :cond_8

    .line 139
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Skipping \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\' because it doesn\'t exist."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/Expand;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 143
    :cond_8
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Expand;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v3, :cond_9

    const-string/jumbo v3, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Expand;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    sput-object v3, Lorg/apache/tools/ant/taskdefs/Expand;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 144
    .local v0, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v0, :cond_a

    .line 145
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Expand;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Expand;->dest:Ljava/io/File;

    invoke-virtual {p0, v3, v4, v5}, Lorg/apache/tools/ant/taskdefs/Expand;->expandFile(Lorg/apache/tools/ant/util/FileUtils;Ljava/io/File;Ljava/io/File;)V

    goto :goto_0

    .line 143
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_9
    sget-object v3, Lorg/apache/tools/ant/taskdefs/Expand;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_1

    .line 147
    .restart local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_a
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Expand;->dest:Ljava/io/File;

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Expand;->expandResource(Lorg/apache/tools/ant/types/Resource;Ljava/io/File;)V

    goto :goto_0

    .line 150
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v2    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_b
    return-void
.end method

.method protected expandFile(Lorg/apache/tools/ant/util/FileUtils;Ljava/io/File;Ljava/io/File;)V
    .locals 17
    .param p1, "fileUtils"    # Lorg/apache/tools/ant/util/FileUtils;
    .param p2, "srcF"    # Ljava/io/File;
    .param p3, "dir"    # Ljava/io/File;

    .prologue
    .line 160
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Expanding: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " into "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Expand;->log(Ljava/lang/String;I)V

    .line 161
    const/4 v15, 0x0

    .line 162
    .local v15, "zf":Lorg/apache/tools/zip/ZipFile;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Expand;->getMapper()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v10

    .line 163
    .local v10, "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 164
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unable to expand "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " as the file does not exist"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Expand;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 170
    :cond_0
    :try_start_0
    new-instance v16, Lorg/apache/tools/zip/ZipFile;

    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/Expand;->encoding:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-boolean v3, v0, Lorg/apache/tools/ant/taskdefs/Expand;->scanForUnicodeExtraFields:Z

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 171
    .end local v15    # "zf":Lorg/apache/tools/zip/ZipFile;
    .local v16, "zf":Lorg/apache/tools/zip/ZipFile;
    const/4 v12, 0x1

    .line 172
    .local v12, "empty":Z
    :try_start_1
    invoke-virtual/range {v16 .. v16}, Lorg/apache/tools/zip/ZipFile;->getEntries()Ljava/util/Enumeration;

    move-result-object v11

    .line 173
    .local v11, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v11}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 174
    const/4 v12, 0x0

    .line 175
    invoke-interface {v11}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/apache/tools/zip/ZipEntry;

    .line 176
    .local v14, "ze":Lorg/apache/tools/zip/ZipEntry;
    const/4 v6, 0x0

    .line 177
    .local v6, "is":Ljava/io/InputStream;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "extracting "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v14}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Expand;->log(Ljava/lang/String;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 179
    :try_start_2
    move-object/from16 v0, v16

    invoke-virtual {v0, v14}, Lorg/apache/tools/zip/ZipFile;->getInputStream(Lorg/apache/tools/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v6

    invoke-virtual {v14}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/util/Date;

    invoke-virtual {v14}, Lorg/apache/tools/zip/ZipEntry;->getTime()J

    move-result-wide v2

    invoke-direct {v8, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v14}, Lorg/apache/tools/zip/ZipEntry;->isDirectory()Z

    move-result v9

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    invoke-virtual/range {v2 .. v10}, Lorg/apache/tools/ant/taskdefs/Expand;->extractFile(Lorg/apache/tools/ant/util/FileUtils;Ljava/io/File;Ljava/io/File;Ljava/io/InputStream;Ljava/lang/String;Ljava/util/Date;ZLorg/apache/tools/ant/util/FileNameMapper;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 184
    :try_start_3
    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_0

    .line 191
    .end local v6    # "is":Ljava/io/InputStream;
    .end local v11    # "e":Ljava/util/Enumeration;
    .end local v14    # "ze":Lorg/apache/tools/zip/ZipEntry;
    :catch_0
    move-exception v13

    move-object/from16 v15, v16

    .line 192
    .end local v12    # "empty":Z
    .end local v16    # "zf":Lorg/apache/tools/zip/ZipFile;
    .local v13, "ioe":Ljava/io/IOException;
    .restart local v15    # "zf":Lorg/apache/tools/zip/ZipFile;
    :goto_1
    :try_start_4
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Error while expanding "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v13}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v13}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 197
    .end local v13    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    :goto_2
    invoke-static {v15}, Lorg/apache/tools/zip/ZipFile;->closeQuietly(Lorg/apache/tools/zip/ZipFile;)V

    throw v2

    .line 184
    .end local v15    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v6    # "is":Ljava/io/InputStream;
    .restart local v11    # "e":Ljava/util/Enumeration;
    .restart local v12    # "empty":Z
    .restart local v14    # "ze":Lorg/apache/tools/zip/ZipEntry;
    .restart local v16    # "zf":Lorg/apache/tools/zip/ZipFile;
    :catchall_1
    move-exception v2

    :try_start_5
    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v2

    .line 197
    .end local v6    # "is":Ljava/io/InputStream;
    .end local v11    # "e":Ljava/util/Enumeration;
    .end local v14    # "ze":Lorg/apache/tools/zip/ZipEntry;
    :catchall_2
    move-exception v2

    move-object/from16 v15, v16

    .end local v16    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v15    # "zf":Lorg/apache/tools/zip/ZipFile;
    goto :goto_2

    .line 187
    .end local v15    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v11    # "e":Ljava/util/Enumeration;
    .restart local v16    # "zf":Lorg/apache/tools/zip/ZipFile;
    :cond_1
    if-eqz v12, :cond_2

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Expand;->getFailOnEmptyArchive()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 188
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "archive \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\' is empty"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 190
    :cond_2
    const-string/jumbo v2, "expand complete"

    const/4 v3, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Expand;->log(Ljava/lang/String;I)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 197
    invoke-static/range {v16 .. v16}, Lorg/apache/tools/zip/ZipFile;->closeQuietly(Lorg/apache/tools/zip/ZipFile;)V

    .line 199
    return-void

    .line 191
    .end local v11    # "e":Ljava/util/Enumeration;
    .end local v12    # "empty":Z
    .end local v16    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v15    # "zf":Lorg/apache/tools/zip/ZipFile;
    :catch_1
    move-exception v13

    goto :goto_1
.end method

.method protected expandResource(Lorg/apache/tools/ant/types/Resource;Ljava/io/File;)V
    .locals 2
    .param p1, "srcR"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "dir"    # Ljava/io/File;

    .prologue
    .line 208
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only filesystem based resources are supported by this task."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected extractFile(Lorg/apache/tools/ant/util/FileUtils;Ljava/io/File;Ljava/io/File;Ljava/io/InputStream;Ljava/lang/String;Ljava/util/Date;ZLorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 28
    .param p1, "fileUtils"    # Lorg/apache/tools/ant/util/FileUtils;
    .param p2, "srcF"    # Ljava/io/File;
    .param p3, "dir"    # Ljava/io/File;
    .param p4, "compressedInputStream"    # Ljava/io/InputStream;
    .param p5, "entryName"    # Ljava/lang/String;
    .param p6, "entryDate"    # Ljava/util/Date;
    .param p7, "isDirectory"    # Z
    .param p8, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 245
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Expand;->stripAbsolutePathSpec:Z

    move/from16 v24, v0

    if-eqz v24, :cond_1

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->length()I

    move-result v24

    if-lez v24, :cond_1

    const/16 v24, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v24

    sget-char v25, Ljava/io/File;->separatorChar:C

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_0

    const/16 v24, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v24

    const/16 v25, 0x2f

    move/from16 v0, v24

    move/from16 v1, v25

    if-eq v0, v1, :cond_0

    const/16 v24, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v24

    const/16 v25, 0x5c

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_1

    .line 249
    :cond_0
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "stripped absolute path spec from "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Expand;->log(Ljava/lang/String;I)V

    .line 251
    const/16 v24, 0x1

    move-object/from16 v0, p5

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p5

    .line 254
    :cond_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Expand;->patternsets:Ljava/util/Vector;

    move-object/from16 v24, v0

    if-eqz v24, :cond_c

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Expand;->patternsets:Ljava/util/Vector;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/Vector;->size()I

    move-result v24

    if-lez v24, :cond_c

    .line 255
    const/16 v24, 0x2f

    sget-char v25, Ljava/io/File;->separatorChar:C

    move-object/from16 v0, p5

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x5c

    sget-char v26, Ljava/io/File;->separatorChar:C

    invoke-virtual/range {v24 .. v26}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v18

    .line 258
    .local v18, "name":Ljava/lang/String;
    const/4 v14, 0x0

    .line 259
    .local v14, "included":Z
    new-instance v13, Ljava/util/HashSet;

    invoke-direct {v13}, Ljava/util/HashSet;-><init>()V

    .line 260
    .local v13, "includePatterns":Ljava/util/Set;
    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    .line 261
    .local v8, "excludePatterns":Ljava/util/Set;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Expand;->patternsets:Ljava/util/Vector;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/Vector;->size()I

    move-result v21

    .line 262
    .local v21, "size":I
    const/16 v22, 0x0

    .local v22, "v":I
    :goto_0
    move/from16 v0, v22

    move/from16 v1, v21

    if-ge v0, v1, :cond_8

    .line 263
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Expand;->patternsets:Ljava/util/Vector;

    move-object/from16 v24, v0

    move-object/from16 v0, v24

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lorg/apache/tools/ant/types/PatternSet;

    .line 264
    .local v19, "p":Lorg/apache/tools/ant/types/PatternSet;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Expand;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v24

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/PatternSet;->getIncludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v12

    .line 265
    .local v12, "incls":[Ljava/lang/String;
    if-eqz v12, :cond_2

    array-length v0, v12

    move/from16 v24, v0

    if-nez v24, :cond_3

    .line 267
    :cond_2
    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v12, v0, [Ljava/lang/String;

    .end local v12    # "incls":[Ljava/lang/String;
    const/16 v24, 0x0

    const-string/jumbo v25, "**"

    aput-object v25, v12, v24

    .line 270
    .restart local v12    # "incls":[Ljava/lang/String;
    :cond_3
    const/16 v23, 0x0

    .local v23, "w":I
    :goto_1
    array-length v0, v12

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-ge v0, v1, :cond_5

    .line 271
    aget-object v24, v12, v23

    const/16 v25, 0x2f

    sget-char v26, Ljava/io/File;->separatorChar:C

    invoke-virtual/range {v24 .. v26}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x5c

    sget-char v26, Ljava/io/File;->separatorChar:C

    invoke-virtual/range {v24 .. v26}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v20

    .line 273
    .local v20, "pattern":Ljava/lang/String;
    sget-object v24, Ljava/io/File;->separator:Ljava/lang/String;

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_4

    .line 274
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, "**"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    .line 276
    :cond_4
    move-object/from16 v0, v20

    invoke-interface {v13, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 270
    add-int/lit8 v23, v23, 0x1

    goto :goto_1

    .line 279
    .end local v20    # "pattern":Ljava/lang/String;
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Expand;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v24

    move-object/from16 v0, v19

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/PatternSet;->getExcludePatterns(Lorg/apache/tools/ant/Project;)[Ljava/lang/String;

    move-result-object v7

    .line 280
    .local v7, "excls":[Ljava/lang/String;
    if-eqz v7, :cond_7

    .line 281
    const/16 v23, 0x0

    :goto_2
    array-length v0, v7

    move/from16 v24, v0

    move/from16 v0, v23

    move/from16 v1, v24

    if-ge v0, v1, :cond_7

    .line 282
    aget-object v24, v7, v23

    const/16 v25, 0x2f

    sget-char v26, Ljava/io/File;->separatorChar:C

    invoke-virtual/range {v24 .. v26}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x5c

    sget-char v26, Ljava/io/File;->separatorChar:C

    invoke-virtual/range {v24 .. v26}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v20

    .line 285
    .restart local v20    # "pattern":Ljava/lang/String;
    sget-object v24, Ljava/io/File;->separator:Ljava/lang/String;

    move-object/from16 v0, v20

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_6

    .line 286
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v24

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, "**"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    .line 288
    :cond_6
    move-object/from16 v0, v20

    invoke-interface {v8, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 281
    add-int/lit8 v23, v23, 0x1

    goto :goto_2

    .line 262
    .end local v20    # "pattern":Ljava/lang/String;
    :cond_7
    add-int/lit8 v22, v22, 0x1

    goto/16 :goto_0

    .line 293
    .end local v7    # "excls":[Ljava/lang/String;
    .end local v12    # "incls":[Ljava/lang/String;
    .end local v19    # "p":Lorg/apache/tools/ant/types/PatternSet;
    .end local v23    # "w":I
    :cond_8
    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .line 294
    .local v15, "iter":Ljava/util/Iterator;
    :goto_3
    if-nez v14, :cond_9

    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_9

    .line 295
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 296
    .restart local v20    # "pattern":Ljava/lang/String;
    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPath(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v14

    goto :goto_3

    .line 299
    .end local v20    # "pattern":Ljava/lang/String;
    :cond_9
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v15

    .line 300
    :goto_4
    if-eqz v14, :cond_b

    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_b

    .line 301
    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Ljava/lang/String;

    .line 302
    .restart local v20    # "pattern":Ljava/lang/String;
    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-static {v0, v1}, Lorg/apache/tools/ant/types/selectors/SelectorUtils;->matchPath(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v24

    if-nez v24, :cond_a

    const/4 v14, 0x1

    :goto_5
    goto :goto_4

    :cond_a
    const/4 v14, 0x0

    goto :goto_5

    .line 305
    .end local v20    # "pattern":Ljava/lang/String;
    :cond_b
    if-nez v14, :cond_c

    .line 307
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "skipping "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, " as it is excluded or not included."

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Expand;->log(Ljava/lang/String;I)V

    .line 362
    .end local v8    # "excludePatterns":Ljava/util/Set;
    .end local v13    # "includePatterns":Ljava/util/Set;
    .end local v14    # "included":Z
    .end local v15    # "iter":Ljava/util/Iterator;
    .end local v18    # "name":Ljava/lang/String;
    .end local v21    # "size":I
    .end local v22    # "v":I
    :goto_6
    return-void

    .line 313
    :cond_c
    move-object/from16 v0, p8

    move-object/from16 v1, p5

    invoke-interface {v0, v1}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v17

    .line 314
    .local v17, "mappedNames":[Ljava/lang/String;
    if-eqz v17, :cond_d

    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v24, v0

    if-nez v24, :cond_e

    .line 315
    :cond_d
    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    .end local v17    # "mappedNames":[Ljava/lang/String;
    const/16 v24, 0x0

    aput-object p5, v17, v24

    .line 317
    .restart local v17    # "mappedNames":[Ljava/lang/String;
    :cond_e
    const/16 v24, 0x0

    aget-object v24, v17, v24

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, v24

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v9

    .line 319
    .local v9, "f":Ljava/io/File;
    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Expand;->overwrite:Z

    move/from16 v24, v0

    if-nez v24, :cond_f

    invoke-virtual {v9}, Ljava/io/File;->exists()Z

    move-result v24

    if-eqz v24, :cond_f

    invoke-virtual {v9}, Ljava/io/File;->lastModified()J

    move-result-wide v24

    invoke-virtual/range {p6 .. p6}, Ljava/util/Date;->getTime()J

    move-result-wide v26

    cmp-long v24, v24, v26

    if-ltz v24, :cond_f

    .line 321
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Skipping "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, " as it is up-to-date"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x4

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Expand;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_6

    .line 356
    :catch_0
    move-exception v6

    .line 357
    .local v6, "ex":Ljava/io/FileNotFoundException;
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "Unable to expand to file "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual {v9}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v6, v2}, Lorg/apache/tools/ant/taskdefs/Expand;->log(Ljava/lang/String;Ljava/lang/Throwable;I)V

    goto/16 :goto_6

    .line 326
    .end local v6    # "ex":Ljava/io/FileNotFoundException;
    :cond_f
    :try_start_1
    new-instance v24, Ljava/lang/StringBuffer;

    invoke-direct/range {v24 .. v24}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v25, "expanding "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    const-string/jumbo v25, " to "

    invoke-virtual/range {v24 .. v25}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Expand;->log(Ljava/lang/String;I)V

    .line 329
    invoke-virtual {v9}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    .line 330
    .local v5, "dirF":Ljava/io/File;
    if-eqz v5, :cond_10

    .line 331
    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 334
    :cond_10
    if-eqz p7, :cond_11

    .line 335
    invoke-virtual {v9}, Ljava/io/File;->mkdirs()Z

    .line 355
    :goto_7
    invoke-virtual/range {p6 .. p6}, Ljava/util/Date;->getTime()J

    move-result-wide v24

    move-object/from16 v0, p1

    move-wide/from16 v1, v24

    invoke-virtual {v0, v9, v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->setFileLastModified(Ljava/io/File;J)V

    goto/16 :goto_6

    .line 337
    :cond_11
    const/16 v24, 0x400

    move/from16 v0, v24

    new-array v4, v0, [B
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    .line 338
    .local v4, "buffer":[B
    const/16 v16, 0x0

    .line 339
    .local v16, "length":I
    const/4 v10, 0x0

    .line 341
    .local v10, "fos":Ljava/io/FileOutputStream;
    :try_start_2
    new-instance v11, Ljava/io/FileOutputStream;

    invoke-direct {v11, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 344
    .end local v10    # "fos":Ljava/io/FileOutputStream;
    .local v11, "fos":Ljava/io/FileOutputStream;
    :goto_8
    :try_start_3
    move-object/from16 v0, p4

    invoke-virtual {v0, v4}, Ljava/io/InputStream;->read([B)I

    move-result v16

    if-ltz v16, :cond_12

    .line 345
    const/16 v24, 0x0

    move/from16 v0, v24

    move/from16 v1, v16

    invoke-virtual {v11, v4, v0, v1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_8

    .line 351
    :catchall_0
    move-exception v24

    move-object v10, v11

    .end local v11    # "fos":Ljava/io/FileOutputStream;
    .restart local v10    # "fos":Ljava/io/FileOutputStream;
    :goto_9
    :try_start_4
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v24
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_0

    .line 348
    .end local v10    # "fos":Ljava/io/FileOutputStream;
    .restart local v11    # "fos":Ljava/io/FileOutputStream;
    :cond_12
    :try_start_5
    invoke-virtual {v11}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 349
    const/4 v10, 0x0

    .line 351
    .end local v11    # "fos":Ljava/io/FileOutputStream;
    .restart local v10    # "fos":Ljava/io/FileOutputStream;
    :try_start_6
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V
    :try_end_6
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_6} :catch_0

    goto :goto_7

    :catchall_1
    move-exception v24

    goto :goto_9
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 474
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public getFailOnEmptyArchive()Z
    .locals 1

    .prologue
    .line 96
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->failOnEmptyArchive:Z

    return v0
.end method

.method protected getMapper()Lorg/apache/tools/ant/util/FileNameMapper;
    .locals 2

    .prologue
    .line 217
    const/4 v0, 0x0

    .line 218
    .local v0, "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Expand;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v1, :cond_0

    .line 219
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Expand;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v0

    .line 223
    :goto_0
    return-object v0

    .line 221
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/util/IdentityMapper;

    .end local v0    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    invoke-direct {v0}, Lorg/apache/tools/ant/util/IdentityMapper;-><init>()V

    .restart local v0    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    goto :goto_0
.end method

.method public getScanForUnicodeExtraFields()Z
    .locals 1

    .prologue
    .line 510
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Expand;->scanForUnicodeExtraFields:Z

    return v0
.end method

.method protected internalSetEncoding(Ljava/lang/String;)V
    .locals 1
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 464
    const-string/jumbo v0, "native-encoding"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 465
    const/4 p1, 0x0

    .line 467
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Expand;->encoding:Ljava/lang/String;

    .line 468
    return-void
.end method

.method protected internalSetScanForUnicodeExtraFields(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 503
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Expand;->scanForUnicodeExtraFields:Z

    .line 504
    return-void
.end method

.method public setDest(Ljava/io/File;)V
    .locals 0
    .param p1, "d"    # Ljava/io/File;

    .prologue
    .line 372
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Expand;->dest:Ljava/io/File;

    .line 373
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 453
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Expand;->internalSetEncoding(Ljava/lang/String;)V

    .line 454
    return-void
.end method

.method public setFailOnEmptyArchive(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 87
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Expand;->failOnEmptyArchive:Z

    .line 88
    return-void
.end method

.method public setOverwrite(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 390
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Expand;->overwrite:Z

    .line 391
    return-void
.end method

.method public setScanForUnicodeExtraFields(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 492
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Expand;->internalSetScanForUnicodeExtraFields(Z)V

    .line 493
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 0
    .param p1, "s"    # Ljava/io/File;

    .prologue
    .line 381
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Expand;->source:Ljava/io/File;

    .line 382
    return-void
.end method

.method public setStripAbsolutePathSpec(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 483
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Expand;->stripAbsolutePathSpec:Z

    .line 484
    return-void
.end method
