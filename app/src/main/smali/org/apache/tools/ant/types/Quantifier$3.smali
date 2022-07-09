.class Lorg/apache/tools/ant/types/Quantifier$3;
.super Lorg/apache/tools/ant/types/Quantifier$Predicate;
.source "Quantifier.java"


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/types/Quantifier$Predicate;-><init>(Lorg/apache/tools/ant/types/Quantifier$1;)V

    return-void
.end method


# virtual methods
.method eval(II)Z
    .locals 1
    .param p1, "t"    # I
    .param p2, "f"    # I

    .prologue
    const/4 v0, 0x1

    .line 67
    if-ne p1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
