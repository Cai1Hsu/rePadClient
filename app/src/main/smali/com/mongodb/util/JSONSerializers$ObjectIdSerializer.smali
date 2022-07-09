.class Lcom/mongodb/util/JSONSerializers$ObjectIdSerializer;
.super Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;
.source "JSONSerializers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/JSONSerializers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ObjectIdSerializer"
.end annotation


# direct methods
.method constructor <init>(Lcom/mongodb/util/ObjectSerializer;)V
    .locals 0
    .param p1, "serializer"    # Lcom/mongodb/util/ObjectSerializer;

    .prologue
    .line 356
    invoke-direct {p0, p1}, Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    .line 357
    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 361
    iget-object v0, p0, Lcom/mongodb/util/JSONSerializers$ObjectIdSerializer;->serializer:Lcom/mongodb/util/ObjectSerializer;

    new-instance v1, Lcom/mongodb/BasicDBObject;

    const-string/jumbo v2, "$oid"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/mongodb/BasicDBObject;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v0, v1, p2}, Lcom/mongodb/util/ObjectSerializer;->serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 363
    return-void
.end method
