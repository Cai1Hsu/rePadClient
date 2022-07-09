.class public Lorg/apache/tools/ant/taskdefs/Jar;
.super Lorg/apache/tools/ant/taskdefs/Zip;
.source "Jar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;,
        Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;
    }
.end annotation


# static fields
.field private static final INDEX_NAME:Ljava/lang/String; = "META-INF/INDEX.LIST"

.field private static final JAR_MARKER:[Lorg/apache/tools/zip/ZipExtraField;

.field private static final MANIFEST_NAME:Ljava/lang/String; = "META-INF/MANIFEST.MF"


# instance fields
.field private configuredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

.field private createEmpty:Z

.field private filesetManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

.field private filesetManifestConfig:Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;

.field private flattenClassPaths:Z

.field private index:Z

.field private indexJars:Lorg/apache/tools/ant/types/Path;

.field private indexMetaInf:Z

.field private manifest:Lorg/apache/tools/ant/taskdefs/Manifest;

.field private manifestEncoding:Ljava/lang/String;

.field private manifestFile:Ljava/io/File;

.field private mergeClassPaths:Z

.field private mergeManifestsMain:Z

.field private originalManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

.field private rootEntries:Ljava/util/Vector;

.field private savedConfiguredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

.field private serviceList:Ljava/util/List;

.field private strict:Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 176
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/apache/tools/zip/ZipExtraField;

    const/4 v1, 0x0

    invoke-static {}, Lorg/apache/tools/zip/JarMarker;->getInstance()Lorg/apache/tools/zip/JarMarker;

    move-result-object v2

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Jar;->JAR_MARKER:[Lorg/apache/tools/zip/ZipExtraField;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 182
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Zip;-><init>()V

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->serviceList:Ljava/util/List;

    .line 106
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeManifestsMain:Z

    .line 123
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Jar;->index:Z

    .line 126
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Jar;->indexMetaInf:Z

    .line 132
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Jar;->createEmpty:Z

    .line 157
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;

    const-string/jumbo v1, "ignore"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->strict:Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;

    .line 164
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeClassPaths:Z

    .line 169
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Jar;->flattenClassPaths:Z

    .line 183
    const-string/jumbo v0, "jar"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->archiveType:Ljava/lang/String;

    .line 184
    const-string/jumbo v0, "create"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->emptyBehavior:Ljava/lang/String;

    .line 185
    const-string/jumbo v0, "UTF8"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Jar;->setEncoding(Ljava/lang/String;)V

    .line 186
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->rootEntries:Ljava/util/Vector;

    .line 187
    return-void
.end method

.method private checkJarSpec()V
    .locals 6

    .prologue
    .line 951
    const-string/jumbo v3, "line.separator"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 952
    .local v0, "br":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    .line 953
    .local v2, "message":Ljava/lang/StringBuffer;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->configuredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    if-nez v3, :cond_1

    const/4 v1, 0x0

    .line 957
    .local v1, "mainSection":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    :goto_0
    if-nez v1, :cond_2

    .line 958
    const-string/jumbo v3, "No Implementation-Title set."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 959
    const-string/jumbo v3, "No Implementation-Version set."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 960
    const-string/jumbo v3, "No Implementation-Vendor set."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 973
    :cond_0
    :goto_1
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    if-lez v3, :cond_6

    .line 974
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 975
    const-string/jumbo v3, "Location: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 976
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 977
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->strict:Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;->getValue()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "fail"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 978
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 953
    .end local v1    # "mainSection":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->configuredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Manifest;->getMainSection()Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    move-result-object v1

    goto :goto_0

    .line 962
    .restart local v1    # "mainSection":Lorg/apache/tools/ant/taskdefs/Manifest$Section;
    :cond_2
    const-string/jumbo v3, "Implementation-Title"

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttribute(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    move-result-object v3

    if-nez v3, :cond_3

    .line 963
    const-string/jumbo v3, "No Implementation-Title set."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 965
    :cond_3
    const-string/jumbo v3, "Implementation-Version"

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttribute(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    move-result-object v3

    if-nez v3, :cond_4

    .line 966
    const-string/jumbo v3, "No Implementation-Version set."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 968
    :cond_4
    const-string/jumbo v3, "Implementation-Vendor"

    invoke-virtual {v1, v3}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttribute(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    move-result-object v3

    if-nez v3, :cond_0

    .line 969
    const-string/jumbo v3, "No Implementation-Vendor set."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 980
    :cond_5
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Jar;->strict:Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;->getLogLevel()I

    move-result v4

    invoke-virtual {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/Jar;->logWhenWriting(Ljava/lang/String;I)V

    .line 983
    :cond_6
    return-void
.end method

.method private createIndexList(Lorg/apache/tools/zip/ZipOutputStream;)V
    .locals 25
    .param p1, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 620
    new-instance v12, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v12}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 622
    .local v12, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v24, Ljava/io/PrintWriter;

    new-instance v4, Ljava/io/OutputStreamWriter;

    const-string/jumbo v6, "UTF8"

    invoke-direct {v4, v12, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    move-object/from16 v0, v24

    invoke-direct {v0, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 626
    .local v24, "writer":Ljava/io/PrintWriter;
    const-string/jumbo v4, "JarIndex-Version: 1.0"

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 627
    invoke-virtual/range {v24 .. v24}, Ljava/io/PrintWriter;->println()V

    .line 630
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/Jar;->zipFile:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v24

    invoke-virtual {v0, v4}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 632
    new-instance v4, Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/tools/ant/taskdefs/Jar;->addedDirs:Ljava/util/Hashtable;

    invoke-virtual {v6}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/tools/ant/taskdefs/Jar;->rootEntries:Ljava/util/Vector;

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v4, v6, v1}, Lorg/apache/tools/ant/taskdefs/Jar;->writeIndexLikeList(Ljava/util/List;Ljava/util/List;Ljava/io/PrintWriter;)V

    .line 634
    invoke-virtual/range {v24 .. v24}, Ljava/io/PrintWriter;->println()V

    .line 636
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/Jar;->indexJars:Lorg/apache/tools/ant/types/Path;

    if-eqz v4, :cond_2

    .line 637
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Jar;->createManifest()Lorg/apache/tools/ant/taskdefs/Manifest;

    move-result-object v21

    .line 638
    .local v21, "mf":Lorg/apache/tools/ant/taskdefs/Manifest;
    invoke-virtual/range {v21 .. v21}, Lorg/apache/tools/ant/taskdefs/Manifest;->getMainSection()Lorg/apache/tools/ant/taskdefs/Manifest$Section;

    move-result-object v4

    const-string/jumbo v6, "Class-Path"

    invoke-virtual {v4, v6}, Lorg/apache/tools/ant/taskdefs/Manifest$Section;->getAttribute(Ljava/lang/String;)Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;

    move-result-object v15

    .line 640
    .local v15, "classpath":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    const/16 v16, 0x0

    .line 641
    .local v16, "cpEntries":[Ljava/lang/String;
    if-eqz v15, :cond_0

    invoke-virtual {v15}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValue()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 642
    new-instance v23, Ljava/util/StringTokenizer;

    invoke-virtual {v15}, Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;->getValue()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v6, " "

    move-object/from16 v0, v23

    invoke-direct {v0, v4, v6}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 644
    .local v23, "tok":Ljava/util/StringTokenizer;
    invoke-virtual/range {v23 .. v23}, Ljava/util/StringTokenizer;->countTokens()I

    move-result v4

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 v16, v0

    .line 645
    const/4 v13, 0x0

    .line 646
    .local v13, "c":I
    :goto_0
    invoke-virtual/range {v23 .. v23}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 647
    add-int/lit8 v14, v13, 0x1

    .end local v13    # "c":I
    .local v14, "c":I
    invoke-virtual/range {v23 .. v23}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v16, v13

    move v13, v14

    .end local v14    # "c":I
    .restart local v13    # "c":I
    goto :goto_0

    .line 650
    .end local v13    # "c":I
    .end local v23    # "tok":Ljava/util/StringTokenizer;
    :cond_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/Jar;->indexJars:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v20

    .line 651
    .local v20, "indexJarEntries":[Ljava/lang/String;
    const/16 v19, 0x0

    .local v19, "i":I
    :goto_1
    move-object/from16 v0, v20

    array-length v4, v0

    move/from16 v0, v19

    if-ge v0, v4, :cond_2

    .line 652
    aget-object v4, v20, v19

    move-object/from16 v0, v16

    invoke-static {v4, v0}, Lorg/apache/tools/ant/taskdefs/Jar;->findJarName(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 653
    .local v22, "name":Ljava/lang/String;
    if-eqz v22, :cond_1

    .line 654
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 655
    .local v17, "dirs":Ljava/util/ArrayList;
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 656
    .local v18, "files":Ljava/util/ArrayList;
    aget-object v4, v20, v19

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v4, v0, v1}, Lorg/apache/tools/ant/taskdefs/Jar;->grabFilesAndDirs(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 657
    invoke-virtual/range {v17 .. v17}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual/range {v18 .. v18}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/2addr v4, v6

    if-lez v4, :cond_1

    .line 658
    move-object/from16 v0, v24

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 659
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, v24

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/tools/ant/taskdefs/Jar;->writeIndexLikeList(Ljava/util/List;Ljava/util/List;Ljava/io/PrintWriter;)V

    .line 660
    invoke-virtual/range {v24 .. v24}, Ljava/io/PrintWriter;->println()V

    .line 651
    .end local v17    # "dirs":Ljava/util/ArrayList;
    .end local v18    # "files":Ljava/util/ArrayList;
    :cond_1
    add-int/lit8 v19, v19, 0x1

    goto :goto_1

    .line 666
    .end local v15    # "classpath":Lorg/apache/tools/ant/taskdefs/Manifest$Attribute;
    .end local v16    # "cpEntries":[Ljava/lang/String;
    .end local v19    # "i":I
    .end local v20    # "indexJarEntries":[Ljava/lang/String;
    .end local v21    # "mf":Lorg/apache/tools/ant/taskdefs/Manifest;
    .end local v22    # "name":Ljava/lang/String;
    :cond_2
    invoke-virtual/range {v24 .. v24}, Ljava/io/PrintWriter;->checkError()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 667
    new-instance v4, Ljava/io/IOException;

    const-string/jumbo v6, "Encountered an error writing jar index"

    invoke-direct {v4, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 669
    :cond_3
    invoke-virtual/range {v24 .. v24}, Ljava/io/PrintWriter;->close()V

    .line 670
    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v12}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    invoke-direct {v5, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 673
    .local v5, "bais":Ljava/io/ByteArrayInputStream;
    :try_start_0
    const-string/jumbo v7, "META-INF/INDEX.LIST"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    const/4 v10, 0x0

    const v11, 0x81a4

    move-object/from16 v4, p0

    move-object/from16 v6, p1

    invoke-super/range {v4 .. v11}, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile(Ljava/io/InputStream;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;JLjava/io/File;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 677
    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 679
    return-void

    .line 677
    :catchall_0
    move-exception v4

    invoke-static {v5}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v4
.end method

.method private createManifest()Lorg/apache/tools/ant/taskdefs/Manifest;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 526
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Manifest;->getDefaultManifest()Lorg/apache/tools/ant/taskdefs/Manifest;

    move-result-object v1

    .line 528
    .local v1, "finalManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    if-nez v4, :cond_0

    .line 529
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestFile:Ljava/io/File;

    if-eqz v4, :cond_0

    .line 532
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestFile:Ljava/io/File;

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/Jar;->getManifest(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/Manifest;

    move-result-object v4

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    .line 544
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->isInUpdateMode()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 545
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Jar;->originalManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    const/4 v5, 0x0

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeClassPaths:Z

    invoke-virtual {v1, v4, v5, v6}, Lorg/apache/tools/ant/taskdefs/Manifest;->merge(Lorg/apache/tools/ant/taskdefs/Manifest;ZZ)V

    .line 547
    :cond_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Jar;->filesetManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    const/4 v5, 0x0

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeClassPaths:Z

    invoke-virtual {v1, v4, v5, v6}, Lorg/apache/tools/ant/taskdefs/Manifest;->merge(Lorg/apache/tools/ant/taskdefs/Manifest;ZZ)V

    .line 548
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Jar;->configuredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeManifestsMain:Z

    if-nez v4, :cond_2

    move v4, v2

    :goto_0
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeClassPaths:Z

    invoke-virtual {v1, v5, v4, v6}, Lorg/apache/tools/ant/taskdefs/Manifest;->merge(Lorg/apache/tools/ant/taskdefs/Manifest;ZZ)V

    .line 550
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeManifestsMain:Z

    if-nez v5, :cond_3

    :goto_1
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeClassPaths:Z

    invoke-virtual {v1, v4, v2, v5}, Lorg/apache/tools/ant/taskdefs/Manifest;->merge(Lorg/apache/tools/ant/taskdefs/Manifest;ZZ)V
    :try_end_0
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_0 .. :try_end_0} :catch_0

    .line 553
    return-object v1

    :cond_2
    move v4, v3

    .line 548
    goto :goto_0

    :cond_3
    move v2, v3

    .line 550
    goto :goto_1

    .line 555
    .end local v1    # "finalManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    :catch_0
    move-exception v0

    .line 556
    .local v0, "e":Lorg/apache/tools/ant/taskdefs/ManifestException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Manifest is invalid: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/ManifestException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Jar;->log(Ljava/lang/String;I)V

    .line 557
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Invalid Manifest"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v0, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2
.end method

.method private filesetManifest(Ljava/io/File;Ljava/io/InputStream;)V
    .locals 7
    .param p1, "file"    # Ljava/io/File;
    .param p2, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x3

    const/4 v6, 0x0

    .line 714
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestFile:Ljava/io/File;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestFile:Ljava/io/File;

    invoke-virtual {v3, p1}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 717
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Found manifest "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/taskdefs/Jar;->log(Ljava/lang/String;I)V

    .line 719
    if-eqz p2, :cond_2

    .line 721
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestEncoding:Ljava/lang/String;

    if-nez v3, :cond_1

    .line 722
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 726
    .local v1, "isr":Ljava/io/InputStreamReader;
    :goto_0
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/Jar;->getManifest(Ljava/io/Reader;)Lorg/apache/tools/ant/taskdefs/Manifest;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    .line 783
    .end local v1    # "isr":Ljava/io/InputStreamReader;
    :cond_0
    :goto_1
    return-void

    .line 724
    :cond_1
    new-instance v1, Ljava/io/InputStreamReader;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestEncoding:Ljava/lang/String;

    invoke-direct {v1, p2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .restart local v1    # "isr":Ljava/io/InputStreamReader;
    goto :goto_0

    .line 728
    .end local v1    # "isr":Ljava/io/InputStreamReader;
    :cond_2
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->getManifest(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/Manifest;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifest:Lorg/apache/tools/ant/taskdefs/Manifest;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 730
    :catch_0
    move-exception v0

    .line 731
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unsupported encoding while reading manifest: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 734
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->filesetManifestConfig:Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->filesetManifestConfig:Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;->getValue()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "skip"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 737
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Found manifest to merge in file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/taskdefs/Jar;->logWhenWriting(Ljava/lang/String;I)V

    .line 741
    const/4 v2, 0x0

    .line 742
    .local v2, "newManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    if-eqz p2, :cond_5

    .line 744
    :try_start_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestEncoding:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 745
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-direct {v1, p2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 749
    .restart local v1    # "isr":Ljava/io/InputStreamReader;
    :goto_2
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/Jar;->getManifest(Ljava/io/Reader;)Lorg/apache/tools/ant/taskdefs/Manifest;

    move-result-object v2

    .line 754
    .end local v1    # "isr":Ljava/io/InputStreamReader;
    :goto_3
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->filesetManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    if-nez v3, :cond_6

    .line 755
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Jar;->filesetManifest:Lorg/apache/tools/ant/taskdefs/Manifest;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_1

    .line 759
    :catch_1
    move-exception v0

    .line 760
    .restart local v0    # "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Unsupported encoding while reading manifest: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 747
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :cond_4
    :try_start_2
    new-instance v1, Ljava/io/InputStreamReader;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestEncoding:Ljava/lang/String;

    invoke-direct {v1, p2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .restart local v1    # "isr":Ljava/io/InputStreamReader;
    goto :goto_2

    .line 751
    .end local v1    # "isr":Ljava/io/InputStreamReader;
    :cond_5
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->getManifest(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/Manifest;

    move-result-object v2

    goto :goto_3

    .line 757
    :cond_6
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->filesetManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    const/4 v4, 0x0

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeClassPaths:Z

    invoke-virtual {v3, v2, v4, v5}, Lorg/apache/tools/ant/taskdefs/Manifest;->merge(Lorg/apache/tools/ant/taskdefs/Manifest;ZZ)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_1

    .line 762
    :catch_2
    move-exception v0

    .line 763
    .local v0, "e":Lorg/apache/tools/ant/taskdefs/ManifestException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Manifest in file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " is invalid: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/ManifestException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v6}, Lorg/apache/tools/ant/taskdefs/Jar;->log(Ljava/lang/String;I)V

    .line 765
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v4, "Invalid Manifest"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v0, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3
.end method

.method protected static findJarName(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "classpath"    # [Ljava/lang/String;

    .prologue
    .line 1090
    if-nez p1, :cond_0

    .line 1091
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1122
    :goto_0
    return-object v4

    .line 1093
    :cond_0
    sget-char v4, Ljava/io/File;->separatorChar:C

    const/16 v5, 0x2f

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    .line 1094
    new-instance v2, Ljava/util/TreeMap;

    new-instance v4, Lorg/apache/tools/ant/taskdefs/Jar$1;

    invoke-direct {v4}, Lorg/apache/tools/ant/taskdefs/Jar$1;-><init>()V

    invoke-direct {v2, v4}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 1105
    .local v2, "matches":Ljava/util/TreeMap;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v4, p1

    if-ge v1, v4, :cond_4

    .line 1106
    aget-object v4, p1, v1

    invoke-virtual {p0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1107
    aget-object v4, p1, v1

    aget-object v5, p1, v1

    invoke-virtual {v2, v4, v5}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1105
    :cond_1
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1109
    :cond_2
    aget-object v4, p1, v1

    const-string/jumbo v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 1110
    .local v3, "slash":I
    aget-object v0, p1, v1

    .line 1111
    .local v0, "candidate":Ljava/lang/String;
    :goto_3
    const/4 v4, -0x1

    if-le v3, v4, :cond_1

    .line 1112
    add-int/lit8 v4, v3, 0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1113
    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1114
    aget-object v4, p1, v1

    invoke-virtual {v2, v0, v4}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 1117
    :cond_3
    const-string/jumbo v4, "/"

    invoke-virtual {v0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    goto :goto_3

    .line 1122
    .end local v0    # "candidate":Ljava/lang/String;
    .end local v3    # "slash":I
    :cond_4
    invoke-virtual {v2}, Ljava/util/TreeMap;->size()I

    move-result v4

    if-nez v4, :cond_5

    const/4 v4, 0x0

    goto :goto_0

    :cond_5
    invoke-virtual {v2}, Ljava/util/TreeMap;->firstKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    goto :goto_0
.end method

.method private getManifest(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/Manifest;
    .locals 9
    .param p1, "manifestFile"    # Ljava/io/File;

    .prologue
    .line 306
    const/4 v5, 0x0

    .line 307
    .local v5, "newManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    const/4 v1, 0x0

    .line 308
    .local v1, "fis":Ljava/io/FileInputStream;
    const/4 v3, 0x0

    .line 310
    .local v3, "isr":Ljava/io/InputStreamReader;
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 311
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .local v2, "fis":Ljava/io/FileInputStream;
    :try_start_1
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestEncoding:Ljava/lang/String;

    if-nez v6, :cond_0

    .line 312
    new-instance v4, Ljava/io/InputStreamReader;

    invoke-direct {v4, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .end local v3    # "isr":Ljava/io/InputStreamReader;
    .local v4, "isr":Ljava/io/InputStreamReader;
    move-object v3, v4

    .line 316
    .end local v4    # "isr":Ljava/io/InputStreamReader;
    .restart local v3    # "isr":Ljava/io/InputStreamReader;
    :goto_0
    invoke-direct {p0, v3}, Lorg/apache/tools/ant/taskdefs/Jar;->getManifest(Ljava/io/Reader;)Lorg/apache/tools/ant/taskdefs/Manifest;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v5

    .line 325
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 327
    return-object v5

    .line 314
    :cond_0
    :try_start_2
    new-instance v4, Ljava/io/InputStreamReader;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestEncoding:Ljava/lang/String;

    invoke-direct {v4, v2, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .end local v3    # "isr":Ljava/io/InputStreamReader;
    .restart local v4    # "isr":Ljava/io/InputStreamReader;
    move-object v3, v4

    .end local v4    # "isr":Ljava/io/InputStreamReader;
    .restart local v3    # "isr":Ljava/io/InputStreamReader;
    goto :goto_0

    .line 317
    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    :catch_0
    move-exception v0

    .line 318
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    :goto_1
    :try_start_3
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Unsupported encoding while reading manifest: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 325
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :catchall_0
    move-exception v6

    :goto_2
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v6

    .line 320
    :catch_1
    move-exception v0

    .line 321
    .local v0, "e":Ljava/io/IOException;
    :goto_3
    :try_start_4
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Unable to read manifest file: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 325
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    :catchall_1
    move-exception v6

    move-object v1, v2

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    goto :goto_2

    .line 320
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    :catch_2
    move-exception v0

    move-object v1, v2

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    goto :goto_3

    .line 317
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    :catch_3
    move-exception v0

    move-object v1, v2

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    goto :goto_1
.end method

.method private getManifest(Ljava/io/Reader;)Lorg/apache/tools/ant/taskdefs/Manifest;
    .locals 5
    .param p1, "r"    # Ljava/io/Reader;

    .prologue
    .line 365
    const/4 v1, 0x0

    .line 367
    .local v1, "newManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    :try_start_0
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Manifest;

    .end local v1    # "newManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    invoke-direct {v1, p1}, Lorg/apache/tools/ant/taskdefs/Manifest;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/taskdefs/ManifestException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 376
    .restart local v1    # "newManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    return-object v1

    .line 368
    .end local v1    # "newManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    :catch_0
    move-exception v0

    .line 369
    .local v0, "e":Lorg/apache/tools/ant/taskdefs/ManifestException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Manifest is invalid: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/ManifestException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/Jar;->log(Ljava/lang/String;I)V

    .line 370
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Invalid Manifest: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestFile:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v0, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 372
    .end local v0    # "e":Lorg/apache/tools/ant/taskdefs/ManifestException;
    :catch_1
    move-exception v0

    .line 373
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unable to read manifest file ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private getManifestFromJar(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/Manifest;
    .locals 7
    .param p1, "jarFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 336
    const/4 v3, 0x0

    .line 338
    .local v3, "zf":Ljava/util/zip/ZipFile;
    :try_start_0
    new-instance v4, Ljava/util/zip/ZipFile;

    invoke-direct {v4, p1}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 342
    .end local v3    # "zf":Ljava/util/zip/ZipFile;
    .local v4, "zf":Ljava/util/zip/ZipFile;
    :try_start_1
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v0

    .line 343
    .local v0, "e":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 344
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/zip/ZipEntry;

    .line 345
    .local v2, "ze":Ljava/util/zip/ZipEntry;
    invoke-virtual {v2}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "META-INF/MANIFEST.MF"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 346
    new-instance v1, Ljava/io/InputStreamReader;

    invoke-virtual {v4, v2}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v5

    const-string/jumbo v6, "UTF-8"

    invoke-direct {v1, v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 348
    .local v1, "isr":Ljava/io/InputStreamReader;
    invoke-direct {p0, v1}, Lorg/apache/tools/ant/taskdefs/Jar;->getManifest(Ljava/io/Reader;)Lorg/apache/tools/ant/taskdefs/Manifest;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v5

    .line 353
    if-eqz v4, :cond_1

    .line 355
    :try_start_2
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V

    .line 351
    .end local v1    # "isr":Ljava/io/InputStreamReader;
    .end local v2    # "ze":Ljava/util/zip/ZipEntry;
    :cond_1
    :goto_0
    return-object v5

    :cond_2
    const/4 v5, 0x0

    .line 353
    if-eqz v4, :cond_1

    .line 355
    invoke-virtual {v4}, Ljava/util/zip/ZipFile;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 356
    :catch_0
    move-exception v6

    goto :goto_0

    .line 353
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v4    # "zf":Ljava/util/zip/ZipFile;
    .restart local v3    # "zf":Ljava/util/zip/ZipFile;
    :catchall_0
    move-exception v5

    :goto_1
    if-eqz v3, :cond_3

    .line 355
    :try_start_3
    invoke-virtual {v3}, Ljava/util/zip/ZipFile;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 353
    :cond_3
    :goto_2
    throw v5

    .line 356
    :catch_1
    move-exception v6

    goto :goto_2

    .line 353
    .end local v3    # "zf":Ljava/util/zip/ZipFile;
    .restart local v4    # "zf":Ljava/util/zip/ZipFile;
    :catchall_1
    move-exception v5

    move-object v3, v4

    .end local v4    # "zf":Ljava/util/zip/ZipFile;
    .restart local v3    # "zf":Ljava/util/zip/ZipFile;
    goto :goto_1
.end method

.method protected static grabFilesAndDirs(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 8
    .param p0, "file"    # Ljava/lang/String;
    .param p1, "dirs"    # Ljava/util/List;
    .param p2, "files"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1138
    const/4 v4, 0x0

    .line 1140
    .local v4, "zf":Lorg/apache/tools/zip/ZipFile;
    :try_start_0
    new-instance v5, Lorg/apache/tools/zip/ZipFile;

    const-string/jumbo v6, "utf-8"

    invoke-direct {v5, p0, v6}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1141
    .end local v4    # "zf":Lorg/apache/tools/zip/ZipFile;
    .local v5, "zf":Lorg/apache/tools/zip/ZipFile;
    :try_start_1
    invoke-virtual {v5}, Lorg/apache/tools/zip/ZipFile;->getEntries()Ljava/util/Enumeration;

    move-result-object v1

    .line 1142
    .local v1, "entries":Ljava/util/Enumeration;
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 1143
    .local v0, "dirSet":Ljava/util/HashSet;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 1144
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/zip/ZipEntry;

    .line 1146
    .local v3, "ze":Lorg/apache/tools/zip/ZipEntry;
    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v2

    .line 1147
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v3}, Lorg/apache/tools/zip/ZipEntry;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1148
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1161
    .end local v0    # "dirSet":Ljava/util/HashSet;
    .end local v1    # "entries":Ljava/util/Enumeration;
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "ze":Lorg/apache/tools/zip/ZipEntry;
    :catchall_0
    move-exception v6

    move-object v4, v5

    .end local v5    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v4    # "zf":Lorg/apache/tools/zip/ZipFile;
    :goto_1
    if-eqz v4, :cond_0

    .line 1162
    invoke-virtual {v4}, Lorg/apache/tools/zip/ZipFile;->close()V

    :cond_0
    throw v6

    .line 1149
    .end local v4    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v0    # "dirSet":Ljava/util/HashSet;
    .restart local v1    # "entries":Ljava/util/Enumeration;
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "ze":Lorg/apache/tools/zip/ZipEntry;
    .restart local v5    # "zf":Lorg/apache/tools/zip/ZipFile;
    :cond_1
    :try_start_2
    const-string/jumbo v6, "/"

    invoke-virtual {v2, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_2

    .line 1150
    invoke-interface {p2, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1156
    :cond_2
    const/4 v6, 0x0

    const-string/jumbo v7, "/"

    invoke-virtual {v2, v7}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-virtual {v2, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1159
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "ze":Lorg/apache/tools/zip/ZipEntry;
    :cond_3
    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1161
    if-eqz v5, :cond_4

    .line 1162
    invoke-virtual {v5}, Lorg/apache/tools/zip/ZipFile;->close()V

    .line 1165
    :cond_4
    return-void

    .line 1161
    .end local v0    # "dirSet":Ljava/util/HashSet;
    .end local v1    # "entries":Ljava/util/Enumeration;
    .end local v5    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v4    # "zf":Lorg/apache/tools/zip/ZipFile;
    :catchall_1
    move-exception v6

    goto :goto_1
.end method

.method private grabManifests([Lorg/apache/tools/ant/types/ResourceCollection;)[[Lorg/apache/tools/ant/types/Resource;
    .locals 12
    .param p1, "rcs"    # [Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 1168
    array-length v7, p1

    new-array v3, v7, [[Lorg/apache/tools/ant/types/Resource;

    .line 1169
    .local v3, "manifests":[[Lorg/apache/tools/ant/types/Resource;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v7, p1

    if-ge v1, v7, :cond_7

    .line 1170
    const/4 v6, 0x0

    check-cast v6, [[Lorg/apache/tools/ant/types/Resource;

    .line 1171
    .local v6, "resources":[[Lorg/apache/tools/ant/types/Resource;
    aget-object v7, p1, v1

    instance-of v7, v7, Lorg/apache/tools/ant/types/FileSet;

    if-eqz v7, :cond_3

    .line 1172
    new-array v8, v11, [Lorg/apache/tools/ant/types/FileSet;

    aget-object v7, p1, v1

    check-cast v7, Lorg/apache/tools/ant/types/FileSet;

    aput-object v7, v8, v10

    invoke-virtual {p0, v8}, Lorg/apache/tools/ant/taskdefs/Jar;->grabResources([Lorg/apache/tools/ant/types/FileSet;)[[Lorg/apache/tools/ant/types/Resource;

    move-result-object v6

    .line 1178
    :goto_1
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_2
    aget-object v7, v6, v10

    array-length v7, v7

    if-ge v2, v7, :cond_1

    .line 1179
    aget-object v7, v6, v10

    aget-object v7, v7, v2

    invoke-virtual {v7}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x5c

    const/16 v9, 0x2f

    invoke-virtual {v7, v8, v9}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    .line 1180
    .local v4, "name":Ljava/lang/String;
    aget-object v7, p1, v1

    instance-of v7, v7, Lorg/apache/tools/ant/types/ArchiveFileSet;

    if-eqz v7, :cond_0

    .line 1181
    aget-object v0, p1, v1

    check-cast v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    .line 1182
    .local v0, "afs":Lorg/apache/tools/ant/types/ArchiveFileSet;
    const-string/jumbo v7, ""

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v0, v8}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getFullpath(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 1183
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v0, v7}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getFullpath(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v4

    .line 1192
    .end local v0    # "afs":Lorg/apache/tools/ant/types/ArchiveFileSet;
    :cond_0
    :goto_3
    const-string/jumbo v7, "META-INF/MANIFEST.MF"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 1193
    new-array v7, v11, [Lorg/apache/tools/ant/types/Resource;

    aget-object v8, v6, v10

    aget-object v8, v8, v2

    aput-object v8, v7, v10

    aput-object v7, v3, v1

    .line 1197
    .end local v4    # "name":Ljava/lang/String;
    :cond_1
    aget-object v7, v3, v1

    if-nez v7, :cond_2

    .line 1198
    new-array v7, v10, [Lorg/apache/tools/ant/types/Resource;

    aput-object v7, v3, v1

    .line 1169
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1174
    .end local v2    # "j":I
    :cond_3
    new-array v7, v11, [Lorg/apache/tools/ant/types/ResourceCollection;

    aget-object v8, p1, v1

    aput-object v8, v7, v10

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/taskdefs/Jar;->grabNonFileSetResources([Lorg/apache/tools/ant/types/ResourceCollection;)[[Lorg/apache/tools/ant/types/Resource;

    move-result-object v6

    goto :goto_1

    .line 1184
    .restart local v0    # "afs":Lorg/apache/tools/ant/types/ArchiveFileSet;
    .restart local v2    # "j":I
    .restart local v4    # "name":Ljava/lang/String;
    :cond_4
    const-string/jumbo v7, ""

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v0, v8}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getPrefix(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 1185
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v0, v7}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getPrefix(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v5

    .line 1186
    .local v5, "prefix":Ljava/lang/String;
    const-string/jumbo v7, "/"

    invoke-virtual {v5, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    const-string/jumbo v7, "\\"

    invoke-virtual {v5, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 1187
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1189
    :cond_5
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_3

    .line 1178
    .end local v0    # "afs":Lorg/apache/tools/ant/types/ArchiveFileSet;
    .end local v5    # "prefix":Ljava/lang/String;
    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_2

    .line 1201
    .end local v2    # "j":I
    .end local v4    # "name":Ljava/lang/String;
    .end local v6    # "resources":[[Lorg/apache/tools/ant/types/Resource;
    :cond_7
    return-object v3
.end method

.method private jarHasIndex(Ljava/io/File;)Z
    .locals 6
    .param p1, "jarFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 380
    const/4 v2, 0x0

    .line 382
    .local v2, "zf":Ljava/util/zip/ZipFile;
    :try_start_0
    new-instance v3, Ljava/util/zip/ZipFile;

    invoke-direct {v3, p1}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 383
    .end local v2    # "zf":Ljava/util/zip/ZipFile;
    .local v3, "zf":Ljava/util/zip/ZipFile;
    :try_start_1
    invoke-virtual {v3}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    move-result-object v0

    .line 384
    .local v0, "e":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 385
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/zip/ZipEntry;

    .line 386
    .local v1, "ze":Ljava/util/zip/ZipEntry;
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "META-INF/INDEX.LIST"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v4

    if-eqz v4, :cond_0

    .line 387
    const/4 v4, 0x1

    .line 392
    if-eqz v3, :cond_1

    .line 394
    :try_start_2
    invoke-virtual {v3}, Ljava/util/zip/ZipFile;->close()V

    .line 390
    .end local v1    # "ze":Ljava/util/zip/ZipEntry;
    :cond_1
    :goto_0
    return v4

    :cond_2
    const/4 v4, 0x0

    .line 392
    if-eqz v3, :cond_1

    .line 394
    invoke-virtual {v3}, Ljava/util/zip/ZipFile;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 395
    :catch_0
    move-exception v5

    goto :goto_0

    .line 392
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v3    # "zf":Ljava/util/zip/ZipFile;
    .restart local v2    # "zf":Ljava/util/zip/ZipFile;
    :catchall_0
    move-exception v4

    :goto_1
    if-eqz v2, :cond_3

    .line 394
    :try_start_3
    invoke-virtual {v2}, Ljava/util/zip/ZipFile;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 392
    :cond_3
    :goto_2
    throw v4

    .line 395
    :catch_1
    move-exception v5

    goto :goto_2

    .line 392
    .end local v2    # "zf":Ljava/util/zip/ZipFile;
    .restart local v3    # "zf":Ljava/util/zip/ZipFile;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "zf":Ljava/util/zip/ZipFile;
    .restart local v2    # "zf":Ljava/util/zip/ZipFile;
    goto :goto_1
.end method

.method private writeManifest(Lorg/apache/tools/zip/ZipOutputStream;Lorg/apache/tools/ant/taskdefs/Manifest;)V
    .locals 12
    .param p1, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .param p2, "manifest"    # Lorg/apache/tools/ant/taskdefs/Manifest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 563
    invoke-virtual {p2}, Lorg/apache/tools/ant/taskdefs/Manifest;->getWarnings()Ljava/util/Enumeration;

    move-result-object v9

    .line 564
    .local v9, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v9}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 565
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Manifest warning: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-interface {v9}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/Jar;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 569
    :cond_0
    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    const-string/jumbo v3, "META-INF/"

    const/16 v4, 0x41ed

    sget-object v5, Lorg/apache/tools/ant/taskdefs/Jar;->JAR_MARKER:[Lorg/apache/tools/zip/ZipExtraField;

    move-object v0, p0

    move-object v2, p1

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/taskdefs/Jar;->zipDir(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I[Lorg/apache/tools/zip/ZipExtraField;)V

    .line 572
    new-instance v8, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v8}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 573
    .local v8, "baos":Ljava/io/ByteArrayOutputStream;
    new-instance v10, Ljava/io/OutputStreamWriter;

    const-string/jumbo v0, "UTF-8"

    invoke-direct {v10, v8, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 574
    .local v10, "osw":Ljava/io/OutputStreamWriter;
    new-instance v11, Ljava/io/PrintWriter;

    invoke-direct {v11, v10}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 575
    .local v11, "writer":Ljava/io/PrintWriter;
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->flattenClassPaths:Z

    invoke-virtual {p2, v11, v0}, Lorg/apache/tools/ant/taskdefs/Manifest;->write(Ljava/io/PrintWriter;Z)V

    .line 576
    invoke-virtual {v11}, Ljava/io/PrintWriter;->checkError()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 577
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v2, "Encountered an error writing the manifest"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 579
    :cond_1
    invoke-virtual {v11}, Ljava/io/PrintWriter;->close()V

    .line 581
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-virtual {v8}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 584
    .local v1, "bais":Ljava/io/ByteArrayInputStream;
    :try_start_0
    const-string/jumbo v3, "META-INF/MANIFEST.MF"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    const v7, 0x81a4

    move-object v0, p0

    move-object v2, p1

    invoke-super/range {v0 .. v7}, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile(Ljava/io/InputStream;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;JLjava/io/File;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 589
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 591
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/Zip;->initZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V

    .line 592
    return-void

    .line 589
    :catchall_0
    move-exception v0

    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v0
.end method

.method private writeServices(Lorg/apache/tools/zip/ZipOutputStream;)V
    .locals 10
    .param p1, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 467
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->serviceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .line 468
    .local v9, "serviceIterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 469
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/tools/ant/types/spi/Service;

    .line 471
    .local v8, "service":Lorg/apache/tools/ant/types/spi/Service;
    const/4 v1, 0x0

    .line 473
    .local v1, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {v8}, Lorg/apache/tools/ant/types/spi/Service;->getAsStream()Ljava/io/InputStream;

    move-result-object v1

    .line 475
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "META-INF/services/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v8}, Lorg/apache/tools/ant/types/spi/Service;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    const v7, 0x81a4

    move-object v0, p0

    move-object v2, p1

    invoke-super/range {v0 .. v7}, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile(Ljava/io/InputStream;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;JLjava/io/File;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 483
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v0

    .line 486
    .end local v1    # "is":Ljava/io/InputStream;
    .end local v8    # "service":Lorg/apache/tools/ant/types/spi/Service;
    :cond_0
    return-void
.end method


# virtual methods
.method public addConfiguredIndexJars(Lorg/apache/tools/ant/types/Path;)V
    .locals 2
    .param p1, "p"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 443
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->indexJars:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 444
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->indexJars:Lorg/apache/tools/ant/types/Path;

    .line 446
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->indexJars:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 447
    return-void
.end method

.method public addConfiguredManifest(Lorg/apache/tools/ant/taskdefs/Manifest;)V
    .locals 3
    .param p1, "newManifest"    # Lorg/apache/tools/ant/taskdefs/Manifest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/taskdefs/ManifestException;
        }
    .end annotation

    .prologue
    .line 280
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->configuredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    if-nez v0, :cond_0

    .line 281
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->configuredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    .line 285
    :goto_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->configuredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->savedConfiguredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    .line 286
    return-void

    .line 283
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->configuredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    const/4 v1, 0x0

    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeClassPaths:Z

    invoke-virtual {v0, p1, v1, v2}, Lorg/apache/tools/ant/taskdefs/Manifest;->merge(Lorg/apache/tools/ant/taskdefs/Manifest;ZZ)V

    goto :goto_0
.end method

.method public addConfiguredService(Lorg/apache/tools/ant/types/spi/Service;)V
    .locals 1
    .param p1, "service"    # Lorg/apache/tools/ant/types/spi/Service;

    .prologue
    .line 456
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/spi/Service;->check()V

    .line 457
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->serviceList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 458
    return-void
.end method

.method public addMetainf(Lorg/apache/tools/ant/types/ZipFileSet;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/tools/ant/types/ZipFileSet;

    .prologue
    .line 433
    const-string/jumbo v0, "META-INF/"

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/ZipFileSet;->setPrefix(Ljava/lang/String;)V

    .line 434
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/Zip;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 435
    return-void
.end method

.method protected cleanUp()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 931
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->cleanUp()V

    .line 932
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->checkJarSpec()V

    .line 935
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->doubleFilePass:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->skipWriting:Z

    if-nez v0, :cond_1

    .line 936
    :cond_0
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    .line 937
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->savedConfiguredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->configuredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    .line 938
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->filesetManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    .line 939
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->originalManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    .line 941
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->rootEntries:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 942
    return-void
.end method

.method protected createEmptyZip(Ljava/io/File;)Z
    .locals 7
    .param p1, "zipFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 878
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->createEmpty:Z

    if-nez v3, :cond_1

    .line 921
    :cond_0
    :goto_0
    return v5

    .line 882
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->emptyBehavior:Ljava/lang/String;

    const-string/jumbo v4, "skip"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 883
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->skipWriting:Z

    if-nez v3, :cond_0

    .line 884
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Warning: skipping "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Jar;->archiveType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " archive "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " because no files were included."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/taskdefs/Jar;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 889
    :cond_2
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->emptyBehavior:Ljava/lang/String;

    const-string/jumbo v4, "fail"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 890
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Cannot create "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Jar;->archiveType:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " archive "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ": no files were included."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 896
    :cond_3
    const/4 v1, 0x0

    .line 898
    .local v1, "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    :try_start_0
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->skipWriting:Z

    if-nez v3, :cond_4

    .line 899
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Building MANIFEST-only jar: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getDestFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/apache/tools/ant/taskdefs/Jar;->log(Ljava/lang/String;)V

    .line 902
    :cond_4
    new-instance v2, Lorg/apache/tools/zip/ZipOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getDestFile()Ljava/io/File;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Lorg/apache/tools/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 904
    .end local v1    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    .local v2, "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getEncoding()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/zip/ZipOutputStream;->setEncoding(Ljava/lang/String;)V

    .line 905
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->isCompress()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 906
    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Lorg/apache/tools/zip/ZipOutputStream;->setMethod(I)V

    .line 910
    :goto_1
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/Jar;->initZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V

    .line 911
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/Jar;->finalizeZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 918
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 919
    iput-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Jar;->createEmpty:Z

    goto/16 :goto_0

    .line 908
    :cond_5
    const/4 v3, 0x0

    :try_start_2
    invoke-virtual {v2, v3}, Lorg/apache/tools/zip/ZipOutputStream;->setMethod(I)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_1

    .line 912
    :catch_0
    move-exception v0

    move-object v1, v2

    .line 913
    .end local v2    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    .local v0, "ioe":Ljava/io/IOException;
    .restart local v1    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    :goto_2
    :try_start_3
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Could not create almost empty JAR archive ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v3, v4, v0, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 918
    .end local v0    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v3

    :goto_3
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 919
    iput-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Jar;->createEmpty:Z

    throw v3

    .line 918
    .end local v1    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    .restart local v2    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    :catchall_1
    move-exception v3

    move-object v1, v2

    .end local v2    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    .restart local v1    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    goto :goto_3

    .line 912
    :catch_1
    move-exception v0

    goto :goto_2
.end method

.method protected finalizeZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V
    .locals 1
    .param p1, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 604
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->index:Z

    if-eqz v0, :cond_0

    .line 605
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->createIndexList(Lorg/apache/tools/zip/ZipOutputStream;)V

    .line 607
    :cond_0
    return-void
.end method

.method protected getResourcesToAdd([Lorg/apache/tools/ant/types/ResourceCollection;Ljava/io/File;Z)Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;
    .locals 10
    .param p1, "rcs"    # [Lorg/apache/tools/ant/types/ResourceCollection;
    .param p2, "zipFile"    # Ljava/io/File;
    .param p3, "needsUpdate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/4 v6, 0x1

    .line 812
    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/Jar;->skipWriting:Z

    if-eqz v7, :cond_1

    .line 817
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->grabManifests([Lorg/apache/tools/ant/types/ResourceCollection;)[[Lorg/apache/tools/ant/types/Resource;

    move-result-object v3

    .line 818
    .local v3, "manifests":[[Lorg/apache/tools/ant/types/Resource;
    const/4 v0, 0x0

    .line 819
    .local v0, "count":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v7, v3

    if-ge v2, v7, :cond_0

    .line 820
    aget-object v7, v3, v2

    array-length v7, v7

    add-int/2addr v0, v7

    .line 819
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 822
    :cond_0
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "found a total of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " manifests in "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    array-length v8, v3

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " resource collections"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7, v9}, Lorg/apache/tools/ant/taskdefs/Jar;->log(Ljava/lang/String;I)V

    .line 825
    new-instance v7, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    invoke-direct {v7, v6, v3}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    move-object v6, v7

    .line 868
    .end local v0    # "count":I
    .end local v2    # "i":I
    .end local v3    # "manifests":[[Lorg/apache/tools/ant/types/Resource;
    :goto_1
    return-object v6

    .line 829
    :cond_1
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 834
    :try_start_0
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/taskdefs/Jar;->getManifestFromJar(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/Manifest;

    move-result-object v7

    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/Jar;->originalManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    .line 835
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Jar;->originalManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    if-nez v7, :cond_4

    .line 836
    const-string/jumbo v7, "Updating jar since the current jar has no manifest"

    const/4 v8, 0x3

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/Jar;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 838
    const/4 p3, 0x1

    .line 859
    :cond_2
    :goto_2
    iput-boolean p3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->createEmpty:Z

    .line 860
    if-nez p3, :cond_3

    iget-boolean v7, p0, Lorg/apache/tools/ant/taskdefs/Jar;->index:Z

    if-eqz v7, :cond_3

    .line 862
    :try_start_1
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/taskdefs/Jar;->jarHasIndex(Ljava/io/File;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v7

    if-nez v7, :cond_6

    move p3, v6

    .line 868
    :cond_3
    :goto_3
    invoke-super {p0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/Zip;->getResourcesToAdd([Lorg/apache/tools/ant/types/ResourceCollection;Ljava/io/File;Z)Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    move-result-object v6

    goto :goto_1

    .line 840
    :cond_4
    :try_start_2
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->createManifest()Lorg/apache/tools/ant/taskdefs/Manifest;

    move-result-object v4

    .line 841
    .local v4, "mf":Lorg/apache/tools/ant/taskdefs/Manifest;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Jar;->originalManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    invoke-virtual {v4, v7}, Lorg/apache/tools/ant/taskdefs/Manifest;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 842
    const-string/jumbo v7, "Updating jar since jar manifest has changed"

    const/4 v8, 0x3

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/Jar;->log(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 844
    const/4 p3, 0x1

    goto :goto_2

    .line 847
    .end local v4    # "mf":Lorg/apache/tools/ant/taskdefs/Manifest;
    :catch_0
    move-exception v5

    .line 848
    .local v5, "t":Ljava/lang/Throwable;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "error while reading original manifest in file: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " due to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7, v6}, Lorg/apache/tools/ant/taskdefs/Jar;->log(Ljava/lang/String;I)V

    .line 851
    const/4 p3, 0x1

    .line 852
    goto :goto_2

    .line 856
    .end local v5    # "t":Ljava/lang/Throwable;
    :cond_5
    const/4 p3, 0x1

    goto :goto_2

    .line 862
    :cond_6
    const/4 p3, 0x0

    goto :goto_3

    .line 863
    :catch_1
    move-exception v1

    .line 865
    .local v1, "e":Ljava/io/IOException;
    const/4 p3, 0x1

    goto :goto_3
.end method

.method protected initZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V
    .locals 2
    .param p1, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 516
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->skipWriting:Z

    if-nez v1, :cond_0

    .line 517
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->createManifest()Lorg/apache/tools/ant/taskdefs/Manifest;

    move-result-object v0

    .line 518
    .local v0, "jarManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Jar;->writeManifest(Lorg/apache/tools/zip/ZipOutputStream;Lorg/apache/tools/ant/taskdefs/Manifest;)V

    .line 519
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->writeServices(Lorg/apache/tools/zip/ZipOutputStream;)V

    .line 521
    .end local v0    # "jarManifest":Lorg/apache/tools/ant/taskdefs/Manifest;
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 993
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->reset()V

    .line 994
    const-string/jumbo v0, "create"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->emptyBehavior:Ljava/lang/String;

    .line 995
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->configuredManifest:Lorg/apache/tools/ant/taskdefs/Manifest;

    .line 996
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->filesetManifestConfig:Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;

    .line 997
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeManifestsMain:Z

    .line 998
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestFile:Ljava/io/File;

    .line 999
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Jar;->index:Z

    .line 1000
    return-void
.end method

.method public setFilesetmanifest(Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;)V
    .locals 2
    .param p1, "config"    # Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;

    .prologue
    .line 416
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->filesetManifestConfig:Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;

    .line 417
    const-string/jumbo v0, "merge"

    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeManifestsMain:Z

    .line 419
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->filesetManifestConfig:Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->filesetManifestConfig:Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Jar$FilesetManifestConfig;->getValue()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "skip"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 422
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->doubleFilePass:Z

    .line 424
    :cond_0
    return-void
.end method

.method public setFlattenAttributes(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 504
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->flattenClassPaths:Z

    .line 505
    return-void
.end method

.method public setIndex(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 239
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->index:Z

    .line 240
    return-void
.end method

.method public setIndexMetaInf(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 259
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->indexMetaInf:Z

    .line 260
    return-void
.end method

.method public setJarfile(Ljava/io/File;)V
    .locals 0
    .param p1, "jarFile"    # Ljava/io/File;

    .prologue
    .line 230
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->setDestFile(Ljava/io/File;)V

    .line 231
    return-void
.end method

.method public setManifest(Ljava/io/File;)V
    .locals 3
    .param p1, "manifestFile"    # Ljava/io/File;

    .prologue
    .line 296
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 297
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Manifest file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " does not exist."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 301
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestFile:Ljava/io/File;

    .line 302
    return-void
.end method

.method public setManifestEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "manifestEncoding"    # Ljava/lang/String;

    .prologue
    .line 268
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->manifestEncoding:Ljava/lang/String;

    .line 269
    return-void
.end method

.method public setMergeClassPathAttributes(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 494
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->mergeClassPaths:Z

    .line 495
    return-void
.end method

.method public setStrict(Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;)V
    .locals 0
    .param p1, "strict"    # Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;

    .prologue
    .line 220
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->strict:Lorg/apache/tools/ant/taskdefs/Jar$StrictMode;

    .line 221
    return-void
.end method

.method public setWhenempty(Lorg/apache/tools/ant/taskdefs/Zip$WhenEmpty;)V
    .locals 2
    .param p1, "we"    # Lorg/apache/tools/ant/taskdefs/Zip$WhenEmpty;

    .prologue
    .line 195
    const-string/jumbo v0, "JARs are never empty, they contain at least a manifest file"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Jar;->log(Ljava/lang/String;I)V

    .line 197
    return-void
.end method

.method public setWhenmanifestonly(Lorg/apache/tools/ant/taskdefs/Zip$WhenEmpty;)V
    .locals 1
    .param p1, "we"    # Lorg/apache/tools/ant/taskdefs/Zip$WhenEmpty;

    .prologue
    .line 210
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Zip$WhenEmpty;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->emptyBehavior:Ljava/lang/String;

    .line 211
    return-void
.end method

.method protected final writeIndexLikeList(Ljava/util/List;Ljava/util/List;Ljava/io/PrintWriter;)V
    .locals 5
    .param p1, "dirs"    # Ljava/util/List;
    .param p2, "files"    # Ljava/util/List;
    .param p3, "writer"    # Ljava/io/PrintWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v4, 0x2f

    .line 1031
    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1032
    invoke-static {p2}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1033
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1034
    .local v1, "iter":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1035
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1038
    .local v0, "dir":Ljava/lang/String;
    const/16 v3, 0x5c

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 1039
    const-string/jumbo v3, "./"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1040
    const/4 v3, 0x2

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 1042
    :cond_1
    :goto_1
    const-string/jumbo v3, "/"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1043
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 1045
    :cond_2
    invoke-virtual {v0, v4}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 1046
    .local v2, "pos":I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_3

    .line 1047
    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1055
    :cond_3
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Jar;->indexMetaInf:Z

    if-nez v3, :cond_4

    const-string/jumbo v3, "META-INF"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 1059
    :cond_4
    invoke-virtual {p3, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    goto :goto_0

    .line 1062
    .end local v0    # "dir":Ljava/lang/String;
    .end local v2    # "pos":I
    :cond_5
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 1063
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1064
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    goto :goto_2

    .line 1066
    :cond_6
    return-void
.end method

.method protected zipFile(Ljava/io/InputStream;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;JLjava/io/File;I)V
    .locals 2
    .param p1, "is"    # Ljava/io/InputStream;
    .param p2, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .param p3, "vPath"    # Ljava/lang/String;
    .param p4, "lastModified"    # J
    .param p6, "fromArchive"    # Ljava/io/File;
    .param p7, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 696
    const-string/jumbo v0, "META-INF/MANIFEST.MF"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 697
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->isFirstPass()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 698
    invoke-direct {p0, p6, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->filesetManifest(Ljava/io/File;Ljava/io/InputStream;)V

    .line 711
    :cond_0
    :goto_0
    return-void

    .line 700
    :cond_1
    const-string/jumbo v0, "META-INF/INDEX.LIST"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->index:Z

    if-eqz v0, :cond_2

    .line 701
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Warning: selected "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Jar;->archiveType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " files include a "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "META-INF/INDEX.LIST"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " which will"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " be replaced by a newly generated one."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Jar;->logWhenWriting(Ljava/lang/String;I)V

    goto :goto_0

    .line 706
    :cond_2
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->index:Z

    if-eqz v0, :cond_3

    const-string/jumbo v0, "/"

    invoke-virtual {p3, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_3

    .line 707
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Jar;->rootEntries:Ljava/util/Vector;

    invoke-virtual {v0, p3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 709
    :cond_3
    invoke-super/range {p0 .. p7}, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile(Ljava/io/InputStream;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;JLjava/io/File;I)V

    goto :goto_0
.end method
