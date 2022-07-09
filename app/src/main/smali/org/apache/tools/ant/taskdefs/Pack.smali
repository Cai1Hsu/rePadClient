.class public abstract Lorg/apache/tools/ant/taskdefs/Pack;
.super Lorg/apache/tools/ant/Task;
.source "Pack.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x2000

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field protected source:Ljava/io/File;

.field private src:Lorg/apache/tools/ant/types/Resource;

.field protected zipFile:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 78
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

.method private validate()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Pack;->zipFile:Ljava/io/File;

    if-nez v0, :cond_0

    .line 110
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "zipfile attribute is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Pack;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 113
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Pack;->zipFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 114
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "zipfile attribute must not represent a directory!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Pack;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 118
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Pack;->getSrcResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    if-nez v0, :cond_2

    .line 119
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "src attribute or nested resource is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Pack;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 122
    :cond_2
    return-void
.end method

.method private zipFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 4
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "zOut"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 152
    const/16 v2, 0x2000

    new-array v0, v2, [B

    .line 153
    .local v0, "buffer":[B
    const/4 v1, 0x0

    .line 155
    .local v1, "count":I
    :cond_0
    invoke-virtual {p2, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 156
    array-length v2, v0

    invoke-virtual {p1, v0, v3, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v1

    .line 157
    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 158
    return-void
.end method


# virtual methods
.method public addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 3
    .param p1, "a"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 92
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 93
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "No resource selected, "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Pack;->getTaskName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " needs exactly one resource."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_0
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    .line 97
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Pack;->getTaskName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " cannot handle multiple resources at once. ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " resources were selected.)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_1
    invoke-interface {p1}, Lorg/apache/tools/ant/types/ResourceCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Pack;->setSrcResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 102
    return-void
.end method

.method public execute()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 129
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Pack;->validate()V

    .line 131
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Pack;->getSrcResource()Lorg/apache/tools/ant/types/Resource;

    move-result-object v0

    .line 132
    .local v0, "s":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 133
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Nothing to do: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " doesn\'t exist."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Pack;->log(Ljava/lang/String;)V

    .line 142
    :goto_0
    return-void

    .line 135
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Pack;->zipFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-gez v1, :cond_1

    .line 136
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Building: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Pack;->zipFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Pack;->log(Ljava/lang/String;)V

    .line 137
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Pack;->pack()V

    goto :goto_0

    .line 139
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Nothing to do: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Pack;->zipFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " is up to date."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/Pack;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getSrcResource()Lorg/apache/tools/ant/types/Resource;
    .locals 1

    .prologue
    .line 198
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Pack;->src:Lorg/apache/tools/ant/types/Resource;

    return-object v0
.end method

.method protected abstract pack()V
.end method

.method public setDestfile(Ljava/io/File;)V
    .locals 0
    .param p1, "zipFile"    # Ljava/io/File;

    .prologue
    .line 59
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/Pack;->setZipfile(Ljava/io/File;)V

    .line 60
    return-void
.end method

.method public setSrc(Ljava/io/File;)V
    .locals 1
    .param p1, "src"    # Ljava/io/File;

    .prologue
    .line 67
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Pack;->setSrcResource(Lorg/apache/tools/ant/types/Resource;)V

    .line 68
    return-void
.end method

.method public setSrcResource(Lorg/apache/tools/ant/types/Resource;)V
    .locals 3
    .param p1, "src"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 75
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 76
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "the source can\'t be a directory"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 78
    :cond_0
    sget-object v1, Lorg/apache/tools/ant/taskdefs/Pack;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v1, :cond_2

    const-string/jumbo v1, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/Pack;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/taskdefs/Pack;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_0
    invoke-virtual {p1, v1}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 79
    .local v0, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v0, :cond_3

    .line 80
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/Pack;->source:Ljava/io/File;

    .line 84
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Pack;->src:Lorg/apache/tools/ant/types/Resource;

    .line 85
    return-void

    .line 78
    .end local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_2
    sget-object v1, Lorg/apache/tools/ant/taskdefs/Pack;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_0

    .line 81
    .restart local v0    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Pack;->supportsNonFileResources()Z

    move-result v1

    if-nez v1, :cond_1

    .line 82
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Only FileSystem resources are supported."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setZipfile(Ljava/io/File;)V
    .locals 0
    .param p1, "zipFile"    # Ljava/io/File;

    .prologue
    .line 51
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Pack;->zipFile:Ljava/io/File;

    .line 52
    return-void
.end method

.method protected supportsNonFileResources()Z
    .locals 1

    .prologue
    .line 209
    const/4 v0, 0x0

    return v0
.end method

.method protected zipFile(Ljava/io/File;Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .param p2, "zOut"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 168
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    invoke-virtual {p0, v0, p2}, Lorg/apache/tools/ant/taskdefs/Pack;->zipResource(Lorg/apache/tools/ant/types/Resource;Ljava/io/OutputStream;)V

    .line 169
    return-void
.end method

.method protected zipResource(Lorg/apache/tools/ant/types/Resource;Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "resource"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "zOut"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 179
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Resource;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 181
    .local v0, "rIn":Ljava/io/InputStream;
    :try_start_0
    invoke-direct {p0, v0, p2}, Lorg/apache/tools/ant/taskdefs/Pack;->zipFile(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 185
    return-void

    .line 183
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v1
.end method
