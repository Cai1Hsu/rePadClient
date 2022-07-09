.class public abstract Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;
.super Ljava/lang/Object;
.source "DefaultCompilerAdapter.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;
.implements Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterExtension;


# static fields
.field private static final COMMAND_LINE_LIMIT:I

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field protected static final lSep:Ljava/lang/String;


# instance fields
.field protected attributes:Lorg/apache/tools/ant/taskdefs/Javac;

.field protected bootclasspath:Lorg/apache/tools/ant/types/Path;

.field protected compileClasspath:Lorg/apache/tools/ant/types/Path;

.field protected compileList:[Ljava/io/File;

.field protected compileSourcepath:Lorg/apache/tools/ant/types/Path;

.field protected debug:Z

.field protected depend:Z

.field protected deprecation:Z

.field protected destDir:Ljava/io/File;

.field protected encoding:Ljava/lang/String;

.field protected extdirs:Lorg/apache/tools/ant/types/Path;

.field protected includeAntRuntime:Z

.field protected includeJavaRuntime:Z

.field protected location:Lorg/apache/tools/ant/Location;

.field protected memoryInitialSize:Ljava/lang/String;

.field protected memoryMaximumSize:Ljava/lang/String;

.field protected optimize:Z

.field protected project:Lorg/apache/tools/ant/Project;

.field protected src:Lorg/apache/tools/ant/types/Path;

.field protected target:Ljava/lang/String;

.field protected verbose:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    const-string/jumbo v0, "os/2"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 54
    const/16 v0, 0x3e8

    sput v0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->COMMAND_LINE_LIMIT:I

    .line 61
    :goto_0
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 88
    sget-object v0, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    sput-object v0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->lSep:Ljava/lang/String;

    return-void

    .line 56
    :cond_0
    const/16 v0, 0x1000

    sput v0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->COMMAND_LINE_LIMIT:I

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->debug:Z

    .line 67
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->optimize:Z

    .line 68
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->deprecation:Z

    .line 69
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->depend:Z

    .line 70
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->verbose:Z

    return-void
.end method

.method private adjustSourceValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    .line 717
    const-string/jumbo v0, "1.1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "1.2"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const-string/jumbo p1, "1.3"

    .end local p1    # "source":Ljava/lang/String;
    :cond_1
    return-object p1
.end method

.method private assumeJavaXY(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1, "javacXY"    # Ljava/lang/String;
    .param p2, "javaEnvVersionXY"    # Ljava/lang/String;

    .prologue
    .line 613
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompilerVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string/jumbo v0, "classic"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompilerVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isJavaVersion(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    const-string/jumbo v0, "modern"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompilerVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p2}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isJavaVersion(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    const-string/jumbo v0, "extJavac"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompilerVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {p2}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isJavaVersion(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getDefaultSource()Ljava/lang/String;
    .locals 1

    .prologue
    .line 674
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava15()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava16()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 675
    :cond_0
    const-string/jumbo v0, "1.5 in JDK 1.5 and 1.6"

    .line 683
    :goto_0
    return-object v0

    .line 677
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava17()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 678
    const-string/jumbo v0, "1.7 in JDK 1.7"

    goto :goto_0

    .line 680
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava18()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 681
    const-string/jumbo v0, "1.8 in JDK 1.8"

    goto :goto_0

    .line 683
    :cond_3
    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method private mustSetSourceForTarget(Ljava/lang/String;)Z
    .locals 2
    .param p1, "t"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 696
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava14()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 702
    :cond_0
    :goto_0
    return v0

    .line 699
    :cond_1
    const-string/jumbo v1, "1."

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 700
    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 702
    :cond_2
    const-string/jumbo v1, "1"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string/jumbo v1, "2"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string/jumbo v1, "3"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string/jumbo v1, "4"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string/jumbo v1, "5"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string/jumbo v1, "6"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava15()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava16()Z

    move-result v1

    if-eqz v1, :cond_5

    :cond_4
    const-string/jumbo v1, "7"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava17()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_5
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private setImplicitSourceSwitch(Lorg/apache/tools/ant/types/Commandline;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "target"    # Ljava/lang/String;
    .param p3, "source"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    .line 653
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 654
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v1, "          WARNING"

    invoke-virtual {v0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 655
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 656
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "The -source switch defaults to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->getDefaultSource()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 659
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "If you specify -target "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " you now must also specify -source "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 662
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Ant will implicitly add -source "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " for you.  Please change your build file."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 665
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-source"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 666
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 667
    return-void
.end method


# virtual methods
.method protected addCurrentCompilerArgs(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 1
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 533
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->getJavac()Lorg/apache/tools/ant/taskdefs/Javac;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/Javac;->getCurrentCompilerArgs()[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/Commandline;->addArguments([Ljava/lang/String;)V

    .line 534
    return-void
.end method

.method protected addExtdirsToClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 525
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->extdirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/Path;->addExtdirs(Lorg/apache/tools/ant/types/Path;)V

    .line 526
    return-void
.end method

.method protected assumeJava11()Z
    .locals 2

    .prologue
    .line 542
    const-string/jumbo v0, "javac1.1"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompilerVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected assumeJava12()Z
    .locals 2

    .prologue
    .line 551
    const-string/jumbo v0, "javac1.2"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompilerVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected assumeJava13()Z
    .locals 2

    .prologue
    .line 560
    const-string/jumbo v0, "javac1.3"

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompilerVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method protected assumeJava14()Z
    .locals 2

    .prologue
    .line 569
    const-string/jumbo v0, "javac1.4"

    const-string/jumbo v1, "1.4"

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJavaXY(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected assumeJava15()Z
    .locals 2

    .prologue
    .line 578
    const-string/jumbo v0, "javac1.5"

    const-string/jumbo v1, "1.5"

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJavaXY(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected assumeJava16()Z
    .locals 2

    .prologue
    .line 587
    const-string/jumbo v0, "javac1.6"

    const-string/jumbo v1, "1.6"

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJavaXY(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected assumeJava17()Z
    .locals 2

    .prologue
    .line 596
    const-string/jumbo v0, "javac1.7"

    const-string/jumbo v1, "1.7"

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJavaXY(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected assumeJava18()Z
    .locals 2

    .prologue
    .line 605
    const-string/jumbo v0, "javac1.8"

    const-string/jumbo v1, "1.8"

    invoke-direct {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJavaXY(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method protected executeExternalCompile([Ljava/lang/String;I)I
    .locals 1
    .param p1, "args"    # [Ljava/lang/String;
    .param p2, "firstFileName"    # I

    .prologue
    .line 427
    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->executeExternalCompile([Ljava/lang/String;IZ)I

    move-result v0

    return v0
.end method

.method protected executeExternalCompile([Ljava/lang/String;IZ)I
    .locals 13
    .param p1, "args"    # [Ljava/lang/String;
    .param p2, "firstFileName"    # I
    .param p3, "quoteFiles"    # Z

    .prologue
    .line 451
    const/4 v6, 0x0

    .line 452
    .local v6, "commandArray":[Ljava/lang/String;
    const/4 v12, 0x0

    .line 462
    .local v12, "tmpFile":Ljava/io/File;
    :try_start_0
    invoke-static {p1}, Lorg/apache/tools/ant/types/Commandline;->toString([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    sget v1, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->COMMAND_LINE_LIMIT:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-le v0, v1, :cond_5

    if-ltz p2, :cond_5

    .line 464
    const/4 v10, 0x0

    .line 466
    .local v10, "out":Ljava/io/BufferedWriter;
    :try_start_1
    sget-object v0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    const-string/jumbo v1, "files"

    const-string/jumbo v2, ""

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->getJavac()Lorg/apache/tools/ant/taskdefs/Javac;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/Javac;->getTempdir()Ljava/io/File;

    move-result-object v3

    const/4 v4, 0x1

    const/4 v5, 0x1

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v12

    .line 468
    new-instance v11, Ljava/io/BufferedWriter;

    new-instance v0, Ljava/io/FileWriter;

    invoke-direct {v0, v12}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    invoke-direct {v11, v0}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 469
    .end local v10    # "out":Ljava/io/BufferedWriter;
    .local v11, "out":Ljava/io/BufferedWriter;
    move v9, p2

    .local v9, "i":I
    :goto_0
    :try_start_2
    array-length v0, p1

    if-ge v9, v0, :cond_2

    .line 470
    if-eqz p3, :cond_0

    aget-object v0, p1, v9

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    .line 471
    aget-object v0, p1, v9

    sget-char v1, Ljava/io/File;->separatorChar:C

    const/16 v2, 0x2f

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, v9

    .line 472
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    aget-object v1, p1, v9

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 476
    :goto_1
    invoke-virtual {v11}, Ljava/io/BufferedWriter;->newLine()V

    .line 469
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 474
    :cond_0
    aget-object v0, p1, v9

    invoke-virtual {v11, v0}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    goto :goto_1

    .line 482
    :catch_0
    move-exception v7

    move-object v10, v11

    .line 483
    .end local v9    # "i":I
    .end local v11    # "out":Ljava/io/BufferedWriter;
    .local v7, "e":Ljava/io/IOException;
    .restart local v10    # "out":Ljava/io/BufferedWriter;
    :goto_2
    :try_start_3
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Error creating temporary file"

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->location:Lorg/apache/tools/ant/Location;

    invoke-direct {v0, v1, v7, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 486
    .end local v7    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v0

    :goto_3
    :try_start_4
    invoke-static {v10}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 512
    .end local v10    # "out":Ljava/io/BufferedWriter;
    :catchall_1
    move-exception v0

    if-eqz v12, :cond_1

    .line 513
    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    :cond_1
    throw v0

    .line 478
    .restart local v9    # "i":I
    .restart local v11    # "out":Ljava/io/BufferedWriter;
    :cond_2
    :try_start_5
    invoke-virtual {v11}, Ljava/io/BufferedWriter;->flush()V

    .line 479
    add-int/lit8 v0, p2, 0x1

    new-array v6, v0, [Ljava/lang/String;

    .line 480
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p1, v0, v6, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 481
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v6, p2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 486
    :try_start_6
    invoke-static {v11}, Lorg/apache/tools/ant/util/FileUtils;->close(Ljava/io/Writer;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 493
    .end local v9    # "i":I
    .end local v11    # "out":Ljava/io/BufferedWriter;
    :goto_4
    :try_start_7
    new-instance v8, Lorg/apache/tools/ant/taskdefs/Execute;

    new-instance v0, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const/4 v2, 0x2

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lorg/apache/tools/ant/taskdefs/LogStreamHandler;-><init>(Lorg/apache/tools/ant/Task;II)V

    invoke-direct {v8, v0}, Lorg/apache/tools/ant/taskdefs/Execute;-><init>(Lorg/apache/tools/ant/taskdefs/ExecuteStreamHandler;)V

    .line 497
    .local v8, "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    const-string/jumbo v0, "openvms"

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/condition/Os;->isFamily(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 500
    const/4 v0, 0x1

    invoke-virtual {v8, v0}, Lorg/apache/tools/ant/taskdefs/Execute;->setVMLauncher(Z)V

    .line 502
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v8, v0}, Lorg/apache/tools/ant/taskdefs/Execute;->setAntRun(Lorg/apache/tools/ant/Project;)V

    .line 503
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v8, v0}, Lorg/apache/tools/ant/taskdefs/Execute;->setWorkingDirectory(Ljava/io/File;)V

    .line 504
    invoke-virtual {v8, v6}, Lorg/apache/tools/ant/taskdefs/Execute;->setCommandline([Ljava/lang/String;)V

    .line 505
    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/Execute;->execute()I

    .line 506
    invoke-virtual {v8}, Lorg/apache/tools/ant/taskdefs/Execute;->getExitValue()I
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    move-result v0

    .line 512
    if-eqz v12, :cond_4

    .line 513
    invoke-virtual {v12}, Ljava/io/File;->delete()Z

    :cond_4
    return v0

    .line 489
    .end local v8    # "exe":Lorg/apache/tools/ant/taskdefs/Execute;
    :cond_5
    move-object v6, p1

    goto :goto_4

    .line 507
    :catch_1
    move-exception v7

    .line 508
    .restart local v7    # "e":Ljava/io/IOException;
    :try_start_8
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Error running "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " compiler"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->location:Lorg/apache/tools/ant/Location;

    invoke-direct {v0, v1, v7, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 486
    .end local v7    # "e":Ljava/io/IOException;
    .restart local v9    # "i":I
    .restart local v11    # "out":Ljava/io/BufferedWriter;
    :catchall_2
    move-exception v0

    move-object v10, v11

    .end local v11    # "out":Ljava/io/BufferedWriter;
    .restart local v10    # "out":Ljava/io/BufferedWriter;
    goto/16 :goto_3

    .line 482
    .end local v9    # "i":I
    :catch_2
    move-exception v7

    goto/16 :goto_2
.end method

.method protected getBootClassPath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 630
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->project:Lorg/apache/tools/ant/Project;

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 631
    .local v0, "bp":Lorg/apache/tools/ant/types/Path;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    if-eqz v1, :cond_0

    .line 632
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 634
    :cond_0
    const-string/jumbo v1, "ignore"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->concatSystemBootClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    return-object v1
.end method

.method protected getCompileClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 3

    .prologue
    .line 155
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->project:Lorg/apache/tools/ant/Project;

    invoke-direct {v0, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 160
    .local v0, "classpath":Lorg/apache/tools/ant/types/Path;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->destDir:Ljava/io/File;

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->getJavac()Lorg/apache/tools/ant/taskdefs/Javac;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Javac;->isIncludeDestClasses()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 161
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->destDir:Ljava/io/File;

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Path;->setLocation(Ljava/io/File;)V

    .line 167
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    .line 168
    .local v1, "cp":Lorg/apache/tools/ant/types/Path;
    if-nez v1, :cond_1

    .line 169
    new-instance v1, Lorg/apache/tools/ant/types/Path;

    .end local v1    # "cp":Lorg/apache/tools/ant/types/Path;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->project:Lorg/apache/tools/ant/Project;

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 171
    .restart local v1    # "cp":Lorg/apache/tools/ant/types/Path;
    :cond_1
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->includeAntRuntime:Z

    if-eqz v2, :cond_3

    .line 172
    const-string/jumbo v2, "last"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    .line 177
    :goto_0
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->includeJavaRuntime:Z

    if-eqz v2, :cond_2

    .line 178
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->addJavaRuntime()V

    .line 181
    :cond_2
    return-object v0

    .line 174
    :cond_3
    const-string/jumbo v2, "ignore"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public getJavac()Lorg/apache/tools/ant/taskdefs/Javac;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    return-object v0
.end method

.method protected getNoDebugArgument()Ljava/lang/String;
    .locals 1

    .prologue
    .line 648
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava11()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "-g:none"

    goto :goto_0
.end method

.method protected getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public getSupportedFileExtensions()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 138
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "java"

    aput-object v2, v0, v1

    return-object v0
.end method

.method protected logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 7
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    const/4 v6, 0x3

    .line 395
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Compilation "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->describeArguments()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v6}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 398
    new-instance v2, Ljava/lang/StringBuffer;

    const-string/jumbo v3, "File"

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 399
    .local v2, "niceSourceList":Ljava/lang/StringBuffer;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->compileList:[Ljava/io/File;

    array-length v3, v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    .line 400
    const-string/jumbo v3, "s"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 402
    :cond_0
    const-string/jumbo v3, " to be compiled:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 404
    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 406
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->compileList:[Ljava/io/File;

    array-length v3, v3

    if-ge v1, v3, :cond_1

    .line 407
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->compileList:[Ljava/io/File;

    aget-object v3, v3, v1

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 408
    .local v0, "arg":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    invoke-virtual {v3, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 409
    const-string/jumbo v3, "    "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 410
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 411
    sget-object v3, Lorg/apache/tools/ant/util/StringUtils;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 406
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 414
    .end local v0    # "arg":Ljava/lang/String;
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v6}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 415
    return-void
.end method

.method public setJavac(Lorg/apache/tools/ant/taskdefs/Javac;)V
    .locals 1
    .param p1, "attributes"    # Lorg/apache/tools/ant/taskdefs/Javac;

    .prologue
    .line 100
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    .line 101
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getSrcdir()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->src:Lorg/apache/tools/ant/types/Path;

    .line 102
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getDestdir()Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->destDir:Ljava/io/File;

    .line 103
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getEncoding()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->encoding:Ljava/lang/String;

    .line 104
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getDebug()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->debug:Z

    .line 105
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getOptimize()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->optimize:Z

    .line 106
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getDeprecation()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->deprecation:Z

    .line 107
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getDepend()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->depend:Z

    .line 108
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getVerbose()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->verbose:Z

    .line 109
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getTarget()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->target:Ljava/lang/String;

    .line 110
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getBootclasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    .line 111
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getExtdirs()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->extdirs:Lorg/apache/tools/ant/types/Path;

    .line 112
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getFileList()[Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->compileList:[Ljava/io/File;

    .line 113
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    .line 114
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getSourcepath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    .line 115
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->project:Lorg/apache/tools/ant/Project;

    .line 116
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->location:Lorg/apache/tools/ant/Location;

    .line 117
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getIncludeantruntime()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->includeAntRuntime:Z

    .line 118
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getIncludejavaruntime()Z

    move-result v0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->includeJavaRuntime:Z

    .line 119
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getMemoryInitialSize()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->memoryInitialSize:Ljava/lang/String;

    .line 120
    invoke-virtual {p1}, Lorg/apache/tools/ant/taskdefs/Javac;->getMemoryMaximumSize()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->memoryMaximumSize:Ljava/lang/String;

    .line 121
    return-void
.end method

.method protected setupJavacCommand()Lorg/apache/tools/ant/types/Commandline;
    .locals 1

    .prologue
    .line 373
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->setupJavacCommand(Z)Lorg/apache/tools/ant/types/Commandline;

    move-result-object v0

    return-object v0
.end method

.method protected setupJavacCommand(Z)Lorg/apache/tools/ant/types/Commandline;
    .locals 1
    .param p1, "debugLevelCheck"    # Z

    .prologue
    .line 383
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 384
    .local v0, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->setupJavacCommandlineSwitches(Lorg/apache/tools/ant/types/Commandline;Z)Lorg/apache/tools/ant/types/Commandline;

    .line 385
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V

    .line 386
    return-object v0
.end method

.method protected setupJavacCommandlineSwitches(Lorg/apache/tools/ant/types/Commandline;)Lorg/apache/tools/ant/types/Commandline;
    .locals 1
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 190
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->setupJavacCommandlineSwitches(Lorg/apache/tools/ant/types/Commandline;Z)Lorg/apache/tools/ant/types/Commandline;

    move-result-object v0

    return-object v0
.end method

.method protected setupJavacCommandlineSwitches(Lorg/apache/tools/ant/types/Commandline;Z)Lorg/apache/tools/ant/types/Commandline;
    .locals 10
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "useDebugLevel"    # Z

    .prologue
    const/4 v9, 0x1

    .line 202
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->getCompileClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    .line 205
    .local v1, "classpath":Lorg/apache/tools/ant/types/Path;
    const/4 v5, 0x0

    .line 206
    .local v5, "sourcepath":Lorg/apache/tools/ant/types/Path;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    if-eqz v6, :cond_d

    .line 207
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    .line 212
    :goto_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava11()Z

    move-result v6

    if-eqz v6, :cond_e

    const-string/jumbo v4, "-J-"

    .line 213
    .local v4, "memoryParameterPrefix":Ljava/lang/String;
    :goto_1
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->memoryInitialSize:Ljava/lang/String;

    if-eqz v6, :cond_0

    .line 214
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Javac;->isForkedJavac()Z

    move-result v6

    if-nez v6, :cond_f

    .line 215
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v7, "Since fork is false, ignoring memoryInitialSize setting."

    invoke-virtual {v6, v7, v9}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 224
    :cond_0
    :goto_2
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->memoryMaximumSize:Ljava/lang/String;

    if-eqz v6, :cond_1

    .line 225
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Javac;->isForkedJavac()Z

    move-result v6

    if-nez v6, :cond_10

    .line 226
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v7, "Since fork is false, ignoring memoryMaximumSize setting."

    invoke-virtual {v6, v7, v9}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 235
    :cond_1
    :goto_3
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Javac;->getNowarn()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 236
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-nowarn"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 239
    :cond_2
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->deprecation:Z

    if-eqz v6, :cond_3

    .line 240
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-deprecation"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 243
    :cond_3
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->destDir:Ljava/io/File;

    if-eqz v6, :cond_4

    .line 244
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-d"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 245
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->destDir:Ljava/io/File;

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 248
    :cond_4
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-classpath"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 252
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava11()Z

    move-result v6

    if-eqz v6, :cond_11

    .line 253
    new-instance v2, Lorg/apache/tools/ant/types/Path;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->project:Lorg/apache/tools/ant/Project;

    invoke-direct {v2, v6}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 255
    .local v2, "cp":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->getBootClassPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 256
    .local v0, "bp":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v6

    if-lez v6, :cond_5

    .line 257
    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 260
    :cond_5
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->extdirs:Lorg/apache/tools/ant/types/Path;

    if-eqz v6, :cond_6

    .line 261
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->extdirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/types/Path;->addExtdirs(Lorg/apache/tools/ant/types/Path;)V

    .line 263
    :cond_6
    invoke-virtual {v2, v1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 264
    invoke-virtual {v2, v5}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 265
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-virtual {v6, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 291
    .end local v2    # "cp":Lorg/apache/tools/ant/types/Path;
    :cond_7
    :goto_4
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->encoding:Ljava/lang/String;

    if-eqz v6, :cond_8

    .line 292
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-encoding"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 293
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->encoding:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 295
    :cond_8
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->debug:Z

    if-eqz v6, :cond_17

    .line 296
    if-eqz p2, :cond_16

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava11()Z

    move-result v6

    if-nez v6, :cond_16

    .line 297
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Javac;->getDebugLevel()Ljava/lang/String;

    move-result-object v3

    .line 298
    .local v3, "debugLevel":Ljava/lang/String;
    if-eqz v3, :cond_15

    .line 299
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "-g:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 309
    .end local v3    # "debugLevel":Ljava/lang/String;
    :cond_9
    :goto_5
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->optimize:Z

    if-eqz v6, :cond_a

    .line 310
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-O"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 313
    :cond_a
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->depend:Z

    if-eqz v6, :cond_b

    .line 314
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava11()Z

    move-result v6

    if-eqz v6, :cond_18

    .line 315
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-depend"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 324
    :cond_b
    :goto_6
    iget-boolean v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->verbose:Z

    if-eqz v6, :cond_c

    .line 325
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-verbose"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 328
    :cond_c
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->addCurrentCompilerArgs(Lorg/apache/tools/ant/types/Commandline;)V

    .line 330
    return-object p1

    .line 209
    .end local v0    # "bp":Lorg/apache/tools/ant/types/Path;
    .end local v4    # "memoryParameterPrefix":Ljava/lang/String;
    :cond_d
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->src:Lorg/apache/tools/ant/types/Path;

    goto/16 :goto_0

    .line 212
    :cond_e
    const-string/jumbo v4, "-J-X"

    goto/16 :goto_1

    .line 219
    .restart local v4    # "memoryParameterPrefix":Ljava/lang/String;
    :cond_f
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "ms"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->memoryInitialSize:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 230
    :cond_10
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "mx"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget-object v8, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->memoryMaximumSize:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 267
    :cond_11
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-virtual {v6, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 270
    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v6

    if-lez v6, :cond_12

    .line 271
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-sourcepath"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 272
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-virtual {v6, v5}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 274
    :cond_12
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->target:Ljava/lang/String;

    if-eqz v6, :cond_13

    .line 275
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-target"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 276
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->target:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 279
    :cond_13
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->getBootClassPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 280
    .restart local v0    # "bp":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v6

    if-lez v6, :cond_14

    .line 281
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-bootclasspath"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 282
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-virtual {v6, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 285
    :cond_14
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->extdirs:Lorg/apache/tools/ant/types/Path;

    if-eqz v6, :cond_7

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->extdirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v6

    if-lez v6, :cond_7

    .line 286
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-extdirs"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 287
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->extdirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    goto/16 :goto_4

    .line 301
    .restart local v3    # "debugLevel":Ljava/lang/String;
    :cond_15
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-g"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 304
    .end local v3    # "debugLevel":Ljava/lang/String;
    :cond_16
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-g"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 306
    :cond_17
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->getNoDebugArgument()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_9

    .line 307
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->getNoDebugArgument()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto/16 :goto_5

    .line 316
    :cond_18
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava12()Z

    move-result v6

    if-eqz v6, :cond_19

    .line 317
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v6

    const-string/jumbo v7, "-Xdepend"

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    goto/16 :goto_6

    .line 319
    :cond_19
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    const-string/jumbo v7, "depend attribute is not supported by the modern compiler"

    invoke-virtual {v6, v7, v9}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    goto/16 :goto_6
.end method

.method protected setupModernJavacCommand()Lorg/apache/tools/ant/types/Commandline;
    .locals 1

    .prologue
    .line 361
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 362
    .local v0, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->setupModernJavacCommandlineSwitches(Lorg/apache/tools/ant/types/Commandline;)Lorg/apache/tools/ant/types/Commandline;

    .line 364
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V

    .line 365
    return-object v0
.end method

.method protected setupModernJavacCommandlineSwitches(Lorg/apache/tools/ant/types/Commandline;)Lorg/apache/tools/ant/types/Commandline;
    .locals 3
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    .line 340
    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->setupJavacCommandlineSwitches(Lorg/apache/tools/ant/types/Commandline;Z)Lorg/apache/tools/ant/types/Commandline;

    .line 341
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->assumeJava13()Z

    move-result v1

    if-nez v1, :cond_0

    .line 342
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javac;->getTarget()Ljava/lang/String;

    move-result-object v0

    .line 343
    .local v0, "t":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v1}, Lorg/apache/tools/ant/taskdefs/Javac;->getSource()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 344
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v1

    const-string/jumbo v2, "-source"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 345
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Javac;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Javac;->getSource()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->adjustSourceValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 352
    .end local v0    # "t":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .line 348
    .restart local v0    # "t":Ljava/lang/String;
    :cond_1
    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->mustSetSourceForTarget(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 349
    invoke-direct {p0, v0}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->adjustSourceValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v0, v1}, Lorg/apache/tools/ant/taskdefs/compilers/DefaultCompilerAdapter;->setImplicitSourceSwitch(Lorg/apache/tools/ant/types/Commandline;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
