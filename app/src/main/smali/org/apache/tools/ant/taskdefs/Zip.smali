.class public Lorg/apache/tools/ant/taskdefs/Zip;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "Zip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Zip$UnicodeExtraField;,
        Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;,
        Lorg/apache/tools/ant/taskdefs/Zip$Duplicate;,
        Lorg/apache/tools/ant/taskdefs/Zip$WhenEmpty;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field private static final EMPTY_CRC:J

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final MISSING_DIR_PROVIDER:Lorg/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider;

.field private static final MISSING_SELECTOR:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

.field private static final ROUNDUP_MILLIS:I = 0x7cf

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

.field private static currentZipExtra:Ljava/lang/ThreadLocal;

.field private static haveNonFileSetResourcesToAdd:Ljava/lang/ThreadLocal;


# instance fields
.field protected addedDirs:Ljava/util/Hashtable;

.field private addedFiles:Ljava/util/Vector;

.field private addingNewFiles:Z

.field protected archiveType:Ljava/lang/String;

.field private baseDir:Ljava/io/File;

.field private comment:Ljava/lang/String;

.field private createUnicodeExtraFields:Lorg/apache/tools/ant/taskdefs/Zip$UnicodeExtraField;

.field private doCompress:Z

.field private doFilesonly:Z

.field private doUpdate:Z

.field protected doubleFilePass:Z

.field protected duplicate:Ljava/lang/String;

.field protected emptyBehavior:Ljava/lang/String;

.field private encoding:Ljava/lang/String;

.field protected entries:Ljava/util/Hashtable;

.field private fallBackToUTF8:Z

.field private filesetsFromGroupfilesets:Ljava/util/Vector;

.field private groupfilesets:Ljava/util/Vector;

.field private keepCompression:Z

.field private level:I

.field private preserve0Permissions:Z

.field private resources:Ljava/util/Vector;

.field private roundUp:Z

.field private savedDoUpdate:Z

.field protected skipWriting:Z

.field private updatedFile:Z

.field private useLanguageEncodingFlag:Z

.field protected zipFile:Ljava/io/File;

.field private zs:Lorg/apache/tools/ant/types/ZipScanner;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 99
    new-instance v0, Ljava/util/zip/CRC32;

    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v0

    sput-wide v0, Lorg/apache/tools/ant/taskdefs/Zip;->EMPTY_CRC:J

    .line 105
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Zip$1;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Zip$1;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Zip;->MISSING_SELECTOR:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .line 113
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Zip$2;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Zip$2;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Zip;->MISSING_DIR_PROVIDER:Lorg/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider;

    .line 151
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Zip;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 1256
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Zip$3;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Zip$3;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Zip;->haveNonFileSetResourcesToAdd:Ljava/lang/ThreadLocal;

    .line 1707
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Zip$5;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Zip$5;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Zip;->currentZipExtra:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 78
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 87
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->entries:Ljava/util/Hashtable;

    .line 88
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->groupfilesets:Ljava/util/Vector;

    .line 89
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->filesetsFromGroupfilesets:Ljava/util/Vector;

    .line 90
    const-string/jumbo v0, "add"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->duplicate:Ljava/lang/String;

    .line 91
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doCompress:Z

    .line 92
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    .line 94
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->savedDoUpdate:Z

    .line 95
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doFilesonly:Z

    .line 96
    const-string/jumbo v0, "zip"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->archiveType:Ljava/lang/String;

    .line 100
    const-string/jumbo v0, "skip"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->emptyBehavior:Ljava/lang/String;

    .line 101
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->resources:Ljava/util/Vector;

    .line 102
    new-instance v0, Ljava/util/Hashtable;

    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->addedDirs:Ljava/util/Hashtable;

    .line 103
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->addedFiles:Ljava/util/Vector;

    .line 129
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doubleFilePass:Z

    .line 137
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->skipWriting:Z

    .line 157
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->updatedFile:Z

    .line 163
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->addingNewFiles:Z

    .line 177
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->keepCompression:Z

    .line 185
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->roundUp:Z

    .line 191
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->comment:Ljava/lang/String;

    .line 193
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->level:I

    .line 199
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->preserve0Permissions:Z

    .line 206
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->useLanguageEncodingFlag:Z

    .line 213
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Zip$UnicodeExtraField;->NEVER:Lorg/apache/tools/ant/taskdefs/Zip$UnicodeExtraField;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->createUnicodeExtraFields:Lorg/apache/tools/ant/taskdefs/Zip$UnicodeExtraField;

    .line 222
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->fallBackToUTF8:Z

    .line 2150
    return-void
.end method

.method static access$000()Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;
    .locals 1

    .prologue
    .line 78
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Zip;->MISSING_SELECTOR:Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    return-object v0
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/Zip;)Z
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/Zip;

    .prologue
    .line 78
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doFilesonly:Z

    return v0
.end method

