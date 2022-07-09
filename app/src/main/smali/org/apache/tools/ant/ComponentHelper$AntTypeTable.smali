.class Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;
.super Ljava/util/Hashtable;
.source "ComponentHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/ComponentHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AntTypeTable"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x2a78e01357a658fcL


# instance fields
.field private project:Lorg/apache/tools/ant/Project;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p1, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 1095
    invoke-direct {p0}, Ljava/util/Hashtable;-><init>()V

    .line 1096
    iput-object p1, p0, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->project:Lorg/apache/tools/ant/Project;

    .line 1097
    return-void
.end method


# virtual methods
.method public declared-synchronized contains(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "clazz"    # Ljava/lang/Object;

    .prologue
    .line 1118
    monitor-enter p0

    const/4 v0, 0x0

    .line 1119
    .local v0, "found":Z
    :try_start_0
    instance-of v2, p1, Ljava/lang/Class;

    if-eqz v2, :cond_1

    .line 1120
    invoke-virtual {p0}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    if-nez v0, :cond_1

    .line 1121
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/AntTypeDefinition;

    iget-object v3, p0, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v2, v3}, Lorg/apache/tools/ant/AntTypeDefinition;->getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    if-ne v2, p1, :cond_0

    const/4 v0, 0x1

    :goto_1
    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    .line 1124
    .end local v1    # "i":Ljava/util/Iterator;
    :cond_1
    monitor-exit p0

    return v0

    .line 1118
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 1128
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public declared-synchronized findMatches(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 1138
    monitor-enter p0

    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1139
    .local v2, "matches":Ljava/util/ArrayList;
    invoke-virtual {p0}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1140
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/AntTypeDefinition;

    .line 1141
    .local v0, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    invoke-virtual {v0}, Lorg/apache/tools/ant/AntTypeDefinition;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1142
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1138
    .end local v0    # "def":Lorg/apache/tools/ant/AntTypeDefinition;
    .end local v1    # "i":Ljava/util/Iterator;
    .end local v2    # "matches":Ljava/util/ArrayList;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3

    .line 1145
    .restart local v1    # "i":Ljava/util/Iterator;
    .restart local v2    # "matches":Ljava/util/ArrayList;
    :cond_1
    monitor-exit p0

    return-object v2
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 1104
    check-cast p1, Ljava/lang/String;

    .end local p1    # "key":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->getTypeClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method getDefinition(Ljava/lang/String;)Lorg/apache/tools/ant/AntTypeDefinition;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1100
    invoke-super {p0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/AntTypeDefinition;

    return-object v0
.end method

.method getExposedClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1113
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->getDefinition(Ljava/lang/String;)Lorg/apache/tools/ant/AntTypeDefinition;

    move-result-object v0

    .line 1114
    .local v0, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/AntTypeDefinition;->getExposedClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_0
.end method

.method getTypeClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1108
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->getDefinition(Ljava/lang/String;)Lorg/apache/tools/ant/AntTypeDefinition;

    move-result-object v0

    .line 1109
    .local v0, "def":Lorg/apache/tools/ant/AntTypeDefinition;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/ComponentHelper$AntTypeTable;->project:Lorg/apache/tools/ant/Project;

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/AntTypeDefinition;->getTypeClass(Lorg/apache/tools/ant/Project;)Ljava/lang/Class;

    move-result-object v1

    goto :goto_0
.end method
