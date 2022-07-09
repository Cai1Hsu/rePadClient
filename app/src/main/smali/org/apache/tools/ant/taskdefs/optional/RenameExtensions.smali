.class public Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "RenameExtensions.java"


# instance fields
.field private fromExtension:Ljava/lang/String;

.field private globType:Lorg/apache/tools/ant/types/Mapper$MapperType;

.field private replace:Z

.field private srcDir:Ljava/io/File;

.field private toExtension:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 47
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->fromExtension:Ljava/lang/String;

    .line 48
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->toExtension:Ljava/lang/String;

    .line 49
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->replace:Z

    .line 58
    new-instance v0, Lorg/apache/tools/ant/types/Mapper$MapperType;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Mapper$MapperType;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->globType:Lorg/apache/tools/ant/types/Mapper$MapperType;

    .line 59
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->globType:Lorg/apache/tools/ant/types/Mapper$MapperType;

    const-string/jumbo v1, "glob"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Mapper$MapperType;->setValue(Ljava/lang/String;)V

    .line 60
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x2

    .line 108
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->fromExtension:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->toExtension:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->srcDir:Ljava/io/File;

    if-nez v2, :cond_1

    .line 109
    :cond_0
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "srcDir, fromExtension and toExtension attributes must be set!"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 113
    :cond_1
    const-string/jumbo v2, "DEPRECATED - The renameext task is deprecated.  Use move instead."

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->log(Ljava/lang/String;I)V

    .line 115
    const-string/jumbo v2, "Replace this with:"

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->log(Ljava/lang/String;I)V

    .line 116
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "<move todir=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->srcDir:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\" overwrite=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->replace:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\">"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->log(Ljava/lang/String;I)V

    .line 118
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "  <fileset dir=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->srcDir:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\" />"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->log(Ljava/lang/String;I)V

    .line 119
    const-string/jumbo v2, "  <mapper type=\"glob\""

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->log(Ljava/lang/String;I)V

    .line 120
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "          from=\"*"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->fromExtension:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->log(Ljava/lang/String;I)V

    .line 121
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "          to=\"*"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->toExtension:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\" />"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->log(Ljava/lang/String;I)V

    .line 122
    const-string/jumbo v2, "</move>"

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->log(Ljava/lang/String;I)V

    .line 123
    const-string/jumbo v2, "using the same patterns on <fileset> as you\'ve used here"

    invoke-virtual {p0, v2, v4}, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->log(Ljava/lang/String;I)V

    .line 126
    new-instance v1, Lorg/apache/tools/ant/taskdefs/Move;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/Move;-><init>()V

    .line 127
    .local v1, "move":Lorg/apache/tools/ant/taskdefs/Move;
    invoke-virtual {v1, p0}, Lorg/apache/tools/ant/taskdefs/Move;->bindToOwner(Lorg/apache/tools/ant/Task;)V

    .line 128
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->getOwningTarget()Lorg/apache/tools/ant/Target;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->setOwningTarget(Lorg/apache/tools/ant/Target;)V

    .line 129
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->getTaskName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->setTaskName(Ljava/lang/String;)V

    .line 130
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->setLocation(Lorg/apache/tools/ant/Location;)V

    .line 131
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->srcDir:Ljava/io/File;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->setTodir(Ljava/io/File;)V

    .line 132
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->replace:Z

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->setOverwrite(Z)V

    .line 134
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->fileset:Lorg/apache/tools/ant/types/FileSet;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->srcDir:Ljava/io/File;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/types/FileSet;->setDir(Ljava/io/File;)V

    .line 135
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->fileset:Lorg/apache/tools/ant/types/FileSet;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/Move;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 137
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Move;->createMapper()Lorg/apache/tools/ant/types/Mapper;

    move-result-object v0

    .line 138
    .local v0, "me":Lorg/apache/tools/ant/types/Mapper;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->globType:Lorg/apache/tools/ant/types/Mapper$MapperType;

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Mapper;->setType(Lorg/apache/tools/ant/types/Mapper$MapperType;)V

    .line 139
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "*"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->fromExtension:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Mapper;->setFrom(Ljava/lang/String;)V

    .line 140
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "*"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->toExtension:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Mapper;->setTo(Ljava/lang/String;)V

    .line 142
    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Move;->execute()V

    .line 143
    return-void
.end method

.method public setFromExtension(Ljava/lang/String;)V
    .locals 0
    .param p1, "from"    # Ljava/lang/String;

    .prologue
    .line 68
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->fromExtension:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public setReplace(Z)V
    .locals 0
    .param p1, "replace"    # Z

    .prologue
    .line 88
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->replace:Z

    .line 89
    return-void
.end method

.method public setSrcDir(Ljava/io/File;)V
    .locals 0
    .param p1, "srcDir"    # Ljava/io/File;

    .prologue
    .line 97
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->srcDir:Ljava/io/File;

    .line 98
    return-void
.end method

.method public setToExtension(Ljava/lang/String;)V
    .locals 0
    .param p1, "to"    # Ljava/lang/String;

    .prologue
    .line 78
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/RenameExtensions;->toExtension:Ljava/lang/String;

    .line 79
    return-void
.end method
