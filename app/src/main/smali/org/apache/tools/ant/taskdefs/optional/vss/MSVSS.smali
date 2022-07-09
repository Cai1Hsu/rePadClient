.class public abstract Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;
.super Lorg/apache/tools/ant/Task;
.source "MSVSS.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSConstants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;,
        Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;
    }
.end annotation


# instance fields
.field private autoResponse:Ljava/lang/String;

.field private comment:Ljava/lang/String;

.field private date:Ljava/lang/String;

.field private dateFormat:Ljava/text/DateFormat;

.field private failOnError:Z

.field private fromDate:Ljava/lang/String;

.field private fromLabel:Ljava/lang/String;

.field private getLocalCopy:Z

.field private label:Ljava/lang/String;

.field private localPath:Ljava/lang/String;

.field private numDays:I

.field private outputFileName:Ljava/lang/String;

.field private quiet:Z

.field private recursive:Z

.field private serverPath:Ljava/lang/String;

.field private ssDir:Ljava/lang/String;

.field private style:Ljava/lang/String;

.field private timestamp:Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;

.field private toDate:Ljava/lang/String;

.field private toLabel:Ljava/lang/String;

.field private user:Ljava/lang/String;

.field private version:Ljava/lang/String;

.field private vssLogin:Ljava/lang/String;

.field private vssPath:Ljava/lang/String;

.field private writable:Z

.field private writableFiles:Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 51
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 53
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->ssDir:Ljava/lang/String;

    .line 54
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->vssLogin:Ljava/lang/String;

    .line 55
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->vssPath:Ljava/lang/String;

    .line 56
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->serverPath:Ljava/lang/String;

    .line 59
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->version:Ljava/lang/String;

    .line 61
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->date:Ljava/lang/String;

    .line 63
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->label:Ljava/lang/String;

    .line 65
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->autoResponse:Ljava/lang/String;

    .line 67
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->localPath:Ljava/lang/String;

    .line 69
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->comment:Ljava/lang/String;

    .line 71
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    .line 73
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    .line 75
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->outputFileName:Ljava/lang/String;

    .line 77
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->user:Ljava/lang/String;

    .line 79
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromDate:Ljava/lang/String;

    .line 81
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toDate:Ljava/lang/String;

    .line 83
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->style:Ljava/lang/String;

    .line 85
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->quiet:Z

    .line 87
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->recursive:Z

    .line 89
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->writable:Z

    .line 91
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->failOnError:Z

    .line 93
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getLocalCopy:Z

    .line 95
    const/high16 v0, -0x80000000

    iput v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->numDays:I

    .line 97
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/text/DateFormat;->getDateInstance(I)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->dateFormat:Ljava/text/DateFormat;

    .line 99
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->timestamp:Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;

    .line 101
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->writableFiles:Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;

    .line 775
    return-void
.end method

