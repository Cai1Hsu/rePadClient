.class public Lorg/apache/tools/ant/types/Assertions;
.super Lorg/apache/tools/ant/types/DataType;
.source "Assertions.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/types/Assertions$DisabledAssertion;,
        Lorg/apache/tools/ant/types/Assertions$EnabledAssertion;,
        Lorg/apache/tools/ant/types/Assertions$BaseAssertion;
    }
.end annotation


# instance fields
.field private assertionList:Ljava/util/ArrayList;

.field private enableSystemAssertions:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 69
    invoke-direct {p0}, Lorg/apache/tools/ant/types/DataType;-><init>()V

    .line 79
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/types/Assertions;->assertionList:Ljava/util/ArrayList;

    .line 356
    return-void
.end method

.method private static addVmArgument(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;)V
    .locals 1
    .param p0, "command"    # Lorg/apache/tools/ant/types/CommandlineJava;
    .param p1, "arg"    # Ljava/lang/String;

    .prologue
    .line 244
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/CommandlineJava;->createVmArgument()Lorg/apache/tools/ant/types/Commandline$Argument;

    move-result-object v0

    .line 245
    .local v0, "argument":Lorg/apache/tools/ant/types/Commandline$Argument;
    invoke-virtual {v0, p1}, Lorg/apache/tools/ant/types/Commandline$Argument;->setValue(Ljava/lang/String;)V

    .line 246
    return-void
.end method

.method private getFinalReference()Lorg/apache/tools/ant/types/Assertions;
    .locals 3

    .prologue
    .line 132
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v1

    if-nez v1, :cond_0

    .line 139
    .end local p0    # "this":Lorg/apache/tools/ant/types/Assertions;
    :goto_0
    return-object p0

    .line 135
    .restart local p0    # "this":Lorg/apache/tools/ant/types/Assertions;
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v1

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    .line 136
    .local v0, "o":Ljava/lang/Object;
    instance-of v1, v0, Lorg/apache/tools/ant/types/Assertions;

    if-nez v1, :cond_1

    .line 137
    new-instance v1, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v2, "reference is of wrong type"

    invoke-direct {v1, v2}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 139
    :cond_1
    check-cast v0, Lorg/apache/tools/ant/types/Assertions;

    .end local v0    # "o":Ljava/lang/Object;
    move-object p0, v0

    goto :goto_0
.end method

.method private getFinalSize()I
    .locals 2

    .prologue
    .line 158
    iget-object v0, p0, Lorg/apache/tools/ant/types/Assertions;->assertionList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v0, p0, Lorg/apache/tools/ant/types/Assertions;->enableSystemAssertions:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    add-int/2addr v0, v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addDisable(Lorg/apache/tools/ant/types/Assertions$DisabledAssertion;)V
    .locals 1
    .param p1, "assertion"    # Lorg/apache/tools/ant/types/Assertions$DisabledAssertion;

    .prologue
    .line 96
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->checkChildrenAllowed()V

    .line 97
    iget-object v0, p0, Lorg/apache/tools/ant/types/Assertions;->assertionList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 98
    return-void
.end method

.method public addEnable(Lorg/apache/tools/ant/types/Assertions$EnabledAssertion;)V
    .locals 1
    .param p1, "assertion"    # Lorg/apache/tools/ant/types/Assertions$EnabledAssertion;

    .prologue
    .line 87
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->checkChildrenAllowed()V

    .line 88
    iget-object v0, p0, Lorg/apache/tools/ant/types/Assertions;->assertionList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    return-void
.end method

