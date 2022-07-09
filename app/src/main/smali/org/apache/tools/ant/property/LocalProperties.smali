.class public Lorg/apache/tools/ant/property/LocalProperties;
.super Ljava/lang/InheritableThreadLocal;
.source "LocalProperties.java"

# interfaces
.implements Lorg/apache/tools/ant/PropertyHelper$PropertyEvaluator;
.implements Lorg/apache/tools/ant/PropertyHelper$PropertySetter;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/InheritableThreadLocal;-><init>()V

    .line 59
    return-void
.end method

.method private current()Lorg/apache/tools/ant/property/LocalPropertyStack;
    .locals 1

    .prologue
    .line 70
    invoke-virtual {p0}, Lorg/apache/tools/ant/property/LocalProperties;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/property/LocalPropertyStack;

    return-object v0
.end method

.method public static declared-synchronized get(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/property/LocalProperties;
    .locals 3
    .param p0, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 39
    const-class v2, Lorg/apache/tools/ant/property/LocalProperties;

    monitor-enter v2

    :try_start_0
    const-string/jumbo v1, "ant.LocalProperties"

    invoke-virtual {p0, v1}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/property/LocalProperties;

    .line 41
    .local v0, "l":Lorg/apache/tools/ant/property/LocalProperties;
    if-nez v0, :cond_0

    .line 42
    new-instance v0, Lorg/apache/tools/ant/property/LocalProperties;

    .end local v0    # "l":Lorg/apache/tools/ant/property/LocalProperties;
    invoke-direct {v0}, Lorg/apache/tools/ant/property/LocalProperties;-><init>()V

    .line 43
    .restart local v0    # "l":Lorg/apache/tools/ant/property/LocalProperties;
    const-string/jumbo v1, "ant.LocalProperties"

    invoke-virtual {p0, v1, v0}, Lorg/apache/tools/ant/Project;->addReference(Ljava/lang/String;Ljava/lang/Object;)V

    .line 44
    invoke-static {p0}, Lorg/apache/tools/ant/PropertyHelper;->getPropertyHelper(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/PropertyHelper;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/tools/ant/PropertyHelper;->add(Lorg/apache/tools/ant/PropertyHelper$Delegate;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :cond_0
    monitor-exit v2

    return-object v0

    .line 39
    .end local v0    # "l":Lorg/apache/tools/ant/property/LocalProperties;
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method


# virtual methods
.method public addLocal(Ljava/lang/String;)V
    .locals 1
    .param p1, "property"    # Ljava/lang/String;

    .prologue
    .line 84
    invoke-direct {p0}, Lorg/apache/tools/ant/property/LocalProperties;->current()Lorg/apache/tools/ant/property/LocalPropertyStack;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/property/LocalPropertyStack;->addLocal(Ljava/lang/String;)V

    .line 85
    return-void
.end method

.method public copy()V
    .locals 1

    .prologue
    .line 108
    invoke-direct {p0}, Lorg/apache/tools/ant/property/LocalProperties;->current()Lorg/apache/tools/ant/property/LocalPropertyStack;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/property/LocalPropertyStack;->copy()Lorg/apache/tools/ant/property/LocalPropertyStack;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/property/LocalProperties;->set(Ljava/lang/Object;)V

    .line 109
    return-void
.end method

.method public enterScope()V
    .locals 1

    .prologue
    .line 89
    invoke-direct {p0}, Lorg/apache/tools/ant/property/LocalProperties;->current()Lorg/apache/tools/ant/property/LocalPropertyStack;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/property/LocalPropertyStack;->enterScope()V

    .line 90
    return-void
.end method

.method public evaluate(Ljava/lang/String;Lorg/apache/tools/ant/PropertyHelper;)Ljava/lang/Object;
    .locals 1
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "helper"    # Lorg/apache/tools/ant/PropertyHelper;

    .prologue
    .line 124
    invoke-direct {p0}, Lorg/apache/tools/ant/property/LocalProperties;->current()Lorg/apache/tools/ant/property/LocalPropertyStack;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/property/LocalPropertyStack;->evaluate(Ljava/lang/String;Lorg/apache/tools/ant/PropertyHelper;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public exitScope()V
    .locals 1

    .prologue
    .line 94
    invoke-direct {p0}, Lorg/apache/tools/ant/property/LocalProperties;->current()Lorg/apache/tools/ant/property/LocalPropertyStack;

    move-result-object v0

    invoke-virtual {v0}, Lorg/apache/tools/ant/property/LocalPropertyStack;->exitScope()V

    .line 95
    return-void
.end method

.method protected declared-synchronized initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 66
    monitor-enter p0

    :try_start_0
    new-instance v0, Lorg/apache/tools/ant/property/LocalPropertyStack;

    invoke-direct {v0}, Lorg/apache/tools/ant/property/LocalPropertyStack;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;Lorg/apache/tools/ant/PropertyHelper;)Z
    .locals 1
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "propertyHelper"    # Lorg/apache/tools/ant/PropertyHelper;

    .prologue
    .line 148
    invoke-direct {p0}, Lorg/apache/tools/ant/property/LocalProperties;->current()Lorg/apache/tools/ant/property/LocalPropertyStack;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/property/LocalPropertyStack;->set(Ljava/lang/String;Ljava/lang/Object;Lorg/apache/tools/ant/PropertyHelper;)Z

    move-result v0

    return v0
.end method

.method public setNew(Ljava/lang/String;Ljava/lang/Object;Lorg/apache/tools/ant/PropertyHelper;)Z
    .locals 1
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .param p3, "propertyHelper"    # Lorg/apache/tools/ant/PropertyHelper;

    .prologue
    .line 136
    invoke-direct {p0}, Lorg/apache/tools/ant/property/LocalProperties;->current()Lorg/apache/tools/ant/property/LocalPropertyStack;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/property/LocalPropertyStack;->setNew(Ljava/lang/String;Ljava/lang/Object;Lorg/apache/tools/ant/PropertyHelper;)Z

    move-result v0

    return v0
.end method
