.class public Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;
.super Ljava/lang/Object;
.source "MacroDef.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/MacroDef;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TemplateElement"
.end annotation


# instance fields
.field private description:Ljava/lang/String;

.field private implicit:Z

.field private name:Ljava/lang/String;

.field private optional:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 576
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 580
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->optional:Z

    .line 581
    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->implicit:Z

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 672
    if-ne p1, p0, :cond_1

    .line 679
    :cond_0
    :goto_0
    return v1

    .line 675
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    :cond_2
    move v1, v2

    .line 676
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 678
    check-cast v0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;

    .line 679
    .local v0, "t":Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->name:Ljava/lang/String;

    if-nez v3, :cond_5

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->name:Ljava/lang/String;

    if-nez v3, :cond_4

    :goto_1
    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->optional:Z

    iget-boolean v4, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->optional:Z

    if-ne v3, v4, :cond_4

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->implicit:Z

    iget-boolean v4, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->implicit:Z

    if-eq v3, v4, :cond_0

    :cond_4
    move v1, v2

    goto :goto_0

    :cond_5
    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->name:Ljava/lang/String;

    iget-object v4, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    goto :goto_1
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 624
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 602
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 689
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->name:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->access$100(Ljava/lang/Object;)I

    move-result v3

    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->optional:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    add-int/2addr v0, v3

    iget-boolean v3, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->implicit:Z

    if-eqz v3, :cond_1

    :goto_1
    add-int/2addr v0, v1

    return v0

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    move v1, v2

    goto :goto_1
.end method

.method public isImplicit()Z
    .locals 1

    .prologue
    .line 662
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->implicit:Z

    return v0
.end method

.method public isOptional()Z
    .locals 1

    .prologue
    .line 643
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->optional:Z

    return v0
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 613
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->description:Ljava/lang/String;

    .line 614
    return-void
.end method

.method public setImplicit(Z)V
    .locals 0
    .param p1, "implicit"    # Z

    .prologue
    .line 653
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->implicit:Z

    .line 654
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 589
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef;->access$000(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 590
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Illegal name ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "] for macro element"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 593
    :cond_0
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->name:Ljava/lang/String;

    .line 594
    return-void
.end method

.method public setOptional(Z)V
    .locals 0
    .param p1, "optional"    # Z

    .prologue
    .line 634
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$TemplateElement;->optional:Z

    .line 635
    return-void
.end method
