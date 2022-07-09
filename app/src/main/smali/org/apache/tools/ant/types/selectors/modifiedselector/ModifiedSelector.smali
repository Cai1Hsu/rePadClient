.class public Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;
.source "ModifiedSelector.java"

# interfaces
.implements Lorg/apache/tools/ant/BuildListener;
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;,
        Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;,
        Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;
    }
.end annotation


# static fields
.field private static final ALGORITHM_PREFIX:Ljava/lang/String; = "algorithm."

.field private static final CACHE_PREFIX:Ljava/lang/String; = "cache."

.field private static final COMPARATOR_PREFIX:Ljava/lang/String; = "comparator."

.field static class$java$util$Comparator:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$selectors$modifiedselector$Algorithm:Ljava/lang/Class;

.field static class$org$apache$tools$ant$types$selectors$modifiedselector$Cache:Ljava/lang/Class;


# instance fields
.field private algoName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;

.field private algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

.field private algorithmClass:Ljava/lang/String;

.field private cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

.field private cacheClass:Ljava/lang/String;

.field private cacheName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private compName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;

.field private comparator:Ljava/util/Comparator;

.field private comparatorClass:Ljava/lang/String;

.field private configParameter:Ljava/util/Vector;

.field private delayUpdate:Z

.field private isConfigured:Z

.field private modified:I

.field private myClassLoader:Ljava/lang/ClassLoader;

.field private selectDirectories:Z

.field private selectResourcesWithoutInputStream:Z

.field private specialParameter:Ljava/util/Vector;

.field private update:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 233
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;-><init>()V

    .line 157
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cacheName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;

    .line 163
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algoName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;

    .line 169
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->compName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;

    .line 175
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->update:Z

    .line 178
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->selectDirectories:Z

    .line 184
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->selectResourcesWithoutInputStream:Z

    .line 187
    iput-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->delayUpdate:Z

    .line 194
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->comparator:Ljava/util/Comparator;

    .line 197
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    .line 200
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    .line 203
    iput v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->modified:I

    .line 206
    iput-boolean v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->isConfigured:Z

    .line 212
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->configParameter:Ljava/util/Vector;

    .line 220
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->specialParameter:Ljava/util/Vector;

    .line 223
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->myClassLoader:Ljava/lang/ClassLoader;

    .line 226
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 234
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 332
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

