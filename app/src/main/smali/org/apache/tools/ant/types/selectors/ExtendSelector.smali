.class public Lorg/apache/tools/ant/types/selectors/ExtendSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseSelector;
.source "ExtendSelector.java"


# instance fields
.field private classname:Ljava/lang/String;

.field private classpath:Lorg/apache/tools/ant/types/Path;

.field private dynselector:Lorg/apache/tools/ant/types/selectors/FileSelector;

.field private paramVec:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 46
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;-><init>()V

    .line 38
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classname:Ljava/lang/String;

    .line 39
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->dynselector:Lorg/apache/tools/ant/types/selectors/FileSelector;

    .line 40
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->paramVec:Ljava/util/Vector;

    .line 41
    iput-object v1, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 47
    return-void
.end method


# virtual methods
.method public addParam(Lorg/apache/tools/ant/types/Parameter;)V
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 99
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->paramVec:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 100
    return-void
.end method

.method public final createClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 2

    .prologue
    .line 123
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 124
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 126
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_1

    .line 127
    new-instance v0, Lorg/apache/tools/ant/types/Path;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Path;-><init>(Lorg/apache/tools/ant/Project;)V

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 129
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Path;->createPath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    return-object v0
.end method

.method public final getClasspath()Lorg/apache/tools/ant/types/Path;
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    return-object v0
.end method

