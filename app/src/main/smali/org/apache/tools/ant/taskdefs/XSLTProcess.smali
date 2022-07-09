.class public Lorg/apache/tools/ant/taskdefs/XSLTProcess;
.super Lorg/apache/tools/ant/taskdefs/MatchingTask;
.source "XSLTProcess.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/XSLTLogger;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/taskdefs/XSLTProcess$1;,
        Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;,
        Lorg/apache/tools/ant/taskdefs/XSLTProcess$StyleMapper;,
        Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;,
        Lorg/apache/tools/ant/taskdefs/XSLTProcess$OutputProperty;,
        Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;
    }
.end annotation


# static fields
.field private static final FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

.field public static final PROCESSOR_TRAX:Ljava/lang/String; = "trax"

.field static class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;


# instance fields
.field private baseDir:Ljava/io/File;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private destDir:Ljava/io/File;

.field private factory:Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;

.field private failOnError:Z

.field private failOnNoResources:Z

.field private failOnTransformationError:Z

.field private fileDirParameter:Ljava/lang/String;

.field private fileNameParameter:Ljava/lang/String;

.field private force:Z

.field private inFile:Ljava/io/File;

.field private liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

.field private loader:Lorg/apache/tools/ant/AntClassLoader;

.field private mapperElement:Lorg/apache/tools/ant/types/Mapper;

.field private outFile:Ljava/io/File;

.field private outputProperties:Ljava/util/Vector;

.field private params:Ljava/util/Vector;

.field private performDirectoryScan:Z

.field private processor:Ljava/lang/String;

.field private resources:Lorg/apache/tools/ant/types/resources/Union;

.field private reuseLoadedStylesheet:Z

.field private stylesheetLoaded:Z

.field private suppressWarnings:Z

.field private sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

.field private targetExtension:Ljava/lang/String;

.field private traceConfiguration:Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;

.field private useImplicitFileset:Z

.field private xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

.field private xslFile:Ljava/lang/String;

.field private xslResource:Lorg/apache/tools/ant/types/Resource;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 112
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v0

    sput-object v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 219
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;-><init>()V

    .line 59
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->destDir:Ljava/io/File;

    .line 62
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    .line 65
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslFile:Ljava/lang/String;

    .line 68
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslResource:Lorg/apache/tools/ant/types/Resource;

    .line 71
    const-string/jumbo v0, ".html"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->targetExtension:Ljava/lang/String;

    .line 74
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->fileNameParameter:Ljava/lang/String;

    .line 77
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->fileDirParameter:Ljava/lang/String;

    .line 80
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->params:Ljava/util/Vector;

    .line 83
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->inFile:Ljava/io/File;

    .line 86
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->outFile:Ljava/io/File;

    .line 92
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 100
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->stylesheetLoaded:Z

    .line 103
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->force:Z

    .line 106
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->outputProperties:Ljava/util/Vector;

    .line 109
    new-instance v0, Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/XMLCatalog;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    .line 119
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->performDirectoryScan:Z

    .line 125
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->factory:Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;

    .line 131
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->reuseLoadedStylesheet:Z

    .line 143
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 150
    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    .line 157
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->resources:Lorg/apache/tools/ant/types/resources/Union;

    .line 164
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->useImplicitFileset:Z

    .line 177
    iput-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->suppressWarnings:Z

    .line 184
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->failOnTransformationError:Z

    .line 191
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->failOnError:Z

    .line 199
    iput-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->failOnNoResources:Z

    .line 206
    new-instance v0, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    .line 220
    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/taskdefs/XSLTProcess;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/taskdefs/XSLTProcess;

    .prologue
    .line 57
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->targetExtension:Ljava/lang/String;

    return-object v0
.end method

.method private checkDest()V
    .locals 1

    .prologue
    .line 740
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->destDir:Ljava/io/File;

    if-nez v0, :cond_0

    .line 741
    const-string/jumbo v0, "destdir attributes must be set!"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/String;)V

    .line 743
    :cond_0
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 760
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

.method private ensureDirectoryFor(Ljava/io/File;)V
    .locals 3
    .param p1, "targetFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 874
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    .line 875
    .local v0, "directory":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 876
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_0

    .line 877
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Unable to create directory: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/String;)V

    .line 881
    :cond_0
    return-void
.end method

