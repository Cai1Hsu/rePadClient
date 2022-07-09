.class public final Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;
.super Ljava/lang/Object;
.source "XMLValidateTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Property"
.end annotation


# instance fields
.field private name:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 727
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 736
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 751
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 743
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;->name:Ljava/lang/String;

    .line 744
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 758
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/XMLValidateTask$Property;->value:Ljava/lang/String;

    .line 759
    return-void
.end method
