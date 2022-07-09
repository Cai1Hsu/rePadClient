.class Lorg/apache/tools/ant/PropertyHelper$1;
.super Ljava/lang/Object;
.source "PropertyHelper.java"

# interfaces
.implements Lorg/apache/tools/ant/PropertyHelper$PropertyEvaluator;


# instance fields
.field private final PREFIX:Ljava/lang/String;

.field private final PREFIX_LEN:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 178
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 175
    const-string/jumbo v0, "toString:"

    iput-object v0, p0, Lorg/apache/tools/ant/PropertyHelper$1;->PREFIX:Ljava/lang/String;

    .line 176
    const-string/jumbo v0, "toString:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/PropertyHelper$1;->PREFIX_LEN:I

    return-void
.end method


# virtual methods
.method public evaluate(Ljava/lang/String;Lorg/apache/tools/ant/PropertyHelper;)Ljava/lang/Object;
    .locals 3
    .param p1, "property"    # Ljava/lang/String;
    .param p2, "propertyHelper"    # Lorg/apache/tools/ant/PropertyHelper;

    .prologue
    .line 179
    const/4 v0, 0x0

    .line 180
    .local v0, "o":Ljava/lang/Object;
    const-string/jumbo v1, "toString:"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p2}, Lorg/apache/tools/ant/PropertyHelper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 181
    invoke-virtual {p2}, Lorg/apache/tools/ant/PropertyHelper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    iget v2, p0, Lorg/apache/tools/ant/PropertyHelper$1;->PREFIX_LEN:I

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 183
    .end local v0    # "o":Ljava/lang/Object;
    :cond_0
    if-nez v0, :cond_1

    const/4 v1, 0x0

    :goto_0
    return-object v1

    :cond_1
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
