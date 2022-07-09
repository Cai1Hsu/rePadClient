.class public Lorg/apache/tools/ant/taskdefs/Apt;
.super Lorg/apache/tools/ant/taskdefs/Javac;
.source "Apt.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Apt$Option;
    }
.end annotation


# static fields
.field public static final ERROR_IGNORING_COMPILER_OPTION:Ljava/lang/String; = "Ignoring compiler attribute for the APT task, as it is fixed"

.field public static final ERROR_WRONG_JAVA_VERSION:Ljava/lang/String; = "Apt task requires Java 1.5+"

.field public static final EXECUTABLE_NAME:Ljava/lang/String; = "apt"

.field public static final WARNING_IGNORING_FORK:Ljava/lang/String; = "Apt only runs in its own JVM; fork=false option ignored"

.field static class$org$apache$tools$ant$taskdefs$compilers$AptExternalCompilerAdapter:Ljava/lang/Class;


# instance fields
.field private compile:Z

.field private factory:Ljava/lang/String;

.field private factoryPath:Lorg/apache/tools/ant/types/Path;

.field private options:Ljava/util/Vector;

.field private preprocessDir:Ljava/io/File;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 111
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Javac;-><init>()V

    .line 41
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Apt;->compile:Z

    .line 44
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Apt;->options:Ljava/util/Vector;

    .line 112
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Apt;->class$org$apache$tools$ant$taskdefs$compilers$AptExternalCompilerAdapter:Ljava/lang/Class;

    if-nez v0, :cond_0

    const-string/jumbo v0, "org.apache.tools.ant.taskdefs.compilers.AptExternalCompilerAdapter"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/Apt;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Apt;->class$org$apache$tools$ant$taskdefs$compilers$AptExternalCompilerAdapter:Ljava/lang/Class;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, v0}, Lorg/apache/tools/ant/taskdefs/Javac;->setCompiler(Ljava/lang/String;)V

    .line 113
    invoke-super {p0, v1}, Lorg/apache/tools/ant/taskdefs/Javac;->setFork(Z)V

    .line 114
    return-void

    .line 112
    :cond_0
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Apt;->class$org$apache$tools$ant$taskdefs$compilers$AptExternalCompilerAdapter:Ljava/lang/Class;

    goto :goto_0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 112
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
.method public createFactoryPath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 206
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Apt;->factoryPath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 207
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Apt;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Apt;->factoryPath:Lorg/apache/tools/ant/types/Path;

    .line 209
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Apt;->factoryPath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createOption()Lorg/apache/tools/ant/taskdefs/Apt$Option;
    .locals 2

    .prologue
    .line 227
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Apt$Option;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Apt$Option;-><init>()V

    .line 228
    .local v0, "opt":Lorg/apache/tools/ant/taskdefs/Apt$Option;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Apt;->options:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 229
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
    .line 265
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->execute()V

    .line 266
    return-void
.end method

.method public getAptExecutable()Ljava/lang/String;
    .locals 2

    .prologue
    .line 122
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Apt;->getExecutable()Ljava/lang/String;

    move-result-object v0

    .line 123
    .local v0, "exe":Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0    # "exe":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "exe":Ljava/lang/String;
    :cond_0
    const-string/jumbo v1, "apt"

    invoke-static {v1}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJdkExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getCompiler()Ljava/lang/String;
    .locals 1

    .prologue
    .line 154
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompiler()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFactory()Ljava/lang/String;
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Apt;->factory:Ljava/lang/String;

    return-object v0
.end method

.method public getFactoryPath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Apt;->factoryPath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getOptions()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Apt;->options:Ljava/util/Vector;

    return-object v0
.end method

.method public getPreprocessDir()Ljava/io/File;
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Apt;->preprocessDir:Ljava/io/File;

    return-object v0
.end method

.method public isCompile()Z
    .locals 1

    .prologue
    .line 163
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Apt;->compile:Z

    return v0
.end method

.method public setCompile(Z)V
    .locals 0
    .param p1, "compile"    # Z

    .prologue
    .line 172
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Apt;->compile:Z

    .line 173
    return-void
.end method

.method public setCompiler(Ljava/lang/String;)V
    .locals 2
    .param p1, "compiler"    # Ljava/lang/String;

    .prologue
    .line 133
    const-string/jumbo v0, "Ignoring compiler attribute for the APT task, as it is fixed"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Apt;->log(Ljava/lang/String;I)V

    .line 134
    return-void
.end method

.method public setFactory(Ljava/lang/String;)V
    .locals 0
    .param p1, "factory"    # Ljava/lang/String;

    .prologue
    .line 190
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Apt;->factory:Ljava/lang/String;

    .line 191
    return-void
.end method

.method public setFactoryPathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "ref"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 198
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Apt;->createFactoryPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 199
    return-void
.end method

.method public setFork(Z)V
    .locals 2
    .param p1, "fork"    # Z

    .prologue
    .line 144
    if-nez p1, :cond_0

    .line 145
    const-string/jumbo v0, "Apt only runs in its own JVM; fork=false option ignored"

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Apt;->log(Ljava/lang/String;I)V

    .line 147
    :cond_0
    return-void
.end method

.method public setPreprocessDir(Ljava/io/File;)V
    .locals 0
    .param p1, "preprocessDir"    # Ljava/io/File;

    .prologue
    .line 256
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Apt;->preprocessDir:Ljava/io/File;

    .line 257
    return-void
.end method
