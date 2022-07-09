.class public Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;
.super Lorg/apache/tools/ant/Task;
.source "PropertyFile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Unit;,
        Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;
    }
.end annotation


# instance fields
.field private comment:Ljava/lang/String;

.field private entries:Ljava/util/Vector;

.field private properties:Ljava/util/Properties;

.field private propertyfile:Ljava/io/File;

.field private useJDKProperties:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 111
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 125
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->entries:Ljava/util/Vector;

    .line 660
    return-void
.end method

.method private checkParam(Ljava/io/File;)Z
    .locals 1
    .param p1, "param"    # Ljava/io/File;

    .prologue
    .line 262
    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private checkParameters()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 206
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->propertyfile:Ljava/io/File;

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->checkParam(Ljava/io/File;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 207
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "file token must not be null."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 210
    :cond_0
    return-void
.end method

.method private executeOperation()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 159
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->entries:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 160
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;

    .line 161
    .local v1, "entry":Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->properties:Ljava/util/Properties;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;->executeOn(Ljava/util/Properties;)V

    goto :goto_0

    .line 163
    .end local v1    # "entry":Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;
    :cond_0
    return-void
.end method

.method private readFile()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 166
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->useJDKProperties:Z

    if-eqz v6, :cond_1

    .line 169
    new-instance v6, Ljava/util/Properties;

    invoke-direct {v6}, Ljava/util/Properties;-><init>()V

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->properties:Ljava/util/Properties;

    .line 174
    :goto_0
    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->propertyfile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 175
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Updating property file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->propertyfile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->log(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 177
    const/4 v1, 0x0

    .line 179
    .local v1, "fis":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v2, Ljava/io/FileInputStream;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->propertyfile:Ljava/io/File;

    invoke-direct {v2, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 180
    .end local v1    # "fis":Ljava/io/FileInputStream;
    .local v2, "fis":Ljava/io/FileInputStream;
    :try_start_2
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 181
    .local v0, "bis":Ljava/io/BufferedInputStream;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->properties:Ljava/util/Properties;

    invoke-virtual {v6, v0}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 183
    if-eqz v2, :cond_0

    .line 184
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 203
    .end local v0    # "bis":Ljava/io/BufferedInputStream;
    .end local v2    # "fis":Ljava/io/FileInputStream;
    :cond_0
    :goto_1
    return-void

    .line 171
    :cond_1
    new-instance v6, Lorg/apache/tools/ant/util/LayoutPreservingProperties;

    invoke-direct {v6}, Lorg/apache/tools/ant/util/LayoutPreservingProperties;-><init>()V

    iput-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->properties:Ljava/util/Properties;

    goto :goto_0

    .line 183
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    :catchall_0
    move-exception v6

    :goto_2
    if-eqz v1, :cond_2

    .line 184
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    :cond_2
    throw v6
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 200
    .end local v1    # "fis":Ljava/io/FileInputStream;
    :catch_0
    move-exception v3

    .line 201
    .local v3, "ioe":Ljava/io/IOException;
    new-instance v6, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 188
    .end local v3    # "ioe":Ljava/io/IOException;
    :cond_3
    :try_start_5
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Creating new property file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->propertyfile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->log(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 190
    const/4 v4, 0x0

    .line 192
    .local v4, "out":Ljava/io/FileOutputStream;
    :try_start_6
    new-instance v5, Ljava/io/FileOutputStream;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->propertyfile:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 193
    .end local v4    # "out":Ljava/io/FileOutputStream;
    .local v5, "out":Ljava/io/FileOutputStream;
    :try_start_7
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->flush()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 195
    if-eqz v5, :cond_0

    .line 196
    :try_start_8
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    goto :goto_1

    .line 195
    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v4    # "out":Ljava/io/FileOutputStream;
    :catchall_1
    move-exception v6

    :goto_3
    if-eqz v4, :cond_4

    .line 196
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V

    :cond_4
    throw v6
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0

    .line 195
    .end local v4    # "out":Ljava/io/FileOutputStream;
    .restart local v5    # "out":Ljava/io/FileOutputStream;
    :catchall_2
    move-exception v6

    move-object v4, v5

    .end local v5    # "out":Ljava/io/FileOutputStream;
    .restart local v4    # "out":Ljava/io/FileOutputStream;
    goto :goto_3

    .line 183
    .end local v4    # "out":Ljava/io/FileOutputStream;
    .restart local v2    # "fis":Ljava/io/FileInputStream;
    :catchall_3
    move-exception v6

    move-object v1, v2

    .end local v2    # "fis":Ljava/io/FileInputStream;
    .restart local v1    # "fis":Ljava/io/FileInputStream;
    goto :goto_2
.end method

.method private writeFile()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 238
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 240
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->properties:Ljava/util/Properties;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->comment:Ljava/lang/String;

    invoke-virtual {v3, v0, v4}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 245
    :try_start_1
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->propertyfile:Ljava/io/File;

    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 248
    .local v1, "os":Ljava/io/OutputStream;
    :try_start_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/OutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 250
    :try_start_3
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 259
    return-void

    .line 241
    .end local v1    # "os":Ljava/io/OutputStream;
    :catch_0
    move-exception v2

    .line 242
    .local v2, "x":Ljava/io/IOException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3

    .line 250
    .end local v2    # "x":Ljava/io/IOException;
    .restart local v1    # "os":Ljava/io/OutputStream;
    :catchall_0
    move-exception v3

    :try_start_4
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw v3
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 252
    :catch_1
    move-exception v2

    .line 253
    .restart local v2    # "x":Ljava/io/IOException;
    :try_start_5
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->propertyfile:Ljava/io/File;

    invoke-virtual {v3, v4}, Lorg/apache/tools/ant/util/FileUtils;->tryHardToDelete(Ljava/io/File;)Z

    .line 254
    throw v2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 256
    .end local v1    # "os":Ljava/io/OutputStream;
    .end local v2    # "x":Ljava/io/IOException;
    :catch_2
    move-exception v2

    .line 257
    .restart local v2    # "x":Ljava/io/IOException;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v3
.end method


# virtual methods
.method public createEntry()Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;
    .locals 2

    .prologue
    .line 153
    new-instance v0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;-><init>()V

    .line 154
    .local v0, "e":Lorg/apache/tools/ant/taskdefs/optional/PropertyFile$Entry;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->entries:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 155
    return-object v0
.end method

.method public execute()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->checkParameters()V

    .line 143
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->readFile()V

    .line 144
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->executeOperation()V

    .line 145
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->writeFile()V

    .line 146
    return-void
.end method

.method public setComment(Ljava/lang/String;)V
    .locals 0
    .param p1, "hdr"    # Ljava/lang/String;

    .prologue
    .line 225
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->comment:Ljava/lang/String;

    .line 226
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 217
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->propertyfile:Ljava/io/File;

    .line 218
    return-void
.end method

.method public setJDKProperties(Z)V
    .locals 0
    .param p1, "val"    # Z

    .prologue
    .line 233
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/optional/PropertyFile;->useJDKProperties:Z

    .line 234
    return-void
.end method
