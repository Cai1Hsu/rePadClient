.class public Lorg/apache/tools/ant/taskdefs/Replace;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "Replace.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;,
        Lorg/apache/tools/ant/taskdefs/Replace$FileInput;,
        Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;,
        Lorg/apache/tools/ant/taskdefs/Replace$NestedString;
    }
.end annotation


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private dir:Ljava/io/File;

.field private encoding:Ljava/lang/String;

.field private failOnNoReplacements:Z

.field private fileCount:I

.field private preserveLastModified:Z

.field private properties:Ljava/util/Properties;

.field private propertyResource:Lorg/apache/tools/ant/types/Resource;

.field private replaceCount:I

.field private replaceFilterResource:Lorg/apache/tools/ant/types/Resource;

.field private replacefilters:Ljava/util/ArrayList;

.field private resources:Lorg/apache/tools/ant/types/resources/Union;

.field private sourceFile:Ljava/io/File;

.field private summary:Z

.field private token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

.field private value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Replace;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 59
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 63
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->sourceFile:Ljava/io/File;

    .line 64
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    .line 65
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;-><init>(Lorg/apache/tools/ant/taskdefs/Replace;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    .line 67
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->propertyResource:Lorg/apache/tools/ant/types/Resource;

    .line 68
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replaceFilterResource:Lorg/apache/tools/ant/types/Resource;

    .line 69
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->properties:Ljava/util/Properties;

    .line 70
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    .line 72
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->dir:Ljava/io/File;

    .line 76
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Replace;->summary:Z

    .line 79
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->encoding:Ljava/lang/String;

    .line 83
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Replace;->preserveLastModified:Z

    .line 84
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Replace;->failOnNoReplacements:Z

    .line 422
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/Replace;)Lorg/apache/tools/ant/types/Resource;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Replace;

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->propertyResource:Lorg/apache/tools/ant/types/Resource;

    return-object v0
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/Replace;)Ljava/util/Properties;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Replace;

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->properties:Ljava/util/Properties;

    return-object v0
.end method

.method static access$200(Lorg/apache/tools/ant/taskdefs/Replace;)Lorg/apache/tools/ant/taskdefs/Replace$NestedString;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Replace;

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    return-object v0
.end method

.method static access$304(Lorg/apache/tools/ant/taskdefs/Replace;)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Replace;

    .prologue
    .line 59
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replaceCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replaceCount:I

    return v0
.end method

