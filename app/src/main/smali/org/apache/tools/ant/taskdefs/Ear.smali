.class public Lorg/apache/tools/ant/taskdefs/Ear;
.super Lorg/apache/tools/ant/taskdefs/Jar;
.source "Ear.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final XML_DESCRIPTOR_PATH:Ljava/lang/String; = "META-INF/application.xml"


# instance fields
.field private deploymentDescriptor:Ljava/io/File;

.field private descriptorAdded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Ear;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Jar;-><init>()V

    .line 48
    const-string/jumbo v0, "ear"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ear;->archiveType:Ljava/lang/String;

    .line 49
    const-string/jumbo v0, "create"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ear;->emptyBehavior:Ljava/lang/String;

    .line 50
    return-void
.end method


# virtual methods
.method public addArchives(Lorg/apache/tools/ant/types/ZipFileSet;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/tools/ant/types/ZipFileSet;

    .prologue
    .line 90
    const-string/jumbo v0, "/"

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/ZipFileSet;->setPrefix(Ljava/lang/String;)V

    .line 91
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 92
    return-void
.end method

.method protected cleanUp()V
    .locals 1

    .prologue
    .line 151
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Ear;->descriptorAdded:Z

    .line 152
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->cleanUp()V

    .line 153
    return-void
.end method

.method protected initZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V
    .locals 3
    .param p1, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 104
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ear;->deploymentDescriptor:Ljava/io/File;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ear;->isInUpdateMode()Z

    move-result v0

    if-nez v0, :cond_0

    .line 105
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "appxml attribute is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Ear;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 108
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->initZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V

    .line 109
    return-void
.end method

.method public setAppxml(Ljava/io/File;)V
    .locals 4
    .param p1, "descr"    # Ljava/io/File;

    .prologue
    .line 67
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Ear;->deploymentDescriptor:Ljava/io/File;

    .line 68
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ear;->deploymentDescriptor:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 69
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Deployment descriptor: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Ear;->deploymentDescriptor:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " does not exist."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 75
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/ZipFileSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/ZipFileSet;-><init>()V

    .line 76
    .local v0, "fs":Lorg/apache/tools/ant/types/ZipFileSet;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ear;->deploymentDescriptor:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ZipFileSet;->setFile(Ljava/io/File;)V

    .line 77
    const-string/jumbo v1, "META-INF/application.xml"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ZipFileSet;->setFullpath(Ljava/lang/String;)V

    .line 78
    invoke-super {p0, v0}, Lorg/apache/tools/ant/taskdefs/Jar;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 79
    return-void
.end method

.method public setEarfile(Ljava/io/File;)V
    .locals 0
    .param p1, "earFile"    # Ljava/io/File;

    .prologue
    .line 59
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Ear;->setDestFile(Ljava/io/File;)V

    .line 60
    return-void
.end method

.method protected zipFile(Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V
    .locals 3
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
    const/4 v2, 0x1

    .line 127
    const-string/jumbo v0, "META-INF/application.xml"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 128
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Ear;->deploymentDescriptor:Ljava/io/File;

    if-eqz v0, :cond_0

    sget-object v0, Lorg/apache/tools/ant/taskdefs/Ear;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ear;->deploymentDescriptor:Ljava/io/File;

    invoke-virtual {v0, v1, p1}, Lorg/apache/tools/ant/util/FileUtils;->fileNameEquals(Ljava/io/File;Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Ear;->descriptorAdded:Z

    if-eqz v0, :cond_1

    .line 131
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Warning: selected "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ear;->archiveType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " files include a "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "META-INF/application.xml"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " which will"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " be ignored (please use appxml attribute to "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Ear;->archiveType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " task)"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v2}, Lorg/apache/tools/ant/taskdefs/Ear;->logWhenWriting(Ljava/lang/String;I)V

    .line 144
    :goto_0
    return-void

    .line 138
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Lorg/apache/tools/ant/taskdefs/Jar;->zipFile(Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V

    .line 139
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/Ear;->descriptorAdded:Z

    goto :goto_0

    .line 142
    :cond_2
    invoke-super {p0, p1, p2, p3, p4}, Lorg/apache/tools/ant/taskdefs/Jar;->zipFile(Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V

    goto :goto_0
.end method
