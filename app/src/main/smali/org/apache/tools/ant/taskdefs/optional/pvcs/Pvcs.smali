.class public Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;
.super Lorg/apache/tools/ant/Task;
.source "Pvcs.java"


# static fields
.field private static final GET_EXE:Ljava/lang/String; = "get"

.field private static final PCLI_EXE:Ljava/lang/String; = "pcli"

.field private static final POS_1:I = 0x1

.field private static final POS_2:I = 0x2

.field private static final POS_3:I = 0x3


# instance fields
.field private config:Ljava/lang/String;

.field private filenameFormat:Ljava/lang/String;

.field private force:Ljava/lang/String;

.field private ignorerc:Z

.field private label:Ljava/lang/String;

.field private lineStart:Ljava/lang/String;

.field private promotiongroup:Ljava/lang/String;

.field private pvcsProject:Ljava/lang/String;

.field private pvcsProjects:Ljava/util/Vector;

.field private pvcsbin:Ljava/lang/String;

.field private repository:Ljava/lang/String;

.field private revision:Ljava/lang/String;

.field private updateOnly:Z

.field private userId:Ljava/lang/String;

.field private workspace:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 659
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 660
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsProject:Ljava/lang/String;

    .line 661
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsProjects:Ljava/util/Vector;

    .line 662
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->workspace:Ljava/lang/String;

    .line 663
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->repository:Ljava/lang/String;

    .line 664
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsbin:Ljava/lang/String;

    .line 665
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->force:Ljava/lang/String;

    .line 666
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->promotiongroup:Ljava/lang/String;

    .line 667
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->label:Ljava/lang/String;

    .line 668
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->ignorerc:Z

    .line 669
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->updateOnly:Z

    .line 670
    const-string/jumbo v0, "\"P:"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->lineStart:Ljava/lang/String;

    .line 671
    const-string/jumbo v0, "{0}-arc({1})"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->filenameFormat:Ljava/lang/String;

    .line 672
    return-void
.end method

