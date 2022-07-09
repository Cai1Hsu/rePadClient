.class public Lorg/apache/tools/ant/types/selectors/modifiedselector/EqualComparator;
.super Ljava/lang/Object;
.source "EqualComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 3
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 42
    if-nez p1, :cond_1

    .line 43
    if-nez p2, :cond_0

    move v0, v1

    .line 48
    :cond_0
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    const-string/jumbo v0, "EqualComparator"

    return-object v0
.end method
