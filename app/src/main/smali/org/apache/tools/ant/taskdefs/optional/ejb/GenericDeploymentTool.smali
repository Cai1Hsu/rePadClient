.class public Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;
.super Ljava/lang/Object;
.source "GenericDeploymentTool.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/optional/ejb/EJBDeploymentTool;


# static fields
.field public static final ANALYZER_CLASS_FULL:Ljava/lang/String; = "org.apache.tools.ant.util.depend.bcel.FullAnalyzer"

.field public static final ANALYZER_CLASS_SUPER:Ljava/lang/String; = "org.apache.tools.ant.util.depend.bcel.AncestorAnalyzer"

.field public static final ANALYZER_FULL:Ljava/lang/String; = "full"

.field public static final ANALYZER_NONE:Ljava/lang/String; = "none"

.field public static final ANALYZER_SUPER:Ljava/lang/String; = "super"

.field public static final DEFAULT_ANALYZER:Ljava/lang/String; = "super"

.field public static final DEFAULT_BUFFER_SIZE:I = 0x400

.field protected static final EJB_DD:Ljava/lang/String; = "ejb-jar.xml"

.field public static final JAR_COMPRESS_LEVEL:I = 0x9

.field protected static final MANIFEST:Ljava/lang/String; = "META-INF/MANIFEST.MF"

.field protected static final META_DIR:Ljava/lang/String; = "META-INF/"


# instance fields
.field private addedfiles:Ljava/util/Set;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private classpathLoader:Ljava/lang/ClassLoader;

.field private config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

.field private dependencyAnalyzer:Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;

.field private destDir:Ljava/io/File;

.field private genericJarSuffix:Ljava/lang/String;

.field private handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

.field private task:Lorg/apache/tools/ant/Task;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    const-string/jumbo v0, "-generic.jar"

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->genericJarSuffix:Ljava/lang/String;

    .line 116
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->classpathLoader:Ljava/lang/ClassLoader;

    .line 135
    return-void
.end method

.method private createAnalyzer()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 261
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v4, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->analyzer:Ljava/lang/String;

    .line 262
    .local v0, "analyzer":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 263
    const-string/jumbo v0, "super"

    .line 266
    :cond_0
    const-string/jumbo v4, "none"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 297
    :goto_0
    return-void

    .line 270
    :cond_1
    const/4 v2, 0x0

    .line 271
    .local v2, "analyzerClassName":Ljava/lang/String;
    const-string/jumbo v4, "super"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 272
    const-string/jumbo v2, "org.apache.tools.ant.util.depend.bcel.AncestorAnalyzer"

    .line 280
    :goto_1
    :try_start_0
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 281
    .local v1, "analyzerClass":Ljava/lang/Class;
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;

    iput-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->dependencyAnalyzer:Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;

    .line 283
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->dependencyAnalyzer:Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;

    new-instance v5, Lorg/apache/tools/ant/types/Path;

    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->task:Lorg/apache/tools/ant/Task;

    invoke-virtual {v6}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v7, v7, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->srcDir:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->addClassPath(Lorg/apache/tools/ant/types/Path;)V

    .line 285
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->dependencyAnalyzer:Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;

    iget-object v5, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v5, v5, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-interface {v4, v5}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->addClassPath(Lorg/apache/tools/ant/types/Path;)V
    :try_end_0
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 286
    .end local v1    # "analyzerClass":Ljava/lang/Class;
    :catch_0
    move-exception v3

    .line 287
    .local v3, "e":Ljava/lang/NoClassDefFoundError;
    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->dependencyAnalyzer:Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;

    .line 288
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->task:Lorg/apache/tools/ant/Task;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unable to load dependency analyzer: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " - dependent class not found: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/NoClassDefFoundError;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v8}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    goto :goto_0

    .line 273
    .end local v3    # "e":Ljava/lang/NoClassDefFoundError;
    :cond_2
    const-string/jumbo v4, "full"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 274
    const-string/jumbo v2, "org.apache.tools.ant.util.depend.bcel.FullAnalyzer"

    goto :goto_1

    .line 276
    :cond_3
    move-object v2, v0

    goto :goto_1

    .line 291
    :catch_1
    move-exception v3

    .line 292
    .local v3, "e":Ljava/lang/Exception;
    iput-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->dependencyAnalyzer:Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;

    .line 293
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->task:Lorg/apache/tools/ant/Task;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Unable to load dependency analyzer: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " - exception: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v8}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    goto/16 :goto_0
.end method


