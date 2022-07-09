.class public Lorg/apache/tools/ant/taskdefs/War;
.super Lorg/apache/tools/ant/taskdefs/Jar;
.source "War.java"


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final XML_DESCRIPTOR_PATH:Ljava/lang/String; = "WEB-INF/web.xml"


# instance fields
.field private addedWebXmlFile:Ljava/io/File;

.field private deploymentDescriptor:Ljava/io/File;

.field private needxmlfile:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 60
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/War;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Jar;-><init>()V

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/War;->needxmlfile:Z

    .line 67
    const-string/jumbo v0, "war"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/War;->archiveType:Ljava/lang/String;

    .line 68
    const-string/jumbo v0, "create"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/War;->emptyBehavior:Ljava/lang/String;

    .line 69
    return-void
.end method


# virtual methods
.method public addClasses(Lorg/apache/tools/ant/types/ZipFileSet;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/tools/ant/types/ZipFileSet;

    .prologue
    .line 129
    const-string/jumbo v0, "WEB-INF/classes/"

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/ZipFileSet;->setPrefix(Ljava/lang/String;)V

    .line 130
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 131
    return-void
.end method

.method public addLib(Lorg/apache/tools/ant/types/ZipFileSet;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/tools/ant/types/ZipFileSet;

    .prologue
    .line 119
    const-string/jumbo v0, "WEB-INF/lib/"

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/ZipFileSet;->setPrefix(Ljava/lang/String;)V

    .line 120
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 121
    return-void
.end method

.method public addWebinf(Lorg/apache/tools/ant/types/ZipFileSet;)V
    .locals 1
    .param p1, "fs"    # Lorg/apache/tools/ant/types/ZipFileSet;

    .prologue
    .line 139
    const-string/jumbo v0, "WEB-INF/"

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/ZipFileSet;->setPrefix(Ljava/lang/String;)V

    .line 140
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 141
    return-void
.end method

.method protected cleanUp()V
    .locals 2

    .prologue
    .line 215
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/War;->addedWebXmlFile:Ljava/io/File;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/War;->deploymentDescriptor:Ljava/io/File;

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/War;->needxmlfile:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/War;->isInUpdateMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/War;->hasUpdatedFile()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 220
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "No WEB-INF/web.xml file was added.\nIf this is your intent, set needxmlfile=\'false\' "

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 223
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/War;->addedWebXmlFile:Ljava/io/File;

    .line 224
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/Jar;->cleanUp()V

    .line 225
    return-void
.end method

.method protected initZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V
    .locals 0
    .param p1, "zOut"    # Lorg/apache/tools/zip/ZipOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 152
    invoke-super {p0, p1}, Lorg/apache/tools/ant/taskdefs/Jar;->initZipOutputStream(Lorg/apache/tools/zip/ZipOutputStream;)V

    .line 153
    return-void
.end method

.method public setNeedxmlfile(Z)V
    .locals 0
    .param p1, "needxmlfile"    # Z

    .prologue
    .line 109
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/War;->needxmlfile:Z

    .line 110
    return-void
.end method

.method public setWarfile(Ljava/io/File;)V
    .locals 0
    .param p1, "warFile"    # Ljava/io/File;

    .prologue
    .line 80
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/War;->setDestFile(Ljava/io/File;)V

    .line 81
    return-void
.end method

.method public setWebxml(Ljava/io/File;)V
    .locals 4
    .param p1, "descr"    # Ljava/io/File;

    .prologue
    .line 89
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/War;->deploymentDescriptor:Ljava/io/File;

    .line 90
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/War;->deploymentDescriptor:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 91
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Deployment descriptor: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/War;->deploymentDescriptor:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " does not exist."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 97
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/types/ZipFileSet;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/ZipFileSet;-><init>()V

    .line 98
    .local v0, "fs":Lorg/apache/tools/ant/types/ZipFileSet;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/War;->deploymentDescriptor:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ZipFileSet;->setFile(Ljava/io/File;)V

    .line 99
    const-string/jumbo v1, "WEB-INF/web.xml"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/ZipFileSet;->setFullpath(Ljava/lang/String;)V

    .line 100
    invoke-super {p0, v0}, Lorg/apache/tools/ant/taskdefs/Jar;->addFileset(Lorg/apache/tools/ant/types/FileSet;)V

    .line 101
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
    .line 178
    const/4 v0, 0x1

    .line 179
    .local v0, "addFile":Z
    const-string/jumbo v1, "WEB-INF/web.xml"

    invoke-virtual {v1, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 181
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/War;->addedWebXmlFile:Ljava/io/File;

    if-eqz v1, :cond_2

    .line 183
    const/4 v0, 0x0

    .line 185
    sget-object v1, Lorg/apache/tools/ant/taskdefs/War;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/War;->addedWebXmlFile:Ljava/io/File;

    invoke-virtual {v1, v2, p1}, Lorg/apache/tools/ant/util/FileUtils;->fileNameEquals(Ljava/io/File;Ljava/io/File;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 186
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Warning: selected "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/War;->archiveType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " files include a second "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "WEB-INF/web.xml"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " which will be ignored.\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "The duplicate entry is at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "The file that will be used is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/War;->addedWebXmlFile:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/War;->logWhenWriting(Ljava/lang/String;I)V

    .line 204
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 205
    invoke-super {p0, p1, p2, p3, p4}, Lorg/apache/tools/ant/taskdefs/Jar;->zipFile(Ljava/io/File;Lorg/apache/tools/zip/ZipOutputStream;Ljava/lang/String;I)V

    .line 207
    :cond_1
    return-void

    .line 197
    :cond_2
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/War;->addedWebXmlFile:Ljava/io/File;

    .line 199
    const/4 v0, 0x1

    .line 201
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/War;->deploymentDescriptor:Ljava/io/File;

    goto :goto_0
.end method
