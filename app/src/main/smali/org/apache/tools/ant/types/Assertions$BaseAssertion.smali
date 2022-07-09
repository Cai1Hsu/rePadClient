.class public abstract Lorg/apache/tools/ant/types/Assertions$BaseAssertion;
.super Ljava/lang/Object;
.source "Assertions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/Assertions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BaseAssertion"
.end annotation


# instance fields
.field private className:Ljava/lang/String;

.field private packageName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 265
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected getClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 291
    iget-object v0, p0, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->className:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getCommandPrefix()Ljava/lang/String;
.end method

.method protected getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 300
    iget-object v0, p0, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method public setClass(Ljava/lang/String;)V
    .locals 0
    .param p1, "className"    # Ljava/lang/String;

    .prologue
    .line 274
    iput-object p1, p0, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->className:Ljava/lang/String;

    .line 275
    return-void
.end method

.method public setPackage(Ljava/lang/String;)V
    .locals 0
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 282
    iput-object p1, p0, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->packageName:Ljava/lang/String;

    .line 283
    return-void
.end method

.method public toCommand()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x3a

    .line 316
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->getPackageName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->getClassName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 317
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Both package and class have been set"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 319
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->getCommandPrefix()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 321
    .local v0, "command":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->getPackageName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 323
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 324
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 325
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "..."

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 327
    const-string/jumbo v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 334
    :cond_1
    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 329
    :cond_2
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->getClassName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 331
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 332
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->getClassName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0
.end method
