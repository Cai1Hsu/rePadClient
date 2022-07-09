.class public Lorg/apache/tools/ant/types/FilterSet$Filter;
.super Ljava/lang/Object;
.source "FilterSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/FilterSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Filter"
.end annotation


# instance fields
.field token:Ljava/lang/String;

.field value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "token"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/types/FilterSet$Filter;->setToken(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p0, p2}, Lorg/apache/tools/ant/types/FilterSet$Filter;->setValue(Ljava/lang/String;)V

    .line 62
    return-void
.end method


# virtual methods
.method public getToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 94
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterSet$Filter;->token:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lorg/apache/tools/ant/types/FilterSet$Filter;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setToken(Ljava/lang/String;)V
    .locals 0
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 76
    iput-object p1, p0, Lorg/apache/tools/ant/types/FilterSet$Filter;->token:Ljava/lang/String;

    .line 77
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lorg/apache/tools/ant/types/FilterSet$Filter;->value:Ljava/lang/String;

    .line 86
    return-void
.end method