.method public isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .locals 2
    .param p1, "basedir"    # Ljava/io/File;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 190
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->validate()V

    .line 191
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->paramVec:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->dynselector:Lorg/apache/tools/ant/types/selectors/FileSelector;

    instance-of v1, v1, Lorg/apache/tools/ant/types/selectors/ExtendFileSelector;

    if-eqz v1, :cond_0

    .line 192
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->paramVec:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->size()I

    move-result v1

    new-array v0, v1, [Lorg/apache/tools/ant/types/Parameter;

    .line 193
    .local v0, "paramArray":[Lorg/apache/tools/ant/types/Parameter;
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->paramVec:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->copyInto([Ljava/lang/Object;)V

    .line 195
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->dynselector:Lorg/apache/tools/ant/types/selectors/FileSelector;

    check-cast v1, Lorg/apache/tools/ant/types/selectors/ExtendFileSelector;

    invoke-interface {v1, v0}, Lorg/apache/tools/ant/types/selectors/ExtendFileSelector;->setParameters([Lorg/apache/tools/ant/types/Parameter;)V

    .line 197
    .end local v0    # "paramArray":[Lorg/apache/tools/ant/types/Parameter;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->dynselector:Lorg/apache/tools/ant/types/selectors/FileSelector;

    invoke-interface {v1, p1, p2, p3}, Lorg/apache/tools/ant/types/selectors/FileSelector;->isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z

    move-result v1

    return v1
.end method

.method public selectorCreate()V
    .locals 8

    .prologue
    .line 62
    iget-object v6, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classname:Ljava/lang/String;

    if-eqz v6, :cond_2

    iget-object v6, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classname:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_2

    .line 64
    const/4 v1, 0x0

    .line 65
    .local v1, "c":Ljava/lang/Class;
    :try_start_0
    iget-object v6, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v6, :cond_1

    .line 66
    iget-object v6, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classname:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 73
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/apache/tools/ant/types/selectors/FileSelector;

    iput-object v6, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->dynselector:Lorg/apache/tools/ant/types/selectors/FileSelector;

    .line 74
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    .line 75
    .local v5, "p":Lorg/apache/tools/ant/Project;
    if-eqz v5, :cond_0

    .line 76
    iget-object v6, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->dynselector:Lorg/apache/tools/ant/types/selectors/FileSelector;

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/Project;->setProjectReference(Ljava/lang/Object;)V

    .line 91
    .end local v1    # "c":Ljava/lang/Class;
    .end local v5    # "p":Lorg/apache/tools/ant/Project;
    :cond_0
    :goto_1
    return-void

    .line 69
    .restart local v1    # "c":Ljava/lang/Class;
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v6, v7}, Lorg/apache/tools/ant/Project;->createClassLoader(Lorg/apache/tools/ant/types/Path;)Lorg/apache/tools/ant/AntClassLoader;

    move-result-object v0

    .line 71
    .local v0, "al":Lorg/apache/tools/ant/AntClassLoader;
    iget-object v6, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classname:Ljava/lang/String;

    const/4 v7, 0x1

    invoke-static {v6, v7, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v1

    goto :goto_0

    .line 78
    .end local v0    # "al":Lorg/apache/tools/ant/AntClassLoader;
    :catch_0
    move-exception v2

    .line 79
    .local v2, "cnfexcept":Ljava/lang/ClassNotFoundException;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Selector "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classname:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " not initialized, no such class"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 81
    .end local v2    # "cnfexcept":Ljava/lang/ClassNotFoundException;
    :catch_1
    move-exception v4

    .line 82
    .local v4, "iexcept":Ljava/lang/InstantiationException;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Selector "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classname:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " not initialized, could not create class"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 84
    .end local v4    # "iexcept":Ljava/lang/InstantiationException;
    :catch_2
    move-exception v3

    .line 85
    .local v3, "iaexcept":Ljava/lang/IllegalAccessException;
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Selector "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classname:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, " not initialized, class not accessible"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->setError(Ljava/lang/String;)V

    goto :goto_1

    .line 89
    .end local v1    # "c":Ljava/lang/Class;
    .end local v3    # "iaexcept":Ljava/lang/IllegalAccessException;
    :cond_2
    const-string/jumbo v6, "There is no classname specified"

    invoke-virtual {p0, v6}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->setError(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public setClassname(Ljava/lang/String;)V
    .locals 0
    .param p1, "classname"    # Ljava/lang/String;

    .prologue
    .line 55
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classname:Ljava/lang/String;

    .line 56
    return-void
.end method

.method public final setClasspath(Lorg/apache/tools/ant/types/Path;)V
    .locals 1
    .param p1, "classpath"    # Lorg/apache/tools/ant/types/Path;

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 109
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 111
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    if-nez v0, :cond_1

    .line 112
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    .line 116
    :goto_0
    return-void

    .line 114
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classpath:Lorg/apache/tools/ant/types/Path;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->append(Lorg/apache/tools/ant/types/Path;)V

    goto :goto_0
.end method

.method public setClasspathref(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 146
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 147
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 149
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->createClasspath()Lorg/apache/tools/ant/types/Path;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Path;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 150
    return-void
.end method

.method public verifySettings()V
    .locals 2

    .prologue
    .line 161
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->dynselector:Lorg/apache/tools/ant/types/selectors/FileSelector;

    if-nez v0, :cond_0

    .line 162
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->selectorCreate()V

    .line 164
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classname:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->classname:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_3

    .line 165
    :cond_1
    const-string/jumbo v0, "The classname attribute is required"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->setError(Ljava/lang/String;)V

    .line 173
    :cond_2
    :goto_0
    return-void

    .line 166
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->dynselector:Lorg/apache/tools/ant/types/selectors/FileSelector;

    if-nez v0, :cond_4

    .line 167
    const-string/jumbo v0, "Internal Error: The custom selector was not created"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->setError(Ljava/lang/String;)V

    goto :goto_0

    .line 168
    :cond_4
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->dynselector:Lorg/apache/tools/ant/types/selectors/FileSelector;

    instance-of v0, v0, Lorg/apache/tools/ant/types/selectors/ExtendFileSelector;

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->paramVec:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 170
    const-string/jumbo v0, "Cannot set parameters on custom selector that does not implement ExtendFileSelector"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/selectors/ExtendSelector;->setError(Ljava/lang/String;)V

    goto :goto_0
.end method