.method private isSelected(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "cacheKey"    # Ljava/lang/String;

    .prologue
    .line 496
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->validate()V

    .line 497
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 500
    .local v1, "f":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 501
    iget-boolean v3, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->selectDirectories:Z

    .line 519
    :cond_0
    :goto_0
    return v3

    .line 505
    :cond_1
    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 506
    .local v0, "cachedValue":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    invoke-interface {v4, v1}, Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;->getValue(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    .line 508
    .local v2, "newValue":Ljava/lang/String;
    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->comparator:Ljava/util/Comparator;

    invoke-interface {v4, v0, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    if-eqz v4, :cond_2

    const/4 v3, 0x1

    .line 511
    .local v3, "rv":Z
    :goto_1
    iget-boolean v4, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->update:Z

    if-eqz v4, :cond_0

    if-eqz v3, :cond_0

    .line 512
    iget-object v4, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;->put(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 513
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->getModified()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setModified(I)V

    .line 514
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->getDelayUpdate()Z

    move-result v4

    if-nez v4, :cond_0

    .line 515
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->saveCache()V

    goto :goto_0

    .line 508
    .end local v3    # "rv":Z
    :cond_2
    const/4 v3, 0x0

    goto :goto_1
.end method


# virtual methods
.method public addClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 2
    .param p1, "path"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 632
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    if-eqz v0, :cond_0

    .line 633
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "<classpath> can be set only once."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 635
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 636
    return-void
.end method

.method public addParam(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 675
    new-instance v0, Lorg/apache/tools/ant/types/Parameter;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Parameter;-><init>()V

    .line 676
    .local v0, "par":Lorg/apache/tools/ant/types/Parameter;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Parameter;->setName(Ljava/lang/String;)V

    .line 677
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/Parameter;->setValue(Ljava/lang/String;)V

    .line 678
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->configParameter:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 679
    return-void
.end method

.method public addParam(Lorg/apache/tools/ant/types/Parameter;)V
    .locals 1
    .param p1, "parameter"    # Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 687
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->configParameter:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 688
    return-void
.end method

.method public buildFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 1
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 814
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->getDelayUpdate()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 815
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->saveCache()V

    .line 817
    :cond_0
    return-void
.end method

.method public buildStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 848
    return-void
.end method

.method public configure()V
    .locals 12

    .prologue
    .line 276
    iget-boolean v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->isConfigured:Z

    if-eqz v9, :cond_0

    .line 389
    :goto_0
    return-void

    .line 279
    :cond_0
    const/4 v9, 0x1

    iput-boolean v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->isConfigured:Z

    .line 284
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v7

    .line 285
    .local v7, "p":Lorg/apache/tools/ant/Project;
    const-string/jumbo v4, "cache.properties"

    .line 286
    .local v4, "filename":Ljava/lang/String;
    const/4 v0, 0x0

    .line 287
    .local v0, "cachefile":Ljava/io/File;
    if-eqz v7, :cond_1

    .line 289
    new-instance v0, Ljava/io/File;

    .end local v0    # "cachefile":Ljava/io/File;
    invoke-virtual {v7}, Lorg/apache/tools/ant/Project;->getBaseDir()Ljava/io/File;

    move-result-object v9

    invoke-direct {v0, v9, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 292
    .restart local v0    # "cachefile":Ljava/io/File;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v9

    invoke-virtual {v9, p0}, Lorg/apache/tools/ant/Project;->addBuildListener(Lorg/apache/tools/ant/BuildListener;)V

    .line 298
    :goto_1
    new-instance v2, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;-><init>(Ljava/io/File;)V

    .line 299
    .local v2, "defaultCache":Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;
    new-instance v1, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;-><init>()V

    .line 300
    .local v1, "defaultAlgorithm":Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;
    new-instance v3, Lorg/apache/tools/ant/types/selectors/modifiedselector/EqualComparator;

    invoke-direct {v3}, Lorg/apache/tools/ant/types/selectors/modifiedselector/EqualComparator;-><init>()V

    .line 305
    .local v3, "defaultComparator":Ljava/util/Comparator;
    iget-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->configParameter:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "itConfig":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 306
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/tools/ant/types/Parameter;

    .line 307
    .local v8, "par":Lorg/apache/tools/ant/types/Parameter;
    invoke-virtual {v8}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v9

    const-string/jumbo v10, "."

    invoke-virtual {v9, v10}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v9

    if-lez v9, :cond_2

    .line 309
    iget-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->specialParameter:Ljava/util/Vector;

    invoke-virtual {v9, v8}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 295
    .end local v1    # "defaultAlgorithm":Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;
    .end local v2    # "defaultCache":Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;
    .end local v3    # "defaultComparator":Ljava/util/Comparator;
    .end local v5    # "itConfig":Ljava/util/Iterator;
    .end local v8    # "par":Lorg/apache/tools/ant/types/Parameter;
    :cond_1
    new-instance v0, Ljava/io/File;

    .end local v0    # "cachefile":Ljava/io/File;
    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 296
    .restart local v0    # "cachefile":Ljava/io/File;
    const/4 v9, 0x0

    invoke-virtual {p0, v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setDelayUpdate(Z)V

    goto :goto_1

    .line 311
    .restart local v1    # "defaultAlgorithm":Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;
    .restart local v2    # "defaultCache":Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;
    .restart local v3    # "defaultComparator":Ljava/util/Comparator;
    .restart local v5    # "itConfig":Ljava/util/Iterator;
    .restart local v8    # "par":Lorg/apache/tools/ant/types/Parameter;
    :cond_2
    invoke-virtual {p0, v8}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->useParameter(Lorg/apache/tools/ant/types/Parameter;)V

    goto :goto_2

    .line 314
    .end local v8    # "par":Lorg/apache/tools/ant/types/Parameter;
    :cond_3
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V

    iput-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->configParameter:Ljava/util/Vector;

    .line 317
    iget-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algoName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;

    if-eqz v9, :cond_9

    .line 319
    const-string/jumbo v9, "hashvalue"

    iget-object v10, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algoName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;

    invoke-virtual {v10}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_7

    .line 320
    new-instance v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/HashvalueAlgorithm;

    invoke-direct {v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/HashvalueAlgorithm;-><init>()V

    iput-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    .line 340
    :cond_4
    :goto_3
    iget-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cacheName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;

    if-eqz v9, :cond_c

    .line 342
    const-string/jumbo v9, "propertyfile"

    iget-object v10, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cacheName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;

    invoke-virtual {v10}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 343
    new-instance v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;

    invoke-direct {v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/PropertiesfileCache;-><init>()V

    iput-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    .line 356
    :cond_5
    :goto_4
    iget-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->compName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;

    if-eqz v9, :cond_10

    .line 358
    const-string/jumbo v9, "equal"

    iget-object v10, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->compName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;

    invoke-virtual {v10}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_f

    .line 359
    new-instance v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/EqualComparator;

    invoke-direct {v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/EqualComparator;-><init>()V

    iput-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->comparator:Ljava/util/Comparator;

    .line 384
    :cond_6
    :goto_5
    iget-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->specialParameter:Ljava/util/Vector;

    invoke-virtual {v9}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "itSpecial":Ljava/util/Iterator;
    :goto_6
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_13

    .line 385
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorg/apache/tools/ant/types/Parameter;

    .line 386
    .restart local v8    # "par":Lorg/apache/tools/ant/types/Parameter;
    invoke-virtual {p0, v8}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->useParameter(Lorg/apache/tools/ant/types/Parameter;)V

    goto :goto_6

    .line 321
    .end local v6    # "itSpecial":Ljava/util/Iterator;
    .end local v8    # "par":Lorg/apache/tools/ant/types/Parameter;
    :cond_7
    const-string/jumbo v9, "digest"

    iget-object v10, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algoName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;

    invoke-virtual {v10}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 322
    new-instance v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;

    invoke-direct {v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/DigestAlgorithm;-><init>()V

    iput-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    goto :goto_3

    .line 323
    :cond_8
    const-string/jumbo v9, "checksum"

    iget-object v10, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algoName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;

    invoke-virtual {v10}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 324
    new-instance v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;

    invoke-direct {v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ChecksumAlgorithm;-><init>()V

    iput-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    goto :goto_3

    .line 327
    :cond_9
    iget-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithmClass:Ljava/lang/String;

    if-eqz v9, :cond_b

    .line 329
    iget-object v10, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithmClass:Ljava/lang/String;

    const-string/jumbo v11, "is not an Algorithm."

    sget-object v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->class$org$apache$tools$ant$types$selectors$modifiedselector$Algorithm:Ljava/lang/Class;

    if-nez v9, :cond_a

    const-string/jumbo v9, "org.apache.tools.ant.types.selectors.modifiedselector.Algorithm"

    invoke-static {v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    sput-object v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->class$org$apache$tools$ant$types$selectors$modifiedselector$Algorithm:Ljava/lang/Class;

    :goto_7
    invoke-virtual {p0, v10, v11, v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->loadClass(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    iput-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    goto/16 :goto_3

    :cond_a
    sget-object v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->class$org$apache$tools$ant$types$selectors$modifiedselector$Algorithm:Ljava/lang/Class;

    goto :goto_7

    .line 335
    :cond_b
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    goto/16 :goto_3

    .line 346
    :cond_c
    iget-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cacheClass:Ljava/lang/String;

    if-eqz v9, :cond_e

    .line 348
    iget-object v10, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cacheClass:Ljava/lang/String;

    const-string/jumbo v11, "is not a Cache."

    sget-object v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->class$org$apache$tools$ant$types$selectors$modifiedselector$Cache:Ljava/lang/Class;

    if-nez v9, :cond_d

    const-string/jumbo v9, "org.apache.tools.ant.types.selectors.modifiedselector.Cache"

    invoke-static {v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    sput-object v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->class$org$apache$tools$ant$types$selectors$modifiedselector$Cache:Ljava/lang/Class;

    :goto_8
    invoke-virtual {p0, v10, v11, v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->loadClass(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    iput-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    goto/16 :goto_4

    :cond_d
    sget-object v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->class$org$apache$tools$ant$types$selectors$modifiedselector$Cache:Ljava/lang/Class;

    goto :goto_8

    .line 351
    :cond_e
    iput-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    goto/16 :goto_4

    .line 360
    :cond_f
    const-string/jumbo v9, "rule"

    iget-object v10, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->compName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;

    invoke-virtual {v10}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;->getValue()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_6

    .line 364
    new-instance v9, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v10, "RuleBasedCollator not yet supported."

    invoke-direct {v9, v10}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 369
    :cond_10
    iget-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->comparatorClass:Ljava/lang/String;

    if-eqz v9, :cond_12

    .line 371
    iget-object v10, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->comparatorClass:Ljava/lang/String;

    const-string/jumbo v11, "is not a Comparator."

    sget-object v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->class$java$util$Comparator:Ljava/lang/Class;

    if-nez v9, :cond_11

    const-string/jumbo v9, "java.util.Comparator"

    invoke-static {v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v9

    sput-object v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->class$java$util$Comparator:Ljava/lang/Class;

    :goto_9
    invoke-virtual {p0, v10, v11, v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->loadClass(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Comparator;

    iput-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->comparator:Ljava/util/Comparator;

    goto/16 :goto_5

    :cond_11
    sget-object v9, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->class$java$util$Comparator:Ljava/lang/Class;

    goto :goto_9

    .line 377
    :cond_12
    iput-object v3, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->comparator:Ljava/util/Comparator;

    goto/16 :goto_5

    .line 388
    .restart local v6    # "itSpecial":Ljava/util/Iterator;
    :cond_13
    new-instance v9, Ljava/util/Vector;

    invoke-direct {v9}, Ljava/util/Vector;-><init>()V

    iput-object v9, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->specialParameter:Ljava/util/Vector;

    goto/16 :goto_0
.end method

.method public getAlgorithm()Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;
    .locals 1

    .prologue
    .line 918
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    return-object v0
.end method

.method public getCache()Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;
    .locals 1

    .prologue
    .line 888
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    return-object v0
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .locals 2

    .prologue
    .line 644
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->myClassLoader:Ljava/lang/ClassLoader;

    if-nez v0, :cond_0

    .line 645
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->myClassLoader:Ljava/lang/ClassLoader;

    .line 652
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->myClassLoader:Ljava/lang/ClassLoader;

    return-object v0

    .line 645
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    goto :goto_0
.end method

.method public getComparator()Ljava/util/Comparator;
    .locals 1

    .prologue
    .line 948
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->comparator:Ljava/util/Comparator;

    return-object v0
.end method

.method public getDelayUpdate()Z
    .locals 1

    .prologue
    .line 614
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->delayUpdate:Z

    return v0
.end method

.method public getModified()I
    .locals 1

    .prologue
    .line 596
    iget v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->modified:I

    return v0
.end method

.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 1
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;

    .prologue
    .line 482
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->isSelected(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 16
    .param p1, "resource"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 437
    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Resource;->isFilesystemOnly()Z

    move-result v2

    if-eqz v2, :cond_0

    move-object/from16 v10, p1

    .line 440
    check-cast v10, Lorg/apache/tools/ant/types/resources/FileResource;

    .line 441
    .local v10, "fileResource":Lorg/apache/tools/ant/types/resources/FileResource;
    invoke-virtual {v10}, Lorg/apache/tools/ant/types/resources/FileResource;->getFile()Ljava/io/File;

    move-result-object v9

    .line 442
    .local v9, "file":Ljava/io/File;
    invoke-virtual {v10}, Lorg/apache/tools/ant/types/resources/FileResource;->getName()Ljava/lang/String;

    move-result-object v11

    .line 443
    .local v11, "filename":Ljava/lang/String;
    invoke-virtual {v10}, Lorg/apache/tools/ant/types/resources/FileResource;->getBaseDir()Ljava/io/File;

    move-result-object v7

    .line 444
    .local v7, "basedir":Ljava/io/File;
    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v11, v9}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z

    move-result v12

    .line 465
    .end local v7    # "basedir":Ljava/io/File;
    .end local v9    # "file":Ljava/io/File;
    .end local v10    # "fileResource":Lorg/apache/tools/ant/types/resources/FileResource;
    .end local v11    # "filename":Ljava/lang/String;
    :goto_0
    return v12

    .line 449
    :cond_0
    :try_start_0
    invoke-static {}, Lorg/apache/tools/ant/util/FileUtils;->getFileUtils()Lorg/apache/tools/ant/util/FileUtils;

    move-result-object v1

    .line 450
    .local v1, "fu":Lorg/apache/tools/ant/util/FileUtils;
    const-string/jumbo v2, "modified-"

    const-string/jumbo v3, ".tmp"

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lorg/apache/tools/ant/util/FileUtils;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Ljava/io/File;

    move-result-object v13

    .line 451
    .local v13, "tmpFile":Ljava/io/File;
    new-instance v14, Lorg/apache/tools/ant/types/resources/FileResource;

    invoke-direct {v14, v13}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;)V

    .line 452
    .local v14, "tmpResource":Lorg/apache/tools/ant/types/Resource;
    move-object/from16 v0, p1

    invoke-static {v0, v14}, Lorg/apache/tools/ant/util/ResourceUtils;->copyResource(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)V

    .line 453
    invoke-virtual {v13}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v13}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Resource;->toLongString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v3, v4}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->isSelected(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v12

    .line 456
    .local v12, "isSelected":Z
    invoke-virtual {v13}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 458
    .end local v1    # "fu":Lorg/apache/tools/ant/util/FileUtils;
    .end local v12    # "isSelected":Z
    .end local v13    # "tmpFile":Ljava/io/File;
    .end local v14    # "tmpResource":Lorg/apache/tools/ant/types/Resource;
    :catch_0
    move-exception v15

    .line 459
    .local v15, "uoe":Ljava/lang/UnsupportedOperationException;
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The resource \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\' does not provide an InputStream, so it is not checked. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "Akkording to \'selres\' attribute value it is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    move-object/from16 v0, p0

    iget-boolean v2, v0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->selectResourcesWithoutInputStream:Z

    if-eqz v2, :cond_1

    const-string/jumbo v2, ""

    :goto_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "selected."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v3}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->log(Ljava/lang/String;I)V

    .line 465
    move-object/from16 v0, p0

    iget-boolean v12, v0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->selectResourcesWithoutInputStream:Z

    goto :goto_0

    .line 459
    :cond_1
    const-string/jumbo v2, " not"

    goto :goto_1

    .line 466
    .end local v15    # "uoe":Ljava/lang/UnsupportedOperationException;
    :catch_1
    move-exception v8

    .line 467
    .local v8, "e":Ljava/lang/Exception;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v8}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected loadClass(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 7
    .param p1, "classname"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;
    .param p3, "type"    # Ljava/lang/Class;

    .prologue
    .line 404
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 405
    .local v0, "cl":Ljava/lang/ClassLoader;
    const/4 v1, 0x0

    .line 406
    .local v1, "clazz":Ljava/lang/Class;
    if-eqz v0, :cond_0

    .line 407
    invoke-virtual {v0, p1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 412
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    .line 414
    .local v3, "rv":Ljava/lang/Object;
    invoke-virtual {p3, v3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 415
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Specified class ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ") "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 418
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    .end local v1    # "clazz":Ljava/lang/Class;
    .end local v3    # "rv":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 419
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "Specified class ("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string/jumbo v6, ") not found."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 409
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v0    # "cl":Ljava/lang/ClassLoader;
    .restart local v1    # "clazz":Ljava/lang/Class;
    :cond_0
    :try_start_1
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v1

    goto :goto_0

    .line 420
    .end local v0    # "cl":Ljava/lang/ClassLoader;
    .end local v1    # "clazz":Ljava/lang/Class;
    :catch_1
    move-exception v2

    .line 421
    .local v2, "e":Ljava/lang/Exception;
    new-instance v4, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v4, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 417
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "cl":Ljava/lang/ClassLoader;
    .restart local v1    # "clazz":Ljava/lang/Class;
    .restart local v3    # "rv":Ljava/lang/Object;
    :cond_1
    return-object v3
.end method

.method public messageLogged(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 876
    return-void
.end method

.method protected saveCache()V
    .locals 1

    .prologue
    .line 527
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->getModified()I

    move-result v0

    if-lez v0, :cond_0

    .line 528
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    invoke-interface {v0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;->save()V

    .line 529
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setModified(I)V

    .line 531
    :cond_0
    return-void
.end method

.method public setAlgorithm(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;)V
    .locals 0
    .param p1, "name"    # Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;

    .prologue
    .line 926
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algoName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;

    .line 927
    return-void
.end method

.method public setAlgorithmClass(Ljava/lang/String;)V
    .locals 0
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 542
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithmClass:Ljava/lang/String;

    .line 543
    return-void
.end method

.method public setCache(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;)V
    .locals 0
    .param p1, "name"    # Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;

    .prologue
    .line 896
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cacheName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;

    .line 897
    return-void
.end method

.method public setCacheClass(Ljava/lang/String;)V
    .locals 0
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 560
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cacheClass:Ljava/lang/String;

    .line 561
    return-void
.end method

.method public setClassLoader(Ljava/lang/ClassLoader;)V
    .locals 0
    .param p1, "loader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 665
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->myClassLoader:Ljava/lang/ClassLoader;

    .line 666
    return-void
.end method

.method public setComparator(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;)V
    .locals 0
    .param p1, "name"    # Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;

    .prologue
    .line 956
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->compName:Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;

    .line 957
    return-void
.end method

.method public setComparatorClass(Ljava/lang/String;)V
    .locals 0
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 551
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->comparatorClass:Ljava/lang/String;

    .line 552
    return-void
.end method

.method public setDelayUpdate(Z)V
    .locals 0
    .param p1, "delayUpdate"    # Z

    .prologue
    .line 623
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->delayUpdate:Z

    .line 624
    return-void
.end method

.method public setModified(I)V
    .locals 0
    .param p1, "modified"    # I

    .prologue
    .line 605
    iput p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->modified:I

    .line 606
    return-void
.end method

.method public setParameters([Lorg/apache/tools/ant/types/Parameter;)V
    .locals 3
    .param p1, "parameters"    # [Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 699
    if-eqz p1, :cond_0

    .line 700
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 701
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->configParameter:Ljava/util/Vector;

    aget-object v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 700
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 704
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method public setSeldirs(Z)V
    .locals 0
    .param p1, "seldirs"    # Z

    .prologue
    .line 578
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->selectDirectories:Z

    .line 579
    return-void
.end method

.method public setSelres(Z)V
    .locals 0
    .param p1, "newValue"    # Z

    .prologue
    .line 587
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->selectResourcesWithoutInputStream:Z

    .line 588
    return-void
.end method

.method public setUpdate(Z)V
    .locals 0
    .param p1, "update"    # Z

    .prologue
    .line 569
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->update:Z

    .line 570
    return-void
.end method

.method public targetFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 1
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 825
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->getDelayUpdate()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 826
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->saveCache()V

    .line 828
    :cond_0
    return-void
.end method

.method public targetStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 857
    return-void
.end method

.method public taskFinished(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 1
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 836
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->getDelayUpdate()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 837
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->saveCache()V

    .line 839
    :cond_0
    return-void
.end method

.method public taskStarted(Lorg/apache/tools/ant/BuildEvent;)V
    .locals 0
    .param p1, "event"    # Lorg/apache/tools/ant/BuildEvent;

    .prologue
    .line 867
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 795
    new-instance v0, Ljava/lang/StringBuffer;

    const-string/jumbo v1, "{modifiedselector"

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 796
    .local v0, "buf":Ljava/lang/StringBuffer;
    const-string/jumbo v1, " update="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->update:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 797
    const-string/jumbo v1, " seldirs="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-boolean v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->selectDirectories:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 798
    const-string/jumbo v1, " cache="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 799
    const-string/jumbo v1, " algorithm="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 800
    const-string/jumbo v1, " comparator="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->comparator:Ljava/util/Comparator;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 801
    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 802
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected tryToSetAParameter(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 776
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    .line 777
    .local v1, "prj":Lorg/apache/tools/ant/Project;
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/tools/ant/IntrospectionHelper;->getHelper(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper;

    move-result-object v0

    .line 780
    .local v0, "iHelper":Lorg/apache/tools/ant/IntrospectionHelper;
    :try_start_0
    invoke-virtual {v0, v1, p1, p2, p3}, Lorg/apache/tools/ant/IntrospectionHelper;->setAttribute(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    .line 784
    :goto_1
    return-void

    .line 776
    .end local v0    # "iHelper":Lorg/apache/tools/ant/IntrospectionHelper;
    .end local v1    # "prj":Lorg/apache/tools/ant/Project;
    :cond_0
    new-instance v1, Lorg/apache/tools/ant/Project;

    invoke-direct {v1}, Lorg/apache/tools/ant/Project;-><init>()V

    goto :goto_0

    .line 781
    .restart local v0    # "iHelper":Lorg/apache/tools/ant/IntrospectionHelper;
    .restart local v1    # "prj":Lorg/apache/tools/ant/Project;
    :catch_0
    move-exception v2

    goto :goto_1
.end method

.method public useParameter(Lorg/apache/tools/ant/types/Parameter;)V
    .locals 9
    .param p1, "parameter"    # Lorg/apache/tools/ant/types/Parameter;

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 721
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Parameter;->getName()Ljava/lang/String;

    move-result-object v2

    .line 722
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Parameter;->getValue()Ljava/lang/String;

    move-result-object v6

    .line 723
    .local v6, "value":Ljava/lang/String;
    const-string/jumbo v8, "cache"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 724
    new-instance v1, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;-><init>()V

    .line 725
    .local v1, "cn":Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;
    invoke-virtual {v1, v6}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;->setValue(Ljava/lang/String;)V

    .line 726
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setCache(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;)V

    .line 765
    .end local v1    # "cn":Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$CacheName;
    :goto_0
    return-void

    .line 727
    :cond_0
    const-string/jumbo v8, "algorithm"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 728
    new-instance v0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;-><init>()V

    .line 729
    .local v0, "an":Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;
    invoke-virtual {v0, v6}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;->setValue(Ljava/lang/String;)V

    .line 730
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setAlgorithm(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;)V

    goto :goto_0

    .line 731
    .end local v0    # "an":Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$AlgorithmName;
    :cond_1
    const-string/jumbo v8, "comparator"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 732
    new-instance v1, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;

    invoke-direct {v1}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;-><init>()V

    .line 733
    .local v1, "cn":Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;
    invoke-virtual {v1, v6}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;->setValue(Ljava/lang/String;)V

    .line 734
    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setComparator(Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;)V

    goto :goto_0

    .line 735
    .end local v1    # "cn":Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector$ComparatorName;
    :cond_2
    const-string/jumbo v8, "update"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 736
    const-string/jumbo v8, "true"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 740
    .local v5, "updateValue":Z
    :goto_1
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setUpdate(Z)V

    goto :goto_0

    .end local v5    # "updateValue":Z
    :cond_3
    move v5, v7

    .line 736
    goto :goto_1

    .line 741
    :cond_4
    const-string/jumbo v8, "delayupdate"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_6

    .line 742
    const-string/jumbo v8, "true"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_5

    .line 746
    .restart local v5    # "updateValue":Z
    :goto_2
    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setDelayUpdate(Z)V

    goto :goto_0

    .end local v5    # "updateValue":Z
    :cond_5
    move v5, v7

    .line 742
    goto :goto_2

    .line 747
    :cond_6
    const-string/jumbo v8, "seldirs"

    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_8

    .line 748
    const-string/jumbo v8, "true"

    invoke-virtual {v8, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7

    move v4, v5

    .line 752
    .local v4, "sdValue":Z
    :goto_3
    invoke-virtual {p0, v4}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setSeldirs(Z)V

    goto :goto_0

    .end local v4    # "sdValue":Z
    :cond_7
    move v4, v7

    .line 748
    goto :goto_3

    .line 753
    :cond_8
    const-string/jumbo v7, "cache."

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 754
    const-string/jumbo v7, "cache."

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 755
    .local v3, "name":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    invoke-virtual {p0, v7, v3, v6}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->tryToSetAParameter(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 756
    .end local v3    # "name":Ljava/lang/String;
    :cond_9
    const-string/jumbo v7, "algorithm."

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 757
    const-string/jumbo v7, "algorithm."

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 758
    .restart local v3    # "name":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    invoke-virtual {p0, v7, v3, v6}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->tryToSetAParameter(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 759
    .end local v3    # "name":Ljava/lang/String;
    :cond_a
    const-string/jumbo v7, "comparator."

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 760
    const-string/jumbo v7, "comparator."

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 761
    .restart local v3    # "name":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->comparator:Ljava/util/Comparator;

    invoke-virtual {p0, v7, v3, v6}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->tryToSetAParameter(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 763
    .end local v3    # "name":Ljava/lang/String;
    :cond_b
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Invalid parameter "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setError(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public verifySettings()V
    .locals 1

    .prologue
    .line 242
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->configure()V

    .line 243
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    if-nez v0, :cond_1

    .line 244
    const-string/jumbo v0, "Cache must be set."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setError(Ljava/lang/String;)V

    .line 252
    :cond_0
    :goto_0
    return-void

    .line 245
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    if-nez v0, :cond_2

    .line 246
    const-string/jumbo v0, "Algorithm must be set."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setError(Ljava/lang/String;)V

    goto :goto_0

    .line 247
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->cache:Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;

    invoke-interface {v0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/Cache;->isValid()Z

    move-result v0

    if-nez v0, :cond_3

    .line 248
    const-string/jumbo v0, "Cache must be proper configured."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setError(Ljava/lang/String;)V

    goto :goto_0

    .line 249
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->algorithm:Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;

    invoke-interface {v0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/Algorithm;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    .line 250
    const-string/jumbo v0, "Algorithm must be proper configured."

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/modifiedselector/ModifiedSelector;->setError(Ljava/lang/String;)V

    goto :goto_0
.end method
