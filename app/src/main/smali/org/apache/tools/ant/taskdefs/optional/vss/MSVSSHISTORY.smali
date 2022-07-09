.class public Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY;
.super Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;
.source "MSVSSHISTORY.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY$BriefCodediffNofile;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;-><init>()V

    .line 190
    return-void
.end method


# virtual methods
.method buildCmdLine()Lorg/apache/tools/ant/types/Commandline;
    .locals 4

    .prologue
    .line 40
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 43
    .local v0, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY;->getVsspath()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_0

    .line 44
    const-string/jumbo v1, "vsspath attribute must be set!"

    .line 45
    .local v1, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v2, v1, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .line 51
    .end local v1    # "msg":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY;->getSSCommand()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 52
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "History"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 55
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY;->getVsspath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 57
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    const-string/jumbo v3, "-I-"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 59
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY;->getVersionDate()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 61
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY;->getVersionLabel()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 63
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY;->getRecursive()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 65
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY;->getStyle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 67
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY;->getLogin()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 69
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY;->getOutput()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 71
    return-object v0
.end method

.method public setDateFormat(Ljava/lang/String;)V
    .locals 1
    .param p1, "dateFormat"    # Ljava/lang/String;

    .prologue
    .line 158
    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-super {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalDateFormat(Ljava/text/DateFormat;)V

    .line 159
    return-void
.end method

.method public setFromDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "fromDate"    # Ljava/lang/String;

    .prologue
    .line 98
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalFromDate(Ljava/lang/String;)V

    .line 99
    return-void
.end method

.method public setFromLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "fromLabel"    # Ljava/lang/String;

    .prologue
    .line 116
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalFromLabel(Ljava/lang/String;)V

    .line 117
    return-void
.end method

.method public setNumdays(I)V
    .locals 0
    .param p1, "numd"    # I

    .prologue
    .line 135
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalNumDays(I)V

    .line 136
    return-void
.end method

.method public setOutput(Ljava/io/File;)V
    .locals 1
    .param p1, "outfile"    # Ljava/io/File;

    .prologue
    .line 144
    if-eqz p1, :cond_0

    .line 145
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalOutputFilename(Ljava/lang/String;)V

    .line 147
    :cond_0
    return-void
.end method

.method public setRecursive(Z)V
    .locals 0
    .param p1, "recursive"    # Z

    .prologue
    .line 80
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalRecursive(Z)V

    .line 81
    return-void
.end method

.method public setStyle(Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY$BriefCodediffNofile;)V
    .locals 4
    .param p1, "attr"    # Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY$BriefCodediffNofile;

    .prologue
    .line 173
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY$BriefCodediffNofile;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 174
    .local v0, "option":Ljava/lang/String;
    const-string/jumbo v1, "brief"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 175
    const-string/jumbo v1, "-B"

    invoke-super {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalStyle(Ljava/lang/String;)V

    .line 185
    :goto_0
    return-void

    .line 176
    :cond_0
    const-string/jumbo v1, "codediff"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 177
    const-string/jumbo v1, "-D"

    invoke-super {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalStyle(Ljava/lang/String;)V

    goto :goto_0

    .line 178
    :cond_1
    const-string/jumbo v1, "default"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 179
    const-string/jumbo v1, ""

    invoke-super {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalStyle(Ljava/lang/String;)V

    goto :goto_0

    .line 180
    :cond_2
    const-string/jumbo v1, "nofile"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 181
    const-string/jumbo v1, "-F-"

    invoke-super {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalStyle(Ljava/lang/String;)V

    goto :goto_0

    .line 183
    :cond_3
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Style "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " unknown."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSSHISTORY;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1
.end method

.method public setToDate(Ljava/lang/String;)V
    .locals 0
    .param p1, "toDate"    # Ljava/lang/String;

    .prologue
    .line 107
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalToDate(Ljava/lang/String;)V

    .line 108
    return-void
.end method

.method public setToLabel(Ljava/lang/String;)V
    .locals 0
    .param p1, "toLabel"    # Ljava/lang/String;

    .prologue
    .line 125
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalToLabel(Ljava/lang/String;)V

    .line 126
    return-void
.end method

.method public setUser(Ljava/lang/String;)V
    .locals 0
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/vss/MSVSS;->setInternalUser(Ljava/lang/String;)V

    .line 90
    return-void
.end method
