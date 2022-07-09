.class public Lorg/apache/tools/ant/types/resources/comparators/Reverse;
.super Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;
.source "Reverse.java"


# static fields
.field private static final ONE_NESTED:Ljava/lang/String; = "You must not nest more than one ResourceComparator for reversal."


# instance fields
.field private nested:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;-><init>()V

    .line 41
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)V
    .locals 0
    .param p1, "c"    # Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;-><init>()V

    .line 48
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/comparators/Reverse;->add(Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)V

    .line 49
    return-void
.end method


# virtual methods
.method public add(Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;)V
    .locals 2
    .param p1, "c"    # Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    .prologue
    .line 56
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/comparators/Reverse;->nested:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    if-eqz v0, :cond_0

    .line 57
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "You must not nest more than one ResourceComparator for reversal."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/types/resources/comparators/Reverse;->nested:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    .line 60
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/comparators/Reverse;->setChecked(Z)V

    .line 61
    return-void
.end method

.method protected dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/Reverse;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 89
    :goto_0
    return-void

    .line 80
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/comparators/Reverse;->isReference()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 81
    invoke-super {p0, p1, p2}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_0

    .line 83
    :cond_1
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/comparators/Reverse;->nested:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    instance-of v0, v0, Lorg/apache/tools/ant/types/DataType;

    if-eqz v0, :cond_2

    .line 84
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/comparators/Reverse;->nested:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    invoke-static {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/comparators/Reverse;->pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 87
    :cond_2
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/resources/comparators/Reverse;->setChecked(Z)V

    goto :goto_0
.end method

.method protected resourceCompare(Lorg/apache/tools/ant/types/Resource;Lorg/apache/tools/ant/types/Resource;)I
    .locals 1
    .param p1, "foo"    # Lorg/apache/tools/ant/types/Resource;
    .param p2, "bar"    # Lorg/apache/tools/ant/types/Resource;

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/comparators/Reverse;->nested:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    if-nez v0, :cond_0

    invoke-virtual {p1, p2}, Lorg/apache/tools/ant/types/Resource;->compareTo(Ljava/lang/Object;)I

    move-result v0

    :goto_0
    mul-int/lit8 v0, v0, -0x1

    return v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/resources/comparators/Reverse;->nested:Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/types/resources/comparators/ResourceComparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    goto :goto_0
.end method
