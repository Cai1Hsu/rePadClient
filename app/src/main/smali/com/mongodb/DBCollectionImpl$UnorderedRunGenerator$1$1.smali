.class Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1$1;
.super Ljava/lang/Object;
.source "DBCollectionImpl.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/mongodb/WriteRequest$Type;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$2:Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;


# direct methods
.method constructor <init>(Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;)V
    .locals 0

    .prologue
    .line 632
    iput-object p1, p0, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1$1;->this$2:Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteRequest$Type;)I
    .locals 1
    .param p1, "first"    # Lcom/mongodb/WriteRequest$Type;
    .param p2, "second"    # Lcom/mongodb/WriteRequest$Type;

    .prologue
    .line 635
    invoke-virtual {p1, p2}, Lcom/mongodb/WriteRequest$Type;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 632
    check-cast p1, Lcom/mongodb/WriteRequest$Type;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lcom/mongodb/WriteRequest$Type;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/mongodb/DBCollectionImpl$UnorderedRunGenerator$1$1;->compare(Lcom/mongodb/WriteRequest$Type;Lcom/mongodb/WriteRequest$Type;)I

    move-result v0

    return v0
.end method
