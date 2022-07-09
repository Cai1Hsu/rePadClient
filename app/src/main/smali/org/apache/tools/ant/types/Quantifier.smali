.class public Lorg/apache/tools/ant/types/Quantifier;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Quantifier.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/Quantifier$Predicate;
    }
.end annotation


# static fields
.field public static final ALL:Lorg/apache/tools/ant/types/Quantifier;

.field private static final ALL_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

.field public static final ANY:Lorg/apache/tools/ant/types/Quantifier;

.field private static final ANY_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

.field public static final MAJORITY:Lorg/apache/tools/ant/types/Quantifier;

.field private static final MAJORITY_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

.field public static final NONE:Lorg/apache/tools/ant/types/Quantifier;

.field private static final NONE_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

.field public static final ONE:Lorg/apache/tools/ant/types/Quantifier;

.field private static final ONE_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

.field private static final PREDS:[Lorg/apache/tools/ant/types/Quantifier$Predicate;

.field private static final VALUES:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 39
    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "all"

    aput-object v1, v0, v3

    const-string/jumbo v1, "each"

    aput-object v1, v0, v4

    const-string/jumbo v1, "every"

    aput-object v1, v0, v5

    const-string/jumbo v1, "any"

    aput-object v1, v0, v6

    const-string/jumbo v1, "some"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string/jumbo v2, "one"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "majority"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "most"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "none"

    aput-object v2, v0, v1

    sput-object v0, Lorg/apache/tools/ant/types/Quantifier;->VALUES:[Ljava/lang/String;

    .line 44
    new-instance v0, Lorg/apache/tools/ant/types/Quantifier;

    const-string/jumbo v1, "all"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Quantifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/Quantifier;->ALL:Lorg/apache/tools/ant/types/Quantifier;

    .line 46
    new-instance v0, Lorg/apache/tools/ant/types/Quantifier;

    const-string/jumbo v1, "any"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Quantifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/Quantifier;->ANY:Lorg/apache/tools/ant/types/Quantifier;

    .line 48
    new-instance v0, Lorg/apache/tools/ant/types/Quantifier;

    const-string/jumbo v1, "one"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Quantifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/Quantifier;->ONE:Lorg/apache/tools/ant/types/Quantifier;

    .line 50
    new-instance v0, Lorg/apache/tools/ant/types/Quantifier;

    const-string/jumbo v1, "majority"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Quantifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/Quantifier;->MAJORITY:Lorg/apache/tools/ant/types/Quantifier;

    .line 52
    new-instance v0, Lorg/apache/tools/ant/types/Quantifier;

    const-string/jumbo v1, "none"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/types/Quantifier;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/tools/ant/types/Quantifier;->NONE:Lorg/apache/tools/ant/types/Quantifier;

    .line 58
    new-instance v0, Lorg/apache/tools/ant/types/Quantifier$1;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Quantifier$1;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/types/Quantifier;->ALL_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    .line 62
    new-instance v0, Lorg/apache/tools/ant/types/Quantifier$2;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Quantifier$2;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/types/Quantifier;->ANY_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    .line 66
    new-instance v0, Lorg/apache/tools/ant/types/Quantifier$3;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Quantifier$3;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/types/Quantifier;->ONE_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    .line 70
    new-instance v0, Lorg/apache/tools/ant/types/Quantifier$4;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Quantifier$4;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/types/Quantifier;->MAJORITY_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    .line 74
    new-instance v0, Lorg/apache/tools/ant/types/Quantifier$5;

    invoke-direct {v0}, Lorg/apache/tools/ant/types/Quantifier$5;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/types/Quantifier;->NONE_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    .line 78
    sget-object v0, Lorg/apache/tools/ant/types/Quantifier;->VALUES:[Ljava/lang/String;

    array-length v0, v0

    new-array v0, v0, [Lorg/apache/tools/ant/types/Quantifier$Predicate;

    sput-object v0, Lorg/apache/tools/ant/types/Quantifier;->PREDS:[Lorg/apache/tools/ant/types/Quantifier$Predicate;

    .line 82
    sget-object v0, Lorg/apache/tools/ant/types/Quantifier;->PREDS:[Lorg/apache/tools/ant/types/Quantifier$Predicate;

    sget-object v1, Lorg/apache/tools/ant/types/Quantifier;->ALL_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    aput-object v1, v0, v3

    .line 83
    sget-object v0, Lorg/apache/tools/ant/types/Quantifier;->PREDS:[Lorg/apache/tools/ant/types/Quantifier$Predicate;

    sget-object v1, Lorg/apache/tools/ant/types/Quantifier;->ALL_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    aput-object v1, v0, v4

    .line 84
    sget-object v0, Lorg/apache/tools/ant/types/Quantifier;->PREDS:[Lorg/apache/tools/ant/types/Quantifier$Predicate;

    sget-object v1, Lorg/apache/tools/ant/types/Quantifier;->ALL_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    aput-object v1, v0, v5

    .line 85
    sget-object v0, Lorg/apache/tools/ant/types/Quantifier;->PREDS:[Lorg/apache/tools/ant/types/Quantifier$Predicate;

    sget-object v1, Lorg/apache/tools/ant/types/Quantifier;->ANY_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    aput-object v1, v0, v6

    .line 86
    sget-object v0, Lorg/apache/tools/ant/types/Quantifier;->PREDS:[Lorg/apache/tools/ant/types/Quantifier$Predicate;

    sget-object v1, Lorg/apache/tools/ant/types/Quantifier;->ANY_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    aput-object v1, v0, v7

    .line 87
    sget-object v0, Lorg/apache/tools/ant/types/Quantifier;->PREDS:[Lorg/apache/tools/ant/types/Quantifier$Predicate;

    const/4 v1, 0x5

    sget-object v2, Lorg/apache/tools/ant/types/Quantifier;->ONE_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    aput-object v2, v0, v1

    .line 88
    sget-object v0, Lorg/apache/tools/ant/types/Quantifier;->PREDS:[Lorg/apache/tools/ant/types/Quantifier$Predicate;

    const/4 v1, 0x6

    sget-object v2, Lorg/apache/tools/ant/types/Quantifier;->MAJORITY_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    aput-object v2, v0, v1

    .line 89
    sget-object v0, Lorg/apache/tools/ant/types/Quantifier;->PREDS:[Lorg/apache/tools/ant/types/Quantifier$Predicate;

    const/4 v1, 0x7

    sget-object v2, Lorg/apache/tools/ant/types/Quantifier;->MAJORITY_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    aput-object v2, v0, v1

    .line 90
    sget-object v0, Lorg/apache/tools/ant/types/Quantifier;->PREDS:[Lorg/apache/tools/ant/types/Quantifier$Predicate;

    const/16 v1, 0x8

    sget-object v2, Lorg/apache/tools/ant/types/Quantifier;->NONE_PRED:Lorg/apache/tools/ant/types/Quantifier$Predicate;

    aput-object v2, v0, v1

    .line 92
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 97
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 98
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 104
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 105
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Quantifier;->setValue(Ljava/lang/String;)V

    .line 106
    return-void
.end method


# virtual methods
.method public evaluate(II)Z
    .locals 3
    .param p1, "t"    # I
    .param p2, "f"    # I

    .prologue
    .line 138
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Quantifier;->getIndex()I

    move-result v0

    .line 139
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 140
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Quantifier value not set."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 142
    :cond_0
    sget-object v1, Lorg/apache/tools/ant/types/Quantifier;->PREDS:[Lorg/apache/tools/ant/types/Quantifier$Predicate;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1, p2}, Lorg/apache/tools/ant/types/Quantifier$Predicate;->eval(II)Z

    move-result v1

    return v1
.end method

.method public evaluate([Z)Z
    .locals 3
    .param p1, "b"    # [Z

    .prologue
    .line 122
    const/4 v1, 0x0

    .line 123
    .local v1, "t":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_1

    .line 124
    aget-boolean v2, p1, v0

    if-eqz v2, :cond_0

    .line 125
    add-int/lit8 v1, v1, 0x1

    .line 123
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 128
    :cond_1
    array-length v2, p1

    sub-int/2addr v2, v1

    invoke-virtual {p0, v1, v2}, Lorg/apache/tools/ant/types/Quantifier;->evaluate(II)Z

    move-result v2

    return v2
.end method

.method public getValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    sget-object v0, Lorg/apache/tools/ant/types/Quantifier;->VALUES:[Ljava/lang/String;

    return-object v0
.end method
