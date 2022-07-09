.class Lcom/mongodb/DefaultDBCallback$DefaultFactory;
.super Ljava/lang/Object;
.source "DefaultDBCallback.java"

# interfaces
.implements Lcom/mongodb/DBCallbackFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DefaultDBCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DefaultFactory"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lcom/mongodb/DBCollection;)Lcom/mongodb/DBCallback;
    .locals 1
    .param p1, "collection"    # Lcom/mongodb/DBCollection;

    .prologue
    .line 41
    new-instance v0, Lcom/mongodb/DefaultDBCallback;

    invoke-direct {v0, p1}, Lcom/mongodb/DefaultDBCallback;-><init>(Lcom/mongodb/DBCollection;)V

    return-object v0
.end method
