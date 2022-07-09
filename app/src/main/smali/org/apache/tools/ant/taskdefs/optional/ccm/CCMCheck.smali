.class public Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;
.super Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;
.source "CCMCheck.java"


# static fields
.field public static final FLAG_COMMENT:Ljava/lang/String; = "/comment"

.field public static final FLAG_TASK:Ljava/lang/String; = "/task"


# instance fields
.field private comment:Ljava/lang/String;

.field private file:Ljava/io/File;

.field protected filesets:Ljava/util/Vector;

.field private task:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 50
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/Continuus;-><init>()V

    .line 38
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->file:Ljava/io/File;

    .line 39
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->comment:Ljava/lang/String;

    .line 40
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->task:Ljava/lang/String;

    .line 44
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->filesets:Ljava/util/Vector;

    .line 51
    return-void
.end method

.method private checkOptions(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 182
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->getComment()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 183
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "/comment"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 184
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->getComment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 187
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->getTask()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 188
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "/task"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 189
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->getTask()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 192
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->getFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 193
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 195
    :cond_2
    return-void
.end method

.method private doit()V
    .locals 5

    .prologue
    .line 159
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 165
    .local v0, "commandLine":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->getCcmCommand()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 166
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->getCcmAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 168
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->checkOptions(Lorg/apache/tools/ant/types/Commandline;)V

    .line 170
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->run(Lorg/apache/tools/ant/types/Commandline;)I

    move-result v2

    .line 171
    .local v2, "result":I
    invoke-static {v2}, Lorg/apache/tools/ant/taskdefs/Execute;->isFailure(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 172
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Failed executing: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Commandline;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 173
    .local v1, "msg":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 175
    .end local v1    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method


# virtual methods
.method public addFileset(Lorg/apache/tools/ant/types/FileSet;)V
    .locals 1
    .param p1, "set"    # Lorg/apache/tools/ant/types/FileSet;

    .prologue
    .line 110
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->filesets:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 111
    return-void
.end method

.method public execute()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 124
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->file:Ljava/io/File;

    if-nez v7, :cond_0

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->filesets:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v7

    if-nez v7, :cond_0

    .line 125
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Specify at least one source - a file or a fileset."

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 129
    :cond_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->file:Ljava/io/File;

    if-eqz v7, :cond_1

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->file:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_1

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->file:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 130
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "CCMCheck cannot be generated for directories"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 133
    :cond_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->file:Ljava/io/File;

    if-eqz v7, :cond_2

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->filesets:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v7

    if-lez v7, :cond_2

    .line 134
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "Choose between file and fileset !"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 137
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->getFile()Ljava/io/File;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 138
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->doit()V

    .line 153
    :cond_3
    return-void

    .line 142
    :cond_4
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->filesets:Ljava/util/Vector;

    invoke-virtual {v7}, Ljava/util/Vector;->size()I

    move-result v4

    .line 143
    .local v4, "sizeofFileSet":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v4, :cond_3

    .line 144
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->filesets:Ljava/util/Vector;

    invoke-virtual {v7, v2}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/FileSet;

    .line 145
    .local v1, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v1, v7}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    .line 146
    .local v0, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v6

    .line 147
    .local v6, "srcFiles":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    array-length v7, v6

    if-ge v3, v7, :cond_5

    .line 148
    new-instance v5, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    invoke-virtual {v1, v7}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v7

    aget-object v8, v6, v3

    invoke-direct {v5, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 149
    .local v5, "src":Ljava/io/File;
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->setFile(Ljava/io/File;)V

    .line 150
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->doit()V

    .line 147
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 143
    .end local v5    # "src":Ljava/io/File;
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public getComment()Ljava/lang/String;
    .locals 1

    .prologue
    .line 75
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->comment:Ljava/lang/String;

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->file:Ljava/io/File;

    return-object v0
.end method

.method public getTask()Ljava/lang/String;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->task:Ljava/lang/String;

    return-object v0
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "v"    # Ljava/lang/String;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->comment:Ljava/lang/String;

    .line 84
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 2
    .param p1, "v"    # Ljava/io/File;

    .prologue
    .line 66
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "working file "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->log(Ljava/lang/String;I)V

    .line 67
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->file:Ljava/io/File;

    .line 68
    return-void
.end method

.method public setTask(Ljava/lang/String;)V
    .locals 0
    .param p1, "v"    # Ljava/lang/String;

    .prologue
    .line 101
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ccm/CCMCheck;->task:Ljava/lang/String;

    .line 102
    return-void
.end method