.method private loadClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p1, "classname"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 695
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->setupLoader()V

    .line 696
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-nez v0, :cond_0

    .line 697
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 699
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-static {p1, v0, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_0
.end method

.method private process(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/Resource;)V
    .locals 9
    .param p1, "inFile"    # Ljava/io/File;
    .param p2, "outFile"    # Ljava/io/File;
    .param p3, "stylesheet"    # Lorg/apache/tools/ant/types/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x2

    .line 843
    :try_start_0
    invoke-virtual {p3}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v2

    .line 844
    .local v2, "styleSheetLastModified":J
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "In file "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v4, " time: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x4

    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 845
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Out file "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v4, " time: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x4

    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 846
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Style file "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslFile:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v4, " time: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x4

    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 847
    iget-boolean v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->force:Z

    if-nez v1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    cmp-long v1, v4, v6

    if-gez v1, :cond_0

    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    cmp-long v1, v2, v4

    if-ltz v1, :cond_1

    .line 849
    :cond_0
    invoke-direct {p0, p2}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->ensureDirectoryFor(Ljava/io/File;)V

    .line 850
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Processing "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v4, " to "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x2

    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 851
    invoke-virtual {p0, p3}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->configureLiaison(Lorg/apache/tools/ant/types/Resource;)V

    .line 852
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    invoke-direct {p0, v1, p1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->setLiaisonDynamicFileParameters(Lorg/apache/tools/ant/taskdefs/XSLTLiaison;Ljava/io/File;)V

    .line 853
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    invoke-interface {v1, p1, p2}, Lorg/apache/tools/ant/taskdefs/XSLTLiaison;->transform(Ljava/io/File;Ljava/io/File;)V

    .line 865
    .end local v2    # "styleSheetLastModified":J
    :goto_0
    return-void

    .line 855
    .restart local v2    # "styleSheetLastModified":J
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Skipping input file "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v4, " because it is older than output file "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v4, " and so is the stylesheet "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x4

    invoke-virtual {p0, v1, v4}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 858
    .end local v2    # "styleSheetLastModified":J
    :catch_0
    move-exception v0

    .line 859
    .local v0, "ex":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Failed to process "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v8}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 860
    if-eqz p2, :cond_2

    .line 861
    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    .line 863
    :cond_2
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleTransformationError(Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private process(Ljava/io/File;Ljava/lang/String;Ljava/io/File;Lorg/apache/tools/ant/types/Resource;)V
    .locals 16
    .param p1, "baseDir"    # Ljava/io/File;
    .param p2, "xmlFile"    # Ljava/lang/String;
    .param p3, "destDir"    # Ljava/io/File;
    .param p4, "stylesheet"    # Lorg/apache/tools/ant/types/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 785
    const/4 v6, 0x0

    .line 786
    .local v6, "outF":Ljava/io/File;
    const/4 v3, 0x0

    .line 789
    .local v3, "inF":Ljava/io/File;
    :try_start_0
    invoke-virtual/range {p4 .. p4}, Lorg/apache/tools/ant/types/Resource;->getLastModified()J

    move-result-wide v10

    .line 790
    .local v10, "styleSheetLastModified":J
    new-instance v4, Ljava/io/File;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-direct {v4, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 792
    .end local v3    # "inF":Ljava/io/File;
    .local v4, "inF":Ljava/io/File;
    :try_start_1
    invoke-virtual {v4}, Ljava/io/File;->isDirectory()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 793
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Skipping "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v12, " it is a directory."

    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v12, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v12}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    move-object v3, v4

    .line 831
    .end local v4    # "inF":Ljava/io/File;
    .end local v10    # "styleSheetLastModified":J
    .restart local v3    # "inF":Ljava/io/File;
    :goto_0
    return-void

    .line 796
    .end local v3    # "inF":Ljava/io/File;
    .restart local v4    # "inF":Ljava/io/File;
    .restart local v10    # "styleSheetLastModified":J
    :cond_0
    const/4 v5, 0x0

    .line 797
    .local v5, "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v9, :cond_2

    .line 798
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {v9}, Lorg/apache/tools/ant/types/Mapper;->getImplementation()Lorg/apache/tools/ant/util/FileNameMapper;

    move-result-object v5

    .line 803
    :goto_1
    move-object/from16 v0, p2

    invoke-interface {v5, v0}, Lorg/apache/tools/ant/util/FileNameMapper;->mapFileName(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 804
    .local v8, "outFileName":[Ljava/lang/String;
    if-eqz v8, :cond_1

    array-length v9, v8

    if-nez v9, :cond_3

    .line 805
    :cond_1
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Skipping "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->inFile:Ljava/io/File;

    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v12, " it cannot get mapped to output."

    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v12, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v12}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    move-object v3, v4

    .line 806
    .end local v4    # "inF":Ljava/io/File;
    .restart local v3    # "inF":Ljava/io/File;
    goto :goto_0

    .line 800
    .end local v3    # "inF":Ljava/io/File;
    .end local v8    # "outFileName":[Ljava/lang/String;
    .restart local v4    # "inF":Ljava/io/File;
    :cond_2
    new-instance v5, Lorg/apache/tools/ant/taskdefs/XSLTProcess$StyleMapper;

    .end local v5    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    const/4 v9, 0x0

    move-object/from16 v0, p0

    invoke-direct {v5, v0, v9}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$StyleMapper;-><init>(Lorg/apache/tools/ant/taskdefs/XSLTProcess;Lorg/apache/tools/ant/taskdefs/XSLTProcess$1;)V

    .restart local v5    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    goto :goto_1

    .line 807
    .restart local v8    # "outFileName":[Ljava/lang/String;
    :cond_3
    if-eqz v8, :cond_4

    array-length v9, v8

    const/4 v12, 0x1

    if-le v9, v12, :cond_5

    .line 808
    :cond_4
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Skipping "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->inFile:Ljava/io/File;

    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v12, " its mapping is ambiguos."

    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v12, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v12}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    move-object v3, v4

    .line 809
    .end local v4    # "inF":Ljava/io/File;
    .restart local v3    # "inF":Ljava/io/File;
    goto :goto_0

    .line 811
    .end local v3    # "inF":Ljava/io/File;
    .restart local v4    # "inF":Ljava/io/File;
    :cond_5
    new-instance v7, Ljava/io/File;

    const/4 v9, 0x0

    aget-object v9, v8, v9

    move-object/from16 v0, p3

    invoke-direct {v7, v0, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 813
    .end local v6    # "outF":Ljava/io/File;
    .local v7, "outF":Ljava/io/File;
    :try_start_2
    move-object/from16 v0, p0

    iget-boolean v9, v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->force:Z

    if-nez v9, :cond_6

    invoke-virtual {v4}, Ljava/io/File;->lastModified()J

    move-result-wide v12

    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v14

    cmp-long v9, v12, v14

    if-gtz v9, :cond_6

    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v12

    cmp-long v9, v10, v12

    if-lez v9, :cond_7

    .line 815
    :cond_6
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->ensureDirectoryFor(Ljava/io/File;)V

    .line 816
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Processing "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    const-string/jumbo v12, " to "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;)V

    .line 817
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->configureLiaison(Lorg/apache/tools/ant/types/Resource;)V

    .line 818
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    move-object/from16 v0, p0

    invoke-direct {v0, v9, v4}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->setLiaisonDynamicFileParameters(Lorg/apache/tools/ant/taskdefs/XSLTLiaison;Ljava/io/File;)V

    .line 819
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    invoke-interface {v9, v4, v7}, Lorg/apache/tools/ant/taskdefs/XSLTLiaison;->transform(Ljava/io/File;Ljava/io/File;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    :cond_7
    move-object v3, v4

    .end local v4    # "inF":Ljava/io/File;
    .restart local v3    # "inF":Ljava/io/File;
    move-object v6, v7

    .line 829
    .end local v7    # "outF":Ljava/io/File;
    .restart local v6    # "outF":Ljava/io/File;
    goto/16 :goto_0

    .line 821
    .end local v5    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    .end local v8    # "outFileName":[Ljava/lang/String;
    .end local v10    # "styleSheetLastModified":J
    :catch_0
    move-exception v2

    .line 824
    .local v2, "ex":Ljava/lang/Exception;
    :goto_2
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Failed to process "

    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    move-object/from16 v0, p0

    iget-object v12, v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->inFile:Ljava/io/File;

    invoke-virtual {v9, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v12, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v9, v12}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 825
    if-eqz v6, :cond_8

    .line 826
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 828
    :cond_8
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleTransformationError(Ljava/lang/Exception;)V

    goto/16 :goto_0

    .line 821
    .end local v2    # "ex":Ljava/lang/Exception;
    .end local v3    # "inF":Ljava/io/File;
    .restart local v4    # "inF":Ljava/io/File;
    .restart local v10    # "styleSheetLastModified":J
    :catch_1
    move-exception v2

    move-object v3, v4

    .end local v4    # "inF":Ljava/io/File;
    .restart local v3    # "inF":Ljava/io/File;
    goto :goto_2

    .end local v3    # "inF":Ljava/io/File;
    .end local v6    # "outF":Ljava/io/File;
    .restart local v4    # "inF":Ljava/io/File;
    .restart local v5    # "mapper":Lorg/apache/tools/ant/util/FileNameMapper;
    .restart local v7    # "outF":Ljava/io/File;
    .restart local v8    # "outFileName":[Ljava/lang/String;
    :catch_2
    move-exception v2

    move-object v3, v4

    .end local v4    # "inF":Ljava/io/File;
    .restart local v3    # "inF":Ljava/io/File;
    move-object v6, v7

    .end local v7    # "outF":Ljava/io/File;
    .restart local v6    # "outF":Ljava/io/File;
    goto :goto_2
.end method

.method private processResources(Lorg/apache/tools/ant/types/Resource;)V
    .locals 7
    .param p1, "stylesheet"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 752
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v6}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 753
    .local v3, "iter":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 754
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/apache/tools/ant/types/Resource;

    .line 755
    .local v5, "r":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 758
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    .line 759
    .local v0, "base":Ljava/io/File;
    invoke-virtual {v5}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v4

    .line 760
    .local v4, "name":Ljava/lang/String;
    sget-object v6, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v6, :cond_2

    const-string/jumbo v6, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v6}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    sput-object v6, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_1
    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 761
    .local v2, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v2, :cond_1

    .line 762
    invoke-static {v2}, Lorg/apache/tools/ant/util/ResourceUtils;->asFileResource(Lorg/apache/tools/ant/types/resources/FileProvider;)Lorg/apache/tools/ant/types/resources/FileResource;

    move-result-object v1

    .line 763
    .local v1, "f":Lorg/apache/tools/ant/types/resources/FileResource;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/FileResource;->getBaseDir()Ljava/io/File;

    move-result-object v0

    .line 764
    if-nez v0, :cond_1

    .line 765
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 768
    .end local v1    # "f":Lorg/apache/tools/ant/types/resources/FileResource;
    :cond_1
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->destDir:Ljava/io/File;

    invoke-direct {p0, v0, v4, v6, p1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->process(Ljava/io/File;Ljava/lang/String;Ljava/io/File;Lorg/apache/tools/ant/types/Resource;)V

    goto :goto_0

    .line 760
    .end local v2    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_2
    sget-object v6, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_1

    .line 770
    .end local v0    # "base":Ljava/io/File;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "r":Lorg/apache/tools/ant/types/Resource;
    :cond_3
    return-void
.end method

.method private resolveProcessor(Ljava/lang/String;)V
    .locals 2
    .param p1, "proc"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 676
    const-string/jumbo v1, "trax"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 677
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;

    invoke-direct {v1}, Lorg/apache/tools/ant/taskdefs/optional/TraXLiaison;-><init>()V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    .line 683
    :goto_0
    return-void

    .line 680
    :cond_0
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 681
    .local v0, "clazz":Ljava/lang/Class;
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    goto :goto_0
.end method

.method private setLiaisonDynamicFileParameters(Lorg/apache/tools/ant/taskdefs/XSLTLiaison;Ljava/io/File;)V
    .locals 6
    .param p1, "liaison"    # Lorg/apache/tools/ant/taskdefs/XSLTLiaison;
    .param p2, "inFile"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1209
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->fileNameParameter:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 1210
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->fileNameParameter:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1, v2, v3}, Lorg/apache/tools/ant/taskdefs/XSLTLiaison;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 1212
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->fileDirParameter:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 1213
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    invoke-static {v2, p2}, Lorg/apache/tools/ant/util/FileUtils;->getRelativePath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v1

    .line 1214
    .local v1, "fileName":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1217
    .local v0, "file":Ljava/io/File;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->fileDirParameter:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    const/16 v4, 0x5c

    const/16 v5, 0x2f

    invoke-virtual {v2, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    :goto_0
    invoke-interface {p1, v3, v2}, Lorg/apache/tools/ant/taskdefs/XSLTLiaison;->addParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 1220
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "fileName":Ljava/lang/String;
    :cond_1
    return-void

    .line 1217
    .restart local v0    # "file":Ljava/io/File;
    .restart local v1    # "fileName":Ljava/lang/String;
    :cond_2
    const-string/jumbo v2, "."

    goto :goto_0
.end method

.method private setupLoader()V
    .locals 2

    .prologue
    .line 708
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-nez v0, :cond_0

    .line 709
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 710
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v0}, Lorg/apache/tools/ant/AntClassLoader;->setThreadContextLoader()V

    .line 712
    :cond_0
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 1
    .param p1, "rc"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 267
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/Union;->add(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 268
    return-void
.end method

.method public add(Lorg/apache/tools/ant/util/FileNameMapper;)V
    .locals 2
    .param p1, "fileNameMapper"    # Lorg/apache/tools/ant/util/FileNameMapper;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 300
    new-instance v0, Lorg/apache/tools/ant/types/Mapper;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Mapper;-><init>(Lorg/apache/tools/ant/Project;)V

    .line 301
    .local v0, "mapper":Lorg/apache/tools/ant/types/Mapper;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Mapper;->add(Lorg/apache/tools/ant/util/FileNameMapper;)V

    .line 302
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->addMapper(Lorg/apache/tools/ant/types/Mapper;)V

    .line 303
    return-void
.end method

.method public addConfiguredStyle(Lorg/apache/tools/ant/types/resources/Resources;)V
    .locals 2
    .param p1, "rc"    # Lorg/apache/tools/ant/types/resources/Resources;

    .prologue
    .line 276
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/resources/Resources;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 277
    const-string/jumbo v0, "The style element must be specified with exactly one nested resource."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/String;)V

    .line 282
    :goto_0
    return-void

    .line 280
    :cond_0
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/resources/Resources;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->setXslResource(Lorg/apache/tools/ant/types/Resource;)V

    goto :goto_0
.end method

.method public addConfiguredXMLCatalog(Lorg/apache/tools/ant/types/XMLCatalog;)V
    .locals 1
    .param p1, "xmlCatalog"    # Lorg/apache/tools/ant/types/XMLCatalog;

    .prologue
    .line 552
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->addConfiguredXMLCatalog(Lorg/apache/tools/ant/types/XMLCatalog;)V

    .line 553
    return-void
.end method

.method public addMapper(Lorg/apache/tools/ant/types/Mapper;)V
    .locals 1
    .param p1, "mapper"    # Lorg/apache/tools/ant/types/Mapper;

    .prologue
    .line 252
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    if-eqz v0, :cond_0

    .line 253
    const-string/jumbo v0, "Cannot define more than one mapper"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/String;)V

    .line 257
    :goto_0
    return-void

    .line 255
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->mapperElement:Lorg/apache/tools/ant/types/Mapper;

    goto :goto_0
.end method

.method public addSysproperty(Lorg/apache/tools/ant/types/Environment$Variable;)V
    .locals 1
    .param p1, "sysp"    # Lorg/apache/tools/ant/types/Environment$Variable;

    .prologue
    .line 628
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->addVariable(Lorg/apache/tools/ant/types/Environment$Variable;)V

    .line 629
    return-void
.end method

.method public addSyspropertyset(Lorg/apache/tools/ant/types/PropertySet;)V
    .locals 1
    .param p1, "sysp"    # Lorg/apache/tools/ant/types/PropertySet;

    .prologue
    .line 637
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->addSyspropertyset(Lorg/apache/tools/ant/types/PropertySet;)V

    .line 638
    return-void
.end method

.method protected configureLiaison(Ljava/io/File;)V
    .locals 2
    .param p1, "stylesheet"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1141
    new-instance v0, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>()V

    .line 1142
    .local v0, "fr":Lorg/apache/tools/ant/types/resources/FileResource;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/resources/FileResource;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 1143
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/FileResource;->setFile(Ljava/io/File;)V

    .line 1144
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->configureLiaison(Lorg/apache/tools/ant/types/Resource;)V

    .line 1145
    return-void
.end method

.method protected configureLiaison(Lorg/apache/tools/ant/types/Resource;)V
    .locals 8
    .param p1, "stylesheet"    # Lorg/apache/tools/ant/types/Resource;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x2

    .line 1155
    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->stylesheetLoaded:Z

    if-eqz v4, :cond_1

    iget-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->reuseLoadedStylesheet:Z

    if-eqz v4, :cond_1

    .line 1195
    :cond_0
    :goto_0
    return-void

    .line 1158
    :cond_1
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->stylesheetLoaded:Z

    .line 1161
    :try_start_0
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Loading stylesheet "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {p0, v4, v5}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 1164
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    instance-of v4, v4, Lorg/apache/tools/ant/taskdefs/XSLTLiaison2;

    if-eqz v4, :cond_2

    .line 1165
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    check-cast v4, Lorg/apache/tools/ant/taskdefs/XSLTLiaison2;

    invoke-interface {v4, p0}, Lorg/apache/tools/ant/taskdefs/XSLTLiaison2;->configure(Lorg/apache/tools/ant/taskdefs/XSLTProcess;)V

    .line 1167
    :cond_2
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    instance-of v4, v4, Lorg/apache/tools/ant/taskdefs/XSLTLiaison3;

    if-eqz v4, :cond_4

    .line 1170
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    check-cast v4, Lorg/apache/tools/ant/taskdefs/XSLTLiaison3;

    invoke-interface {v4, p1}, Lorg/apache/tools/ant/taskdefs/XSLTLiaison3;->setStylesheet(Lorg/apache/tools/ant/types/Resource;)V

    .line 1185
    :goto_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->params:Ljava/util/Vector;

    invoke-virtual {v4}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :cond_3
    :goto_2
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1186
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;

    .line 1187
    .local v3, "p":Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;
    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->shouldUse()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1188
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;->getExpression()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lorg/apache/tools/ant/taskdefs/XSLTLiaison;->addParam(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 1191
    .end local v0    # "e":Ljava/util/Enumeration;
    .end local v3    # "p":Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;
    :catch_0
    move-exception v1

    .line 1192
    .local v1, "ex":Ljava/lang/Exception;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Failed to transform using stylesheet "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4, v7}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 1193
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleTransformationError(Ljava/lang/Exception;)V

    goto :goto_0

    .line 1175
    .end local v1    # "ex":Ljava/lang/Exception;
    :cond_4
    :try_start_1
    sget-object v4, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    if-nez v4, :cond_5

    const-string/jumbo v4, "org.apache.tools.ant.types.resources.FileProvider"

    invoke-static {v4}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    sput-object v4, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    :goto_3
    invoke-virtual {p1, v4}, Lorg/apache/tools/ant/types/Resource;->as(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/resources/FileProvider;

    .line 1177
    .local v2, "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    if-eqz v2, :cond_6

    .line 1178
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    invoke-interface {v2}, Lorg/apache/tools/ant/types/resources/FileProvider;->getFile()Ljava/io/File;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/tools/ant/taskdefs/XSLTLiaison;->setStylesheet(Ljava/io/File;)V

    goto :goto_1

    .line 1175
    .end local v2    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_5
    sget-object v4, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->class$org$apache$tools$ant$types$resources$FileProvider:Ljava/lang/Class;

    goto :goto_3

    .line 1180
    .restart local v2    # "fp":Lorg/apache/tools/ant/types/resources/FileProvider;
    :cond_6
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " accepts the stylesheet only as a file"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 509
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 510
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 512
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public createFactory()Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1228
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->factory:Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;

    if-eqz v0, :cond_0

    .line 1229
    const-string/jumbo v0, "\'factory\' element must be unique"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/String;)V

    .line 1233
    :goto_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->factory:Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;

    return-object v0

    .line 1231
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->factory:Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;

    goto :goto_0
.end method

.method public createOutputProperty()Lorg/apache/tools/ant/taskdefs/XSLTProcess$OutputProperty;
    .locals 2

    .prologue
    .line 1074
    new-instance v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$OutputProperty;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$OutputProperty;-><init>()V

    .line 1075
    .local v0, "p":Lorg/apache/tools/ant/taskdefs/XSLTProcess$OutputProperty;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->outputProperties:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 1076
    return-object v0
.end method

.method public createParam()Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;
    .locals 2

    .prologue
    .line 942
    new-instance v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;-><init>()V

    .line 943
    .local v0, "p":Lorg/apache/tools/ant/taskdefs/XSLTProcess$Param;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->params:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 944
    return-object v0
.end method

.method public createTrace()Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;
    .locals 2

    .prologue
    .line 650
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->traceConfiguration:Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;

    if-eqz v0, :cond_0

    .line 651
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "can\'t have more than one trace configuration"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 654
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;-><init>(Lorg/apache/tools/ant/taskdefs/XSLTProcess;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->traceConfiguration:Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;

    .line 655
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->traceConfiguration:Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;

    return-object v0
.end method

.method public execute()V
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 312
    const-string/jumbo v11, "style"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getTaskType()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 313
    const-string/jumbo v11, "Warning: the task name <style> is deprecated. Use <xslt> instead."

    const/4 v12, 0x1

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 316
    :cond_0
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    .line 322
    .local v7, "savedBaseDir":Ljava/io/File;
    const-string/jumbo v1, "specify the stylesheet either as a filename in style attribute or as a nested resource"

    .line 326
    .local v1, "baseMessage":Ljava/lang/String;
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslResource:Lorg/apache/tools/ant/types/Resource;

    if-nez v11, :cond_1

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslFile:Ljava/lang/String;

    if-nez v11, :cond_1

    .line 327
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/String;)V

    .line 442
    :goto_0
    return-void

    .line 330
    :cond_1
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslResource:Lorg/apache/tools/ant/types/Resource;

    if-eqz v11, :cond_2

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslFile:Ljava/lang/String;

    if-eqz v11, :cond_2

    .line 331
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v11, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " but not as both"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v11}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/String;)V

    goto :goto_0

    .line 334
    :cond_2
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->inFile:Ljava/io/File;

    if-eqz v11, :cond_3

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->inFile:Ljava/io/File;

    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_3

    .line 335
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "input file "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->inFile:Ljava/io/File;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " does not exist"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v11}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/String;)V

    goto :goto_0

    .line 339
    :cond_3
    :try_start_0
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->setupLoader()V

    .line 341
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->size()I

    move-result v11

    if-lez v11, :cond_4

    .line 342
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->setSystem()V

    .line 346
    :cond_4
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    if-nez v11, :cond_5

    .line 347
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    invoke-virtual {v11}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v11

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    .line 349
    :cond_5
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getLiaison()Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    move-result-object v11

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    .line 352
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    instance-of v11, v11, Lorg/apache/tools/ant/taskdefs/XSLTLoggerAware;

    if-eqz v11, :cond_6

    .line 353
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    check-cast v11, Lorg/apache/tools/ant/taskdefs/XSLTLoggerAware;

    invoke-interface {v11, p0}, Lorg/apache/tools/ant/taskdefs/XSLTLoggerAware;->setLogger(Lorg/apache/tools/ant/taskdefs/XSLTLogger;)V

    .line 355
    :cond_6
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Using "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x3

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 357
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslFile:Ljava/lang/String;

    if-eqz v11, :cond_a

    .line 360
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslFile:Ljava/lang/String;

    invoke-virtual {v11, v12}, Lorg/apache/tools/ant/Project;->resolveFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v10

    .line 361
    .local v10, "stylesheet":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v11

    if-nez v11, :cond_7

    .line 362
    sget-object v11, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->FILE_UTILS:Lorg/apache/tools/ant/util/FileUtils;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslFile:Ljava/lang/String;

    invoke-virtual {v11, v12, v13}, Lorg/apache/tools/ant/util/FileUtils;->resolveFile(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 367
    .local v0, "alternative":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v11

    if-eqz v11, :cond_7

    .line 368
    const-string/jumbo v11, "DEPRECATED - the \'style\' attribute should be relative to the project\'s"

    invoke-virtual {p0, v11}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;)V

    .line 370
    const-string/jumbo v11, "             basedir, not the tasks\'s basedir."

    invoke-virtual {p0, v11}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;)V

    .line 371
    move-object v10, v0

    .line 374
    .end local v0    # "alternative":Ljava/io/File;
    :cond_7
    new-instance v3, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>()V

    .line 375
    .local v3, "fr":Lorg/apache/tools/ant/types/resources/FileResource;
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v11

    invoke-virtual {v3, v11}, Lorg/apache/tools/ant/types/resources/FileResource;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 376
    invoke-virtual {v3, v10}, Lorg/apache/tools/ant/types/resources/FileResource;->setFile(Ljava/io/File;)V

    .line 377
    move-object v9, v3

    .line 382
    .end local v3    # "fr":Lorg/apache/tools/ant/types/resources/FileResource;
    .end local v10    # "stylesheet":Ljava/io/File;
    .local v9, "styleResource":Lorg/apache/tools/ant/types/Resource;
    :goto_1
    invoke-virtual {v9}, Lorg/apache/tools/ant/types/Resource;->isExists()Z

    move-result v11

    if-nez v11, :cond_b

    .line 383
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "stylesheet "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " doesn\'t exist."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {p0, v11}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 430
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v11, :cond_8

    .line 431
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v11}, Lorg/apache/tools/ant/AntClassLoader;->resetThreadContextLoader()V

    .line 432
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v11}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 433
    const/4 v11, 0x0

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 435
    :cond_8
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->size()I

    move-result v11

    if-lez v11, :cond_9

    .line 436
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->restoreSystem()V

    .line 438
    :cond_9
    const/4 v11, 0x0

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    .line 439
    const/4 v11, 0x0

    iput-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->stylesheetLoaded:Z

    .line 440
    :goto_2
    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    goto/16 :goto_0

    .line 379
    .end local v9    # "styleResource":Lorg/apache/tools/ant/types/Resource;
    :cond_a
    :try_start_1
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslResource:Lorg/apache/tools/ant/types/Resource;

    .restart local v9    # "styleResource":Lorg/apache/tools/ant/types/Resource;
    goto :goto_1

    .line 388
    :cond_b
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->inFile:Ljava/io/File;

    if-eqz v11, :cond_e

    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->outFile:Ljava/io/File;

    if-eqz v11, :cond_e

    .line 389
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->inFile:Ljava/io/File;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->outFile:Ljava/io/File;

    invoke-direct {p0, v11, v12, v9}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->process(Ljava/io/File;Ljava/io/File;Lorg/apache/tools/ant/types/Resource;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 430
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v11, :cond_c

    .line 431
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v11}, Lorg/apache/tools/ant/AntClassLoader;->resetThreadContextLoader()V

    .line 432
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v11}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 433
    const/4 v11, 0x0

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 435
    :cond_c
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->size()I

    move-result v11

    if-lez v11, :cond_d

    .line 436
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->restoreSystem()V

    .line 438
    :cond_d
    const/4 v11, 0x0

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    .line 439
    const/4 v11, 0x0

    iput-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->stylesheetLoaded:Z

    goto :goto_2

    .line 398
    :cond_e
    :try_start_2
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->checkDest()V

    .line 400
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->useImplicitFileset:Z

    if-eqz v11, :cond_11

    .line 401
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    invoke-virtual {p0, v11}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getDirectoryScanner(Ljava/io/File;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v8

    .line 402
    .local v8, "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "Transforming into "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->destDir:Ljava/io/File;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x2

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 405
    invoke-virtual {v8}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v6

    .line 406
    .local v6, "list":[Ljava/lang/String;
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_3
    array-length v11, v6

    if-ge v4, v11, :cond_f

    .line 407
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    aget-object v12, v6, v4

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->destDir:Ljava/io/File;

    invoke-direct {p0, v11, v12, v13, v9}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->process(Ljava/io/File;Ljava/lang/String;Ljava/io/File;Lorg/apache/tools/ant/types/Resource;)V

    .line 406
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 409
    :cond_f
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->performDirectoryScan:Z

    if-eqz v11, :cond_15

    .line 411
    invoke-virtual {v8}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedDirectories()[Ljava/lang/String;

    move-result-object v2

    .line 412
    .local v2, "dirs":[Ljava/lang/String;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_4
    array-length v11, v2

    if-ge v5, v11, :cond_15

    .line 413
    new-instance v11, Ljava/io/File;

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    aget-object v13, v2, v5

    invoke-direct {v11, v12, v13}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v11}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v6

    .line 414
    const/4 v4, 0x0

    :goto_5
    array-length v11, v6

    if-ge v4, v11, :cond_10

    .line 415
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    aget-object v13, v2, v5

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    sget-object v13, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    aget-object v13, v6, v4

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v12

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->destDir:Ljava/io/File;

    invoke-direct {p0, v11, v12, v13, v9}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->process(Ljava/io/File;Ljava/lang/String;Ljava/io/File;Lorg/apache/tools/ant/types/Resource;)V

    .line 414
    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 412
    :cond_10
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 421
    .end local v2    # "dirs":[Ljava/lang/String;
    .end local v4    # "i":I
    .end local v5    # "j":I
    .end local v6    # "list":[Ljava/lang/String;
    .end local v8    # "scanner":Lorg/apache/tools/ant/DirectoryScanner;
    :cond_11
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->resources:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/resources/Union;->size()I

    move-result v11

    if-nez v11, :cond_15

    .line 422
    iget-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->failOnNoResources:Z

    if-eqz v11, :cond_12

    .line 423
    const-string/jumbo v11, "no resources specified"

    invoke-virtual {p0, v11}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 430
    :cond_12
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v11, :cond_13

    .line 431
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v11}, Lorg/apache/tools/ant/AntClassLoader;->resetThreadContextLoader()V

    .line 432
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v11}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 433
    const/4 v11, 0x0

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 435
    :cond_13
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->size()I

    move-result v11

    if-lez v11, :cond_14

    .line 436
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->restoreSystem()V

    .line 438
    :cond_14
    const/4 v11, 0x0

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    .line 439
    const/4 v11, 0x0

    iput-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->stylesheetLoaded:Z

    goto/16 :goto_2

    .line 428
    :cond_15
    :try_start_3
    invoke-direct {p0, v9}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->processResources(Lorg/apache/tools/ant/types/Resource;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 430
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v11, :cond_16

    .line 431
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v11}, Lorg/apache/tools/ant/AntClassLoader;->resetThreadContextLoader()V

    .line 432
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v11}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 433
    const/4 v11, 0x0

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 435
    :cond_16
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->size()I

    move-result v11

    if-lez v11, :cond_17

    .line 436
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v11}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->restoreSystem()V

    .line 438
    :cond_17
    const/4 v11, 0x0

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    .line 439
    const/4 v11, 0x0

    iput-boolean v11, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->stylesheetLoaded:Z

    goto/16 :goto_2

    .line 430
    .end local v9    # "styleResource":Lorg/apache/tools/ant/types/Resource;
    :catchall_0
    move-exception v11

    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    if-eqz v12, :cond_18

    .line 431
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v12}, Lorg/apache/tools/ant/AntClassLoader;->resetThreadContextLoader()V

    .line 432
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    invoke-virtual {v12}, Lorg/apache/tools/ant/AntClassLoader;->cleanup()V

    .line 433
    const/4 v12, 0x0

    iput-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->loader:Lorg/apache/tools/ant/AntClassLoader;

    .line 435
    :cond_18
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v12}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->size()I

    move-result v12

    if-lez v12, :cond_19

    .line 436
    iget-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->sysProperties:Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;

    invoke-virtual {v12}, Lorg/apache/tools/ant/types/CommandlineJava$SysProperties;->restoreSystem()V

    .line 438
    :cond_19
    const/4 v12, 0x0

    iput-object v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    .line 439
    const/4 v12, 0x0

    iput-boolean v12, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->stylesheetLoaded:Z

    .line 440
    iput-object v7, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    .line 430
    throw v11
