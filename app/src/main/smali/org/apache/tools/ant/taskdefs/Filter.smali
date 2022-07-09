.class public Lorg/apache/tools/ant/taskdefs/Filter;
.super Lorg/apache/tools/ant/Task;
.source "Filter.java"


# instance fields
.field private filtersFile:Ljava/io/File;

.field private token:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/apache/tools/ant/Task;-><init>()V

    return-void
.end method


# virtual methods
.method public execute()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 72
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Filter;->filtersFile:Ljava/io/File;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Filter;->token:Ljava/lang/String;

    if-nez v4, :cond_0

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Filter;->value:Ljava/lang/String;

    if-nez v4, :cond_0

    move v0, v2

    .line 74
    .local v0, "isFiltersFromFile":Z
    :goto_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Filter;->filtersFile:Ljava/io/File;

    if-nez v4, :cond_1

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Filter;->token:Ljava/lang/String;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Filter;->value:Ljava/lang/String;

    if-eqz v4, :cond_1

    move v1, v2

    .line 77
    .local v1, "isSingleFilter":Z
    :goto_1
    if-nez v0, :cond_2

    if-nez v1, :cond_2

    .line 78
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "both token and value parameters, or only a filtersFile parameter is required"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Filter;->getLocation()Lorg/apache/tools/ant/Location;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;Lorg/apache/tools/ant/Location;)V

    throw v2

    .end local v0    # "isFiltersFromFile":Z
    .end local v1    # "isSingleFilter":Z
    :cond_0
    move v0, v3

    .line 72
    goto :goto_0

    .restart local v0    # "isFiltersFromFile":Z
    :cond_1
    move v1, v3

    .line 74
    goto :goto_1

    .line 83
    .restart local v1    # "isSingleFilter":Z
    :cond_2
    if-eqz v1, :cond_3

    .line 84
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Filter;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v2}, Lorg/apache/tools/ant/Project;->getGlobalFilterSet()Lorg/apache/tools/ant/types/FilterSet;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/Filter;->token:Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/Filter;->value:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/apache/tools/ant/types/FilterSet;->addFilter(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    :cond_3
    if-eqz v0, :cond_4

    .line 88
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Filter;->readFilters()V

    .line 90
    :cond_4
    return-void
.end method

.method protected readFilters()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 97
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "Reading filters from "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Filter;->filtersFile:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/Filter;->log(Ljava/lang/String;I)V

    .line 98
    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Filter;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/Project;->getGlobalFilterSet()Lorg/apache/tools/ant/types/FilterSet;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/Filter;->filtersFile:Ljava/io/File;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/FilterSet;->readFiltersFromFile(Ljava/io/File;)V

    .line 99
    return-void
.end method

.method public setFiltersfile(Ljava/io/File;)V
    .locals 0
    .param p1, "filtersFile"    # Ljava/io/File;

    .prologue
    .line 64
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Filter;->filtersFile:Ljava/io/File;

    .line 65
    return-void
.end method

.method public setToken(Ljava/lang/String;)V
    .locals 0
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 46
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Filter;->token:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 54
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Filter;->value:Ljava/lang/String;

    .line 55
    return-void
.end method
