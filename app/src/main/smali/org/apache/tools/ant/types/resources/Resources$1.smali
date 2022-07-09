.class Lorg/apache/tools/ant/types/resources/Resources$1;
.super Ljava/lang/Object;
.source "Resources.java"

# interfaces
.implements Lorg/apache/tools/ant/types/ResourceCollection;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isFilesystemOnly()Z
    .locals 1

    .prologue
    .line 46
    const/4 v0, 0x1

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1

    .prologue
    .line 49
    sget-object v0, Lorg/apache/tools/ant/types/resources/Resources;->EMPTY_ITERATOR:Ljava/util/Iterator;

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 52
    const/4 v0, 0x0

    return v0
.end method
