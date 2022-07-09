.class public Lorg/apache/tools/ant/taskdefs/BuildNumber;
.super Lorg/apache/tools/ant/Task;
.source "BuildNumber.java"


# static fields
.field private static final DEFAULT_FILENAME:Ljava/lang/String; = "build.number"

.field private static final DEFAULT_PROPERTY_NAME:Ljava/lang/String; = "build.number"

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;


# instance fields
.field private myFile:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    return-void
.end method

.method private getBuildNumber(Ljava/util/Properties;)I
    .locals 5
    .param p1, "properties"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 124
    const-string/jumbo v3, "build.number"

    const-string/jumbo v4, "0"

    invoke-virtual {p1, v3, v4}, Ljava/util/Properties;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 129
    .local v0, "buildNumber":Ljava/lang/String;
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    return v3

    .line 130
    :catch_0
    move-exception v2

    .line 131
    .local v2, "nfe":Ljava/lang/NumberFormatException;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, " contains a non integer build number: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 133
    .local v1, "message":Ljava/lang/String;
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v3, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private loadProperties()Ljava/util/Properties;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x0

    .line 146
    const/4 v0, 0x0

    .line 149
    .local v0, "input":Ljava/io/FileInputStream;
    :try_start_0
    new-instance v3, Ljava/util/Properties;

    invoke-direct {v3}, Ljava/util/Properties;-><init>()V

    .line 151
    .local v3, "properties":Ljava/util/Properties;
    new-instance v1, Ljava/io/FileInputStream;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    invoke-direct {v1, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    .end local v0    # "input":Ljava/io/FileInputStream;
    .local v1, "input":Ljava/io/FileInputStream;
    :try_start_1
    invoke-virtual {v3, v1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 157
    if-eqz v1, :cond_0

    .line 159
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 153
    :cond_0
    :goto_0
    return-object v3

    .line 154
    .end local v1    # "input":Ljava/io/FileInputStream;
    .end local v3    # "properties":Ljava/util/Properties;
    .restart local v0    # "input":Ljava/io/FileInputStream;
    :catch_0
    move-exception v2

    .line 155
    .local v2, "ioe":Ljava/io/IOException;
    :goto_1
    :try_start_3
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v4, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 157
    .end local v2    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v4

    :goto_2
    if-eqz v0, :cond_1

    .line 159
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 157
    :cond_1
    :goto_3
    throw v4

    .line 160
    :catch_1
    move-exception v2

    .line 161
    .restart local v2    # "ioe":Ljava/io/IOException;
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "error closing input stream "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5, v7}, Lorg/apache/tools/ant/taskdefs/BuildNumber;->log(Ljava/lang/String;I)V

    goto :goto_3

    .line 160
    .end local v0    # "input":Ljava/io/FileInputStream;
    .end local v2    # "ioe":Ljava/io/IOException;
    .restart local v1    # "input":Ljava/io/FileInputStream;
    .restart local v3    # "properties":Ljava/util/Properties;
    :catch_2
    move-exception v2

    .line 161
    .restart local v2    # "ioe":Ljava/io/IOException;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "error closing input stream "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v7}, Lorg/apache/tools/ant/taskdefs/BuildNumber;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 157
    .end local v2    # "ioe":Ljava/io/IOException;
    :catchall_1
    move-exception v4

    move-object v0, v1

    .end local v1    # "input":Ljava/io/FileInputStream;
    .restart local v0    # "input":Ljava/io/FileInputStream;
    goto :goto_2

    .line 154
    .end local v0    # "input":Ljava/io/FileInputStream;
    .restart local v1    # "input":Ljava/io/FileInputStream;
    :catch_3
    move-exception v2

    move-object v0, v1

    .end local v1    # "input":Ljava/io/FileInputStream;
    .restart local v0    # "input":Ljava/io/FileInputStream;
    goto :goto_1
.end method

.method private validate()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 175
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    if-nez v2, :cond_0

    .line 176
    sget-object v2, Lorg/apache/tools/ant/taskdefs/BuildNumber;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/BuildNumber;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v3

    const-string/jumbo v4, "build.number"

    invoke-virtual {v2, v3, v4}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    .line 179
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 181
    :try_start_0
    sget-object v2, Lorg/apache/tools/ant/taskdefs/BuildNumber;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/util/FileUtils;->createNewFile(Ljava/io/File;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->canRead()Z

    move-result v2

    if-nez v2, :cond_2

    .line 190
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unable to read from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 191
    .local v1, "message":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 182
    .end local v1    # "message":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 183
    .local v0, "ioe":Ljava/io/IOException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t exist and new file can\'t be created."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 185
    .restart local v1    # "message":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 194
    .end local v0    # "ioe":Ljava/io/IOException;
    .end local v1    # "message":Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->canWrite()Z

    move-result v2

    if-nez v2, :cond_3

    .line 195
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Unable to write to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 196
    .restart local v1    # "message":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 198
    .end local v1    # "message":Ljava/lang/String;
    :cond_3
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 75
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    .line 77
    .local v7, "savedFile":Ljava/io/File;
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/BuildNumber;->validate()V

    .line 79
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/BuildNumber;->loadProperties()Ljava/util/Properties;

    move-result-object v6

    .line 80
    .local v6, "properties":Ljava/util/Properties;
    invoke-direct {p0, v6}, Lorg/apache/tools/ant/taskdefs/BuildNumber;->getBuildNumber(Ljava/util/Properties;)I

    move-result v0

    .line 82
    .local v0, "buildNumber":I
    const-string/jumbo v8, "build.number"

    add-int/lit8 v9, v0, 0x1

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    const/4 v4, 0x0

    .line 89
    .local v4, "output":Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v5, Ljava/io/FileOutputStream;

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    invoke-direct {v5, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 91
    .end local v4    # "output":Ljava/io/FileOutputStream;
    .local v5, "output":Ljava/io/FileOutputStream;
    :try_start_1
    const-string/jumbo v1, "Build Number for ANT. Do not edit!"

    .line 93
    .local v1, "header":Ljava/lang/String;
    const-string/jumbo v8, "Build Number for ANT. Do not edit!"

    invoke-virtual {v6, v5, v8}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 99
    if-eqz v5, :cond_0

    .line 101
    :try_start_2
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 106
    :cond_0
    :goto_0
    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    .line 110
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/BuildNumber;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    const-string/jumbo v9, "build.number"

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    return-void

    .line 94
    .end local v1    # "header":Ljava/lang/String;
    .end local v5    # "output":Ljava/io/FileOutputStream;
    .restart local v4    # "output":Ljava/io/FileOutputStream;
    :catch_0
    move-exception v2

    .line 95
    .local v2, "ioe":Ljava/io/IOException;
    :goto_1
    :try_start_3
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Error while writing "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 97
    .local v3, "message":Ljava/lang/String;
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v8, v3, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 99
    .end local v2    # "ioe":Ljava/io/IOException;
    .end local v3    # "message":Ljava/lang/String;
    :catchall_0
    move-exception v8

    :goto_2
    if-eqz v4, :cond_1

    .line 101
    :try_start_4
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 106
    :cond_1
    :goto_3
    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    .line 99
    throw v8

    .line 102
    :catch_1
    move-exception v2

    .line 103
    .restart local v2    # "ioe":Ljava/io/IOException;
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "error closing output stream "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9, v11}, Lorg/apache/tools/ant/taskdefs/BuildNumber;->log(Ljava/lang/String;I)V

    goto :goto_3

    .line 102
    .end local v2    # "ioe":Ljava/io/IOException;
    .end local v4    # "output":Ljava/io/FileOutputStream;
    .restart local v1    # "header":Ljava/lang/String;
    .restart local v5    # "output":Ljava/io/FileOutputStream;
    :catch_2
    move-exception v2

    .line 103
    .restart local v2    # "ioe":Ljava/io/IOException;
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "error closing output stream "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v11}, Lorg/apache/tools/ant/taskdefs/BuildNumber;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 99
    .end local v1    # "header":Ljava/lang/String;
    .end local v2    # "ioe":Ljava/io/IOException;
    :catchall_1
    move-exception v8

    move-object v4, v5

    .end local v5    # "output":Ljava/io/FileOutputStream;
    .restart local v4    # "output":Ljava/io/FileOutputStream;
    goto :goto_2

    .line 94
    .end local v4    # "output":Ljava/io/FileOutputStream;
    .restart local v5    # "output":Ljava/io/FileOutputStream;
    :catch_3
    move-exception v2

    move-object v4, v5

    .end local v5    # "output":Ljava/io/FileOutputStream;
    .restart local v4    # "output":Ljava/io/FileOutputStream;
    goto :goto_1
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 64
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/BuildNumber;->myFile:Ljava/io/File;

    .line 65
    return-void
.end method
