.class public Lorg/apache/tools/ant/types/Environment;
.super Ljava/lang/Object;
.source "Environment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/Environment$Variable;
    }
.end annotation


# instance fields
.field protected variables:Ljava/util/Vector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 137
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 138
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/Environment;->variables:Ljava/util/Vector;

    .line 139
    return-void
.end method


# virtual methods
.method public addVariable(Lorg/apache/tools/ant/types/Environment$Variable;)V
    .locals 1
    .param p1, "var"    # Lorg/apache/tools/ant/types/Environment$Variable;

    .prologue
    .line 148
    iget-object v0, p0, Lorg/apache/tools/ant/types/Environment;->variables:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 149
    return-void
.end method

.method public getVariables()[Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 157
    iget-object v2, p0, Lorg/apache/tools/ant/types/Environment;->variables:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 158
    const/4 v1, 0x0

    .line 164
    :cond_0
    return-object v1

    .line 160
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/types/Environment;->variables:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    new-array v1, v2, [Ljava/lang/String;

    .line 161
    .local v1, "result":[Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_0

    .line 162
    iget-object v2, p0, Lorg/apache/tools/ant/types/Environment;->variables:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/tools/ant/types/Environment$Variable;

    invoke-virtual {v2}, Lorg/apache/tools/ant/types/Environment$Variable;->getContent()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    .line 161
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getVariablesVector()Ljava/util/Vector;
    .locals 1

    .prologue
    .line 174
    iget-object v0, p0, Lorg/apache/tools/ant/types/Environment;->variables:Ljava/util/Vector;

    return-object v0
.end method
