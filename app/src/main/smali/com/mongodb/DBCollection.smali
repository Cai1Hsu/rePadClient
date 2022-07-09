.class public abstract Lcom/mongodb/DBCollection;
.super Ljava/lang/Object;
.source "DBCollection.java"


# instance fields
.field private _concern:Lcom/mongodb/WriteConcern;

.field private final _createdIndexes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field final _db:Lcom/mongodb/DB;

.field private _decoderFactory:Lcom/mongodb/DBDecoderFactory;

.field private _encoderFactory:Lcom/mongodb/DBEncoderFactory;

.field protected final _fullName:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected _hintFields:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private _internalClass:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field

.field protected final _name:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected _objectClass:Ljava/lang/Class;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field final _options:Lcom/mongodb/Bytes$OptionHolder;

.field private _readPref:Lcom/mongodb/ReadPreference;

.field private _wrapper:Lcom/mongodb/ReflectionDBObject$JavaWrapper;


# direct methods
.method protected constructor <init>(Lcom/mongodb/DB;Ljava/lang/String;)V
    .locals 2
    .param p1, "base"    # Lcom/mongodb/DB;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 1765
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2122
    iput-object v1, p0, Lcom/mongodb/DBCollection;->_concern:Lcom/mongodb/WriteConcern;

    .line 2123
    iput-object v1, p0, Lcom/mongodb/DBCollection;->_readPref:Lcom/mongodb/ReadPreference;

    .line 2131
    iput-object v1, p0, Lcom/mongodb/DBCollection;->_objectClass:Ljava/lang/Class;

    .line 2133
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBCollection;->_internalClass:Ljava/util/Map;

    .line 2134
    iput-object v1, p0, Lcom/mongodb/DBCollection;->_wrapper:Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    .line 2139
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/mongodb/DBCollection;->_createdIndexes:Ljava/util/Set;

    .line 1766
    iput-object p1, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    .line 1767
    iput-object p2, p0, Lcom/mongodb/DBCollection;->_name:Ljava/lang/String;

    .line 1768
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {v1}, Lcom/mongodb/DB;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBCollection;->_fullName:Ljava/lang/String;

    .line 1769
    new-instance v0, Lcom/mongodb/Bytes$OptionHolder;

    iget-object v1, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    iget-object v1, v1, Lcom/mongodb/DB;->_options:Lcom/mongodb/Bytes$OptionHolder;

    invoke-direct {v0, v1}, Lcom/mongodb/Bytes$OptionHolder;-><init>(Lcom/mongodb/Bytes$OptionHolder;)V

    iput-object v0, p0, Lcom/mongodb/DBCollection;->_options:Lcom/mongodb/Bytes$OptionHolder;

    .line 1770
    return-void
.end method

.method private _checkKeys(Lcom/mongodb/DBObject;)V
    .locals 3
    .param p1, "o"    # Lcom/mongodb/DBObject;

    .prologue
    .line 1798
    instance-of v2, p1, Lcom/mongodb/LazyDBObject;

    if-nez v2, :cond_0

    instance-of v2, p1, Lcom/mongodb/LazyDBList;

    if-eqz v2, :cond_1

    .line 1805
    :cond_0
    return-void

    .line 1801
    :cond_1
    invoke-interface {p1}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

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

    .line 1802
    .local v1, "s":Ljava/lang/String;
    invoke-direct {p0, v1}, Lcom/mongodb/DBCollection;->validateKey(Ljava/lang/String;)V

    .line 1803
    invoke-interface {p1, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mongodb/DBCollection;->_checkValue(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private _checkKeys(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1811
    .local p1, "o":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
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

    .line 1812
    .local v0, "cur":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/mongodb/DBCollection;->validateKey(Ljava/lang/String;)V

    .line 1813
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/mongodb/DBCollection;->_checkValue(Ljava/lang/Object;)V

    goto :goto_0

    .line 1815
    .end local v0    # "cur":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return-void
.end method

.method private _checkValue(Ljava/lang/Object;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 1824
    instance-of v0, p1, Lcom/mongodb/DBObject;

    if-eqz v0, :cond_1

    .line 1825
    check-cast p1, Lcom/mongodb/DBObject;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollection;->_checkKeys(Lcom/mongodb/DBObject;)V

    .line 1831
    :cond_0
    :goto_0
    return-void

    .line 1826
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_1
    instance-of v0, p1, Ljava/util/Map;

    if-eqz v0, :cond_2

    .line 1827
    check-cast p1, Ljava/util/Map;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollection;->_checkKeys(Ljava/util/Map;)V

    goto :goto_0

    .line 1828
    .restart local p1    # "value":Ljava/lang/Object;
    :cond_2
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_0

    .line 1829
    check-cast p1, Ljava/util/List;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollection;->_checkValues(Ljava/util/List;)V

    goto :goto_0
.end method

.method private _checkValues(Ljava/util/List;)V
    .locals 3
    .param p1, "list"    # Ljava/util/List;

    .prologue
    .line 1818
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 1819
    .local v0, "cur":Ljava/lang/Object;
    invoke-direct {p0, v0}, Lcom/mongodb/DBCollection;->_checkValue(Ljava/lang/Object;)V

    goto :goto_0

    .line 1821
    .end local v0    # "cur":Ljava/lang/Object;
    :cond_0
    return-void
.end method

.method public static genIndexName(Lcom/mongodb/DBObject;)Ljava/lang/String;
    .locals 7
    .param p0, "keys"    # Lcom/mongodb/DBObject;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    const/16 v6, 0x5f

    .line 691
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 692
    .local v1, "name":Ljava/lang/StringBuilder;
    invoke-interface {p0}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 693
    .local v2, "s":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 694
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 695
    :cond_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 696
    invoke-interface {p0, v2}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    .line 697
    .local v3, "val":Ljava/lang/Object;
    instance-of v4, v3, Ljava/lang/Number;

    if-nez v4, :cond_2

    instance-of v4, v3, Ljava/lang/String;

    if-eqz v4, :cond_0

    .line 698
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x20

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 700
    .end local v2    # "s":Ljava/lang/String;
    .end local v3    # "val":Ljava/lang/Object;
    :cond_3
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private getDBEncoder()Lcom/mongodb/DBEncoder;
    .locals 1

    .prologue
    .line 887
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getDBEncoderFactory()Lcom/mongodb/DBEncoderFactory;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getDBEncoderFactory()Lcom/mongodb/DBEncoderFactory;

    move-result-object v0

    invoke-interface {v0}, Lcom/mongodb/DBEncoderFactory;->create()Lcom/mongodb/DBEncoder;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private instantiateObjectClassInstance()Lcom/mongodb/DBObject;
    .locals 4

    .prologue
    .line 487
    :try_start_0
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getObjectClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBObject;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1

    return-object v1

    .line 488
    :catch_0
    move-exception v0

    .line 489
    .local v0, "e":Ljava/lang/InstantiationException;
    new-instance v1, Lcom/mongodb/MongoInternalException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "can\'t create instance of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getObjectClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 490
    .end local v0    # "e":Ljava/lang/InstantiationException;
    :catch_1
    move-exception v0

    .line 491
    .local v0, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Lcom/mongodb/MongoInternalException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "can\'t create instance of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getObjectClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/mongodb/MongoInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private replaceWithObjectClass(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 5
    .param p1, "oldObj"    # Lcom/mongodb/DBObject;

    .prologue
    .line 473
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getObjectClass()Ljava/lang/Class;

    move-result-object v3

    if-nez v3, :cond_2

    const/4 v3, 0x1

    :goto_0
    iget-object v4, p0, Lcom/mongodb/DBCollection;->_internalClass:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    and-int/2addr v3, v4

    if-eqz v3, :cond_3

    :cond_0
    move-object v2, p1

    .line 482
    :cond_1
    return-object v2

    .line 473
    :cond_2
    const/4 v3, 0x0

    goto :goto_0

    .line 477
    :cond_3
    invoke-direct {p0}, Lcom/mongodb/DBCollection;->instantiateObjectClassInstance()Lcom/mongodb/DBObject;

    move-result-object v2

    .line 479
    .local v2, "newObj":Lcom/mongodb/DBObject;
    invoke-interface {p1}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 480
    .local v1, "key":Ljava/lang/String;
    invoke-interface {p1, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v1, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method private validateKey(Ljava/lang/String;)V
    .locals 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 1839
    const-string/jumbo v0, "\u0000"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1840
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Document field names can\'t have a NULL character. (Bad Key: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\')"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1841
    :cond_0
    const-string/jumbo v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1842
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Document field names can\'t have a . in them. (Bad Key: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\')"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1843
    :cond_1
    const-string/jumbo v0, "$"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1844
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Document field names can\'t start with \'$\' (Bad Key: \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\')"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1845
    :cond_2
    return-void
.end method


# virtual methods
.method protected _checkObject(Lcom/mongodb/DBObject;ZZ)Lcom/mongodb/DBObject;
    .locals 2
    .param p1, "o"    # Lcom/mongodb/DBObject;
    .param p2, "canBeNull"    # Z
    .param p3, "query"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1779
    if-nez p1, :cond_2

    .line 1780
    if-eqz p2, :cond_1

    .line 1781
    const/4 p1, 0x0

    .line 1791
    .end local p1    # "o":Lcom/mongodb/DBObject;
    :cond_0
    :goto_0
    return-object p1

    .line 1782
    .restart local p1    # "o":Lcom/mongodb/DBObject;
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "can\'t be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1785
    :cond_2
    invoke-interface {p1}, Lcom/mongodb/DBObject;->isPartialObject()Z

    move-result v0

    if-eqz v0, :cond_3

    if-nez p3, :cond_3

    .line 1786
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "can\'t save partial objects"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1788
    :cond_3
    if-nez p3, :cond_0

    .line 1789
    invoke-direct {p0, p1}, Lcom/mongodb/DBCollection;->_checkKeys(Lcom/mongodb/DBObject;)V

    goto :goto_0
.end method

.method public addOption(I)V
    .locals 1
    .param p1, "option"    # I

    .prologue
    .line 2039
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_options:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0, p1}, Lcom/mongodb/Bytes$OptionHolder;->add(I)V

    .line 2040
    return-void
.end method

.method public varargs aggregate(Lcom/mongodb/DBObject;[Lcom/mongodb/DBObject;)Lcom/mongodb/AggregationOutput;
    .locals 2
    .param p1, "firstOp"    # Lcom/mongodb/DBObject;
    .param p2, "additionalOps"    # [Lcom/mongodb/DBObject;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1517
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1518
    .local v0, "pipeline":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1519
    invoke-static {v0, p2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 1520
    invoke-virtual {p0, v0}, Lcom/mongodb/DBCollection;->aggregate(Ljava/util/List;)Lcom/mongodb/AggregationOutput;

    move-result-object v1

    return-object v1
.end method

.method public aggregate(Ljava/util/List;)Lcom/mongodb/AggregationOutput;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;)",
            "Lcom/mongodb/AggregationOutput;"
        }
    .end annotation

    .prologue
    .line 1533
    .local p1, "pipeline":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->aggregate(Ljava/util/List;Lcom/mongodb/ReadPreference;)Lcom/mongodb/AggregationOutput;

    move-result-object v0

    return-object v0
.end method

.method public aggregate(Ljava/util/List;Lcom/mongodb/ReadPreference;)Lcom/mongodb/AggregationOutput;
    .locals 5
    .param p2, "readPreference"    # Lcom/mongodb/ReadPreference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/ReadPreference;",
            ")",
            "Lcom/mongodb/AggregationOutput;"
        }
    .end annotation

    .prologue
    .line 1547
    .local p1, "pipeline":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    invoke-static {}, Lcom/mongodb/AggregationOptions;->builder()Lcom/mongodb/AggregationOptions$Builder;

    move-result-object v3

    sget-object v4, Lcom/mongodb/AggregationOptions$OutputMode;->INLINE:Lcom/mongodb/AggregationOptions$OutputMode;

    invoke-virtual {v3, v4}, Lcom/mongodb/AggregationOptions$Builder;->outputMode(Lcom/mongodb/AggregationOptions$OutputMode;)Lcom/mongodb/AggregationOptions$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mongodb/AggregationOptions$Builder;->build()Lcom/mongodb/AggregationOptions;

    move-result-object v1

    .line 1551
    .local v1, "options":Lcom/mongodb/AggregationOptions;
    invoke-virtual {p0, p1, v1}, Lcom/mongodb/DBCollection;->prepareCommand(Ljava/util/List;Lcom/mongodb/AggregationOptions;)Lcom/mongodb/DBObject;

    move-result-object v0

    .line 1553
    .local v0, "command":Lcom/mongodb/DBObject;
    iget-object v3, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v4

    invoke-virtual {v3, v0, v4, p2}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v2

    .line 1554
    .local v2, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v2}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 1556
    new-instance v3, Lcom/mongodb/AggregationOutput;

    invoke-direct {v3, v0, v2}, Lcom/mongodb/AggregationOutput;-><init>(Lcom/mongodb/DBObject;Lcom/mongodb/CommandResult;)V

    return-object v3
.end method

.method public aggregate(Ljava/util/List;Lcom/mongodb/AggregationOptions;)Lcom/mongodb/Cursor;
    .locals 1
    .param p2, "options"    # Lcom/mongodb/AggregationOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/AggregationOptions;",
            ")",
            "Lcom/mongodb/Cursor;"
        }
    .end annotation

    .prologue
    .line 1570
    .local p1, "pipeline":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mongodb/DBCollection;->aggregate(Ljava/util/List;Lcom/mongodb/AggregationOptions;Lcom/mongodb/ReadPreference;)Lcom/mongodb/Cursor;

    move-result-object v0

    return-object v0
.end method

.method public abstract aggregate(Ljava/util/List;Lcom/mongodb/AggregationOptions;Lcom/mongodb/ReadPreference;)Lcom/mongodb/Cursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/AggregationOptions;",
            "Lcom/mongodb/ReadPreference;",
            ")",
            "Lcom/mongodb/Cursor;"
        }
    .end annotation
