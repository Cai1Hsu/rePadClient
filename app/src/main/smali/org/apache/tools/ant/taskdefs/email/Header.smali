.class public Lorg/apache/tools/ant/taskdefs/email/Header;
.super Ljava/lang/Object;
.source "Header.java"


# instance fields
.field private name:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/Header;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/email/Header;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 34
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Header;->name:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 50
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/email/Header;->value:Ljava/lang/String;

    .line 51
    return-void
.end method
