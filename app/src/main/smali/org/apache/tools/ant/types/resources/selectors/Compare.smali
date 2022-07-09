.class public Lorg/apache/tools/ant/types/resources/selectors/Compare;
.super Lorg/apache/tools/ant/types/DataType;
.source "Compare.java"

# interfaces
.implements Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;


# static fields
.field private static final ONE_CONTROL_MESSAGE:Ljava/lang/String; = " the <control> element should be specified exactly once."


# instance fields
.field private against:Lorg/apache/tools/ant/types/Quantifier;

.field private comp:Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

.field private control:Lorg/apache/tools/ant/types/resources/Union;

.field private when:Lorg/apache/tools/ant/types/Comparison;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 44
    new-instance v0, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->comp:Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

    .line 45
    sget-object v0, Lorg/apache/tools/ant/types/Quantifier;->ALL:Lorg/apache/tools/ant/types/Quantifier;

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->against:Lorg/apache/tools/ant/types/Quantifier;

    .line 47
    sget-object v0, Lorg/apache/tools/ant/types/Comparison;->EQUAL:Lorg/apache/tools/ant/types/Comparison;

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->when:Lorg/apache/tools/ant/types/Comparison;

    return-void
.end method

.method private oneControl()Lorg/apache/tools/ant/BuildException;
    .locals 3

    .prologue
    .line 148
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-super {p0}, Lorg/apache/tools/ant/types/DataType;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " the <control> element should be specified exactly once."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public declared-synchronized add(Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)V
    .locals 1
    .param p1, "c"    # Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    .prologue
    .line 57
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 60
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->comp:Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->add(Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)V

    .line 61
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->setChecked(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized createControl()Lorg/apache/tools/ant/types/ResourceCollection;
    .locals 1

    .prologue
    .line 92
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 93
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 95
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->control:Lorg/apache/tools/ant/types/resources/Union;

    if-eqz v0, :cond_1

    .line 96
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->oneControl()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 98
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/types/resources/Union;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/resources/Union;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->control:Lorg/apache/tools/ant/types/resources/Union;

    .line 99
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->setChecked(Z)V

    .line 100
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->control:Lorg/apache/tools/ant/types/resources/Union;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0
.end method

.method protected declared-synchronized dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 133
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->isChecked()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    :goto_0
    monitor-exit p0

    return-void

    .line 136
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 137
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 133
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 139
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->control:Lorg/apache/tools/ant/types/resources/Union;

    if-eqz v0, :cond_2

    .line 140
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->control:Lorg/apache/tools/ant/types/resources/Union;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 142
    :cond_2
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->comp:Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 143
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->setChecked(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    .locals 6
    .param p1, "r"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 106
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->isReference()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 107
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->getCheckedRef()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;

    invoke-interface {v3, p1}, Lorg/apache/tools/ant/types/resources/selectors/ResourceSelector;->isSelected(Lorg/apache/tools/ant/types/Resource;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    .line 121
    :goto_0
    monitor-exit p0

    return v3

    .line 109
    :cond_0
    :try_start_1
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->control:Lorg/apache/tools/ant/types/resources/Union;

    if-nez v3, :cond_1

    .line 110
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->oneControl()Lorg/apache/tools/ant/BuildException;

    move-result-object v3

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 112
    :cond_1
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->dieOnCircularReference()V

    .line 113
    const/4 v2, 0x0

    .local v2, "t":I
    const/4 v0, 0x0

    .line 114
    .local v0, "f":I
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->control:Lorg/apache/tools/ant/types/resources/Union;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/resources/Union;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 115
    iget-object v4, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->when:Lorg/apache/tools/ant/types/Comparison;

    iget-object v5, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->comp:Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/apache/tools/ant/types/Resource;

    invoke-virtual {v5, p1, v3}, Lorg/apache/tools/ant/types/resources/comparators/DelegatedResourceComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3

    invoke-virtual {v4, v3}, Lorg/apache/tools/ant/types/Comparison;->evaluate(I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 116
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 118
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 121
    :cond_3
    iget-object v3, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->against:Lorg/apache/tools/ant/types/Quantifier;

    invoke-virtual {v3, v2, v0}, Lorg/apache/tools/ant/types/Quantifier;->evaluate(II)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v3

    goto :goto_0
.end method

.method public declared-synchronized setAgainst(Lorg/apache/tools/ant/types/Quantifier;)V
    .locals 1
    .param p1, "against"    # Lorg/apache/tools/ant/types/Quantifier;

    .prologue
    .line 69
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 72
    :cond_0
    :try_start_1
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->against:Lorg/apache/tools/ant/types/Quantifier;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    monitor-exit p0

    return-void
.end method

.method public declared-synchronized setWhen(Lorg/apache/tools/ant/types/Comparison;)V
    .locals 1
    .param p1, "when"    # Lorg/apache/tools/ant/types/Comparison;

    .prologue
    .line 80
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 81
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/selectors/Compare;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 83
    :cond_0
    :try_start_1
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/selectors/Compare;->when:Lorg/apache/tools/ant/types/Comparison;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    monitor-exit p0

    return-void
.end method