.method private calcDate(Ljava/lang/String;I)Ljava/lang/String;
    .locals 4
    .param p1, "startDate"    # Ljava/lang/String;
    .param p2, "daysToAdd"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .prologue
    .line 732
    new-instance v0, Ljava/util/GregorianCalendar;

    invoke-direct {v0}, Ljava/util/GregorianCalendar;-><init>()V

    .line 733
    .local v0, "calendar":Ljava/util/Calendar;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->dateFormat:Ljava/text/DateFormat;

    invoke-virtual {v2, p1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v1

    .line 734
    .local v1, "currentDate":Ljava/util/Date;
    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 735
    const/4 v2, 0x5

    invoke-virtual {v0, v2, p2}, Ljava/util/Calendar;->add(II)V

    .line 736
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->dateFormat:Ljava/text/DateFormat;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private formatCommandLine(Lorg/apache/tools/ant/types/Commandline;)Ljava/lang/String;
    .locals 8
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    const/4 v7, 0x0

    .line 746
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 747
    .local v4, "sBuff":Ljava/lang/StringBuffer;
    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "-Y"

    invoke-virtual {v5, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v3

    .line 748
    .local v3, "indexUser":I
    if-lez v3, :cond_0

    .line 749
    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, ","

    invoke-virtual {v5, v6, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v2

    .line 750
    .local v2, "indexPass":I
    invoke-virtual {v4, v7}, Ljava/lang/StringBuffer;->substring(I)Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, " "

    invoke-virtual {v5, v6, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 752
    .local v1, "indexAfterPass":I
    add-int/lit8 v0, v2, 0x1

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 753
    const/16 v5, 0x2a

    invoke-virtual {v4, v0, v5}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 752
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 756
    .end local v0    # "i":I
    .end local v1    # "indexAfterPass":I
    .end local v2    # "indexPass":I
    :cond_0
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private getFailOnError()Z
    .locals 2

    .prologue
    .line 640
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getWritableFiles()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "skip"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->failOnError:Z

    goto :goto_0
.end method

.method private getShortLabel()Ljava/lang/String;
    .locals 4

    .prologue
    .line 431
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->label:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->label:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x1f

    if-le v1, v2, :cond_0

    .line 432
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->label:Ljava/lang/String;

    const/4 v2, 0x0

    const/16 v3, 0x1e

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 433
    .local v0, "shortLabel":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Label is longer than 31 characters, truncated to: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->log(Ljava/lang/String;I)V

    .line 439
    :goto_0
    return-object v0

    .line 436
    .end local v0    # "shortLabel":Ljava/lang/String;
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->label:Ljava/lang/String;

    .restart local v0    # "shortLabel":Ljava/lang/String;
    goto :goto_0
.end method

.method private run(Lorg/apache/tools/ant/types/Commandline;)I
    .locals 7
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 693
    :try_start_0
    new-instance v2, Lorg/apache/tools/ant/taskdefs/Execute;

    new-instance v4, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    const/4 v5, 0x2

    const/4 v6, 0x1

    invoke-direct {v4, p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    invoke-direct {v2, v4}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 699
    .local v2, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->serverPath:Ljava/lang/String;

    if-eqz v4, :cond_1

    .line 700
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Execute;->getEnvironment()[Ljava/lang/String;

    move-result-object v1

    .line 701
    .local v1, "env":[Ljava/lang/String;
    if-nez v1, :cond_0

    .line 702
    const/4 v4, 0x0

    new-array v1, v4, [Ljava/lang/String;

    .line 704
    :cond_0
    array-length v4, v1

    add-int/lit8 v4, v4, 0x1

    new-array v3, v4, [Ljava/lang/String;

    .line 705
    .local v3, "newEnv":[Ljava/lang/String;
    const/4 v4, 0x0

    const/4 v5, 0x0

    array-length v6, v1

    invoke-static {v1, v4, v3, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 706
    array-length v4, v1

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "SSDIR="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->serverPath:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    .line 708
    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/taskdefs/Execute;->setEnvironment([Ljava/lang/String;)V

    .line 711
    .end local v1    # "env":[Ljava/lang/String;
    .end local v3    # "newEnv":[Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 712
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    invoke-virtual {v4}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 713
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->getCommandline()[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 715
    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Lorg/apache/tools/ant/taskdefs/Execute;->setVMLauncher(Z)V

    .line 716
    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    return v4

    .line 717
    .end local v2    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    :catch_0
    move-exception v0

    .line 718
    .local v0, "e":Ljava/io/IOException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v0, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v4
.end method


# virtual methods
.method abstract buildCmdLine()Lorg/apache/tools/ant/types/Commandline;
.end method

.method public execute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 179
    const/4 v2, 0x0

    .line 180
    .local v2, "result":I
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->buildCmdLine()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v0

    .line 181
    .local v0, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v2

    .line 182
    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getFailOnError()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 183
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Failed executing: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->formatCommandLine(Lorg/apache/tools/ant/types/Commandline;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " With a return code of "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 185
    .local v1, "msg":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 187
    .end local v1    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method protected getAutoresponse()Ljava/lang/String;
    .locals 2

    .prologue
    .line 516
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->autoResponse:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 517
    const-string/jumbo v0, "-I-"

    .line 524
    :goto_0
    return-object v0

    .line 519
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->autoResponse:Ljava/lang/String;

    const-string/jumbo v1, "Y"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 520
    const-string/jumbo v0, "-I-Y"

    goto :goto_0

    .line 521
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->autoResponse:Ljava/lang/String;

    const-string/jumbo v1, "N"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 522
    const-string/jumbo v0, "-I-N"

    goto :goto_0

    .line 524
    :cond_2
    const-string/jumbo v0, "-I-"

    goto :goto_0
.end method

.method protected getComment()Ljava/lang/String;
    .locals 2

    .prologue
    .line 508
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->comment:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "-C"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->comment:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "-C-"

    goto :goto_0
.end method

.method public getFileTimeStamp()Ljava/lang/String;
    .locals 2

    .prologue
    .line 654
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->timestamp:Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;

    if-nez v0, :cond_0

    .line 655
    const-string/jumbo v0, ""

    .line 661
    :goto_0
    return-object v0

    .line 656
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->timestamp:Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;->getValue()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "modified"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 657
    const-string/jumbo v0, "-GTM"

    goto :goto_0

    .line 658
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->timestamp:Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;->getValue()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "updated"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 659
    const-string/jumbo v0, "-GTU"

    goto :goto_0

    .line 661
    :cond_2
    const-string/jumbo v0, "-GTC"

    goto :goto_0
.end method

.method protected getGetLocalCopy()Ljava/lang/String;
    .locals 1

    .prologue
    .line 632
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getLocalCopy:Z

    if-nez v0, :cond_0

    const-string/jumbo v0, "-G-"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method protected getLabel()Ljava/lang/String;
    .locals 3

    .prologue
    .line 417
    const-string/jumbo v0, ""

    .line 418
    .local v0, "shortLabel":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->label:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->label:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 419
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "-L"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getShortLabel()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 421
    :cond_0
    return-object v0
.end method

.method protected getLocalpath()Ljava/lang/String;
    .locals 7

    .prologue
    .line 485
    const-string/jumbo v2, ""

    .line 486
    .local v2, "lclPath":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->localPath:Ljava/lang/String;

    if-eqz v4, :cond_2

    .line 488
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->localPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 489
    .local v0, "dir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_1

    .line 490
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    .line 491
    .local v1, "done":Z
    if-nez v1, :cond_0

    .line 492
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Directory "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->localPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " creation was not "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "successful for an unknown reason"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 494
    .local v3, "msg":Ljava/lang/String;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v4

    .line 496
    .end local v3    # "msg":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Created dir: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;)V

    .line 498
    .end local v1    # "done":Z
    :cond_1
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "-GL"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->localPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 500
    .end local v0    # "dir":Ljava/io/File;
    :cond_2
    return-object v2
.end method

.method protected getLogin()Ljava/lang/String;
    .locals 2

    .prologue
    .line 534
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->vssLogin:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "-Y"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->vssLogin:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method protected getOutput()Ljava/lang/String;
    .locals 2

    .prologue
    .line 542
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->outputFileName:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "-O"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->outputFileName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method protected getQuiet()Ljava/lang/String;
    .locals 1

    .prologue
    .line 392
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->quiet:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "-O-"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method protected getRecursive()Ljava/lang/String;
    .locals 1

    .prologue
    .line 400
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->recursive:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "-R"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method protected getSSCommand()Ljava/lang/String;
    .locals 2

    .prologue
    .line 372
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->ssDir:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 373
    const-string/jumbo v0, "ss"

    .line 375
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->ssDir:Ljava/lang/String;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->ssDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "ss"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->ssDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "ss"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method protected getStyle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 446
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->style:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->style:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method protected getUser()Ljava/lang/String;
    .locals 2

    .prologue
    .line 550
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->user:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "-U"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->user:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method protected getVersion()Ljava/lang/String;
    .locals 2

    .prologue
    .line 476
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->version:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "-V"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->version:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method protected getVersionDate()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/high16 v3, -0x80000000

    .line 599
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromDate:Ljava/lang/String;

    if-nez v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toDate:Ljava/lang/String;

    if-nez v2, :cond_0

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->numDays:I

    if-ne v2, v3, :cond_0

    .line 601
    const-string/jumbo v2, ""

    .line 622
    :goto_0
    return-object v2

    .line 603
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromDate:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toDate:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 604
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "-Vd"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toDate:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "~d"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromDate:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 605
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toDate:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->numDays:I

    if-eq v2, v3, :cond_2

    .line 607
    :try_start_0
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "-Vd"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toDate:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "~d"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toDate:Ljava/lang/String;

    iget v4, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->numDays:I

    invoke-direct {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->calcDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 609
    :catch_0
    move-exception v0

    .line 610
    .local v0, "ex":Ljava/text/ParseException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Error parsing date: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toDate:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 611
    .local v1, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 613
    .end local v0    # "ex":Ljava/text/ParseException;
    .end local v1    # "msg":Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromDate:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->numDays:I

    if-eq v2, v3, :cond_3

    .line 615
    :try_start_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "-Vd"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromDate:Ljava/lang/String;

    iget v4, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->numDays:I

    invoke-direct {p0, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->calcDate(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "~d"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromDate:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    goto/16 :goto_0

    .line 617
    :catch_1
    move-exception v0

    .line 618
    .restart local v0    # "ex":Ljava/text/ParseException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Error parsing date: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromDate:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 619
    .restart local v1    # "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 622
    .end local v0    # "ex":Ljava/text/ParseException;
    .end local v1    # "msg":Ljava/lang/String;
    :cond_3
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromDate:Ljava/lang/String;

    if-eqz v2, :cond_4

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "-V~d"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromDate:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0

    :cond_4
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "-Vd"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toDate:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    goto/16 :goto_0
.end method

.method protected getVersionDateLabel()Ljava/lang/String;
    .locals 4

    .prologue
    .line 455
    const-string/jumbo v1, ""

    .line 456
    .local v1, "versionDateLabel":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->version:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 457
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "-V"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->version:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 468
    :cond_0
    :goto_0
    return-object v1

    .line 458
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->date:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 459
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "-Vd"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->date:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 463
    :cond_2
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getShortLabel()Ljava/lang/String;

    move-result-object v0

    .line 464
    .local v0, "shortLabel":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string/jumbo v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 465
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "-VL"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method protected getVersionLabel()Ljava/lang/String;
    .locals 6

    .prologue
    const/16 v5, 0x1f

    const/16 v4, 0x1e

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 559
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 560
    const-string/jumbo v0, ""

    .line 588
    :goto_0
    return-object v0

    .line 563
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 564
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v5, :cond_1

    .line 565
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    .line 566
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "FromLabel is longer than 31 characters, truncated to: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v3}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->log(Ljava/lang/String;I)V

    .line 569
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v5, :cond_2

    .line 570
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    .line 571
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "ToLabel is longer than 31 characters, truncated to: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v3}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->log(Ljava/lang/String;I)V

    .line 574
    :cond_2
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "-VL"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "~L"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 575
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    if-eqz v0, :cond_5

    .line 576
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v5, :cond_4

    .line 577
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    .line 578
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "FromLabel is longer than 31 characters, truncated to: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v3}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->log(Ljava/lang/String;I)V

    .line 581
    :cond_4
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "-V~L"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 583
    :cond_5
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v0, v5, :cond_6

    .line 584
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    invoke-virtual {v0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    .line 585
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "ToLabel is longer than 31 characters, truncated to: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v3}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->log(Ljava/lang/String;I)V

    .line 588
    :cond_6
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "-VL"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method

.method protected getVsspath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 384
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->vssPath:Ljava/lang/String;

    return-object v0
.end method

.method protected getWritable()Ljava/lang/String;
    .locals 1

    .prologue
    .line 408
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->writable:Z

    if-eqz v0, :cond_0

    const-string/jumbo v0, "-W"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public getWritableFiles()Ljava/lang/String;
    .locals 2

    .prologue
    .line 671
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->writableFiles:Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;

    if-nez v0, :cond_0

    .line 672
    const-string/jumbo v0, ""

    .line 681
    :goto_0
    return-object v0

    .line 673
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->writableFiles:Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;->getValue()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "replace"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 674
    const-string/jumbo v0, "-GWR"

    goto :goto_0

    .line 675
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->writableFiles:Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;->getValue()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "skip"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 678
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->failOnError:Z

    .line 679
    const-string/jumbo v0, "-GWS"

    goto :goto_0

    .line 681
    :cond_2
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public final setFailOnError(Z)V
    .locals 0
    .param p1, "failOnError"    # Z

    .prologue
    .line 169
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->failOnError:Z

    .line 170
    return-void
.end method

.method protected setInternalAutoResponse(Ljava/lang/String;)V
    .locals 0
    .param p1, "autoResponse"    # Ljava/lang/String;

    .prologue
    .line 204
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->autoResponse:Ljava/lang/String;

    .line 205
    return-void
.end method

.method protected setInternalComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 196
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->comment:Ljava/lang/String;

    .line 197
    return-void
.end method

.method protected setInternalDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "date"    # Ljava/lang/String;

    .prologue
    .line 212
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->date:Ljava/lang/String;

    .line 213
    return-void
.end method

.method protected setInternalDateFormat(Ljava/text/DateFormat;)V
    .locals 0
    .param p1, "dateFormat"    # Ljava/text/DateFormat;

    .prologue
    .line 220
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->dateFormat:Ljava/text/DateFormat;

    .line 221
    return-void
.end method

.method protected setInternalFailOnError(Z)V
    .locals 0
    .param p1, "failOnError"    # Z

    .prologue
    .line 228
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->failOnError:Z

    .line 229
    return-void
.end method

.method protected setInternalFileTimeStamp(Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;)V
    .locals 0
    .param p1, "timestamp"    # Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;

    .prologue
    .line 348
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->timestamp:Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$CurrentModUpdated;

    .line 349
    return-void
.end method

.method protected setInternalFromDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "fromDate"    # Ljava/lang/String;

    .prologue
    .line 236
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromDate:Ljava/lang/String;

    .line 237
    return-void
.end method

.method protected setInternalFromLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "fromLabel"    # Ljava/lang/String;

    .prologue
    .line 244
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->fromLabel:Ljava/lang/String;

    .line 245
    return-void
.end method

.method protected setInternalGetLocalCopy(Z)V
    .locals 0
    .param p1, "getLocalCopy"    # Z

    .prologue
    .line 364
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->getLocalCopy:Z

    .line 365
    return-void
.end method

.method protected setInternalLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "label"    # Ljava/lang/String;

    .prologue
    .line 252
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->label:Ljava/lang/String;

    .line 253
    return-void
.end method

.method protected setInternalLocalPath(Ljava/lang/String;)V
    .locals 0
    .param p1, "localPath"    # Ljava/lang/String;

    .prologue
    .line 260
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->localPath:Ljava/lang/String;

    .line 261
    return-void
.end method

.method protected setInternalNumDays(I)V
    .locals 0
    .param p1, "numDays"    # I

    .prologue
    .line 268
    iput p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->numDays:I

    .line 269
    return-void
.end method

.method protected setInternalOutputFilename(Ljava/lang/String;)V
    .locals 0
    .param p1, "outputFileName"    # Ljava/lang/String;

    .prologue
    .line 276
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->outputFileName:Ljava/lang/String;

    .line 277
    return-void
.end method

.method protected setInternalQuiet(Z)V
    .locals 0
    .param p1, "quiet"    # Z

    .prologue
    .line 284
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->quiet:Z

    .line 285
    return-void
.end method

.method protected setInternalRecursive(Z)V
    .locals 0
    .param p1, "recursive"    # Z

    .prologue
    .line 292
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->recursive:Z

    .line 293
    return-void
.end method

.method protected setInternalStyle(Ljava/lang/String;)V
    .locals 0
    .param p1, "style"    # Ljava/lang/String;

    .prologue
    .line 300
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->style:Ljava/lang/String;

    .line 301
    return-void
.end method

.method protected setInternalToDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "toDate"    # Ljava/lang/String;

    .prologue
    .line 308
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toDate:Ljava/lang/String;

    .line 309
    return-void
.end method

.method protected setInternalToLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "toLabel"    # Ljava/lang/String;

    .prologue
    .line 316
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->toLabel:Ljava/lang/String;

    .line 317
    return-void
.end method

.method protected setInternalUser(Ljava/lang/String;)V
    .locals 0
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 324
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->user:Ljava/lang/String;

    .line 325
    return-void
.end method

.method protected setInternalVersion(Ljava/lang/String;)V
    .locals 0
    .param p1, "version"    # Ljava/lang/String;

    .prologue
    .line 332
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->version:Ljava/lang/String;

    .line 333
    return-void
.end method

.method protected setInternalWritable(Z)V
    .locals 0
    .param p1, "writable"    # Z

    .prologue
    .line 340
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->writable:Z

    .line 341
    return-void
.end method

.method protected setInternalWritableFiles(Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;)V
    .locals 0
    .param p1, "writableFiles"    # Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;

    .prologue
    .line 356
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->writableFiles:Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS$WritableFiles;

    .line 357
    return-void
.end method

.method public final setLogin(Ljava/lang/String;)V
    .locals 0
    .param p1, "vssLogin"    # Ljava/lang/String;

    .prologue
    .line 128
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->vssLogin:Ljava/lang/String;

    .line 129
    return-void
.end method

.method public final setServerpath(Ljava/lang/String;)V
    .locals 0
    .param p1, "serverPath"    # Ljava/lang/String;

    .prologue
    .line 161
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->serverPath:Ljava/lang/String;

    .line 162
    return-void
.end method

.method public final setSsdir(Ljava/lang/String;)V
    .locals 1
    .param p1, "dir"    # Ljava/lang/String;

    .prologue
    .line 117
    invoke-static {p1}, Lorg/apache/tools/ant/util/FileUtils;->translatePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->ssDir:Ljava/lang/String;

    .line 118
    return-void
.end method

.method public final setVsspath(Ljava/lang/String;)V
    .locals 3
    .param p1, "vssPath"    # Ljava/lang/String;

    .prologue
    .line 142
    const-string/jumbo v1, "vss://"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 143
    const/4 v1, 0x5

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 149
    .local v0, "projectPath":Ljava/lang/String;
    :goto_0
    const-string/jumbo v1, "$"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 150
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->vssPath:Ljava/lang/String;

    .line 154
    :goto_1
    return-void

    .line 145
    .end local v0    # "projectPath":Ljava/lang/String;
    :cond_0
    move-object v0, p1

    .restart local v0    # "projectPath":Ljava/lang/String;
    goto :goto_0

    .line 152
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "$"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->vssPath:Ljava/lang/String;

    goto :goto_1
.end method
