.class public Lorg/apache/tools/ant/taskdefs/EchoXML;
.super Lorg/apache/tools/ant/util/XMLFragment;
.source "EchoXML.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;
    }
.end annotation


# static fields
.field private static final ERROR_NO_XML:Ljava/lang/String; = "No nested XML specified"


# instance fields
.field private append:Z

.field private file:Ljava/io/File;

.field private namespacePolicy:Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 45
    invoke-direct {p0}, Lorg/apache/tools/ant/util/XMLFragment;-><init>()V

    .line 49
    sget-object v0, Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;->DEFAULT:Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/EchoXML;->namespacePolicy:Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;

    .line 105
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 7

    .prologue
    .line 82
    new-instance v4, Lorg/apache/tools/ant/util/DOMElementWriter;

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/EchoXML;->append:Z

    if-nez v5, :cond_0

    const/4 v5, 0x1

    :goto_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/EchoXML;->namespacePolicy:Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;->getPolicy()Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lorg/apache/tools/ant/util/DOMElementWriter;-><init>(ZLorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;)V

    .line 84
    .local v4, "writer":Lorg/apache/tools/ant/util/DOMElementWriter;
    const/4 v2, 0x0

    .line 86
    .local v2, "os":Ljava/io/OutputStream;
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/EchoXML;->file:Ljava/io/File;

    if-eqz v5, :cond_1

    .line 87
    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/EchoXML;->file:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/EchoXML;->append:Z

    invoke-direct {v3, v5, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    .end local v2    # "os":Ljava/io/OutputStream;
    .local v3, "os":Ljava/io/OutputStream;
    move-object v2, v3

    .line 91
    .end local v3    # "os":Ljava/io/OutputStream;
    .restart local v2    # "os":Ljava/io/OutputStream;
    :goto_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/EchoXML;->getFragment()Lorg/w3c/dom/DocumentFragment;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/DocumentFragment;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v1

    .line 92
    .local v1, "n":Lorg/w3c/dom/Node;
    if-nez v1, :cond_2

    .line 93
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "No nested XML specified"

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    .end local v1    # "n":Lorg/w3c/dom/Node;
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Lorg/apache/tools/ant/BuildException;
    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 101
    .end local v0    # "e":Lorg/apache/tools/ant/BuildException;
    :catchall_0
    move-exception v5

    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    throw v5

    .line 82
    .end local v2    # "os":Ljava/io/OutputStream;
    .end local v4    # "writer":Lorg/apache/tools/ant/util/DOMElementWriter;
    :cond_0
    const/4 v5, 0x0

    goto :goto_0

    .line 89
    .restart local v2    # "os":Ljava/io/OutputStream;
    .restart local v4    # "writer":Lorg/apache/tools/ant/util/DOMElementWriter;
    :cond_1
    :try_start_2
    new-instance v3, Lorg/apache/tools/ant/taskdefs/LogOutputStream;

    const/4 v5, 0x2

    invoke-direct {v3, p0, v5}, Lorg/apache/tools/ant/taskdefs/LogOutputStream;-><init>(Lorg/apache/tools/ant/ProjectComponent;I)V

    .end local v2    # "os":Ljava/io/OutputStream;
    .restart local v3    # "os":Ljava/io/OutputStream;
    move-object v2, v3

    .end local v3    # "os":Ljava/io/OutputStream;
    .restart local v2    # "os":Ljava/io/OutputStream;
    goto :goto_1

    .line 95
    .restart local v1    # "n":Lorg/w3c/dom/Node;
    :cond_2
    check-cast v1, Lorg/w3c/dom/Element;

    .end local v1    # "n":Lorg/w3c/dom/Node;
    invoke-virtual {v4, v1, v2}, Lorg/apache/tools/ant/util/DOMElementWriter;->write(Lorg/w3c/dom/Element;Ljava/io/OutputStream;)V
    :try_end_2
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 101
    invoke-static {v2}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/OutputStream;)V

    .line 103
    return-void

    .line 98
    :catch_1
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/Exception;
    :try_start_3
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v5, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
.end method

.method public setAppend(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 75
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/EchoXML;->append:Z

    .line 76
    return-void
.end method

.method public setFile(Ljava/io/File;)V
    .locals 0
    .param p1, "f"    # Ljava/io/File;

    .prologue
    .line 57
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/EchoXML;->file:Ljava/io/File;

    .line 58
    return-void
.end method

.method public setNamespacePolicy(Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;)V
    .locals 0
    .param p1, "n"    # Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;

    .prologue
    .line 67
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/EchoXML;->namespacePolicy:Lorg/apache/tools/ant/taskdefs/EchoXML$NamespacePolicy;

    .line 68
    return-void
.end method