.method public applyAssertions(Ljava/util/List;)V
    .locals 8
    .param p1, "commandList"    # Ljava/util/List;

    .prologue
    const/4 v7, 0x4

    .line 167
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    const-string/jumbo v5, "Applying assertions"

    invoke-virtual {v4, v5, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 168
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Assertions;->getFinalReference()Lorg/apache/tools/ant/types/Assertions;

    move-result-object v2

    .line 170
    .local v2, "clause":Lorg/apache/tools/ant/types/Assertions;
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v5, v2, Lorg/apache/tools/ant/types/Assertions;->enableSystemAssertions:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 171
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    const-string/jumbo v5, "Enabling system assertions"

    invoke-virtual {v4, v5, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 172
    const-string/jumbo v4, "-enablesystemassertions"

    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    :cond_0
    :goto_0
    iget-object v4, v2, Lorg/apache/tools/ant/types/Assertions;->assertionList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 180
    .local v3, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 181
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;

    .line 182
    .local v1, "assertion":Lorg/apache/tools/ant/types/Assertions$BaseAssertion;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->toCommand()Ljava/lang/String;

    move-result-object v0

    .line 183
    .local v0, "arg":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "adding assertion "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 184
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 173
    .end local v0    # "arg":Ljava/lang/String;
    .end local v1    # "assertion":Lorg/apache/tools/ant/types/Assertions$BaseAssertion;
    .end local v3    # "it":Ljava/util/Iterator;
    :cond_1
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iget-object v5, v2, Lorg/apache/tools/ant/types/Assertions;->enableSystemAssertions:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 174
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    const-string/jumbo v5, "disabling system assertions"

    invoke-virtual {v4, v5, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 175
    const-string/jumbo v4, "-disablesystemassertions"

    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 186
    .restart local v3    # "it":Ljava/util/Iterator;
    :cond_2
    return-void
.end method

.method public applyAssertions(Ljava/util/ListIterator;)V
    .locals 8
    .param p1, "commandIterator"    # Ljava/util/ListIterator;

    .prologue
    const/4 v7, 0x4

    .line 216
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    const-string/jumbo v5, "Applying assertions"

    invoke-virtual {v4, v5, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 217
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Assertions;->getFinalReference()Lorg/apache/tools/ant/types/Assertions;

    move-result-object v2

    .line 219
    .local v2, "clause":Lorg/apache/tools/ant/types/Assertions;
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v5, v2, Lorg/apache/tools/ant/types/Assertions;->enableSystemAssertions:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 220
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    const-string/jumbo v5, "Enabling system assertions"

    invoke-virtual {v4, v5, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 221
    const-string/jumbo v4, "-enablesystemassertions"

    invoke-interface {p1, v4}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    .line 228
    :cond_0
    :goto_0
    iget-object v4, v2, Lorg/apache/tools/ant/types/Assertions;->assertionList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 229
    .local v3, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 230
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;

    .line 231
    .local v1, "assertion":Lorg/apache/tools/ant/types/Assertions$BaseAssertion;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->toCommand()Ljava/lang/String;

    move-result-object v0

    .line 232
    .local v0, "arg":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuffer;

    invoke-direct {v5}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v6, "adding assertion "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 233
    invoke-interface {p1, v0}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    goto :goto_1

    .line 222
    .end local v0    # "arg":Ljava/lang/String;
    .end local v1    # "assertion":Lorg/apache/tools/ant/types/Assertions$BaseAssertion;
    .end local v3    # "it":Ljava/util/Iterator;
    :cond_1
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iget-object v5, v2, Lorg/apache/tools/ant/types/Assertions;->enableSystemAssertions:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 223
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v4

    const-string/jumbo v5, "disabling system assertions"

    invoke-virtual {v4, v5, v7}, Lorg/apache/tools/ant/Project;->log(Ljava/lang/String;I)V

    .line 224
    const-string/jumbo v4, "-disablesystemassertions"

    invoke-interface {p1, v4}, Ljava/util/ListIterator;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 235
    .restart local v3    # "it":Ljava/util/Iterator;
    :cond_2
    return-void
.end method

.method public applyAssertions(Lorg/apache/tools/ant/types/CommandlineJava;)V
    .locals 6
    .param p1, "command"    # Lorg/apache/tools/ant/types/CommandlineJava;

    .prologue
    .line 193
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Assertions;->getFinalReference()Lorg/apache/tools/ant/types/Assertions;

    move-result-object v2

    .line 195
    .local v2, "clause":Lorg/apache/tools/ant/types/Assertions;
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iget-object v5, v2, Lorg/apache/tools/ant/types/Assertions;->enableSystemAssertions:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 196
    const-string/jumbo v4, "-enablesystemassertions"

    invoke-static {p1, v4}, Lorg/apache/tools/ant/types/Assertions;->addVmArgument(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;)V

    .line 202
    :cond_0
    :goto_0
    iget-object v4, v2, Lorg/apache/tools/ant/types/Assertions;->assertionList:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 203
    .local v3, "it":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 204
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;

    .line 205
    .local v1, "assertion":Lorg/apache/tools/ant/types/Assertions$BaseAssertion;
    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Assertions$BaseAssertion;->toCommand()Ljava/lang/String;

    move-result-object v0

    .line 206
    .local v0, "arg":Ljava/lang/String;
    invoke-static {p1, v0}, Lorg/apache/tools/ant/types/Assertions;->addVmArgument(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;)V

    goto :goto_1

    .line 197
    .end local v0    # "arg":Ljava/lang/String;
    .end local v1    # "assertion":Lorg/apache/tools/ant/types/Assertions$BaseAssertion;
    .end local v3    # "it":Ljava/util/Iterator;
    :cond_1
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iget-object v5, v2, Lorg/apache/tools/ant/types/Assertions;->enableSystemAssertions:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 198
    const-string/jumbo v4, "-disablesystemassertions"

    invoke-static {p1, v4}, Lorg/apache/tools/ant/types/Assertions;->addVmArgument(Lorg/apache/tools/ant/types/CommandlineJava;Ljava/lang/String;)V

    goto :goto_0

    .line 208
    .restart local v3    # "it":Ljava/util/Iterator;
    :cond_2
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 256
    invoke-super {p0}, Lorg/apache/tools/ant/types/DataType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/Assertions;

    .line 257
    .local v0, "that":Lorg/apache/tools/ant/types/Assertions;
    iget-object v1, p0, Lorg/apache/tools/ant/types/Assertions;->assertionList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    iput-object v1, v0, Lorg/apache/tools/ant/types/Assertions;->assertionList:Ljava/util/ArrayList;

    .line 258
    return-object v0
.end method

.method public setEnableSystemAssertions(Ljava/lang/Boolean;)V
    .locals 0
    .param p1, "enableSystemAssertions"    # Ljava/lang/Boolean;

    .prologue
    .line 107
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->checkAttributesAllowed()V

    .line 108
    iput-object p1, p0, Lorg/apache/tools/ant/types/Assertions;->enableSystemAssertions:Ljava/lang/Boolean;

    .line 109
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "ref"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 121
    iget-object v0, p0, Lorg/apache/tools/ant/types/Assertions;->assertionList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/types/Assertions;->enableSystemAssertions:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    .line 122
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/Assertions;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 124
    :cond_1
    invoke-super {p0, p1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 125
    return-void
.end method

.method public size()I
    .locals 2

    .prologue
    .line 148
    invoke-direct {p0}, Lorg/apache/tools/ant/types/Assertions;->getFinalReference()Lorg/apache/tools/ant/types/Assertions;

    move-result-object v0

    .line 149
    .local v0, "clause":Lorg/apache/tools/ant/types/Assertions;
    invoke-direct {v0}, Lorg/apache/tools/ant/types/Assertions;->getFinalSize()I

    move-result v1

    return v1
.end method
