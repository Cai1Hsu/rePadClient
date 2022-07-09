.class abstract Lorg/apache/tools/ant/types/Quantifier$Predicate;
.super Ljava/lang/Object;
.source "Quantifier.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/Quantifier;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "Predicate"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/types/Quantifier$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/types/Quantifier$1;

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Quantifier$Predicate;-><init>()V

    return-void
.end method


# virtual methods
.method abstract eval(II)Z
.end method
