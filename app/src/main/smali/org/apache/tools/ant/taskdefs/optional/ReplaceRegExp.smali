.class public Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;
.super Lorg/apache/tools/ant/Task;
.source "ReplaceRegExp.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private byline:Z

.field private encoding:Ljava/lang/String;

.field private file:Ljava/io/File;

.field private flags:Ljava/lang/String;

.field private preserveLastModified:Z

.field private regex:Lorg/apache/tools/ant/types/RegularExpression;

.field private resources:Lorg/apache/tools/ant/types/resources/Union;

.field private subs:Lorg/apache/tools/ant/types/Substitution;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 127
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 138
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 129
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->preserveLastModified:Z

    .line 134
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->encoding:Ljava/lang/String;

    .line 139
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->file:Ljava/io/File;

    .line 140
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->flags:Ljava/lang/String;

    .line 141
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->byline:Z

    .line 143
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    .line 144
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    .line 145
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 534
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
.method public addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 2
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 267
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->isFilesystemOnly()Z

    move-result v0

    if-nez v0, :cond_0

    .line 268
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "only filesystem resources are supported"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 270
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v0, :cond_1

    .line 271
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->resources:Lorg/apache/tools/ant/types/resources/Union;

    .line 273
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 274
    return-void
.end method

.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 0
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 258
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 259
    return-void
.end method

.method public createRegexp()Lorg/apache/tools/ant/types/RegularExpression;
    .locals 2

    .prologue
    .line 283
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    if-eqz v0, :cond_0

    .line 284
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one regular expression is allowed."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 287
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/RegularExpression;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/RegularExpression;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    .line 288
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    return-object v0
.end method

.method public createSubstitution()Lorg/apache/tools/ant/types/Substitution;
    .locals 2

    .prologue
    .line 298
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    if-eqz v0, :cond_0

    .line 299
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one substitution expression is allowed"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 303
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/Substitution;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Substitution;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    .line 304
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    return-object v0
.end method

