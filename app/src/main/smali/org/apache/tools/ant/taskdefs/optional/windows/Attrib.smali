.class public Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;
.super Lorg/apache/tools/ant/taskdefs/ExecuteOn;
.source "Attrib.java"


# static fields
.field private static final ATTR_ARCHIVE:Ljava/lang/String; = "A"

.field private static final ATTR_HIDDEN:Ljava/lang/String; = "H"

.field private static final ATTR_READONLY:Ljava/lang/String; = "R"

.field private static final ATTR_SYSTEM:Ljava/lang/String; = "S"

.field private static final SET:Ljava/lang/String; = "+"

.field private static final UNSET:Ljava/lang/String; = "-"


# instance fields
.field private haveAttr:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;-><init>()V

    .line 43
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->haveAttr:Z

    .line 47
    const-string/jumbo v0, "attrib"

    invoke-super {p0, v0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->setExecutable(Ljava/lang/String;)V

    .line 48
    invoke-super {p0, v1}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->setParallel(Z)V

    .line 49
    return-void
.end method

.method private addArg(ZLjava/lang/String;)V
    .locals 3
    .param p1, "sign"    # Z
    .param p2, "attribute"    # Ljava/lang/String;

    .prologue
    .line 188
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->createArg()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getSignString(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 189
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->haveAttr:Z

    .line 190
    return-void
.end method

.method private static getSignString(Z)Ljava/lang/String;
    .locals 1
    .param p0, "attr"    # Z

    .prologue
    .line 184
    if-eqz p0, :cond_0

    const-string/jumbo v0, "+"

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "-"

    goto :goto_0
.end method

.method private haveAttr()Z
    .locals 1

    .prologue
    .line 193
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->haveAttr:Z

    return v0
.end method


# virtual methods
.method protected checkConfiguration()V
    .locals 3

    .prologue
    .line 97
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->haveAttr()Z

    move-result v0

    if-nez v0, :cond_0

    .line 98
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Missing attribute parameter"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 101
    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->checkConfiguration()V

    .line 102
    return-void
.end method

.method protected isValidOs()Z
    .locals 1

    .prologue
    .line 179
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getOs()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getOsFamily()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "windows"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/ExecuteOn;->isValidOs()Z

    move-result v0

    goto :goto_0
.end method

.method public setAddsourcefile(Z)V
    .locals 3
    .param p1, "b"    # Z

    .prologue
    .line 133
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the addsourcefile attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setArchive(Z)V
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 74
    const-string/jumbo v0, "A"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->addArg(ZLjava/lang/String;)V

    .line 75
    return-void
.end method

.method public setCommand(Ljava/lang/String;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/String;

    .prologue
    .line 122
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the command attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setExecutable(Ljava/lang/String;)V
    .locals 3
    .param p1, "e"    # Ljava/lang/String;

    .prologue
    .line 111
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the executable attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setFile(Ljava/io/File;)V
    .locals 1
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 56
    new-instance v0, Lorg/apache/tools/ant/types/FileSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/FileSet;-><init>()V

    .line 57
    .local v0, "fs":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/FileSet;->setFile(Ljava/io/File;)V

    .line 58
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 59
    return-void
.end method

.method public setHidden(Z)V
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 90
    const-string/jumbo v0, "H"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->addArg(ZLjava/lang/String;)V

    .line 91
    return-void
.end method

.method public setMaxParallel(I)V
    .locals 3
    .param p1, "max"    # I

    .prologue
    .line 168
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the maxparallel attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setParallel(Z)V
    .locals 3
    .param p1, "parallel"    # Z

    .prologue
    .line 156
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the parallel attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setReadonly(Z)V
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 66
    const-string/jumbo v0, "R"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->addArg(ZLjava/lang/String;)V

    .line 67
    return-void
.end method

.method public setSkipEmptyFilesets(Z)V
    .locals 3
    .param p1, "skip"    # Z

    .prologue
    .line 144
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getTaskType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t support the "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "skipemptyfileset attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0
.end method

.method public setSystem(Z)V
    .locals 1
    .param p1, "value"    # Z

    .prologue
    .line 82
    const-string/jumbo v0, "S"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/optional/windows/Attrib;->addArg(ZLjava/lang/String;)V

    .line 83
    return-void
.end method
