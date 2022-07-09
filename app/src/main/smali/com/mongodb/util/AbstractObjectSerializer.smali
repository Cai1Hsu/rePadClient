.class abstract Lcom/mongodb/util/AbstractObjectSerializer;
.super Ljava/lang/Object;
.source "AbstractObjectSerializer.java"

# interfaces
.implements Lcom/mongodb/util/ObjectSerializer;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public serialize(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .local v0, "builder":Ljava/lang/StringBuilder;
    invoke-virtual {p0, p1, v0}, Lcom/mongodb/util/AbstractObjectSerializer;->serialize(Ljava/lang/Object;Ljava/lang/StringBuilder;)V

    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
