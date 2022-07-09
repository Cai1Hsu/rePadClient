.class public abstract Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;
.super Lorg/apache/tools/ant/types/selectors/BaseSelector;
.source "BaseExtendSelector.java"

# interfaces
.implements Lorg/apache/tools/ant/types/selectors/ExtendFileSelector;


# instance fields
.field protected parameters:[Lorg/apache/tools/ant/types/Parameter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/tools/ant/types/selectors/BaseSelector;-><init>()V

    .line 40
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;->parameters:[Lorg/apache/tools/ant/types/Parameter;

    .line 48
    return-void
.end method


# virtual methods
.method protected getParameters()[Lorg/apache/tools/ant/types/Parameter;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;->parameters:[Lorg/apache/tools/ant/types/Parameter;

    return-object v0
.end method

.method public abstract isSelected(Ljava/io/File;Ljava/lang/String;Ljava/io/File;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation
.end method

.method public setParameters([Lorg/apache/tools/ant/types/Parameter;)V
    .locals 0
    .param p1, "parameters"    # [Lorg/apache/tools/ant/types/Parameter;

    .prologue
    .line 57
    iput-object p1, p0, Lorg/apache/tools/ant/types/selectors/BaseExtendSelector;->parameters:[Lorg/apache/tools/ant/types/Parameter;

    .line 58
    return-void
.end method
