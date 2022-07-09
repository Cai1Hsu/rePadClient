.class Lorg/apache/tools/ant/PropertyHelper$3;
.super Ljava/lang/Object;
.source "PropertyHelper.java"

# interfaces
.implements Lorg/apache/tools/ant/property/PropertyExpander;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 217
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public parsePropertyName(Ljava/lang/String;Ljava/text/ParsePosition;Lorg/apache/tools/ant/property/ParseNextProperty;)Ljava/lang/String;
    .locals 4
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "pos"    # Ljava/text/ParsePosition;
    .param p3, "notUsed"    # Lorg/apache/tools/ant/property/ParseNextProperty;

    .prologue
    const/16 v3, 0x24

    .line 219
    invoke-virtual {p2}, Ljava/text/ParsePosition;->getIndex()I

    move-result v0

    .line 220
    .local v0, "index":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, v0

    const/4 v2, 0x2

    if-lt v1, v2, :cond_0

    .line 227
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v3, v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v3, v1, :cond_0

    .line 228
    invoke-virtual {p2, v0}, Ljava/text/ParsePosition;->setIndex(I)V

    .line 231
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method
