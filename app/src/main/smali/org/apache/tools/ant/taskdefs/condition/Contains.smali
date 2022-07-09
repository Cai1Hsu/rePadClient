.class public Lorg/apache/tools/ant/taskdefs/condition/Contains;
.super Ljava/lang/Object;
.source "Contains.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/condition/Condition;


# instance fields
.field private caseSensitive:Z

.field private string:Ljava/lang/String;

.field private subString:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/condition/Contains;->caseSensitive:Z

    return-void
.end method


# virtual methods
.method public eval()Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v4, -0x1

    .line 67
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Contains;->string:Ljava/lang/String;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Contains;->subString:Ljava/lang/String;

    if-nez v2, :cond_1

    .line 68
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "both string and substring are required in contains"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 72
    :cond_1
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Contains;->caseSensitive:Z

    if-eqz v2, :cond_4

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Contains;->string:Ljava/lang/String;

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/Contains;->subString:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-le v2, v4, :cond_3

    :cond_2
    :goto_0
    return v0

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/condition/Contains;->string:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/condition/Contains;->subString:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-gt v2, v4, :cond_2

    move v0, v1

    goto :goto_0
.end method

.method public setCasesensitive(Z)V
    .locals 0
    .param p1, "b"    # Z

    .prologue
    .line 58
    iput-boolean p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Contains;->caseSensitive:Z

    .line 59
    return-void
.end method

.method public setString(Ljava/lang/String;)V
    .locals 0
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Contains;->string:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public setSubstring(Ljava/lang/String;)V
    .locals 0
    .param p1, "subString"    # Ljava/lang/String;

    .prologue
    .line 49
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/condition/Contains;->subString:Ljava/lang/String;

    .line 50
    return-void
.end method
