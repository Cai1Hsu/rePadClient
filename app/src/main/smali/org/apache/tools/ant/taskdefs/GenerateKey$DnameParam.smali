.class public Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;
.super Ljava/lang/Object;
.source "GenerateKey.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/GenerateKey;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DnameParam"
.end annotation


# instance fields
.field private name:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 57
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;->name:Ljava/lang/String;

    .line 50
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 65
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/GenerateKey$DnameParam;->value:Ljava/lang/String;

    .line 66
    return-void
.end method
