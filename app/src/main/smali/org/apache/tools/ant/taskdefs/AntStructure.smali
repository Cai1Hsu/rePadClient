.class public Lorg/apache/tools/ant/taskdefs/AntStructure;
.super Lorg/apache/tools/ant/Task;
.source "AntStructure.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/AntStructure$1;,
        Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;,
        Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;
    }
.end annotation


# static fields
.field private static final LINE_SEP:Ljava/lang/String;

.field static class$java$lang$Boolean:Ljava/lang/Class;

.field static class$org$apache$tools$ant$TaskContainer:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$EnumeratedAttribute:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$Reference:Ljava/lang/Class;


# instance fields
.field private output:Ljava/io/File;

.field private printer:Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 50
    const-string/jumbo v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/AntStructure;->LINE_SEP:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 48
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 54
    new-instance v0, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;-><init>(Lorg/apache/tools/ant/taskdefs/AntStructure$1;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/AntStructure;->printer:Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;

    .line 181
    return-void
.end method

.method static access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    sget-object v0, Lorg/apache/tools/ant/taskdefs/AntStructure;->LINE_SEP:Ljava/lang/String;

    return-object v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 306
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


# virtual methods
.method public add(Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;)V
    .locals 0
    .param p1, "p"    # Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;

    .prologue
    .line 70
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AntStructure;->printer:Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;

    .line 71
    return-void
.end method

.method protected areNmtokens([Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # [Ljava/lang/String;

    .prologue
    .line 486
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;->areNmtokens([Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public execute()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AntStructure;->output:Ljava/io/File;

    if-nez v8, :cond_0

    .line 81
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v9, "output attribute is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AntStructure;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v8, v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v8

    .line 84
    :cond_0
    const/4 v2, 0x0

    .line 87
    .local v2, "out":Ljava/io/PrintWriter;
    :try_start_0
    new-instance v3, Ljava/io/PrintWriter;

    new-instance v8, Ljava/io/OutputStreamWriter;

    new-instance v9, Ljava/io/FileOutputStream;

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/AntStructure;->output:Ljava/io/File;

    invoke-direct {v9, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    const-string/jumbo v10, "UTF8"

    invoke-direct {v8, v9, v10}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v3, v8}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .end local v2    # "out":Ljava/io/PrintWriter;
    .local v3, "out":Ljava/io/PrintWriter;
    move-object v2, v3

    .line 98
    .end local v3    # "out":Ljava/io/PrintWriter;
    .restart local v2    # "out":Ljava/io/PrintWriter;
    :goto_0
    :try_start_1
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AntStructure;->printer:Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AntStructure;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    new-instance v10, Ljava/util/Hashtable;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AntStructure;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    invoke-virtual {v11}, Lorg/apache/tools/ant/Project;->getTaskDefinitions()Ljava/util/Hashtable;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/util/Hashtable;-><init>(Ljava/util/Map;)V

    new-instance v11, Ljava/util/Hashtable;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AntStructure;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v12

    invoke-virtual {v12}, Lorg/apache/tools/ant/Project;->getDataTypeDefinitions()Ljava/util/Hashtable;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/util/Hashtable;-><init>(Ljava/util/Map;)V

    invoke-interface {v8, v2, v9, v10, v11}, Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;->printHead(Ljava/io/PrintWriter;Lorg/apache/tools/ant/Project;Ljava/util/Hashtable;Ljava/util/Hashtable;)V

    .line 102
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AntStructure;->printer:Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;

    invoke-interface {v8, v2}, Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;->printTargetDecl(Ljava/io/PrintWriter;)V

    .line 104
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AntStructure;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/Project;->getCopyOfDataTypeDefinitions()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 106
    .local v0, "dataTypes":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    .line 107
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 108
    .local v6, "typeName":Ljava/lang/String;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/AntStructure;->printer:Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AntStructure;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AntStructure;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/Project;->getDataTypeDefinitions()Ljava/util/Hashtable;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Class;

    invoke-interface {v9, v2, v10, v6, v8}, Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;->printElementDecl(Ljava/io/PrintWriter;Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Class;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 127
    .end local v0    # "dataTypes":Ljava/util/Iterator;
    .end local v6    # "typeName":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 128
    .local v1, "ioe":Ljava/io/IOException;
    :try_start_2
    new-instance v8, Lorg/apache/tools/ant/BuildException;

    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Error writing "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/AntStructure;->output:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AntStructure;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v10

    invoke-direct {v8, v9, v1, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 131
    .end local v1    # "ioe":Ljava/io/IOException;
    :catchall_0
    move-exception v8

    if-eqz v2, :cond_1

    .line 132
    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V

    :cond_1
    throw v8

    .line 88
    :catch_1
    move-exception v7

    .line 95
    .local v7, "ue":Ljava/io/UnsupportedEncodingException;
    :try_start_3
    new-instance v3, Ljava/io/PrintWriter;

    new-instance v8, Ljava/io/FileWriter;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/AntStructure;->output:Ljava/io/File;

    invoke-direct {v8, v9}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v8}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .end local v2    # "out":Ljava/io/PrintWriter;
    .restart local v3    # "out":Ljava/io/PrintWriter;
    move-object v2, v3

    .end local v3    # "out":Ljava/io/PrintWriter;
    .restart local v2    # "out":Ljava/io/PrintWriter;
    goto/16 :goto_0

    .line 113
    .end local v7    # "ue":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "dataTypes":Ljava/util/Iterator;
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AntStructure;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/Project;->getCopyOfTaskDefinitions()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 115
    .local v5, "tasks":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 116
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 117
    .local v4, "tName":Ljava/lang/String;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/AntStructure;->printer:Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AntStructure;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v10

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/AntStructure;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v8

    invoke-virtual {v8}, Lorg/apache/tools/ant/Project;->getTaskDefinitions()Ljava/util/Hashtable;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Class;

    invoke-interface {v9, v2, v10, v4, v8}, Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;->printElementDecl(Ljava/io/PrintWriter;Lorg/apache/tools/ant/Project;Ljava/lang/String;Ljava/lang/Class;)V

    goto :goto_2

    .line 121
    .end local v4    # "tName":Ljava/lang/String;
    :cond_3
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/AntStructure;->printer:Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;

    invoke-interface {v8, v2}, Lorg/apache/tools/ant/taskdefs/AntStructure$StructurePrinter;->printTail(Ljava/io/PrintWriter;)V

    .line 123
    invoke-virtual {v2}, Ljava/io/PrintWriter;->checkError()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 124
    new-instance v8, Ljava/io/IOException;

    const-string/jumbo v9, "Encountered an error writing Ant structure"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 131
    :cond_4
    if-eqz v2, :cond_5

    .line 132
    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V

    .line 135
    :cond_5
    return-void
.end method

.method protected isNmtoken(Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 474
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/AntStructure$DTDPrinter;->isNmtoken(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setOutput(Ljava/io/File;)V
    .locals 0
    .param p1, "output"    # Ljava/io/File;

    .prologue
    .line 61
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/AntStructure;->output:Ljava/io/File;

    .line 62
    return-void
.end method