.end method

.method public getFactory()Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;
    .locals 1

    .prologue
    .line 889
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->factory:Lorg/apache/tools/ant/taskdefs/XSLTProcess$Factory;

    return-object v0
.end method

.method protected getLiaison()Lorg/apache/tools/ant/taskdefs/XSLTLiaison;
    .locals 3

    .prologue
    .line 917
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    if-nez v2, :cond_0

    .line 918
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->processor:Ljava/lang/String;

    if-eqz v2, :cond_1

    .line 920
    :try_start_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->processor:Ljava/lang/String;

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->resolveProcessor(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 933
    :cond_0
    :goto_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->liaison:Lorg/apache/tools/ant/taskdefs/XSLTLiaison;

    return-object v2

    .line 921
    :catch_0
    move-exception v0

    .line 922
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 926
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :try_start_1
    const-string/jumbo v2, "trax"

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->resolveProcessor(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 927
    :catch_1
    move-exception v1

    .line 928
    .local v1, "e1":Ljava/lang/Throwable;
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 929
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->handleError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public getOutputProperties()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 907
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->outputProperties:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method

.method public getSuppressWarnings()Z
    .locals 1

    .prologue
    .line 592
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->suppressWarnings:Z

    return v0
.end method

.method public getTraceConfiguration()Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;
    .locals 1

    .prologue
    .line 664
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->traceConfiguration:Lorg/apache/tools/ant/taskdefs/XSLTProcess$TraceConfiguration;

    return-object v0
.end method

.method public getXMLCatalog()Lorg/apache/tools/ant/types/XMLCatalog;
    .locals 2

    .prologue
    .line 898
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 899
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    return-object v0
.end method

.method protected handleError(Ljava/lang/String;)V
    .locals 2
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 1243
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->failOnError:Z

    if-eqz v0, :cond_0

    .line 1244
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v0

    .line 1246
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 1247
    return-void
.end method

.method protected handleError(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "ex"    # Ljava/lang/Throwable;

    .prologue
    .line 1258
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->failOnError:Z

    if-eqz v0, :cond_0

    .line 1259
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 1261
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Caught an exception: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 1263
    return-void
.end method

.method protected handleTransformationError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "ex"    # Ljava/lang/Exception;

    .prologue
    .line 1273
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->failOnError:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->failOnTransformationError:Z

    if-eqz v0, :cond_0

    .line 1274
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 1276
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Caught an error during transformation: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->log(Ljava/lang/String;I)V

    .line 1279
    return-void
.end method

.method public init()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 1129
    invoke-super {p0}, Lorg/apache/tools/ant/taskdefs/MatchingTask;->init()V

    .line 1130
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xmlCatalog:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 1131
    return-void
.end method

.method public setBasedir(Ljava/io/File;)V
    .locals 0
    .param p1, "dir"    # Ljava/io/File;

    .prologue
    .line 461
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->baseDir:Ljava/io/File;

    .line 462
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 500
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    .line 501
    return-void
.end method

.method public setClasspathRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 522
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 523
    return-void
.end method

.method public setDestdir(Ljava/io/File;)V
    .locals 0
    .param p1, "dir"    # Ljava/io/File;

    .prologue
    .line 472
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->destDir:Ljava/io/File;

    .line 473
    return-void
.end method

.method public setExtension(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 481
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->targetExtension:Ljava/lang/String;

    .line 482
    return-void
.end method

.method public setFailOnError(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 610
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->failOnError:Z

    .line 611
    return-void
.end method

.method public setFailOnNoResources(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 619
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->failOnNoResources:Z

    .line 620
    return-void
.end method

.method public setFailOnTransformationError(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 601
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->failOnTransformationError:Z

    .line 602
    return-void
.end method

.method public setFileDirParameter(Ljava/lang/String;)V
    .locals 0
    .param p1, "fileDirParameter"    # Ljava/lang/String;

    .prologue
    .line 574
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->fileDirParameter:Ljava/lang/String;

    .line 575
    return-void
.end method

.method public setFileNameParameter(Ljava/lang/String;)V
    .locals 0
    .param p1, "fileNameParameter"    # Ljava/lang/String;

    .prologue
    .line 563
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->fileNameParameter:Ljava/lang/String;

    .line 564
    return-void
.end method

.method public setForce(Z)V
    .locals 0
    .param p1, "force"    # Z

    .prologue
    .line 451
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->force:Z

    .line 452
    return-void
.end method

.method public setIn(Ljava/io/File;)V
    .locals 0
    .param p1, "inFile"    # Ljava/io/File;

    .prologue
    .line 731
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->inFile:Ljava/io/File;

    .line 732
    return-void
.end method

.method public setOut(Ljava/io/File;)V
    .locals 0
    .param p1, "outFile"    # Ljava/io/File;

    .prologue
    .line 721
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->outFile:Ljava/io/File;

    .line 722
    return-void
.end method

.method public setProcessor(Ljava/lang/String;)V
    .locals 0
    .param p1, "processor"    # Ljava/lang/String;

    .prologue
    .line 531
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->processor:Ljava/lang/String;

    .line 532
    return-void
.end method

.method public setReloadStylesheet(Z)V
    .locals 1
    .param p1, "b"    # Z

    .prologue
    .line 242
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->reuseLoadedStylesheet:Z

    .line 243
    return-void

    .line 242
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setScanIncludedDirectories(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 230
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->performDirectoryScan:Z

    .line 231
    return-void
.end method

.method public setStyle(Ljava/lang/String;)V
    .locals 0
    .param p1, "xslFile"    # Ljava/lang/String;

    .prologue
    .line 491
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslFile:Ljava/lang/String;

    .line 492
    return-void
.end method

.method public setSuppressWarnings(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 583
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->suppressWarnings:Z

    .line 584
    return-void
.end method

.method public setUseImplicitFileset(Z)V
    .locals 0
    .param p1, "useimplicitfileset"    # Z

    .prologue
    .line 543
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->useImplicitFileset:Z

    .line 544
    return-void
.end method

.method public setXslResource(Lorg/apache/tools/ant/types/Resource;)V
    .locals 0
    .param p1, "xslResource"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 290
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/XSLTProcess;->xslResource:Lorg/apache/tools/ant/types/Resource;

    .line 291
    return-void
.end method
