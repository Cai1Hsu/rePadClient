.class Lorg/apache/tools/ant/PropertyHelper$4;
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
    .line 242
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 239
    const-string/jumbo v0, "ant.refid:"

    iput-object v0, p0, Lorg/apache/tools/ant/PropertyHelper$4;->PREFIX:Ljava/lang/String;

    .line 240
    const-string/jumbo v0, "ant.refid:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iput v0, p0, Lorg/apache/tools/ant/PropertyHelper$4;->PREFIX_LEN:I

    return-void
.end method


# virtual methods
.method public evaluate(Ljava/lang/String;Lorg/apache/tools/ant/PropertyHelper;)Ljava/lang/Object;
    .locals 2
    .param p1, "prop"    # Ljava/lang/String;
    .param p2, "helper"    # Lorg/apache/tools/ant/PropertyHelper;

    .prologue
    .line 243
    const-string/jumbo v0, "ant.refid:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lorg/apache/tools/ant/PropertyHelper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lorg/apache/tools/ant/PropertyHelper;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    iget v1, p0, Lorg/apache/tools/ant/PropertyHelper$4;->PREFIX_LEN:I

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/Project;->getReference(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
