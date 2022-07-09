.class public Lorg/apache/tools/ant/types/Substitution;
.super Lorg/apache/tools/ant/types/DataType;
.source "Substitution.java"


# static fields
.field public static final DATA_TYPE_NAME:Ljava/lang/String; = "substitution"


# instance fields
.field private expression:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 42
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/types/Substitution;->expression:Ljava/lang/String;

    .line 43
    return-void
.end method


# virtual methods
.method public getExpression(Lorg/apache/tools/ant/Project;)Ljava/lang/String;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 61
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Substitution;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 62
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Substitution;->getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Substitution;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Substitution;->getExpression(Lorg/apache/tools/ant/Project;)Ljava/lang/String;

    move-result-object v0

    .line 65
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/types/Substitution;->expression:Ljava/lang/String;

    goto :goto_0
.end method

.method public getRef(Lorg/apache/tools/ant/Project;)Lorg/apache/tools/ant/types/Substitution;
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 75
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/Substitution;->getCheckedRef(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Substitution;

    return-object v0
.end method

.method public setExpression(Ljava/lang/String;)V
    .locals 0
    .param p1, "expression"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p1, p0, Lorg/apache/tools/ant/types/Substitution;->expression:Ljava/lang/String;

    .line 51
    return-void
.end method
