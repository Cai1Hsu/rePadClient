.class Lcom/mongodb/util/JSONSerializers$BinarySerializer;
.super Lcom/mongodb/util/JSONSerializers$BinarySerializerBase;
.source "JSONSerializers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/JSONSerializers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BinarySerializer"
.end annotation


# direct methods
.method constructor <init>(Lcom/mongodb/util/ObjectSerializer;)V
    .locals 0
    .param p1, "serializer"    # Lcom/mongodb/util/ObjectSerializer;

    .prologue
    .line 456
    invoke-direct {p0, p1}, Lcom/mongodb/util/JSONSerializers$BinarySerializerBase;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    .line 457
    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 461
    move-object v0, p1

    check-cast v0, Lorg/bson/types/Binary;

    .line 462
    .local v0, "bin":Lorg/bson/types/Binary;
    invoke-virtual {v0}, Lorg/bson/types/Binary;->getData()[B

    move-result-object v1

    invoke-virtual {v0}, Lorg/bson/types/Binary;->getType()B

    move-result v2

    invoke-virtual {p0, v1, v2, p2}, Lcom/mongodb/util/JSONSerializers$BinarySerializer;->serialize([BBLjava/lang/StringBuilder;)V

    .line 463
    return-void
.end method
