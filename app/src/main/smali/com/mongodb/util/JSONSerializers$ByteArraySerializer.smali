.class Lcom/mongodb/util/JSONSerializers$ByteArraySerializer;
.super Lcom/mongodb/util/JSONSerializers$BinarySerializerBase;
.source "JSONSerializers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/JSONSerializers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByteArraySerializer"
.end annotation


# direct methods
.method constructor <init>(Lcom/mongodb/util/ObjectSerializer;)V
    .locals 0
    .param p1, "serializer"    # Lcom/mongodb/util/ObjectSerializer;

    .prologue
    .line 469
    invoke-direct {p0, p1}, Lcom/mongodb/util/JSONSerializers$BinarySerializerBase;-><init>(Lcom/mongodb/util/ObjectSerializer;)V

    .line 470
    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 474
    check-cast p1, [B

    .end local p1    # "obj":Ljava/lang/Object;
    check-cast p1, [B

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lcom/mongodb/util/JSONSerializers$ByteArraySerializer;->serialize([BBLjava/lang/StringBuilder;)V

    .line 475
    return-void
.end method
