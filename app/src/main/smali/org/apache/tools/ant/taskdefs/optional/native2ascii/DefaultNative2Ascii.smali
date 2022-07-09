.class public abstract Lorg/apache/tools/ant/taskdefs/optional/native2ascii/DefaultNative2Ascii;
.super Ljava/lang/Object;
.source "DefaultNative2Ascii.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/native2ascii/Native2AsciiAdapter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method


# virtual methods
.method protected addFiles(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/ProjectComponent;Ljava/io/File;Ljava/io/File;)V
    .locals 1
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;
    .param p2, "log"    # Lorg/apache/tools/ant/ProjectComponent;
    .param p3, "src"    # Ljava/io/File;
    .param p4, "dest"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 91
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 92
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 93
    return-void
.end method

.method public final convert(Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;Ljava/io/File;Ljava/io/File;)Z
    .locals 2
    .param p1, "args"    # Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;
    .param p2, "srcFile"    # Ljava/io/File;
    .param p3, "destFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 51
    new-instance v0, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 52
    .local v0, "cmd":Lorg/apache/tools/ant/types/Commandline;
    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/DefaultNative2Ascii;->setup(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;)V

    .line 53
    invoke-virtual {p0, v0, p1, p2, p3}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/DefaultNative2Ascii;->addFiles(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/ProjectComponent;Ljava/io/File;Ljava/io/File;)V

    .line 54
    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/native2ascii/DefaultNative2Ascii;->run(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/ProjectComponent;)Z

    move-result v1

    return v1
.end method

.method protected abstract run(Lorg/apache/tools/ant/types/Commandline;Lorg/apache/tools/ant/ProjectComponent;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
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
    .line 70
    invoke-virtual {p2}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->getEncoding()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 71
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    const-string/jumbo v1, "-encoding"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 72
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {p2}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->getEncoding()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 74
    :cond_0
    invoke-virtual {p2}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->getCurrentArgs()[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/apache/tools/ant/types/Commandline;->addArguments([Ljava/lang/String;)V

    .line 75
    return-void
.end method
