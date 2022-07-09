.class public Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;
.super Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;
.source "KaffeRmic.java"


# static fields
.field public static final COMPILER_NAME:Ljava/lang/String; = "kaffe"

.field private static final RMIC_CLASSNAMES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 33
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "gnu.classpath.tools.rmi.rmic.RMIC"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "gnu.java.rmi.rmic.RMIC"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "kaffe.rmi.rmic.RMIC"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->RMIC_CLASSNAMES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;-><init>()V

    return-void
.end method

.method private static getRmicClass()Ljava/lang/Class;
    .locals 2

    .prologue
    .line 95
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->RMIC_CLASSNAMES:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 97
    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->RMIC_CLASSNAMES:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 102
    :goto_1
    return-object v1

    .line 98
    :catch_0
    move-exception v1

    .line 95
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 102
    :cond_0
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public static isAvailable()Z
    .locals 1

    .prologue
    .line 85
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->getRmicClass()Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public execute()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v5

    const-string/jumbo v6, "Using Kaffe rmic"

    const/4 v7, 0x3

    invoke-virtual {v5, v6, v7}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 49
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->setupRmicCommand()Lorg/apache/tools/ant/types/Commandline;

    move-result-object v2

    .line 51
    .local v2, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->getRmicClass()Ljava/lang/Class;

    move-result-object v1

    .line 52
    .local v1, "c":Ljava/lang/Class;
    if-nez v1, :cond_2

    .line 53
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v5, "Cannot use Kaffe rmic, as it is not available.  None of "

    invoke-direct {v0, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 56
    .local v0, "buf":Ljava/lang/StringBuffer;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    sget-object v5, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->RMIC_CLASSNAMES:[Ljava/lang/String;

    array-length v5, v5

    if-ge v4, v5, :cond_1

    .line 57
    if-eqz v4, :cond_0

    .line 58
    const-string/jumbo v5, ", "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 61
    :cond_0
    sget-object v5, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->RMIC_CLASSNAMES:[Ljava/lang/String;

    aget-object v5, v5, v4

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 56
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 63
    :cond_1
    const-string/jumbo v5, " have been found. A common solution is to set the environment variable JAVA_HOME or CLASSPATH."

    invoke-virtual {v0, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 65
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v7

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Rmic;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 69
    .end local v0    # "buf":Ljava/lang/StringBuffer;
    .end local v4    # "i":I
    :cond_2
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 70
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    sget-object v6, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->RMIC_CLASSNAMES:[Ljava/lang/String;

    sget-object v7, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->RMIC_CLASSNAMES:[Ljava/lang/String;

    array-length v7, v7

    add-int/lit8 v7, v7, -0x1

    aget-object v6, v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 72
    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    const-string/jumbo v6, "-verbose"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v5

    invoke-static {v2}, Lorg/apache/tools/ant/types/Commandline;->describeCommand(Lorg/apache/tools/ant/types/Commandline;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;)V

    .line 75
    :cond_3
    new-instance v3, Lorg/apache/tools/ant/taskdefs/ExecuteJava;

    invoke-direct {v3}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;-><init>()V

    .line 76
    .local v3, "ej":Lorg/apache/tools/ant/taskdefs/ExecuteJava;
    invoke-virtual {v3, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->setJavaCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 77
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/KaffeRmic;->getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;

    move-result-object v5

    invoke-virtual {v3, v5}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->fork(Lorg/apache/tools/ant/ProjectComponent;)I

    move-result v5

    if-nez v5, :cond_4

    const/4 v5, 0x1

    :goto_1
    return v5

    :cond_4
    const/4 v5, 0x0

    goto :goto_1
.end method
