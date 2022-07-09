.class public final Lorg/apache/tools/ant/types/Parameter;
.super Ljava/lang/Object;
.source "Parameter.java"


# instance fields
.field private name:Ljava/lang/String;

.field private type:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object v0, p0, Lorg/apache/tools/ant/types/Parameter;->name:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lorg/apache/tools/ant/types/Parameter;->type:Ljava/lang/String;

    .line 27
    iput-object v0, p0, Lorg/apache/tools/ant/types/Parameter;->value:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lorg/apache/tools/ant/types/Parameter;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/apache/tools/ant/types/Parameter;->type:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lorg/apache/tools/ant/types/Parameter;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 35
    iput-object p1, p0, Lorg/apache/tools/ant/types/Parameter;->name:Ljava/lang/String;

    .line 36
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 44
    iput-object p1, p0, Lorg/apache/tools/ant/types/Parameter;->type:Ljava/lang/String;

    .line 45
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 53
    iput-object p1, p0, Lorg/apache/tools/ant/types/Parameter;->value:Ljava/lang/String;

    .line 54
    return-void
.end method