.end method

.method public apply(Lcom/mongodb/DBObject;)Ljava/lang/Object;
    .locals 1
    .param p1, "o"    # Lcom/mongodb/DBObject;

    .prologue
    .line 897
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->apply(Lcom/mongodb/DBObject;Z)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public apply(Lcom/mongodb/DBObject;Z)Ljava/lang/Object;
    .locals 2
    .param p1, "jo"    # Lcom/mongodb/DBObject;
    .param p2, "ensureID"    # Z

    .prologue
    .line 907
    const-string/jumbo v1, "_id"

    invoke-interface {p1, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 908
    .local v0, "id":Ljava/lang/Object;
    if-eqz p2, :cond_0

    if-nez v0, :cond_0

    .line 909
    invoke-static {}, Lorg/bson/types/ObjectId;->get()Lorg/bson/types/ObjectId;

    move-result-object v0

    .line 910
    .local v0, "id":Lorg/bson/types/ObjectId;
    const-string/jumbo v1, "_id"

    invoke-interface {p1, v1, v0}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 913
    .end local v0    # "id":Lorg/bson/types/ObjectId;
    :cond_0
    invoke-virtual {p0, p1}, Lcom/mongodb/DBCollection;->doapply(Lcom/mongodb/DBObject;)V

    .line 915
    return-object v0
.end method

.method protected checkReadOnly(Z)Z
    .locals 2
    .param p1, "strict"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1898
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    iget-boolean v0, v0, Lcom/mongodb/DB;->_readOnly:Z

    if-nez v0, :cond_0

    .line 1899
    const/4 v0, 0x0

    .line 1902
    :goto_0
    return v0

    .line 1901
    :cond_0
    if-nez p1, :cond_1

    .line 1902
    const/4 v0, 0x1

    goto :goto_0

    .line 1904
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "db is read only"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;
    .locals 2
    .param p1, "cmd"    # Lcom/mongodb/DBObject;
    .param p2, "options"    # I
    .param p3, "readPrefs"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 1205
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v1

    invoke-virtual {v0, p1, v1, p3}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public count()J
    .locals 2

    .prologue
    .line 1027
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/DBCollection;->getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)J

    move-result-wide v0

    return-wide v0
.end method

.method public count(Lcom/mongodb/DBObject;)J
    .locals 2
    .param p1, "query"    # Lcom/mongodb/DBObject;

    .prologue
    .line 1039
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)J

    move-result-wide v0

    return-wide v0
.end method

.method public count(Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)J
    .locals 2
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "readPrefs"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 1052
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/mongodb/DBCollection;->getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)J

    move-result-wide v0

    return-wide v0
.end method

