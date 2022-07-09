.class public Lorg/apache/tools/ant/types/selectors/DifferentSelector;
.super Lorg/apache/tools/ant/types/selectors/MappingSelector;
.source "DifferentSelector.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field private ignoreContents:Z

.field private ignoreFileTimes:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/types/selectors/DifferentSelector;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/MappingSelector;-><init>()V

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/DifferentSelector;->ignoreFileTimes:Z

    .line 55
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/DifferentSelector;->ignoreContents:Z

    return-void
.end method


# virtual methods
.method protected selectionTest(Ljava/io/File;Ljava/io/File;)Z
    .locals 10
    .param p1, "srcfile"    # Ljava/io/File;
    .param p2, "destfile"    # Ljava/io/File;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 82
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v4

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eq v4, v5, :cond_1

    .line 111
    :cond_0
    :goto_0
    return v2

    .line 86
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    .line 91
    iget-boolean v4, p0, Lorg/apache/tools/ant/types/selectors/DifferentSelector;->ignoreFileTimes:Z

    if-nez v4, :cond_2

    .line 94
    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    iget v8, p0, Lorg/apache/tools/ant/types/selectors/DifferentSelector;->granularity:I

    int-to-long v8, v8

    sub-long/2addr v6, v8

    cmp-long v4, v4, v6

    if-ltz v4, :cond_3

    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    iget v8, p0, Lorg/apache/tools/ant/types/selectors/DifferentSelector;->granularity:I

    int-to-long v8, v8

    add-long/2addr v6, v8

    cmp-long v4, v4, v6

    if-gtz v4, :cond_3

    move v1, v2

    .line 98
    .local v1, "sameDate":Z
    :goto_1
    if-eqz v1, :cond_0

    .line 102
    .end local v1    # "sameDate":Z
    :cond_2
    iget-boolean v4, p0, Lorg/apache/tools/ant/types/selectors/DifferentSelector;->ignoreContents:Z

    if-nez v4, :cond_4

    .line 105
    :try_start_0
    sget-object v4, Lorg/apache/tools/ant/types/selectors/DifferentSelector;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v4, p1, p2}, Lorg/apache/tools/ant/util/FileUtils;->contentEquals(Ljava/io/File;Ljava/io/File;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_0

    move v2, v3

    goto :goto_0

    :cond_3
    move v1, v3

    .line 94
    goto :goto_1

    .line 106
    :catch_0
    move-exception v0

    .line 107
    .local v0, "e":Ljava/io/IOException;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "while comparing "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " and "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .end local v0    # "e":Ljava/io/IOException;
    :cond_4
    move v2, v3

    .line 111
    goto :goto_0
.end method

.method public setIgnoreContents(Z)V
    .locals 0
    .param p1, "ignoreContents"    # Z

    .prologue
    .line 71
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/DifferentSelector;->ignoreContents:Z

    .line 72
    return-void
.end method

.method public setIgnoreFileTimes(Z)V
    .locals 0
    .param p1, "ignoreFileTimes"    # Z

    .prologue
    .line 63
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/DifferentSelector;->ignoreFileTimes:Z

    .line 64
    return-void
.end method
