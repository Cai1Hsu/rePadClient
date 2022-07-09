.class public Lorg/apache/tools/ant/taskdefs/CVSPass;
.super Lorg/apache/tools/ant/Task;
.source "CVSPass.java"


# instance fields
.field private cvsRoot:Ljava/lang/String;

.field private passFile:Ljava/io/File;

.field private password:Ljava/lang/String;

.field private final shifts:[C


# direct methods
.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v0, 0x0

    .line 72
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 43
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->cvsRoot:Ljava/lang/String;

    .line 45
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->passFile:Ljava/io/File;

    .line 47
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->password:Ljava/lang/String;

    .line 50
    const/16 v0, 0x100

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->shifts:[C

    .line 73
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "cygwin.user.home"

    const-string/jumbo v3, "user.home"

    invoke-static {v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    sget-char v2, Ljava/io/File;->separatorChar:C

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, ".cvspass"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->passFile:Ljava/io/File;

    .line 77
    return-void

    .line 50
    nop

    :array_0
    .array-data 2
        0x0s
        0x1s
        0x2s
        0x3s
        0x4s
        0x5s
        0x6s
        0x7s
        0x8s
        0x9s
        0xas
        0xbs
        0xcs
        0xds
        0xes
        0xfs
        0x10s
        0x11s
        0x12s
        0x13s
        0x14s
        0x15s
        0x16s
        0x17s
        0x18s
        0x19s
        0x1as
        0x1bs
        0x1cs
        0x1ds
        0x1es
        0x1fs
        0x72s
        0x78s
        0x35s
        0x4fs
        0x60s
        0x6ds
        0x48s
        0x6cs
        0x46s
        0x40s
        0x4cs
        0x43s
        0x74s
        0x4as
        0x44s
        0x57s
        0x6fs
        0x34s
        0x4bs
        0x77s
        0x31s
        0x22s
        0x52s
        0x51s
        0x5fs
        0x41s
        0x70s
        0x56s
        0x76s
        0x6es
        0x7as
        0x69s
        0x29s
        0x39s
        0x53s
        0x2bs
        0x2es
        0x66s
        0x28s
        0x59s
        0x26s
        0x67s
        0x2ds
        0x32s
        0x2as
        0x7bs
        0x5bs
        0x23s
        0x7ds
        0x37s
        0x36s
        0x42s
        0x7cs
        0x7es
        0x3bs
        0x2fs
        0x5cs
        0x47s
        0x73s
        0x4es
        0x58s
        0x6bs
        0x6as
        0x38s
        0x24s
        0x79s
        0x75s
        0x68s
        0x65s
        0x64s
        0x45s
        0x49s
        0x63s
        0x3fs
        0x5es
        0x5ds
        0x27s
        0x25s
        0x3ds
        0x30s
        0x3as
        0x71s
        0x20s
        0x5as
        0x2cs
        0x62s
        0x3cs
        0x33s
        0x21s
        0x61s
        0x3es
        0x4ds
        0x54s
        0x50s
        0x55s
        0xdfs
        0xe1s
        0xd8s
        0xbbs
        0xa6s
        0xe5s
        0xbds
        0xdes
        0xbcs
        0x8ds
        0xf9s
        0x94s
        0xc8s
        0xb8s
        0x88s
        0xf8s
        0xbes
        0xc7s
        0xaas
        0xb5s
        0xccs
        0x8as
        0xe8s
        0xdas
        0xb7s
        0xffs
        0xeas
        0xdcs
        0xf7s
        0xd5s
        0xcbs
        0xe2s
        0xc1s
        0xaes
        0xacs
        0xe4s
        0xfcs
        0xd9s
        0xc9s
        0x83s
        0xe6s
        0xc5s
        0xd3s
        0x91s
        0xees
        0xa1s
        0xb3s
        0xa0s
        0xd4s
        0xcfs
        0xdds
        0xfes
        0xads
        0xcas
        0x92s
        0xe0s
        0x97s
        0x8cs
        0xc4s
        0xcds
        0x82s
        0x87s
        0x85s
        0x8fs
        0xf6s
        0xc0s
        0x9fs
        0xf4s
        0xefs
        0xb9s
        0xa8s
        0xd7s
        0x90s
        0x8bs
        0xa5s
        0xb4s
        0x9ds
        0x93s
        0xbas
        0xd6s
        0xb0s
        0xe3s
        0xe7s
        0xdbs
        0xa9s
        0xafs
        0x9cs
        0xces
        0xc6s
        0x81s
        0xa4s
        0x96s
        0xd2s
        0x9as
        0xb1s
        0x86s
        0x7fs
        0xb6s
        0x80s
        0x9es
        0xd0s
        0xa2s
        0x84s
        0xa7s
        0xd1s
        0x95s
        0xf1s
        0x99s
        0xfbs
        0xeds
        0xecs
        0xabs
        0xc3s
        0xf3s
        0xe9s
        0xfds
        0xf0s
        0xc2s
        0xfas
        0xbfs
        0x9bs
        0x8es
        0x89s
        0xf5s
        0xebs
        0xa3s
        0xf2s
        0xb2s
        0x98s
    .end array-data
.end method

.method private final mangle(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 137
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 138
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 139
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->shifts:[C

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    aget-char v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 138
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 141
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public final execute()V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x4

    .line 85
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->cvsRoot:Ljava/lang/String;

    if-nez v8, :cond_0

    .line 86
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v9, "cvsroot is required"

    invoke-direct {v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 88
    :cond_0
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->password:Ljava/lang/String;

    if-nez v8, :cond_1

    .line 89
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v9, "password is required"

    invoke-direct {v8, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 92
    :cond_1
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "cvsRoot: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->cvsRoot:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v10}, Lorg/apache/tools/ant/taskdefs/CVSPass;->log(Ljava/lang/String;I)V

    .line 93
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "password: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->password:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v10}, Lorg/apache/tools/ant/taskdefs/CVSPass;->log(Ljava/lang/String;I)V

    .line 94
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "passFile: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->passFile:Ljava/io/File;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8, v10}, Lorg/apache/tools/ant/taskdefs/CVSPass;->log(Ljava/lang/String;I)V

    .line 96
    const/4 v4, 0x0

    .line 97
    .local v4, "reader":Ljava/io/BufferedReader;
    const/4 v6, 0x0

    .line 99
    .local v6, "writer":Ljava/io/BufferedWriter;
    :try_start_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 101
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->passFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v8

    if-eqz v8, :cond_5

    .line 102
    new-instance v5, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/FileReader;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->passFile:Ljava/io/File;

    invoke-direct {v8, v9}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v5, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .local v5, "reader":Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 106
    .local v2, "line":Ljava/lang/String;
    :cond_2
    :goto_0
    :try_start_1
    invoke-virtual {v5}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 107
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->cvsRoot:Ljava/lang/String;

    invoke-virtual {v2, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 108
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    sget-object v9, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    .line 122
    :catch_0
    move-exception v1

    move-object v4, v5

    .line 123
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v2    # "line":Ljava/lang/String;
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .local v1, "e":Ljava/io/IOException;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :goto_1
    :try_start_2
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v8, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 125
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v8

    :goto_2
    if-eqz v4, :cond_3

    .line 127
    :try_start_3
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    .line 132
    :cond_3
    :goto_3
    invoke-static {v6}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 125
    throw v8

    .end local v4    # "reader":Ljava/io/BufferedReader;
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local v2    # "line":Ljava/lang/String;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    :cond_4
    move-object v4, v5

    .line 113
    .end local v2    # "line":Ljava/lang/String;
    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    :cond_5
    :try_start_4
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->cvsRoot:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    const-string/jumbo v9, " A"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->password:Ljava/lang/String;

    invoke-direct {p0, v9}, Lorg/apache/tools/ant/taskdefs/CVSPass;->mangle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 116
    .local v3, "pwdfile":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v9, "Writing -> "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x4

    invoke-virtual {p0, v8, v9}, Lorg/apache/tools/ant/taskdefs/CVSPass;->log(Ljava/lang/String;I)V

    .line 118
    new-instance v7, Ljava/io/BufferedWriter;

    new-instance v8, Ljava/io/FileWriter;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->passFile:Ljava/io/File;

    invoke-direct {v8, v9}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v7, v8}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 120
    .end local v6    # "writer":Ljava/io/BufferedWriter;
    .local v7, "writer":Ljava/io/BufferedWriter;
    :try_start_5
    invoke-virtual {v7, v3}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 121
    invoke-virtual {v7}, Ljava/io/BufferedWriter;->newLine()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 125
    if-eqz v4, :cond_6

    .line 127
    :try_start_6
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 132
    :cond_6
    :goto_4
    invoke-static {v7}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    .line 134
    return-void

    .line 128
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v3    # "pwdfile":Ljava/lang/String;
    .end local v7    # "writer":Ljava/io/BufferedWriter;
    .restart local v6    # "writer":Ljava/io/BufferedWriter;
    :catch_1
    move-exception v9

    goto :goto_3

    .end local v6    # "writer":Ljava/io/BufferedWriter;
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local v3    # "pwdfile":Ljava/lang/String;
    .restart local v7    # "writer":Ljava/io/BufferedWriter;
    :catch_2
    move-exception v8

    goto :goto_4

    .line 125
    .end local v3    # "pwdfile":Ljava/lang/String;
    .end local v4    # "reader":Ljava/io/BufferedReader;
    .end local v7    # "writer":Ljava/io/BufferedWriter;
    .restart local v2    # "line":Ljava/lang/String;
    .restart local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v6    # "writer":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v8

    move-object v4, v5

    .end local v5    # "reader":Ljava/io/BufferedReader;
    .restart local v4    # "reader":Ljava/io/BufferedReader;
    goto :goto_2

    .end local v2    # "line":Ljava/lang/String;
    .end local v6    # "writer":Ljava/io/BufferedWriter;
    .restart local v3    # "pwdfile":Ljava/lang/String;
    .restart local v7    # "writer":Ljava/io/BufferedWriter;
    :catchall_2
    move-exception v8

    move-object v6, v7

    .end local v7    # "writer":Ljava/io/BufferedWriter;
    .restart local v6    # "writer":Ljava/io/BufferedWriter;
    goto :goto_2

    .line 122
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v3    # "pwdfile":Ljava/lang/String;
    :catch_3
    move-exception v1

    goto :goto_1

    .end local v6    # "writer":Ljava/io/BufferedWriter;
    .restart local v0    # "buf":Ljava/lang/StringBuffer;
    .restart local v3    # "pwdfile":Ljava/lang/String;
    .restart local v7    # "writer":Ljava/io/BufferedWriter;
    :catch_4
    move-exception v1

    move-object v6, v7

    .end local v7    # "writer":Ljava/io/BufferedWriter;
    .restart local v6    # "writer":Ljava/io/BufferedWriter;
    goto :goto_1
.end method

.method public setCvsroot(Ljava/lang/String;)V
    .locals 0
    .param p1, "cvsRoot"    # Ljava/lang/String;

    .prologue
    .line 150
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->cvsRoot:Ljava/lang/String;

    .line 151
    return-void
.end method

.method public setPassfile(Ljava/io/File;)V
    .locals 0
    .param p1, "passFile"    # Ljava/io/File;

    .prologue
    .line 159
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->passFile:Ljava/io/File;

    .line 160
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 0
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 168
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/CVSPass;->password:Ljava/lang/String;

    .line 169
    return-void
.end method
