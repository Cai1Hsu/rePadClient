.class public Lorg/apache/tools/ant/filters/TokenFilter$ContainsString;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "TokenFilter.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/TokenFilter$Filter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/TokenFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ContainsString"
.end annotation


# instance fields
.field private contains:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 407
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 427
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsString;->contains:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 428
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "Missing contains in containsstring"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 430
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsString;->contains:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-le v0, v1, :cond_1

    .line 433
    .end local p1    # "string":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "string":Ljava/lang/String;
    :cond_1
    const/4 p1, 0x0

    goto :goto_0
.end method

.method public setContains(Ljava/lang/String;)V
    .locals 0
    .param p1, "contains"    # Ljava/lang/String;

    .prologue
    .line 416
    iput-object p1, p0, Lorg/apache/tools/ant/filters/TokenFilter$ContainsString;->contains:Ljava/lang/String;

    .line 417
    return-void
.end method
