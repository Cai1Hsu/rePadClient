.class public Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;
.super Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;
.source "ChangeLogTask.java"


# instance fields
.field private cvsUsers:Ljava/util/Vector;

.field private destFile:Ljava/io/File;

.field private endDate:Ljava/util/Date;

.field private endTag:Ljava/lang/String;

.field private final filesets:Ljava/util/Vector;

.field private inputDir:Ljava/io/File;

.field private remote:Z

.field private startDate:Ljava/util/Date;

.field private startTag:Ljava/lang/String;

.field private usersFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 79
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;-><init>()V

    .line 84
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->cvsUsers:Ljava/util/Vector;

    .line 99
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->remote:Z

    .line 112
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->filesets:Ljava/util/Vector;

    return-void
.end method

.method private filterEntrySet([Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;)[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    .locals 6
    .param p1, "entrySet"    # [Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;

    .prologue
    .line 402
    new-instance v4, Ljava/util/Vector;

    invoke-direct {v4}, Ljava/util/Vector;-><init>()V

    .line 404
    .local v4, "results":Ljava/util/Vector;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v5, p1

    if-ge v2, v5, :cond_4

    .line 405
    aget-object v0, p1, v2

    .line 406
    .local v0, "cvsEntry":Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->getDate()Ljava/util/Date;

    move-result-object v1

    .line 421
    .local v1, "date":Ljava/util/Date;
    if-nez v1, :cond_1

    .line 404
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 425
    :cond_1
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->startDate:Ljava/util/Date;

    if-eqz v5, :cond_2

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->startDate:Ljava/util/Date;

    invoke-virtual {v5, v1}, Ljava/util/Date;->after(Ljava/util/Date;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 429
    :cond_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->endDate:Ljava/util/Date;

    if-eqz v5, :cond_3

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->endDate:Ljava/util/Date;

    invoke-virtual {v5, v1}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 433
    :cond_3
    invoke-virtual {v4, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1

    .line 436
    .end local v0    # "cvsEntry":Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    .end local v1    # "date":Ljava/util/Date;
    :cond_4
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v5

    new-array v3, v5, [Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;

    .line 438
    .local v3, "resultArray":[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    invoke-virtual {v4, v3}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 439
    return-object v3
.end method

.method private loadUserlist(Ljava/util/Properties;)V
    .locals 3
    .param p1, "userList"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 386
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->usersFile:Ljava/io/File;

    if-eqz v1, :cond_0

    .line 388
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->usersFile:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {p1, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 393
    :cond_0
    return-void

    .line 389
    :catch_0
    move-exception v0

    .line 390
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private replaceAuthorIdWithName(Ljava/util/Properties;[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;)V
    .locals 3
    .param p1, "userList"    # Ljava/util/Properties;
    .param p2, "entrySet"    # [Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;

    .prologue
    .line 447
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_1

    .line 449
    aget-object v0, p2, v1

    .line 450
    .local v0, "entry":Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->getAuthor()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/Properties;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 451
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->getAuthor()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;->setAuthor(Ljava/lang/String;)V

    .line 447
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 454
    .end local v0    # "entry":Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    :cond_1
    return-void
.end method

.method private validate()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 349
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->inputDir:Ljava/io/File;

    if-nez v1, :cond_0

    .line 350
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->inputDir:Ljava/io/File;

    .line 352
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->destFile:Ljava/io/File;

    if-nez v1, :cond_1

    .line 353
    const-string/jumbo v0, "Destfile must be set."

    .line 355
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Destfile must be set."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 357
    .end local v0    # "message":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->inputDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 358
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Cannot find base dir "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->inputDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 361
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 363
    .end local v0    # "message":Ljava/lang/String;
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->usersFile:Ljava/io/File;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->usersFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_3

    .line 364
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Cannot find user lookup list "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->usersFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 367
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 369
    .end local v0    # "message":Ljava/lang/String;
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->startTag:Ljava/lang/String;

    if-nez v1, :cond_4

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->endTag:Ljava/lang/String;

    if-eqz v1, :cond_6

    :cond_4
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->startDate:Ljava/util/Date;

    if-nez v1, :cond_5

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->endDate:Ljava/util/Date;

    if-eqz v1, :cond_6

    .line 371
    :cond_5
    const-string/jumbo v0, "Specify either a tag or date range, not both"

    .line 373
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Specify either a tag or date range, not both"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 375
    .end local v0    # "message":Ljava/lang/String;
    :cond_6
    return-void
.end method

.method private writeChangeLog([Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;)V
    .locals 9
    .param p1, "entrySet"    # [Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 464
    const/4 v1, 0x0

    .line 467
    .local v1, "output":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->destFile:Ljava/io/File;

    invoke-direct {v2, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 469
    .end local v1    # "output":Ljava/io/FileOutputStream;
    .local v2, "output":Ljava/io/FileOutputStream;
    :try_start_1
    new-instance v5, Ljava/io/PrintWriter;

    new-instance v6, Ljava/io/OutputStreamWriter;

    const-string/jumbo v7, "UTF-8"

    invoke-direct {v6, v2, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v5, v6}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 472
    .local v5, "writer":Ljava/io/PrintWriter;
    new-instance v3, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;

    invoke-direct {v3}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;-><init>()V

    .line 474
    .local v3, "serializer":Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;
    invoke-virtual {v3, v5, p1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;->printChangeLog(Ljava/io/PrintWriter;[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;)V

    .line 476
    invoke-virtual {v5}, Ljava/io/PrintWriter;->checkError()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 477
    new-instance v6, Ljava/io/IOException;

    const-string/jumbo v7, "Encountered an error writing changelog"

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 479
    .end local v3    # "serializer":Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;
    .end local v5    # "writer":Ljava/io/PrintWriter;
    :catch_0
    move-exception v4

    move-object v1, v2

    .line 480
    .end local v2    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "output":Ljava/io/FileOutputStream;
    .local v4, "uee":Ljava/io/UnsupportedEncodingException;
    :goto_0
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    invoke-virtual {v4}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 484
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 486
    .end local v4    # "uee":Ljava/io/UnsupportedEncodingException;
    :goto_1
    return-void

    .line 484
    .end local v1    # "output":Ljava/io/FileOutputStream;
    .restart local v2    # "output":Ljava/io/FileOutputStream;
    .restart local v3    # "serializer":Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;
    .restart local v5    # "writer":Ljava/io/PrintWriter;
    :cond_0
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    move-object v1, v2

    .line 485
    .end local v2    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "output":Ljava/io/FileOutputStream;
    goto :goto_1

    .line 481
    .end local v3    # "serializer":Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogWriter;
    .end local v5    # "writer":Ljava/io/PrintWriter;
    :catch_1
    move-exception v0

    .line 482
    .local v0, "ioe":Ljava/io/IOException;
    :goto_2
    :try_start_3
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 484
    .end local v0    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v6

    :goto_3
    invoke-static {v1}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v6

    .end local v1    # "output":Ljava/io/FileOutputStream;
    .restart local v2    # "output":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v6

    move-object v1, v2

    .end local v2    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "output":Ljava/io/FileOutputStream;
    goto :goto_3

    .line 481
    .end local v1    # "output":Ljava/io/FileOutputStream;
    .restart local v2    # "output":Ljava/io/FileOutputStream;
    :catch_2
    move-exception v0

    move-object v1, v2

    .end local v2    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "output":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 479
    :catch_3
    move-exception v4

    goto :goto_0
.end method


# virtual methods
.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "fileSet"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 224
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->filesets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 225
    return-void
.end method

.method public addUser(Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;)V
    .locals 1
    .param p1, "user"    # Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;

    .prologue
    .line 151
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->cvsUsers:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 152
    return-void
.end method

.method public execute()V
    .locals 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 235
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->inputDir:Ljava/io/File;

    move-object/from16 v16, v0

    .line 239
    .local v16, "savedDir":Ljava/io/File;
    :try_start_0
    invoke-direct/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->validate()V

    .line 240
    new-instance v21, Ljava/util/Properties;

    invoke-direct/range {v21 .. v21}, Ljava/util/Properties;-><init>()V

    .line 242
    .local v21, "userList":Ljava/util/Properties;
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->loadUserlist(Ljava/util/Properties;)V

    .line 244
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->cvsUsers:Ljava/util/Vector;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/util/Vector;->size()I

    move-result v18

    .line 245
    .local v18, "size":I
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_0
    move/from16 v0, v18

    if-ge v12, v0, :cond_0

    .line 246
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->cvsUsers:Ljava/util/Vector;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v0, v12}, Ljava/util/Vector;->get(I)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;

    .line 247
    .local v20, "user":Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;
    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;->validate()V

    .line 248
    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;->getUserID()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v20 .. v20}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;->getDisplayname()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v21 .. v23}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 245
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    .line 251
    .end local v20    # "user":Lorg/apache/tools/ant/taskdefs/cvslib/CvsUser;
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->remote:Z

    move/from16 v22, v0

    if-nez v22, :cond_5

    .line 252
    const-string/jumbo v22, "log"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->setCommand(Ljava/lang/String;)V

    .line 254
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->getTag()Ljava/lang/String;

    move-result-object v22

    if-eqz v22, :cond_1

    .line 255
    new-instance v13, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;

    invoke-direct {v13}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;-><init>()V

    .line 256
    .local v13, "myCvsVersion":Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 257
    const-string/jumbo v22, "cvsversion"

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->setTaskName(Ljava/lang/String;)V

    .line 258
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->getCvsRoot()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->setCvsRoot(Ljava/lang/String;)V

    .line 259
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->getCvsRsh()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->setCvsRsh(Ljava/lang/String;)V

    .line 260
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->getPassFile()Ljava/io/File;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->setPassfile(Ljava/io/File;)V

    .line 261
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->inputDir:Ljava/io/File;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-virtual {v13, v0}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->setDest(Ljava/io/File;)V

    .line 262
    invoke-virtual {v13}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->execute()V

    .line 263
    invoke-virtual {v13}, Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;->supportsCvsLogWithSOption()Z

    move-result v22

    if-eqz v22, :cond_1

    .line 264
    const-string/jumbo v22, "-S"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->addCommandArgument(Ljava/lang/String;)V

    .line 278
    .end local v13    # "myCvsVersion":Lorg/apache/tools/ant/taskdefs/cvslib/CvsVersion;
    :cond_1
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->startTag:Ljava/lang/String;

    move-object/from16 v22, v0

    if-nez v22, :cond_2

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->endTag:Ljava/lang/String;

    move-object/from16 v22, v0

    if-eqz v22, :cond_8

    .line 280
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->startTag:Ljava/lang/String;

    move-object/from16 v22, v0

    if-nez v22, :cond_6

    const-string/jumbo v19, ""

    .line 281
    .local v19, "startValue":Ljava/lang/String;
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->endTag:Ljava/lang/String;

    move-object/from16 v22, v0

    if-nez v22, :cond_7

    const-string/jumbo v5, ""

    .line 282
    .local v5, "endValue":Ljava/lang/String;
    :goto_3
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v23, "-r"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    const-string/jumbo v23, "::"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->addCommandArgument(Ljava/lang/String;)V

    .line 296
    .end local v5    # "endValue":Ljava/lang/String;
    .end local v19    # "startValue":Ljava/lang/String;
    :cond_3
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->filesets:Ljava/util/Vector;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/util/Vector;->isEmpty()Z

    move-result v22

    if-nez v22, :cond_9

    .line 297
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->filesets:Ljava/util/Vector;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v4

    .line 299
    .local v4, "e":Ljava/util/Enumeration;
    :cond_4
    invoke-interface {v4}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v22

    if-eqz v22, :cond_9

    .line 300
    invoke-interface {v4}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/tools/ant/types/FileSet;

    .line 301
    .local v8, "fileSet":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v8, v0}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v17

    .line 303
    .local v17, "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual/range {v17 .. v17}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v9

    .line 305
    .local v9, "files":[Ljava/lang/String;
    const/4 v12, 0x0

    :goto_5
    array-length v0, v9

    move/from16 v22, v0

    move/from16 v0, v22

    if-ge v12, v0, :cond_4

    .line 306
    aget-object v22, v9, v12

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->addCommandArgument(Ljava/lang/String;)V

    .line 305
    add-int/lit8 v12, v12, 0x1

    goto :goto_5

    .line 269
    .end local v4    # "e":Ljava/util/Enumeration;
    .end local v8    # "fileSet":Lorg/apache/tools/ant/types/FileSet;
    .end local v9    # "files":[Ljava/lang/String;
    .end local v17    # "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    :cond_5
    const-string/jumbo v22, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->setCommand(Ljava/lang/String;)V

    .line 270
    const-string/jumbo v22, "rlog"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->addCommandArgument(Ljava/lang/String;)V

    .line 273
    const-string/jumbo v22, "-S"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->addCommandArgument(Ljava/lang/String;)V

    .line 276
    const-string/jumbo v22, "-N"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->addCommandArgument(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_1

    .line 338
    .end local v12    # "i":I
    .end local v18    # "size":I
    .end local v21    # "userList":Ljava/util/Properties;
    :catchall_0
    move-exception v22

    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->inputDir:Ljava/io/File;

    throw v22

    .line 280
    .restart local v12    # "i":I
    .restart local v18    # "size":I
    .restart local v21    # "userList":Ljava/util/Properties;
    :cond_6
    :try_start_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->startTag:Ljava/lang/String;

    move-object/from16 v19, v0

    goto/16 :goto_2

    .line 281
    .restart local v19    # "startValue":Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p0

    iget-object v5, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->endTag:Ljava/lang/String;

    goto/16 :goto_3

    .line 283
    .end local v19    # "startValue":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->startDate:Ljava/util/Date;

    move-object/from16 v22, v0

    if-eqz v22, :cond_3

    .line 284
    new-instance v14, Ljava/text/SimpleDateFormat;

    const-string/jumbo v22, "yyyy-MM-dd"

    move-object/from16 v0, v22

    invoke-direct {v14, v0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 288
    .local v14, "outputDate":Ljava/text/SimpleDateFormat;
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v23, ">="

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->startDate:Ljava/util/Date;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-virtual {v14, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 291
    .local v3, "dateRange":Ljava/lang/String;
    const-string/jumbo v22, "-d"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->addCommandArgument(Ljava/lang/String;)V

    .line 292
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->addCommandArgument(Ljava/lang/String;)V

    goto/16 :goto_4

    .line 311
    .end local v3    # "dateRange":Ljava/lang/String;
    .end local v14    # "outputDate":Ljava/text/SimpleDateFormat;
    :cond_9
    new-instance v15, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->remote:Z

    move/from16 v22, v0

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->getPackage()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->getModules()Ljava/util/List;

    move-result-object v24

    move/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v15, v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;-><init>(ZLjava/lang/String;Ljava/util/List;)V

    .line 314
    .local v15, "parser":Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;
    new-instance v11, Lorg/apache/tools/ant/taskdefs/cvslib/RedirectingStreamHandler;

    invoke-direct {v11, v15}, Lorg/apache/tools/ant/taskdefs/cvslib/RedirectingStreamHandler;-><init>(Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;)V

    .line 317
    .local v11, "handler":Lorg/apache/tools/ant/taskdefs/cvslib/RedirectingStreamHandler;
    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->getCommand()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->log(Ljava/lang/String;I)V

    .line 319
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->inputDir:Ljava/io/File;

    move-object/from16 v22, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->setDest(Ljava/io/File;)V

    .line 320
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->setExecuteStreamHandler(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 322
    :try_start_2
    invoke-super/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/AbstractCvsTask;->execute()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 324
    :try_start_3
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/cvslib/RedirectingStreamHandler;->getErrors()Ljava/lang/String;

    move-result-object v7

    .line 326
    .local v7, "errors":Ljava/lang/String;
    if-eqz v7, :cond_a

    .line 327
    const/16 v22, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v22

    invoke-virtual {v0, v7, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->log(Ljava/lang/String;I)V

    .line 330
    :cond_a
    invoke-virtual {v15}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogParser;->getEntrySetAsArray()[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;

    move-result-object v6

    .line 331
    .local v6, "entrySet":[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    move-object/from16 v0, p0

    invoke-direct {v0, v6}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->filterEntrySet([Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;)[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;

    move-result-object v10

    .line 333
    .local v10, "filteredEntrySet":[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1, v10}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->replaceAuthorIdWithName(Ljava/util/Properties;[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;)V

    .line 335
    move-object/from16 v0, p0

    invoke-direct {v0, v10}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->writeChangeLog([Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 338
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->inputDir:Ljava/io/File;

    .line 340
    return-void

    .line 324
    .end local v6    # "entrySet":[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    .end local v7    # "errors":Ljava/lang/String;
    .end local v10    # "filteredEntrySet":[Lorg/apache/tools/ant/taskdefs/cvslib/CVSEntry;
    :catchall_1
    move-exception v22

    :try_start_4
    invoke-virtual {v11}, Lorg/apache/tools/ant/taskdefs/cvslib/RedirectingStreamHandler;->getErrors()Ljava/lang/String;

    move-result-object v7

    .line 326
    .restart local v7    # "errors":Ljava/lang/String;
    if-eqz v7, :cond_b

    .line 327
    const/16 v23, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-virtual {v0, v7, v1}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->log(Ljava/lang/String;I)V

    .line 324
    :cond_b
    throw v22
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method public setDaysinpast(I)V
    .locals 10
    .param p1, "days"    # I

    .prologue
    const-wide/16 v8, 0x3c

    .line 182
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    int-to-long v4, p1

    const-wide/16 v6, 0x18

    mul-long/2addr v4, v6

    mul-long/2addr v4, v8

    mul-long/2addr v4, v8

    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    sub-long v0, v2, v4

    .line 186
    .local v0, "time":J
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, v0, v1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->setStart(Ljava/util/Date;)V

    .line 187
    return-void
.end method

.method public setDestfile(Ljava/io/File;)V
    .locals 0
    .param p1, "destFile"    # Ljava/io/File;

    .prologue
    .line 131
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->destFile:Ljava/io/File;

    .line 132
    return-void
.end method

.method public setDir(Ljava/io/File;)V
    .locals 0
    .param p1, "inputDir"    # Ljava/io/File;

    .prologue
    .line 121
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->inputDir:Ljava/io/File;

    .line 122
    return-void
.end method

.method public setEnd(Ljava/util/Date;)V
    .locals 0
    .param p1, "endDate"    # Ljava/util/Date;

    .prologue
    .line 171
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->endDate:Ljava/util/Date;

    .line 172
    return-void
.end method

.method public setEndTag(Ljava/lang/String;)V
    .locals 0
    .param p1, "end"    # Ljava/lang/String;

    .prologue
    .line 215
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->endTag:Ljava/lang/String;

    .line 216
    return-void
.end method

.method public setRemote(Z)V
    .locals 0
    .param p1, "remote"    # Z

    .prologue
    .line 196
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->remote:Z

    .line 197
    return-void
.end method

.method public setStart(Ljava/util/Date;)V
    .locals 0
    .param p1, "start"    # Ljava/util/Date;

    .prologue
    .line 161
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->startDate:Ljava/util/Date;

    .line 162
    return-void
.end method

.method public setStartTag(Ljava/lang/String;)V
    .locals 0
    .param p1, "start"    # Ljava/lang/String;

    .prologue
    .line 205
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->startTag:Ljava/lang/String;

    .line 206
    return-void
.end method

.method public setUsersfile(Ljava/io/File;)V
    .locals 0
    .param p1, "usersFile"    # Ljava/io/File;

    .prologue
    .line 141
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/cvslib/ChangeLogTask;->usersFile:Ljava/io/File;

    .line 142
    return-void
.end method