.method private createFolders(Ljava/io/File;)V
    .locals 11
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x3

    .line 299
    const/4 v2, 0x0

    .line 301
    .local v2, "in":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/FileReader;

    invoke-direct {v8, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 302
    .end local v2    # "in":Ljava/io/BufferedReader;
    .local v3, "in":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v6, Ljava/text/MessageFormat;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getFilenameFormat()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v8}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    .line 303
    .local v6, "mf":Ljava/text/MessageFormat;
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    .line 304
    .local v5, "line":Ljava/lang/String;
    :goto_0
    if-eqz v5, :cond_5

    .line 305
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Considering \""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->log(Ljava/lang/String;I)V

    .line 306
    const-string/jumbo v8, "\"\\"

    invoke-virtual {v5, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_0

    const-string/jumbo v8, "\"/"

    invoke-virtual {v5, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    if-le v8, v10, :cond_4

    const-string/jumbo v8, "\""

    invoke-virtual {v5, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4

    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/Character;->isLetter(C)Z

    move-result v8

    if-eqz v8, :cond_4

    const/4 v8, 0x2

    invoke-virtual {v5, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    const/4 v8, 0x3

    invoke-virtual {v5, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "\\"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 313
    :cond_0
    invoke-virtual {v6, v5}, Ljava/text/MessageFormat;->parse(Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v7

    .line 314
    .local v7, "objs":[Ljava/lang/Object;
    const/4 v8, 0x1

    aget-object v1, v7, v8

    check-cast v1, Ljava/lang/String;

    .line 316
    .local v1, "f":Ljava/lang/String;
    sget-object v8, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v8}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    .line 317
    .local v4, "index":I
    const/4 v8, -0x1

    if-le v4, v8, :cond_3

    .line 318
    new-instance v0, Ljava/io/File;

    const/4 v8, 0x0

    invoke-virtual {v1, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v0, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 319
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_2

    .line 320
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Creating "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->log(Ljava/lang/String;I)V

    .line 322
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 323
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Created "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x2

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->log(Ljava/lang/String;I)V

    .line 341
    .end local v0    # "dir":Ljava/io/File;
    .end local v1    # "f":Ljava/lang/String;
    .end local v4    # "index":I
    .end local v7    # "objs":[Ljava/lang/Object;
    :goto_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_0

    .line 326
    .restart local v0    # "dir":Ljava/io/File;
    .restart local v1    # "f":Ljava/lang/String;
    .restart local v4    # "index":I
    .restart local v7    # "objs":[Ljava/lang/Object;
    :cond_1
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Failed to create "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x2

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->log(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 344
    .end local v0    # "dir":Ljava/io/File;
    .end local v1    # "f":Ljava/lang/String;
    .end local v4    # "index":I
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "mf":Ljava/text/MessageFormat;
    .end local v7    # "objs":[Ljava/lang/Object;
    :catchall_0
    move-exception v8

    move-object v2, v3

    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    :goto_2
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    throw v8

    .line 331
    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v0    # "dir":Ljava/io/File;
    .restart local v1    # "f":Ljava/lang/String;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "index":I
    .restart local v5    # "line":Ljava/lang/String;
    .restart local v6    # "mf":Ljava/text/MessageFormat;
    .restart local v7    # "objs":[Ljava/lang/Object;
    :cond_2
    :try_start_2
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " exists. Skipping"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 335
    .end local v0    # "dir":Ljava/io/File;
    :cond_3
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "File separator problem with "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 339
    .end local v1    # "f":Ljava/lang/String;
    .end local v4    # "index":I
    .end local v7    # "objs":[Ljava/lang/Object;
    :cond_4
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Skipped \""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x3

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->log(Ljava/lang/String;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 344
    :cond_5
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 346
    return-void

    .line 344
    .end local v3    # "in":Ljava/io/BufferedReader;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "mf":Ljava/text/MessageFormat;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v8

    goto :goto_2
.end method

.method private getExecutable(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "exe"    # Ljava/lang/String;

    .prologue
    .line 133
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 134
    .local v0, "correctedExe":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getPvcsbin()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 135
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsbin:Ljava/lang/String;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 136
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsbin:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 141
    :cond_0
    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 138
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsbin:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0
.end method

.method private massagePCLI(Ljava/io/File;Ljava/io/File;)V
    .locals 8
    .param p1, "in"    # Ljava/io/File;
    .param p2, "out"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 356
    const/4 v0, 0x0

    .line 357
    .local v0, "inReader":Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 359
    .local v2, "outWriter":Ljava/io/BufferedWriter;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/FileReader;

    invoke-direct {v6, p1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 360
    .end local v0    # "inReader":Ljava/io/BufferedReader;
    .local v1, "inReader":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v3, Ljava/io/BufferedWriter;

    new-instance v6, Ljava/io/FileWriter;

    invoke-direct {v6, p2}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v6}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 361
    .end local v2    # "outWriter":Ljava/io/BufferedWriter;
    .local v3, "outWriter":Ljava/io/BufferedWriter;
    const/4 v4, 0x0

    .line 362
    .local v4, "s":Ljava/lang/String;
    :goto_0
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 363
    const/16 v6, 0x5c

    const/16 v7, 0x2f

    invoke-virtual {v4, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v5

    .line 364
    .local v5, "sNormal":Ljava/lang/String;
    invoke-virtual {v3, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 365
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 368
    .end local v5    # "sNormal":Ljava/lang/String;
    :catchall_0
    move-exception v6

    move-object v2, v3

    .end local v3    # "outWriter":Ljava/io/BufferedWriter;
    .restart local v2    # "outWriter":Ljava/io/BufferedWriter;
    move-object v0, v1

    .end local v1    # "inReader":Ljava/io/BufferedReader;
    .end local v4    # "s":Ljava/lang/String;
    .restart local v0    # "inReader":Ljava/io/BufferedReader;
    :goto_1
    invoke-static {v0}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 369
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v6

    .line 368
    .end local v0    # "inReader":Ljava/io/BufferedReader;
    .end local v2    # "outWriter":Ljava/io/BufferedWriter;
    .restart local v1    # "inReader":Ljava/io/BufferedReader;
    .restart local v3    # "outWriter":Ljava/io/BufferedWriter;
    .restart local v4    # "s":Ljava/lang/String;
    :cond_0
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Reader;)V

    .line 369
    invoke-static {v3}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 371
    return-void

    .line 368
    .end local v1    # "inReader":Ljava/io/BufferedReader;
    .end local v3    # "outWriter":Ljava/io/BufferedWriter;
    .end local v4    # "s":Ljava/lang/String;
    .restart local v0    # "inReader":Ljava/io/BufferedReader;
    .restart local v2    # "outWriter":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v6

    goto :goto_1

    .end local v0    # "inReader":Ljava/io/BufferedReader;
    .restart local v1    # "inReader":Ljava/io/BufferedReader;
    :catchall_2
    move-exception v6

    move-object v0, v1

    .end local v1    # "inReader":Ljava/io/BufferedReader;
    .restart local v0    # "inReader":Ljava/io/BufferedReader;
    goto :goto_1
.end method


# virtual methods
.method public addPvcsproject(Lorg/apache/tools/ant/taskdefs/optional/pvcs/PvcsProject;)V
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/taskdefs/optional/pvcs/PvcsProject;

    .prologue
    .line 601
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsProjects:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 602
    return-void
.end method

.method public execute()V
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 148
    const/4 v8, 0x0

    .line 150
    .local v8, "result":I
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->repository:Ljava/lang/String;

    if-eqz v14, :cond_0

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->repository:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, ""

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 151
    :cond_0
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v15, "Required argument repository not specified"

    invoke-direct {v14, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 158
    :cond_1
    new-instance v2, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v2}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 159
    .local v2, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    const-string/jumbo v14, "pcli"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v14}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 161
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    const-string/jumbo v15, "lvf"

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 162
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    const-string/jumbo v15, "-z"

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 163
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    const-string/jumbo v15, "-aw"

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 164
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getWorkspace()Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_2

    .line 165
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "-sp"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getWorkspace()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 167
    :cond_2
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "-pr"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getRepository()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 169
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getUserId()Ljava/lang/String;

    move-result-object v13

    .line 171
    .local v13, "uid":Ljava/lang/String;
    if-eqz v13, :cond_3

    .line 172
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "-id"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 176
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getPvcsproject()Ljava/lang/String;

    move-result-object v14

    if-nez v14, :cond_4

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getPvcsprojects()Ljava/util/Vector;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/Vector;->isEmpty()Z

    move-result v14

    if-eqz v14, :cond_4

    .line 177
    const-string/jumbo v14, "/"

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsProject:Ljava/lang/String;

    .line 180
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getPvcsproject()Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_5

    .line 181
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getPvcsproject()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 183
    :cond_5
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getPvcsprojects()Ljava/util/Vector;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/Vector;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_8

    .line 184
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getPvcsprojects()Ljava/util/Vector;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v3

    .line 185
    .local v3, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v14

    if-eqz v14, :cond_8

    .line 186
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lorg/apache/tools/ant/taskdefs/optional/pvcs/PvcsProject;

    invoke-virtual {v14}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/PvcsProject;->getName()Ljava/lang/String;

    move-result-object v6

    .line 187
    .local v6, "projectName":Ljava/lang/String;
    if-eqz v6, :cond_6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, ""

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_7

    .line 188
    :cond_6
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v15, "name is a required attribute of pvcsproject"

    invoke-direct {v14, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 191
    :cond_7
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    invoke-virtual {v14, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0

    .line 195
    .end local v3    # "e":Ljava/util/Enumeration;
    .end local v6    # "projectName":Ljava/lang/String;
    :cond_8
    const/4 v9, 0x0

    .line 196
    .local v9, "tmp":Ljava/io/File;
    const/4 v11, 0x0

    .line 198
    .local v11, "tmp2":Ljava/io/File;
    :try_start_0
    new-instance v7, Ljava/util/Random;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    invoke-direct {v7, v14, v15}, Ljava/util/Random;-><init>(J)V

    .line 199
    .local v7, "rand":Ljava/util/Random;
    new-instance v10, Ljava/io/File;

    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v15, "pvcs_ant_"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v7}, Ljava/util/Random;->nextLong()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string/jumbo v15, ".log"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v10, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 200
    .end local v9    # "tmp":Ljava/io/File;
    .local v10, "tmp":Ljava/io/File;
    :try_start_1
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 201
    .local v4, "fos":Ljava/io/FileOutputStream;
    new-instance v12, Ljava/io/File;

    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v15, "pvcs_ant_"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v7}, Ljava/util/Random;->nextLong()J

    move-result-wide v16

    move-wide/from16 v0, v16

    invoke-virtual {v14, v0, v1}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string/jumbo v15, ".log"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v12, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_8
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 202
    .end local v11    # "tmp2":Ljava/io/File;
    .local v12, "tmp2":Ljava/io/File;
    :try_start_2
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->describeCommand()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->log(Ljava/lang/String;I)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 204
    :try_start_3
    new-instance v14, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;

    new-instance v15, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    const/16 v16, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v15, v0, v1}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/Task;I)V

    invoke-direct {v14, v4, v15}, Lorg/apache/tools/ant/taskdefs/PumpStreamHandler;-><init>(Ljava/io/OutputStream;Ljava/io/OutputStream;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v14}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->runCmd(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-result v8

    .line 209
    :try_start_4
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 212
    invoke-static {v8}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v14

    if-eqz v14, :cond_b

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->ignorerc:Z

    if-nez v14, :cond_b

    .line 213
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v15, "Failed executing: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 214
    .local v5, "msg":Ljava/lang/String;
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v15

    invoke-direct {v14, v5, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v14
    :try_end_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/text/ParseException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 273
    .end local v5    # "msg":Ljava/lang/String;
    :catch_0
    move-exception v3

    move-object v11, v12

    .end local v12    # "tmp2":Ljava/io/File;
    .restart local v11    # "tmp2":Ljava/io/File;
    move-object v9, v10

    .line 274
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v7    # "rand":Ljava/util/Random;
    .end local v10    # "tmp":Ljava/io/File;
    .local v3, "e":Ljava/io/FileNotFoundException;
    .restart local v9    # "tmp":Ljava/io/File;
    :goto_1
    :try_start_5
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v15, "Failed executing: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string/jumbo v15, ". Exception: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v3}, Ljava/io/FileNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 276
    .restart local v5    # "msg":Ljava/lang/String;
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v15

    invoke-direct {v14, v5, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v14
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 286
    .end local v3    # "e":Ljava/io/FileNotFoundException;
    .end local v5    # "msg":Ljava/lang/String;
    :catchall_0
    move-exception v14

    :goto_2
    if-eqz v9, :cond_9

    .line 287
    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 289
    :cond_9
    if-eqz v11, :cond_a

    .line 290
    invoke-virtual {v11}, Ljava/io/File;->delete()Z

    .line 286
    :cond_a
    throw v14

    .line 209
    .end local v9    # "tmp":Ljava/io/File;
    .end local v11    # "tmp2":Ljava/io/File;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "rand":Ljava/util/Random;
    .restart local v10    # "tmp":Ljava/io/File;
    .restart local v12    # "tmp2":Ljava/io/File;
    :catchall_1
    move-exception v14

    :try_start_6
    invoke-static {v4}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v14
    :try_end_6
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/text/ParseException; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 277
    :catch_1
    move-exception v3

    move-object v11, v12

    .end local v12    # "tmp2":Ljava/io/File;
    .restart local v11    # "tmp2":Ljava/io/File;
    move-object v9, v10

    .line 278
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v7    # "rand":Ljava/util/Random;
    .end local v10    # "tmp":Ljava/io/File;
    .local v3, "e":Ljava/io/IOException;
    .restart local v9    # "tmp":Ljava/io/File;
    :goto_3
    :try_start_7
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v15, "Failed executing: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string/jumbo v15, ". Exception: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 280
    .restart local v5    # "msg":Ljava/lang/String;
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v15

    invoke-direct {v14, v5, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v14
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 217
    .end local v3    # "e":Ljava/io/IOException;
    .end local v5    # "msg":Ljava/lang/String;
    .end local v9    # "tmp":Ljava/io/File;
    .end local v11    # "tmp2":Ljava/io/File;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "rand":Ljava/util/Random;
    .restart local v10    # "tmp":Ljava/io/File;
    .restart local v12    # "tmp2":Ljava/io/File;
    :cond_b
    :try_start_8
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_c

    .line 218
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v15, "Communication between ant and pvcs failed. No output generated from executing PVCS commandline interface \"pcli\" and \"get\""

    invoke-direct {v14, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v14
    :try_end_8
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_8} :catch_0
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/text/ParseException; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 281
    :catch_2
    move-exception v3

    move-object v11, v12

    .end local v12    # "tmp2":Ljava/io/File;
    .restart local v11    # "tmp2":Ljava/io/File;
    move-object v9, v10

    .line 282
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v7    # "rand":Ljava/util/Random;
    .end local v10    # "tmp":Ljava/io/File;
    .local v3, "e":Ljava/text/ParseException;
    .restart local v9    # "tmp":Ljava/io/File;
    :goto_4
    :try_start_9
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v15, "Failed executing: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string/jumbo v15, ". Exception: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v3}, Ljava/text/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 284
    .restart local v5    # "msg":Ljava/lang/String;
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v15

    invoke-direct {v14, v5, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v14
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 224
    .end local v3    # "e":Ljava/text/ParseException;
    .end local v5    # "msg":Ljava/lang/String;
    .end local v9    # "tmp":Ljava/io/File;
    .end local v11    # "tmp2":Ljava/io/File;
    .restart local v4    # "fos":Ljava/io/FileOutputStream;
    .restart local v7    # "rand":Ljava/util/Random;
    .restart local v10    # "tmp":Ljava/io/File;
    .restart local v12    # "tmp2":Ljava/io/File;
    :cond_c
    :try_start_a
    const-string/jumbo v14, "Creating folders"

    const/4 v15, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->log(Ljava/lang/String;I)V

    .line 225
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->createFolders(Ljava/io/File;)V

    .line 228
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v12}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->massagePCLI(Ljava/io/File;Ljava/io/File;)V

    .line 231
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->clearArgs()V

    .line 232
    const-string/jumbo v14, "get"

    move-object/from16 v0, p0

    invoke-direct {v0, v14}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v2, v14}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 234
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getConfig()Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_d

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getConfig()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    if-lez v14, :cond_d

    .line 235
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "-c"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getConfig()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 238
    :cond_d
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getForce()Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_10

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getForce()Ljava/lang/String;

    move-result-object v14

    const-string/jumbo v15, "yes"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_10

    .line 239
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    const-string/jumbo v15, "-Y"

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 244
    :goto_5
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getPromotiongroup()Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_11

    .line 245
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "-G"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getPromotiongroup()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 258
    :cond_e
    :goto_6
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->updateOnly:Z

    if-eqz v14, :cond_f

    .line 259
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    const-string/jumbo v15, "-U"

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 262
    :cond_f
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "@"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 263
    const-string/jumbo v14, "Getting files"

    const/4 v15, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->log(Ljava/lang/String;I)V

    .line 264
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v15, "Executing "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->log(Ljava/lang/String;I)V

    .line 265
    new-instance v14, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    const/4 v15, 0x2

    const/16 v16, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v16

    invoke-direct {v14, v0, v15, v1}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v14}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->runCmd(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)I

    move-result v8

    .line 267
    if-eqz v8, :cond_13

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->ignorerc:Z

    if-nez v14, :cond_13

    .line 268
    new-instance v14, Ljava/lang/StringBuffer;

    invoke-direct {v14}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v15, "Failed executing: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    const-string/jumbo v15, ". Return code was "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 270
    .restart local v5    # "msg":Ljava/lang/String;
    new-instance v14, Lorg/apache/tools/ant/BuildException;

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v15

    invoke-direct {v14, v5, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v14

    .line 286
    .end local v5    # "msg":Ljava/lang/String;
    :catchall_2
    move-exception v14

    move-object v11, v12

    .end local v12    # "tmp2":Ljava/io/File;
    .restart local v11    # "tmp2":Ljava/io/File;
    move-object v9, v10

    .end local v10    # "tmp":Ljava/io/File;
    .restart local v9    # "tmp":Ljava/io/File;
    goto/16 :goto_2

    .line 241
    .end local v9    # "tmp":Ljava/io/File;
    .end local v11    # "tmp2":Ljava/io/File;
    .restart local v10    # "tmp":Ljava/io/File;
    .restart local v12    # "tmp2":Ljava/io/File;
    :cond_10
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    const-string/jumbo v15, "-N"

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 248
    :cond_11
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getLabel()Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_12

    .line 249
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "-v"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getLabel()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 251
    :cond_12
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getRevision()Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_e

    .line 252
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuffer;

    invoke-direct {v15}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v16, "-r"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getRevision()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V
    :try_end_a
    .catch Ljava/io/FileNotFoundException; {:try_start_a .. :try_end_a} :catch_0
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/text/ParseException; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    goto/16 :goto_6

    .line 286
    :cond_13
    if-eqz v10, :cond_14

    .line 287
    invoke-virtual {v10}, Ljava/io/File;->delete()Z

    .line 289
    :cond_14
    if-eqz v12, :cond_15

    .line 290
    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    .line 293
    :cond_15
    return-void

    .line 286
    .end local v4    # "fos":Ljava/io/FileOutputStream;
    .end local v12    # "tmp2":Ljava/io/File;
    .restart local v11    # "tmp2":Ljava/io/File;
    :catchall_3
    move-exception v14

    move-object v9, v10

    .end local v10    # "tmp":Ljava/io/File;
    .restart local v9    # "tmp":Ljava/io/File;
    goto/16 :goto_2

    .line 281
    .end local v7    # "rand":Ljava/util/Random;
    :catch_3
    move-exception v3

    goto/16 :goto_4

    .end local v9    # "tmp":Ljava/io/File;
    .restart local v7    # "rand":Ljava/util/Random;
    .restart local v10    # "tmp":Ljava/io/File;
    :catch_4
    move-exception v3

    move-object v9, v10

    .end local v10    # "tmp":Ljava/io/File;
    .restart local v9    # "tmp":Ljava/io/File;
    goto/16 :goto_4

    .line 277
    .end local v7    # "rand":Ljava/util/Random;
    :catch_5
    move-exception v3

    goto/16 :goto_3

    .end local v9    # "tmp":Ljava/io/File;
    .restart local v7    # "rand":Ljava/util/Random;
    .restart local v10    # "tmp":Ljava/io/File;
    :catch_6
    move-exception v3

    move-object v9, v10

    .end local v10    # "tmp":Ljava/io/File;
    .restart local v9    # "tmp":Ljava/io/File;
    goto/16 :goto_3

    .line 273
    .end local v7    # "rand":Ljava/util/Random;
    :catch_7
    move-exception v3

    goto/16 :goto_1

    .end local v9    # "tmp":Ljava/io/File;
    .restart local v7    # "rand":Ljava/util/Random;
    .restart local v10    # "tmp":Ljava/io/File;
    :catch_8
    move-exception v3

    move-object v9, v10

    .end local v10    # "tmp":Ljava/io/File;
    .restart local v9    # "tmp":Ljava/io/File;
    goto/16 :goto_1
.end method

.method public getConfig()Ljava/lang/String;
    .locals 1

    .prologue
    .line 626
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->config:Ljava/lang/String;

    return-object v0
.end method

.method public getFilenameFormat()Ljava/lang/String;
    .locals 1

    .prologue
    .line 389
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->filenameFormat:Ljava/lang/String;

    return-object v0
.end method

.method public getForce()Ljava/lang/String;
    .locals 1

    .prologue
    .line 511
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->force:Ljava/lang/String;

    return-object v0
.end method

.method public getIgnoreReturnCode()Z
    .locals 1

    .prologue
    .line 584
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->ignorerc:Z

    return v0
.end method

.method public getLabel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 552
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->label:Ljava/lang/String;

    return-object v0
.end method

.method public getLineStart()Ljava/lang/String;
    .locals 1

    .prologue
    .line 414
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->lineStart:Ljava/lang/String;

    return-object v0
.end method

.method public getPromotiongroup()Ljava/lang/String;
    .locals 1

    .prologue
    .line 536
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->promotiongroup:Ljava/lang/String;

    return-object v0
.end method

.method public getPvcsbin()Ljava/lang/String;
    .locals 1

    .prologue
    .line 489
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsbin:Ljava/lang/String;

    return-object v0
.end method

.method public getPvcsproject()Ljava/lang/String;
    .locals 1

    .prologue
    .line 443
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsProject:Ljava/lang/String;

    return-object v0
.end method

.method public getPvcsprojects()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 460
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsProjects:Ljava/util/Vector;

    return-object v0
.end method

.method public getRepository()Ljava/lang/String;
    .locals 1

    .prologue
    .line 378
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->repository:Ljava/lang/String;

    return-object v0
.end method

.method public getRevision()Ljava/lang/String;
    .locals 1

    .prologue
    .line 568
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->revision:Ljava/lang/String;

    return-object v0
.end method

.method public getUpdateOnly()Z
    .locals 1

    .prologue
    .line 609
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->updateOnly:Z

    return v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 644
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->userId:Ljava/lang/String;

    return-object v0
.end method

.method public getWorkspace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 468
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->workspace:Ljava/lang/String;

    return-object v0
.end method

.method protected runCmd(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)I
    .locals 6
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "out"    # Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;

    .prologue
    .line 119
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 120
    .local v0, "aProj":Lorg/apache/tools/ant/Project;
    new-instance v2, Lorg/apache/tools/ant/taskdefs/Execute;

    invoke-direct {v2, p2}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 121
    .local v2, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 122
    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 123
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 124
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    return v4

    .line 125
    .end local v0    # "aProj":Lorg/apache/tools/ant/Project;
    .end local v2    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    :catch_0
    move-exception v1

    .line 126
    .local v1, "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Failed executing: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, ". Exception: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 128
    .local v3, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4
.end method

.method public setConfig(Ljava/io/File;)V
    .locals 1
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 635
    invoke-virtual {p1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->config:Ljava/lang/String;

    .line 636
    return-void
.end method

.method public setFilenameFormat(Ljava/lang/String;)V
    .locals 0
    .param p1, "f"    # Ljava/lang/String;

    .prologue
    .line 401
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->filenameFormat:Ljava/lang/String;

    .line 402
    return-void
.end method

.method public setForce(Ljava/lang/String;)V
    .locals 1
    .param p1, "f"    # Ljava/lang/String;

    .prologue
    .line 524
    if-eqz p1, :cond_0

    const-string/jumbo v0, "yes"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 525
    const-string/jumbo v0, "yes"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->force:Ljava/lang/String;

    .line 529
    :goto_0
    return-void

    .line 527
    :cond_0
    const-string/jumbo v0, "no"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->force:Ljava/lang/String;

    goto :goto_0
.end method

.method public setIgnoreReturnCode(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 593
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->ignorerc:Z

    .line 594
    return-void
.end method

.method public setLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "l"    # Ljava/lang/String;

    .prologue
    .line 560
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->label:Ljava/lang/String;

    .line 561
    return-void
.end method

.method public setLineStart(Ljava/lang/String;)V
    .locals 0
    .param p1, "l"    # Ljava/lang/String;

    .prologue
    .line 427
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->lineStart:Ljava/lang/String;

    .line 428
    return-void
.end method

.method public setPromotiongroup(Ljava/lang/String;)V
    .locals 0
    .param p1, "w"    # Ljava/lang/String;

    .prologue
    .line 544
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->promotiongroup:Ljava/lang/String;

    .line 545
    return-void
.end method

.method public setPvcsbin(Ljava/lang/String;)V
    .locals 0
    .param p1, "bin"    # Ljava/lang/String;

    .prologue
    .line 503
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsbin:Ljava/lang/String;

    .line 504
    return-void
.end method

.method public setPvcsproject(Ljava/lang/String;)V
    .locals 0
    .param p1, "prj"    # Ljava/lang/String;

    .prologue
    .line 452
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->pvcsProject:Ljava/lang/String;

    .line 453
    return-void
.end method

.method public setRepository(Ljava/lang/String;)V
    .locals 0
    .param p1, "repo"    # Ljava/lang/String;

    .prologue
    .line 435
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->repository:Ljava/lang/String;

    .line 436
    return-void
.end method

.method public setRevision(Ljava/lang/String;)V
    .locals 0
    .param p1, "r"    # Ljava/lang/String;

    .prologue
    .line 576
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->revision:Ljava/lang/String;

    .line 577
    return-void
.end method

.method public setUpdateOnly(Z)V
    .locals 0
    .param p1, "l"    # Z

    .prologue
    .line 618
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->updateOnly:Z

    .line 619
    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .locals 0
    .param p1, "u"    # Ljava/lang/String;

    .prologue
    .line 652
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->userId:Ljava/lang/String;

    .line 653
    return-void
.end method

.method public setWorkspace(Ljava/lang/String;)V
    .locals 0
    .param p1, "ws"    # Ljava/lang/String;

    .prologue
    .line 481
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/pvcs/Pvcs;->workspace:Ljava/lang/String;

    .line 482
    return-void
.end method
