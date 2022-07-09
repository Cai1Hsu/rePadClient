.class public Lorg/apache/tools/ant/taskdefs/MacroDef$Text;
.super Ljava/lang/Object;
.source "MacroDef.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/MacroDef;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Text"
.end annotation


# instance fields
.field private defaultString:Ljava/lang/String;

.field private description:Ljava/lang/String;

.field private name:Ljava/lang/String;

.field private optional:Z

.field private trim:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 452
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 548
    if-nez p1, :cond_1

    .line 555
    :cond_0
    :goto_0
    return v1

    .line 551
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_0

    move-object v0, p1

    .line 554
    check-cast v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;

    .line 555
    .local v0, "other":Lorg/apache/tools/ant/taskdefs/MacroDef$Text;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->name:Ljava/lang/String;

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->name:Ljava/lang/String;

    invoke-static {v2, v3}, Lorg/apache/tools/ant/taskdefs/MacroDef;->access$200(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->optional:Z

    iget-boolean v3, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->optional:Z

    if-ne v2, v3, :cond_0

    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->trim:Z

    iget-boolean v3, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->trim:Z

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->defaultString:Ljava/lang/String;

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->defaultString:Ljava/lang/String;

    invoke-static {v2, v3}, Lorg/apache/tools/ant/taskdefs/MacroDef;->access$200(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getDefault()Ljava/lang/String;
    .locals 1

    .prologue
    .line 538
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->defaultString:Ljava/lang/String;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 524
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 476
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getOptional()Z
    .locals 1

    .prologue
    .line 492
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->optional:Z

    return v0
.end method

.method public getTrim()Z
    .locals 1

    .prologue
    .line 509
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->trim:Z

    return v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 565
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->name:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->access$100(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public setDefault(Ljava/lang/String;)V
    .locals 0
    .param p1, "defaultString"    # Ljava/lang/String;

    .prologue
    .line 531
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->defaultString:Ljava/lang/String;

    .line 532
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 516
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->description:Ljava/lang/String;

    .line 517
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 465
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef;->access$000(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 466
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Illegal name ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "] for attribute"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 469
    :cond_0
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->name:Ljava/lang/String;

    .line 470
    return-void
.end method

.method public setOptional(Z)V
    .locals 0
    .param p1, "optional"    # Z

    .prologue
    .line 485
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->optional:Z

    .line 486
    return-void
.end method

.method public setTrim(Z)V
    .locals 0
    .param p1, "trim"    # Z

    .prologue
    .line 502
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Text;->trim:Z

    .line 503
    return-void
.end method
