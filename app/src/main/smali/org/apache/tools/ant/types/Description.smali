.class public Lorg/apache/tools/ant/types/Description;
.super Lorg/apache/tools/ant/types/DataType;
.source "Description.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    return-void
.end method

.method private static concatDescriptions(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/Target;Ljava/lang/StringBuffer;)V
    .locals 7
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "t"    # Lorg/apache/tools/ant/Target;
    .param p2, "description"    # Ljava/lang/StringBuffer;

    .prologue
    .line 91
    if-nez p1, :cond_1

    .line 110
    :cond_0
    return-void

    .line 94
    :cond_1
    const-string/jumbo v6, "description"

    invoke-static {p0, p1, v6}, Lorg/apache/tools/ant/types/Description;->findElementInTarget(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/Target;Ljava/lang/String;)Ljava/util/Vector;

    move-result-object v4

    .line 95
    .local v4, "tasks":Ljava/util/Vector;
    if-eqz v4, :cond_0

    .line 98
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v2

    .line 99
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 100
    invoke-virtual {v4, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/Task;

    .line 101
    .local v3, "task":Lorg/apache/tools/ant/Task;
    instance-of v6, v3, Lorg/apache/tools/ant/UnknownElement;

    if-nez v6, :cond_3

    .line 99
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    move-object v5, v3

    .line 104
    check-cast v5, Lorg/apache/tools/ant/UnknownElement;

    .line 105
    .local v5, "ue":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v5}, Lorg/apache/tools/ant/UnknownElement;->getWrapper()Lorg/apache/tools/ant/RuntimeConfigurable;

    move-result-object v6

    invoke-virtual {v6}, Lorg/apache/tools/ant/RuntimeConfigurable;->getText()Ljava/lang/StringBuffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 106
    .local v0, "descComp":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 107
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1
.end method

.method private static findElementInTarget(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/Target;Ljava/lang/String;)Ljava/util/Vector;
    .locals 4
    .param p0, "project"    # Lorg/apache/tools/ant/Project;
    .param p1, "t"    # Lorg/apache/tools/ant/Target;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 114
    invoke-virtual {p1}, Lorg/apache/tools/ant/Target;->getTasks()[Lorg/apache/tools/ant/Task;

    move-result-object v2

    .line 115
    .local v2, "tasks":[Lorg/apache/tools/ant/Task;
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 116
    .local v0, "elems":Ljava/util/Vector;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v2

    if-ge v1, v3, :cond_1

    .line 117
    aget-object v3, v2, v1

    invoke-virtual {v3}, Lorg/apache/tools/ant/Task;->getTaskName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 118
    aget-object v3, v2, v1

    invoke-virtual {v0, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 116
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 121
    :cond_1
    return-object v0
.end method

.method public static getDescription(Lorg/apache/tools/ant/Project;)Ljava/lang/String;
    .locals 6
    .param p0, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 76
    const-string/jumbo v5, "ant.targets"

    invoke-virtual {p0, v5}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Vector;

    .line 77
    .local v4, "targets":Ljava/util/Vector;
    if-nez v4, :cond_0

    .line 78
    const/4 v5, 0x0

    .line 86
    :goto_0
    return-object v5

    .line 80
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 81
    .local v0, "description":Ljava/lang/StringBuffer;
    invoke-virtual {v4}, Ljava/util/Vector;->size()I

    move-result v2

    .line 82
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v2, :cond_1

    .line 83
    invoke-virtual {v4, v1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/Target;

    .line 84
    .local v3, "t":Lorg/apache/tools/ant/Target;
    invoke-static {p0, v3, v0}, Lorg/apache/tools/ant/types/Description;->concatDescriptions(Lorg/apache/tools/ant/Project;Lorg/apache/tools/ant/Target;Ljava/lang/StringBuffer;)V

    .line 82
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 86
    .end local v3    # "t":Lorg/apache/tools/ant/Target;
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_0
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Description;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    const-string/jumbo v3, "ant.projectHelper"

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/ProjectHelper;

    .line 54
    .local v1, "ph":Lorg/apache/tools/ant/ProjectHelper;
    instance-of v2, v1, Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    if-nez v2, :cond_0

    .line 65
    :goto_0
    return-void

    .line 59
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Description;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Project;->getDescription()Ljava/lang/String;

    move-result-object v0

    .line 60
    .local v0, "currentDescription":Ljava/lang/String;
    if-nez v0, :cond_1

    .line 61
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Description;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/apache/tools/ant/Project;->setDescription(Ljava/lang/String;)V

    goto :goto_0

    .line 63
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Description;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/Project;->setDescription(Ljava/lang/String;)V

    goto :goto_0
.end method
