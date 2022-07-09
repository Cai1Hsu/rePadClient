.class public abstract Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/DefaultJspCompilerAdapter;
.super Ljava/lang/Object;
.source "DefaultJspCompilerAdapter.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/JspCompilerAdapter;


# static fields
.field private static lSep:Ljava/lang/String;


# instance fields
.field protected owner:Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 37
    const-string/jumbo v0, "line.separator"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/DefaultJspCompilerAdapter;->lSep:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;)V
    .locals 1
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/CommandlineJava;
    .param p2, "argument"    # Ljava/lang/String;

    .prologue
    .line 103
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 106
    :cond_0
    return-void
.end method

.method protected addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;Ljava/io/File;)V
    .locals 1
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/CommandlineJava;
    .param p2, "argument"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 129
    if-eqz p3, :cond_0

    .line 130
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 131
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 133
    :cond_0
    return-void
.end method

.method protected addArg(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/CommandlineJava;
    .param p2, "argument"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 116
    if-eqz p3, :cond_0

    .line 117
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 118
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    invoke-virtual {v0, p3}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 120
    :cond_0
    return-void
.end method

.method public getJspc()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/DefaultJspCompilerAdapter;->owner:Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    return-object v0
.end method

.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 149
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/DefaultJspCompilerAdapter;->getJspc()Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    return-object v0
.end method

.method public implementsOwnDependencyChecking()Z
    .locals 1

    .prologue
    .line 141
    const/4 v0, 0x0

    return v0
.end method

.method protected logAndAddFilesToCompile(Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;Ljava/util/Vector;Lorg/apache/tools/ant/types/CommandlineJava;)V
    .locals 6
    .param p1, "jspc"    # Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;
    .param p2, "compileList"    # Ljava/util/Vector;
    .param p3, "cmd"    # Lorg/apache/tools/ant/types/CommandlineJava;

    .prologue
    const/4 v5, 0x3

    .line 49
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Compilation "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {p3}, Lorg/apache/tools/ant/types/CommandlineJava;->describeJavaCommand()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3, v5}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;I)V

    .line 52
    new-instance v2, Ljava/lang/StringBuffer;

    const-string/jumbo v3, "File"

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 53
    .local v2, "niceSourceList":Ljava/lang/StringBuffer;
    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    move-result v3

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    .line 54
    const-string/jumbo v3, "s"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 56
    :cond_0
    const-string/jumbo v3, " to be compiled:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 58
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/DefaultJspCompilerAdapter;->lSep:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 60
    invoke-virtual {p2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .line 61
    .local v1, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 62
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 63
    .local v0, "arg":Ljava/lang/String;
    invoke-virtual {p3}, Lorg/apache/tools/ant/types/CommandlineJava;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v3

    invoke-virtual {v3, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 64
    const-string/jumbo v3, "    "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 65
    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 66
    sget-object v3, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/DefaultJspCompilerAdapter;->lSep:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 69
    .end local v0    # "arg":Ljava/lang/String;
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3, v5}, Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;->log(Ljava/lang/String;I)V

    .line 70
    return-void
.end method

.method public setJspc(Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;)V
    .locals 0
    .param p1, "owner"    # Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    .prologue
    .line 86
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/jsp/compilers/DefaultJspCompilerAdapter;->owner:Lorg/apache/tools/ant/taskdefs/optional/jsp/JspC;

    .line 87
    return-void
.end method
