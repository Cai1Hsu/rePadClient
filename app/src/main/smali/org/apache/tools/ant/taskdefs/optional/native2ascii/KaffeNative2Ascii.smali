.class public final Lorg/apache/tools/ant/taskdefs/optional/native2ascii/KaffeNative2Ascii;
.super Lorg/apache/tools/ant/taskdefs/optional/native2ascii/DefaultNative2Ascii;
.source "KaffeNative2Ascii.java"


# static fields
.field public static final IMPLEMENTATION_NAME:Ljava/lang/String; = "kaffe"

.field private static final N2A_CLASSNAMES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 34
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "gnu.classpath.tools.native2ascii.Native2Ascii"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "kaffe.tools.native2ascii.Native2Ascii"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/KaffeNative2Ascii;->N2A_CLASSNAMES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/DefaultNative2Ascii;-><init>()V

    return-void
.end method

.method private static getN2aClass()Ljava/lang/Class;
    .locals 2

    .prologue
    .line 78
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget-object v1, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/KaffeNative2Ascii;->N2A_CLASSNAMES:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 80
    :try_start_0
    sget-object v1, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/KaffeNative2Ascii;->N2A_CLASSNAMES:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 85
    :goto_1
    return-object v1

    .line 81
    :catch_0
    move-exception v1

    .line 78
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 85
    :cond_0
    const/4 v1, 0x0

    goto :goto_1
.end method


# virtual methods
.method protected run(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/ProjectComponent;)Z
    .locals 4
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "log"    # Lorg/apache/tools/ant/ProjectComponent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 57
    new-instance v1, Lorg/apache/tools/ant/taskdefs/ExecuteJava;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;-><init>()V

    .line 58
    .local v1, "ej":Lorg/apache/tools/ant/taskdefs/ExecuteJava;
    invoke-static {}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/KaffeNative2Ascii;->getN2aClass()Ljava/lang/Class;

    move-result-object v0

    .line 59
    .local v0, "c":Ljava/lang/Class;
    if-nez v0, :cond_0

    .line 60
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "Couldn\'t load Kaffe\'s Native2Ascii class"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 64
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/apache/tools/ant/types/Commandline;->setExecutable(Ljava/lang/String;)V

    .line 65
    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->setJavaCommand(Lorg/apache/tools/ant/types/Commandline;)V

    .line 66
    invoke-virtual {p2}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/taskdefs/ExecuteJava;->execute(Lorg/apache/tools/ant/Project;)V

    .line 68
    const/4 v2, 0x1

    return v2
.end method

.method protected setup(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;)V
    .locals 2
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "args"    # Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 48
    invoke-virtual {p2}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->getReverse()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 49
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "-reverse is not supported by Kaffe"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 51
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/DefaultNative2Ascii;->setup(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;)V

    .line 52
    return-void
.end method