# virtual methods
.method protected addFileToJar(Ljava/util/jar/JarOutputStream;Ljava/io/File;Ljava/lang/String;)V
    .locals 8
    .param p1, "jStream"    # Ljava/util/jar/JarOutputStream;
    .param p2, "inputFile"    # Ljava/io/File;
    .param p3, "logicalFilename"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 329
    const/4 v2, 0x0

    .line 331
    .local v2, "iStream":Ljava/io/FileInputStream;
    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->addedfiles:Ljava/util/Set;

    invoke-interface {v6, p3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 332
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 334
    .end local v2    # "iStream":Ljava/io/FileInputStream;
    .local v3, "iStream":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v5, Ljava/util/zip/ZipEntry;

    const/16 v6, 0x5c

    const/16 v7, 0x2f

    invoke-virtual {p3, v6, v7}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 335
    .local v5, "zipEntry":Ljava/util/zip/ZipEntry;
    invoke-virtual {p1, v5}, Ljava/util/jar/JarOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 339
    const/16 v6, 0x800

    new-array v0, v6, [B

    .line 340
    .local v0, "byteBuffer":[B
    const/4 v1, 0x0

    .line 342
    .local v1, "count":I
    :cond_0
    const/4 v6, 0x0

    invoke-virtual {p1, v0, v6, v1}, Ljava/util/jar/JarOutputStream;->write([BII)V

    .line 343
    const/4 v6, 0x0

    array-length v7, v0

    invoke-virtual {v3, v0, v6, v7}, Ljava/io/FileInputStream;->read([BII)I

    move-result v1

    .line 344
    const/4 v6, -0x1

    if-ne v1, v6, :cond_0

    .line 347
    iget-object v6, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->addedfiles:Ljava/util/Set;

    invoke-interface {v6, p3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object v2, v3

    .line 356
    .end local v0    # "byteBuffer":[B
    .end local v1    # "count":I
    .end local v3    # "iStream":Ljava/io/FileInputStream;
    .end local v5    # "zipEntry":Ljava/util/zip/ZipEntry;
    .restart local v2    # "iStream":Ljava/io/FileInputStream;
    :cond_1
    if-eqz v2, :cond_2

    .line 358
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 364
    :cond_2
    :goto_0
    return-void

    .line 349
    :catch_0
    move-exception v4

    .line 350
    .local v4, "ioe":Ljava/io/IOException;
    :goto_1
    :try_start_3
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "WARNING: IOException while adding entry "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " to jarfile from "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "-"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-virtual {p0, v6, v7}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->log(Ljava/lang/String;I)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 356
    if-eqz v2, :cond_2

    .line 358
    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 359
    .end local v4    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v6

    goto :goto_0

    .line 356
    :catchall_0
    move-exception v6

    :goto_2
    if-eqz v2, :cond_3

    .line 358
    :try_start_5
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 356
    :cond_3
    :goto_3
    throw v6

    .line 359
    :catch_2
    move-exception v7

    goto :goto_3

    .line 356
    .end local v2    # "iStream":Ljava/io/FileInputStream;
    .restart local v3    # "iStream":Ljava/io/FileInputStream;
    :catchall_1
    move-exception v6

    move-object v2, v3

    .end local v3    # "iStream":Ljava/io/FileInputStream;
    .restart local v2    # "iStream":Ljava/io/FileInputStream;
    goto :goto_2

    .line 349
    .end local v2    # "iStream":Ljava/io/FileInputStream;
    .restart local v3    # "iStream":Ljava/io/FileInputStream;
    :catch_3
    move-exception v4

    move-object v2, v3

    .end local v3    # "iStream":Ljava/io/FileInputStream;
    .restart local v2    # "iStream":Ljava/io/FileInputStream;
    goto :goto_1
.end method

.method protected addSupportClasses(Ljava/util/Hashtable;)V
    .locals 10
    .param p1, "ejbFiles"    # Ljava/util/Hashtable;

    .prologue
    .line 559
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->task:Lorg/apache/tools/ant/Task;

    invoke-virtual {v7}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    .line 560
    .local v2, "project":Lorg/apache/tools/ant/Project;
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v7, v7, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->supportFileSets:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 561
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/apache/tools/ant/types/FileSet;

    .line 562
    .local v4, "supportFileSet":Lorg/apache/tools/ant/types/FileSet;
    invoke-virtual {v4, v2}, Lorg/apache/tools/ant/types/FileSet;->getDir(Lorg/apache/tools/ant/Project;)Ljava/io/File;

    move-result-object v3

    .line 563
    .local v3, "supportBaseDir":Ljava/io/File;
    invoke-virtual {v4, v2}, Lorg/apache/tools/ant/types/FileSet;->getDirectoryScanner(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/DirectoryScanner;

    move-result-object v6

    .line 564
    .local v6, "supportScanner":Lorg/apache/tools/ant/DirectoryScanner;
    invoke-virtual {v6}, Lorg/apache/tools/ant/DirectoryScanner;->scan()V

    .line 565
    invoke-virtual {v6}, Lorg/apache/tools/ant/DirectoryScanner;->getIncludedFiles()[Ljava/lang/String;

    move-result-object v5

    .line 566
    .local v5, "supportFiles":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    array-length v7, v5

    if-ge v1, v7, :cond_0

    .line 567
    aget-object v7, v5, v1

    new-instance v8, Ljava/io/File;

    aget-object v9, v5, v1

    invoke-direct {v8, v3, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p1, v7, v8}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 566
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 570
    .end local v1    # "j":I
    .end local v3    # "supportBaseDir":Ljava/io/File;
    .end local v4    # "supportFileSet":Lorg/apache/tools/ant/types/FileSet;
    .end local v5    # "supportFiles":[Ljava/lang/String;
    .end local v6    # "supportScanner":Lorg/apache/tools/ant/DirectoryScanner;
    :cond_1
    return-void
.end method

.method protected addVendorFiles(Ljava/util/Hashtable;Ljava/lang/String;)V
    .locals 0
    .param p1, "ejbFiles"    # Ljava/util/Hashtable;
    .param p2, "ddPrefix"    # Ljava/lang/String;

    .prologue
    .line 668
    return-void
.end method

.method protected checkAndAddDependants(Ljava/util/Hashtable;)V
    .locals 12
    .param p1, "checkEntries"    # Ljava/util/Hashtable;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x2f

    const/16 v10, 0x2e

    .line 880
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->dependencyAnalyzer:Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;

    if-nez v7, :cond_1

    .line 912
    :cond_0
    return-void

    .line 884
    :cond_1
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->dependencyAnalyzer:Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;

    invoke-interface {v7}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->reset()V

    .line 886
    invoke-virtual {p1}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 887
    .local v5, "i":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 888
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 889
    .local v4, "entryName":Ljava/lang/String;
    const-string/jumbo v7, ".class"

    invoke-virtual {v4, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 890
    const/4 v7, 0x0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v8

    const-string/jumbo v9, ".class"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-virtual {v4, v7, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 892
    .local v1, "className":Ljava/lang/String;
    sget-char v7, Ljava/io/File;->separatorChar:C

    invoke-virtual {v1, v7, v11}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 893
    invoke-virtual {v1, v11, v10}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 895
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->dependencyAnalyzer:Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;

    invoke-interface {v7, v1}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->addRootClass(Ljava/lang/String;)V

    goto :goto_0

    .line 899
    .end local v1    # "className":Ljava/lang/String;
    .end local v4    # "entryName":Ljava/lang/String;
    :cond_3
    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->dependencyAnalyzer:Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;

    invoke-interface {v7}, Lorg/apache/tools/ant/util/depend/DependencyAnalyzer;->getClassDependencies()Ljava/util/Enumeration;

    move-result-object v3

    .line 901
    .local v3, "e":Ljava/util/Enumeration;
    :cond_4
    :goto_1
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 902
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 903
    .local v2, "classname":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    sget-char v8, Ljava/io/File;->separatorChar:C

    invoke-virtual {v2, v10, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, ".class"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    .line 905
    .local v6, "location":Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    iget-object v7, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v7, v7, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->srcDir:Ljava/io/File;

    invoke-direct {v0, v7, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 906
    .local v0, "classFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 907
    invoke-virtual {p1, v6, v0}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 908
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "dependent class: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, " - "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x3

    invoke-virtual {p0, v7, v8}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->log(Ljava/lang/String;I)V

    goto :goto_1
.end method

.method protected checkConfiguration(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V
    .locals 0
    .param p1, "descriptorFileName"    # Ljava/lang/String;
    .param p2, "saxParser"    # Ljavax/xml/parsers/SAXParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 503
    return-void
.end method

.method public configure(Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;)V
    .locals 1
    .param p1, "config"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    .prologue
    .line 306
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    .line 308
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->createAnalyzer()V

    .line 309
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->classpathLoader:Ljava/lang/ClassLoader;

    .line 310
    return-void
.end method

.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 207
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 208
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->task:Lorg/apache/tools/ant/Task;

    invoke-virtual {v1}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 210
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method protected getClassLoaderForBuild()Ljava/lang/ClassLoader;
    .locals 2

    .prologue
    .line 922
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->classpathLoader:Ljava/lang/ClassLoader;

    if-eqz v1, :cond_0

    .line 923
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->classpathLoader:Ljava/lang/ClassLoader;

    .line 937
    :goto_0
    return-object v1

    .line 926
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getCombinedClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    .line 929
    .local v0, "combinedClasspath":Lorg/apache/tools/ant/types/Path;
    if-nez v0, :cond_1

    .line 930
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->classpathLoader:Ljava/lang/ClassLoader;

    .line 937
    :goto_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->classpathLoader:Ljava/lang/ClassLoader;

    goto :goto_0

    .line 933
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/tools/ant/Task;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->classpathLoader:Ljava/lang/ClassLoader;

    goto :goto_1
.end method

.method protected getCombinedClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 229
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 230
    .local v0, "combinedPath":Lorg/apache/tools/ant/types/Path;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v1, v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v1, :cond_0

    .line 231
    if-nez v0, :cond_1

    .line 232
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 238
    :cond_0
    :goto_0
    return-object v0

    .line 234
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v1, v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method protected getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    return-object v0
.end method

.method protected getDescriptorHandler(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    .locals 5
    .param p1, "srcDir"    # Ljava/io/File;

    .prologue
    .line 372
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v3

    invoke-direct {v1, v3, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;-><init>(Lorg/apache/tools/ant/Task;Ljava/io/File;)V

    .line 374
    .local v1, "h":Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->registerKnownDTDs(Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;)V

    .line 377
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v3

    iget-object v3, v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->dtdLocations:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 378
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;

    .line 379
    .local v0, "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;->getPublicId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;->getLocation()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 381
    .end local v0    # "dtdLocation":Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$DTDLocation;
    :cond_0
    return-object v1
.end method

.method protected getDestDir()Ljava/io/File;
    .locals 1

    .prologue
    .line 152
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->destDir:Ljava/io/File;

    return-object v0
.end method

.method protected getJarBaseName(Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .param p1, "descriptorFileName"    # Ljava/lang/String;

    .prologue
    const/16 v13, 0x2f

    const/4 v12, 0x0

    const/4 v11, -0x1

    .line 585
    const-string/jumbo v0, ""

    .line 588
    .local v0, "baseName":Ljava/lang/String;
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v9, v9, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, "basejarname"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 589
    const/16 v9, 0x5c

    invoke-virtual {p1, v9, v13}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v1

    .line 590
    .local v1, "canonicalDescriptor":Ljava/lang/String;
    invoke-virtual {v1, v13}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v6

    .line 591
    .local v6, "index":I
    if-eq v6, v11, :cond_0

    .line 592
    add-int/lit8 v9, v6, 0x1

    invoke-virtual {p1, v12, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 594
    :cond_0
    new-instance v9, Ljava/lang/StringBuffer;

    invoke-direct {v9}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v9, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    iget-object v10, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v10, v10, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseJarName:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 629
    .end local v1    # "canonicalDescriptor":Ljava/lang/String;
    .end local v6    # "index":I
    :cond_1
    :goto_0
    return-object v0

    .line 595
    :cond_2
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v9, v9, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, "descriptor"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 596
    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {p1, v9}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    .line 597
    .local v7, "lastSeparatorIndex":I
    const/4 v5, -0x1

    .line 598
    .local v5, "endBaseName":I
    if-eq v7, v11, :cond_3

    .line 599
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v9, v9, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseNameTerminator:Ljava/lang/String;

    invoke-virtual {p1, v9, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v5

    .line 605
    :goto_1
    if-eq v5, v11, :cond_4

    .line 606
    invoke-virtual {p1, v12, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 602
    :cond_3
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v9, v9, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseNameTerminator:Ljava/lang/String;

    invoke-virtual {p1, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    goto :goto_1

    .line 608
    :cond_4
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    new-instance v10, Ljava/lang/StringBuffer;

    invoke-direct {v10}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v11, "Unable to determine jar name from descriptor \""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    const-string/jumbo v11, "\""

    invoke-virtual {v10, v11}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 611
    .end local v5    # "endBaseName":I
    .end local v7    # "lastSeparatorIndex":I
    :cond_5
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v9, v9, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, "directory"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 612
    new-instance v2, Ljava/io/File;

    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v9, v9, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    invoke-direct {v2, v9, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 613
    .local v2, "descriptorFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    .line 614
    .local v8, "path":Ljava/lang/String;
    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v7

    .line 616
    .restart local v7    # "lastSeparatorIndex":I
    if-ne v7, v11, :cond_6

    .line 617
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "Unable to determine directory name holding descriptor"

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 619
    :cond_6
    invoke-virtual {v8, v12, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 620
    .local v3, "dirName":Ljava/lang/String;
    sget-object v9, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v9}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v4

    .line 621
    .local v4, "dirSeparatorIndex":I
    if-eq v4, v11, :cond_7

    .line 622
    add-int/lit8 v9, v4, 0x1

    invoke-virtual {v3, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 625
    :cond_7
    move-object v0, v3

    goto/16 :goto_0

    .line 626
    .end local v2    # "descriptorFile":Ljava/io/File;
    .end local v3    # "dirName":Ljava/lang/String;
    .end local v4    # "dirSeparatorIndex":I
    .end local v7    # "lastSeparatorIndex":I
    .end local v8    # "path":Ljava/lang/String;
    :cond_8
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v9, v9, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, "ejb-name"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 627
    iget-object v9, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    invoke-virtual {v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->getEjbName()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0
.end method

.method protected getLocation()Lorg/apache/tools/ant/Location;
    .locals 1

    .prologue
    .line 257
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/Task;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v0

    return-object v0
.end method

.method protected getManifestFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 740
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getConfig()Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-result-object v1

    iget-object v1, v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "manifest.mf"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 742
    .local v0, "manifestFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 749
    .end local v0    # "manifestFile":Ljava/io/File;
    :goto_0
    return-object v0

    .line 746
    .restart local v0    # "manifestFile":Ljava/io/File;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v1, v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->manifest:Ljava/io/File;

    if-eqz v1, :cond_1

    .line 747
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->manifest:Ljava/io/File;

    goto :goto_0

    .line 749
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected getPublicId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 725
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->getPublicId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTask()Lorg/apache/tools/ant/Task;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->task:Lorg/apache/tools/ant/Task;

    return-object v0
.end method

.method public getVendorDDPrefix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "baseName"    # Ljava/lang/String;
    .param p2, "descriptorFileName"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x2f

    .line 642
    const/4 v1, 0x0

    .line 644
    .local v1, "ddPrefix":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v3, v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "descriptor"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 645
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v4, v4, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseNameTerminator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 657
    :cond_0
    :goto_0
    return-object v1

    .line 646
    :cond_1
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v3, v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "basejarname"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v3, v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "ejb-name"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v3, v3, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->namingScheme:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$NamingScheme;->getValue()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "directory"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 649
    :cond_2
    const/16 v3, 0x5c

    invoke-virtual {p2, v3, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v0

    .line 650
    .local v0, "canonicalDescriptor":Ljava/lang/String;
    invoke-virtual {v0, v5}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v2

    .line 651
    .local v2, "index":I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_3

    .line 652
    const-string/jumbo v1, ""

    goto :goto_0

    .line 654
    :cond_3
    const/4 v3, 0x0

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method getVendorOutputJarFile(Ljava/lang/String;)Ljava/io/File;
    .locals 4
    .param p1, "baseName"    # Ljava/lang/String;

    .prologue
    .line 677
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->destDir:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->genericJarSuffix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method protected log(Ljava/lang/String;I)V
    .locals 1
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "level"    # I

    .prologue
    .line 248
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getTask()Lorg/apache/tools/ant/Task;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/Task;->log(Ljava/lang/String;I)V

    .line 249
    return-void
.end method

.method protected needToRebuild(Ljava/util/Hashtable;Ljava/io/File;)Z
    .locals 8
    .param p1, "ejbFiles"    # Ljava/util/Hashtable;
    .param p2, "jarFile"    # Ljava/io/File;

    .prologue
    const/4 v4, 0x1

    .line 696
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 697
    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    .line 699
    .local v2, "lastBuild":J
    invoke-virtual {p1}, Ljava/util/Hashtable;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 703
    .local v1, "fileIter":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 704
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 705
    .local v0, "currentFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    cmp-long v5, v2, v6

    if-gez v5, :cond_0

    .line 706
    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Build needed because "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, " is out of date"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x3

    invoke-virtual {p0, v5, v6}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->log(Ljava/lang/String;I)V

    .line 714
    .end local v0    # "currentFile":Ljava/io/File;
    .end local v1    # "fileIter":Ljava/util/Iterator;
    .end local v2    # "lastBuild":J
    :cond_1
    :goto_0
    return v4

    .line 711
    .restart local v1    # "fileIter":Ljava/util/Iterator;
    .restart local v2    # "lastBuild":J
    :cond_2
    const/4 v4, 0x0

    goto :goto_0
.end method

.method protected parseEjbFiles(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)Ljava/util/Hashtable;
    .locals 5
    .param p1, "descriptorFileName"    # Ljava/lang/String;
    .param p2, "saxParser"    # Ljavax/xml/parsers/SAXParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 522
    const/4 v0, 0x0

    .line 523
    .local v0, "descriptorStream":Ljava/io/FileInputStream;
    const/4 v2, 0x0

    .line 531
    .local v2, "ejbFiles":Ljava/util/Hashtable;
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    new-instance v3, Ljava/io/File;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v4, v4, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    invoke-direct {v3, v4, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v1, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 533
    .end local v0    # "descriptorStream":Ljava/io/FileInputStream;
    .local v1, "descriptorStream":Ljava/io/FileInputStream;
    :try_start_1
    new-instance v3, Lorg/xml/sax/InputSource;

    invoke-direct {v3, v1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    invoke-virtual {p2, v3, v4}, Ljavax/xml/parsers/SAXParser;->parse(Lorg/xml/sax/InputSource;Lorg/xml/sax/HandlerBase;)V

    .line 535
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    invoke-virtual {v3}, Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;->getFiles()Ljava/util/Hashtable;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v2

    .line 538
    if-eqz v1, :cond_0

    .line 540
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 547
    :cond_0
    :goto_0
    return-object v2

    .line 538
    .end local v1    # "descriptorStream":Ljava/io/FileInputStream;
    .restart local v0    # "descriptorStream":Ljava/io/FileInputStream;
    :catchall_0
    move-exception v3

    :goto_1
    if-eqz v0, :cond_1

    .line 540
    :try_start_3
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 538
    :cond_1
    :goto_2
    throw v3

    .line 541
    :catch_0
    move-exception v4

    goto :goto_2

    .end local v0    # "descriptorStream":Ljava/io/FileInputStream;
    .restart local v1    # "descriptorStream":Ljava/io/FileInputStream;
    :catch_1
    move-exception v3

    goto :goto_0

    .line 538
    :catchall_1
    move-exception v3

    move-object v0, v1

    .end local v1    # "descriptorStream":Ljava/io/FileInputStream;
    .restart local v0    # "descriptorStream":Ljava/io/FileInputStream;
    goto :goto_1
.end method

.method public processDescriptor(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V
    .locals 14
    .param p1, "descriptorFileName"    # Ljava/lang/String;
    .param p2, "saxParser"    # Ljavax/xml/parsers/SAXParser;

    .prologue
    .line 398
    invoke-virtual/range {p0 .. p2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->checkConfiguration(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)V

    .line 401
    :try_start_0
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v11, v11, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->srcDir:Ljava/io/File;

    invoke-virtual {p0, v11}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getDescriptorHandler(Ljava/io/File;)Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    move-result-object v11

    iput-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->handler:Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    .line 404
    invoke-virtual/range {p0 .. p2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->parseEjbFiles(Ljava/lang/String;Ljavax/xml/parsers/SAXParser;)Ljava/util/Hashtable;

    move-result-object v2

    .line 407
    .local v2, "ejbFiles":Ljava/util/Hashtable;
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->addSupportClasses(Ljava/util/Hashtable;)V

    .line 410
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getJarBaseName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 412
    .local v0, "baseName":Ljava/lang/String;
    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getVendorDDPrefix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 414
    .local v1, "ddPrefix":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getManifestFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    .line 415
    .local v6, "manifestFile":Ljava/io/File;
    if-eqz v6, :cond_0

    .line 416
    const-string/jumbo v11, "META-INF/MANIFEST.MF"

    invoke-virtual {v2, v11, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 422
    :cond_0
    const-string/jumbo v11, "META-INF/ejb-jar.xml"

    new-instance v12, Ljava/io/File;

    iget-object v13, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v13, v13, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->descriptorDir:Ljava/io/File;

    invoke-direct {v12, v13, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2, v11, v12}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 426
    invoke-virtual {p0, v2, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->addVendorFiles(Ljava/util/Hashtable;Ljava/lang/String;)V

    .line 429
    invoke-virtual {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->checkAndAddDependants(Ljava/util/Hashtable;)V

    .line 433
    iget-object v11, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-boolean v11, v11, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->flatDestDir:Z

    if-eqz v11, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v11

    if-eqz v11, :cond_2

    .line 434
    sget-object v11, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v11}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v10

    .line 435
    .local v10, "startName":I
    const/4 v11, -0x1

    if-ne v10, v11, :cond_1

    .line 436
    const/4 v10, 0x0

    .line 439
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    .line 440
    .local v3, "endName":I
    invoke-virtual {v0, v10, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 443
    .end local v3    # "endName":I
    .end local v10    # "startName":I
    :cond_2
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getVendorOutputJarFile(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 447
    .local v5, "jarFile":Ljava/io/File;
    invoke-virtual {p0, v2, v5}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->needToRebuild(Ljava/util/Hashtable;Ljava/io/File;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 449
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "building "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " with "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v2}, Ljava/util/Hashtable;->size()I

    move-result v12

    invoke-static {v12}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " files"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x2

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->log(Ljava/lang/String;I)V

    .line 457
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getPublicId()Ljava/lang/String;

    move-result-object v8

    .line 458
    .local v8, "publicId":Ljava/lang/String;
    invoke-virtual {p0, v0, v5, v2, v8}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->writeJar(Ljava/lang/String;Ljava/io/File;Ljava/util/Hashtable;Ljava/lang/String;)V

    .line 481
    .end local v8    # "publicId":Ljava/lang/String;
    :goto_0
    return-void

    .line 462
    :cond_3
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v5}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " is up to date."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x3

    invoke-virtual {p0, v11, v12}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->log(Ljava/lang/String;I)V
    :try_end_0
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 466
    .end local v0    # "baseName":Ljava/lang/String;
    .end local v1    # "ddPrefix":Ljava/lang/String;
    .end local v2    # "ejbFiles":Ljava/util/Hashtable;
    .end local v5    # "jarFile":Ljava/io/File;
    .end local v6    # "manifestFile":Ljava/io/File;
    :catch_0
    move-exception v9

    .line 467
    .local v9, "se":Lorg/xml/sax/SAXException;
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "SAXException while parsing \'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "\'. This probably indicates badly-formed XML."

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "  Details: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v9}, Lorg/xml/sax/SAXException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 472
    .local v7, "msg":Ljava/lang/String;
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v11, v7, v9}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11

    .line 473
    .end local v7    # "msg":Ljava/lang/String;
    .end local v9    # "se":Lorg/xml/sax/SAXException;
    :catch_1
    move-exception v4

    .line 474
    .local v4, "ioe":Ljava/io/IOException;
    new-instance v11, Ljava/lang/StringBuffer;

    invoke-direct {v11}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v12, "IOException while parsing\'"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, "\'.  This probably indicates that the descriptor"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    const-string/jumbo v12, " doesn\'t exist. Details: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v4}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    .line 479
    .restart local v7    # "msg":Ljava/lang/String;
    new-instance v11, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v11, v7, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v11
.end method

.method protected registerKnownDTDs(Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;)V
    .locals 0
    .param p1, "handler"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/DescriptorHandler;

    .prologue
    .line 393
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 0
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 219
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 220
    return-void
.end method

.method public setDestdir(Ljava/io/File;)V
    .locals 0
    .param p1, "inDir"    # Ljava/io/File;

    .prologue
    .line 143
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->destDir:Ljava/io/File;

    .line 144
    return-void
.end method

.method public setGenericJarSuffix(Ljava/lang/String;)V
    .locals 0
    .param p1, "inString"    # Ljava/lang/String;

    .prologue
    .line 198
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->genericJarSuffix:Ljava/lang/String;

    .line 199
    return-void
.end method

.method public setTask(Lorg/apache/tools/ant/Task;)V
    .locals 0
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 162
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->task:Lorg/apache/tools/ant/Task;

    .line 163
    return-void
.end method

.method protected usingBaseJarName()Z
    .locals 1

    .prologue
    .line 190
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->baseJarName:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public validateConfigured()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 947
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->destDir:Ljava/io/File;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->destDir:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_1

    .line 948
    :cond_0
    const-string/jumbo v0, "A valid destination directory must be specified using the \"destdir\" attribute."

    .line 950
    .local v0, "msg":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v1

    .line 952
    .end local v0    # "msg":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method protected writeJar(Ljava/lang/String;Ljava/io/File;Ljava/util/Hashtable;Ljava/lang/String;)V
    .locals 25
    .param p1, "baseName"    # Ljava/lang/String;
    .param p2, "jarfile"    # Ljava/io/File;
    .param p3, "files"    # Ljava/util/Hashtable;
    .param p4, "publicId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 765
    const/16 v16, 0x0

    .line 768
    .local v16, "jarStream":Ljava/util/jar/JarOutputStream;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->addedfiles:Ljava/util/Set;

    move-object/from16 v22, v0

    if-nez v22, :cond_4

    .line 769
    new-instance v22, Ljava/util/HashSet;

    invoke-direct/range {v22 .. v22}, Ljava/util/HashSet;-><init>()V

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->addedfiles:Ljava/util/Set;

    .line 779
    :goto_0
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->exists()Z

    move-result v22

    if-eqz v22, :cond_0

    .line 780
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->delete()Z

    .line 782
    :cond_0
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/io/File;->mkdirs()Z

    .line 783
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 785
    const/4 v12, 0x0

    .line 786
    .local v12, "in":Ljava/io/InputStream;
    const/16 v18, 0x0

    .line 788
    .local v18, "manifest":Ljava/util/jar/Manifest;
    :try_start_1
    const-string/jumbo v22, "META-INF/MANIFEST.MF"

    move-object/from16 v0, p3

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/io/File;

    .line 789
    .local v19, "manifestFile":Ljava/io/File;
    if-eqz v19, :cond_6

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v22

    if-eqz v22, :cond_6

    .line 790
    new-instance v13, Ljava/io/FileInputStream;

    move-object/from16 v0, v19

    invoke-direct {v13, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .end local v12    # "in":Ljava/io/InputStream;
    .local v13, "in":Ljava/io/InputStream;
    move-object v12, v13

    .line 800
    .end local v13    # "in":Ljava/io/InputStream;
    .restart local v12    # "in":Ljava/io/InputStream;
    :cond_1
    new-instance v18, Ljava/util/jar/Manifest;

    .end local v18    # "manifest":Ljava/util/jar/Manifest;
    move-object/from16 v0, v18

    invoke-direct {v0, v12}, Ljava/util/jar/Manifest;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 804
    .restart local v18    # "manifest":Ljava/util/jar/Manifest;
    if-eqz v12, :cond_2

    .line 805
    :try_start_2
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V

    .line 811
    :cond_2
    new-instance v17, Ljava/util/jar/JarOutputStream;

    new-instance v22, Ljava/io/FileOutputStream;

    move-object/from16 v0, v22

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Ljava/util/jar/JarOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/jar/Manifest;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 812
    .end local v16    # "jarStream":Ljava/util/jar/JarOutputStream;
    .local v17, "jarStream":Ljava/util/jar/JarOutputStream;
    const/16 v22, 0x8

    :try_start_3
    move-object/from16 v0, v17

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/util/jar/JarOutputStream;->setMethod(I)V

    .line 815
    invoke-virtual/range {p3 .. p3}, Ljava/util/Hashtable;->keySet()Ljava/util/Set;

    move-result-object v22

    invoke-interface/range {v22 .. v22}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "entryIterator":Ljava/util/Iterator;
    :cond_3
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_9

    .line 816
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 817
    .local v9, "entryName":Ljava/lang/String;
    const-string/jumbo v22, "META-INF/MANIFEST.MF"

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_3

    .line 821
    move-object/from16 v0, p3

    invoke-virtual {v0, v9}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/io/File;

    .line 823
    .local v6, "entryFile":Ljava/io/File;
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v23, "adding file \'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    const-string/jumbo v23, "\'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->log(Ljava/lang/String;I)V

    .line 826
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v6, v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->addFileToJar(Ljava/util/jar/JarOutputStream;Ljava/io/File;Ljava/lang/String;)V

    .line 829
    new-instance v10, Lorg/apache/tools/ant/taskdefs/optional/ejb/InnerClassFilenameFilter;

    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-direct {v10, v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/InnerClassFilenameFilter;-><init>(Ljava/lang/String;)V

    .line 830
    .local v10, "flt":Lorg/apache/tools/ant/taskdefs/optional/ejb/InnerClassFilenameFilter;
    invoke-virtual {v6}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v5

    .line 831
    .local v5, "entryDir":Ljava/io/File;
    invoke-virtual {v5, v10}, Ljava/io/File;->list(Ljava/io/FilenameFilter;)[Ljava/lang/String;

    move-result-object v14

    .line 832
    .local v14, "innerfiles":[Ljava/lang/String;
    if-eqz v14, :cond_3

    .line 833
    const/4 v11, 0x0

    .local v11, "i":I
    array-length v0, v14

    move/from16 v21, v0

    .local v21, "n":I
    :goto_1
    move/from16 v0, v21

    if-ge v11, v0, :cond_3

    .line 836
    invoke-virtual {v6}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v9, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v22

    add-int/lit8 v7, v22, -0x1

    .line 837
    .local v7, "entryIndex":I
    if-gez v7, :cond_8

    .line 838
    aget-object v9, v14, v11

    .line 844
    :goto_2
    new-instance v6, Ljava/io/File;

    .end local v6    # "entryFile":Ljava/io/File;
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->config:Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/EjbJar$Config;->srcDir:Ljava/io/File;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    invoke-direct {v6, v0, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 846
    .restart local v6    # "entryFile":Ljava/io/File;
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v23, "adding innerclass file \'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    const-string/jumbo v23, "\'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v22

    const/16 v23, 0x3

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->log(Ljava/lang/String;I)V

    .line 849
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1, v6, v9}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->addFileToJar(Ljava/util/jar/JarOutputStream;Ljava/io/File;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 833
    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    .line 771
    .end local v5    # "entryDir":Ljava/io/File;
    .end local v6    # "entryFile":Ljava/io/File;
    .end local v7    # "entryIndex":I
    .end local v8    # "entryIterator":Ljava/util/Iterator;
    .end local v9    # "entryName":Ljava/lang/String;
    .end local v10    # "flt":Lorg/apache/tools/ant/taskdefs/optional/ejb/InnerClassFilenameFilter;
    .end local v11    # "i":I
    .end local v12    # "in":Ljava/io/InputStream;
    .end local v14    # "innerfiles":[Ljava/lang/String;
    .end local v17    # "jarStream":Ljava/util/jar/JarOutputStream;
    .end local v18    # "manifest":Ljava/util/jar/Manifest;
    .end local v19    # "manifestFile":Ljava/io/File;
    .end local v21    # "n":I
    .restart local v16    # "jarStream":Ljava/util/jar/JarOutputStream;
    :cond_4
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->addedfiles:Ljava/util/Set;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Ljava/util/Set;->clear()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto/16 :goto_0

    .line 854
    :catch_0
    move-exception v15

    .line 855
    .local v15, "ioe":Ljava/io/IOException;
    :goto_3
    :try_start_5
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v23, "IOException while processing ejb-jar file \'"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    const-string/jumbo v23, "\'. Details: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual {v15}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v20

    .line 859
    .local v20, "msg":Ljava/lang/String;
    new-instance v22, Lorg/apache/tools/ant/BuildException;

    move-object/from16 v0, v22

    move-object/from16 v1, v20

    invoke-direct {v0, v1, v15}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v22
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 861
    .end local v15    # "ioe":Ljava/io/IOException;
    .end local v20    # "msg":Ljava/lang/String;
    :catchall_0
    move-exception v22

    :goto_4
    if-eqz v16, :cond_5

    .line 863
    :try_start_6
    invoke-virtual/range {v16 .. v16}, Ljava/util/jar/JarOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 861
    :cond_5
    :goto_5
    throw v22

    .line 792
    .restart local v12    # "in":Ljava/io/InputStream;
    .restart local v18    # "manifest":Ljava/util/jar/Manifest;
    .restart local v19    # "manifestFile":Ljava/io/File;
    :cond_6
    :try_start_7
    const-string/jumbo v3, "/org/apache/tools/ant/defaultManifest.mf"

    .line 793
    .local v3, "defaultManifest":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v3}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v12

    .line 794
    if-nez v12, :cond_1

    .line 795
    new-instance v22, Lorg/apache/tools/ant/BuildException;

    new-instance v23, Ljava/lang/StringBuffer;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v24, "Could not find default manifest: "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v22
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 801
    .end local v3    # "defaultManifest":Ljava/lang/String;
    .end local v18    # "manifest":Ljava/util/jar/Manifest;
    .end local v19    # "manifestFile":Ljava/io/File;
    :catch_1
    move-exception v4

    .line 802
    .local v4, "e":Ljava/io/IOException;
    :try_start_8
    new-instance v22, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v23, "Unable to read manifest"

    invoke-virtual/range {p0 .. p0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/GenericDeploymentTool;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v24

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    invoke-direct {v0, v1, v4, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/tools/ant/Location;)V

    throw v22
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 804
    .end local v4    # "e":Ljava/io/IOException;
    :catchall_1
    move-exception v22

    if-eqz v12, :cond_7

    .line 805
    :try_start_9
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V

    :cond_7
    throw v22
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 840
    .end local v16    # "jarStream":Ljava/util/jar/JarOutputStream;
    .restart local v5    # "entryDir":Ljava/io/File;
    .restart local v6    # "entryFile":Ljava/io/File;
    .restart local v7    # "entryIndex":I
    .restart local v8    # "entryIterator":Ljava/util/Iterator;
    .restart local v9    # "entryName":Ljava/lang/String;
    .restart local v10    # "flt":Lorg/apache/tools/ant/taskdefs/optional/ejb/InnerClassFilenameFilter;
    .restart local v11    # "i":I
    .restart local v14    # "innerfiles":[Ljava/lang/String;
    .restart local v17    # "jarStream":Ljava/util/jar/JarOutputStream;
    .restart local v18    # "manifest":Ljava/util/jar/Manifest;
    .restart local v19    # "manifestFile":Ljava/io/File;
    .restart local v21    # "n":I
    :cond_8
    :try_start_a
    new-instance v22, Ljava/lang/StringBuffer;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuffer;-><init>()V

    const/16 v23, 0x0

    move/from16 v0, v23

    invoke-virtual {v9, v0, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    sget-char v23, Ljava/io/File;->separatorChar:C

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    move-result-object v22

    aget-object v23, v14, v11

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    move-result-object v9

    goto/16 :goto_2

    .line 861
    .end local v5    # "entryDir":Ljava/io/File;
    .end local v6    # "entryFile":Ljava/io/File;
    .end local v7    # "entryIndex":I
    .end local v9    # "entryName":Ljava/lang/String;
    .end local v10    # "flt":Lorg/apache/tools/ant/taskdefs/optional/ejb/InnerClassFilenameFilter;
    .end local v11    # "i":I
    .end local v14    # "innerfiles":[Ljava/lang/String;
    .end local v21    # "n":I
    :cond_9
    if-eqz v17, :cond_a

    .line 863
    :try_start_b
    invoke-virtual/range {v17 .. v17}, Ljava/util/jar/JarOutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_3

    .line 869
    :cond_a
    :goto_6
    return-void

    .line 864
    .end local v8    # "entryIterator":Ljava/util/Iterator;
    .end local v12    # "in":Ljava/io/InputStream;
    .end local v17    # "jarStream":Ljava/util/jar/JarOutputStream;
    .end local v18    # "manifest":Ljava/util/jar/Manifest;
    .end local v19    # "manifestFile":Ljava/io/File;
    .restart local v16    # "jarStream":Ljava/util/jar/JarOutputStream;
    :catch_2
    move-exception v23

    goto :goto_5

    .end local v16    # "jarStream":Ljava/util/jar/JarOutputStream;
    .restart local v8    # "entryIterator":Ljava/util/Iterator;
    .restart local v12    # "in":Ljava/io/InputStream;
    .restart local v17    # "jarStream":Ljava/util/jar/JarOutputStream;
    .restart local v18    # "manifest":Ljava/util/jar/Manifest;
    .restart local v19    # "manifestFile":Ljava/io/File;
    :catch_3
    move-exception v22

    goto :goto_6

    .line 861
    .end local v8    # "entryIterator":Ljava/util/Iterator;
    :catchall_2
    move-exception v22

    move-object/from16 v16, v17

    .end local v17    # "jarStream":Ljava/util/jar/JarOutputStream;
    .restart local v16    # "jarStream":Ljava/util/jar/JarOutputStream;
    goto :goto_4

    .line 854
    .end local v16    # "jarStream":Ljava/util/jar/JarOutputStream;
    .restart local v17    # "jarStream":Ljava/util/jar/JarOutputStream;
    :catch_4
    move-exception v15

    move-object/from16 v16, v17

    .end local v17    # "jarStream":Ljava/util/jar/JarOutputStream;
    .restart local v16    # "jarStream":Ljava/util/jar/JarOutputStream;
    goto/16 :goto_3
.end method