.method static access$400(Lorg/apache/tools/ant/taskdefs/Replace;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Replace;

    .prologue
    .line 59
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method private buildFilterChain(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;
    .locals 5
    .param p1, "inputBuffer"    # Ljava/lang/StringBuffer;

    .prologue
    .line 760
    move-object v0, p1

    .line 761
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 762
    .local v3, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v3, :cond_0

    .line 763
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;

    .line 764
    .local v1, "filter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->setInputBuffer(Ljava/lang/StringBuffer;)V

    .line 765
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->getOutputBuffer()Ljava/lang/StringBuffer;

    move-result-object v0

    .line 762
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 767
    .end local v1    # "filter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    :cond_0
    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 555
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

.method private createPrimaryfilter()Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    .locals 3

    .prologue
    .line 955
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;-><init>(Lorg/apache/tools/ant/taskdefs/Replace;)V

    .line 956
    .local v0, "filter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 957
    return-object v0
.end method

.method private flushFilterChain()V
    .locals 4

    .prologue
    .line 731
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 732
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 733
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;

    .line 734
    .local v0, "filter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->flush()V

    .line 732
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 736
    .end local v0    # "filter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    :cond_0
    return-void
.end method

.method private logFilterChain(Ljava/lang/String;)V
    .locals 5
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 775
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 776
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 777
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;

    .line 778
    .local v0, "filter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Replacing in "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->getToken()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " --> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->getReplaceValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/Replace;->log(Ljava/lang/String;I)V

    .line 776
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 781
    .end local v0    # "filter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    :cond_0
    return-void
.end method

.method private processFile(Ljava/io/File;)V
    .locals 18
    .param p1, "src"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 663
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 664
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Replace: source file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " doesn\'t exist"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Replace;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 668
    :cond_0
    const/16 v17, 0x0

    .line 669
    .local v17, "temp":Ljava/io/File;
    const/4 v9, 0x0

    .line 670
    .local v9, "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    const/4 v14, 0x0

    .line 672
    .local v14, "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    :try_start_0
    new-instance v10, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v10, v0, v1}, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;-><init>(Lorg/apache/tools/ant/taskdefs/Replace;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 674
    .end local v9    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .local v10, "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    :try_start_1
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Replace;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const-string/jumbo v3, "rep"

    const-string/jumbo v4, ".tmp"

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-virtual/range {v2 .. v7}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v17

    .line 676
    new-instance v15, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v15, v0, v1}, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;-><init>(Lorg/apache/tools/ant/taskdefs/Replace;Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 678
    .end local v14    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .local v15, "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    :try_start_2
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Replace;->replaceCount:I

    move/from16 v16, v0

    .line 680
    .local v16, "repCountStart":I
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/apache/tools/ant/taskdefs/Replace;->logFilterChain(Ljava/lang/String;)V

    .line 682
    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->getOutputBuffer()Ljava/lang/StringBuffer;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lorg/apache/tools/ant/taskdefs/Replace;->buildFilterChain(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v15, v2}, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->setInputBuffer(Ljava/lang/StringBuffer;)V

    .line 684
    :cond_1
    :goto_0
    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->readChunk()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 685
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Replace;->processFilterChain()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 686
    invoke-virtual {v15}, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->process()Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_0

    .line 708
    .end local v16    # "repCountStart":I
    :catch_0
    move-exception v11

    move-object v14, v15

    .end local v15    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .restart local v14    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    move-object v9, v10

    .line 709
    .end local v10    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .restart local v9    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .local v11, "ioe":Ljava/io/IOException;
    :goto_1
    :try_start_3
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "IOException in "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " - "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v11}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Replace;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v11, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 713
    .end local v11    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v2

    :goto_2
    if-eqz v9, :cond_2

    .line 714
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->closeQuietly()V

    .line 716
    :cond_2
    if-eqz v14, :cond_3

    .line 717
    invoke-virtual {v14}, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->closeQuietly()V

    .line 719
    :cond_3
    if-eqz v17, :cond_4

    .line 720
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_4

    .line 721
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->deleteOnExit()V

    .line 713
    :cond_4
    throw v2

    .line 690
    .end local v9    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .end local v14    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .restart local v10    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .restart local v15    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .restart local v16    # "repCountStart":I
    :cond_5
    :try_start_4
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Replace;->flushFilterChain()V

    .line 692
    invoke-virtual {v15}, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->flush()V

    .line 693
    invoke-virtual {v10}, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 694
    const/4 v9, 0x0

    .line 695
    .end local v10    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .restart local v9    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    :try_start_5
    invoke-virtual {v15}, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 696
    const/4 v14, 0x0

    .line 698
    .end local v15    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .restart local v14    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    :try_start_6
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/tools/ant/taskdefs/Replace;->replaceCount:I

    move/from16 v0, v16

    if-eq v2, v0, :cond_b

    const/4 v8, 0x1

    .line 699
    .local v8, "changes":Z
    :goto_3
    if-eqz v8, :cond_7

    .line 700
    move-object/from16 v0, p0

    iget v2, v0, Lorg/apache/tools/ant/taskdefs/Replace;->fileCount:I

    add-int/lit8 v2, v2, 0x1

    move-object/from16 v0, p0

    iput v2, v0, Lorg/apache/tools/ant/taskdefs/Replace;->fileCount:I

    .line 701
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->lastModified()J

    move-result-wide v12

    .line 702
    .local v12, "origLastModified":J
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Replace;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v2, v0, v1}, Lorg/apache/tools/ant/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V

    .line 703
    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/Replace;->preserveLastModified:Z

    if-eqz v2, :cond_6

    .line 704
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Replace;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, p1

    invoke-virtual {v2, v0, v12, v13}, Lorg/apache/tools/ant/util/FileUtils;->setFileLastModified(Ljava/io/File;J)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 706
    :cond_6
    const/16 v17, 0x0

    .line 713
    .end local v12    # "origLastModified":J
    :cond_7
    if-eqz v9, :cond_8

    .line 714
    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/Replace$FileInput;->closeQuietly()V

    .line 716
    :cond_8
    if-eqz v14, :cond_9

    .line 717
    invoke-virtual {v14}, Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;->closeQuietly()V

    .line 719
    :cond_9
    if-eqz v17, :cond_a

    .line 720
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_a

    .line 721
    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->deleteOnExit()V

    .line 725
    :cond_a
    return-void

    .line 698
    .end local v8    # "changes":Z
    :cond_b
    const/4 v8, 0x0

    goto :goto_3

    .line 713
    .end local v9    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .end local v16    # "repCountStart":I
    .restart local v10    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    :catchall_1
    move-exception v2

    move-object v9, v10

    .end local v10    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .restart local v9    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    goto :goto_2

    .end local v9    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .end local v14    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .restart local v10    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .restart local v15    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    :catchall_2
    move-exception v2

    move-object v14, v15

    .end local v15    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .restart local v14    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    move-object v9, v10

    .end local v10    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .restart local v9    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    goto :goto_2

    .end local v14    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .restart local v15    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .restart local v16    # "repCountStart":I
    :catchall_3
    move-exception v2

    move-object v14, v15

    .end local v15    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .restart local v14    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    goto :goto_2

    .line 708
    .end local v16    # "repCountStart":I
    :catch_1
    move-exception v11

    goto/16 :goto_1

    .end local v9    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .restart local v10    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    :catch_2
    move-exception v11

    move-object v9, v10

    .end local v10    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    .restart local v9    # "in":Lorg/apache/tools/ant/taskdefs/Replace$FileInput;
    goto/16 :goto_1

    .end local v14    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .restart local v15    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .restart local v16    # "repCountStart":I
    :catch_3
    move-exception v11

    move-object v14, v15

    .end local v15    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    .restart local v14    # "out":Lorg/apache/tools/ant/taskdefs/Replace$FileOutput;
    goto/16 :goto_1
