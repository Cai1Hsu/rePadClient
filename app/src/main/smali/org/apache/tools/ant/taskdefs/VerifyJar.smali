.class public Lorg/apache/tools/ant/taskdefs/VerifyJar;
.super Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;
.source "VerifyJar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/VerifyJar$1;,
        Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;,
        Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;
    }
.end annotation


# static fields
.field public static final ERROR_NO_FILE:Ljava/lang/String; = "Not found :"

.field public static final ERROR_NO_VERIFY:Ljava/lang/String; = "Failed to verify "

.field private static final VERIFIED_TEXT:Ljava/lang/String; = "jar verified."

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private certificates:Z

.field private outputCache:Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 43
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/AbstractJarSignerTask;-><init>()V

    .line 57
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar;->certificates:Z

    .line 58
    new-instance v0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;-><init>(Lorg/apache/tools/ant/taskdefs/VerifyJar$1;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar;->outputCache:Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;

    .line 179
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 95
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

.method private verifyOneJar(Ljava/io/File;)V
    .locals 7
    .param p1, "jar"    # Ljava/io/File;

    .prologue
    .line 111
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    .line 112
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Not found :"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 114
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->createJarSigner()Lorg/apache/tools/ant/taskdefs/ExecTask;

    move-result-object v0

    .line 116
    .local v0, "cmd":Lorg/apache/tools/ant/taskdefs/ExecTask;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->setCommonOptions(Lorg/apache/tools/ant/taskdefs/ExecTask;)V

    .line 117
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->bindToKeystore(Lorg/apache/tools/ant/taskdefs/ExecTask;)V

    .line 120
    const-string/jumbo v4, "-verify"

    invoke-virtual {p0, v0, v4}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 122
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar;->certificates:Z

    if-eqz v4, :cond_1

    .line 123
    const-string/jumbo v4, "-certs"

    invoke-virtual {p0, v0, v4}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 127
    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v0, v4}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->addValue(Lorg/apache/tools/ant/taskdefs/ExecTask;Ljava/lang/String;)V

    .line 129
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Verifying JAR: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->log(Ljava/lang/String;)V

    .line 130
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar;->outputCache:Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;->clear()V

    .line 131
    const/4 v2, 0x0

    .line 133
    .local v2, "ex":Lorg/apache/tools/ant/BuildException;
    :try_start_0
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/ExecTask;->execute()V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar;->outputCache:Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;

    invoke-virtual {v4}, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;->toString()Ljava/lang/String;

    move-result-object v3

    .line 139
    .local v3, "results":Ljava/lang/String;
    if-eqz v2, :cond_2

    .line 140
    const-string/jumbo v4, "zip file closed"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-ltz v4, :cond_3

    .line 141
    const-string/jumbo v4, "You are running jarsigner against a JVM with a known bug that manifests as an IllegalStateException."

    const/4 v5, 0x1

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->log(Ljava/lang/String;I)V

    .line 148
    :cond_2
    const-string/jumbo v4, "jar verified."

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_4

    .line 149
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Failed to verify "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 134
    .end local v3    # "results":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 135
    .local v1, "e":Lorg/apache/tools/ant/BuildException;
    move-object v2, v1

    goto :goto_0

    .line 145
    .end local v1    # "e":Lorg/apache/tools/ant/BuildException;
    .restart local v3    # "results":Ljava/lang/String;
    :cond_3
    throw v2

    .line 151
    :cond_4
    return-void
.end method


# virtual methods
.method public execute()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    .line 76
    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar;->jar:Ljava/io/File;

    if-eqz v8, :cond_0

    move v1, v7

    .line 78
    .local v1, "hasJar":Z
    :goto_0
    if-nez v1, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->hasResources()Z

    move-result v8

    if-nez v8, :cond_1

    .line 79
    new-instance v7, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v8, "jar must be set through jar attribute or nested filesets"

    invoke-direct {v7, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 76
    .end local v1    # "hasJar":Z
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 82
    .restart local v1    # "hasJar":Z
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->beginExecution()V

    .line 85
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->getRedirector()Lorg/apache/tools/ant/types/RedirectorElement;

    move-result-object v5

    .line 86
    .local v5, "redirector":Lorg/apache/tools/ant/types/RedirectorElement;
    invoke-virtual {v5, v7}, Lorg/apache/tools/ant/types/RedirectorElement;->setAlwaysLog(Z)V

    .line 87
    invoke-virtual {v5}, Lorg/apache/tools/ant/types/RedirectorElement;->createOutputFilterChain()Lorg/apache/tools/ant/types/FilterChain;

    move-result-object v3

    .line 88
    .local v3, "outputFilterChain":Lorg/apache/tools/ant/types/FilterChain;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar;->outputCache:Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;

    invoke-virtual {v3, v7}, Lorg/apache/tools/ant/types/FilterChain;->add(Lorg/apache/tools/ant/filters/ChainableReader;)V

    .line 91
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->createUnifiedSourcePath()Lorg/apache/tools/ant/types/Path;

    move-result-object v6

    .line 92
    .local v6, "sources":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Path;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 93
    .local v2, "iter":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 94
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/Resource;

    .line 95
    .local v4, "r":Lorg/apache/tools/ant/types/Resource;
    sget-object v7, Lorg/apache/tools/ant/taskdefs/VerifyJar;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v7, :cond_2

    const-string/jumbo v7, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v7}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    sput-object v7, Lorg/apache/tools/ant/taskdefs/VerifyJar;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_2
    invoke-virtual {v4, v7}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 96
    .local v0, "fr":Lorg/apache/tools/ant/types/resources/FileProvider;
    invoke-interface {v0}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v7

    invoke-direct {p0, v7}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->verifyOneJar(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 100
    .end local v0    # "fr":Lorg/apache/tools/ant/types/resources/FileProvider;
    .end local v2    # "iter":Ljava/util/Iterator;
    .end local v4    # "r":Lorg/apache/tools/ant/types/Resource;
    .end local v6    # "sources":Lorg/apache/tools/ant/types/Path;
    :catchall_0
    move-exception v7

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->endExecution()V

    throw v7

    .line 95
    .restart local v2    # "iter":Ljava/util/Iterator;
    .restart local v4    # "r":Lorg/apache/tools/ant/types/Resource;
    .restart local v6    # "sources":Lorg/apache/tools/ant/types/Path;
    :cond_2
    :try_start_1
    sget-object v7, Lorg/apache/tools/ant/taskdefs/VerifyJar;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2

    .line 100
    .end local v4    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/VerifyJar;->endExecution()V

    .line 103
    return-void
.end method

.method public setCertificates(Z)V
    .locals 0
    .param p1, "certificates"    # Z

    .prologue
    .line 67
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar;->certificates:Z

    .line 68
    return-void
.end method
