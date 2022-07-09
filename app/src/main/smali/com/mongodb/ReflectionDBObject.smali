.class public abstract Lcom/mongodb/ReflectionDBObject;
.super Ljava/lang/Object;
.source "ReflectionDBObject.java"

# interfaces
.implements Lcom/mongodb/DBObject;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/ReflectionDBObject$FieldInfo;,
        Lcom/mongodb/ReflectionDBObject$JavaWrapper;
    }
.end annotation


# static fields
.field private static final IGNORE_FIELDS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final _wrappers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class;",
            "Lcom/mongodb/ReflectionDBObject$JavaWrapper;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field _id:Ljava/lang/Object;

.field _wrapper:Lcom/mongodb/ReflectionDBObject$JavaWrapper;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 278
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/mongodb/ReflectionDBObject;->_wrappers:Ljava/util/Map;

    .line 279
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/mongodb/ReflectionDBObject;->IGNORE_FIELDS:Ljava/util/Set;

    .line 281
    sget-object v0, Lcom/mongodb/ReflectionDBObject;->IGNORE_FIELDS:Ljava/util/Set;

    const-string/jumbo v1, "Int"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 282
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 235
    return-void
.end method

.method static synthetic access$000()Ljava/util/Set;
    .locals 1

    .prologue
    .line 35
    sget-object v0, Lcom/mongodb/ReflectionDBObject;->IGNORE_FIELDS:Ljava/util/Set;

    return-object v0
.end method

.method public static getWrapper(Ljava/lang/Class;)Lcom/mongodb/ReflectionDBObject$JavaWrapper;
    .locals 2
    .param p0, "c"    # Ljava/lang/Class;

    .prologue
    .line 270
    sget-object v1, Lcom/mongodb/ReflectionDBObject;->_wrappers:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    .line 271
    .local v0, "w":Lcom/mongodb/ReflectionDBObject$JavaWrapper;
    if-nez v0, :cond_0

    .line 272
    new-instance v0, Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    .end local v0    # "w":Lcom/mongodb/ReflectionDBObject$JavaWrapper;
    invoke-direct {v0, p0}, Lcom/mongodb/ReflectionDBObject$JavaWrapper;-><init>(Ljava/lang/Class;)V

    .line 273
    .restart local v0    # "w":Lcom/mongodb/ReflectionDBObject$JavaWrapper;
    sget-object v1, Lcom/mongodb/ReflectionDBObject;->_wrappers:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    :cond_0
    return-object v0
.end method

.method public static getWrapperIfReflectionObject(Ljava/lang/Class;)Lcom/mongodb/ReflectionDBObject$JavaWrapper;
    .locals 1
    .param p0, "c"    # Ljava/lang/Class;

    .prologue
    .line 259
    const-class v0, Lcom/mongodb/ReflectionDBObject;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 260
    invoke-static {p0}, Lcom/mongodb/ReflectionDBObject;->getWrapper(Ljava/lang/Class;)Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    move-result-object v0

    .line 261
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public containsField(Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 54
    invoke-virtual {p0}, Lcom/mongodb/ReflectionDBObject;->getWrapper()Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->containsKey(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public containsKey(Ljava/lang/String;)Z
    .locals 1
    .param p1, "s"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 50
    invoke-virtual {p0, p1}, Lcom/mongodb/ReflectionDBObject;->containsField(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public get(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/mongodb/ReflectionDBObject;->getWrapper()Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->get(Lcom/mongodb/ReflectionDBObject;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getWrapper()Lcom/mongodb/ReflectionDBObject$JavaWrapper;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/mongodb/ReflectionDBObject;->_wrapper:Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/mongodb/ReflectionDBObject;->_wrapper:Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    .line 126
    :goto_0
    return-object v0

    .line 125
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/mongodb/ReflectionDBObject;->getWrapper(Ljava/lang/Class;)Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ReflectionDBObject;->_wrapper:Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    .line 126
    iget-object v0, p0, Lcom/mongodb/ReflectionDBObject;->_wrapper:Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    goto :goto_0
.end method

.method public get_id()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/mongodb/ReflectionDBObject;->_id:Ljava/lang/Object;

    return-object v0
.end method

.method public isPartialObject()Z
    .locals 1

    .prologue
    .line 91
    const/4 v0, 0x0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/mongodb/ReflectionDBObject;->getWrapper()Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public markAsPartialObject()V
    .locals 2

    .prologue
    .line 109
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "ReflectionDBObjects can\'t be partial"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "v"    # Ljava/lang/Object;

    .prologue
    .line 58
    invoke-virtual {p0}, Lcom/mongodb/ReflectionDBObject;->getWrapper()Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->set(Lcom/mongodb/ReflectionDBObject;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 4
    .param p1, "m"    # Ljava/util/Map;

    .prologue
    .line 63
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 64
    .local v0, "entry":Ljava/util/Map$Entry;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/mongodb/ReflectionDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 66
    .end local v0    # "entry":Ljava/util/Map$Entry;
    :cond_0
    return-void
.end method

.method public putAll(Lorg/bson/BSONObject;)V
    .locals 3
    .param p1, "o"    # Lorg/bson/BSONObject;

    .prologue
    .line 69
    invoke-interface {p1}, Lorg/bson/BSONObject;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 70
    .local v1, "k":Ljava/lang/String;
    invoke-interface {p1, v1}, Lorg/bson/BSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lcom/mongodb/ReflectionDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 72
    .end local v1    # "k":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public removeField(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 118
    new-instance v0, Ljava/lang/RuntimeException;

    const-string/jumbo v1, "can\'t remove from a ReflectionDBObject"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public set_id(Ljava/lang/Object;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/Object;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/mongodb/ReflectionDBObject;->_id:Ljava/lang/Object;

    .line 88
    return-void
.end method

.method public toMap()Ljava/util/Map;
    .locals 5

    .prologue
    .line 96
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 97
    .local v1, "m":Ljava/util/Map;
    invoke-virtual {p0}, Lcom/mongodb/ReflectionDBObject;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 98
    .local v0, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 99
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 100
    .local v2, "s":Ljava/lang/Object;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mongodb/ReflectionDBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 102
    .end local v2    # "s":Ljava/lang/Object;
    :cond_0
    return-object v1
.end method
