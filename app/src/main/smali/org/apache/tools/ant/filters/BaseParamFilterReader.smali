.class public abstract Lorg/apache/tools/ant/filters/BaseParamFilterReader;
.super Lorg/apache/tools/ant/filters/BaseFilterReader;
.source "BaseParamFilterReader.java"

# interfaces
.implements Lorg/apache/tools/ant/types/Parameterizable;


# instance fields
.field private parameters:[Lorg/apache/tools/ant/types/Parameter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/BaseFilterReader;-><init>()V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;)V
    .locals 0
    .param p1, "in"    # Ljava/io/Reader;

    .prologue
    .line 50
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/filters/BaseFilterReader;-><init>(Ljava/io/Reader;)V

    .line 51
    return-void
.end method


# virtual methods
.method protected final getParameters()[Lorg/apache/tools/ant/types/Parameter;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/tools/ant/filters/BaseParamFilterReader;->parameters:[Lorg/apache/tools/ant/types/Parameter;

    return-object v0
.end method

.method public final setParameters([Lorg/apache/tools/ant/types/Parameter;)V
    .locals 1
    .param p1, "parameters"    # [Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 61
    iput-object p1, p0, Lorg/apache/tools/ant/filters/BaseParamFilterReader;->parameters:[Lorg/apache/tools/ant/types/Parameter;

    .line 62
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/filters/BaseParamFilterReader;->setInitialized(Z)V

    .line 63
    return-void
.end method
