.class final Lcom/mongodb/MongoNamespace;
.super Ljava/lang/Object;
.source "MongoNamespace.java"


# annotations
.annotation runtime Lorg/bson/util/annotations/Immutable;
.end annotation


# static fields
.field public static final COMMAND_COLLECTION_NAME:Ljava/lang/String; = "$cmd"

.field private static final NAMESPACE_TEMPLATE:Ljava/lang/String; = "%s.%s"


# instance fields
.field private final collectionName:Ljava/lang/String;

.field private final databaseName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "databaseName"    # Ljava/lang/String;
    .param p2, "collectionName"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    if-nez p1, :cond_0

    .line 31
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "database name can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 33
    :cond_0
    if-nez p2, :cond_1

    .line 34
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Collection name can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_1
    iput-object p1, p0, Lcom/mongodb/MongoNamespace;->databaseName:Ljava/lang/String;

    .line 38
    iput-object p2, p0, Lcom/mongodb/MongoNamespace;->collectionName:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public static asNamespaceString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "databaseName"    # Ljava/lang/String;
    .param p1, "collectionName"    # Ljava/lang/String;

    .prologue
    .line 92
    const-string/jumbo v0, "%s.%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 55
    if-ne p0, p1, :cond_1

    .line 71
    :cond_0
    :goto_0
    return v1

    .line 58
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 59
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 62
    check-cast v0, Lcom/mongodb/MongoNamespace;

    .line 64
    .local v0, "that":Lcom/mongodb/MongoNamespace;
    iget-object v3, p0, Lcom/mongodb/MongoNamespace;->collectionName:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/mongodb/MongoNamespace;->collectionName:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/MongoNamespace;->collectionName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    :cond_4
    move v1, v2

    .line 65
    goto :goto_0

    .line 64
    :cond_5
    iget-object v3, v0, Lcom/mongodb/MongoNamespace;->collectionName:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 67
    :cond_6
    iget-object v3, p0, Lcom/mongodb/MongoNamespace;->databaseName:Ljava/lang/String;

    if-eqz v3, :cond_7

    iget-object v3, p0, Lcom/mongodb/MongoNamespace;->databaseName:Ljava/lang/String;

    iget-object v4, v0, Lcom/mongodb/MongoNamespace;->databaseName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 68
    goto :goto_0

    .line 67
    :cond_7
    iget-object v3, v0, Lcom/mongodb/MongoNamespace;->databaseName:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public getCollectionName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/mongodb/MongoNamespace;->collectionName:Ljava/lang/String;

    return-object v0
.end method

.method public getDatabaseName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/mongodb/MongoNamespace;->databaseName:Ljava/lang/String;

    return-object v0
.end method

.method public getFullName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/mongodb/MongoNamespace;->getDatabaseName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/mongodb/MongoNamespace;->getCollectionName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 86
    iget-object v2, p0, Lcom/mongodb/MongoNamespace;->databaseName:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/mongodb/MongoNamespace;->databaseName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 87
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/mongodb/MongoNamespace;->collectionName:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lcom/mongodb/MongoNamespace;->collectionName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 88
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 86
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/mongodb/MongoNamespace;->databaseName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/MongoNamespace;->collectionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