.method private addDirectoryResource(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;II)V
    .locals 7
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "base"    # Ljava/io/File;
    .param p5, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .param p6, "defaultDirMode"    # I
    .param p7, "thisDirMode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 977
    const-string/jumbo v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 978
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    .line 981
    :cond_0
    const-string/jumbo v0, "/"

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x2

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v6

    .line 982
    .local v6, "nextToLastSlash":I
    const/4 v0, -0x1

    if-eq v6, v0, :cond_1

    .line 983
    const/4 v0, 0x0

    add-int/lit8 v1, v6, 0x1

    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    move-object v0, p0

    move-object v1, p4

    move-object v3, p5

    move-object v4, p3

    move v5, p6

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/taskdefs/Zip;->addParentDirs(Ljava/io/File;Ljava/lang/String;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V

    .line 986
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    instance-of v0, p1, Lorg/apache/tools/ant/types/resources/ZipResource;

    if-eqz v0, :cond_2

    move-object v0, p1

    check-cast v0, Lorg/apache/tools/ant/types/resources/ZipResource;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/resources/ZipResource;->getExtraFields()[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v5

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move-object v2, p5

    move v4, p7

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/taskdefs/Zip;->zipDir(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I[Lorg/apache/tools/zip/ZipExtraField;)V

    .line 989
    return-void

    .line 986
    :cond_2
    const/4 v5, 0x0

    goto :goto_0
.end method

.method private addResource(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/zip/ZipOutputStream;ILorg/apache/tools/zip/ZipFile;Ljava/io/File;)V
    .locals 13
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "prefix"    # Ljava/lang/String;
    .param p4, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .param p5, "mode"    # I
    .param p6, "zf"    # Lorg/apache/tools/zip/ZipFile;
    .param p7, "fromArchive"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1020
    if-eqz p6, :cond_3

    .line 1021
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p6

    invoke-virtual {v0, v2}, Lorg/apache/tools/zip/ZipFile;->getEntry(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEntry;

    move-result-object v12

    .line 1023
    .local v12, "ze":Lorg/apache/tools/zip/ZipEntry;
    if-eqz v12, :cond_1

    .line 1024
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doCompress:Z

    .line 1025
    .local v11, "oldCompress":Z
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->keepCompression:Z

    if-eqz v2, :cond_0

    .line 1026
    invoke-virtual {v12}, Lorg/apache/tools/zip/ZipEntry;->getMethod()I

    move-result v2

    const/16 v4, 0x8

    if-ne v2, v4, :cond_2

    const/4 v2, 0x1

    :goto_0
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doCompress:Z

    .line 1028
    :cond_0
    const/4 v3, 0x0

    .line 1030
    .local v3, "is":Ljava/io/InputStream;
    :try_start_0
    move-object/from16 v0, p6

    invoke-virtual {v0, v12}, Lorg/apache/tools/zip/ZipFile;->getInputStream(Lorg/apache/tools/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object v3

    .line 1031
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v12}, Lorg/apache/tools/zip/ZipEntry;->getTime()J

    move-result-wide v6

    const/4 v2, 0x1

    invoke-virtual {v12, v2}, Lorg/apache/tools/zip/ZipEntry;->getExtraFields(Z)[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v10

    move-object v2, p0

    move-object/from16 v4, p4

    move-object/from16 v8, p7

    move/from16 v9, p5

    invoke-virtual/range {v2 .. v10}, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile(Ljava/io/InputStream;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;JLjava/io/File;I[Lorg/apache/tools/zip/ZipExtraField;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1034
    iput-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doCompress:Z

    .line 1035
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    .line 1049
    .end local v3    # "is":Ljava/io/InputStream;
    .end local v11    # "oldCompress":Z
    .end local v12    # "ze":Lorg/apache/tools/zip/ZipEntry;
    .end local p1    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_1
    :goto_1
    return-void

    .line 1026
    .restart local v11    # "oldCompress":Z
    .restart local v12    # "ze":Lorg/apache/tools/zip/ZipEntry;
    .restart local p1    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .line 1034
    .restart local v3    # "is":Ljava/io/InputStream;
    :catchall_0
    move-exception v2

    iput-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doCompress:Z

    .line 1035
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v2

    .line 1039
    .end local v3    # "is":Ljava/io/InputStream;
    .end local v11    # "oldCompress":Z
    .end local v12    # "ze":Lorg/apache/tools/zip/ZipEntry;
    :cond_3
    const/4 v3, 0x0

    .line 1041
    .restart local v3    # "is":Ljava/io/InputStream;
    :try_start_1
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .line 1042
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v6

    instance-of v2, p1, Lorg/apache/tools/ant/types/resources/ZipResource;

    if-eqz v2, :cond_4

    check-cast p1, Lorg/apache/tools/ant/types/resources/ZipResource;

    .end local p1    # "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/resources/ZipResource;->getExtraFields()[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v10

    :goto_2
    move-object v2, p0

    move-object/from16 v4, p4

    move-object/from16 v8, p7

    move/from16 v9, p5

    invoke-virtual/range {v2 .. v10}, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile(Ljava/io/InputStream;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;JLjava/io/File;I[Lorg/apache/tools/zip/ZipExtraField;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1046
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    goto :goto_1

    .line 1042
    .restart local p1    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_4
    const/4 v10, 0x0

    goto :goto_2

    .line 1046
    .end local p1    # "r":Lorg/apache/tools/ant/types/Resource;
    :catchall_1
    move-exception v2

    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/InputStream;)V

    throw v2
.end method

.method private checkAttributesAndElements()V
    .locals 3

    .prologue
    .line 793
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->baseDir:Ljava/io/File;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->resources:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->groupfilesets:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "zip"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->archiveType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 795
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "basedir attribute must be set, or at least one resource collection must be given!"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 800
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    if-nez v0, :cond_1

    .line 801
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "You must specify the "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->archiveType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " file to create!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 805
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_2

    .line 806
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " is not a file."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 809
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->canWrite()Z

    move-result v0

    if-nez v0, :cond_3

    .line 810
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " is read-only."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 812
    :cond_3
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 1080
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

.method private closeZout(Lorg/apache/tools/zip/ZipOutputStream;Z)V
    .locals 1
    .param p1, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .param p2, "success"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 770
    if-nez p1, :cond_1

    .line 789
    :cond_0
    :goto_0
    return-void

    .line 774
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Lorg/apache/tools/zip/ZipOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 775
    :catch_0
    move-exception v0

    .line 785
    .local v0, "ex":Ljava/io/IOException;
    if-eqz p2, :cond_0

    .line 786
    throw v0
.end method

.method private getUnixMode(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/zip/ZipFile;I)I
    .locals 3
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "zf"    # Lorg/apache/tools/zip/ZipFile;
    .param p3, "defaultMode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 998
    move v0, p3

    .line 999
    .local v0, "unixMode":I
    if-eqz p2, :cond_2

    .line 1000
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/apache/tools/zip/ZipFile;->getEntry(Ljava/lang/String;)Lorg/apache/tools/zip/ZipEntry;

    move-result-object v1

    .line 1001
    .local v1, "ze":Lorg/apache/tools/zip/ZipEntry;
    invoke-virtual {v1}, Lorg/apache/tools/zip/ZipEntry;->getUnixMode()I

    move-result v0

    .line 1002
    if-eqz v0, :cond_0

    const/16 v2, 0x4000

    if-ne v0, v2, :cond_1

    :cond_0
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->preserve0Permissions:Z

    if-nez v2, :cond_1

    .line 1004
    move v0, p3

    .line 1009
    .end local v1    # "ze":Lorg/apache/tools/zip/ZipEntry;
    .end local p1    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_1
    :goto_0
    return v0

    .line 1006
    .restart local p1    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_2
    instance-of v2, p1, Lorg/apache/tools/ant/types/resources/ArchiveResource;

    if-eqz v2, :cond_1

    .line 1007
    check-cast p1, Lorg/apache/tools/ant/types/resources/ArchiveResource;

    .end local p1    # "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/resources/ArchiveResource;->getMode()I

    move-result v0

    goto :goto_0
.end method

.method private declared-synchronized getZipScanner()Lorg/apache/tools/ant/types/ZipScanner;
    .locals 2

    .prologue
    .line 1167
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zs:Lorg/apache/tools/ant/types/ZipScanner;

    if-nez v0, :cond_0

    .line 1168
    new-instance v0, Lorg/apache/tools/ant/types/ZipScanner;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/ZipScanner;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zs:Lorg/apache/tools/ant/types/ZipScanner;

    .line 1169
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zs:Lorg/apache/tools/ant/types/ZipScanner;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->encoding:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ZipScanner;->setEncoding(Ljava/lang/String;)V

    .line 1170
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zs:Lorg/apache/tools/ant/types/ZipScanner;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ZipScanner;->setSrc(Ljava/io/File;)V

    .line 1172
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zs:Lorg/apache/tools/ant/types/ZipScanner;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 1167
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected static final isEmpty([[Lorg/apache/tools/ant/types/Resource;)Z
    .locals 2
    .param p0, "r"    # [[Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 1995
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 1996
    aget-object v1, p0, v0

    array-length v1, v1

    if-lez v1, :cond_0

    .line 1997
    const/4 v1, 0x0

    .line 2000
    :goto_1
    return v1

    .line 1995
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2000
    :cond_1
    const/4 v1, 0x1

    goto :goto_1
.end method

.method private processDoUpdate()V
    .locals 2

    .prologue
    .line 818
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 819
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    .line 820
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "ignoring update attribute as "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->archiveType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " doesn\'t exist."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Zip;->logWhenWriting(Ljava/lang/String;I)V

    .line 823
    :cond_0
    return-void
.end method

.method private processGroupFilesets()V
    .locals 11

    .prologue
    const/4 v10, 0x3

    .line 828
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Zip;->groupfilesets:Ljava/util/Vector;

    invoke-virtual {v8}, Ljava/util/Vector;->size()I

    move-result v6

    .line 829
    .local v6, "size":I
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v6, :cond_1

    .line 831
    const-string/jumbo v8, "Processing groupfileset "

    invoke-virtual {p0, v8, v10}, Lorg/apache/tools/ant/taskdefs/Zip;->logWhenWriting(Ljava/lang/String;I)V

    .line 832
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Zip;->groupfilesets:Ljava/util/Vector;

    invoke-virtual {v8, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/FileSet;

    .line 833
    .local v2, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v2, v8}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v5

    .line 834
    .local v5, "scanner":Lorg/apache/tools/ant/FileScanner;
    invoke-interface {v5}, Lorg/apache/tools/ant/FileScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v1

    .line 835
    .local v1, "files":[Ljava/lang/String;
    invoke-interface {v5}, Lorg/apache/tools/ant/FileScanner;->getBasedir()Ljava/io/File;

    move-result-object v0

    .line 836
    .local v0, "basedir":Ljava/io/File;
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_1
    array-length v8, v1

    if-ge v4, v8, :cond_0

    .line 838
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Adding file "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    aget-object v9, v1, v4

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " to fileset"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v10}, Lorg/apache/tools/ant/taskdefs/Zip;->logWhenWriting(Ljava/lang/String;I)V

    .line 840
    new-instance v7, Lorg/apache/tools/ant/types/ZipFileSet;

    invoke-direct {v7}, Lorg/apache/tools/ant/types/ZipFileSet;-><init>()V

    .line 841
    .local v7, "zf":Lorg/apache/tools/ant/types/ZipFileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/ZipFileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 842
    new-instance v8, Ljava/io/File;

    aget-object v9, v1, v4

    invoke-direct {v8, v0, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/types/ZipFileSet;->setSrc(Ljava/io/File;)V

    .line 843
    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/taskdefs/Zip;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 844
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/Zip;->filesetsFromGroupfilesets:Ljava/util/Vector;

    invoke-virtual {v8, v7}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 836
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 829
    .end local v7    # "zf":Lorg/apache/tools/ant/types/ZipFileSet;
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 847
    .end local v0    # "basedir":Ljava/io/File;
    .end local v1    # "files":[Ljava/lang/String;
    .end local v2    # "fs":Lorg/apache/tools/ant/types/FileSet;
    .end local v4    # "j":I
    .end local v5    # "scanner":Lorg/apache/tools/ant/FileScanner;
    :cond_1
    return-void
.end method

.method private renameFile()Ljava/io/File;
    .locals 8

    .prologue
    .line 749
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Zip;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const-string/jumbo v1, "zip"

    const-string/jumbo v2, ".tmp"

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v7

    .line 752
    .local v7, "renamedFile":Ljava/io/File;
    :try_start_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Zip;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {v0, v1, v7}, Lorg/apache/tools/ant/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 764
    return-object v7

    .line 753
    :catch_0
    move-exception v6

    .line 754
    .local v6, "e":Ljava/lang/SecurityException;
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Not allowed to rename old file ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ") to temporary file"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 758
    .end local v6    # "e":Ljava/lang/SecurityException;
    :catch_1
    move-exception v6

    .line 759
    .local v6, "e":Ljava/io/IOException;
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Unable to rename old file ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ") to temporary file"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private selectOutOfDateResources([Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;)[Lorg/apache/tools/ant/types/Resource;
    .locals 7
    .param p1, "initial"    # [Lorg/apache/tools/ant/types/Resource;
    .param p2, "mapper"    # Lorg/apache/tools/ant/util/FileNameMapper;

    .prologue
    .line 1512
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Zip;->selectFileResources([Lorg/apache/tools/ant/types/Resource;)[Lorg/apache/tools/ant/types/Resource;

    move-result-object v3

    .line 1513
    .local v3, "rs":[Lorg/apache/tools/ant/types/Resource;
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getZipScanner()Lorg/apache/tools/ant/types/ZipScanner;

    move-result-object v5

    invoke-static {p0, v3, p2, v5}, Lorg/apache/tools/ant/util/ResourceUtils;->selectOutOfDateSources(Lorg/apache/tools/ant/ProjectComponent;[Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;Lorg/apache/tools/ant/types/ResourceFactory;)[Lorg/apache/tools/ant/types/Resource;

    move-result-object v2

    .line 1516
    .local v2, "result":[Lorg/apache/tools/ant/types/Resource;
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doFilesonly:Z

    if-nez v5, :cond_0

    .line 1517
    new-instance v4, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v4}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    .line 1518
    .local v4, "u":Lorg/apache/tools/ant/types/resources/Union;
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Zip;->selectDirectoryResources([Lorg/apache/tools/ant/types/Resource;)[Lorg/apache/tools/ant/types/Resource;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/types/resources/Union;->addAll(Ljava/util/Collection;)V

    .line 1519
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getZipScanner()Lorg/apache/tools/ant/types/ZipScanner;

    move-result-object v5

    sget-object v6, Lorg/apache/tools/ant/taskdefs/Zip;->MISSING_DIR_PROVIDER:Lorg/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider;

    invoke-static {p0, v4, p2, v5, v6}, Lorg/apache/tools/ant/util/ResourceUtils;->selectSources(Lorg/apache/tools/ant/ProjectComponent;Lorg/apache/tools/ant/types/ResourceCollection;Lorg/apache/tools/ant/util/FileNameMapper;Lorg/apache/tools/ant/types/ResourceFactory;Lorg/apache/tools/ant/util/ResourceUtils$ResourceSelectorProvider;)Lorg/apache/tools/ant/types/ResourceCollection;

    move-result-object v1

    .line 1523
    .local v1, "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    invoke-interface {v1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v5

    if-lez v5, :cond_0

    .line 1524
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1525
    .local v0, "newer":Ljava/util/ArrayList;
    check-cast v1, Lorg/apache/tools/ant/types/resources/Union;

    .end local v1    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/Union;->listResources()[Lorg/apache/tools/ant/types/Resource;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1526
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1527
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "result":[Lorg/apache/tools/ant/types/Resource;
    check-cast v2, [Lorg/apache/tools/ant/types/Resource;

    .line 1530
    .end local v0    # "newer":Ljava/util/ArrayList;
    .end local v4    # "u":Lorg/apache/tools/ant/types/resources/Union;
    .restart local v2    # "result":[Lorg/apache/tools/ant/types/Resource;
    :cond_0
    return-object v2
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "a"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 345
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->resources:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 346
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 0
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 327
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Zip;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 328
    return-void
.end method

.method protected final addParentDirs(Ljava/io/File;Ljava/lang/String;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V
    .locals 6
    .param p1, "baseDir"    # Ljava/io/File;
    .param p2, "entry"    # Ljava/lang/String;
    .param p3, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .param p4, "prefix"    # Ljava/lang/String;
    .param p5, "dirMode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1911
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doFilesonly:Z

    if-nez v4, :cond_3

    .line 1912
    new-instance v1, Ljava/util/Stack;

    invoke-direct {v1}, Ljava/util/Stack;-><init>()V

    .line 1913
    .local v1, "directories":Ljava/util/Stack;
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    .line 1915
    .local v3, "slashPos":I
    :goto_0
    const/16 v4, 0x2f

    add-int/lit8 v5, v3, -0x1

    invoke-virtual {p2, v4, v5}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    .line 1916
    const/4 v4, 0x0

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {p2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 1917
    .local v0, "dir":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Zip;->addedDirs:Ljava/util/Hashtable;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 1923
    .end local v0    # "dir":Ljava/lang/String;
    :cond_0
    :goto_1
    invoke-virtual {v1}, Ljava/util/Stack;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    .line 1924
    invoke-virtual {v1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1925
    .restart local v0    # "dir":Ljava/lang/String;
    const/4 v2, 0x0

    .line 1926
    .local v2, "f":Ljava/io/File;
    if-eqz p1, :cond_2

    .line 1927
    new-instance v2, Ljava/io/File;

    .end local v2    # "f":Ljava/io/File;
    invoke-direct {v2, p1, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1931
    .restart local v2    # "f":Ljava/io/File;
    :goto_2
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v2, p3, v4, p5}, Lorg/apache/tools/ant/taskdefs/Zip;->zipDir(Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V

    goto :goto_1

    .line 1920
    .end local v2    # "f":Ljava/io/File;
    :cond_1
    invoke-virtual {v1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1929
    .restart local v2    # "f":Ljava/io/File;
    :cond_2
    new-instance v2, Ljava/io/File;

    .end local v2    # "f":Ljava/io/File;
    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .restart local v2    # "f":Ljava/io/File;
    goto :goto_2

    .line 1934
    .end local v0    # "dir":Ljava/lang/String;
    .end local v1    # "directories":Ljava/util/Stack;
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "slashPos":I
    :cond_3
    return-void
.end method

.method protected final addResources(Lorg/apache/tools/ant/types/FileSet;[Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/zip/ZipOutputStream;)V
    .locals 33
    .param p1, "fileset"    # Lorg/apache/tools/ant/types/FileSet;
    .param p2, "resources"    # [Lorg/apache/tools/ant/types/Resource;
    .param p3, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 873
    const-string/jumbo v6, ""

    .line 874
    .local v6, "prefix":Ljava/lang/String;
    const-string/jumbo v29, ""

    .line 875
    .local v29, "fullpath":Ljava/lang/String;
    const/16 v9, 0x41ed

    .line 876
    .local v9, "dirMode":I
    const v28, 0x81a4

    .line 878
    .local v28, "fileMode":I
    const/16 v32, 0x0

    .line 879
    .local v32, "zfs":Lorg/apache/tools/ant/types/ArchiveFileSet;
    move-object/from16 v0, p1

    instance-of v4, v0, Lorg/apache/tools/ant/types/ArchiveFileSet;

    if-eqz v4, :cond_0

    move-object/from16 v32, p1

    .line 880
    check-cast v32, Lorg/apache/tools/ant/types/ArchiveFileSet;

    .line 881
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    move-object/from16 v0, v32

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getPrefix(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v6

    .line 882
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    move-object/from16 v0, v32

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getFullpath(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v29

    .line 883
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    move-object/from16 v0, v32

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getDirMode(Lorg/apache/tools/ant/Project;)I

    move-result v9

    .line 884
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    move-object/from16 v0, v32

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getFileMode(Lorg/apache/tools/ant/Project;)I

    move-result v28

    .line 887
    :cond_0
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 888
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "Both prefix and fullpath attributes must not be set on the same fileset."

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 892
    :cond_1
    move-object/from16 v0, p2

    array-length v4, v0

    const/4 v5, 0x1

    if-eq v4, v5, :cond_2

    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 893
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v5, "fullpath attribute may only be specified for filesets that specify a single file."

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 898
    :cond_2
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_4

    .line 899
    const-string/jumbo v4, "/"

    invoke-virtual {v6, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string/jumbo v4, "\\"

    invoke-virtual {v6, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 900
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 902
    :cond_3
    const/4 v5, 0x0

    const-string/jumbo v8, ""

    move-object/from16 v4, p0

    move-object/from16 v7, p3

    invoke-virtual/range {v4 .. v9}, Lorg/apache/tools/ant/taskdefs/Zip;->addParentDirs(Ljava/io/File;Ljava/lang/String;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V

    .line 905
    :cond_4
    const/16 v24, 0x0

    .line 907
    .local v24, "zf":Lorg/apache/tools/zip/ZipFile;
    const/16 v26, 0x0

    .line 908
    .local v26, "dealingWithFiles":Z
    const/4 v14, 0x0

    .line 910
    .local v14, "base":Ljava/io/File;
    if-eqz v32, :cond_5

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    move-object/from16 v0, v32

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getSrc(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v4

    if-nez v4, :cond_8

    .line 911
    :cond_5
    const/16 v26, 0x1

    .line 912
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v14

    .line 917
    :cond_6
    :goto_0
    const/16 v30, 0x0

    .local v30, "i":I
    :goto_1
    move-object/from16 v0, p2

    array-length v4, v0

    move/from16 v0, v30

    if-ge v0, v4, :cond_11

    .line 918
    const/4 v12, 0x0

    .line 919
    .local v12, "name":Ljava/lang/String;
    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_9

    .line 920
    move-object/from16 v12, v29

    .line 924
    :goto_2
    sget-char v4, Ljava/io/File;->separatorChar:C

    const/16 v5, 0x2f

    invoke-virtual {v12, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v12

    .line 926
    const-string/jumbo v4, ""

    invoke-virtual {v4, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 917
    :cond_7
    :goto_3
    add-int/lit8 v30, v30, 0x1

    goto :goto_1

    .line 913
    .end local v12    # "name":Ljava/lang/String;
    .end local v30    # "i":I
    :cond_8
    move-object/from16 v0, v32

    instance-of v4, v0, Lorg/apache/tools/ant/types/ZipFileSet;

    if-eqz v4, :cond_6

    .line 914
    new-instance v31, Lorg/apache/tools/zip/ZipFile;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    move-object/from16 v0, v32

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getSrc(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/Zip;->encoding:Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-direct {v0, v4, v5}, Lorg/apache/tools/zip/ZipFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .end local v24    # "zf":Lorg/apache/tools/zip/ZipFile;
    .local v31, "zf":Lorg/apache/tools/zip/ZipFile;
    move-object/from16 v24, v31

    .end local v31    # "zf":Lorg/apache/tools/zip/ZipFile;
    .restart local v24    # "zf":Lorg/apache/tools/zip/ZipFile;
    goto :goto_0

    .line 922
    .restart local v12    # "name":Ljava/lang/String;
    .restart local v30    # "i":I
    :cond_9
    aget-object v4, p2, v30

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v12

    goto :goto_2

    .line 930
    :cond_a
    aget-object v4, p2, v30

    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 931
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/apache/tools/ant/taskdefs/Zip;->doFilesonly:Z

    if-nez v4, :cond_7

    .line 934
    if-eqz v32, :cond_c

    invoke-virtual/range {v32 .. v32}, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasDirModeBeenSet()Z

    move-result v4

    if-eqz v4, :cond_c

    move/from16 v17, v9

    .line 936
    .local v17, "thisDirMode":I
    :goto_4
    aget-object v11, p2, v30

    move-object/from16 v10, p0

    move-object v13, v6

    move-object/from16 v15, p3

    move/from16 v16, v9

    invoke-direct/range {v10 .. v17}, Lorg/apache/tools/ant/taskdefs/Zip;->addDirectoryResource(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    .line 961
    .end local v12    # "name":Ljava/lang/String;
    .end local v17    # "thisDirMode":I
    .end local v30    # "i":I
    :catchall_0
    move-exception v4

    if-eqz v24, :cond_b

    .line 962
    invoke-virtual/range {v24 .. v24}, Lorg/apache/tools/zip/ZipFile;->close()V

    :cond_b
    throw v4

    .line 934
    .restart local v12    # "name":Ljava/lang/String;
    .restart local v30    # "i":I
    :cond_c
    :try_start_1
    aget-object v4, p2, v30

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-direct {v0, v4, v1, v9}, Lorg/apache/tools/ant/taskdefs/Zip;->getUnixMode(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/zip/ZipFile;I)I

    move-result v17

    goto :goto_4

    :cond_d
    move-object/from16 v18, p0

    move-object/from16 v19, v14

    move-object/from16 v20, v12

    move-object/from16 v21, p3

    move-object/from16 v22, v6

    move/from16 v23, v9

    .line 942
    invoke-virtual/range {v18 .. v23}, Lorg/apache/tools/ant/taskdefs/Zip;->addParentDirs(Ljava/io/File;Ljava/lang/String;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V

    .line 944
    if-eqz v26, :cond_e

    .line 945
    sget-object v4, Lorg/apache/tools/ant/taskdefs/Zip;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    aget-object v5, p2, v30

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v14, v5}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v27

    .line 947
    .local v27, "f":Ljava/io/File;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move-object/from16 v2, p3

    move/from16 v3, v28

    invoke-virtual {v0, v1, v2, v4, v3}, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile(Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V

    goto/16 :goto_3

    .line 949
    .end local v27    # "f":Ljava/io/File;
    :cond_e
    if-eqz v32, :cond_f

    invoke-virtual/range {v32 .. v32}, Lorg/apache/tools/ant/types/ArchiveFileSet;->hasFileModeBeenSet()Z

    move-result v4

    if-eqz v4, :cond_f

    move/from16 v23, v28

    .line 953
    .local v23, "thisFileMode":I
    :goto_5
    aget-object v19, p2, v30

    if-nez v32, :cond_10

    const/16 v25, 0x0

    :goto_6
    move-object/from16 v18, p0

    move-object/from16 v20, v12

    move-object/from16 v21, v6

    move-object/from16 v22, p3

    invoke-direct/range {v18 .. v25}, Lorg/apache/tools/ant/taskdefs/Zip;->addResource(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/zip/ZipOutputStream;ILorg/apache/tools/zip/ZipFile;Ljava/io/File;)V

    goto/16 :goto_3

    .line 949
    .end local v23    # "thisFileMode":I
    :cond_f
    aget-object v4, p2, v30

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    move/from16 v2, v28

    invoke-direct {v0, v4, v1, v2}, Lorg/apache/tools/ant/taskdefs/Zip;->getUnixMode(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/zip/ZipFile;I)I

    move-result v23

    goto :goto_5

    .line 953
    .restart local v23    # "thisFileMode":I
    :cond_10
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    move-object/from16 v0, v32

    invoke-virtual {v0, v4}, Lorg/apache/tools/ant/types/ArchiveFileSet;->getSrc(Lorg/apache/tools/ant/Project;)Ljava/io/File;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v25

    goto :goto_6

    .line 961
    .end local v12    # "name":Ljava/lang/String;
    .end local v23    # "thisFileMode":I
    :cond_11
    if-eqz v24, :cond_12

    .line 962
    invoke-virtual/range {v24 .. v24}, Lorg/apache/tools/zip/ZipFile;->close()V

    .line 965
    :cond_12
    return-void
.end method

.method protected final addResources(Lorg/apache/tools/ant/types/ResourceCollection;[Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/zip/ZipOutputStream;)V
    .locals 18
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;
    .param p2, "resources"    # [Lorg/apache/tools/ant/types/Resource;
    .param p3, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1066
    move-object/from16 v0, p1

    instance-of v2, v0, Lorg/apache/tools/ant/types/FileSet;

    if-eqz v2, :cond_1

    .line 1067
    check-cast p1, Lorg/apache/tools/ant/types/FileSet;

    .end local p1    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    invoke-virtual/range {p0 .. p3}, Lorg/apache/tools/ant/taskdefs/Zip;->addResources(Lorg/apache/tools/ant/types/FileSet;[Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/zip/ZipOutputStream;)V

    .line 1104
    :cond_0
    return-void

    .line 1070
    .restart local p1    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    :cond_1
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_0
    move-object/from16 v0, p2

    array-length v2, v0

    move/from16 v0, v17

    if-ge v0, v2, :cond_0

    .line 1071
    aget-object v2, p2, v17

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v2

    sget-char v3, Ljava/io/File;->separatorChar:C

    const/16 v5, 0x2f

    invoke-virtual {v2, v3, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    .line 1073
    .local v4, "name":Ljava/lang/String;
    const-string/jumbo v2, ""

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 1070
    :cond_2
    :goto_1
    add-int/lit8 v17, v17, 0x1

    goto :goto_0

    .line 1076
    :cond_3
    aget-object v2, p2, v17

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_4

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/taskdefs/Zip;->doFilesonly:Z

    if-nez v2, :cond_2

    .line 1079
    :cond_4
    const/4 v6, 0x0

    .line 1080
    .local v6, "base":Ljava/io/File;
    aget-object v3, p2, v17

    sget-object v2, Lorg/apache/tools/ant/taskdefs/Zip;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v2, :cond_6

    const-string/jumbo v2, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Zip;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lorg/apache/tools/ant/taskdefs/Zip;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 1081
    .local v16, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v16, :cond_5

    .line 1082
    invoke-static/range {v16 .. v16}, Lorg/apache/tools/ant/util/ResourceUtils;->asFileResource(Lorg/apache/tools/ant/types/resources/FileProvider;)Lorg/apache/tools/ant/types/resources/FileResource;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/resources/FileResource;->getBaseDir()Ljava/io/File;

    move-result-object v6

    .line 1085
    :cond_5
    aget-object v2, p2, v17

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1086
    aget-object v3, p2, v17

    const-string/jumbo v5, ""

    const/16 v8, 0x41ed

    const/16 v9, 0x41ed

    move-object/from16 v2, p0

    move-object/from16 v7, p3

    invoke-direct/range {v2 .. v9}, Lorg/apache/tools/ant/taskdefs/Zip;->addDirectoryResource(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;II)V

    goto :goto_1

    .line 1080
    .end local v16    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_6
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Zip;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_2

    .line 1091
    .restart local v16    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_7
    const-string/jumbo v9, ""

    const/16 v10, 0x41ed

    move-object/from16 v5, p0

    move-object v7, v4

    move-object/from16 v8, p3

    invoke-virtual/range {v5 .. v10}, Lorg/apache/tools/ant/taskdefs/Zip;->addParentDirs(Ljava/io/File;Ljava/lang/String;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V

    .line 1094
    if-eqz v16, :cond_8

    .line 1095
    invoke-interface/range {v16 .. v16}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v15

    .line 1096
    .local v15, "f":Ljava/io/File;
    const v2, 0x81a4

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v15, v1, v4, v2}, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile(Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V

    goto :goto_1

    .line 1098
    .end local v15    # "f":Ljava/io/File;
    :cond_8
    aget-object v8, p2, v17

    const-string/jumbo v10, ""

    const v12, 0x81a4

    const/4 v13, 0x0

    const/4 v14, 0x0

    move-object/from16 v7, p0

    move-object v9, v4

    move-object/from16 v11, p3

    invoke-direct/range {v7 .. v14}, Lorg/apache/tools/ant/taskdefs/Zip;->addResource(Lorg/apache/tools/ant/types/Resource;Ljava/lang/String;Ljava/lang/String;Lorg/apache/tools/zip/ZipOutputStream;ILorg/apache/tools/zip/ZipFile;Ljava/io/File;)V

    goto :goto_1
.end method

.method public addZipGroupFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 353
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->groupfilesets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 354
    return-void
.end method

.method public addZipfileset(Lorg/apache/tools/ant/types/ZipFileSet;)V
    .locals 0
    .param p1, "set"    # Lorg/apache/tools/ant/types/ZipFileSet;

    .prologue
    .line 336
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Zip;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 337
    return-void
.end method

.method protected cleanUp()V
    .locals 4

    .prologue
    .line 1951
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->addedDirs:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->clear()V

    .line 1952
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->addedFiles:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->removeAllElements()V

    .line 1953
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->entries:Ljava/util/Hashtable;

    invoke-virtual {v2}, Ljava/util/Hashtable;->clear()V

    .line 1954
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->addingNewFiles:Z

    .line 1955
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->savedDoUpdate:Z

    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    .line 1956
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->filesetsFromGroupfilesets:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 1957
    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1958
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/ZipFileSet;

    .line 1959
    .local v1, "zf":Lorg/apache/tools/ant/types/ZipFileSet;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->resources:Ljava/util/Vector;

    invoke-virtual {v2, v1}, Ljava/util/Vector;->removeElement(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1961
    .end local v1    # "zf":Lorg/apache/tools/ant/types/ZipFileSet;
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->filesetsFromGroupfilesets:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->removeAllElements()V

    .line 1962
    sget-object v2, Lorg/apache/tools/ant/taskdefs/Zip;->haveNonFileSetResourcesToAdd:Ljava/lang/ThreadLocal;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v3}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 1963
    return-void
.end method

.method protected createEmptyZip(Ljava/io/File;)Z
    .locals 8
    .param p1, "zipFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    const/4 v6, 0x1

    .line 1136
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/Zip;->skipWriting:Z

    if-nez v4, :cond_0

    .line 1137
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Note: creating empty "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Zip;->archiveType:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " archive "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v7}, Lorg/apache/tools/ant/taskdefs/Zip;->log(Ljava/lang/String;I)V

    .line 1140
    :cond_0
    const/4 v2, 0x0

    .line 1142
    .local v2, "os":Ljava/io/OutputStream;
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1145
    .end local v2    # "os":Ljava/io/OutputStream;
    .local v3, "os":Ljava/io/OutputStream;
    const/16 v4, 0x16

    :try_start_1
    new-array v0, v4, [B

    .line 1146
    .local v0, "empty":[B
    const/4 v4, 0x0

    const/16 v5, 0x50

    aput-byte v5, v0, v4

    .line 1147
    const/4 v4, 0x1

    const/16 v5, 0x4b

    aput-byte v5, v0, v4

    .line 1148
    const/4 v4, 0x2

    const/4 v5, 0x5

    aput-byte v5, v0, v4

    .line 1149
    const/4 v4, 0x3

    const/4 v5, 0x6

    aput-byte v5, v0, v4

    .line 1152
    invoke-virtual {v3, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1158
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 1160
    return v6

    .line 1153
    .end local v0    # "empty":[B
    .end local v3    # "os":Ljava/io/OutputStream;
    .restart local v2    # "os":Ljava/io/OutputStream;
    :catch_0
    move-exception v1

    .line 1154
    .local v1, "ioe":Ljava/io/IOException;
    :goto_0
    :try_start_2
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Could not create empty ZIP archive ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ")"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v6

    invoke-direct {v4, v5, v1, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1158
    .end local v1    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_1
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v4

    .end local v2    # "os":Ljava/io/OutputStream;
    .restart local v3    # "os":Ljava/io/OutputStream;
    :catchall_1
    move-exception v4

    move-object v2, v3

    .end local v3    # "os":Ljava/io/OutputStream;
    .restart local v2    # "os":Ljava/io/OutputStream;
    goto :goto_1

    .line 1153
    .end local v2    # "os":Ljava/io/OutputStream;
    .restart local v3    # "os":Ljava/io/OutputStream;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "os":Ljava/io/OutputStream;
    .restart local v2    # "os":Ljava/io/OutputStream;
    goto :goto_0
.end method

.method public execute()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 562
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doubleFilePass:Z

    if-eqz v0, :cond_0

    .line 563
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->skipWriting:Z

    .line 564
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->executeMain()V

    .line 565
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->skipWriting:Z

    .line 566
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->executeMain()V

    .line 570
    :goto_0
    return-void

    .line 568
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->executeMain()V

    goto :goto_0
.end method

.method public executeMain()V
    .locals 34
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 589
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->checkAttributesAndElements()V

    .line 592
    const/16 v23, 0x0

    .line 593
    .local v23, "renamedFile":Ljava/io/File;
    const/16 v31, 0x1

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/tools/ant/taskdefs/Zip;->addingNewFiles:Z

    .line 595
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->processDoUpdate()V

    .line 596
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->processGroupFilesets()V

    .line 599
    new-instance v28, Ljava/util/Vector;

    invoke-direct/range {v28 .. v28}, Ljava/util/Vector;-><init>()V

    .line 600
    .local v28, "vfss":Ljava/util/Vector;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->baseDir:Ljava/io/File;

    move-object/from16 v31, v0

    if-eqz v31, :cond_0

    .line 601
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getImplicitFileSet()Lorg/apache/tools/ant/types/FileSet;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Lorg/apache/tools/ant/types/FileSet;->clone()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/apache/tools/ant/types/FileSet;

    .line 602
    .local v13, "fs":Lorg/apache/tools/ant/types/FileSet;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->baseDir:Ljava/io/File;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 603
    move-object/from16 v0, v28

    invoke-virtual {v0, v13}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 605
    .end local v13    # "fs":Lorg/apache/tools/ant/types/FileSet;
    :cond_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->resources:Ljava/util/Vector;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/util/Vector;->size()I

    move-result v24

    .line 606
    .local v24, "size":I
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_0
    move/from16 v0, v24

    if-ge v15, v0, :cond_1

    .line 607
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->resources:Ljava/util/Vector;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    invoke-virtual {v0, v15}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lorg/apache/tools/ant/types/ResourceCollection;

    .line 608
    .local v22, "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    move-object/from16 v0, v28

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 606
    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 611
    .end local v22    # "rc":Lorg/apache/tools/ant/types/ResourceCollection;
    :cond_1
    invoke-virtual/range {v28 .. v28}, Ljava/util/Vector;->size()I

    move-result v31

    move/from16 v0, v31

    new-array v14, v0, [Lorg/apache/tools/ant/types/ResourceCollection;

    .line 612
    .local v14, "fss":[Lorg/apache/tools/ant/types/ResourceCollection;
    move-object/from16 v0, v28

    invoke-virtual {v0, v14}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 613
    const/16 v26, 0x0

    .line 616
    .local v26, "success":Z
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    move-object/from16 v31, v0

    const/16 v32, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move/from16 v2, v32

    invoke-virtual {v0, v14, v1, v2}, Lorg/apache/tools/ant/taskdefs/Zip;->getResourcesToAdd([Lorg/apache/tools/ant/types/ResourceCollection;Ljava/io/File;Z)Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    move-result-object v25

    .line 619
    .local v25, "state":Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;
    invoke-virtual/range {v25 .. v25}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->isOutOfDate()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v31

    if-nez v31, :cond_2

    .line 743
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->cleanUp()V

    .line 745
    :goto_1
    return-void

    .line 623
    :cond_2
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v20

    .line 624
    .local v20, "parent":Ljava/io/File;
    if-eqz v20, :cond_6

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->isDirectory()Z

    move-result v31

    if-nez v31, :cond_6

    invoke-virtual/range {v20 .. v20}, Ljava/io/File;->mkdirs()Z

    move-result v31

    if-nez v31, :cond_6

    .line 625
    new-instance v31, Lorg/apache/tools/ant/BuildException;

    new-instance v32, Ljava/lang/StringBuffer;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v33, "Failed to create missing parent directory for "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v32

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    move-object/from16 v33, v0

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-direct/range {v31 .. v32}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v31
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 722
    .end local v20    # "parent":Ljava/io/File;
    .end local v25    # "state":Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;
    :catch_0
    move-exception v16

    .line 723
    .local v16, "ioe":Ljava/io/IOException;
    :try_start_2
    new-instance v31, Ljava/lang/StringBuffer;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v32, "Problem creating "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->archiveType:Ljava/lang/String;

    move-object/from16 v32, v0

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    const-string/jumbo v32, ": "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    invoke-virtual/range {v16 .. v16}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    .line 727
    .local v17, "msg":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    move/from16 v31, v0

    if-eqz v31, :cond_3

    if-eqz v23, :cond_4

    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/io/File;->delete()Z

    move-result v31

    if-nez v31, :cond_4

    .line 728
    new-instance v31, Ljava/lang/StringBuffer;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v31

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    const-string/jumbo v32, " (and the archive is probably corrupt but I could not delete it)"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v17

    .line 732
    :cond_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    move/from16 v31, v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v31, :cond_5

    if-eqz v23, :cond_5

    .line 734
    :try_start_3
    sget-object v31, Lorg/apache/tools/ant/taskdefs/Zip;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    move-object/from16 v32, v0

    move-object/from16 v0, v31

    move-object/from16 v1, v23

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 741
    :cond_5
    :goto_2
    :try_start_4
    new-instance v31, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v32

    move-object/from16 v0, v31

    move-object/from16 v1, v17

    move-object/from16 v2, v16

    move-object/from16 v3, v32

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v31
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 743
    .end local v16    # "ioe":Ljava/io/IOException;
    .end local v17    # "msg":Ljava/lang/String;
    :catchall_0
    move-exception v31

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->cleanUp()V

    throw v31

    .line 629
    .restart local v20    # "parent":Ljava/io/File;
    .restart local v25    # "state":Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;
    :cond_6
    const/16 v31, 0x1

    :try_start_5
    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/tools/ant/taskdefs/Zip;->updatedFile:Z

    .line 630
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/io/File;->exists()Z

    move-result v31

    if-nez v31, :cond_7

    invoke-virtual/range {v25 .. v25}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->isWithoutAnyResources()Z

    move-result v31

    if-eqz v31, :cond_7

    .line 631
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Zip;->createEmptyZip(Ljava/io/File;)Z
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 743
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->cleanUp()V

    goto/16 :goto_1

    .line 634
    :cond_7
    :try_start_6
    invoke-virtual/range {v25 .. v25}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->getResourcesToAdd()[[Lorg/apache/tools/ant/types/Resource;

    move-result-object v7

    .line 636
    .local v7, "addThem":[[Lorg/apache/tools/ant/types/Resource;
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    move/from16 v31, v0

    if-eqz v31, :cond_8

    .line 637
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->renameFile()Ljava/io/File;

    move-result-object v23

    .line 640
    :cond_8
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    move/from16 v31, v0

    if-eqz v31, :cond_c

    const-string/jumbo v5, "Updating "

    .line 642
    .local v5, "action":Ljava/lang/String;
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->skipWriting:Z

    move/from16 v31, v0

    if-nez v31, :cond_9

    .line 643
    new-instance v31, Ljava/lang/StringBuffer;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v31

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->archiveType:Ljava/lang/String;

    move-object/from16 v32, v0

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    const-string/jumbo v32, ": "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    move-object/from16 v32, v0

    invoke-virtual/range {v32 .. v32}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Zip;->log(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 646
    :cond_9
    const/16 v29, 0x0

    .line 648
    .local v29, "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    :try_start_7
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->skipWriting:Z

    move/from16 v31, v0

    if-nez v31, :cond_a

    .line 649
    new-instance v30, Lorg/apache/tools/zip/ZipOutputStream;

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    move-object/from16 v31, v0

    invoke-direct/range {v30 .. v31}, Lorg/apache/tools/zip/ZipOutputStream;-><init>(Ljava/io/File;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 651
    .end local v29    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    .local v30, "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->encoding:Ljava/lang/String;

    move-object/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Lorg/apache/tools/zip/ZipOutputStream;->setEncoding(Ljava/lang/String;)V

    .line 652
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->useLanguageEncodingFlag:Z

    move/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Lorg/apache/tools/zip/ZipOutputStream;->setUseLanguageEncodingFlag(Z)V

    .line 653
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->createUnicodeExtraFields:Lorg/apache/tools/ant/taskdefs/Zip$UnicodeExtraField;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lorg/apache/tools/ant/taskdefs/Zip$UnicodeExtraField;->getPolicy()Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Lorg/apache/tools/zip/ZipOutputStream;->setCreateUnicodeExtraFields(Lorg/apache/tools/zip/ZipOutputStream$UnicodeExtraFieldPolicy;)V

    .line 655
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->fallBackToUTF8:Z

    move/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Lorg/apache/tools/zip/ZipOutputStream;->setFallbackToUTF8(Z)V

    .line 656
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->doCompress:Z

    move/from16 v31, v0

    if-eqz v31, :cond_d

    const/16 v31, 0x8

    :goto_4
    invoke-virtual/range {v30 .. v31}, Lorg/apache/tools/zip/ZipOutputStream;->setMethod(I)V

    .line 658
    move-object/from16 v0, p0

    iget v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->level:I

    move/from16 v31, v0

    invoke-virtual/range {v30 .. v31}, Lorg/apache/tools/zip/ZipOutputStream;->setLevel(I)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    move-object/from16 v29, v30

    .line 660
    .end local v30    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    .restart local v29    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    :cond_a
    :try_start_9
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Zip;->initZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V

    .line 663
    const/4 v15, 0x0

    :goto_5
    array-length v0, v14

    move/from16 v31, v0

    move/from16 v0, v31

    if-ge v15, v0, :cond_e

    .line 664
    aget-object v31, v7, v15

    move-object/from16 v0, v31

    array-length v0, v0

    move/from16 v31, v0

    if-eqz v31, :cond_b

    .line 665
    aget-object v31, v14, v15

    aget-object v32, v7, v15

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move-object/from16 v2, v32

    move-object/from16 v3, v29

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/tools/ant/taskdefs/Zip;->addResources(Lorg/apache/tools/ant/types/ResourceCollection;[Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/zip/ZipOutputStream;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 663
    :cond_b
    add-int/lit8 v15, v15, 0x1

    goto :goto_5

    .line 640
    .end local v5    # "action":Ljava/lang/String;
    .end local v29    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    :cond_c
    :try_start_a
    const-string/jumbo v5, "Building "
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto/16 :goto_3

    .line 656
    .restart local v5    # "action":Ljava/lang/String;
    .restart local v30    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    :cond_d
    const/16 v31, 0x0

    goto :goto_4

    .line 669
    .end local v30    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    .restart local v29    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    :cond_e
    :try_start_b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    move/from16 v31, v0

    if-eqz v31, :cond_13

    .line 670
    const/16 v31, 0x0

    move/from16 v0, v31

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lorg/apache/tools/ant/taskdefs/Zip;->addingNewFiles:Z

    .line 671
    new-instance v19, Lorg/apache/tools/ant/types/ZipFileSet;

    invoke-direct/range {v19 .. v19}, Lorg/apache/tools/ant/types/ZipFileSet;-><init>()V

    .line 672
    .local v19, "oldFiles":Lorg/apache/tools/ant/types/ZipFileSet;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v31

    move-object/from16 v0, v19

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ZipFileSet;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 673
    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ZipFileSet;->setSrc(Ljava/io/File;)V

    .line 674
    const/16 v31, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ZipFileSet;->setDefaultexcludes(Z)V

    .line 676
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->addedFiles:Ljava/util/Vector;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Ljava/util/Vector;->size()I

    move-result v6

    .line 677
    .local v6, "addSize":I
    const/4 v15, 0x0

    :goto_6
    if-ge v15, v6, :cond_f

    .line 678
    invoke-virtual/range {v19 .. v19}, Lorg/apache/tools/ant/types/ZipFileSet;->createExclude()Lorg/apache/tools/ant/types/PatternSet$NameEntry;

    move-result-object v18

    .line 679
    .local v18, "ne":Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->addedFiles:Ljava/util/Vector;

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    invoke-virtual {v0, v15}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v31

    check-cast v31, Ljava/lang/String;

    move-object/from16 v0, v18

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/PatternSet$NameEntry;->setName(Ljava/lang/String;)V

    .line 677
    add-int/lit8 v15, v15, 0x1

    goto :goto_6

    .line 681
    .end local v18    # "ne":Lorg/apache/tools/ant/types/PatternSet$NameEntry;
    :cond_f
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v31

    move-object/from16 v0, v19

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ZipFileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v10

    .line 683
    .local v10, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    move-object v0, v10

    check-cast v0, Lorg/apache/tools/ant/types/ZipScanner;

    move-object/from16 v31, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->encoding:Ljava/lang/String;

    move-object/from16 v32, v0

    invoke-virtual/range {v31 .. v32}, Lorg/apache/tools/ant/types/ZipScanner;->setEncoding(Ljava/lang/String;)V

    .line 685
    invoke-virtual {v10}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v12

    .line 686
    .local v12, "f":[Ljava/lang/String;
    array-length v0, v12

    move/from16 v31, v0

    move/from16 v0, v31

    new-array v0, v0, [Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v21, v0

    .line 687
    .local v21, "r":[Lorg/apache/tools/ant/types/Resource;
    const/4 v15, 0x0

    :goto_7
    array-length v0, v12

    move/from16 v31, v0

    move/from16 v0, v31

    if-ge v15, v0, :cond_10

    .line 688
    aget-object v31, v12, v15

    move-object/from16 v0, v31

    invoke-virtual {v10, v0}, Lorg/apache/tools/ant/DirectoryScanner;->getResource(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v31

    aput-object v31, v21, v15

    .line 687
    add-int/lit8 v15, v15, 0x1

    goto :goto_7

    .line 691
    :cond_10
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->doFilesonly:Z

    move/from16 v31, v0

    if-nez v31, :cond_12

    .line 692
    invoke-virtual {v10}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v8

    .line 693
    .local v8, "d":[Ljava/lang/String;
    array-length v0, v8

    move/from16 v31, v0

    move/from16 v0, v31

    new-array v9, v0, [Lorg/apache/tools/ant/types/Resource;

    .line 694
    .local v9, "dr":[Lorg/apache/tools/ant/types/Resource;
    const/4 v15, 0x0

    :goto_8
    array-length v0, v8

    move/from16 v31, v0

    move/from16 v0, v31

    if-ge v15, v0, :cond_11

    .line 695
    aget-object v31, v8, v15

    move-object/from16 v0, v31

    invoke-virtual {v10, v0}, Lorg/apache/tools/ant/DirectoryScanner;->getResource(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v31

    aput-object v31, v9, v15

    .line 694
    add-int/lit8 v15, v15, 0x1

    goto :goto_8

    .line 697
    :cond_11
    move-object/from16 v27, v21

    .line 698
    .local v27, "tmp":[Lorg/apache/tools/ant/types/Resource;
    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v31, v0

    array-length v0, v9

    move/from16 v32, v0

    add-int v31, v31, v32

    move/from16 v0, v31

    new-array v0, v0, [Lorg/apache/tools/ant/types/Resource;

    move-object/from16 v21, v0

    .line 699
    const/16 v31, 0x0

    const/16 v32, 0x0

    array-length v0, v9

    move/from16 v33, v0

    move/from16 v0, v31

    move-object/from16 v1, v21

    move/from16 v2, v32

    move/from16 v3, v33

    invoke-static {v9, v0, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 700
    const/16 v31, 0x0

    array-length v0, v9

    move/from16 v32, v0

    move-object/from16 v0, v27

    array-length v0, v0

    move/from16 v33, v0

    move-object/from16 v0, v27

    move/from16 v1, v31

    move-object/from16 v2, v21

    move/from16 v3, v32

    move/from16 v4, v33

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 702
    .end local v8    # "d":[Ljava/lang/String;
    .end local v9    # "dr":[Lorg/apache/tools/ant/types/Resource;
    .end local v27    # "tmp":[Lorg/apache/tools/ant/types/Resource;
    :cond_12
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v21

    move-object/from16 v3, v29

    invoke-virtual {v0, v1, v2, v3}, Lorg/apache/tools/ant/taskdefs/Zip;->addResources(Lorg/apache/tools/ant/types/FileSet;[Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/zip/ZipOutputStream;)V

    .line 704
    .end local v6    # "addSize":I
    .end local v10    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v12    # "f":[Ljava/lang/String;
    .end local v19    # "oldFiles":Lorg/apache/tools/ant/types/ZipFileSet;
    .end local v21    # "r":[Lorg/apache/tools/ant/types/Resource;
    :cond_13
    if-eqz v29, :cond_14

    .line 705
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->comment:Ljava/lang/String;

    move-object/from16 v31, v0

    move-object/from16 v0, v29

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Lorg/apache/tools/zip/ZipOutputStream;->setComment(Ljava/lang/String;)V

    .line 707
    :cond_14
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Zip;->finalizeZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V

    .line 711
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    move/from16 v31, v0

    if-eqz v31, :cond_15

    .line 712
    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->delete()Z

    move-result v31

    if-nez v31, :cond_15

    .line 713
    new-instance v31, Ljava/lang/StringBuffer;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v32, "Warning: unable to delete temporary file "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v31

    const/16 v32, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Zip;->log(Ljava/lang/String;I)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    .line 717
    :cond_15
    const/16 v26, 0x1

    .line 720
    :try_start_c
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Zip;->closeZout(Lorg/apache/tools/zip/ZipOutputStream;Z)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 743
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/Zip;->cleanUp()V

    goto/16 :goto_1

    .line 720
    :catchall_1
    move-exception v31

    :goto_9
    :try_start_d
    move-object/from16 v0, p0

    move-object/from16 v1, v29

    move/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Zip;->closeZout(Lorg/apache/tools/zip/ZipOutputStream;Z)V

    throw v31
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 735
    .end local v5    # "action":Ljava/lang/String;
    .end local v7    # "addThem":[[Lorg/apache/tools/ant/types/Resource;
    .end local v20    # "parent":Ljava/io/File;
    .end local v25    # "state":Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;
    .end local v29    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    .restart local v16    # "ioe":Ljava/io/IOException;
    .restart local v17    # "msg":Ljava/lang/String;
    :catch_1
    move-exception v11

    .line 736
    .local v11, "e":Ljava/io/IOException;
    :try_start_e
    new-instance v31, Ljava/lang/StringBuffer;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, v31

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    const-string/jumbo v32, " (and I couldn\'t rename the temporary file "

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v32

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    const-string/jumbo v32, " back)"

    invoke-virtual/range {v31 .. v32}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    move-result-object v17

    goto/16 :goto_2

    .line 720
    .end local v11    # "e":Ljava/io/IOException;
    .end local v16    # "ioe":Ljava/io/IOException;
    .end local v17    # "msg":Ljava/lang/String;
    .restart local v5    # "action":Ljava/lang/String;
    .restart local v7    # "addThem":[[Lorg/apache/tools/ant/types/Resource;
    .restart local v20    # "parent":Ljava/io/File;
    .restart local v25    # "state":Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;
    .restart local v30    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    :catchall_2
    move-exception v31

    move-object/from16 v29, v30

    .end local v30    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    .restart local v29    # "zOut":Lorg/apache/tools/zip/ZipOutputStream;
    goto :goto_9
.end method

.method protected finalizeZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V
    .locals 0
    .param p1, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1124
    return-void
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 446
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public getCreateUnicodeExtraFields()Lorg/apache/tools/ant/taskdefs/Zip$UnicodeExtraField;
    .locals 1

    .prologue
    .line 531
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->createUnicodeExtraFields:Lorg/apache/tools/ant/taskdefs/Zip$UnicodeExtraField;

    return-object v0
.end method

.method protected final getCurrentExtraFields()[Lorg/apache/tools/zip/ZipExtraField;
    .locals 1

    .prologue
    .line 1719
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Zip;->currentZipExtra:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/tools/zip/ZipExtraField;

    return-object v0
.end method

.method public getDestFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 265
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    return-object v0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 415
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public getFallBackToUTF8()Z
    .locals 1

    .prologue
    .line 553
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->fallBackToUTF8:Z

    return v0
.end method

.method public getLevel()I
    .locals 1

    .prologue
    .line 465
    iget v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->level:I

    return v0
.end method

.method protected getNonFileSetResourcesToAdd([Lorg/apache/tools/ant/types/ResourceCollection;Ljava/io/File;Z)Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;
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
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 1454
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Zip;->grabNonFileSetResources([Lorg/apache/tools/ant/types/ResourceCollection;)[[Lorg/apache/tools/ant/types/Resource;

    move-result-object v3

    .line 1455
    .local v3, "initialResources":[[Lorg/apache/tools/ant/types/Resource;
    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/Zip;->isEmpty([[Lorg/apache/tools/ant/types/Resource;)Z

    move-result v0

    .line 1456
    .local v0, "empty":Z
    sget-object v9, Lorg/apache/tools/ant/taskdefs/Zip;->haveNonFileSetResourcesToAdd:Ljava/lang/ThreadLocal;

    if-nez v0, :cond_0

    move v6, v7

    :goto_0
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 1457
    if-eqz v0, :cond_1

    .line 1460
    new-instance v6, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    invoke-direct {v6, p3, v3}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    .line 1507
    :goto_1
    return-object v6

    :cond_0
    move v6, v8

    .line 1456
    goto :goto_0

    .line 1465
    :cond_1
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_2

    .line 1466
    new-instance v6, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    invoke-direct {v6, v7, v3}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    goto :goto_1

    .line 1469
    :cond_2
    if-eqz p3, :cond_3

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    if-nez v6, :cond_3

    .line 1471
    new-instance v6, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    invoke-direct {v6, v7, v3}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    goto :goto_1

    .line 1474
    :cond_3
    array-length v6, p1

    new-array v5, v6, [[Lorg/apache/tools/ant/types/Resource;

    .line 1476
    .local v5, "newerResources":[[Lorg/apache/tools/ant/types/Resource;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    array-length v6, p1

    if-ge v2, v6, :cond_a

    .line 1477
    aget-object v6, v3, v2

    array-length v6, v6

    if-nez v6, :cond_5

    .line 1478
    new-array v6, v8, [Lorg/apache/tools/ant/types/Resource;

    aput-object v6, v5, v2

    .line 1476
    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 1482
    :cond_5
    const/4 v4, 0x0

    .local v4, "j":I
    :goto_3
    aget-object v6, v3, v2

    array-length v6, v6

    if-ge v4, v6, :cond_8

    .line 1483
    aget-object v6, v3, v2

    aget-object v9, v6, v4

    sget-object v6, Lorg/apache/tools/ant/taskdefs/Zip;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v6, :cond_6

    const-string/jumbo v6, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/Zip;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/tools/ant/taskdefs/Zip;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_4
    invoke-virtual {v9, v6}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 1485
    .local v1, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v1, :cond_7

    invoke-interface {v1}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 1486
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v7, "A zip file cannot include itself"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v8

    invoke-direct {v6, v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v6

    .line 1483
    .end local v1    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_6
    sget-object v6, Lorg/apache/tools/ant/taskdefs/Zip;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_4

    .line 1482
    .restart local v1    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 1491
    .end local v1    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_8
    aget-object v6, v3, v2

    new-instance v9, Lorg/apache/tools/ant/util/IdentityMapper;

    invoke-direct {v9}, Lorg/apache/tools/ant/util/IdentityMapper;-><init>()V

    invoke-direct {p0, v6, v9}, Lorg/apache/tools/ant/taskdefs/Zip;->selectOutOfDateResources([Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;)[Lorg/apache/tools/ant/types/Resource;

    move-result-object v6

    aput-object v6, v5, v2

    .line 1493
    if-nez p3, :cond_9

    aget-object v6, v5, v2

    array-length v6, v6

    if-lez v6, :cond_b

    :cond_9
    move p3, v7

    .line 1495
    :goto_5
    if-eqz p3, :cond_4

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    if-nez v6, :cond_4

    .line 1502
    .end local v4    # "j":I
    :cond_a
    if-eqz p3, :cond_c

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    if-nez v6, :cond_c

    .line 1504
    new-instance v6, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    invoke-direct {v6, v7, v3}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    goto/16 :goto_1

    .restart local v4    # "j":I
    :cond_b
    move p3, v8

    .line 1493
    goto :goto_5

    .line 1507
    .end local v4    # "j":I
    :cond_c
    new-instance v6, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    invoke-direct {v6, p3, v5}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    goto/16 :goto_1
.end method

.method public getPreserve0Permissions()Z
    .locals 1

    .prologue
    .line 499
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->preserve0Permissions:Z

    return v0
.end method

.method protected getResourcesToAdd([Lorg/apache/tools/ant/types/FileSet;Ljava/io/File;Z)Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;
    .locals 15
    .param p1, "filesets"    # [Lorg/apache/tools/ant/types/FileSet;
    .param p2, "zipFile"    # Ljava/io/File;
    .param p3, "needsUpdate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1289
    invoke-virtual/range {p0 .. p1}, Lorg/apache/tools/ant/taskdefs/Zip;->grabResources([Lorg/apache/tools/ant/types/FileSet;)[[Lorg/apache/tools/ant/types/Resource;

    move-result-object v5

    .line 1290
    .local v5, "initialResources":[[Lorg/apache/tools/ant/types/Resource;
    invoke-static {v5}, Lorg/apache/tools/ant/taskdefs/Zip;->isEmpty([[Lorg/apache/tools/ant/types/Resource;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 1291
    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    sget-object v13, Lorg/apache/tools/ant/taskdefs/Zip;->haveNonFileSetResourcesToAdd:Ljava/lang/ThreadLocal;

    invoke-virtual {v13}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 1292
    if-eqz p3, :cond_0

    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    if-eqz v12, :cond_0

    .line 1311
    new-instance v12, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    const/4 v13, 0x1

    invoke-direct {v12, v13, v5}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    .line 1420
    :goto_0
    return-object v12

    .line 1314
    :cond_0
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Zip;->emptyBehavior:Ljava/lang/String;

    const-string/jumbo v13, "skip"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 1315
    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    if-eqz v12, :cond_2

    .line 1316
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Zip;->archiveType:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " archive "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " not updated because no new files were"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " included."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x3

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/Zip;->logWhenWriting(Ljava/lang/String;I)V

    .line 1340
    :cond_1
    :goto_1
    new-instance v12, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    move/from16 v0, p3

    invoke-direct {v12, v0, v5}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    goto :goto_0

    .line 1320
    :cond_2
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v13, "Warning: skipping "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/Zip;->archiveType:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " archive "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, " because no files were included."

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    invoke-virtual {p0, v12, v13}, Lorg/apache/tools/ant/taskdefs/Zip;->logWhenWriting(Ljava/lang/String;I)V

    goto :goto_1

    .line 1325
    :cond_3
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Zip;->emptyBehavior:Ljava/lang/String;

    const-string/jumbo v13, "fail"

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 1326
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v14, "Cannot create "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    iget-object v14, p0, Lorg/apache/tools/ant/taskdefs/Zip;->archiveType:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, " archive "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string/jumbo v14, ": no files were included."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v12

    .line 1332
    :cond_4
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_1

    .line 1333
    const/16 p3, 0x1

    goto :goto_1

    .line 1345
    :cond_5
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->exists()Z

    move-result v12

    if-nez v12, :cond_6

    .line 1346
    new-instance v12, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    const/4 v13, 0x1

    invoke-direct {v12, v13, v5}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    goto/16 :goto_0

    .line 1349
    :cond_6
    if-eqz p3, :cond_7

    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    if-nez v12, :cond_7

    .line 1351
    new-instance v12, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    const/4 v13, 0x1

    invoke-direct {v12, v13, v5}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    goto/16 :goto_0

    .line 1354
    :cond_7
    move-object/from16 v0, p1

    array-length v12, v0

    new-array v8, v12, [[Lorg/apache/tools/ant/types/Resource;

    .line 1356
    .local v8, "newerResources":[[Lorg/apache/tools/ant/types/Resource;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_2
    move-object/from16 v0, p1

    array-length v12, v0

    if-ge v4, v12, :cond_b

    .line 1357
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Zip;->fileset:Lorg/apache/tools/ant/types/FileSet;

    instance-of v12, v12, Lorg/apache/tools/ant/types/ZipFileSet;

    if-eqz v12, :cond_8

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/Zip;->fileset:Lorg/apache/tools/ant/types/FileSet;

    check-cast v12, Lorg/apache/tools/ant/types/ZipFileSet;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/ZipFileSet;->getSrc(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v12

    if-nez v12, :cond_a

    .line 1359
    :cond_8
    aget-object v12, p1, v4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v1

    .line 1361
    .local v1, "base":Ljava/io/File;
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_3
    aget-object v12, v5, v4

    array-length v12, v12

    if-ge v6, v12, :cond_a

    .line 1362
    sget-object v12, Lorg/apache/tools/ant/taskdefs/Zip;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    aget-object v13, v5, v4

    aget-object v13, v13, v6

    invoke-virtual {v13}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v1, v13}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    .line 1365
    .local v10, "resourceAsFile":Ljava/io/File;
    move-object/from16 v0, p2

    invoke-virtual {v10, v0}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_9

    .line 1366
    new-instance v12, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v13, "A zip file cannot include itself"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v14

    invoke-direct {v12, v13, v14}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v12

    .line 1361
    :cond_9
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 1356
    .end local v1    # "base":Ljava/io/File;
    .end local v6    # "j":I
    .end local v10    # "resourceAsFile":Ljava/io/File;
    :cond_a
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 1373
    :cond_b
    const/4 v4, 0x0

    :goto_4
    move-object/from16 v0, p1

    array-length v12, v0

    if-ge v4, v12, :cond_10

    .line 1374
    aget-object v12, v5, v4

    array-length v12, v12

    if-nez v12, :cond_d

    .line 1375
    const/4 v12, 0x0

    new-array v12, v12, [Lorg/apache/tools/ant/types/Resource;

    aput-object v12, v8, v4

    .line 1373
    :cond_c
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    .line 1379
    :cond_d
    new-instance v7, Lorg/apache/tools/ant/util/IdentityMapper;

    invoke-direct {v7}, Lorg/apache/tools/ant/util/IdentityMapper;-><init>()V

    .line 1380
    .local v7, "myMapper":Lorg/apache/tools/ant/util/FileNameMapper;
    aget-object v12, p1, v4

    instance-of v12, v12, Lorg/apache/tools/ant/types/ZipFileSet;

    if-eqz v12, :cond_e

    .line 1381
    aget-object v11, p1, v4

    check-cast v11, Lorg/apache/tools/ant/types/ZipFileSet;

    .line 1382
    .local v11, "zfs":Lorg/apache/tools/ant/types/ZipFileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/ZipFileSet;->getFullpath(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_11

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/ZipFileSet;->getFullpath(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v12

    const-string/jumbo v13, ""

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_11

    .line 1387
    new-instance v2, Lorg/apache/tools/ant/util/MergingMapper;

    invoke-direct {v2}, Lorg/apache/tools/ant/util/MergingMapper;-><init>()V

    .line 1388
    .local v2, "fm":Lorg/apache/tools/ant/util/MergingMapper;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/ZipFileSet;->getFullpath(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v2, v12}, Lorg/apache/tools/ant/util/MergingMapper;->setTo(Ljava/lang/String;)V

    .line 1389
    move-object v7, v2

    .line 1404
    .end local v2    # "fm":Lorg/apache/tools/ant/util/MergingMapper;
    .end local v11    # "zfs":Lorg/apache/tools/ant/types/ZipFileSet;
    :cond_e
    :goto_5
    aget-object v12, v5, v4

    invoke-direct {p0, v12, v7}, Lorg/apache/tools/ant/taskdefs/Zip;->selectOutOfDateResources([Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/util/FileNameMapper;)[Lorg/apache/tools/ant/types/Resource;

    move-result-object v12

    aput-object v12, v8, v4

    .line 1406
    if-nez p3, :cond_f

    aget-object v12, v8, v4

    array-length v12, v12

    if-lez v12, :cond_13

    :cond_f
    const/16 p3, 0x1

    .line 1408
    :goto_6
    if-eqz p3, :cond_c

    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    if-nez v12, :cond_c

    .line 1415
    .end local v7    # "myMapper":Lorg/apache/tools/ant/util/FileNameMapper;
    :cond_10
    if-eqz p3, :cond_14

    iget-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    if-nez v12, :cond_14

    .line 1417
    new-instance v12, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    const/4 v13, 0x1

    invoke-direct {v12, v13, v5}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    goto/16 :goto_0

    .line 1391
    .restart local v7    # "myMapper":Lorg/apache/tools/ant/util/FileNameMapper;
    .restart local v11    # "zfs":Lorg/apache/tools/ant/types/ZipFileSet;
    :cond_11
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/ZipFileSet;->getPrefix(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_e

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/ZipFileSet;->getPrefix(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v12

    const-string/jumbo v13, ""

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_e

    .line 1393
    new-instance v3, Lorg/apache/tools/ant/util/GlobPatternMapper;

    invoke-direct {v3}, Lorg/apache/tools/ant/util/GlobPatternMapper;-><init>()V

    .line 1394
    .local v3, "gm":Lorg/apache/tools/ant/util/GlobPatternMapper;
    const-string/jumbo v12, "*"

    invoke-virtual {v3, v12}, Lorg/apache/tools/ant/util/GlobPatternMapper;->setFrom(Ljava/lang/String;)V

    .line 1395
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/types/ZipFileSet;->getPrefix(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v9

    .line 1396
    .local v9, "prefix":Ljava/lang/String;
    const-string/jumbo v12, "/"

    invoke-virtual {v9, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_12

    const-string/jumbo v12, "\\"

    invoke-virtual {v9, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_12

    .line 1397
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    .line 1399
    :cond_12
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    const-string/jumbo v13, "*"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3, v12}, Lorg/apache/tools/ant/util/GlobPatternMapper;->setTo(Ljava/lang/String;)V

    .line 1400
    move-object v7, v3

    goto/16 :goto_5

    .line 1406
    .end local v3    # "gm":Lorg/apache/tools/ant/util/GlobPatternMapper;
    .end local v9    # "prefix":Ljava/lang/String;
    .end local v11    # "zfs":Lorg/apache/tools/ant/types/ZipFileSet;
    :cond_13
    const/16 p3, 0x0

    goto/16 :goto_6

    .line 1420
    .end local v7    # "myMapper":Lorg/apache/tools/ant/util/FileNameMapper;
    :cond_14
    new-instance v12, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    move/from16 v0, p3

    invoke-direct {v12, v0, v8}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    goto/16 :goto_0
.end method

.method protected getResourcesToAdd([Lorg/apache/tools/ant/types/ResourceCollection;Ljava/io/File;Z)Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;
    .locals 17
    .param p1, "rcs"    # [Lorg/apache/tools/ant/types/ResourceCollection;
    .param p2, "zipFile"    # Ljava/io/File;
    .param p3, "needsUpdate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1207
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1208
    .local v5, "filesets":Ljava/util/ArrayList;
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 1209
    .local v11, "rest":Ljava/util/ArrayList;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    move-object/from16 v0, p1

    array-length v15, v0

    if-ge v9, v15, :cond_1

    .line 1210
    aget-object v15, p1, v9

    instance-of v15, v15, Lorg/apache/tools/ant/types/FileSet;

    if-eqz v15, :cond_0

    .line 1211
    aget-object v15, p1, v9

    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1209
    :goto_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 1213
    :cond_0
    aget-object v15, p1, v9

    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1216
    :cond_1
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v15

    new-array v15, v15, [Lorg/apache/tools/ant/types/ResourceCollection;

    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v10

    check-cast v10, [Lorg/apache/tools/ant/types/ResourceCollection;

    .line 1218
    .local v10, "rc":[Lorg/apache/tools/ant/types/ResourceCollection;
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    invoke-virtual {v0, v10, v1, v2}, Lorg/apache/tools/ant/taskdefs/Zip;->getNonFileSetResourcesToAdd([Lorg/apache/tools/ant/types/ResourceCollection;Ljava/io/File;Z)Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    move-result-object v3

    .line 1221
    .local v3, "as":Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v15

    new-array v15, v15, [Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Lorg/apache/tools/ant/types/FileSet;

    .line 1223
    .local v6, "fs":[Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->isOutOfDate()Z

    move-result v15

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v6, v1, v15}, Lorg/apache/tools/ant/taskdefs/Zip;->getResourcesToAdd([Lorg/apache/tools/ant/types/FileSet;Ljava/io/File;Z)Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    move-result-object v4

    .line 1224
    .local v4, "as2":Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->isOutOfDate()Z

    move-result v15

    if-nez v15, :cond_2

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->isOutOfDate()Z

    move-result v15

    if-eqz v15, :cond_2

    .line 1233
    const/4 v15, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v10, v1, v15}, Lorg/apache/tools/ant/taskdefs/Zip;->getNonFileSetResourcesToAdd([Lorg/apache/tools/ant/types/ResourceCollection;Ljava/io/File;Z)Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    move-result-object v3

    .line 1236
    :cond_2
    move-object/from16 v0, p1

    array-length v15, v0

    new-array v14, v15, [[Lorg/apache/tools/ant/types/Resource;

    .line 1237
    .local v14, "toAdd":[[Lorg/apache/tools/ant/types/Resource;
    const/4 v7, 0x0

    .line 1238
    .local v7, "fsIndex":I
    const/4 v12, 0x0

    .line 1239
    .local v12, "restIndex":I
    const/4 v9, 0x0

    :goto_2
    move-object/from16 v0, p1

    array-length v15, v0

    if-ge v9, v15, :cond_4

    .line 1240
    aget-object v15, p1, v9

    instance-of v15, v15, Lorg/apache/tools/ant/types/FileSet;

    if-eqz v15, :cond_3

    .line 1241
    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->getResourcesToAdd()[[Lorg/apache/tools/ant/types/Resource;

    move-result-object v15

    add-int/lit8 v8, v7, 0x1

    .end local v7    # "fsIndex":I
    .local v8, "fsIndex":I
    aget-object v15, v15, v7

    aput-object v15, v14, v9

    move v7, v8

    .line 1239
    .end local v8    # "fsIndex":I
    .restart local v7    # "fsIndex":I
    :goto_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 1243
    :cond_3
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->getResourcesToAdd()[[Lorg/apache/tools/ant/types/Resource;

    move-result-object v15

    add-int/lit8 v13, v12, 0x1

    .end local v12    # "restIndex":I
    .local v13, "restIndex":I
    aget-object v15, v15, v12

    aput-object v15, v14, v9

    move v12, v13

    .end local v13    # "restIndex":I
    .restart local v12    # "restIndex":I
    goto :goto_3

    .line 1246
    :cond_4
    new-instance v15, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;->isOutOfDate()Z

    move-result v16

    move/from16 v0, v16

    invoke-direct {v15, v0, v14}, Lorg/apache/tools/ant/taskdefs/Zip$ArchiveState;-><init>(Z[[Lorg/apache/tools/ant/types/Resource;)V

    return-object v15
.end method

.method public getUseLanguageEnodingFlag()Z
    .locals 1

    .prologue
    .line 515
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->useLanguageEncodingFlag:Z

    return v0
.end method

.method protected grabNonFileSetResources([Lorg/apache/tools/ant/types/ResourceCollection;)[[Lorg/apache/tools/ant/types/Resource;
    .locals 8
    .param p1, "rcs"    # [Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 1586
    array-length v7, p1

    new-array v5, v7, [[Lorg/apache/tools/ant/types/Resource;

    .line 1587
    .local v5, "result":[[Lorg/apache/tools/ant/types/Resource;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v7, p1

    if-ge v2, v7, :cond_3

    .line 1588
    aget-object v7, p1, v2

    invoke-interface {v7}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1589
    .local v3, "iter":Ljava/util/Iterator;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1590
    .local v0, "dirs":Ljava/util/ArrayList;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1591
    .local v1, "files":Ljava/util/ArrayList;
    :cond_0
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 1592
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/Resource;

    .line 1593
    .local v4, "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 1594
    invoke-virtual {v4}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1595
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1597
    :cond_1
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1603
    .end local v4    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_2
    new-instance v7, Lorg/apache/tools/ant/taskdefs/Zip$4;

    invoke-direct {v7, p0}, Lorg/apache/tools/ant/taskdefs/Zip$4;-><init>(Lorg/apache/tools/ant/taskdefs/Zip;)V

    invoke-static {v0, v7}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 1610
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1611
    .local v6, "rs":Ljava/util/ArrayList;
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1612
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Lorg/apache/tools/ant/types/Resource;

    aput-object v7, v5, v2

    .line 1587
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 1614
    .end local v0    # "dirs":Ljava/util/ArrayList;
    .end local v1    # "files":Ljava/util/ArrayList;
    .end local v3    # "iter":Ljava/util/Iterator;
    .end local v6    # "rs":Ljava/util/ArrayList;
    :cond_3
    return-object v5
.end method

.method protected grabResources([Lorg/apache/tools/ant/types/FileSet;)[[Lorg/apache/tools/ant/types/Resource;
    .locals 11
    .param p1, "filesets"    # [Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 1542
    array-length v9, p1

    new-array v5, v9, [[Lorg/apache/tools/ant/types/Resource;

    .line 1543
    .local v5, "result":[[Lorg/apache/tools/ant/types/Resource;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v9, p1

    if-ge v2, v9, :cond_9

    .line 1544
    const/4 v7, 0x1

    .line 1545
    .local v7, "skipEmptyNames":Z
    aget-object v9, p1, v2

    instance-of v9, v9, Lorg/apache/tools/ant/types/ZipFileSet;

    if-eqz v9, :cond_0

    .line 1546
    aget-object v8, p1, v2

    check-cast v8, Lorg/apache/tools/ant/types/ZipFileSet;

    .line 1547
    .local v8, "zfs":Lorg/apache/tools/ant/types/ZipFileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/types/ZipFileSet;->getPrefix(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    invoke-virtual {v8, v9}, Lorg/apache/tools/ant/types/ZipFileSet;->getFullpath(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    const/4 v7, 0x1

    .line 1550
    .end local v8    # "zfs":Lorg/apache/tools/ant/types/ZipFileSet;
    :cond_0
    :goto_1
    aget-object v9, p1, v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v6

    .line 1552
    .local v6, "rs":Lorg/apache/tools/ant/DirectoryScanner;
    instance-of v9, v6, Lorg/apache/tools/ant/types/ZipScanner;

    if-eqz v9, :cond_1

    move-object v9, v6

    .line 1553
    check-cast v9, Lorg/apache/tools/ant/types/ZipScanner;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Zip;->encoding:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lorg/apache/tools/ant/types/ZipScanner;->setEncoding(Ljava/lang/String;)V

    .line 1555
    :cond_1
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 1556
    .local v4, "resources":Ljava/util/Vector;
    iget-boolean v9, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doFilesonly:Z

    if-nez v9, :cond_5

    .line 1557
    invoke-virtual {v6}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v0

    .line 1558
    .local v0, "directories":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_2
    array-length v9, v0

    if-ge v3, v9, :cond_5

    .line 1559
    const-string/jumbo v9, ""

    aget-object v10, v0, v3

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    if-nez v7, :cond_3

    .line 1560
    :cond_2
    aget-object v9, v0, v3

    invoke-virtual {v6, v9}, Lorg/apache/tools/ant/DirectoryScanner;->getResource(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1558
    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1547
    .end local v0    # "directories":[Ljava/lang/String;
    .end local v3    # "j":I
    .end local v4    # "resources":Ljava/util/Vector;
    .end local v6    # "rs":Lorg/apache/tools/ant/DirectoryScanner;
    .restart local v8    # "zfs":Lorg/apache/tools/ant/types/ZipFileSet;
    :cond_4
    const/4 v7, 0x0

    goto :goto_1

    .line 1564
    .end local v8    # "zfs":Lorg/apache/tools/ant/types/ZipFileSet;
    .restart local v4    # "resources":Ljava/util/Vector;
    .restart local v6    # "rs":Lorg/apache/tools/ant/DirectoryScanner;
    :cond_5
    invoke-virtual {v6}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v1

    .line 1565
    .local v1, "files":[Ljava/lang/String;
    const/4 v3, 0x0

    .restart local v3    # "j":I
    :goto_3
    array-length v9, v1

    if-ge v3, v9, :cond_8

    .line 1566
    const-string/jumbo v9, ""

    aget-object v10, v1, v3

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    if-nez v7, :cond_7

    .line 1567
    :cond_6
    aget-object v9, v1, v3

    invoke-virtual {v6, v9}, Lorg/apache/tools/ant/DirectoryScanner;->getResource(Ljava/lang/String;)Lorg/apache/tools/ant/types/Resource;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1565
    :cond_7
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 1571
    :cond_8
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v9

    new-array v9, v9, [Lorg/apache/tools/ant/types/Resource;

    aput-object v9, v5, v2

    .line 1572
    aget-object v9, v5, v2

    invoke-virtual {v4, v9}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 1543
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 1574
    .end local v1    # "files":[Ljava/lang/String;
    .end local v3    # "j":I
    .end local v4    # "resources":Ljava/util/Vector;
    .end local v6    # "rs":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v7    # "skipEmptyNames":Z
    :cond_9
    return-object v5
.end method

.method protected hasUpdatedFile()Z
    .locals 1

    .prologue
    .line 579
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->updatedFile:Z

    return v0
.end method

.method protected initZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V
    .locals 0
    .param p1, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1114
    return-void
.end method

.method protected final isAddingNewFiles()Z
    .locals 1

    .prologue
    .line 855
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->addingNewFiles:Z

    return v0
.end method

.method public isCompress()Z
    .locals 1

    .prologue
    .line 292
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doCompress:Z

    return v0
.end method

.method protected final isFirstPass()Z
    .locals 1

    .prologue
    .line 148
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doubleFilePass:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->skipWriting:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isInUpdateMode()Z
    .locals 1

    .prologue
    .line 319
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    return v0
.end method

.method protected logWhenWriting(Ljava/lang/String;I)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "level"    # I

    .prologue
    .line 2075
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->skipWriting:Z

    if-nez v0, :cond_0

    .line 2076
    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/Zip;->log(Ljava/lang/String;I)V

    .line 2078
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 1974
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->resources:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 1975
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    .line 1976
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->baseDir:Ljava/io/File;

    .line 1977
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->groupfilesets:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 1978
    const-string/jumbo v0, "add"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->duplicate:Ljava/lang/String;

    .line 1979
    const-string/jumbo v0, "zip"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->archiveType:Ljava/lang/String;

    .line 1980
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doCompress:Z

    .line 1981
    const-string/jumbo v0, "skip"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->emptyBehavior:Ljava/lang/String;

    .line 1982
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    .line 1983
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doFilesonly:Z

    .line 1984
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->encoding:Ljava/lang/String;

    .line 1985
    return-void
.end method

.method protected selectDirectoryResources([Lorg/apache/tools/ant/types/Resource;)[Lorg/apache/tools/ant/types/Resource;
    .locals 1
    .param p1, "orig"    # [Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 2034
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Zip$7;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Zip$7;-><init>(Lorg/apache/tools/ant/taskdefs/Zip;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Zip;->selectResources([Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)[Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    return-object v0
.end method

.method protected selectFileResources([Lorg/apache/tools/ant/types/Resource;)[Lorg/apache/tools/ant/types/Resource;
    .locals 1
    .param p1, "orig"    # [Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 2010
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Zip$6;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Zip$6;-><init>(Lorg/apache/tools/ant/taskdefs/Zip;)V

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/Zip;->selectResources([Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)[Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    return-object v0
.end method

.method protected selectResources([Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;)[Lorg/apache/tools/ant/types/Resource;
    .locals 5
    .param p1, "orig"    # [Lorg/apache/tools/ant/types/Resource;
    .param p2, "selector"    # Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    .prologue
    .line 2050
    array-length v3, p1

    if-nez v3, :cond_1

    .line 2065
    .end local p1    # "orig":[Lorg/apache/tools/ant/types/Resource;
    :cond_0
    :goto_0
    return-object p1

    .line 2054
    .restart local p1    # "orig":[Lorg/apache/tools/ant/types/Resource;
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    array-length v3, p1

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 2055
    .local v2, "v":Ljava/util/ArrayList;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, p1

    if-ge v0, v3, :cond_3

    .line 2056
    aget-object v3, p1, v0

    invoke-interface {p2, v3}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;->isSelected(Lorg/apache/tools/ant/types/Resource;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2057
    aget-object v3, p1, v0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2055
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2061
    :cond_3
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    array-length v4, p1

    if-eq v3, v4, :cond_0

    .line 2062
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v1, v3, [Lorg/apache/tools/ant/types/Resource;

    .line 2063
    .local v1, "r":[Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/apache/tools/ant/types/Resource;

    move-object p1, v3

    goto :goto_0
.end method

.method public setBasedir(Ljava/io/File;)V
    .locals 0
    .param p1, "baseDir"    # Ljava/io/File;

    .prologue
    .line 274
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->baseDir:Ljava/io/File;

    .line 275
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 436
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->comment:Ljava/lang/String;

    .line 437
    return-void
.end method

.method public setCompress(Z)V
    .locals 0
    .param p1, "c"    # Z

    .prologue
    .line 283
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doCompress:Z

    .line 284
    return-void
.end method

.method public setCreateUnicodeExtraFields(Lorg/apache/tools/ant/taskdefs/Zip$UnicodeExtraField;)V
    .locals 0
    .param p1, "b"    # Lorg/apache/tools/ant/taskdefs/Zip$UnicodeExtraField;

    .prologue
    .line 523
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->createUnicodeExtraFields:Lorg/apache/tools/ant/taskdefs/Zip$UnicodeExtraField;

    .line 524
    return-void
.end method

.method protected final setCurrentExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V
    .locals 1
    .param p1, "extra"    # [Lorg/apache/tools/zip/ZipExtraField;

    .prologue
    .line 1728
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Zip;->currentZipExtra:Ljava/lang/ThreadLocal;

    invoke-virtual {v0, p1}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 1729
    return-void
.end method

.method public setDestFile(Ljava/io/File;)V
    .locals 0
    .param p1, "destFile"    # Ljava/io/File;

    .prologue
    .line 256
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    .line 257
    return-void
.end method

.method public setDuplicate(Lorg/apache/tools/ant/taskdefs/Zip$Duplicate;)V
    .locals 1
    .param p1, "df"    # Lorg/apache/tools/ant/taskdefs/Zip$Duplicate;

    .prologue
    .line 366
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Zip$Duplicate;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->duplicate:Ljava/lang/String;

    .line 367
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 406
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->encoding:Ljava/lang/String;

    .line 407
    return-void
.end method

.method public setFallBackToUTF8(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 543
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->fallBackToUTF8:Z

    .line 544
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 246
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Zip;->setDestFile(Ljava/io/File;)V

    .line 247
    return-void
.end method

.method public setFilesonly(Z)V
    .locals 0
    .param p1, "f"    # Z

    .prologue
    .line 301
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doFilesonly:Z

    .line 302
    return-void
.end method

.method public setKeepCompression(Z)V
    .locals 0
    .param p1, "keep"    # Z

    .prologue
    .line 426
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->keepCompression:Z

    .line 427
    return-void
.end method

.method public setLevel(I)V
    .locals 0
    .param p1, "level"    # I

    .prologue
    .line 456
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->level:I

    .line 457
    return-void
.end method

.method public setPreserve0Permissions(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 491
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->preserve0Permissions:Z

    .line 492
    return-void
.end method

.method public setRoundUp(Z)V
    .locals 0
    .param p1, "r"    # Z

    .prologue
    .line 483
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->roundUp:Z

    .line 484
    return-void
.end method

.method public setUpdate(Z)V
    .locals 0
    .param p1, "c"    # Z

    .prologue
    .line 310
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doUpdate:Z

    .line 311
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->savedDoUpdate:Z

    .line 312
    return-void
.end method

.method public setUseLanguageEncodingFlag(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 507
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Zip;->useLanguageEncodingFlag:Z

    .line 508
    return-void
.end method

.method public setWhenempty(Lorg/apache/tools/ant/taskdefs/Zip$WhenEmpty;)V
    .locals 1
    .param p1, "we"    # Lorg/apache/tools/ant/taskdefs/Zip$WhenEmpty;

    .prologue
    .line 394
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Zip$WhenEmpty;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->emptyBehavior:Ljava/lang/String;

    .line 395
    return-void
.end method

.method public setZipfile(Ljava/io/File;)V
    .locals 0
    .param p1, "zipFile"    # Ljava/io/File;

    .prologue
    .line 233
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Zip;->setDestFile(Ljava/io/File;)V

    .line 234
    return-void
.end method

.method protected zipDir(Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V
    .locals 6
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .param p3, "vPath"    # Ljava/lang/String;
    .param p4, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1629
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/taskdefs/Zip;->zipDir(Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I[Lorg/apache/tools/zip/ZipExtraField;)V

    .line 1630
    return-void
.end method

.method protected zipDir(Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I[Lorg/apache/tools/zip/ZipExtraField;)V
    .locals 6
    .param p1, "dir"    # Ljava/io/File;
    .param p2, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .param p3, "vPath"    # Ljava/lang/String;
    .param p4, "mode"    # I
    .param p5, "extra"    # [Lorg/apache/tools/zip/ZipExtraField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1645
    if-nez p1, :cond_0

    const/4 v0, 0x0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    move-object v1, v0

    :goto_0
    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/taskdefs/Zip;->zipDir(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I[Lorg/apache/tools/zip/ZipExtraField;)V

    .line 1647
    return-void

    .line 1645
    :cond_0
    new-instance v1, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v1, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    goto :goto_0
.end method

.method protected zipDir(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I[Lorg/apache/tools/zip/ZipExtraField;)V
    .locals 8
    .param p1, "dir"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .param p3, "vPath"    # Ljava/lang/String;
    .param p4, "mode"    # I
    .param p5, "extra"    # [Lorg/apache/tools/zip/ZipExtraField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x3

    const/4 v2, 0x0

    .line 1662
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doFilesonly:Z

    if-eqz v3, :cond_1

    .line 1663
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "skipping directory "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " for file-only archive"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v5}, Lorg/apache/tools/ant/taskdefs/Zip;->logWhenWriting(Ljava/lang/String;I)V

    .line 1700
    :cond_0
    :goto_0
    return-void

    .line 1668
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Zip;->addedDirs:Ljava/util/Hashtable;

    invoke-virtual {v3, p3}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_0

    .line 1674
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "adding directory "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v5}, Lorg/apache/tools/ant/taskdefs/Zip;->logWhenWriting(Ljava/lang/String;I)V

    .line 1675
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Zip;->addedDirs:Ljava/util/Hashtable;

    invoke-virtual {v3, p3, p3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1677
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Zip;->skipWriting:Z

    if-nez v3, :cond_0

    .line 1678
    new-instance v1, Lorg/apache/tools/zip/ZipEntry;

    invoke-direct {v1, p3}, Lorg/apache/tools/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 1681
    .local v1, "ze":Lorg/apache/tools/zip/ZipEntry;
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/Zip;->roundUp:Z

    if-eqz v3, :cond_3

    const/16 v0, 0x7cf

    .line 1683
    .local v0, "millisToAdd":I
    :goto_1
    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 1684
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v4

    int-to-long v6, v0

    add-long/2addr v4, v6

    invoke-virtual {v1, v4, v5}, Lorg/apache/tools/zip/ZipEntry;->setTime(J)V

    .line 1688
    :goto_2
    const-wide/16 v4, 0x0

    invoke-virtual {v1, v4, v5}, Lorg/apache/tools/zip/ZipEntry;->setSize(J)V

    .line 1689
    invoke-virtual {v1, v2}, Lorg/apache/tools/zip/ZipEntry;->setMethod(I)V

    .line 1691
    sget-wide v2, Lorg/apache/tools/ant/taskdefs/Zip;->EMPTY_CRC:J

    invoke-virtual {v1, v2, v3}, Lorg/apache/tools/zip/ZipEntry;->setCrc(J)V

    .line 1692
    invoke-virtual {v1, p4}, Lorg/apache/tools/zip/ZipEntry;->setUnixMode(I)V

    .line 1694
    if-eqz p5, :cond_2

    .line 1695
    invoke-virtual {v1, p5}, Lorg/apache/tools/zip/ZipEntry;->setExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V

    .line 1698
    :cond_2
    invoke-virtual {p2, v1}, Lorg/apache/tools/zip/ZipOutputStream;->putNextEntry(Lorg/apache/tools/zip/ZipEntry;)V

    goto :goto_0

    .end local v0    # "millisToAdd":I
    :cond_3
    move v0, v2

    .line 1681
    goto :goto_1

    .line 1686
    .restart local v0    # "millisToAdd":I
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    int-to-long v6, v0

    add-long/2addr v4, v6

    invoke-virtual {v1, v4, v5}, Lorg/apache/tools/zip/ZipEntry;->setTime(J)V

    goto :goto_2
.end method

.method protected zipFile(Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V
    .locals 8
    .param p1, "file"    # Ljava/io/File;
    .param p2, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .param p3, "vPath"    # Ljava/lang/String;
    .param p4, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1881
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile:Ljava/io/File;

    invoke-virtual {p1, v0}, Ljava/io/File;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1882
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "A zip file cannot include itself"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 1886
    :cond_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 1889
    .local v1, "fIn":Ljava/io/FileInputStream;
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Zip;->roundUp:Z

    if-eqz v0, :cond_1

    const/16 v0, 0x7cf

    :goto_0
    int-to-long v4, v0

    add-long/2addr v4, v2

    const/4 v6, 0x0

    move-object v0, p0

    move-object v2, p2

    move-object v3, p3

    move v7, p4

    invoke-virtual/range {v0 .. v7}, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile(Ljava/io/InputStream;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;JLjava/io/File;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1893
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    .line 1895
    return-void

    .line 1889
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 1893
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    throw v0
.end method

.method protected zipFile(Ljava/io/InputStream;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;JLjava/io/File;I)V
    .locals 14
    .param p1, "in"    # Ljava/io/InputStream;
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
    .line 1751
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Zip;->entries:Ljava/util/Hashtable;

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_8

    .line 1753
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Zip;->duplicate:Ljava/lang/String;

    const-string/jumbo v11, "preserve"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 1754
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " already added, skipping"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x2

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/Zip;->logWhenWriting(Ljava/lang/String;I)V

    .line 1834
    :goto_0
    return-void

    .line 1757
    :cond_0
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Zip;->duplicate:Ljava/lang/String;

    const-string/jumbo v11, "fail"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 1758
    new-instance v10, Lorg/apache/tools/ant/BuildException;

    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Duplicate file "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " was found and the duplicate "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "attribute is \'fail\'."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 1763
    :cond_1
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "duplicate file "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, " found, adding."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/Zip;->logWhenWriting(Ljava/lang/String;I)V

    .line 1770
    :goto_1
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Zip;->entries:Ljava/util/Hashtable;

    move-object/from16 v0, p3

    move-object/from16 v1, p3

    invoke-virtual {v10, v0, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1772
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/Zip;->skipWriting:Z

    if-nez v10, :cond_7

    .line 1773
    new-instance v7, Lorg/apache/tools/zip/ZipEntry;

    move-object/from16 v0, p3

    invoke-direct {v7, v0}, Lorg/apache/tools/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 1774
    .local v7, "ze":Lorg/apache/tools/zip/ZipEntry;
    move-wide/from16 v0, p4

    invoke-virtual {v7, v0, v1}, Lorg/apache/tools/zip/ZipEntry;->setTime(J)V

    .line 1775
    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doCompress:Z

    if-eqz v10, :cond_9

    const/16 v10, 0x8

    :goto_2
    invoke-virtual {v7, v10}, Lorg/apache/tools/zip/ZipEntry;->setMethod(I)V

    .line 1784
    invoke-virtual/range {p2 .. p2}, Lorg/apache/tools/zip/ZipOutputStream;->isSeekable()Z

    move-result v10

    if-nez v10, :cond_3

    iget-boolean v10, p0, Lorg/apache/tools/ant/taskdefs/Zip;->doCompress:Z

    if-nez v10, :cond_3

    .line 1785
    const-wide/16 v8, 0x0

    .line 1786
    .local v8, "size":J
    new-instance v4, Ljava/util/zip/CRC32;

    invoke-direct {v4}, Ljava/util/zip/CRC32;-><init>()V

    .line 1787
    .local v4, "cal":Ljava/util/zip/CRC32;
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v10

    if-nez v10, :cond_a

    .line 1789
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1791
    .local v2, "bos":Ljava/io/ByteArrayOutputStream;
    const/16 v10, 0x2000

    new-array v3, v10, [B

    .line 1792
    .local v3, "buffer":[B
    const/4 v5, 0x0

    .line 1794
    .local v5, "count":I
    :cond_2
    int-to-long v10, v5

    add-long/2addr v8, v10

    .line 1795
    const/4 v10, 0x0

    invoke-virtual {v4, v3, v10, v5}, Ljava/util/zip/CRC32;->update([BII)V

    .line 1796
    const/4 v10, 0x0

    invoke-virtual {v2, v3, v10, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1797
    const/4 v10, 0x0

    array-length v11, v3

    invoke-virtual {p1, v3, v10, v11}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    .line 1798
    const/4 v10, -0x1

    if-ne v5, v10, :cond_2

    .line 1799
    new-instance p1, Ljava/io/ByteArrayInputStream;

    .end local p1    # "in":Ljava/io/InputStream;
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v10

    invoke-direct {p1, v10}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 1812
    .end local v2    # "bos":Ljava/io/ByteArrayOutputStream;
    .restart local p1    # "in":Ljava/io/InputStream;
    :goto_3
    invoke-virtual {v7, v8, v9}, Lorg/apache/tools/zip/ZipEntry;->setSize(J)V

    .line 1813
    invoke-virtual {v4}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v10

    invoke-virtual {v7, v10, v11}, Lorg/apache/tools/zip/ZipEntry;->setCrc(J)V

    .line 1816
    .end local v3    # "buffer":[B
    .end local v4    # "cal":Ljava/util/zip/CRC32;
    .end local v5    # "count":I
    .end local v8    # "size":J
    :cond_3
    move/from16 v0, p7

    invoke-virtual {v7, v0}, Lorg/apache/tools/zip/ZipEntry;->setUnixMode(I)V

    .line 1817
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Zip;->getCurrentExtraFields()[Lorg/apache/tools/zip/ZipExtraField;

    move-result-object v6

    .line 1818
    .local v6, "extra":[Lorg/apache/tools/zip/ZipExtraField;
    if-eqz v6, :cond_4

    .line 1819
    invoke-virtual {v7, v6}, Lorg/apache/tools/zip/ZipEntry;->setExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V

    .line 1822
    :cond_4
    move-object/from16 v0, p2

    invoke-virtual {v0, v7}, Lorg/apache/tools/zip/ZipOutputStream;->putNextEntry(Lorg/apache/tools/zip/ZipEntry;)V

    .line 1824
    const/16 v10, 0x2000

    new-array v3, v10, [B

    .line 1825
    .restart local v3    # "buffer":[B
    const/4 v5, 0x0

    .line 1827
    .restart local v5    # "count":I
    :cond_5
    if-eqz v5, :cond_6

    .line 1828
    const/4 v10, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v3, v10, v5}, Lorg/apache/tools/zip/ZipOutputStream;->write([BII)V

    .line 1830
    :cond_6
    const/4 v10, 0x0

    array-length v11, v3

    invoke-virtual {p1, v3, v10, v11}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    .line 1831
    const/4 v10, -0x1

    if-ne v5, v10, :cond_5

    .line 1833
    .end local v3    # "buffer":[B
    .end local v5    # "count":I
    .end local v6    # "extra":[Lorg/apache/tools/zip/ZipExtraField;
    .end local v7    # "ze":Lorg/apache/tools/zip/ZipEntry;
    :cond_7
    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/Zip;->addedFiles:Ljava/util/Vector;

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 1767
    :cond_8
    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "adding entry "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    move-object/from16 v0, p3

    invoke-virtual {v10, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x3

    invoke-virtual {p0, v10, v11}, Lorg/apache/tools/ant/taskdefs/Zip;->logWhenWriting(Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 1775
    .restart local v7    # "ze":Lorg/apache/tools/zip/ZipEntry;
    :cond_9
    const/4 v10, 0x0

    goto/16 :goto_2

    .line 1802
    .restart local v4    # "cal":Ljava/util/zip/CRC32;
    .restart local v8    # "size":J
    :cond_a
    const v10, 0x7fffffff

    invoke-virtual {p1, v10}, Ljava/io/InputStream;->mark(I)V

    .line 1803
    const/16 v10, 0x2000

    new-array v3, v10, [B

    .line 1804
    .restart local v3    # "buffer":[B
    const/4 v5, 0x0

    .line 1806
    .restart local v5    # "count":I
    :cond_b
    int-to-long v10, v5

    add-long/2addr v8, v10

    .line 1807
    const/4 v10, 0x0

    invoke-virtual {v4, v3, v10, v5}, Ljava/util/zip/CRC32;->update([BII)V

    .line 1808
    const/4 v10, 0x0

    array-length v11, v3

    invoke-virtual {p1, v3, v10, v11}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    .line 1809
    const/4 v10, -0x1

    if-ne v5, v10, :cond_b

    .line 1810
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V

    goto :goto_3
.end method

.method protected final zipFile(Ljava/io/InputStream;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;JLjava/io/File;I[Lorg/apache/tools/zip/ZipExtraField;)V
    .locals 2
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .param p3, "vPath"    # Ljava/lang/String;
    .param p4, "lastModified"    # J
    .param p6, "fromArchive"    # Ljava/io/File;
    .param p7, "mode"    # I
    .param p8, "extra"    # [Lorg/apache/tools/zip/ZipExtraField;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 1858
    :try_start_0
    invoke-virtual {p0, p8}, Lorg/apache/tools/ant/taskdefs/Zip;->setCurrentExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V

    .line 1859
    invoke-virtual/range {p0 .. p7}, Lorg/apache/tools/ant/taskdefs/Zip;->zipFile(Ljava/io/InputStream;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;JLjava/io/File;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1861
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Zip;->setCurrentExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V

    .line 1863
    return-void

    .line 1861
    :catchall_0
    move-exception v0

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Zip;->setCurrentExtraFields([Lorg/apache/tools/zip/ZipExtraField;)V

    throw v0
.end method