.method protected doReplace(Lorg/apache/tools/ant/types/RegularExpression;Lorg/apache/tools/ant/types/Substitution;Ljava/lang/String;I)Ljava/lang/String;
    .locals 4
    .param p1, "r"    # Lorg/apache/tools/ant/types/RegularExpression;
    .param p2, "s"    # Lorg/apache/tools/ant/types/Substitution;
    .param p3, "input"    # Ljava/lang/String;
    .param p4, "options"    # I

    .prologue
    .line 331
    move-object v1, p3

    .line 332
    .local v1, "res":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/types/RegularExpression;->getRegexp(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/util/regexp/Regexp;

    move-result-object v0

    .line 334
    .local v0, "regexp":Lorg/apache/tools/ant/util/regexp/Regexp;
    invoke-interface {v0, p3, p4}, Lorg/apache/tools/ant/util/regexp/Regexp;->matches(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 335
    const-string/jumbo v2, "Found match; substituting"

    const/4 v3, 0x4

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->log(Ljava/lang/String;I)V

    .line 336
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {p2, v2}, Lorg/apache/tools/ant/types/Substitution;->getExpression(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, p3, v2, p4}, Lorg/apache/tools/ant/util/regexp/Regexp;->substitute(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .line 340
    :cond_0
    return-object v1
.end method

.method protected doReplace(Ljava/io/File;I)V
    .locals 28
    .param p1, "f"    # Ljava/io/File;
    .param p2, "options"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 353
    sget-object v4, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const-string/jumbo v5, "replace"

    const-string/jumbo v6, ".txt"

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x1

    invoke-virtual/range {v4 .. v9}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v25

    .line 355
    .local v25, "temp":Ljava/io/File;
    const/16 v22, 0x0

    .line 356
    .local v22, "r":Ljava/io/Reader;
    const/16 v26, 0x0

    .line 357
    .local v26, "w":Ljava/io/Writer;
    const/4 v12, 0x0

    .line 360
    .local v12, "bw":Ljava/io/BufferedWriter;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->encoding:Ljava/lang/String;

    if-nez v4, :cond_5

    .line 361
    new-instance v23, Ljava/io/FileReader;

    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 362
    .end local v22    # "r":Ljava/io/Reader;
    .local v23, "r":Ljava/io/Reader;
    :try_start_1
    new-instance v27, Ljava/io/FileWriter;

    move-object/from16 v0, v27

    move-object/from16 v1, v25

    invoke-direct {v0, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .end local v26    # "w":Ljava/io/Writer;
    .local v27, "w":Ljava/io/Writer;
    move-object/from16 v26, v27

    .end local v27    # "w":Ljava/io/Writer;
    .restart local v26    # "w":Ljava/io/Writer;
    move-object/from16 v22, v23

    .line 369
    .end local v23    # "r":Ljava/io/Reader;
    .restart local v22    # "r":Ljava/io/Reader;
    :goto_0
    :try_start_2
    new-instance v10, Ljava/io/BufferedReader;

    move-object/from16 v0, v22

    invoke-direct {v10, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 370
    .local v10, "br":Ljava/io/BufferedReader;
    new-instance v13, Ljava/io/BufferedWriter;

    move-object/from16 v0, v26

    invoke-direct {v13, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 372
    .end local v12    # "bw":Ljava/io/BufferedWriter;
    .local v13, "bw":Ljava/io/BufferedWriter;
    const/4 v15, 0x0

    .line 374
    .local v15, "changes":Z
    :try_start_3
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Replacing pattern \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/RegularExpression;->getPattern(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\' with \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Substitution;->getExpression(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\' in \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->byline:Z

    if-eqz v4, :cond_6

    const-string/jumbo v4, " by line"

    :goto_1
    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->flags:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_7

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, " with flags: \'"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v6, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->flags:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v6, "\'"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    :goto_2
    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->log(Ljava/lang/String;I)V

    .line 380
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->byline:Z

    if-eqz v4, :cond_12

    .line 381
    new-instance v19, Ljava/lang/StringBuffer;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    .line 382
    .local v19, "linebuf":Ljava/lang/StringBuffer;
    const/16 v18, 0x0

    .line 383
    .local v18, "line":Ljava/lang/String;
    const/16 v24, 0x0

    .line 385
    .local v24, "res":Ljava/lang/String;
    const/16 v17, 0x0

    .line 388
    .local v17, "hasCR":Z
    :cond_0
    invoke-virtual {v10}, Ljava/io/BufferedReader;->read()I

    move-result v14

    .line 390
    .local v14, "c":I
    const/16 v4, 0xd

    if-ne v14, v4, :cond_9

    .line 391
    if-eqz v17, :cond_8

    .line 393
    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    .line 394
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, p2

    invoke-virtual {v0, v4, v5, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->doReplace(Lorg/apache/tools/ant/types/RegularExpression;Lorg/apache/tools/ant/types/Substitution;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v24

    .line 396
    move-object/from16 v0, v24

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 397
    const/4 v15, 0x1

    .line 400
    :cond_1
    move-object/from16 v0, v24

    invoke-virtual {v13, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 401
    const/16 v4, 0xd

    invoke-virtual {v13, v4}, Ljava/io/BufferedWriter;->write(I)V

    .line 403
    new-instance v19, Ljava/lang/StringBuffer;

    .end local v19    # "linebuf":Ljava/lang/StringBuffer;
    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    .line 449
    .restart local v19    # "linebuf":Ljava/lang/StringBuffer;
    :cond_2
    :goto_3
    if-gez v14, :cond_0

    .line 463
    .end local v14    # "c":I
    .end local v17    # "hasCR":Z
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "linebuf":Ljava/lang/StringBuffer;
    :goto_4
    invoke-virtual {v13}, Ljava/io/BufferedWriter;->flush()V

    .line 465
    invoke-virtual/range {v22 .. v22}, Ljava/io/Reader;->close()V

    .line 466
    const/16 v22, 0x0

    .line 467
    invoke-virtual/range {v26 .. v26}, Ljava/io/Writer;->close()V

    .line 468
    const/16 v26, 0x0

    .line 470
    if-eqz v15, :cond_14

    .line 471
    const-string/jumbo v4, "File has changed; saving the updated file"

    const/4 v5, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->log(Ljava/lang/String;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 473
    :try_start_4
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->lastModified()J

    move-result-wide v20

    .line 474
    .local v20, "origLastModified":J
    sget-object v4, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, v25

    move-object/from16 v1, p1

    invoke-virtual {v4, v0, v1}, Lorg/apache/tools/ant/util/FileUtils;->rename(Ljava/io/File;Ljava/io/File;)V

    .line 475
    move-object/from16 v0, p0

    iget-boolean v4, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->preserveLastModified:Z

    if-eqz v4, :cond_3

    .line 476
    sget-object v4, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    move-object/from16 v0, p1

    move-wide/from16 v1, v20

    invoke-virtual {v4, v0, v1, v2}, Lorg/apache/tools/ant/util/FileUtils;->setFileLastModified(Ljava/io/File;J)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 478
    :cond_3
    const/16 v25, 0x0

    .line 487
    .end local v20    # "origLastModified":J
    :goto_5
    invoke-static/range {v22 .. v22}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 488
    invoke-static {v13}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 489
    invoke-static/range {v26 .. v26}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 490
    if-eqz v25, :cond_4

    .line 491
    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->delete()Z

    .line 494
    :cond_4
    return-void

    .line 364
    .end local v10    # "br":Ljava/io/BufferedReader;
    .end local v13    # "bw":Ljava/io/BufferedWriter;
    .end local v15    # "changes":Z
    .end local v24    # "res":Ljava/lang/String;
    .restart local v12    # "bw":Ljava/io/BufferedWriter;
    :cond_5
    :try_start_5
    new-instance v23, Ljava/io/InputStreamReader;

    new-instance v4, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v4, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->encoding:Ljava/lang/String;

    move-object/from16 v0, v23

    invoke-direct {v0, v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 365
    .end local v22    # "r":Ljava/io/Reader;
    .restart local v23    # "r":Ljava/io/Reader;
    :try_start_6
    new-instance v27, Ljava/io/OutputStreamWriter;

    new-instance v4, Ljava/io/FileOutputStream;

    move-object/from16 v0, v25

    invoke-direct {v4, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->encoding:Ljava/lang/String;

    move-object/from16 v0, v27

    invoke-direct {v0, v4, v5}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .end local v26    # "w":Ljava/io/Writer;
    .restart local v27    # "w":Ljava/io/Writer;
    move-object/from16 v26, v27

    .end local v27    # "w":Ljava/io/Writer;
    .restart local v26    # "w":Ljava/io/Writer;
    move-object/from16 v22, v23

    .end local v23    # "r":Ljava/io/Reader;
    .restart local v22    # "r":Ljava/io/Reader;
    goto/16 :goto_0

    .line 374
    .end local v12    # "bw":Ljava/io/BufferedWriter;
    .restart local v10    # "br":Ljava/io/BufferedReader;
    .restart local v13    # "bw":Ljava/io/BufferedWriter;
    .restart local v15    # "changes":Z
    :cond_6
    :try_start_7
    const-string/jumbo v4, ""

    goto/16 :goto_1

    :cond_7
    const-string/jumbo v4, ""

    goto/16 :goto_2

    .line 407
    .restart local v14    # "c":I
    .restart local v17    # "hasCR":Z
    .restart local v18    # "line":Ljava/lang/String;
    .restart local v19    # "linebuf":Ljava/lang/StringBuffer;
    .restart local v24    # "res":Ljava/lang/String;
    :cond_8
    const/16 v17, 0x1

    goto :goto_3

    .line 409
    :cond_9
    const/16 v4, 0xa

    if-ne v14, v4, :cond_c

    .line 411
    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    .line 412
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, p2

    invoke-virtual {v0, v4, v5, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->doReplace(Lorg/apache/tools/ant/types/RegularExpression;Lorg/apache/tools/ant/types/Substitution;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v24

    .line 414
    move-object/from16 v0, v24

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_a

    .line 415
    const/4 v15, 0x1

    .line 418
    :cond_a
    move-object/from16 v0, v24

    invoke-virtual {v13, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 419
    if-eqz v17, :cond_b

    .line 420
    const/16 v4, 0xd

    invoke-virtual {v13, v4}, Ljava/io/BufferedWriter;->write(I)V

    .line 421
    const/16 v17, 0x0

    .line 423
    :cond_b
    const/16 v4, 0xa

    invoke-virtual {v13, v4}, Ljava/io/BufferedWriter;->write(I)V

    .line 425
    new-instance v19, Ljava/lang/StringBuffer;

    .end local v19    # "linebuf":Ljava/lang/StringBuffer;
    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    .restart local v19    # "linebuf":Ljava/lang/StringBuffer;
    goto/16 :goto_3

    .line 427
    :cond_c
    if-nez v17, :cond_d

    if-gez v14, :cond_10

    .line 429
    :cond_d
    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v18

    .line 430
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, p2

    invoke-virtual {v0, v4, v5, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->doReplace(Lorg/apache/tools/ant/types/RegularExpression;Lorg/apache/tools/ant/types/Substitution;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v24

    .line 432
    move-object/from16 v0, v24

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_e

    .line 433
    const/4 v15, 0x1

    .line 436
    :cond_e
    move-object/from16 v0, v24

    invoke-virtual {v13, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 437
    if-eqz v17, :cond_f

    .line 438
    const/16 v4, 0xd

    invoke-virtual {v13, v4}, Ljava/io/BufferedWriter;->write(I)V

    .line 439
    const/16 v17, 0x0

    .line 442
    :cond_f
    new-instance v19, Ljava/lang/StringBuffer;

    .end local v19    # "linebuf":Ljava/lang/StringBuffer;
    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuffer;-><init>()V

    .line 445
    .restart local v19    # "linebuf":Ljava/lang/StringBuffer;
    :cond_10
    if-ltz v14, :cond_2

    .line 446
    int-to-char v4, v14

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_3

    .line 487
    .end local v14    # "c":I
    .end local v17    # "hasCR":Z
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "linebuf":Ljava/lang/StringBuffer;
    .end local v24    # "res":Ljava/lang/String;
    :catchall_0
    move-exception v4

    move-object v12, v13

    .end local v10    # "br":Ljava/io/BufferedReader;
    .end local v13    # "bw":Ljava/io/BufferedWriter;
    .end local v15    # "changes":Z
    .restart local v12    # "bw":Ljava/io/BufferedWriter;
    :goto_6
    invoke-static/range {v22 .. v22}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 488
    invoke-static {v12}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 489
    invoke-static/range {v26 .. v26}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 490
    if-eqz v25, :cond_11

    .line 491
    invoke-virtual/range {v25 .. v25}, Ljava/io/File;->delete()Z

    .line 487
    :cond_11
    throw v4

    .line 452
    .end local v12    # "bw":Ljava/io/BufferedWriter;
    .restart local v10    # "br":Ljava/io/BufferedReader;
    .restart local v13    # "bw":Ljava/io/BufferedWriter;
    .restart local v15    # "changes":Z
    :cond_12
    :try_start_8
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->safeReadFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v11

    .line 454
    .local v11, "buf":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v4, v5, v11, v1}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->doReplace(Lorg/apache/tools/ant/types/RegularExpression;Lorg/apache/tools/ant/types/Substitution;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v24

    .line 456
    .restart local v24    # "res":Ljava/lang/String;
    move-object/from16 v0, v24

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_13

    .line 457
    const/4 v15, 0x1

    .line 460
    :cond_13
    move-object/from16 v0, v24

    invoke-virtual {v13, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 479
    .end local v11    # "buf":Ljava/lang/String;
    :catch_0
    move-exception v16

    .line 480
    .local v16, "e":Ljava/io/IOException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Couldn\'t rename temporary file "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    move-object/from16 v0, v25

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v6

    move-object/from16 v0, v16

    invoke-direct {v4, v5, v0, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 484
    .end local v16    # "e":Ljava/io/IOException;
    :cond_14
    const-string/jumbo v4, "No change made"

    const/4 v5, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v4, v5}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->log(Ljava/lang/String;I)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto/16 :goto_5

    .line 487
    .end local v10    # "br":Ljava/io/BufferedReader;
    .end local v13    # "bw":Ljava/io/BufferedWriter;
    .end local v15    # "changes":Z
    .end local v24    # "res":Ljava/lang/String;
    .restart local v12    # "bw":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v4

    goto :goto_6

    .end local v22    # "r":Ljava/io/Reader;
    .restart local v23    # "r":Ljava/io/Reader;
    :catchall_2
    move-exception v4

    move-object/from16 v22, v23

    .end local v23    # "r":Ljava/io/Reader;
    .restart local v22    # "r":Ljava/io/Reader;
    goto :goto_6
.end method

.method public execute()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 503
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    if-nez v5, :cond_0

    .line 504
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "No expression to match."

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 506
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    if-nez v5, :cond_1

    .line 507
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Nothing to replace expression with."

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 510
    :cond_1
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->file:Ljava/io/File;

    if-eqz v5, :cond_2

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-eqz v5, :cond_2

    .line 511
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "You cannot supply the \'file\' attribute and resource collections at the same time."

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 516
    :cond_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->flags:Ljava/lang/String;

    invoke-static {v5}, Lorg/apache/tools/ant/util/regexp/RegexpUtil;->asOptions(Ljava/lang/String;)I

    move-result v4

    .line 518
    .local v4, "options":I
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->file:Ljava/io/File;

    if-eqz v5, :cond_4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->file:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 520
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->file:Ljava/io/File;

    invoke-virtual {p0, v5, v4}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->doReplace(Ljava/io/File;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 531
    :cond_3
    :goto_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->resources:Lorg/apache/tools/ant/types/resources/Union;

    if-eqz v5, :cond_7

    .line 532
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 533
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/types/Resource;

    sget-object v6, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v6, :cond_5

    const-string/jumbo v6, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 535
    .local v2, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    invoke-interface {v2}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    .line 537
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 539
    :try_start_1
    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->doReplace(Ljava/io/File;I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 540
    :catch_0
    move-exception v0

    .line 541
    .local v0, "e":Ljava/lang/Exception;
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "An error occurred processing file: \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\': "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v7}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 521
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v3    # "i":Ljava/util/Iterator;
    :catch_1
    move-exception v0

    .line 522
    .local v0, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "An error occurred processing file: \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->file:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\': "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v7}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 526
    .end local v0    # "e":Ljava/io/IOException;
    :cond_4
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->file:Ljava/io/File;

    if-eqz v5, :cond_3

    .line 527
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "The following file is missing: \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->file:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v7}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->log(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 533
    .restart local v3    # "i":Ljava/util/Iterator;
    :cond_5
    sget-object v6, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto/16 :goto_2

    .line 546
    .restart local v1    # "f":Ljava/io/File;
    .restart local v2    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_6
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "The following file is missing: \'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, "\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v7}, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->log(Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 551
    .end local v1    # "f":Ljava/io/File;
    .end local v2    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v3    # "i":Ljava/util/Iterator;
    :cond_7
    return-void
.end method

.method public setByLine(Ljava/lang/String;)V
    .locals 2
    .param p1, "byline"    # Ljava/lang/String;

    .prologue
    .line 221
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 223
    .local v0, "res":Ljava/lang/Boolean;
    if-nez v0, :cond_0

    .line 224
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 226
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->byline:Z

    .line 227
    return-void
.end method

.method public setByLine(Z)V
    .locals 0
    .param p1, "byline"    # Z

    .prologue
    .line 238
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->byline:Z

    .line 239
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 250
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->encoding:Ljava/lang/String;

    .line 251
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 154
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->file:Ljava/io/File;

    .line 155
    return-void
.end method

.method public setFlags(Ljava/lang/String;)V
    .locals 0
    .param p1, "flags"    # Ljava/lang/String;

    .prologue
    .line 206
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->flags:Ljava/lang/String;

    .line 207
    return-void
.end method

.method public setMatch(Ljava/lang/String;)V
    .locals 2
    .param p1, "match"    # Ljava/lang/String;

    .prologue
    .line 164
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    if-eqz v0, :cond_0

    .line 165
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one regular expression is allowed"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 168
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/RegularExpression;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/RegularExpression;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    .line 169
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->regex:Lorg/apache/tools/ant/types/RegularExpression;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/RegularExpression;->setPattern(Ljava/lang/String;)V

    .line 170
    return-void
.end method

.method public setPreserveLastModified(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 314
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->preserveLastModified:Z

    .line 315
    return-void
.end method

.method public setReplace(Ljava/lang/String;)V
    .locals 2
    .param p1, "replace"    # Ljava/lang/String;

    .prologue
    .line 181
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    if-eqz v0, :cond_0

    .line 182
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Only one substitution expression is allowed"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 186
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/Substitution;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Substitution;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    .line 187
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ReplaceRegExp;->subs:Lorg/apache/tools/ant/types/Substitution;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Substitution;->setExpression(Ljava/lang/String;)V

    .line 188
    return-void
.end method
