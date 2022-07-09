.class public Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;
.super Ljava/lang/Object;
.source "ExtraAttribute.java"


# instance fields
.field private name:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;->name:Ljava/lang/String;

    return-object v0
.end method

.method getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 38
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;->name:Ljava/lang/String;

    .line 39
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 47
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;->value:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public validate()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 75
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;->name:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 76
    const-string/jumbo v0, "Missing name from parameter."

    .line 77
    .local v0, "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "Missing name from parameter."

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 78
    .end local v0    # "message":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;->value:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 79
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "Missing value from parameter "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/extension/ExtraAttribute;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 80
    .restart local v0    # "message":Ljava/lang/String;
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v1, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 82
    .end local v0    # "message":Ljava/lang/String;
    :cond_1
    return-void
.end method
