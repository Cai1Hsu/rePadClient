.class abstract Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;
.super Lcom/mongodb/util/AbstractObjectSerializer;
.source "JSONSerializers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/JSONSerializers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "CompoundObjectSerializer"
.end annotation


# instance fields
.field protected final serializer:Lcom/mongodb/util/ObjectSerializer;


# direct methods
.method constructor <init>(Lcom/mongodb/util/ObjectSerializer;)V
    .locals 0
    .param p1, "serializer"    # Lcom/mongodb/util/ObjectSerializer;

    .prologue
    .line 112
    invoke-direct {p0}, Lcom/mongodb/util/AbstractObjectSerializer;-><init>()V

    .line 113
    iput-object p1, p0, Lcom/mongodb/util/JSONSerializers$CompoundObjectSerializer;->serializer:Lcom/mongodb/util/ObjectSerializer;

    .line 114
    return-void
.end method