.method public createIndex(Lcom/mongodb/DBObject;)V
    .locals 1
    .param p1, "keys"    # Lcom/mongodb/DBObject;

    .prologue
    .line 551
    invoke-virtual {p0, p1}, Lcom/mongodb/DBCollection;->defaultOptions(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->createIndex(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)V

    .line 552
    return-void
.end method

.method public createIndex(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)V
    .locals 1
    .param p1, "keys"    # Lcom/mongodb/DBObject;
    .param p2, "options"    # Lcom/mongodb/DBObject;

    .prologue
    .line 563
    invoke-direct {p0}, Lcom/mongodb/DBCollection;->getDBEncoder()Lcom/mongodb/DBEncoder;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mongodb/DBCollection;->createIndex(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBEncoder;)V

    .line 564
    return-void
.end method

.method public abstract createIndex(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBEncoder;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method defaultOptions(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 3
    .param p1, "keys"    # Lcom/mongodb/DBObject;

    .prologue
    .line 676
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 677
    .local v0, "o":Lcom/mongodb/DBObject;
    const-string/jumbo v1, "name"

    invoke-static {p1}, Lcom/mongodb/DBCollection;->genIndexName(Lcom/mongodb/DBObject;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 678
    const-string/jumbo v1, "ns"

    iget-object v2, p0, Lcom/mongodb/DBCollection;->_fullName:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 679
    return-object v0
.end method

.method public distinct(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1348
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->distinct(Ljava/lang/String;Lcom/mongodb/DBObject;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public distinct(Ljava/lang/String;Lcom/mongodb/DBObject;)Ljava/util/List;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "query"    # Lcom/mongodb/DBObject;

    .prologue
    .line 1374
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mongodb/DBCollection;->distinct(Ljava/lang/String;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public distinct(Ljava/lang/String;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Ljava/util/List;
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "query"    # Lcom/mongodb/DBObject;
    .param p3, "readPrefs"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 1388
    invoke-static {}, Lcom/mongodb/BasicDBObjectBuilder;->start()Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "distinct"

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "key"

    invoke-virtual {v2, v3, p1}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "query"

    invoke-virtual {v2, v3, p2}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/BasicDBObjectBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v0

    .line 1394
    .local v0, "c":Lcom/mongodb/DBObject;
    iget-object v2, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v3

    invoke-virtual {v2, v0, v3, p3}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 1395
    .local v1, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 1396
    const-string/jumbo v2, "values"

    invoke-virtual {v1, v2}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    check-cast v2, Ljava/util/List;

    return-object v2
.end method

.method public distinct(Ljava/lang/String;Lcom/mongodb/ReadPreference;)Ljava/util/List;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "readPrefs"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 1361
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    invoke-virtual {p0, p1, v0, p2}, Lcom/mongodb/DBCollection;->distinct(Ljava/lang/String;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected abstract doapply(Lcom/mongodb/DBObject;)V
.end method

.method public drop()V
    .locals 5

    .prologue
    .line 1012
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->resetIndexCache()V

    .line 1013
    iget-object v1, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-static {}, Lcom/mongodb/BasicDBObjectBuilder;->start()Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "drop"

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/BasicDBObjectBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 1014
    .local v0, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->ok()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "ns not found"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1017
    :cond_0
    :goto_0
    return-void

    .line 1016
    :cond_1
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->throwOnError()V

    goto :goto_0
.end method

.method public dropIndex(Lcom/mongodb/DBObject;)V
    .locals 1
    .param p1, "keys"    # Lcom/mongodb/DBObject;

    .prologue
    .line 1723
    invoke-static {p1}, Lcom/mongodb/DBCollection;->genIndexName(Lcom/mongodb/DBObject;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCollection;->dropIndexes(Ljava/lang/String;)V

    .line 1724
    return-void
.end method

.method public dropIndex(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1732
    invoke-virtual {p0, p1}, Lcom/mongodb/DBCollection;->dropIndexes(Ljava/lang/String;)V

    .line 1733
    return-void
.end method

.method public dropIndexes()V
    .locals 1

    .prologue
    .line 985
    const-string/jumbo v0, "*"

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCollection;->dropIndexes(Ljava/lang/String;)V

    .line 986
    return-void
.end method

.method public dropIndexes(Ljava/lang/String;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 995
    invoke-static {}, Lcom/mongodb/BasicDBObjectBuilder;->start()Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "deleteIndexes"

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "index"

    invoke-virtual {v2, v3, p1}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/BasicDBObjectBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v0

    .line 1000
    .local v0, "cmd":Lcom/mongodb/DBObject;
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->resetIndexCache()V

    .line 1001
    iget-object v2, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {v2, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 1002
    .local v1, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->ok()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "ns not found"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1005
    :cond_0
    :goto_0
    return-void

    .line 1004
    :cond_1
    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->throwOnError()V

    goto :goto_0
.end method

.method public ensureIndex(Lcom/mongodb/DBObject;)V
    .locals 1
    .param p1, "keys"    # Lcom/mongodb/DBObject;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 602
    invoke-virtual {p0, p1}, Lcom/mongodb/DBCollection;->defaultOptions(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->ensureIndex(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)V

    .line 603
    return-void
.end method

.method public ensureIndex(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)V
    .locals 5
    .param p1, "keys"    # Lcom/mongodb/DBObject;
    .param p2, "optionsIN"    # Lcom/mongodb/DBObject;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 651
    const/4 v4, 0x0

    invoke-virtual {p0, v4}, Lcom/mongodb/DBCollection;->checkReadOnly(Z)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 664
    :cond_0
    :goto_0
    return-void

    .line 653
    :cond_1
    invoke-virtual {p0, p1}, Lcom/mongodb/DBCollection;->defaultOptions(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v3

    .line 654
    .local v3, "options":Lcom/mongodb/DBObject;
    invoke-interface {p2}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 655
    .local v1, "k":Ljava/lang/String;
    invoke-interface {p2, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v1, v4}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 657
    .end local v1    # "k":Ljava/lang/String;
    :cond_2
    const-string/jumbo v4, "name"

    invoke-interface {v3, v4}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 659
    .local v2, "name":Ljava/lang/String;
    iget-object v4, p0, Lcom/mongodb/DBCollection;->_createdIndexes:Ljava/util/Set;

    invoke-interface {v4, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 662
    invoke-virtual {p0, p1, v3}, Lcom/mongodb/DBCollection;->createIndex(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)V

    .line 663
    iget-object v4, p0, Lcom/mongodb/DBCollection;->_createdIndexes:Ljava/util/Set;

    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public ensureIndex(Lcom/mongodb/DBObject;Ljava/lang/String;)V
    .locals 1
    .param p1, "keys"    # Lcom/mongodb/DBObject;
    .param p2, "name"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 616
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mongodb/DBCollection;->ensureIndex(Lcom/mongodb/DBObject;Ljava/lang/String;Z)V

    .line 617
    return-void
.end method

.method public ensureIndex(Lcom/mongodb/DBObject;Ljava/lang/String;Z)V
    .locals 3
    .param p1, "keys"    # Lcom/mongodb/DBObject;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "unique"    # Z
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 631
    invoke-virtual {p0, p1}, Lcom/mongodb/DBCollection;->defaultOptions(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v0

    .line 632
    .local v0, "options":Lcom/mongodb/DBObject;
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    .line 633
    const-string/jumbo v1, "name"

    invoke-interface {v0, v1, p2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 634
    :cond_0
    if-eqz p3, :cond_1

    .line 635
    const-string/jumbo v1, "unique"

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v0, v1, v2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 636
    :cond_1
    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->ensureIndex(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)V

    .line 637
    return-void
.end method

.method public ensureIndex(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 589
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCollection;->ensureIndex(Lcom/mongodb/DBObject;)V

    .line 590
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1914
    if-ne p1, p0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method executeBulkWriteOperation(ZLjava/util/List;)Lcom/mongodb/BulkWriteResult;
    .locals 1
    .param p1, "ordered"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/WriteRequest;",
            ">;)",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .line 1659
    .local p2, "requests":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/WriteRequest;>;"
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mongodb/DBCollection;->executeBulkWriteOperation(ZLjava/util/List;Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method executeBulkWriteOperation(ZLjava/util/List;Lcom/mongodb/WriteConcern;)Lcom/mongodb/BulkWriteResult;
    .locals 1
    .param p1, "ordered"    # Z
    .param p3, "writeConcern"    # Lcom/mongodb/WriteConcern;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/WriteRequest;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            ")",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation

    .prologue
    .line 1663
    .local p2, "requests":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/WriteRequest;>;"
    invoke-direct {p0}, Lcom/mongodb/DBCollection;->getDBEncoder()Lcom/mongodb/DBEncoder;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/mongodb/DBCollection;->executeBulkWriteOperation(ZLjava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/BulkWriteResult;

    move-result-object v0

    return-object v0
.end method

.method abstract executeBulkWriteOperation(ZLjava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/BulkWriteResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/WriteRequest;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            ")",
            "Lcom/mongodb/BulkWriteResult;"
        }
    .end annotation
.end method

.method public explainAggregate(Ljava/util/List;Lcom/mongodb/AggregationOptions;)Lcom/mongodb/CommandResult;
    .locals 5
    .param p2, "options"    # Lcom/mongodb/AggregationOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/AggregationOptions;",
            ")",
            "Lcom/mongodb/CommandResult;"
        }
    .end annotation

    .prologue
    .line 1599
    .local p1, "pipeline":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/DBCollection;->prepareCommand(Ljava/util/List;Lcom/mongodb/AggregationOptions;)Lcom/mongodb/DBObject;

    move-result-object v0

    .line 1600
    .local v0, "command":Lcom/mongodb/DBObject;
    const-string/jumbo v2, "explain"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1601
    iget-object v2, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v3

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v4

    invoke-virtual {v2, v0, v3, v4}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 1602
    .local v1, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 1604
    return-object v1
.end method

.method public find()Lcom/mongodb/DBCursor;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 767
    new-instance v0, Lcom/mongodb/DBCursor;

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v1

    invoke-direct {v0, p0, v2, v2, v1}, Lcom/mongodb/DBCursor;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)V

    return-object v0
.end method

.method public find(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;
    .locals 3
    .param p1, "ref"    # Lcom/mongodb/DBObject;

    .prologue
    .line 729
    new-instance v0, Lcom/mongodb/DBCursor;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v2

    invoke-direct {v0, p0, p1, v1, v2}, Lcom/mongodb/DBCursor;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)V

    return-object v0
.end method

.method public find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;
    .locals 2
    .param p1, "ref"    # Lcom/mongodb/DBObject;
    .param p2, "keys"    # Lcom/mongodb/DBObject;

    .prologue
    .line 756
    new-instance v0, Lcom/mongodb/DBCursor;

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v1

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/mongodb/DBCursor;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)V

    return-object v0
.end method

.method public find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;II)Lcom/mongodb/DBCursor;
    .locals 2
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "numToSkip"    # I
    .param p4, "batchSize"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 351
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/DBCollection;->find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;

    move-result-object v1

    invoke-virtual {v1, p3}, Lcom/mongodb/DBCursor;->skip(I)Lcom/mongodb/DBCursor;

    move-result-object v1

    invoke-virtual {v1, p4}, Lcom/mongodb/DBCursor;->batchSize(I)Lcom/mongodb/DBCursor;

    move-result-object v0

    .line 352
    .local v0, "cursor":Lcom/mongodb/DBCursor;
    return-object v0
.end method

.method public find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;III)Lcom/mongodb/DBCursor;
    .locals 1
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "numToSkip"    # I
    .param p4, "batchSize"    # I
    .param p5, "options"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 332
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/mongodb/DBCollection;->find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;II)Lcom/mongodb/DBCursor;

    move-result-object v0

    invoke-virtual {v0, p5}, Lcom/mongodb/DBCursor;->addOption(I)Lcom/mongodb/DBCursor;

    move-result-object v0

    return-object v0
.end method

.method abstract find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;IIIILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/QueryResultIterator;
.end method

.method abstract find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;IIIILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;Lcom/mongodb/DBEncoder;)Lcom/mongodb/QueryResultIterator;
.end method

.method public findAndModify(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 8
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "update"    # Lcom/mongodb/DBObject;

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x0

    .line 524
    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    move-object v5, p2

    move v6, v4

    move v7, v4

    invoke-virtual/range {v0 .. v7}, Lcom/mongodb/DBCollection;->findAndModify(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;ZZ)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public findAndModify(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 8
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "sort"    # Lcom/mongodb/DBObject;
    .param p3, "update"    # Lcom/mongodb/DBObject;

    .prologue
    const/4 v4, 0x0

    .line 509
    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v5, p3

    move v6, v4

    move v7, v4

    invoke-virtual/range {v0 .. v7}, Lcom/mongodb/DBCollection;->findAndModify(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;ZZ)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public findAndModify(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;ZZ)Lcom/mongodb/DBObject;
    .locals 11
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "sort"    # Lcom/mongodb/DBObject;
    .param p4, "remove"    # Z
    .param p5, "update"    # Lcom/mongodb/DBObject;
    .param p6, "returnNew"    # Z
    .param p7, "upsert"    # Z

    .prologue
    .line 401
    const-wide/16 v8, 0x0

    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    invoke-virtual/range {v0 .. v10}, Lcom/mongodb/DBCollection;->findAndModify(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;ZZJLjava/util/concurrent/TimeUnit;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public findAndModify(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;ZZJLjava/util/concurrent/TimeUnit;)Lcom/mongodb/DBObject;
    .locals 10
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "sort"    # Lcom/mongodb/DBObject;
    .param p4, "remove"    # Z
    .param p5, "update"    # Lcom/mongodb/DBObject;
    .param p6, "returnNew"    # Z
    .param p7, "upsert"    # Z
    .param p8, "maxTime"    # J
    .param p10, "maxTimeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 427
    new-instance v4, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v7, "findandmodify"

    iget-object v8, p0, Lcom/mongodb/DBCollection;->_name:Ljava/lang/String;

    invoke-direct {v4, v7, v8}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 428
    .local v4, "cmd":Lcom/mongodb/BasicDBObject;
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    .line 429
    const-string/jumbo v7, "query"

    invoke-virtual {v4, v7, p1}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    .line 430
    :cond_0
    if-eqz p2, :cond_1

    invoke-interface {p2}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1

    .line 431
    const-string/jumbo v7, "fields"

    invoke-virtual {v4, v7, p2}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    .line 432
    :cond_1
    if-eqz p3, :cond_2

    invoke-interface {p3}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_2

    .line 433
    const-string/jumbo v7, "sort"

    invoke-virtual {v4, v7, p3}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    .line 434
    :cond_2
    const-wide/16 v8, 0x0

    cmp-long v7, p8, v8

    if-lez v7, :cond_3

    .line 435
    const-string/jumbo v7, "maxTimeMS"

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, p8

    move-object/from16 v2, p10

    invoke-virtual {v8, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    .line 438
    :cond_3
    if-eqz p4, :cond_5

    .line 439
    const-string/jumbo v7, "remove"

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    .line 454
    :cond_4
    :goto_0
    if-eqz p4, :cond_9

    if-eqz p5, :cond_9

    invoke-interface {p5}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_9

    if-nez p6, :cond_9

    .line 455
    new-instance v7, Lcom/mongodb/MongoException;

    const-string/jumbo v8, "FindAndModify: Remove cannot be mixed with the Update, or returnNew params!"

    invoke-direct {v7, v8}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 441
    :cond_5
    if-eqz p5, :cond_7

    invoke-interface {p5}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_7

    .line 443
    invoke-interface {p5}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 444
    .local v5, "key":Ljava/lang/String;
    const/4 v7, 0x0

    invoke-virtual {v5, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x24

    if-eq v7, v8, :cond_6

    .line 445
    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual {p0, p5, v7, v8}, Lcom/mongodb/DBCollection;->_checkObject(Lcom/mongodb/DBObject;ZZ)Lcom/mongodb/DBObject;

    .line 446
    :cond_6
    const-string/jumbo v7, "update"

    invoke-virtual {v4, v7, p5}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    .line 448
    .end local v5    # "key":Ljava/lang/String;
    :cond_7
    if-eqz p6, :cond_8

    .line 449
    const-string/jumbo v7, "new"

    invoke-static/range {p6 .. p6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    .line 450
    :cond_8
    if-eqz p7, :cond_4

    .line 451
    const-string/jumbo v7, "upsert"

    invoke-static/range {p7 .. p7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lcom/mongodb/BasicDBObject;->append(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObject;

    goto :goto_0

    .line 457
    :cond_9
    iget-object v7, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {v7, v4}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v6

    .line 458
    .local v6, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v6}, Lcom/mongodb/CommandResult;->ok()Z

    move-result v7

    if-nez v7, :cond_a

    invoke-virtual {v6}, Lcom/mongodb/CommandResult;->getErrorMessage()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "No matching object found"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_b

    .line 459
    :cond_a
    const-string/jumbo v7, "value"

    invoke-virtual {v6, v7}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/mongodb/DBObject;

    invoke-direct {p0, v7}, Lcom/mongodb/DBCollection;->replaceWithObjectClass(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v7

    .line 462
    :goto_1
    return-object v7

    .line 461
    :cond_b
    invoke-virtual {v6}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 462
    const/4 v7, 0x0

    goto :goto_1
.end method

.method public findAndRemove(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 8
    .param p1, "query"    # Lcom/mongodb/DBObject;

    .prologue
    const/4 v6, 0x0

    const/4 v2, 0x0

    .line 538
    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v3, v2

    move-object v5, v2

    move v7, v6

    invoke-virtual/range {v0 .. v7}, Lcom/mongodb/DBCollection;->findAndModify(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZLcom/mongodb/DBObject;ZZ)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public findOne()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 778
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCollection;->findOne(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public findOne(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 2
    .param p1, "o"    # Lcom/mongodb/DBObject;

    .prologue
    const/4 v1, 0x0

    .line 789
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    invoke-virtual {p0, p1, v1, v1, v0}, Lcom/mongodb/DBCollection;->findOne(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public findOne(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 2
    .param p1, "o"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;

    .prologue
    .line 801
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/mongodb/DBCollection;->findOne(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public findOne(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 1
    .param p1, "o"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "orderBy"    # Lcom/mongodb/DBObject;

    .prologue
    .line 814
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/mongodb/DBCollection;->findOne(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public findOne(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBObject;
    .locals 9
    .param p1, "o"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "orderBy"    # Lcom/mongodb/DBObject;
    .param p4, "readPref"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 843
    const-wide/16 v6, 0x0

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-virtual/range {v1 .. v8}, Lcom/mongodb/DBCollection;->findOne(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method findOne(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;JLjava/util/concurrent/TimeUnit;)Lcom/mongodb/DBObject;
    .locals 17
    .param p1, "o"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "orderBy"    # Lcom/mongodb/DBObject;
    .param p4, "readPref"    # Lcom/mongodb/ReadPreference;
    .param p5, "maxTime"    # J
    .param p7, "maxTimeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 862
    new-instance v4, Lcom/mongodb/QueryOpBuilder;

    invoke-direct {v4}, Lcom/mongodb/QueryOpBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lcom/mongodb/QueryOpBuilder;->addQuery(Lcom/mongodb/DBObject;)Lcom/mongodb/QueryOpBuilder;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Lcom/mongodb/QueryOpBuilder;->addOrderBy(Lcom/mongodb/DBObject;)Lcom/mongodb/QueryOpBuilder;

    move-result-object v4

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, p5

    move-object/from16 v2, p7

    invoke-virtual {v5, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Lcom/mongodb/QueryOpBuilder;->addMaxTimeMS(J)Lcom/mongodb/QueryOpBuilder;

    move-result-object v15

    .line 865
    .local v15, "queryOpBuilder":Lcom/mongodb/QueryOpBuilder;
    invoke-virtual/range {p0 .. p0}, Lcom/mongodb/DBCollection;->getDB()Lcom/mongodb/DB;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mongodb/DB;->getMongo()Lcom/mongodb/Mongo;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mongodb/Mongo;->isMongosConnection()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 866
    move-object/from16 v0, p4

    invoke-virtual {v15, v0}, Lcom/mongodb/QueryOpBuilder;->addReadPreference(Lcom/mongodb/ReadPreference;)Lcom/mongodb/QueryOpBuilder;

    .line 869
    :cond_0
    invoke-virtual {v15}, Lcom/mongodb/QueryOpBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, -0x1

    const/4 v9, 0x0

    invoke-virtual/range {p0 .. p0}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v10

    invoke-virtual/range {p0 .. p0}, Lcom/mongodb/DBCollection;->getDecoder()Lcom/mongodb/DBDecoder;

    move-result-object v12

    move-object/from16 v4, p0

    move-object/from16 v6, p2

    move-object/from16 v11, p4

    invoke-virtual/range {v4 .. v12}, Lcom/mongodb/DBCollection;->find(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;IIIILcom/mongodb/ReadPreference;Lcom/mongodb/DBDecoder;)Lcom/mongodb/QueryResultIterator;

    move-result-object v13

    .line 871
    .local v13, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/mongodb/DBObject;>;"
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/mongodb/DBObject;

    move-object v14, v4

    .line 872
    .local v14, "obj":Lcom/mongodb/DBObject;
    :goto_0
    if-eqz v14, :cond_1

    if-eqz p2, :cond_1

    invoke-interface/range {p2 .. p2}, Lcom/mongodb/DBObject;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 873
    invoke-interface {v14}, Lcom/mongodb/DBObject;->markAsPartialObject()V

    .line 875
    :cond_1
    return-object v14

    .line 871
    .end local v14    # "obj":Lcom/mongodb/DBObject;
    :cond_2
    const/4 v14, 0x0

    goto :goto_0
.end method

.method public findOne(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBObject;
    .locals 1
    .param p1, "o"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "readPref"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 828
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/mongodb/DBCollection;->findOne(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public findOne(Ljava/lang/Object;)Lcom/mongodb/DBObject;
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 366
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->findOne(Ljava/lang/Object;Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public findOne(Ljava/lang/Object;Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "fields"    # Lcom/mongodb/DBObject;

    .prologue
    .line 381
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v1, "_id"

    invoke-direct {v0, v1, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v0, p2}, Lcom/mongodb/DBCollection;->findOne(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;
    .locals 3
    .param p1, "n"    # Ljava/lang/String;

    .prologue
    .line 1861
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/mongodb/DBCollection;->_name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v0

    return-object v0
.end method

.method public getCount()J
    .locals 2

    .prologue
    .line 1065
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/mongodb/DBCollection;->getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getCount(Lcom/mongodb/DBObject;)J
    .locals 2
    .param p1, "query"    # Lcom/mongodb/DBObject;

    .prologue
    .line 1091
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)J
    .locals 8
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;

    .prologue
    const-wide/16 v4, 0x0

    .line 1106
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v6, v4

    invoke-virtual/range {v1 .. v7}, Lcom/mongodb/DBCollection;->getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;JJ)J
    .locals 9
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "limit"    # J
    .param p5, "skip"    # J

    .prologue
    .line 1137
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v8

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    move-wide v6, p5

    invoke-virtual/range {v1 .. v8}, Lcom/mongodb/DBCollection;->getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;JJLcom/mongodb/ReadPreference;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;JJLcom/mongodb/ReadPreference;)J
    .locals 13
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "limit"    # J
    .param p5, "skip"    # J
    .param p7, "readPrefs"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 1153
    const-wide/16 v9, 0x0

    sget-object v11, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide/from16 v4, p3

    move-wide/from16 v6, p5

    move-object/from16 v8, p7

    invoke-virtual/range {v1 .. v11}, Lcom/mongodb/DBCollection;->getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;JJLcom/mongodb/ReadPreference;JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    return-wide v0
.end method

.method getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;JJLcom/mongodb/ReadPreference;JLjava/util/concurrent/TimeUnit;)J
    .locals 11
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "limit"    # J
    .param p5, "skip"    # J
    .param p7, "readPrefs"    # Lcom/mongodb/ReadPreference;
    .param p8, "maxTime"    # J
    .param p10, "maxTimeUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 1173
    new-instance v4, Lcom/mongodb/BasicDBObject;

    invoke-direct {v4}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 1174
    .local v4, "cmd":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v7, "count"

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1175
    const-string/jumbo v7, "query"

    invoke-virtual {v4, v7, p1}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1176
    if-eqz p2, :cond_0

    .line 1177
    const-string/jumbo v7, "fields"

    invoke-virtual {v4, v7, p2}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1180
    :cond_0
    const-wide/16 v8, 0x0

    cmp-long v7, p3, v8

    if-lez v7, :cond_1

    .line 1181
    const-string/jumbo v7, "limit"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1182
    :cond_1
    const-wide/16 v8, 0x0

    cmp-long v7, p5, v8

    if-lez v7, :cond_2

    .line 1183
    const-string/jumbo v7, "skip"

    invoke-static/range {p5 .. p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1184
    :cond_2
    const-wide/16 v8, 0x0

    cmp-long v7, p8, v8

    if-lez v7, :cond_3

    .line 1185
    const-string/jumbo v7, "maxTimeMS"

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, p8

    move-object/from16 v2, p10

    invoke-virtual {v8, v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v4, v7, v8}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1188
    :cond_3
    iget-object v7, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v8

    move-object/from16 v0, p7

    invoke-virtual {v7, v4, v8, v0}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v6

    .line 1189
    .local v6, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v6}, Lcom/mongodb/CommandResult;->ok()Z

    move-result v7

    if-nez v7, :cond_6

    .line 1190
    invoke-virtual {v6}, Lcom/mongodb/CommandResult;->getErrorMessage()Ljava/lang/String;

    move-result-object v5

    .line 1192
    .local v5, "errmsg":Ljava/lang/String;
    const-string/jumbo v7, "ns does not exist"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

    const-string/jumbo v7, "ns missing"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 1195
    :cond_4
    const-wide/16 v8, 0x0

    .line 1201
    .end local v5    # "errmsg":Ljava/lang/String;
    :goto_0
    return-wide v8

    .line 1198
    .restart local v5    # "errmsg":Ljava/lang/String;
    :cond_5
    invoke-virtual {v6}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 1201
    .end local v5    # "errmsg":Ljava/lang/String;
    :cond_6
    const-string/jumbo v7, "n"

    invoke-virtual {v6, v7}, Lcom/mongodb/CommandResult;->getLong(Ljava/lang/String;)J

    move-result-wide v8

    goto :goto_0
.end method

.method public getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)J
    .locals 9
    .param p1, "query"    # Lcom/mongodb/DBObject;
    .param p2, "fields"    # Lcom/mongodb/DBObject;
    .param p3, "readPrefs"    # Lcom/mongodb/ReadPreference;

    .prologue
    const-wide/16 v4, 0x0

    .line 1121
    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v6, v4

    move-object v8, p3

    invoke-virtual/range {v1 .. v8}, Lcom/mongodb/DBCollection;->getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;JJLcom/mongodb/ReadPreference;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getCount(Lcom/mongodb/ReadPreference;)J
    .locals 2
    .param p1, "readPrefs"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 1078
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lcom/mongodb/DBCollection;->getCount(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDB()Lcom/mongodb/DB;
    .locals 1

    .prologue
    .line 1885
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    return-object v0
.end method

.method public declared-synchronized getDBDecoderFactory()Lcom/mongodb/DBDecoderFactory;
    .locals 1

    .prologue
    .line 2082
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_decoderFactory:Lcom/mongodb/DBDecoderFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getDBEncoderFactory()Lcom/mongodb/DBEncoderFactory;
    .locals 1

    .prologue
    .line 2100
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_encoderFactory:Lcom/mongodb/DBEncoderFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method getDecoder()Lcom/mongodb/DBDecoder;
    .locals 1

    .prologue
    .line 881
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getDBDecoderFactory()Lcom/mongodb/DBDecoderFactory;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getDBDecoderFactory()Lcom/mongodb/DBDecoderFactory;

    move-result-object v0

    invoke-interface {v0}, Lcom/mongodb/DBDecoderFactory;->create()Lcom/mongodb/DBDecoder;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getFullName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1877
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_fullName:Ljava/lang/String;

    return-object v0
.end method

.method protected getHintFields()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 718
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_hintFields:Ljava/util/List;

    return-object v0
.end method

.method public getIndexInfo()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1703
    new-instance v0, Lcom/mongodb/BasicDBObject;

    invoke-direct {v0}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 1704
    .local v0, "cmd":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v3, "ns"

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getFullName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1706
    iget-object v3, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    const-string/jumbo v4, "system.indexes"

    invoke-virtual {v3, v4}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/mongodb/DBCollection;->find(Lcom/mongodb/DBObject;)Lcom/mongodb/DBCursor;

    move-result-object v1

    .line 1708
    .local v1, "cur":Lcom/mongodb/DBCursor;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1710
    .local v2, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    :goto_0
    invoke-virtual {v1}, Lcom/mongodb/DBCursor;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1711
    invoke-virtual {v1}, Lcom/mongodb/DBCursor;->next()Lcom/mongodb/DBObject;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1714
    :cond_0
    return-object v2
.end method

.method protected getInternalClass(Ljava/lang/String;)Ljava/lang/Class;
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1970
    iget-object v1, p0, Lcom/mongodb/DBCollection;->_internalClass:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    .line 1971
    .local v0, "c":Ljava/lang/Class;
    if-eqz v0, :cond_0

    .line 1976
    .end local v0    # "c":Ljava/lang/Class;
    :goto_0
    return-object v0

    .line 1974
    .restart local v0    # "c":Ljava/lang/Class;
    :cond_0
    iget-object v1, p0, Lcom/mongodb/DBCollection;->_wrapper:Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    if-nez v1, :cond_1

    .line 1975
    const/4 v0, 0x0

    goto :goto_0

    .line 1976
    :cond_1
    iget-object v1, p0, Lcom/mongodb/DBCollection;->_wrapper:Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    invoke-virtual {v1, p1}, Lcom/mongodb/ReflectionDBObject$JavaWrapper;->getInternalClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1869
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public getObjectClass()Ljava/lang/Class;
    .locals 1

    .prologue
    .line 1950
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_objectClass:Ljava/lang/Class;

    return-object v0
.end method

.method public getOptions()I
    .locals 1

    .prologue
    .line 2064
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_options:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0}, Lcom/mongodb/Bytes$OptionHolder;->get()I

    move-result v0

    return v0
.end method

.method public getReadPreference()Lcom/mongodb/ReadPreference;
    .locals 1

    .prologue
    .line 2019
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_readPref:Lcom/mongodb/ReadPreference;

    if-eqz v0, :cond_0

    .line 2020
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_readPref:Lcom/mongodb/ReadPreference;

    .line 2021
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {v0}, Lcom/mongodb/DB;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    goto :goto_0
.end method

.method public getStats()Lcom/mongodb/CommandResult;
    .locals 4

    .prologue
    .line 1742
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getDB()Lcom/mongodb/DB;

    move-result-object v0

    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "collstats"

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v2

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v0

    return-object v0
.end method

.method public getWriteConcern()Lcom/mongodb/WriteConcern;
    .locals 1

    .prologue
    .line 1997
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_concern:Lcom/mongodb/WriteConcern;

    if-eqz v0, :cond_0

    .line 1998
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_concern:Lcom/mongodb/WriteConcern;

    .line 1999
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {v0}, Lcom/mongodb/DB;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v0

    goto :goto_0
.end method

.method public group(Lcom/mongodb/DBObject;)Lcom/mongodb/DBObject;
    .locals 5
    .param p1, "args"    # Lcom/mongodb/DBObject;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1333
    const-string/jumbo v1, "ns"

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1334
    iget-object v1, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    new-instance v2, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v3, "group"

    invoke-direct {v2, v3, p1}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v3

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 1335
    .local v0, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 1336
    const-string/jumbo v1, "retval"

    invoke-virtual {v0, v1}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBObject;

    return-object v1
.end method

.method public group(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Ljava/lang/String;)Lcom/mongodb/DBObject;
    .locals 6
    .param p1, "key"    # Lcom/mongodb/DBObject;
    .param p2, "cond"    # Lcom/mongodb/DBObject;
    .param p3, "initial"    # Lcom/mongodb/DBObject;
    .param p4, "reduce"    # Ljava/lang/String;

    .prologue
    .line 1252
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/mongodb/DBCollection;->group(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Ljava/lang/String;Ljava/lang/String;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public group(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Ljava/lang/String;Ljava/lang/String;)Lcom/mongodb/DBObject;
    .locals 7
    .param p1, "key"    # Lcom/mongodb/DBObject;
    .param p2, "cond"    # Lcom/mongodb/DBObject;
    .param p3, "initial"    # Lcom/mongodb/DBObject;
    .param p4, "reduce"    # Ljava/lang/String;
    .param p5, "finalize"    # Ljava/lang/String;

    .prologue
    .line 1269
    new-instance v0, Lcom/mongodb/GroupCommand;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/GroupCommand;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 1270
    .local v0, "cmd":Lcom/mongodb/GroupCommand;
    invoke-virtual {p0, v0}, Lcom/mongodb/DBCollection;->group(Lcom/mongodb/GroupCommand;)Lcom/mongodb/DBObject;

    move-result-object v1

    return-object v1
.end method

.method public group(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Ljava/lang/String;Ljava/lang/String;Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBObject;
    .locals 7
    .param p1, "key"    # Lcom/mongodb/DBObject;
    .param p2, "cond"    # Lcom/mongodb/DBObject;
    .param p3, "initial"    # Lcom/mongodb/DBObject;
    .param p4, "reduce"    # Ljava/lang/String;
    .param p5, "finalize"    # Ljava/lang/String;
    .param p6, "readPrefs"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 1288
    new-instance v0, Lcom/mongodb/GroupCommand;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/GroupCommand;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;Ljava/lang/String;Ljava/lang/String;)V

    .line 1289
    .local v0, "cmd":Lcom/mongodb/GroupCommand;
    invoke-virtual {p0, v0, p6}, Lcom/mongodb/DBCollection;->group(Lcom/mongodb/GroupCommand;Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBObject;

    move-result-object v1

    return-object v1
.end method

.method public group(Lcom/mongodb/GroupCommand;)Lcom/mongodb/DBObject;
    .locals 1
    .param p1, "cmd"    # Lcom/mongodb/GroupCommand;

    .prologue
    .line 1302
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->group(Lcom/mongodb/GroupCommand;Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBObject;

    move-result-object v0

    return-object v0
.end method

.method public group(Lcom/mongodb/GroupCommand;Lcom/mongodb/ReadPreference;)Lcom/mongodb/DBObject;
    .locals 4
    .param p1, "cmd"    # Lcom/mongodb/GroupCommand;
    .param p2, "readPrefs"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 1316
    iget-object v1, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {p1}, Lcom/mongodb/GroupCommand;->toDBObject()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v3

    invoke-virtual {v1, v2, v3, p2}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 1317
    .local v0, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 1318
    const-string/jumbo v1, "retval"

    invoke-virtual {v0, v1}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mongodb/DBObject;

    return-object v1
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 1909
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_fullName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public initializeOrderedBulkOperation()Lcom/mongodb/BulkWriteOperation;
    .locals 2

    .prologue
    .line 1639
    new-instance v0, Lcom/mongodb/BulkWriteOperation;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p0}, Lcom/mongodb/BulkWriteOperation;-><init>(ZLcom/mongodb/DBCollection;)V

    return-object v0
.end method

.method public initializeUnorderedBulkOperation()Lcom/mongodb/BulkWriteOperation;
    .locals 2

    .prologue
    .line 1655
    new-instance v0, Lcom/mongodb/BulkWriteOperation;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lcom/mongodb/BulkWriteOperation;-><init>(ZLcom/mongodb/DBCollection;)V

    return-object v0
.end method

.method public insert(Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
    .locals 2
    .param p1, "o"    # Lcom/mongodb/DBObject;
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 107
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/mongodb/DBObject;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/mongodb/DBCollection;->insert(Ljava/util/List;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public varargs insert(Lcom/mongodb/WriteConcern;[Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;
    .locals 1
    .param p1, "concern"    # Lcom/mongodb/WriteConcern;
    .param p2, "arr"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 134
    invoke-virtual {p0, p2, p1}, Lcom/mongodb/DBCollection;->insert([Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public insert(Ljava/util/List;)Lcom/mongodb/WriteResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;)",
            "Lcom/mongodb/WriteResult;"
        }
    .end annotation

    .prologue
    .line 147
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->insert(Ljava/util/List;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public insert(Ljava/util/List;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
    .locals 1
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            ")",
            "Lcom/mongodb/WriteResult;"
        }
    .end annotation

    .prologue
    .line 161
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    invoke-direct {p0}, Lcom/mongodb/DBCollection;->getDBEncoder()Lcom/mongodb/DBEncoder;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mongodb/DBCollection;->insert(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public abstract insert(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/WriteConcern;",
            "Lcom/mongodb/DBEncoder;",
            ")",
            "Lcom/mongodb/WriteResult;"
        }
    .end annotation
.end method

.method public varargs insert([Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;
    .locals 1
    .param p1, "arr"    # [Lcom/mongodb/DBObject;

    .prologue
    .line 120
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->insert([Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public insert([Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
    .locals 1
    .param p1, "arr"    # [Lcom/mongodb/DBObject;
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 78
    invoke-direct {p0}, Lcom/mongodb/DBCollection;->getDBEncoder()Lcom/mongodb/DBEncoder;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mongodb/DBCollection;->insert([Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public insert([Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
    .locals 1
    .param p1, "arr"    # [Lcom/mongodb/DBObject;
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;
    .param p3, "encoder"    # Lcom/mongodb/DBEncoder;

    .prologue
    .line 93
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0, p2, p3}, Lcom/mongodb/DBCollection;->insert(Ljava/util/List;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public isCapped()Z
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 1753
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getStats()Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 1754
    .local v1, "stats":Lcom/mongodb/CommandResult;
    const-string/jumbo v3, "capped"

    invoke-virtual {v1, v3}, Lcom/mongodb/CommandResult;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 1755
    .local v0, "capped":Ljava/lang/Object;
    if-eqz v0, :cond_1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    :cond_0
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public mapReduce(Lcom/mongodb/DBObject;)Lcom/mongodb/MapReduceOutput;
    .locals 4
    .param p1, "command"    # Lcom/mongodb/DBObject;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 1496
    const-string/jumbo v1, "mapreduce"

    invoke-interface {p1, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "mapReduce"

    invoke-interface {p1, v1}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 1497
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "need mapreduce arg"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1498
    :cond_0
    iget-object v1, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v2

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v3

    invoke-virtual {v1, p1, v2, v3}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 1499
    .local v0, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 1500
    new-instance v1, Lcom/mongodb/MapReduceOutput;

    invoke-direct {v1, p0, p1, v0}, Lcom/mongodb/MapReduceOutput;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/CommandResult;)V

    return-object v1
.end method

.method public mapReduce(Lcom/mongodb/MapReduceCommand;)Lcom/mongodb/MapReduceOutput;
    .locals 5
    .param p1, "command"    # Lcom/mongodb/MapReduceCommand;

    .prologue
    .line 1478
    invoke-virtual {p1}, Lcom/mongodb/MapReduceCommand;->toDBObject()Lcom/mongodb/DBObject;

    move-result-object v0

    .line 1480
    .local v0, "cmd":Lcom/mongodb/DBObject;
    iget-object v3, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getOptions()I

    move-result v4

    invoke-virtual {p1}, Lcom/mongodb/MapReduceCommand;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p1}, Lcom/mongodb/MapReduceCommand;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v2

    :goto_0
    invoke-virtual {v3, v0, v4, v2}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;ILcom/mongodb/ReadPreference;)Lcom/mongodb/CommandResult;

    move-result-object v1

    .line 1481
    .local v1, "res":Lcom/mongodb/CommandResult;
    invoke-virtual {v1}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 1482
    new-instance v2, Lcom/mongodb/MapReduceOutput;

    invoke-direct {v2, p0, v0, v1}, Lcom/mongodb/MapReduceOutput;-><init>(Lcom/mongodb/DBCollection;Lcom/mongodb/DBObject;Lcom/mongodb/CommandResult;)V

    return-object v2

    .line 1480
    .end local v1    # "res":Lcom/mongodb/CommandResult;
    :cond_0
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getReadPreference()Lcom/mongodb/ReadPreference;

    move-result-object v2

    goto :goto_0
.end method

.method public mapReduce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/mongodb/DBObject;)Lcom/mongodb/MapReduceOutput;
    .locals 7
    .param p1, "map"    # Ljava/lang/String;
    .param p2, "reduce"    # Ljava/lang/String;
    .param p3, "outputTarget"    # Ljava/lang/String;
    .param p4, "query"    # Lcom/mongodb/DBObject;

    .prologue
    .line 1414
    new-instance v0, Lcom/mongodb/MapReduceCommand;

    sget-object v5, Lcom/mongodb/MapReduceCommand$OutputType;->REPLACE:Lcom/mongodb/MapReduceCommand$OutputType;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/MapReduceCommand;-><init>(Lcom/mongodb/DBCollection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/mongodb/MapReduceCommand$OutputType;Lcom/mongodb/DBObject;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCollection;->mapReduce(Lcom/mongodb/MapReduceCommand;)Lcom/mongodb/MapReduceOutput;

    move-result-object v0

    return-object v0
.end method

.method public mapReduce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/mongodb/MapReduceCommand$OutputType;Lcom/mongodb/DBObject;)Lcom/mongodb/MapReduceOutput;
    .locals 7
    .param p1, "map"    # Ljava/lang/String;
    .param p2, "reduce"    # Ljava/lang/String;
    .param p3, "outputTarget"    # Ljava/lang/String;
    .param p4, "outputType"    # Lcom/mongodb/MapReduceCommand$OutputType;
    .param p5, "query"    # Lcom/mongodb/DBObject;

    .prologue
    .line 1438
    new-instance v0, Lcom/mongodb/MapReduceCommand;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/MapReduceCommand;-><init>(Lcom/mongodb/DBCollection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/mongodb/MapReduceCommand$OutputType;Lcom/mongodb/DBObject;)V

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCollection;->mapReduce(Lcom/mongodb/MapReduceCommand;)Lcom/mongodb/MapReduceOutput;

    move-result-object v0

    return-object v0
.end method

.method public mapReduce(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/mongodb/MapReduceCommand$OutputType;Lcom/mongodb/DBObject;Lcom/mongodb/ReadPreference;)Lcom/mongodb/MapReduceOutput;
    .locals 7
    .param p1, "map"    # Ljava/lang/String;
    .param p2, "reduce"    # Ljava/lang/String;
    .param p3, "outputTarget"    # Ljava/lang/String;
    .param p4, "outputType"    # Lcom/mongodb/MapReduceCommand$OutputType;
    .param p5, "query"    # Lcom/mongodb/DBObject;
    .param p6, "readPrefs"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 1464
    new-instance v0, Lcom/mongodb/MapReduceCommand;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/mongodb/MapReduceCommand;-><init>(Lcom/mongodb/DBCollection;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/mongodb/MapReduceCommand$OutputType;Lcom/mongodb/DBObject;)V

    .line 1465
    .local v0, "command":Lcom/mongodb/MapReduceCommand;
    invoke-virtual {v0, p6}, Lcom/mongodb/MapReduceCommand;->setReadPreference(Lcom/mongodb/ReadPreference;)V

    .line 1466
    invoke-virtual {p0, v0}, Lcom/mongodb/DBCollection;->mapReduce(Lcom/mongodb/MapReduceCommand;)Lcom/mongodb/MapReduceOutput;

    move-result-object v1

    return-object v1
.end method

.method public abstract parallelScan(Lcom/mongodb/ParallelScanOptions;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/mongodb/ParallelScanOptions;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/Cursor;",
            ">;"
        }
    .end annotation
.end method

.method prepareCommand(Ljava/util/List;Lcom/mongodb/AggregationOptions;)Lcom/mongodb/DBObject;
    .locals 6
    .param p2, "options"    # Lcom/mongodb/AggregationOptions;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;",
            "Lcom/mongodb/AggregationOptions;",
            ")",
            "Lcom/mongodb/DBObject;"
        }
    .end annotation

    .prologue
    .line 1671
    .local p1, "pipeline":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1672
    new-instance v2, Lcom/mongodb/MongoException;

    const-string/jumbo v3, "Aggregation pipelines can not be empty"

    invoke-direct {v2, v3}, Lcom/mongodb/MongoException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1675
    :cond_0
    new-instance v0, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "aggregate"

    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1676
    .local v0, "command":Lcom/mongodb/DBObject;
    const-string/jumbo v2, "pipeline"

    invoke-interface {v0, v2, p1}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1678
    invoke-virtual {p2}, Lcom/mongodb/AggregationOptions;->getOutputMode()Lcom/mongodb/AggregationOptions$OutputMode;

    move-result-object v2

    sget-object v3, Lcom/mongodb/AggregationOptions$OutputMode;->CURSOR:Lcom/mongodb/AggregationOptions$OutputMode;

    if-ne v2, v3, :cond_2

    .line 1679
    new-instance v1, Lcom/mongodb/BasicDBObject;

    invoke-direct {v1}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 1680
    .local v1, "cursor":Lcom/mongodb/BasicDBObject;
    invoke-virtual {p2}, Lcom/mongodb/AggregationOptions;->getBatchSize()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 1681
    const-string/jumbo v2, "batchSize"

    invoke-virtual {p2}, Lcom/mongodb/AggregationOptions;->getBatchSize()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1683
    :cond_1
    const-string/jumbo v2, "cursor"

    invoke-interface {v0, v2, v1}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1685
    .end local v1    # "cursor":Lcom/mongodb/BasicDBObject;
    :cond_2
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v2}, Lcom/mongodb/AggregationOptions;->getMaxTime(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_3

    .line 1686
    const-string/jumbo v2, "maxTimeMS"

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v3}, Lcom/mongodb/AggregationOptions;->getMaxTime(Ljava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1689
    :cond_3
    invoke-virtual {p2}, Lcom/mongodb/AggregationOptions;->getAllowDiskUse()Ljava/lang/Boolean;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 1690
    const-string/jumbo v2, "allowDiskUse"

    invoke-virtual {p2}, Lcom/mongodb/AggregationOptions;->getAllowDiskUse()Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1693
    :cond_4
    return-object v0
.end method

.method public remove(Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;
    .locals 1
    .param p1, "o"    # Lcom/mongodb/DBObject;

    .prologue
    .line 301
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->remove(Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public remove(Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
    .locals 1
    .param p1, "o"    # Lcom/mongodb/DBObject;
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 274
    invoke-direct {p0}, Lcom/mongodb/DBCollection;->getDBEncoder()Lcom/mongodb/DBEncoder;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lcom/mongodb/DBCollection;->remove(Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public abstract remove(Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
.end method

.method public rename(Ljava/lang/String;)Lcom/mongodb/DBCollection;
    .locals 1
    .param p1, "newName"    # Ljava/lang/String;

    .prologue
    .line 1215
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->rename(Ljava/lang/String;Z)Lcom/mongodb/DBCollection;

    move-result-object v0

    return-object v0
.end method

.method public rename(Ljava/lang/String;Z)Lcom/mongodb/DBCollection;
    .locals 6
    .param p1, "newName"    # Ljava/lang/String;
    .param p2, "dropTarget"    # Z

    .prologue
    .line 1226
    iget-object v1, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    const-string/jumbo v2, "admin"

    invoke-virtual {v1, v2}, Lcom/mongodb/DB;->getSisterDB(Ljava/lang/String;)Lcom/mongodb/DB;

    move-result-object v1

    invoke-static {}, Lcom/mongodb/BasicDBObjectBuilder;->start()Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "renameCollection"

    iget-object v4, p0, Lcom/mongodb/DBCollection;->_fullName:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "to"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    iget-object v5, v5, Lcom/mongodb/DB;->_name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    const-string/jumbo v3, "dropTarget"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/mongodb/BasicDBObjectBuilder;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/mongodb/BasicDBObjectBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/mongodb/BasicDBObjectBuilder;->get()Lcom/mongodb/DBObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/mongodb/DB;->command(Lcom/mongodb/DBObject;)Lcom/mongodb/CommandResult;

    move-result-object v0

    .line 1233
    .local v0, "ret":Lcom/mongodb/CommandResult;
    invoke-virtual {v0}, Lcom/mongodb/CommandResult;->throwOnError()V

    .line 1234
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->resetIndexCache()V

    .line 1235
    iget-object v1, p0, Lcom/mongodb/DBCollection;->_db:Lcom/mongodb/DB;

    invoke-virtual {v1, p1}, Lcom/mongodb/DB;->getCollection(Ljava/lang/String;)Lcom/mongodb/DBCollection;

    move-result-object v1

    return-object v1
.end method

.method public resetIndexCache()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 672
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_createdIndexes:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 673
    return-void
.end method

.method public resetOptions()V
    .locals 1

    .prologue
    .line 2055
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_options:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0}, Lcom/mongodb/Bytes$OptionHolder;->reset()V

    .line 2056
    return-void
.end method

.method public save(Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;
    .locals 1
    .param p1, "jo"    # Lcom/mongodb/DBObject;

    .prologue
    .line 933
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/mongodb/DBCollection;->save(Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public save(Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
    .locals 7
    .param p1, "jo"    # Lcom/mongodb/DBObject;
    .param p2, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 951
    invoke-virtual {p0, v3}, Lcom/mongodb/DBCollection;->checkReadOnly(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 952
    const/4 v0, 0x0

    .line 974
    :goto_0
    return-object v0

    .line 954
    :cond_0
    invoke-virtual {p0, p1, v4, v4}, Lcom/mongodb/DBCollection;->_checkObject(Lcom/mongodb/DBObject;ZZ)Lcom/mongodb/DBObject;

    .line 956
    const-string/jumbo v0, "_id"

    invoke-interface {p1, v0}, Lcom/mongodb/DBObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    .line 958
    .local v6, "id":Ljava/lang/Object;
    if-eqz v6, :cond_1

    instance-of v0, v6, Lorg/bson/types/ObjectId;

    if-eqz v0, :cond_4

    move-object v0, v6

    check-cast v0, Lorg/bson/types/ObjectId;

    invoke-virtual {v0}, Lorg/bson/types/ObjectId;->isNew()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 959
    :cond_1
    if-eqz v6, :cond_2

    .line 960
    check-cast v6, Lorg/bson/types/ObjectId;

    .end local v6    # "id":Ljava/lang/Object;
    invoke-virtual {v6}, Lorg/bson/types/ObjectId;->notNew()V

    .line 962
    :cond_2
    if-nez p2, :cond_3

    .line 963
    new-array v0, v3, [Lcom/mongodb/DBObject;

    aput-object p1, v0, v4

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCollection;->insert([Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;

    move-result-object v0

    goto :goto_0

    .line 965
    :cond_3
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/DBCollection;->insert(Lcom/mongodb/DBObject;Lcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    move-result-object v0

    goto :goto_0

    .line 969
    .restart local v6    # "id":Ljava/lang/Object;
    :cond_4
    new-instance v1, Lcom/mongodb/BasicDBObject;

    invoke-direct {v1}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 970
    .local v1, "q":Lcom/mongodb/DBObject;
    const-string/jumbo v0, "_id"

    invoke-interface {v1, v0, v6}, Lcom/mongodb/DBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 971
    if-nez p2, :cond_5

    .line 972
    invoke-virtual {p0, v1, p1, v3, v4}, Lcom/mongodb/DBCollection;->update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZZ)Lcom/mongodb/WriteResult;

    move-result-object v0

    goto :goto_0

    :cond_5
    move-object v0, p0

    move-object v2, p1

    move-object v5, p2

    .line 974
    invoke-virtual/range {v0 .. v5}, Lcom/mongodb/DBCollection;->update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZZLcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    move-result-object v0

    goto :goto_0
.end method

.method public declared-synchronized setDBDecoderFactory(Lcom/mongodb/DBDecoderFactory;)V
    .locals 1
    .param p1, "fact"    # Lcom/mongodb/DBDecoderFactory;

    .prologue
    .line 2073
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/mongodb/DBCollection;->_decoderFactory:Lcom/mongodb/DBDecoderFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2074
    monitor-exit p0

    return-void

    .line 2073
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setDBEncoderFactory(Lcom/mongodb/DBEncoderFactory;)V
    .locals 1
    .param p1, "fact"    # Lcom/mongodb/DBEncoderFactory;

    .prologue
    .line 2091
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/mongodb/DBCollection;->_encoderFactory:Lcom/mongodb/DBEncoderFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2092
    monitor-exit p0

    return-void

    .line 2091
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public setHintFields(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mongodb/DBObject;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 710
    .local p1, "lst":Ljava/util/List;, "Ljava/util/List<Lcom/mongodb/DBObject;>;"
    iput-object p1, p0, Lcom/mongodb/DBCollection;->_hintFields:Ljava/util/List;

    .line 711
    return-void
.end method

.method public setInternalClass(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "c"    # Ljava/lang/Class;

    .prologue
    .line 1960
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_internalClass:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1961
    return-void
.end method

.method public setObjectClass(Ljava/lang/Class;)V
    .locals 3
    .param p1, "c"    # Ljava/lang/Class;

    .prologue
    const/4 v1, 0x0

    .line 1928
    if-nez p1, :cond_0

    .line 1930
    iput-object v1, p0, Lcom/mongodb/DBCollection;->_wrapper:Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    .line 1931
    iput-object v1, p0, Lcom/mongodb/DBCollection;->_objectClass:Ljava/lang/Class;

    .line 1942
    :goto_0
    return-void

    .line 1935
    :cond_0
    const-class v0, Lcom/mongodb/DBObject;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1936
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " is not a DBObject"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1937
    :cond_1
    iput-object p1, p0, Lcom/mongodb/DBCollection;->_objectClass:Ljava/lang/Class;

    .line 1938
    const-class v0, Lcom/mongodb/ReflectionDBObject;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1939
    invoke-static {p1}, Lcom/mongodb/ReflectionDBObject;->getWrapper(Ljava/lang/Class;)Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/DBCollection;->_wrapper:Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    goto :goto_0

    .line 1941
    :cond_2
    iput-object v1, p0, Lcom/mongodb/DBCollection;->_wrapper:Lcom/mongodb/ReflectionDBObject$JavaWrapper;

    goto :goto_0
.end method

.method public setOptions(I)V
    .locals 1
    .param p1, "options"    # I

    .prologue
    .line 2048
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_options:Lcom/mongodb/Bytes$OptionHolder;

    invoke-virtual {v0, p1}, Lcom/mongodb/Bytes$OptionHolder;->set(I)V

    .line 2049
    return-void
.end method

.method public setReadPreference(Lcom/mongodb/ReadPreference;)V
    .locals 0
    .param p1, "preference"    # Lcom/mongodb/ReadPreference;

    .prologue
    .line 2010
    iput-object p1, p0, Lcom/mongodb/DBCollection;->_readPref:Lcom/mongodb/ReadPreference;

    .line 2011
    return-void
.end method

.method public setWriteConcern(Lcom/mongodb/WriteConcern;)V
    .locals 0
    .param p1, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 1988
    iput-object p1, p0, Lcom/mongodb/DBCollection;->_concern:Lcom/mongodb/WriteConcern;

    .line 1989
    return-void
.end method

.method public slaveOk()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 2030
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/mongodb/DBCollection;->addOption(I)V

    .line 2031
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1919
    iget-object v0, p0, Lcom/mongodb/DBCollection;->_name:Ljava/lang/String;

    return-object v0
.end method

.method public update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;
    .locals 1
    .param p1, "q"    # Lcom/mongodb/DBObject;
    .param p2, "o"    # Lcom/mongodb/DBObject;

    .prologue
    const/4 v0, 0x0

    .line 239
    invoke-virtual {p0, p1, p2, v0, v0}, Lcom/mongodb/DBCollection;->update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZZ)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZZ)Lcom/mongodb/WriteResult;
    .locals 6
    .param p1, "q"    # Lcom/mongodb/DBObject;
    .param p2, "o"    # Lcom/mongodb/DBObject;
    .param p3, "upsert"    # Z
    .param p4, "multi"    # Z

    .prologue
    .line 224
    invoke-virtual {p0}, Lcom/mongodb/DBCollection;->getWriteConcern()Lcom/mongodb/WriteConcern;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/mongodb/DBCollection;->update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZZLcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZZLcom/mongodb/WriteConcern;)Lcom/mongodb/WriteResult;
    .locals 7
    .param p1, "q"    # Lcom/mongodb/DBObject;
    .param p2, "o"    # Lcom/mongodb/DBObject;
    .param p3, "upsert"    # Z
    .param p4, "multi"    # Z
    .param p5, "concern"    # Lcom/mongodb/WriteConcern;

    .prologue
    .line 191
    invoke-direct {p0}, Lcom/mongodb/DBCollection;->getDBEncoder()Lcom/mongodb/DBEncoder;

    move-result-object v6

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/mongodb/DBCollection;->update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method

.method public abstract update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZZLcom/mongodb/WriteConcern;Lcom/mongodb/DBEncoder;)Lcom/mongodb/WriteResult;
.end method

.method public updateMulti(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;)Lcom/mongodb/WriteResult;
    .locals 2
    .param p1, "q"    # Lcom/mongodb/DBObject;
    .param p2, "o"    # Lcom/mongodb/DBObject;

    .prologue
    .line 254
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/mongodb/DBCollection;->update(Lcom/mongodb/DBObject;Lcom/mongodb/DBObject;ZZ)Lcom/mongodb/WriteResult;

    move-result-object v0

    return-object v0
.end method
