.class public Lorg/bson/types/BSONTimestamp;
.super Ljava/lang/Object;
.source "BSONTimestamp.java"

# interfaces
.implements Ljava/lang/Comparable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lorg/bson/types/BSONTimestamp;",
        ">;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field static final D:Z

.field private static final serialVersionUID:J = -0x2d5bfbac5b0cc2d0L


# instance fields
.field final _inc:I

.field final _time:Ljava/util/Date;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const-string/jumbo v0, "DEBUG.DBTIMESTAMP"

    invoke-static {v0}, Ljava/lang/Boolean;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    sput-boolean v0, Lorg/bson/types/BSONTimestamp;->D:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x0

    iput v0, p0, Lorg/bson/types/BSONTimestamp;->_inc:I

    .line 38
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/bson/types/BSONTimestamp;->_time:Ljava/util/Date;

    .line 39
    return-void
.end method

.method public constructor <init>(II)V
    .locals 6
    .param p1, "time"    # I
    .param p2, "inc"    # I

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-instance v0, Ljava/util/Date;

    int-to-long v2, p1

    const-wide/16 v4, 0x3e8

    mul-long/2addr v2, v4

    invoke-direct {v0, v2, v3}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lorg/bson/types/BSONTimestamp;->_time:Ljava/util/Date;

    .line 43
    iput p2, p0, Lorg/bson/types/BSONTimestamp;->_inc:I

    .line 44
    return-void
.end method


# virtual methods
.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 30
    check-cast p1, Lorg/bson/types/BSONTimestamp;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/bson/types/BSONTimestamp;->compareTo(Lorg/bson/types/BSONTimestamp;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/bson/types/BSONTimestamp;)I
    .locals 2
    .param p1, "ts"    # Lorg/bson/types/BSONTimestamp;

    .prologue
    .line 65
    invoke-virtual {p0}, Lorg/bson/types/BSONTimestamp;->getTime()I

    move-result v0

    invoke-virtual {p1}, Lorg/bson/types/BSONTimestamp;->getTime()I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 66
    invoke-virtual {p0}, Lorg/bson/types/BSONTimestamp;->getTime()I

    move-result v0

    invoke-virtual {p1}, Lorg/bson/types/BSONTimestamp;->getTime()I

    move-result v1

    sub-int/2addr v0, v1

    .line 69
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p0}, Lorg/bson/types/BSONTimestamp;->getInc()I

    move-result v0

    invoke-virtual {p1}, Lorg/bson/types/BSONTimestamp;->getInc()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 84
    if-ne p1, p0, :cond_1

    .line 90
    :cond_0
    :goto_0
    return v1

    .line 86
    :cond_1
    instance-of v3, p1, Lorg/bson/types/BSONTimestamp;

    if-eqz v3, :cond_3

    move-object v0, p1

    .line 87
    check-cast v0, Lorg/bson/types/BSONTimestamp;

    .line 88
    .local v0, "t2":Lorg/bson/types/BSONTimestamp;
    invoke-virtual {p0}, Lorg/bson/types/BSONTimestamp;->getTime()I

    move-result v3

    invoke-virtual {v0}, Lorg/bson/types/BSONTimestamp;->getTime()I

    move-result v4

    if-ne v3, v4, :cond_2

    invoke-virtual {p0}, Lorg/bson/types/BSONTimestamp;->getInc()I

    move-result v3

    invoke-virtual {v0}, Lorg/bson/types/BSONTimestamp;->getInc()I

    move-result v4

    if-eq v3, v4, :cond_0

    :cond_2
    move v1, v2

    goto :goto_0

    .end local v0    # "t2":Lorg/bson/types/BSONTimestamp;
    :cond_3
    move v1, v2

    .line 90
    goto :goto_0
.end method

.method public getInc()I
    .locals 1

    .prologue
    .line 56
    iget v0, p0, Lorg/bson/types/BSONTimestamp;->_inc:I

    return v0
.end method

.method public getTime()I
    .locals 4

    .prologue
    .line 50
    iget-object v0, p0, Lorg/bson/types/BSONTimestamp;->_time:Ljava/util/Date;

    if-nez v0, :cond_0

    .line 51
    const/4 v0, 0x0

    .line 52
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lorg/bson/types/BSONTimestamp;->_time:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    .line 75
    const/16 v0, 0x1f

    .line 76
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 77
    .local v1, "result":I
    iget v2, p0, Lorg/bson/types/BSONTimestamp;->_inc:I

    add-int/lit8 v1, v2, 0x1f

    .line 78
    mul-int/lit8 v2, v1, 0x1f

    invoke-virtual {p0}, Lorg/bson/types/BSONTimestamp;->getTime()I

    move-result v3

    add-int v1, v2, v3

    .line 79
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "TS time:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/bson/types/BSONTimestamp;->_time:Ljava/util/Date;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " inc:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lorg/bson/types/BSONTimestamp;->_inc:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
