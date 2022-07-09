.class Lcom/mongodb/util/JSONSerializers$DBRefBaseSerializer;
.super Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;
.source "JSONSerializers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/JSONSerializers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DBRefBaseSerializer"
.end annotation


# direct methods
.method constructor <init>(Lcom/mongodb/util/ObjectSerializer;)V
    .locals 0
    .param p1, "serializer"    # Lcom/mongodb/util/ObjectSerializer;

    .prologue
    .line 259
    invoke-direct {p0, p1}, Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    .line 260
    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 264
    move-object v0, p1

    check-cast v0, Lcom/mongodb/DBRefBase;

    .line 265
    .local v0, "ref":Lcom/mongodb/DBRefBase;
    new-instance v1, Lcom/mongodb/BasicDBObject;

    invoke-direct {v1}, Lcom/mongodb/BasicDBObject;-><init>()V

    .line 266
    .local v1, "temp":Lcom/mongodb/BasicDBObject;
    const-string/jumbo v2, "$ref"

    invoke-virtual {v0}, Lcom/mongodb/DBRefBase;->getRef()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    const-string/jumbo v2, "$id"

    invoke-virtual {v0}, Lcom/mongodb/DBRefBase;->getId()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/mongodb/BasicDBObject;->put(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    iget-object v2, p0, Lcom/mongodb/util/JSONSerializers$DBRefBaseSerializer;->serializer:Lcom/mongodb/util/ObjectSerializer;

    invoke-interface {v2, v1, p2}, Lcom/mongodb/util/ObjectSerializer;->serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 269
    return-void
.end method