.end method

.method private processFilterChain()Z
    .locals 4

    .prologue
    .line 743
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 744
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 745
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;

    .line 746
    .local v0, "filter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->process()Z

    move-result v3

    if-nez v3, :cond_0

    .line 747
    const/4 v3, 0x0

    .line 750
    .end local v0    # "filter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    :goto_1
    return v3

    .line 744
    .restart local v0    # "filter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 750
    .end local v0    # "filter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    :cond_1
    const/4 v3, 0x1

    goto :goto_1
.end method

.method private stringReplace(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "str"    # Ljava/lang/StringBuffer;
    .param p2, "str1"    # Ljava/lang/String;
    .param p3, "str2"    # Ljava/lang/String;

    .prologue
    .line 964
    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 965
    .local v0, "found":I
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    .line 966
    .local v1, "str1Length":I
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    .line 967
    .local v2, "str2Length":I
    :goto_0
    if-ltz v0, :cond_0

    .line 968
    add-int v3, v0, v1

    invoke-virtual {p1, v0, v3, p3}, Ljava/lang/StringBuffer;->replace(IILjava/lang/String;)Ljava/lang/StringBuffer;

    .line 969
    add-int v3, v0, v2

    invoke-virtual {p1, p2, v3}, Ljava/lang/StringBuffer;->indexOf(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0

    .line 971
    :cond_0
    return-void
.end method


# virtual methods
.method public addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 921
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v0

    if-nez v0, :cond_0

    .line 922
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only filesystem resources are supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 924
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v0, :cond_1

    .line 925
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->resources:Lorg/apache/tools/ant/types/resources/Union;

    .line 927
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 928
    return-void
.end method

.method public createReplaceToken()Lorg/apache/tools/ant/taskdefs/Replace$NestedString;
    .locals 1

    .prologue
    .line 868
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    if-nez v0, :cond_0

    .line 869
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;-><init>(Lorg/apache/tools/ant/taskdefs/Replace;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    .line 871
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    return-object v0
.end method

.method public createReplaceValue()Lorg/apache/tools/ant/taskdefs/Replace$NestedString;
    .locals 1

    .prologue
    .line 879
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Replace;->value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    return-object v0
.end method

.method public createReplacefilter()Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    .locals 2

    .prologue
    .line 910
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;-><init>(Lorg/apache/tools/ant/taskdefs/Replace;)V

    .line 911
    .local v0, "filter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 912
    return-object v0
.end method

.method public execute()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 496
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/ArrayList;

    .line 497
    .local v8, "savedFilters":Ljava/util/ArrayList;
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->properties:Ljava/util/Properties;

    if-nez v13, :cond_1

    const/4 v9, 0x0

    .line 500
    .local v9, "savedProperties":Ljava/util/Properties;
    :goto_0
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    if-eqz v13, :cond_0

    .line 504
    new-instance v12, Ljava/lang/StringBuffer;

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->value:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    invoke-virtual {v13}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->getText()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 505
    .local v12, "val":Ljava/lang/StringBuffer;
    const-string/jumbo v13, "\r\n"

    const-string/jumbo v14, "\n"

    invoke-direct {p0, v12, v13, v14}, Lorg/apache/tools/ant/taskdefs/Replace;->stringReplace(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 506
    const-string/jumbo v13, "\n"

    sget-object v14, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-direct {p0, v12, v13, v14}, Lorg/apache/tools/ant/taskdefs/Replace;->stringReplace(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 507
    new-instance v11, Ljava/lang/StringBuffer;

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    invoke-virtual {v13}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->getText()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v11, v13}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 508
    .local v11, "tok":Ljava/lang/StringBuffer;
    const-string/jumbo v13, "\r\n"

    const-string/jumbo v14, "\n"

    invoke-direct {p0, v11, v13, v14}, Lorg/apache/tools/ant/taskdefs/Replace;->stringReplace(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 509
    const-string/jumbo v13, "\n"

    sget-object v14, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-direct {p0, v11, v13, v14}, Lorg/apache/tools/ant/taskdefs/Replace;->stringReplace(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V

    .line 510
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Replace;->createPrimaryfilter()Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;

    move-result-object v3

    .line 511
    .local v3, "firstFilter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->setToken(Ljava/lang/String;)V

    .line 512
    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v3, v13}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->setValue(Ljava/lang/String;)V

    .line 516
    .end local v3    # "firstFilter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    .end local v11    # "tok":Ljava/lang/StringBuffer;
    .end local v12    # "val":Ljava/lang/StringBuffer;
    :cond_0
    :try_start_0
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replaceFilterResource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v13, :cond_2

    .line 517
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replaceFilterResource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {p0, v13}, Lorg/apache/tools/ant/taskdefs/Replace;->getProperties(Lorg/apache/tools/ant/types/Resource;)Ljava/util/Properties;

    move-result-object v6

    .line 518
    .local v6, "props":Ljava/util/Properties;
    invoke-virtual {v6}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 519
    .local v1, "e":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_2

    .line 520
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v11

    .line 521
    .local v11, "tok":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace;->createReplacefilter()Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;

    move-result-object v7

    .line 522
    .local v7, "replaceFilter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    invoke-virtual {v7, v11}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->setToken(Ljava/lang/String;)V

    .line 523
    invoke-virtual {v6, v11}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v7, v13}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->setValue(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 568
    .end local v1    # "e":Ljava/util/Iterator;
    .end local v6    # "props":Ljava/util/Properties;
    .end local v7    # "replaceFilter":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    .end local v11    # "tok":Ljava/lang/String;
    :catchall_0
    move-exception v13

    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    .line 569
    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/Replace;->properties:Ljava/util/Properties;

    throw v13

    .line 497
    .end local v9    # "savedProperties":Ljava/util/Properties;
    :cond_1
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->properties:Ljava/util/Properties;

    invoke-virtual {v13}, Ljava/util/Properties;->clone()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Properties;

    move-object v9, v13

    goto/16 :goto_0

    .line 527
    .restart local v9    # "savedProperties":Ljava/util/Properties;
    :cond_2
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace;->validateAttributes()V

    .line 529
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->propertyResource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v13, :cond_3

    .line 530
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->propertyResource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {p0, v13}, Lorg/apache/tools/ant/taskdefs/Replace;->getProperties(Lorg/apache/tools/ant/types/Resource;)Ljava/util/Properties;

    move-result-object v13

    iput-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->properties:Ljava/util/Properties;

    .line 533
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace;->validateReplacefilters()V

    .line 534
    const/4 v13, 0x0

    iput v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->fileCount:I

    .line 535
    const/4 v13, 0x0

    iput v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replaceCount:I

    .line 537
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->sourceFile:Ljava/io/File;

    if-eqz v13, :cond_4

    .line 538
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->sourceFile:Ljava/io/File;

    invoke-direct {p0, v13}, Lorg/apache/tools/ant/taskdefs/Replace;->processFile(Ljava/io/File;)V

    .line 541
    :cond_4
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->dir:Ljava/io/File;

    if-eqz v13, :cond_5

    .line 542
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->dir:Ljava/io/File;

    invoke-super {p0, v13}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    .line 543
    .local v0, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v10

    .line 545
    .local v10, "srcs":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_2
    array-length v13, v10

    if-ge v5, v13, :cond_5

    .line 546
    new-instance v2, Ljava/io/File;

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->dir:Ljava/io/File;

    aget-object v14, v10, v5

    invoke-direct {v2, v13, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 547
    .local v2, "file":Ljava/io/File;
    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/Replace;->processFile(Ljava/io/File;)V

    .line 545
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 551
    .end local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v2    # "file":Ljava/io/File;
    .end local v5    # "i":I
    .end local v10    # "srcs":[Ljava/lang/String;
    :cond_5
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-eqz v13, :cond_7

    .line 552
    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v13}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_7

    .line 553
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/apache/tools/ant/types/Resource;

    sget-object v14, Lorg/apache/tools/ant/taskdefs/Replace;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v14, :cond_6

    const-string/jumbo v14, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v14}, Lorg/apache/tools/ant/taskdefs/Replace;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v14

    sput-object v14, Lorg/apache/tools/ant/taskdefs/Replace;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_4
    invoke-virtual {v13, v14}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 556
    .local v4, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    invoke-interface {v4}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v13

    invoke-direct {p0, v13}, Lorg/apache/tools/ant/taskdefs/Replace;->processFile(Ljava/io/File;)V

    goto :goto_3

    .line 553
    .end local v4    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_6
    sget-object v14, Lorg/apache/tools/ant/taskdefs/Replace;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_4

    .line 560
    .end local v5    # "i":Ljava/util/Iterator;
    :cond_7
    iget-boolean v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->summary:Z

    if-eqz v13, :cond_8

    .line 561
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "Replaced "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    iget v14, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replaceCount:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, " occurrences in "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    iget v14, p0, Lorg/apache/tools/ant/taskdefs/Replace;->fileCount:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, " files."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x2

    invoke-virtual {p0, v13, v14}, Lorg/apache/tools/ant/taskdefs/Replace;->log(Ljava/lang/String;I)V

    .line 564
    :cond_8
    iget-boolean v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->failOnNoReplacements:Z

    if-eqz v13, :cond_9

    iget v13, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replaceCount:I

    if-nez v13, :cond_9

    .line 565
    new-instance v13, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v14, "didn\'t replace anything"

    invoke-direct {v13, v14}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v13
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 568
    :cond_9
    iput-object v8, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    .line 569
    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/Replace;->properties:Ljava/util/Properties;

    .line 572
    return-void
.end method

.method public getProperties(Ljava/io/File;)Ljava/util/Properties;
    .locals 2
    .param p1, "propertyFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 625
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Replace;->getProperties(Lorg/apache/tools/ant/types/Resource;)Ljava/util/Properties;

    move-result-object v0

    return-object v0
.end method

.method public getProperties(Lorg/apache/tools/ant/types/Resource;)Ljava/util/Properties;
    .locals 6
    .param p1, "propertyResource"    # Lorg/apache/tools/ant/types/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 637
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 639
    .local v3, "props":Ljava/util/Properties;
    const/4 v1, 0x0

    .line 641
    .local v1, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    .line 642
    invoke-virtual {v3, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 648
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 651
    return-object v3

    .line 643
    :catch_0
    move-exception v0

    .line 644
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Property resource ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ") cannot be loaded."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 646
    .local v2, "message":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v4, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 648
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "message":Ljava/lang/String;
    :catchall_0
    move-exception v4

    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v4
.end method

.method public setDir(Ljava/io/File;)V
    .locals 0
    .param p1, "dir"    # Ljava/io/File;

    .prologue
    .line 831
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->dir:Ljava/io/File;

    .line 832
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 860
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->encoding:Ljava/lang/String;

    .line 861
    return-void
.end method

.method public setFailOnNoReplacements(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 946
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->failOnNoReplacements:Z

    .line 947
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 787
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->sourceFile:Ljava/io/File;

    .line 788
    return-void
.end method

.method public setPreserveLastModified(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 937
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->preserveLastModified:Z

    .line 938
    return-void
.end method

.method public setPropertyFile(Ljava/io/File;)V
    .locals 1
    .param p1, "propertyFile"    # Ljava/io/File;

    .prologue
    .line 889
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Replace;->setPropertyResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 890
    return-void
.end method

.method public setPropertyResource(Lorg/apache/tools/ant/types/Resource;)V
    .locals 0
    .param p1, "propertyResource"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 902
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->propertyResource:Lorg/apache/tools/ant/types/Resource;

    .line 903
    return-void
.end method

.method public setReplaceFilterFile(Ljava/io/File;)V
    .locals 2
    .param p1, "replaceFilterFile"    # Ljava/io/File;

    .prologue
    .line 810
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Lorg/apache/tools/ant/Project;Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Replace;->setReplaceFilterResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 812
    return-void
.end method

.method public setReplaceFilterResource(Lorg/apache/tools/ant/types/Resource;)V
    .locals 0
    .param p1, "replaceFilter"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 822
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replaceFilterResource:Lorg/apache/tools/ant/types/Resource;

    .line 823
    return-void
.end method

.method public setSummary(Z)V
    .locals 0
    .param p1, "summary"    # Z

    .prologue
    .line 799
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->summary:Z

    .line 800
    return-void
.end method

.method public setToken(Ljava/lang/String;)V
    .locals 1
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 841
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace;->createReplaceToken()Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->addText(Ljava/lang/String;)V

    .line 842
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 850
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace;->createReplaceValue()Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->addText(Ljava/lang/String;)V

    .line 851
    return-void
.end method

.method public validateAttributes()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 581
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->sourceFile:Ljava/io/File;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->dir:Ljava/io/File;

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v1, :cond_0

    .line 582
    const-string/jumbo v0, "Either the file or the dir attribute or nested resources must be specified"

    .line 584
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 586
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->propertyResource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->propertyResource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 587
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Property file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Replace;->propertyResource:Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " does not exist."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 589
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 591
    .end local v0    # "message":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    if-nez v1, :cond_2

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_2

    .line 592
    const-string/jumbo v0, "Either token or a nested replacefilter must be specified"

    .line 594
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 596
    .end local v0    # "message":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Replace;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    if-eqz v1, :cond_3

    const-string/jumbo v1, ""

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Replace;->token:Lorg/apache/tools/ant/taskdefs/Replace$NestedString;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Replace$NestedString;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 597
    const-string/jumbo v0, "The token attribute must not be an empty string."

    .line 598
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Replace;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 600
    .end local v0    # "message":Ljava/lang/String;
    :cond_3
    return-void
.end method

.method public validateReplacefilters()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 610
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 611
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 612
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Replace;->replacefilters:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;

    .line 614
    .local v0, "element":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;->validate()V

    .line 611
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 616
    .end local v0    # "element":Lorg/apache/tools/ant/taskdefs/Replace$Replacefilter;
    :cond_0
    return-void
.end method
