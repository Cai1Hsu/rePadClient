.class Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;
.super Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;
.source "LayoutPreservingProperties.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/util/LayoutPreservingProperties;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Pair"
.end annotation


# instance fields
.field private added:Z

.field private name:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 664
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$LogicalLine;-><init>(Ljava/lang/String;)V

    .line 665
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->parsePair(Ljava/lang/String;)V

    .line 666
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 669
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;-><init>(Ljava/lang/String;)V

    .line 670
    return-void
.end method

.method private findFirstSeparator(Ljava/lang/String;)I
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 742
    const-string/jumbo v0, "\\\\\\\\"

    const-string/jumbo v1, "__"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 746
    const-string/jumbo v0, "\\\\="

    const-string/jumbo v1, "__"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 747
    const-string/jumbo v0, "\\\\:"

    const-string/jumbo v1, "__"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 748
    const-string/jumbo v0, "\\\\ "

    const-string/jumbo v1, "__"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 749
    const-string/jumbo v0, "\\\\t"

    const-string/jumbo v1, "__"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 752
    const-string/jumbo v0, " :=\t"

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->indexOfAny(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private indexOfAny(Ljava/lang/String;Ljava/lang/String;)I
    .locals 5
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "chars"    # Ljava/lang/String;

    .prologue
    const/4 v3, -0x1

    .line 756
    if-eqz p1, :cond_0

    if-nez p2, :cond_2

    :cond_0
    move v1, v3

    .line 770
    :cond_1
    :goto_0
    return v1

    .line 760
    :cond_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v1, v4, 0x1

    .line 761
    .local v1, "p":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_4

    .line 762
    invoke-virtual {p2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    .line 763
    .local v2, "x":I
    if-eq v2, v3, :cond_3

    if-ge v2, v1, :cond_3

    .line 764
    move v1, v2

    .line 761
    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 767
    .end local v2    # "x":I
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    if-ne v1, v4, :cond_1

    move v1, v3

    .line 768
    goto :goto_0
.end method

.method private parsePair(Ljava/lang/String;)V
    .locals 3
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 707
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->findFirstSeparator(Ljava/lang/String;)I

    move-result v0

    .line 708
    .local v0, "pos":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 710
    iput-object p1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->name:Ljava/lang/String;

    .line 711
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->value:Ljava/lang/String;

    .line 718
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->name:Ljava/lang/String;

    const-string/jumbo v2, " \t\u000c"

    invoke-direct {p0, v1, v2}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->stripStart(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->name:Ljava/lang/String;

    .line 719
    return-void

    .line 714
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->name:Ljava/lang/String;

    .line 715
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->value:Ljava/lang/String;

    goto :goto_0
.end method

.method private stripStart(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "chars"    # Ljava/lang/String;

    .prologue
    .line 722
    if-nez p1, :cond_0

    .line 723
    const/4 v1, 0x0

    .line 735
    :goto_0
    return-object v1

    .line 726
    :cond_0
    const/4 v0, 0x0

    .line 727
    .local v0, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 728
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    .line 732
    :cond_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ne v0, v1, :cond_3

    .line 733
    const-string/jumbo v1, ""

    goto :goto_0

    .line 727
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 735
    :cond_3
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 694
    const/4 v0, 0x0

    .line 696
    .local v0, "dolly":Ljava/lang/Object;
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 702
    .end local v0    # "dolly":Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 698
    .restart local v0    # "dolly":Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 700
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    invoke-virtual {v1}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 673
    iget-object v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 677
    iget-object v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->value:Ljava/lang/String;

    return-object v0
.end method

.method public isNew()Z
    .locals 1

    .prologue
    .line 686
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->added:Z

    return v0
.end method

.method public setNew(Z)V
    .locals 0
    .param p1, "val"    # Z

    .prologue
    .line 690
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->added:Z

    .line 691
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 681
    iput-object p1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->value:Ljava/lang/String;

    .line 682
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/LayoutPreservingProperties$Pair;->setText(Ljava/lang/String;)V

    .line 683
    return-void
.end method
