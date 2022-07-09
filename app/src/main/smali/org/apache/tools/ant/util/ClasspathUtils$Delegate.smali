.class public Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;
.super Ljava/lang/Object;
.source "ClasspathUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/util/ClasspathUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Delegate"
.end annotation


# instance fields
.field private className:Ljava/lang/String;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private classpathId:Ljava/lang/String;

.field private final component:Lorg/apache/tools/ant/ProjectComponent;

.field private loaderId:Ljava/lang/String;

.field private reverseLoader:Z


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/ProjectComponent;)V
    .locals 1
    .param p1, "component"    # Lorg/apache/tools/ant/ProjectComponent;

    .prologue
    .line 319
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 313
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->reverseLoader:Z

    .line 320
    iput-object p1, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->component:Lorg/apache/tools/ant/ProjectComponent;

    .line 321
    return-void
.end method

.method private getContextProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 419
    iget-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->component:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v0}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 347
    iget-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 348
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    iget-object v1, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->component:Lorg/apache/tools/ant/ProjectComponent;

    invoke-virtual {v1}, Lorg/apache/tools/ant/ProjectComponent;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 350
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public getClassLoadId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 427
    iget-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->loaderId:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->classpathId:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 428
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "ant.loader."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->classpathId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 430
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->loaderId:Ljava/lang/String;

    goto :goto_0
.end method

.method public getClassLoader()Ljava/lang/ClassLoader;
    .locals 5

    .prologue
    .line 411
    invoke-direct {p0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->getContextProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->getClassLoadId()Ljava/lang/String;

    move-result-object v3

    iget-boolean v4, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->reverseLoader:Z

    iget-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->loaderId:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->getContextProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->access$000(Lorg/apache/tools/ant/Project;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v2, v3, v4, v0}, Lorg/apache/tools/ant/util/ClasspathUtils;->getClassLoaderForPath(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/types/Path;Ljava/lang/String;ZZ)Ljava/lang/ClassLoader;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 449
    iget-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->classpath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public isReverseLoader()Z
    .locals 1

    .prologue
    .line 457
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->reverseLoader:Z

    return v0
.end method

.method public newInstance()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 441
    iget-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->className:Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/tools/ant/util/ClasspathUtils;->newInstance(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setClassname(Ljava/lang/String;)V
    .locals 0
    .param p1, "fcqn"    # Ljava/lang/String;

    .prologue
    .line 362
    iput-object p1, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->className:Ljava/lang/String;

    .line 363
    return-void
.end method

.method public setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 331
    iget-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_0

    .line 332
    iput-object p1, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 336
    :goto_0
    return-void

    .line 334
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathref(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 374
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->classpathId:Ljava/lang/String;

    .line 375
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 376
    return-void
.end method

.method public setLoaderRef(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 402
    invoke-virtual {p1}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->loaderId:Ljava/lang/String;

    .line 403
    return-void
.end method

.method public setReverseLoader(Z)V
    .locals 0
    .param p1, "reverseLoader"    # Z

    .prologue
    .line 394
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/ClasspathUtils$Delegate;->reverseLoader:Z

    .line 395
    return-void
.end method
