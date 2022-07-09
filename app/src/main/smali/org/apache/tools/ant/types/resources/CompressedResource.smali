.class public abstract Lorg/apache/tools/ant/types/resources/CompressedResource;
.super Lorg/apache/tools/ant/types/resources/ContentTransformingResource;
.source "CompressedResource.java"


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;-><init>()V

    .line 35
    return-void
.end method

.method protected constructor <init>(Lorg/apache/tools/ant/types/ResourceCollection;)V
    .locals 0
    .param p1, "other"    # Lorg/apache/tools/ant/types/ResourceCollection;

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;-><init>()V

    .line 42
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/resources/CompressedResource;->addConfigured(Lorg/apache/tools/ant/types/ResourceCollection;)V

    .line 43
    return-void
.end method


# virtual methods
.method protected abstract getCompressionName()Ljava/lang/String;
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 51
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/resources/CompressedResource;->getCompressionName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, " compressed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-super {p0}, Lorg/apache/tools/ant/types/resources/ContentTransformingResource;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
