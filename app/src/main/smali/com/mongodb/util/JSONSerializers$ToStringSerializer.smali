.class Lcom/mongodb/util/JSONSerializers$ToStringSerializer;
.super Lcom/mongodb/util/AbstractObjectSerializer;
.source "JSONSerializers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/JSONSerializers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ToStringSerializer"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 146
    invoke-direct {p0}, Lcom/mongodb/util/AbstractObjectSerializer;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mongodb/util/JSONSerializers$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mongodb/util/JSONSerializers$1;

    .prologue
    .line 146
    invoke-direct {p0}, Lcom/mongodb/util/JSONSerializers$ToStringSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 150
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    return-void
.end method
