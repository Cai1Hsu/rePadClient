.class public Lcom/mongodb/DBPointer;
.super Lcom/mongodb/DBRefBase;
.source "DBPointer.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x1b72b1bd7b593392L


# instance fields
.field final _fieldName:Ljava/lang/String;

.field final _parent:Lcom/mongodb/DBObject;


# direct methods
.method constructor <init>(Lcom/mongodb/DBObject;Ljava/lang/String;Lcom/mongodb/DB;Ljava/lang/String;Lorg/bson/types/ObjectId;)V
    .locals 0
    .param p1, "parent"    # Lcom/mongodb/DBObject;
    .param p2, "fieldName"    # Ljava/lang/String;
    .param p3, "db"    # Lcom/mongodb/DB;
    .param p4, "ns"    # Ljava/lang/String;
    .param p5, "id"    # Lorg/bson/types/ObjectId;

    .prologue
    .line 44
    invoke-direct {p0, p3, p4, p5}, Lcom/mongodb/DBRefBase;-><init>(Lcom/mongodb/DB;Ljava/lang/String;Ljava/lang/Object;)V

    .line 46
    iput-object p1, p0, Lcom/mongodb/DBPointer;->_parent:Lcom/mongodb/DBObject;

    .line 47
    iput-object p2, p0, Lcom/mongodb/DBPointer;->_fieldName:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/bson/types/ObjectId;)V
    .locals 6
    .param p1, "ns"    # Ljava/lang/String;
    .param p2, "id"    # Lorg/bson/types/ObjectId;

    .prologue
    const/4 v1, 0x0

    .line 40
    move-object v0, p0

    move-object v2, v1

    move-object v3, v1

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/mongodb/DBPointer;-><init>(Lcom/mongodb/DBObject;Ljava/lang/String;Lcom/mongodb/DB;Ljava/lang/String;Lorg/bson/types/ObjectId;)V

    .line 41
    return-void
.end method


# virtual methods
.method public bridge synthetic getId()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 26
    invoke-virtual {p0}, Lcom/mongodb/DBPointer;->getId()Lorg/bson/types/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public getId()Lorg/bson/types/ObjectId;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/mongodb/DBPointer;->_id:Ljava/lang/Object;

    check-cast v0, Lorg/bson/types/ObjectId;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "{ \"$ref\" : \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBPointer;->_ns:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\", \"$id\" : ObjectId(\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/DBPointer;->_id:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\") }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
