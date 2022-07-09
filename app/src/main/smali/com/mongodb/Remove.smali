.class Lcom/mongodb/Remove;
.super Ljava/lang/Object;
.source "Remove.java"


# instance fields
.field private final filter:Lcom/mongodb/DBObject;

.field private isMulti:Z


# direct methods
.method public constructor <init>(Lcom/mongodb/DBObject;)V
    .locals 1
    .param p1, "filter"    # Lcom/mongodb/DBObject;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mongodb/Remove;->isMulti:Z

    .line 24
    iput-object p1, p0, Lcom/mongodb/Remove;->filter:Lcom/mongodb/DBObject;

    .line 25
    return-void
.end method


# virtual methods
.method public getFilter()Lcom/mongodb/DBObject;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/mongodb/Remove;->filter:Lcom/mongodb/DBObject;

    return-object v0
.end method

.method public isMulti()Z
    .locals 1

    .prologue
    .line 37
    iget-boolean v0, p0, Lcom/mongodb/Remove;->isMulti:Z

    return v0
.end method

.method public multi(Z)Lcom/mongodb/Remove;
    .locals 0
    .param p1, "isMulti"    # Z

    .prologue
    .line 32
    iput-boolean p1, p0, Lcom/mongodb/Remove;->isMulti:Z

    .line 33
    return-object p0
.end method
