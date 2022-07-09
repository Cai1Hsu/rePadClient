.class public Lorg/apache/tools/ant/taskdefs/Javac;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "Javac.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/Javac$ImplementationSpecificArgument;
    }
.end annotation


# static fields
.field private static final CLASSIC:Ljava/lang/String; = "classic"

.field private static final EXTJAVAC:Ljava/lang/String; = "extJavac"

.field private static final FAIL_MSG:Ljava/lang/String; = "Compile failed; see the compiler error output for details."

.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field private static final JAVAC11:Ljava/lang/String; = "javac1.1"

.field private static final JAVAC12:Ljava/lang/String; = "javac1.2"

.field private static final JAVAC13:Ljava/lang/String; = "javac1.3"

.field private static final JAVAC14:Ljava/lang/String; = "javac1.4"

.field private static final JAVAC15:Ljava/lang/String; = "javac1.5"

.field private static final JAVAC16:Ljava/lang/String; = "javac1.6"

.field private static final JAVAC17:Ljava/lang/String; = "javac1.7"

.field private static final JAVAC18:Ljava/lang/String; = "javac1.8"

.field private static final MODERN:Ljava/lang/String; = "modern"

.field private static final PACKAGE_INFO_CLASS_FOOTER:[B

.field private static final PACKAGE_INFO_CLASS_HEADER:[B


# instance fields
.field private bootclasspath:Lorg/apache/tools/ant/types/Path;

.field private compileClasspath:Lorg/apache/tools/ant/types/Path;

.field protected compileList:[Ljava/io/File;

.field private compileSourcepath:Lorg/apache/tools/ant/types/Path;

.field private createMissingPackageInfoClass:Z

.field private debug:Z

.field private debugLevel:Ljava/lang/String;

.field private depend:Z

.field private deprecation:Z

.field private destDir:Ljava/io/File;

.field private encoding:Ljava/lang/String;

.field private errorProperty:Ljava/lang/String;

.field private extdirs:Lorg/apache/tools/ant/types/Path;

.field private facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

.field protected failOnError:Z

.field private fork:Z

.field private forkedExecutable:Ljava/lang/String;

.field private includeAntRuntime:Ljava/lang/Boolean;

.field private includeDestClasses:Z

.field private includeJavaRuntime:Z

.field protected listFiles:Z

.field private memoryInitialSize:Ljava/lang/String;

.field private memoryMaximumSize:Ljava/lang/String;

.field private nestedAdapter:Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

.field private nowarn:Z

.field private optimize:Z

.field private packageInfos:Ljava/util/Map;

.field private source:Ljava/lang/String;

.field private src:Lorg/apache/tools/ant/types/Path;

.field private targetAttribute:Ljava/lang/String;

.field private taskSuccess:Z

.field private tmpDir:Ljava/io/File;

.field private updatedProperty:Ljava/lang/String;

.field private verbose:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 95
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Javac;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    .line 1247
    const/16 v0, 0x32

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Javac;->PACKAGE_INFO_CLASS_HEADER:[B

    .line 1254
    const/16 v0, 0x36

    new-array v0, v0, [B

    fill-array-data v0, :array_1

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Javac;->PACKAGE_INFO_CLASS_FOOTER:[B

    return-void

    .line 1247
    nop

    :array_0
    .array-data 1
        -0x36t
        -0x2t
        -0x46t
        -0x42t
        0x0t
        0x0t
        0x0t
        0x31t
        0x0t
        0x7t
        0x7t
        0x0t
        0x5t
        0x7t
        0x0t
        0x6t
        0x1t
        0x0t
        0xat
        0x53t
        0x6ft
        0x75t
        0x72t
        0x63t
        0x65t
        0x46t
        0x69t
        0x6ct
        0x65t
        0x1t
        0x0t
        0x11t
        0x70t
        0x61t
        0x63t
        0x6bt
        0x61t
        0x67t
        0x65t
        0x2dt
        0x69t
        0x6et
        0x66t
        0x6ft
        0x2et
        0x6at
        0x61t
        0x76t
        0x61t
        0x1t
    .end array-data

    .line 1254
    nop

    :array_1
    .array-data 1
        0x2ft
        0x70t
        0x61t
        0x63t
        0x6bt
        0x61t
        0x67t
        0x65t
        0x2dt
        0x69t
        0x6et
        0x66t
        0x6ft
        0x1t
        0x0t
        0x10t
        0x6at
        0x61t
        0x76t
        0x61t
        0x2ft
        0x6ct
        0x61t
        0x6et
        0x67t
        0x2ft
        0x4ft
        0x62t
        0x6at
        0x65t
        0x63t
        0x74t
        0x2t
        0x0t
        0x0t
        0x1t
        0x0t
        0x2t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x0t
        0x3t
        0x0t
        0x0t
        0x0t
        0x2t
        0x0t
        0x4t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 140
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 102
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->debug:Z

    .line 103
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->optimize:Z

    .line 104
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->deprecation:Z

    .line 105
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->depend:Z

    .line 106
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->verbose:Z

    .line 111
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->includeJavaRuntime:Z

    .line 112
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->fork:Z

    .line 113
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Javac;->forkedExecutable:Ljava/lang/String;

    .line 114
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->nowarn:Z

    .line 117
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    .line 120
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->failOnError:Z

    .line 121
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->listFiles:Z

    .line 122
    new-array v0, v0, [Ljava/io/File;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    .line 123
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->packageInfos:Ljava/util/Map;

    .line 131
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->taskSuccess:Z

    .line 132
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->includeDestClasses:Z

    .line 133
    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/Javac;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    .line 135
    iput-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->createMissingPackageInfoClass:Z

    .line 141
    new-instance v0, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->assumedJavaVersion()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    .line 142
    return-void
.end method

.method private assumedJavaVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 145
    const-string/jumbo v0, "1.4"

    invoke-static {v0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isJavaVersion(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    const-string/jumbo v0, "javac1.4"

    .line 156
    :goto_0
    return-object v0

    .line 147
    :cond_0
    const-string/jumbo v0, "1.5"

    invoke-static {v0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isJavaVersion(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 148
    const-string/jumbo v0, "javac1.5"

    goto :goto_0

    .line 149
    :cond_1
    const-string/jumbo v0, "1.6"

    invoke-static {v0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isJavaVersion(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 150
    const-string/jumbo v0, "javac1.6"

    goto :goto_0

    .line 151
    :cond_2
    const-string/jumbo v0, "1.7"

    invoke-static {v0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isJavaVersion(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 152
    const-string/jumbo v0, "javac1.7"

    goto :goto_0

    .line 153
    :cond_3
    const-string/jumbo v0, "1.8"

    invoke-static {v0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isJavaVersion(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 154
    const-string/jumbo v0, "javac1.8"

    goto :goto_0

    .line 156
    :cond_4
    const-string/jumbo v0, "classic"

    goto :goto_0
.end method

.method private findSupportedFileExtensions()[Ljava/lang/String;
    .locals 6

    .prologue
    .line 978
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompiler()Ljava/lang/String;

    move-result-object v1

    .line 979
    .local v1, "compilerImpl":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Javac;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    if-eqz v4, :cond_3

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    .line 983
    .local v0, "adapter":Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;
    :goto_0
    const/4 v2, 0x0

    .line 984
    .local v2, "extensions":[Ljava/lang/String;
    instance-of v4, v0, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterExtension;

    if-eqz v4, :cond_0

    .line 985
    check-cast v0, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterExtension;

    .end local v0    # "adapter":Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;
    invoke-interface {v0}, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterExtension;->getSupportedFileExtensions()[Ljava/lang/String;

    move-result-object v2

    .line 989
    :cond_0
    if-nez v2, :cond_1

    .line 990
    const/4 v4, 0x1

    new-array v2, v4, [Ljava/lang/String;

    .end local v2    # "extensions":[Ljava/lang/String;
    const/4 v4, 0x0

    const-string/jumbo v5, "java"

    aput-object v5, v2, v4

    .line 995
    .restart local v2    # "extensions":[Ljava/lang/String;
    :cond_1
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    array-length v4, v2

    if-ge v3, v4, :cond_4

    .line 996
    aget-object v4, v2, v3

    const-string/jumbo v5, "*."

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 997
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "*."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    aget-object v5, v2, v3

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 995
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 979
    .end local v2    # "extensions":[Ljava/lang/String;
    .end local v3    # "i":I
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->createCompilerClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v4

    invoke-static {v1, p0, v4}, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->getCompiler(Ljava/lang/String;Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    move-result-object v0

    goto :goto_0

    .line 1000
    .restart local v2    # "extensions":[Ljava/lang/String;
    .restart local v3    # "i":I
    :cond_4
    return-object v2
.end method

.method private generateMissingPackageInfoClasses(Ljava/io/File;)V
    .locals 14
    .param p1, "dest"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1222
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/Javac;->packageInfos:Ljava/util/Map;

    invoke-interface {v9}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    .line 1223
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1224
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 1225
    .local v5, "pkg":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    .line 1226
    .local v8, "sourceLastMod":Ljava/lang/Long;
    new-instance v6, Ljava/io/File;

    const/16 v9, 0x2f

    sget-char v10, Ljava/io/File;->separatorChar:C

    invoke-virtual {v5, v9, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v6, p1, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1227
    .local v6, "pkgBinDir":Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    .line 1228
    new-instance v7, Ljava/io/File;

    const-string/jumbo v9, "package-info.class"

    invoke-direct {v7, v6, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1229
    .local v7, "pkgInfoClass":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    cmp-long v9, v10, v12

    if-gez v9, :cond_0

    .line 1232
    :cond_1
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v10, "Creating empty "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;)V

    .line 1233
    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v7}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 1235
    .local v4, "os":Ljava/io/OutputStream;
    :try_start_0
    sget-object v9, Lorg/apache/tools/ant/taskdefs/Javac;->PACKAGE_INFO_CLASS_HEADER:[B

    invoke-virtual {v4, v9}, Ljava/io/OutputStream;->write([B)V

    .line 1236
    const-string/jumbo v9, "UTF-8"

    invoke-virtual {v5, v9}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v3

    .line 1237
    .local v3, "name":[B
    array-length v9, v3

    add-int/lit8 v2, v9, 0xd

    .line 1238
    .local v2, "length":I
    int-to-byte v9, v2

    div-int/lit16 v9, v9, 0x100

    invoke-virtual {v4, v9}, Ljava/io/OutputStream;->write(I)V

    .line 1239
    int-to-byte v9, v2

    rem-int/lit16 v9, v9, 0x100

    invoke-virtual {v4, v9}, Ljava/io/OutputStream;->write(I)V

    .line 1240
    invoke-virtual {v4, v3}, Ljava/io/OutputStream;->write([B)V

    .line 1241
    sget-object v9, Lorg/apache/tools/ant/taskdefs/Javac;->PACKAGE_INFO_CLASS_FOOTER:[B

    invoke-virtual {v4, v9}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1243
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    goto/16 :goto_0

    .end local v2    # "length":I
    .end local v3    # "name":[B
    :catchall_0
    move-exception v9

    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V

    throw v9

    .line 1246
    .end local v0    # "entry":Ljava/util/Map$Entry;
    .end local v4    # "os":Ljava/io/OutputStream;
    .end local v5    # "pkg":Ljava/lang/String;
    .end local v6    # "pkgBinDir":Ljava/io/File;
    .end local v7    # "pkgInfoClass":Ljava/io/File;
    .end local v8    # "sourceLastMod":Ljava/lang/Long;
    :cond_2
    return-void
.end method

.method private getAltCompilerName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "anImplementation"    # Ljava/lang/String;

    .prologue
    .line 770
    const-string/jumbo v1, "javac1.7"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "javac1.8"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "javac1.6"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "javac1.5"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "javac1.4"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "javac1.3"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 776
    :cond_0
    const-string/jumbo v0, "modern"

    .line 799
    :cond_1
    :goto_0
    return-object v0

    .line 778
    :cond_2
    const-string/jumbo v1, "javac1.2"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string/jumbo v1, "javac1.1"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 780
    :cond_3
    const-string/jumbo v0, "classic"

    goto :goto_0

    .line 782
    :cond_4
    const-string/jumbo v1, "modern"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 783
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->assumedJavaVersion()Ljava/lang/String;

    move-result-object v0

    .line 784
    .local v0, "nextSelected":Ljava/lang/String;
    const-string/jumbo v1, "javac1.7"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "javac1.8"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "javac1.6"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "javac1.5"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "javac1.4"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "javac1.3"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 793
    .end local v0    # "nextSelected":Ljava/lang/String;
    :cond_5
    const-string/jumbo v1, "classic"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 794
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->assumedJavaVersion()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 796
    :cond_6
    const-string/jumbo v1, "extJavac"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 797
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->assumedJavaVersion()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 799
    :cond_7
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private lookForPackageInfos(Ljava/io/File;[Ljava/io/File;)V
    .locals 10
    .param p1, "srcDir"    # Ljava/io/File;
    .param p2, "newFiles"    # [Ljava/io/File;

    .prologue
    .line 1199
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v5, p2

    if-ge v1, v5, :cond_2

    .line 1200
    aget-object v0, p2, v1

    .line 1201
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "package-info.java"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 1199
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1204
    :cond_0
    sget-object v5, Lorg/apache/tools/ant/taskdefs/Javac;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    invoke-virtual {v5, p1, v0}, Lorg/apache/tools/ant/util/FileUtils;->removeLeadingPath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v5

    sget-char v6, Ljava/io/File;->separatorChar:C

    const/16 v7, 0x2f

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 1206
    .local v2, "path":Ljava/lang/String;
    const-string/jumbo v4, "/package-info.java"

    .line 1207
    .local v4, "suffix":Ljava/lang/String;
    invoke-virtual {v2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 1208
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "anomalous package-info.java path: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    goto :goto_1

    .line 1211
    :cond_1
    const/4 v5, 0x0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v6, v7

    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 1212
    .local v3, "pkg":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->packageInfos:Ljava/util/Map;

    new-instance v6, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    invoke-direct {v6, v8, v9}, Ljava/lang/Long;-><init>(J)V

    invoke-interface {v5, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1214
    .end local v0    # "f":Ljava/io/File;
    .end local v2    # "path":Ljava/lang/String;
    .end local v3    # "pkg":Ljava/lang/String;
    .end local v4    # "suffix":Ljava/lang/String;
    :cond_2
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;)V
    .locals 2
    .param p1, "adapter"    # Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    .prologue
    .line 887
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    if-eqz v0, :cond_0

    .line 888
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Can\'t have more than one compiler adapter"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 891
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    .line 892
    return-void
.end method

.method protected checkParameters()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1102
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->src:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 1103
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "srcdir attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 1106
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->src:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 1107
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "srcdir attribute must be set!"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 1111
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->destDir:Ljava/io/File;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->destDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1112
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "destination directory \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/Javac;->destDir:Ljava/io/File;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "\" does not exist "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "or is not a directory"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 1117
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->includeAntRuntime:Ljava/lang/Boolean;

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    const-string/jumbo v1, "build.sysclasspath"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3

    .line 1118
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "warning: \'includeantruntime\' was not set, "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "defaulting to build.sysclasspath=last; set to false for repeatable builds"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    .line 1122
    :cond_3
    return-void
.end method

.method protected compile()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 1130
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompiler()Ljava/lang/String;

    move-result-object v1

    .line 1132
    .local v1, "compilerImpl":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    array-length v5, v5

    if-lez v5, :cond_3

    .line 1133
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Compiling "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    array-length v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " source file"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    array-length v5, v5

    const/4 v7, 0x1

    if-ne v5, v7, :cond_0

    const-string/jumbo v5, ""

    :goto_0
    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->destDir:Ljava/io/File;

    if-eqz v5, :cond_1

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, " to "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Javac;->destDir:Ljava/io/File;

    invoke-virtual {v5, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_1
    invoke-virtual {v6, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;)V

    .line 1137
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->listFiles:Z

    if-eqz v5, :cond_2

    .line 1138
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    array-length v5, v5

    if-ge v3, v5, :cond_2

    .line 1139
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    aget-object v5, v5, v3

    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 1140
    .local v2, "filename":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;)V

    .line 1138
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1133
    .end local v2    # "filename":Ljava/lang/String;
    .end local v3    # "i":I
    :cond_0
    const-string/jumbo v5, "s"

    goto :goto_0

    :cond_1
    const-string/jumbo v5, ""

    goto :goto_1

    .line 1144
    :cond_2
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    if-eqz v5, :cond_4

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->nestedAdapter:Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    .line 1150
    .local v0, "adapter":Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;
    :goto_3
    invoke-interface {v0, p0}, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;->setJavac(Lorg/apache/tools/ant/taskdefs/Javac;)V

    .line 1153
    invoke-interface {v0}, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;->execute()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 1155
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->createMissingPackageInfoClass:Z

    if-eqz v5, :cond_3

    .line 1157
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->destDir:Ljava/io/File;

    if-eqz v5, :cond_5

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->destDir:Ljava/io/File;

    :goto_4
    invoke-direct {p0, v5}, Lorg/apache/tools/ant/taskdefs/Javac;->generateMissingPackageInfoClasses(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1180
    .end local v0    # "adapter":Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;
    :cond_3
    :goto_5
    return-void

    .line 1144
    :cond_4
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->createCompilerClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v5

    invoke-static {v1, p0, v5}, Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapterFactory;->getCompiler(Ljava/lang/String;Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;

    move-result-object v0

    goto :goto_3

    .line 1157
    .restart local v0    # "adapter":Lorg/apache/tools/ant/taskdefs/compilers/CompilerAdapter;
    :cond_5
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Javac;->src:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v6, v6, v7

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v5

    goto :goto_4

    .line 1161
    :catch_0
    move-exception v4

    .line 1163
    .local v4, "x":Ljava/io/IOException;
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v6

    invoke-direct {v5, v4, v6}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 1168
    .end local v4    # "x":Ljava/io/IOException;
    :cond_6
    iput-boolean v8, p0, Lorg/apache/tools/ant/taskdefs/Javac;->taskSuccess:Z

    .line 1169
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->errorProperty:Ljava/lang/String;

    if-eqz v5, :cond_7

    .line 1170
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Javac;->errorProperty:Ljava/lang/String;

    const-string/jumbo v7, "true"

    invoke-virtual {v5, v6, v7}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 1173
    :cond_7
    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->failOnError:Z

    if-eqz v5, :cond_8

    .line 1174
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v6, "Compile failed; see the compiler error output for details."

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 1176
    :cond_8
    const-string/jumbo v5, "Compile failed; see the compiler error output for details."

    invoke-virtual {p0, v5, v8}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    goto :goto_5
.end method

.method public createBootclasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 378
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 379
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    .line 381
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 336
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 337
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    .line 339
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createCompilerArg()Lorg/apache/tools/ant/taskdefs/Javac$ImplementationSpecificArgument;
    .locals 2

    .prologue
    .line 736
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Javac$ImplementationSpecificArgument;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/Javac$ImplementationSpecificArgument;-><init>(Lorg/apache/tools/ant/taskdefs/Javac;)V

    .line 738
    .local v0, "arg":Lorg/apache/tools/ant/taskdefs/Javac$ImplementationSpecificArgument;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->addImplementationArgument(Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;)V

    .line 739
    return-object v0
.end method

.method public createCompilerClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 879
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getImplementationClasspath(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createExtdirs()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 419
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->extdirs:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 420
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->extdirs:Lorg/apache/tools/ant/types/Path;

    .line 422
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->extdirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createSourcepath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 296
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 297
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    .line 299
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createSrc()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 217
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->src:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 218
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->src:Lorg/apache/tools/ant/types/Path;

    .line 220
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->src:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public execute()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 910
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->checkParameters()V

    .line 911
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->resetFileLists()V

    .line 915
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->src:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Path;->list()[Ljava/lang/String;

    move-result-object v3

    .line 916
    .local v3, "list":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v5, v3

    if-ge v2, v5, :cond_2

    .line 917
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    aget-object v6, v3, v2

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 918
    .local v4, "srcDir":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 919
    new-instance v5, Lorg/apache/tools/ant/BuildException;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "srcdir \""

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\" does not exist!"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v5

    .line 924
    :cond_0
    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/Javac;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v0

    .line 925
    .local v0, "ds":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v0}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v1

    .line 927
    .local v1, "files":[Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->destDir:Ljava/io/File;

    if-eqz v5, :cond_1

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->destDir:Ljava/io/File;

    :goto_1
    invoke-virtual {p0, v4, v5, v1}, Lorg/apache/tools/ant/taskdefs/Javac;->scanDir(Ljava/io/File;Ljava/io/File;[Ljava/lang/String;)V

    .line 916
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    move-object v5, v4

    .line 927
    goto :goto_1

    .line 930
    .end local v0    # "ds":Lorg/apache/tools/ant/DirectoryScanner;
    .end local v1    # "files":[Ljava/lang/String;
    .end local v4    # "srcDir":Ljava/io/File;
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->compile()V

    .line 931
    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->updatedProperty:Ljava/lang/String;

    if-eqz v5, :cond_3

    iget-boolean v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->taskSuccess:Z

    if-eqz v5, :cond_3

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    array-length v5, v5

    if-eqz v5, :cond_3

    .line 934
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Javac;->updatedProperty:Ljava/lang/String;

    const-string/jumbo v7, "true"

    invoke-virtual {v5, v6, v7}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 936
    :cond_3
    return-void
.end method

.method public getBootclasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 370
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 328
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getCompiler()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1063
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompilerVersion()Ljava/lang/String;

    move-result-object v0

    .line 1064
    .local v0, "compilerImpl":Ljava/lang/String;
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->fork:Z

    if-eqz v1, :cond_0

    .line 1065
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Javac;->isJdkCompiler(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1066
    const-string/jumbo v0, "extJavac"

    .line 1072
    :cond_0
    :goto_0
    return-object v0

    .line 1068
    :cond_1
    const-string/jumbo v1, "Since compiler setting isn\'t classic or modern, ignoring fork setting."

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/taskdefs/Javac;->log(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public getCompilerVersion()Ljava/lang/String;
    .locals 3

    .prologue
    .line 1090
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    const-string/jumbo v2, "build.compiler"

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->setMagicValue(Ljava/lang/String;)V

    .line 1091
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v0}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getImplementation()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentCompilerArgs()[Ljava/lang/String;
    .locals 6

    .prologue
    .line 747
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v4}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getExplicitChoice()Ljava/lang/String;

    move-result-object v2

    .line 750
    .local v2, "chosen":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompiler()Ljava/lang/String;

    move-result-object v1

    .line 751
    .local v1, "appliedCompiler":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v4, v1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->setImplementation(Ljava/lang/String;)V

    .line 753
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v4}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getArgs()[Ljava/lang/String;

    move-result-object v3

    .line 755
    .local v3, "result":[Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v4}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getImplementation()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lorg/apache/tools/ant/taskdefs/Javac;->getAltCompilerName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 757
    .local v0, "altCompilerName":Ljava/lang/String;
    array-length v4, v3

    if-nez v4, :cond_0

    if-eqz v0, :cond_0

    .line 758
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v4, v0}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->setImplementation(Ljava/lang/String;)V

    .line 759
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v4}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->getArgs()[Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 765
    :cond_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v4, v2}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->setImplementation(Ljava/lang/String;)V

    return-object v3

    .end local v0    # "altCompilerName":Ljava/lang/String;
    .end local v1    # "appliedCompiler":Ljava/lang/String;
    .end local v3    # "result":[Ljava/lang/String;
    :catchall_0
    move-exception v4

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v5, v2}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->setImplementation(Ljava/lang/String;)V

    throw v4
.end method

.method public getDebug()Z
    .locals 1

    .prologue
    .line 551
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->debug:Z

    return v0
.end method

.method public getDebugLevel()Ljava/lang/String;
    .locals 1

    .prologue
    .line 165
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->debugLevel:Ljava/lang/String;

    return-object v0
.end method

.method public getDepend()Z
    .locals 1

    .prologue
    .line 584
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->depend:Z

    return v0
.end method

.method public getDeprecation()Z
    .locals 1

    .prologue
    .line 480
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->deprecation:Z

    return v0
.end method

.method public getDestdir()Ljava/io/File;
    .locals 1

    .prologue
    .line 268
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->destDir:Ljava/io/File;

    return-object v0
.end method

.method public getEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 534
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->encoding:Ljava/lang/String;

    return-object v0
.end method

.method public getExecutable()Ljava/lang/String;
    .locals 1

    .prologue
    .line 683
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->forkedExecutable:Ljava/lang/String;

    return-object v0
.end method

.method public getExtdirs()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 411
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->extdirs:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getFailonerror()Z
    .locals 1

    .prologue
    .line 463
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->failOnError:Z

    return v0
.end method

.method public getFileList()[Ljava/io/File;
    .locals 1

    .prologue
    .line 1008
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    return-object v0
.end method

.method public getIncludeantruntime()Z
    .locals 1

    .prologue
    .line 636
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->includeAntRuntime:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->includeAntRuntime:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public getIncludejavaruntime()Z
    .locals 1

    .prologue
    .line 653
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->includeJavaRuntime:Z

    return v0
.end method

.method public getJavacExecutable()Ljava/lang/String;
    .locals 1

    .prologue
    .line 707
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->forkedExecutable:Ljava/lang/String;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->isForkedJavac()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 708
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getSystemJavac()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->forkedExecutable:Ljava/lang/String;

    .line 712
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->forkedExecutable:Ljava/lang/String;

    return-object v0

    .line 709
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->forkedExecutable:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->isForkedJavac()Z

    move-result v0

    if-nez v0, :cond_0

    .line 710
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->forkedExecutable:Ljava/lang/String;

    goto :goto_0
.end method

.method public getListfiles()Z
    .locals 1

    .prologue
    .line 438
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->listFiles:Z

    return v0
.end method

.method public getMemoryInitialSize()Ljava/lang/String;
    .locals 1

    .prologue
    .line 499
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->memoryInitialSize:Ljava/lang/String;

    return-object v0
.end method

.method public getMemoryMaximumSize()Ljava/lang/String;
    .locals 1

    .prologue
    .line 518
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->memoryMaximumSize:Ljava/lang/String;

    return-object v0
.end method

.method public getNowarn()Z
    .locals 1

    .prologue
    .line 728
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->nowarn:Z

    return v0
.end method

.method public getOptimize()Z
    .locals 1

    .prologue
    .line 567
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->optimize:Z

    return v0
.end method

.method public getSource()Ljava/lang/String;
    .locals 2

    .prologue
    .line 189
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->source:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->source:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    const-string/jumbo v1, "ant.build.javac.source"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getSourcepath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 288
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public getSrcdir()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 250
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->src:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method protected getSystemJavac()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1036
    const-string/jumbo v0, "javac"

    invoke-static {v0}, Lorg/apache/tools/ant/util/JavaEnvUtils;->getJdkExecutable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTarget()Ljava/lang/String;
    .locals 2

    .prologue
    .line 618
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->targetAttribute:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->targetAttribute:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    const-string/jumbo v1, "ant.build.javac.target"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getTaskSuccess()Z
    .locals 1

    .prologue
    .line 869
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->taskSuccess:Z

    return v0
.end method

.method public getTempdir()Ljava/io/File;
    .locals 1

    .prologue
    .line 819
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->tmpDir:Ljava/io/File;

    return-object v0
.end method

.method public getVerbose()Z
    .locals 1

    .prologue
    .line 600
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->verbose:Z

    return v0
.end method

.method public isForkedJavac()Z
    .locals 2

    .prologue
    .line 691
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->fork:Z

    if-nez v0, :cond_0

    const-string/jumbo v0, "extJavac"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->getCompiler()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isIncludeDestClasses()Z
    .locals 1

    .prologue
    .line 860
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->includeDestClasses:Z

    return v0
.end method

.method protected isJdkCompiler(Ljava/lang/String;)Z
    .locals 1
    .param p1, "compilerImpl"    # Ljava/lang/String;

    .prologue
    .line 1020
    const-string/jumbo v0, "modern"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "classic"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "javac1.8"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "javac1.7"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "javac1.6"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "javac1.5"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "javac1.4"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "javac1.3"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "javac1.2"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "javac1.1"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected recreateSrc()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 229
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->src:Lorg/apache/tools/ant/types/Path;

    .line 230
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->createSrc()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method protected resetFileLists()V
    .locals 1

    .prologue
    .line 942
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/io/File;

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    .line 943
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->packageInfos:Ljava/util/Map;

    .line 944
    return-void
.end method

.method protected scanDir(Ljava/io/File;Ljava/io/File;[Ljava/lang/String;)V
    .locals 9
    .param p1, "srcDir"    # Ljava/io/File;
    .param p2, "destDir"    # Ljava/io/File;
    .param p3, "files"    # [Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 955
    new-instance v2, Lorg/apache/tools/ant/util/GlobPatternMapper;

    invoke-direct {v2}, Lorg/apache/tools/ant/util/GlobPatternMapper;-><init>()V

    .line 956
    .local v2, "m":Lorg/apache/tools/ant/util/GlobPatternMapper;
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->findSupportedFileExtensions()[Ljava/lang/String;

    move-result-object v0

    .line 958
    .local v0, "extensions":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v6, v0

    if-ge v1, v6, :cond_1

    .line 959
    aget-object v6, v0, v1

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/util/GlobPatternMapper;->setFrom(Ljava/lang/String;)V

    .line 960
    const-string/jumbo v6, "*.class"

    invoke-virtual {v2, v6}, Lorg/apache/tools/ant/util/GlobPatternMapper;->setTo(Ljava/lang/String;)V

    .line 961
    new-instance v5, Lorg/apache/tools/ant/util/SourceFileScanner;

    invoke-direct {v5, p0}, Lorg/apache/tools/ant/util/SourceFileScanner;-><init>(Lorg/apache/tools/ant/Task;)V

    .line 962
    .local v5, "sfs":Lorg/apache/tools/ant/util/SourceFileScanner;
    invoke-virtual {v5, p3, p1, p2, v2}, Lorg/apache/tools/ant/util/SourceFileScanner;->restrictAsFiles([Ljava/lang/String;Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/util/FileNameMapper;)[Ljava/io/File;

    move-result-object v4

    .line 964
    .local v4, "newFiles":[Ljava/io/File;
    array-length v6, v4

    if-lez v6, :cond_0

    .line 965
    invoke-direct {p0, p1, v4}, Lorg/apache/tools/ant/taskdefs/Javac;->lookForPackageInfos(Ljava/io/File;[Ljava/io/File;)V

    .line 966
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    array-length v6, v6

    array-length v7, v4

    add-int/2addr v6, v7

    new-array v3, v6, [Ljava/io/File;

    .line 968
    .local v3, "newCompileList":[Ljava/io/File;
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    array-length v7, v7

    invoke-static {v6, v8, v3, v8, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 970
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    array-length v6, v6

    array-length v7, v4

    invoke-static {v4, v8, v3, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 972
    iput-object v3, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileList:[Ljava/io/File;

    .line 958
    .end local v3    # "newCompileList":[Ljava/io/File;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 975
    .end local v4    # "newFiles":[Ljava/io/File;
    .end local v5    # "sfs":Lorg/apache/tools/ant/util/SourceFileScanner;
    :cond_1
    return-void
.end method

.method public setBootClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 389
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->createBootclasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 390
    return-void
.end method

.method public setBootclasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "bootclasspath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 357
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 358
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    .line 362
    :goto_0
    return-void

    .line 360
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->bootclasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 316
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 317
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    .line 321
    :goto_0
    return-void

    .line 319
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileClasspath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 347
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 348
    return-void
.end method

.method public setCompiler(Ljava/lang/String;)V
    .locals 1
    .param p1, "compiler"    # Ljava/lang/String;

    .prologue
    .line 1045
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->facade:Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/util/facade/FacadeTaskHelper;->setImplementation(Ljava/lang/String;)V

    .line 1046
    return-void
.end method

.method public setCreateMissingPackageInfoClass(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 902
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->createMissingPackageInfoClass:Z

    .line 903
    return-void
.end method

.method public setDebug(Z)V
    .locals 0
    .param p1, "debug"    # Z

    .prologue
    .line 543
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->debug:Z

    .line 544
    return-void
.end method

.method public setDebugLevel(Ljava/lang/String;)V
    .locals 0
    .param p1, "v"    # Ljava/lang/String;

    .prologue
    .line 181
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->debugLevel:Ljava/lang/String;

    .line 182
    return-void
.end method

.method public setDepend(Z)V
    .locals 0
    .param p1, "depend"    # Z

    .prologue
    .line 576
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->depend:Z

    .line 577
    return-void
.end method

.method public setDeprecation(Z)V
    .locals 0
    .param p1, "deprecation"    # Z

    .prologue
    .line 472
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->deprecation:Z

    .line 473
    return-void
.end method

.method public setDestdir(Ljava/io/File;)V
    .locals 0
    .param p1, "destDir"    # Ljava/io/File;

    .prologue
    .line 259
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->destDir:Ljava/io/File;

    .line 260
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 0
    .param p1, "encoding"    # Ljava/lang/String;

    .prologue
    .line 526
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->encoding:Ljava/lang/String;

    .line 527
    return-void
.end method

.method public setErrorProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "errorProperty"    # Ljava/lang/String;

    .prologue
    .line 841
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->errorProperty:Ljava/lang/String;

    .line 842
    return-void
.end method

.method public setExecutable(Ljava/lang/String;)V
    .locals 0
    .param p1, "forkExec"    # Ljava/lang/String;

    .prologue
    .line 673
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->forkedExecutable:Ljava/lang/String;

    .line 674
    return-void
.end method

.method public setExtdirs(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "extdirs"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 398
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->extdirs:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 399
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->extdirs:Lorg/apache/tools/ant/types/Path;

    .line 403
    :goto_0
    return-void

    .line 401
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->extdirs:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setFailonerror(Z)V
    .locals 0
    .param p1, "fail"    # Z

    .prologue
    .line 447
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->failOnError:Z

    .line 448
    return-void
.end method

.method public setFork(Z)V
    .locals 0
    .param p1, "f"    # Z

    .prologue
    .line 662
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->fork:Z

    .line 663
    return-void
.end method

.method public setIncludeDestClasses(Z)V
    .locals 0
    .param p1, "includeDestClasses"    # Z

    .prologue
    .line 852
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->includeDestClasses:Z

    .line 853
    return-void
.end method

.method public setIncludeantruntime(Z)V
    .locals 1
    .param p1, "include"    # Z

    .prologue
    .line 628
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->includeAntRuntime:Ljava/lang/Boolean;

    .line 629
    return-void
.end method

.method public setIncludejavaruntime(Z)V
    .locals 0
    .param p1, "include"    # Z

    .prologue
    .line 644
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->includeJavaRuntime:Z

    .line 645
    return-void
.end method

.method public setListfiles(Z)V
    .locals 0
    .param p1, "list"    # Z

    .prologue
    .line 430
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->listFiles:Z

    .line 431
    return-void
.end method

.method public setMemoryInitialSize(Ljava/lang/String;)V
    .locals 0
    .param p1, "memoryInitialSize"    # Ljava/lang/String;

    .prologue
    .line 491
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->memoryInitialSize:Ljava/lang/String;

    .line 492
    return-void
.end method

.method public setMemoryMaximumSize(Ljava/lang/String;)V
    .locals 0
    .param p1, "memoryMaximumSize"    # Ljava/lang/String;

    .prologue
    .line 510
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->memoryMaximumSize:Ljava/lang/String;

    .line 511
    return-void
.end method

.method public setNowarn(Z)V
    .locals 0
    .param p1, "flag"    # Z

    .prologue
    .line 720
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->nowarn:Z

    .line 721
    return-void
.end method

.method public setOptimize(Z)V
    .locals 0
    .param p1, "optimize"    # Z

    .prologue
    .line 559
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->optimize:Z

    .line 560
    return-void
.end method

.method public setProceed(Z)V
    .locals 1
    .param p1, "proceed"    # Z

    .prologue
    .line 455
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->failOnError:Z

    .line 456
    return-void

    .line 455
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setSource(Ljava/lang/String;)V
    .locals 0
    .param p1, "v"    # Ljava/lang/String;

    .prologue
    .line 208
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->source:Ljava/lang/String;

    .line 209
    return-void
.end method

.method public setSourcepath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "sourcepath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 276
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 277
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    .line 281
    :goto_0
    return-void

    .line 279
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->compileSourcepath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setSourcepathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 307
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Javac;->createSourcepath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 308
    return-void
.end method

.method public setSrcdir(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "srcDir"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 238
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->src:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 239
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->src:Lorg/apache/tools/ant/types/Path;

    .line 243
    :goto_0
    return-void

    .line 241
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Javac;->src:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setTarget(Ljava/lang/String;)V
    .locals 0
    .param p1, "target"    # Ljava/lang/String;

    .prologue
    .line 610
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->targetAttribute:Ljava/lang/String;

    .line 611
    return-void
.end method

.method public setTempdir(Ljava/io/File;)V
    .locals 0
    .param p1, "tmpDir"    # Ljava/io/File;

    .prologue
    .line 809
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->tmpDir:Ljava/io/File;

    .line 810
    return-void
.end method

.method public setUpdatedProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "updatedProperty"    # Ljava/lang/String;

    .prologue
    .line 830
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->updatedProperty:Ljava/lang/String;

    .line 831
    return-void
.end method

.method public setVerbose(Z)V
    .locals 0
    .param p1, "verbose"    # Z

    .prologue
    .line 592
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/Javac;->verbose:Z

    .line 593
    return-void
.end method
