.class Lcom/mongodb/ChangeEvent;
.super Ljava/lang/Object;
.source "ChangeEvent.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final newValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final oldValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lcom/mongodb/ChangeEvent;, "Lcom/mongodb/ChangeEvent<TT;>;"
    .local p1, "oldValue":Ljava/lang/Object;, "TT;"
    .local p2, "newValue":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const-string/jumbo v0, "oldValue"

    invoke-static {v0, p1}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ChangeEvent;->oldValue:Ljava/lang/Object;

    .line 32
    const-string/jumbo v0, "newValue"

    invoke-static {v0, p2}, Lorg/bson/util/Assertions;->notNull(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/mongodb/ChangeEvent;->newValue:Ljava/lang/Object;

    .line 33
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lcom/mongodb/ChangeEvent;, "Lcom/mongodb/ChangeEvent<TT;>;"
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 45
    if-ne p0, p1, :cond_1

    .line 63
    :cond_0
    :goto_0
    return v1

    .line 49
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 50
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 53
    check-cast v0, Lcom/mongodb/ChangeEvent;

    .line 55
    .local v0, "that":Lcom/mongodb/ChangeEvent;, "Lcom/mongodb/ChangeEvent<*>;"
    iget-object v3, p0, Lcom/mongodb/ChangeEvent;->newValue:Ljava/lang/Object;

    iget-object v4, v0, Lcom/mongodb/ChangeEvent;->newValue:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    move v1, v2

    .line 56
    goto :goto_0

    .line 59
    :cond_4
    iget-object v3, p0, Lcom/mongodb/ChangeEvent;->oldValue:Ljava/lang/Object;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/mongodb/ChangeEvent;->oldValue:Ljava/lang/Object;

    iget-object v4, v0, Lcom/mongodb/ChangeEvent;->oldValue:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 60
    goto :goto_0

    .line 59
    :cond_5
    iget-object v3, v0, Lcom/mongodb/ChangeEvent;->oldValue:Ljava/lang/Object;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public getNewValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 40
    .local p0, "this":Lcom/mongodb/ChangeEvent;, "Lcom/mongodb/ChangeEvent<TT;>;"
    iget-object v0, p0, Lcom/mongodb/ChangeEvent;->newValue:Ljava/lang/Object;

    return-object v0
.end method

.method public getOldValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 36
    .local p0, "this":Lcom/mongodb/ChangeEvent;, "Lcom/mongodb/ChangeEvent<TT;>;"
    iget-object v0, p0, Lcom/mongodb/ChangeEvent;->oldValue:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 68
    .local p0, "this":Lcom/mongodb/ChangeEvent;, "Lcom/mongodb/ChangeEvent<TT;>;"
    iget-object v1, p0, Lcom/mongodb/ChangeEvent;->oldValue:Ljava/lang/Object;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/mongodb/ChangeEvent;->oldValue:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 69
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v1, v0, 0x1f

    iget-object v2, p0, Lcom/mongodb/ChangeEvent;->newValue:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int v0, v1, v2

    .line 70
    return v0

    .line 68
    .end local v0    # "result":I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 75
    .local p0, "this":Lcom/mongodb/ChangeEvent;, "Lcom/mongodb/ChangeEvent<TT;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "ChangeEvent{oldValue="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ChangeEvent;->oldValue:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", newValue="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mongodb/ChangeEvent;->newValue:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
