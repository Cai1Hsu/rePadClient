.class Lcom/mongodb/util/JSONSerializers$StringSerializer;
.super Lcom/mongodb/util/AbstractObjectSerializer;
.source "JSONSerializers.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/util/JSONSerializers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StringSerializer"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 383
    invoke-direct {p0}, Lcom/mongodb/util/AbstractObjectSerializer;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/mongodb/util/JSONSerializers$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/mongodb/util/JSONSerializers$1;

    .prologue
    .line 383
    invoke-direct {p0}, Lcom/mongodb/util/JSONSerializers$StringSerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V
    .locals 0
    .param p1, "obj"    # Ljava/lang/Object;
    .param p2, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 387
    check-cast p1, Ljava/lang/String;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-static {p2, p1}, Lcom/mongodb/util/JSON;->string(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    .line 388
    return-void
.end method
