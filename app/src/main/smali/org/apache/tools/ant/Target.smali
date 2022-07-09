.class public Lorg/apache/tools/ant/Target;
.super Ljava/lang/Object;
.source "Target.java"

# interfaces
.implements Lorg/apache/tools/ant/TaskContainer;


# instance fields
.field private children:Ljava/util/List;

.field private dependencies:Ljava/util/List;

.field private description:Ljava/lang/String;

.field private ifCondition:Ljava/lang/String;

.field private location:Lorg/apache/tools/ant/Location;

.field private name:Ljava/lang/String;

.field private project:Lorg/apache/tools/ant/Project;

.field private unlessCondition:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->ifCondition:Ljava/lang/String;

    .line 46
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->unlessCondition:Ljava/lang/String;

    .line 49
    iput-object v1, p0, Lorg/apache/tools/ant/Target;->dependencies:Ljava/util/List;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    .line 55
    sget-object v0, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->location:Lorg/apache/tools/ant/Location;

    .line 61
    iput-object v1, p0, Lorg/apache/tools/ant/Target;->description:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Target;)V
    .locals 2
    .param p1, "other"    # Lorg/apache/tools/ant/Target;

    .prologue
    const/4 v1, 0x0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->ifCondition:Ljava/lang/String;

    .line 46
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->unlessCondition:Ljava/lang/String;

    .line 49
    iput-object v1, p0, Lorg/apache/tools/ant/Target;->dependencies:Ljava/util/List;

    .line 52
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    .line 55
    sget-object v0, Lorg/apache/tools/ant/Location;->UNKNOWN_LOCATION:Lorg/apache/tools/ant/Location;

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->location:Lorg/apache/tools/ant/Location;

    .line 61
    iput-object v1, p0, Lorg/apache/tools/ant/Target;->description:Ljava/lang/String;

    .line 73
    iget-object v0, p1, Lorg/apache/tools/ant/Target;->name:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->name:Ljava/lang/String;

    .line 74
    iget-object v0, p1, Lorg/apache/tools/ant/Target;->ifCondition:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->ifCondition:Ljava/lang/String;

    .line 75
    iget-object v0, p1, Lorg/apache/tools/ant/Target;->unlessCondition:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->unlessCondition:Ljava/lang/String;

    .line 76
    iget-object v0, p1, Lorg/apache/tools/ant/Target;->dependencies:Ljava/util/List;

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->dependencies:Ljava/util/List;

    .line 77
    iget-object v0, p1, Lorg/apache/tools/ant/Target;->location:Lorg/apache/tools/ant/Location;

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->location:Lorg/apache/tools/ant/Location;

    .line 78
    iget-object v0, p1, Lorg/apache/tools/ant/Target;->project:Lorg/apache/tools/ant/Project;

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->project:Lorg/apache/tools/ant/Project;

    .line 79
    iget-object v0, p1, Lorg/apache/tools/ant/Target;->description:Ljava/lang/String;

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->description:Ljava/lang/String;

    .line 81
    iget-object v0, p1, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    .line 82
    return-void
.end method

