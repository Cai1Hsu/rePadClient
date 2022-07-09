.class Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;
.super Lorg/apache/tools/ant/taskdefs/Execute$Java13CommandLauncher;
.source "Execute.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Execute;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "VmsCommandLauncher"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 1161
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Execute$Java13CommandLauncher;-><init>()V

    .line 1162
    return-void
.end method

.method private createCommandFile([Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;
    .locals 11
    .param p1, "cmd"    # [Ljava/lang/String;
    .param p2, "env"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 1214
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/Execute;->access$200()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    const-string/jumbo v1, "ANT"

    const-string/jumbo v2, ".COM"

    const/4 v3, 0x0

    move v5, v4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v10

    .line 1215
    .local v10, "script":Ljava/io/File;
    const/4 v8, 0x0

    .line 1217
    .local v8, "out":Ljava/io/BufferedWriter;
    :try_start_0
    new-instance v9, Ljava/io/BufferedWriter;

    new-instance v0, Ljava/io/FileWriter;

    invoke-direct {v0, v10}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v9, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1220
    .end local v8    # "out":Ljava/io/BufferedWriter;
    .local v9, "out":Ljava/io/BufferedWriter;
    if-eqz p2, :cond_1

    .line 1222
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    :try_start_1
    array-length v0, p2

    if-ge v7, v0, :cond_1

    .line 1223
    aget-object v0, p2, v7

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v6

    .line 1224
    .local v6, "eqIndex":I
    const/4 v0, -0x1

    if-eq v6, v0, :cond_0

    .line 1225
    const-string/jumbo v0, "$ DEFINE/NOLOG "

    invoke-virtual {v9, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1226
    aget-object v0, p2, v7

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1227
    const-string/jumbo v0, " \""

    invoke-virtual {v9, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1228
    aget-object v0, p2, v7

    add-int/lit8 v1, v6, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1229
    const/16 v0, 0x22

    invoke-virtual {v9, v0}, Ljava/io/BufferedWriter;->write(I)V

    .line 1230
    invoke-virtual {v9}, Ljava/io/BufferedWriter;->newLine()V

    .line 1222
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 1234
    .end local v6    # "eqIndex":I
    .end local v7    # "i":I
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "$ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1235
    const/4 v7, 0x1

    .restart local v7    # "i":I
    :goto_1
    array-length v0, p1

    if-ge v7, v0, :cond_2

    .line 1236
    const-string/jumbo v0, " -"

    invoke-virtual {v9, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 1237
    invoke-virtual {v9}, Ljava/io/BufferedWriter;->newLine()V

    .line 1238
    aget-object v0, p1, v7

    invoke-virtual {v9, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1235
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 1241
    :cond_2
    invoke-static {v9}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 1243
    return-object v10

    .line 1241
    .end local v7    # "i":I
    .end local v9    # "out":Ljava/io/BufferedWriter;
    .restart local v8    # "out":Ljava/io/BufferedWriter;
    :catchall_0
    move-exception v0

    :goto_2
    invoke-static {v8}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v0

    .end local v8    # "out":Ljava/io/BufferedWriter;
    .restart local v9    # "out":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v0

    move-object v8, v9

    .end local v9    # "out":Ljava/io/BufferedWriter;
    .restart local v8    # "out":Ljava/io/BufferedWriter;
    goto :goto_2
.end method

.method private deleteAfter(Ljava/io/File;Ljava/lang/Process;)V
    .locals 1
    .param p1, "f"    # Ljava/io/File;
    .param p2, "p"    # Ljava/lang/Process;

    .prologue
    .line 1247
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Execute$2;

    invoke-direct {v0, p0, p2, p1}, Lorg/apache/tools/ant/taskdefs/Execute$2;-><init>(Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;Ljava/lang/Process;Ljava/io/File;)V

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Execute$2;->start()V

    .line 1258
    return-void
.end method


# virtual methods
.method public exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;
    .locals 5
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "cmd"    # [Ljava/lang/String;
    .param p3, "env"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1175
    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;->createCommandFile([Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 1176
    .local v0, "cmdFile":Ljava/io/File;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-super {p0, p1, v2, p3}, Lorg/apache/tools/ant/taskdefs/Execute$Java13CommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v1

    .line 1178
    .local v1, "p":Ljava/lang/Process;
    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;->deleteAfter(Ljava/io/File;Ljava/lang/Process;)V

    .line 1179
    return-object v1
.end method

.method public exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;
    .locals 5
    .param p1, "project"    # Lorg/apache/tools/ant/Project;
    .param p2, "cmd"    # [Ljava/lang/String;
    .param p3, "env"    # [Ljava/lang/String;
    .param p4, "workingDir"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1197
    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;->createCommandFile([Ljava/lang/String;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 1198
    .local v0, "cmdFile":Ljava/io/File;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-super {p0, p1, v2, p3, p4}, Lorg/apache/tools/ant/taskdefs/Execute$Java13CommandLauncher;->exec(Lorg/apache/tools/ant/Project;[Ljava/lang/String;[Ljava/lang/String;Ljava/io/File;)Ljava/lang/Process;

    move-result-object v1

    .line 1200
    .local v1, "p":Ljava/lang/Process;
    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Execute$VmsCommandLauncher;->deleteAfter(Ljava/io/File;Ljava/lang/Process;)V

    .line 1201
    return-object v1
.end method
