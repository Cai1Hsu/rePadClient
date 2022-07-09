.class public Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;
.super Lorg/apache/tools/ant/types/Commandline$Argument;
.source "ImplementationSpecificArgument.java"


# instance fields
.field private impl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Commandline$Argument;-><init>()V

    .line 36
    return-void
.end method


# virtual methods
.method public final getParts(Ljava/lang/String;)[Ljava/lang/String;
    .locals 1
    .param p1, "chosenImpl"    # Ljava/lang/String;

    .prologue
    .line 55
    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;->impl:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;->impl:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 56
    :cond_0
    invoke-super {p0}, Lorg/apache/tools/ant/types/Commandline$Argument;->getParts()[Ljava/lang/String;

    move-result-object v0

    .line 58
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    goto :goto_0
.end method

.method public setImplementation(Ljava/lang/String;)V
    .locals 0
    .param p1, "impl"    # Ljava/lang/String;

    .prologue
    .line 43
    iput-object p1, p0, Lorg/apache/tools/ant/util/facade/ImplementationSpecificArgument;->impl:Ljava/lang/String;

    .line 44
    return-void
.end method