.method public static parseDepends(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .param p0, "depends"    # Ljava/lang/String;
    .param p1, "targetName"    # Ljava/lang/String;
    .param p2, "attributeName"    # Ljava/lang/String;

    .prologue
    .line 141
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .local v0, "list":Ljava/util/ArrayList;
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_4

    .line 143
    new-instance v1, Ljava/util/StringTokenizer;

    const-string/jumbo v3, ","

    const/4 v4, 0x1

    invoke-direct {v1, p0, v3, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 145
    .local v1, "tok":Ljava/util/StringTokenizer;
    :cond_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 146
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 149
    .local v2, "token":Ljava/lang/String;
    const-string/jumbo v3, ""

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string/jumbo v3, ","

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 150
    :cond_1
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Syntax Error: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " attribute of target \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\" contains an empty string."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 157
    :cond_2
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 162
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    .line 163
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v3

    if-eqz v3, :cond_3

    const-string/jumbo v3, ","

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 164
    :cond_3
    new-instance v3, Lorg/apache/tools/ant/BuildException;

    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v5, "Syntax Error: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, " attribute for target \""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "\" ends with a \",\" "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    const-string/jumbo v5, "character"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 174
    .end local v1    # "tok":Ljava/util/StringTokenizer;
    .end local v2    # "token":Ljava/lang/String;
    :cond_4
    return-object v0
.end method

.method private testIfAllows()Z
    .locals 3

    .prologue
    .line 462
    invoke-virtual {p0}, Lorg/apache/tools/ant/Target;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v1

    .line 463
    .local v1, "propertyHelper":Lorg/apache/tools/ant/PropertyHelper;
    iget-object v2, p0, Lorg/apache/tools/ant/Target;->ifCondition:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/PropertyHelper;->parseProperties(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 464
    .local v0, "o":Ljava/lang/Object;
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/PropertyHelper;->testIfCondition(Ljava/lang/Object;)Z

    move-result v2

    return v2
.end method

.method private testUnlessAllows()Z
    .locals 3

    .prologue
    .line 477
    invoke-virtual {p0}, Lorg/apache/tools/ant/Target;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v1

    .line 478
    .local v1, "propertyHelper":Lorg/apache/tools/ant/PropertyHelper;
    iget-object v2, p0, Lorg/apache/tools/ant/Target;->unlessCondition:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/PropertyHelper;->parseProperties(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 479
    .local v0, "o":Ljava/lang/Object;
    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/PropertyHelper;->testUnlessCondition(Ljava/lang/Object;)Z

    move-result v2

    return v2
.end method


# virtual methods
.method public addDataType(Lorg/apache/tools/ant/RuntimeConfigurable;)V
    .locals 1
    .param p1, "r"    # Lorg/apache/tools/ant/RuntimeConfigurable;

    .prologue
    .line 212
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 213
    return-void
.end method

.method public addDependency(Ljava/lang/String;)V
    .locals 2
    .param p1, "dependency"    # Ljava/lang/String;

    .prologue
    .line 239
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->dependencies:Ljava/util/List;

    if-nez v0, :cond_0

    .line 240
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/tools/ant/Target;->dependencies:Ljava/util/List;

    .line 242
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->dependencies:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    return-void
.end method

.method public addTask(Lorg/apache/tools/ant/Task;)V
    .locals 1
    .param p1, "task"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 202
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 203
    return-void
.end method

.method public dependsOn(Ljava/lang/String;)Z
    .locals 5
    .param p1, "other"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 262
    invoke-virtual {p0}, Lorg/apache/tools/ant/Target;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    .line 263
    .local v0, "p":Lorg/apache/tools/ant/Project;
    if-nez v0, :cond_1

    const/4 v1, 0x0

    .line 264
    .local v1, "t":Ljava/util/Hashtable;
    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3, v1, v2}, Lorg/apache/tools/ant/Project;->topoSort(Ljava/lang/String;Ljava/util/Hashtable;Z)Ljava/util/Vector;

    move-result-object v3

    invoke-virtual {v1, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/Vector;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2

    .line 263
    .end local v1    # "t":Ljava/util/Hashtable;
    :cond_1
    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getTargets()Ljava/util/Hashtable;

    move-result-object v1

    goto :goto_0
.end method

.method public execute()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    .line 371
    invoke-direct {p0}, Lorg/apache/tools/ant/Target;->testIfAllows()Z

    move-result v5

    if-nez v5, :cond_0

    .line 372
    iget-object v5, p0, Lorg/apache/tools/ant/Target;->project:Lorg/apache/tools/ant/Project;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Skipped because property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/Target;->project:Lorg/apache/tools/ant/Project;

    iget-object v8, p0, Lorg/apache/tools/ant/Target;->ifCondition:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\' not set."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, p0, v6, v9}, Lorg/apache/tools/ant/Project;->log(Lorg/apache/tools/ant/Target;Ljava/lang/String;I)V

    .line 400
    :goto_0
    return-void

    .line 376
    :cond_0
    invoke-direct {p0}, Lorg/apache/tools/ant/Target;->testUnlessAllows()Z

    move-result v5

    if-nez v5, :cond_1

    .line 377
    iget-object v5, p0, Lorg/apache/tools/ant/Target;->project:Lorg/apache/tools/ant/Project;

    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v7, "Skipped because property \'"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/Target;->project:Lorg/apache/tools/ant/Project;

    iget-object v8, p0, Lorg/apache/tools/ant/Target;->unlessCondition:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    const-string/jumbo v7, "\' set."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, p0, v6, v9}, Lorg/apache/tools/ant/Project;->log(Lorg/apache/tools/ant/Target;Ljava/lang/String;I)V

    goto :goto_0

    .line 381
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/Target;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/tools/ant/property/LocalProperties;->get(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/property/LocalProperties;

    move-result-object v2

    .line 382
    .local v2, "localProperties":Lorg/apache/tools/ant/property/LocalProperties;
    invoke-virtual {v2}, Lorg/apache/tools/ant/property/LocalProperties;->enterScope()V

    .line 388
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    :try_start_0
    iget-object v5, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ge v1, v5, :cond_3

    .line 389
    iget-object v5, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 390
    .local v3, "o":Ljava/lang/Object;
    instance-of v5, v3, Lorg/apache/tools/ant/Task;

    if-eqz v5, :cond_2

    .line 391
    move-object v0, v3

    check-cast v0, Lorg/apache/tools/ant/Task;

    move-object v4, v0

    .line 392
    .local v4, "task":Lorg/apache/tools/ant/Task;
    invoke-virtual {v4}, Lorg/apache/tools/ant/Task;->perform()V

    .line 388
    .end local v3    # "o":Ljava/lang/Object;
    .end local v4    # "task":Lorg/apache/tools/ant/Task;
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 394
    .restart local v3    # "o":Ljava/lang/Object;
    :cond_2
    check-cast v3, Lorg/apache/tools/ant/RuntimeConfigurable;

    .end local v3    # "o":Ljava/lang/Object;
    iget-object v5, p0, Lorg/apache/tools/ant/Target;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v3, v5}, Lorg/apache/tools/ant/RuntimeConfigurable;->maybeConfigure(Lorg/apache/tools/ant/Project;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 398
    :catchall_0
    move-exception v5

    invoke-virtual {v2}, Lorg/apache/tools/ant/property/LocalProperties;->exitScope()V

    throw v5

    :cond_3
    invoke-virtual {v2}, Lorg/apache/tools/ant/property/LocalProperties;->exitScope()V

    goto :goto_0
.end method

.method public getDependencies()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 251
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->dependencies:Ljava/util/List;

    if-nez v0, :cond_0

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_0
    invoke-static {v0}, Ljava/util/Collections;->enumeration(Ljava/util/Collection;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->dependencies:Ljava/util/List;

    goto :goto_0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 341
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getIf()Ljava/lang/String;
    .locals 2

    .prologue
    .line 292
    const-string/jumbo v0, ""

    iget-object v1, p0, Lorg/apache/tools/ant/Target;->ifCondition:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->ifCondition:Ljava/lang/String;

    goto :goto_0
.end method

.method public getLocation()Lorg/apache/tools/ant/Location;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->location:Lorg/apache/tools/ant/Location;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getProject()Lorg/apache/tools/ant/Project;
    .locals 1

    .prologue
    .line 101
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->project:Lorg/apache/tools/ant/Project;

    return-object v0
.end method

.method public getTasks()[Lorg/apache/tools/ant/Task;
    .locals 4

    .prologue
    .line 221
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 222
    .local v2, "tasks":Ljava/util/List;
    iget-object v3, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 223
    .local v0, "it":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 224
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 225
    .local v1, "o":Ljava/lang/Object;
    instance-of v3, v1, Lorg/apache/tools/ant/Task;

    if-eqz v3, :cond_0

    .line 226
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 229
    .end local v1    # "o":Ljava/lang/Object;
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Lorg/apache/tools/ant/Task;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/apache/tools/ant/Task;

    return-object v3
.end method

.method public getUnless()Ljava/lang/String;
    .locals 2

    .prologue
    .line 320
    const-string/jumbo v0, ""

    iget-object v1, p0, Lorg/apache/tools/ant/Target;->unlessCondition:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->unlessCondition:Ljava/lang/String;

    goto :goto_0
.end method

.method public final performTasks()V
    .locals 4

    .prologue
    .line 410
    const/4 v1, 0x0

    .line 411
    .local v1, "thrown":Ljava/lang/RuntimeException;
    iget-object v2, p0, Lorg/apache/tools/ant/Target;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v2, p0}, Lorg/apache/tools/ant/Project;->fireTargetStarted(Lorg/apache/tools/ant/Target;)V

    .line 413
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/Target;->execute()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 418
    iget-object v2, p0, Lorg/apache/tools/ant/Target;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v2, p0, v1}, Lorg/apache/tools/ant/Project;->fireTargetFinished(Lorg/apache/tools/ant/Target;Ljava/lang/Throwable;)V

    .line 420
    return-void

    .line 414
    :catch_0
    move-exception v0

    .line 415
    .local v0, "exc":Ljava/lang/RuntimeException;
    move-object v1, v0

    .line 416
    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 418
    .end local v0    # "exc":Ljava/lang/RuntimeException;
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lorg/apache/tools/ant/Target;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v3, p0, v1}, Lorg/apache/tools/ant/Project;->fireTargetFinished(Lorg/apache/tools/ant/Target;Ljava/lang/Throwable;)V

    throw v2
.end method

.method replaceChild(Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/RuntimeConfigurable;)V
    .locals 2
    .param p1, "el"    # Lorg/apache/tools/ant/Task;
    .param p2, "o"    # Lorg/apache/tools/ant/RuntimeConfigurable;

    .prologue
    .line 432
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .local v0, "index":I
    if-ltz v0, :cond_0

    .line 433
    iget-object v1, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    invoke-interface {v1, v0, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 435
    :cond_0
    return-void
.end method

.method replaceChild(Lorg/apache/tools/ant/Task;Lorg/apache/tools/ant/Task;)V
    .locals 2
    .param p1, "el"    # Lorg/apache/tools/ant/Task;
    .param p2, "o"    # Lorg/apache/tools/ant/Task;

    .prologue
    .line 447
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .local v0, "index":I
    if-ltz v0, :cond_0

    .line 448
    iget-object v1, p0, Lorg/apache/tools/ant/Target;->children:Ljava/util/List;

    invoke-interface {v1, v0, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 450
    :cond_0
    return-void
.end method

.method public setDepends(Ljava/lang/String;)V
    .locals 3
    .param p1, "depS"    # Ljava/lang/String;

    .prologue
    .line 132
    invoke-virtual {p0}, Lorg/apache/tools/ant/Target;->getName()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "depends"

    invoke-static {p1, v1, v2}, Lorg/apache/tools/ant/Target;->parseDepends(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 133
    .local v0, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 134
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/Target;->addDependency(Ljava/lang/String;)V

    goto :goto_0

    .line 136
    :cond_0
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 331
    iput-object p1, p0, Lorg/apache/tools/ant/Target;->description:Ljava/lang/String;

    .line 332
    return-void
.end method

.method public setIf(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 281
    if-nez p1, :cond_0

    const-string/jumbo p1, ""

    .end local p1    # "property":Ljava/lang/String;
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/Target;->ifCondition:Ljava/lang/String;

    .line 282
    return-void
.end method

.method public setLocation(Lorg/apache/tools/ant/Location;)V
    .locals 0
    .param p1, "location"    # Lorg/apache/tools/ant/Location;

    .prologue
    .line 111
    iput-object p1, p0, Lorg/apache/tools/ant/Target;->location:Lorg/apache/tools/ant/Location;

    .line 112
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 183
    iput-object p1, p0, Lorg/apache/tools/ant/Target;->name:Ljava/lang/String;

    .line 184
    return-void
.end method

.method public setProject(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 91
    iput-object p1, p0, Lorg/apache/tools/ant/Target;->project:Lorg/apache/tools/ant/Project;

    .line 92
    return-void
.end method

.method public setUnless(Ljava/lang/String;)V
    .locals 0
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 309
    if-nez p1, :cond_0

    const-string/jumbo p1, ""

    .end local p1    # "property":Ljava/lang/String;
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/Target;->unlessCondition:Ljava/lang/String;

    .line 310
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 351
    iget-object v0, p0, Lorg/apache/tools/ant/Target;->name:Ljava/lang/String;

    return-object v0
.end method
