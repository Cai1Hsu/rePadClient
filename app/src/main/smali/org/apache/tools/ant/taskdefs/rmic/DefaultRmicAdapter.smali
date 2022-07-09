.class public abstract Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;
.super Ljava/lang/Object;
.source "DefaultRmicAdapter.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/rmic/RmicAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;
    }
.end annotation


# static fields
.field private static final RAND:Ljava/util/Random;

.field public static final RMI_SKEL_SUFFIX:Ljava/lang/String; = "_Skel"

.field public static final RMI_STUB_SUFFIX:Ljava/lang/String; = "_Stub"

.field public static final RMI_TIE_SUFFIX:Ljava/lang/String; = "_Tie"

.field public static final STUB_1_1:Ljava/lang/String; = "-v1.1"

.field public static final STUB_1_2:Ljava/lang/String; = "-v1.2"

.field public static final STUB_COMPAT:Ljava/lang/String; = "-vcompat"

.field public static final STUB_OPTION_1_1:Ljava/lang/String; = "1.1"

.field public static final STUB_OPTION_1_2:Ljava/lang/String; = "1.2"

.field public static final STUB_OPTION_COMPAT:Ljava/lang/String; = "compat"


# instance fields
.field private attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

.field private mapper:Lorg/apache/tools/ant/util/FileNameMapper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->RAND:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)Lorg/apache/tools/ant/taskdefs/Rmic;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;

    .prologue
    .line 41
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    return-object v0
.end method

.method static access$100()Ljava/util/Random;
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->RAND:Ljava/util/Random;

    return-object v0
.end method


