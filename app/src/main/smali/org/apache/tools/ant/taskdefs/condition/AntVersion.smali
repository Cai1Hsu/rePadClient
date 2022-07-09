.class public Lorg/apache/tools/ant/taskdefs/condition/AntVersion;
.super Lorg/apache/tools/ant/Task;
.source "AntVersion.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field private atLeast:Ljava/lang/String;

.field private exactly:Ljava/lang/String;

.field private propertyname:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 29
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    .line 31
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->atLeast:Ljava/lang/String;

    .line 32
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->exactly:Ljava/lang/String;

    .line 33
    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->propertyname:Ljava/lang/String;

    return-void
.end method

.method private getVersion()Lorg/apache/tools/ant/util/DeweyDecimal;
    .locals 7

    .prologue
    .line 99
    new-instance v2, Lorg/apache/tools/ant/Project;

    invoke-direct {v2}, Lorg/apache/tools/ant/Project;-><init>()V

    .line 100
    .local v2, "p":Lorg/apache/tools/ant/Project;
    invoke-virtual {v2}, Lorg/apache/tools/ant/Project;->init()V

    .line 101
    const-string/jumbo v5, "ant.version"

    invoke-virtual {v2, v5}, Lorg/apache/tools/ant/Project;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    .line 102
    .local v4, "versionString":[C
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 103
    .local v3, "sb":Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .line 104
    .local v0, "foundFirstDigit":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v5, v4

    if-ge v1, v5, :cond_2

    .line 105
    aget-char v5, v4, v1

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 106
    aget-char v5, v4, v1

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 107
    const/4 v0, 0x1

    .line 109
    :cond_0
    aget-char v5, v4, v1

    const/16 v6, 0x2e

    if-ne v5, v6, :cond_1

    if-eqz v0, :cond_1

    .line 110
    aget-char v5, v4, v1

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 112
    :cond_1
    aget-char v5, v4, v1

    invoke-static {v5}, Ljava/lang/Character;->isLetter(C)Z

    move-result v5

    if-eqz v5, :cond_3

    if-eqz v0, :cond_3

    .line 116
    :cond_2
    new-instance v5, Lorg/apache/tools/ant/util/DeweyDecimal;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lorg/apache/tools/ant/util/DeweyDecimal;-><init>(Ljava/lang/String;)V

    return-object v5

    .line 104
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private validate()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->atLeast:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->exactly:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 74
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Only one of atleast or exactly may be set."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 76
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->atLeast:Ljava/lang/String;

    if-nez v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->exactly:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 77
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "One of atleast or exactly must be set."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 79
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->atLeast:Ljava/lang/String;

    if-eqz v1, :cond_2

    .line 81
    :try_start_0
    new-instance v1, Lorg/apache/tools/ant/util/DeweyDecimal;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->atLeast:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/util/DeweyDecimal;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    :goto_0
    return-void

    .line 82
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The \'atleast\' attribute is not a Dewey Decimal eg 1.1.0 : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->atLeast:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 89
    .end local v0    # "e":Ljava/lang/NumberFormatException;
    :cond_2
    :try_start_1
    new-instance v1, Lorg/apache/tools/ant/util/DeweyDecimal;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->exactly:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/util/DeweyDecimal;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 90
    :catch_1
    move-exception v0

    .line 91
    .restart local v0    # "e":Ljava/lang/NumberFormatException;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "The \'exactly\' attribute is not a Dewey Decimal eg 1.1.0 : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->exactly:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public eval()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->validate()V

    .line 61
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->getVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v0

    .line 62
    .local v0, "actual":Lorg/apache/tools/ant/util/DeweyDecimal;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->atLeast:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 63
    new-instance v1, Lorg/apache/tools/ant/util/DeweyDecimal;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->atLeast:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/util/DeweyDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/DeweyDecimal;->isGreaterThanOrEqual(Lorg/apache/tools/ant/util/DeweyDecimal;)Z

    move-result v1

    .line 69
    :goto_0
    return v1

    .line 65
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->exactly:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 66
    new-instance v1, Lorg/apache/tools/ant/util/DeweyDecimal;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->exactly:Ljava/lang/String;

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/util/DeweyDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/DeweyDecimal;->isEqual(Lorg/apache/tools/ant/util/DeweyDecimal;)Z

    move-result v1

    goto :goto_0

    .line 69
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public execute()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 40
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->propertyname:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 41
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "\'property\' must be set."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->atLeast:Ljava/lang/String;

    if-nez v0, :cond_1

    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->exactly:Ljava/lang/String;

    if-eqz v0, :cond_3

    .line 45
    :cond_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->eval()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 46
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->propertyname:Ljava/lang/String;

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->getVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/util/DeweyDecimal;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    :cond_2
    :goto_0
    return-void

    .line 50
    :cond_3
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->propertyname:Ljava/lang/String;

    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->getVersion()Lorg/apache/tools/ant/util/DeweyDecimal;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/util/DeweyDecimal;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getAtLeast()Ljava/lang/String;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->atLeast:Ljava/lang/String;

    return-object v0
.end method

.method public getExactly()Ljava/lang/String;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->exactly:Ljava/lang/String;

    return-object v0
.end method

.method public getProperty()Ljava/lang/String;
    .locals 1

    .prologue
    .line 160
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->propertyname:Ljava/lang/String;

    return-object v0
.end method

.method public setAtLeast(Ljava/lang/String;)V
    .locals 0
    .param p1, "atLeast"    # Ljava/lang/String;

    .prologue
    .line 134
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->atLeast:Ljava/lang/String;

    .line 135
    return-void
.end method

.method public setExactly(Ljava/lang/String;)V
    .locals 0
    .param p1, "exactly"    # Ljava/lang/String;

    .prologue
    .line 152
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->exactly:Ljava/lang/String;

    .line 153
    return-void
.end method

.method public setProperty(Ljava/lang/String;)V
    .locals 0
    .param p1, "propertyname"    # Ljava/lang/String;

    .prologue
    .line 168
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/AntVersion;->propertyname:Ljava/lang/String;

    .line 169
    return-void
.end method
