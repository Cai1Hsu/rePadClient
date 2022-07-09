.class public Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;
.super Ljava/lang/Object;
.source "MacroDef.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/MacroDef;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Attribute"
.end annotation


# instance fields
.field private defaultValue:Ljava/lang/String;

.field private description:Ljava/lang/String;

.field private doubleExpanding:Z

.field private name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 330
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 334
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->doubleExpanding:Z

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 416
    if-nez p1, :cond_1

    .line 437
    :cond_0
    :goto_0
    return v1

    .line 419
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_0

    move-object v0, p1

    .line 422
    check-cast v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;

    .line 423
    .local v0, "other":Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->name:Ljava/lang/String;

    if-nez v2, :cond_4

    .line 424
    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->name:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 430
    :cond_2
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->defaultValue:Ljava/lang/String;

    if-nez v2, :cond_5

    .line 431
    iget-object v2, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->defaultValue:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 437
    :cond_3
    const/4 v1, 0x1

    goto :goto_0

    .line 427
    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->name:Ljava/lang/String;

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto :goto_0

    .line 434
    :cond_5
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->defaultValue:Ljava/lang/String;

    iget-object v3, v0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->defaultValue:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto :goto_0
.end method

.method public getDefault()Ljava/lang/String;
    .locals 1

    .prologue
    .line 370
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->defaultValue:Ljava/lang/String;

    return-object v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 353
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->name:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 444
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->defaultValue:Ljava/lang/String;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/MacroDef;->access$100(Ljava/lang/Object;)I

    move-result v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->name:Ljava/lang/String;

    invoke-static {v1}, Lorg/apache/tools/ant/taskdefs/MacroDef;->access$100(Ljava/lang/Object;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public isDoubleExpanding()Z
    .locals 1

    .prologue
    .line 406
    iget-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->doubleExpanding:Z

    return v0
.end method

.method public setDefault(Ljava/lang/String;)V
    .locals 0
    .param p1, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 363
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->defaultValue:Ljava/lang/String;

    .line 364
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "desc"    # Ljava/lang/String;

    .prologue
    .line 378
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->description:Ljava/lang/String;

    .line 379
    return-void
.end method

.method public setDoubleExpanding(Z)V
    .locals 0
    .param p1, "doubleExpanding"    # Z

    .prologue
    .line 396
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->doubleExpanding:Z

    .line 397
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 342
    invoke-static {p1}, Lorg/apache/tools/ant/taskdefs/MacroDef;->access$000(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 343
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

    .line 346
    :cond_0
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/MacroDef$Attribute;->name:Ljava/lang/String;

    .line 347
    return-void
.end method