# virtual methods
.method protected addStubVersionOptions()Ljava/lang/String;
    .locals 5

    .prologue
    .line 263
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Rmic;->getStubVersion()Ljava/lang/String;

    move-result-object v1

    .line 265
    .local v1, "stubVersion":Ljava/lang/String;
    const/4 v0, 0x0

    .line 266
    .local v0, "stubOption":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 267
    const-string/jumbo v2, "1.1"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 268
    const-string/jumbo v0, "-v1.1"

    .line 281
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIiop()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIdl()Z

    move-result v2

    if-nez v2, :cond_1

    .line 284
    const-string/jumbo v0, "-vcompat"

    .line 286
    :cond_1
    return-object v0

    .line 269
    :cond_2
    const-string/jumbo v2, "1.2"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 270
    const-string/jumbo v0, "-v1.2"

    goto :goto_0

    .line 271
    :cond_3
    const-string/jumbo v2, "compat"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 272
    const-string/jumbo v0, "-vcompat"

    goto :goto_0

    .line 275
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Unknown stub option "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected filterJvmCompilerArgs([Ljava/lang/String;)[Ljava/lang/String;
    .locals 8
    .param p1, "compilerArgs"    # [Ljava/lang/String;

    .prologue
    .line 309
    array-length v4, p1

    .line 310
    .local v4, "len":I
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 311
    .local v1, "args":Ljava/util/List;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v4, :cond_1

    .line 312
    aget-object v0, p1, v3

    .line 313
    .local v0, "arg":Ljava/lang/String;
    const-string/jumbo v5, "-J"

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 314
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 311
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 316
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Dropping "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " from compiler arguments"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 319
    .end local v0    # "arg":Ljava/lang/String;
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    .line 320
    .local v2, "count":I
    new-array v5, v2, [Ljava/lang/String;

    invoke-interface {v1, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    return-object v5
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 145
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->getCompileClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method protected getCompileClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 3

    .prologue
    .line 153
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Rmic;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 156
    .local v0, "classpath":Lorg/apache/tools/ant/types/Path;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Rmic;->getBase()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Path;->setLocation(Ljava/io/File;)V

    .line 161
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Rmic;->getClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v1

    .line 162
    .local v1, "cp":Lorg/apache/tools/ant/types/Path;
    if-nez v1, :cond_0

    .line 163
    new-instance v1, Lorg/apache/tools/ant/types/Path;

    .end local v1    # "cp":Lorg/apache/tools/ant/types/Path;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Rmic;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 165
    .restart local v1    # "cp":Lorg/apache/tools/ant/types/Path;
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIncludeantruntime()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 166
    const-string/jumbo v2, "last"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    .line 171
    :goto_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v2}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIncludejavaruntime()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 172
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->addJavaRuntime()V

    .line 174
    :cond_1
    return-object v0

    .line 168
    :cond_2
    const-string/jumbo v2, "ignore"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Path;->concatSystemClasspath(Ljava/lang/String;)Lorg/apache/tools/ant/types/Path;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/types/Path;->addExisting(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public getMapper()Lorg/apache/tools/ant/util/FileNameMapper;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    return-object v0
.end method

.method public getRmic()Lorg/apache/tools/ant/taskdefs/Rmic;
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    return-object v0
.end method

.method protected getSkelClassSuffix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 108
    const-string/jumbo v0, "_Skel"

    return-object v0
.end method

.method protected getStubClassSuffix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 100
    const-string/jumbo v0, "_Stub"

    return-object v0
.end method

.method protected getTieClassSuffix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 116
    const-string/jumbo v0, "_Tie"

    return-object v0
.end method

.method protected logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V
    .locals 9
    .param p1, "cmd"    # Lorg/apache/tools/ant/types/Commandline;

    .prologue
    const/4 v8, 0x3

    .line 330
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getCompileList()Ljava/util/Vector;

    move-result-object v2

    .line 332
    .local v2, "compileList":Ljava/util/Vector;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Compilation "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->describeArguments()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v8}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 335
    new-instance v4, Ljava/lang/StringBuffer;

    const-string/jumbo v5, "File"

    invoke-direct {v4, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 336
    .local v4, "niceSourceList":Ljava/lang/StringBuffer;
    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v1

    .line 337
    .local v1, "cListSize":I
    const/4 v5, 0x1

    if-eq v1, v5, :cond_0

    .line 338
    const-string/jumbo v5, "s"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 340
    :cond_0
    const-string/jumbo v5, " to be compiled:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 342
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_1

    .line 343
    invoke-virtual {v2, v3}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 344
    .local v0, "arg":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    invoke-virtual {v5, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 345
    const-string/jumbo v5, "    "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 346
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 342
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 349
    .end local v0    # "arg":Ljava/lang/String;
    :cond_1
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v8}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 350
    return-void
.end method

.method protected preprocessCompilerArgs([Ljava/lang/String;)[Ljava/lang/String;
    .locals 0
    .param p1, "compilerArgs"    # [Ljava/lang/String;

    .prologue
    .line 297
    return-object p1
.end method

.method public setRmic(Lorg/apache/tools/ant/taskdefs/Rmic;)V
    .locals 1
    .param p1, "attributes"    # Lorg/apache/tools/ant/taskdefs/Rmic;

    .prologue
    .line 83
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    .line 84
    new-instance v0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter$RmicFileNameMapper;-><init>(Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->mapper:Lorg/apache/tools/ant/util/FileNameMapper;

    .line 85
    return-void
.end method

.method protected setupRmicCommand()Lorg/apache/tools/ant/types/Commandline;
    .locals 1

    .prologue
    .line 182
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->setupRmicCommand([Ljava/lang/String;)Lorg/apache/tools/ant/types/Commandline;

    move-result-object v0

    return-object v0
.end method

.method protected setupRmicCommand([Ljava/lang/String;)Lorg/apache/tools/ant/types/Commandline;
    .locals 9
    .param p1, "options"    # [Ljava/lang/String;

    .prologue
    const/4 v8, 0x2

    .line 192
    new-instance v1, Lorg/apache/tools/ant/types/Commandline;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/Commandline;-><init>()V

    .line 194
    .local v1, "cmd":Lorg/apache/tools/ant/types/Commandline;
    if-eqz p1, :cond_0

    .line 195
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, p1

    if-ge v3, v5, :cond_0

    .line 196
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    aget-object v6, p1, v3

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 195
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 200
    .end local v3    # "i":I
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->getCompileClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 202
    .local v0, "classpath":Lorg/apache/tools/ant/types/Path;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    const-string/jumbo v6, "-d"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 203
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Rmic;->getOutputDir()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setFile(Ljava/io/File;)V

    .line 205
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getExtdirs()Lorg/apache/tools/ant/types/Path;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 206
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    const-string/jumbo v6, "-extdirs"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 207
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Rmic;->getExtdirs()Lorg/apache/tools/ant/types/Path;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 210
    :cond_1
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    const-string/jumbo v6, "-classpath"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 211
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    invoke-virtual {v5, v0}, Lorg/apache/tools/ant/types/Commandline$Argument;->setPath(Lorg/apache/tools/ant/types/Path;)V

    .line 212
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->addStubVersionOptions()Ljava/lang/String;

    move-result-object v4

    .line 213
    .local v4, "stubOption":Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 215
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    invoke-virtual {v5, v4}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 219
    :cond_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getSourceBase()Ljava/io/File;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 220
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    const-string/jumbo v6, "-keepgenerated"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 223
    :cond_3
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIiop()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 224
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    const-string/jumbo v6, "IIOP has been turned on."

    invoke-virtual {v5, v6, v8}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 225
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    const-string/jumbo v6, "-iiop"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 226
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIiopopts()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 227
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "IIOP Options: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIiopopts()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v8}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 229
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIiopopts()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 233
    :cond_4
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIdl()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 234
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    const-string/jumbo v6, "-idl"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 235
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    const-string/jumbo v6, "IDL has been turned on."

    invoke-virtual {v5, v6, v8}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 236
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIdlopts()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 237
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v6}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIdlopts()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 238
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "IDL Options: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v7}, Lorg/apache/tools/ant/taskdefs/Rmic;->getIdlopts()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v8}, Lorg/apache/tools/ant/taskdefs/Rmic;->log(Ljava/lang/String;I)V

    .line 243
    :cond_5
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getDebug()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 244
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Commandline;->createArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v5

    const-string/jumbo v6, "-g"

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 247
    :cond_6
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->attributes:Lorg/apache/tools/ant/taskdefs/Rmic;

    invoke-virtual {v5}, Lorg/apache/tools/ant/taskdefs/Rmic;->getCurrentCompilerArgs()[Ljava/lang/String;

    move-result-object v2

    .line 248
    .local v2, "compilerArgs":[Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->preprocessCompilerArgs([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 249
    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Commandline;->addArguments([Ljava/lang/String;)V

    .line 251
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/rmic/DefaultRmicAdapter;->logAndAddFilesToCompile(Lorg/apache/tools/ant/types/Commandline;)V

    .line 252
    return-object v1
.end method
