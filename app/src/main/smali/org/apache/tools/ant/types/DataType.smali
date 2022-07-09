.class public abstract Lorg/apache/tools/ant/types/DataType;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "DataType.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field protected checked:Z

.field protected ref:Lorg/apache/tools/ant/types/Reference;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/DataType;->checked:Z

    return-void
.end method

.method public static invokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p0, "dt"    # Lorg/apache/tools/ant/types/DataType;
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 171
    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 172
    return-void
.end method

.method public static pushAndInvokeCircularReferenceCheck(Lorg/apache/tools/ant/types/DataType;Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 0
    .param p0, "dt"    # Lorg/apache/tools/ant/types/DataType;
    .param p1, "stk"    # Ljava/util/Stack;
    .param p2, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 189
    invoke-virtual {p1, p0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    invoke-virtual {p0, p1, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 191
    invoke-virtual {p1}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 192
    return-void
.end method


# virtual methods
.method protected checkAttributesAllowed()V
    .locals 1

    .prologue
    .line 319
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 320
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->tooManyAttributes()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 322
    :cond_0
    return-void
.end method

.method protected checkChildrenAllowed()V
    .locals 1

    .prologue
    .line 330
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->isReference()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 331
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->noChildrenAllowed()Lorg/apache/tools/ant/BuildException;

    move-result-object v0

    throw v0

    .line 333
    :cond_0
    return-void
.end method

.method protected circularReference()Lorg/apache/tools/ant/BuildException;
    .locals 2

    .prologue
    .line 285
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "This data type contains a circular reference."

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public clone()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 350
    invoke-super {p0}, Lorg/apache/tools/ant/ProjectComponent;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/tools/ant/types/DataType;

    .line 351
    .local v0, "dt":Lorg/apache/tools/ant/types/DataType;
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->getDescription()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/DataType;->setDescription(Ljava/lang/String;)V

    .line 352
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 353
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->getRefid()Lorg/apache/tools/ant/types/Reference;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/DataType;->setRefid(Lorg/apache/tools/ant/types/Reference;)V

    .line 355
    :cond_0
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->isChecked()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/types/DataType;->setChecked(Z)V

    .line 356
    return-object v0
.end method

.method protected dieOnCircularReference()V
    .locals 1

    .prologue
    .line 103
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 104
    return-void
.end method

.method protected dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V
    .locals 3
    .param p1, "stack"    # Ljava/util/Stack;
    .param p2, "project"    # Lorg/apache/tools/ant/Project;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/tools/ant/BuildException;
        }
    .end annotation

    .prologue
    .line 141
    iget-boolean v2, p0, Lorg/apache/tools/ant/types/DataType;->checked:Z

    if-nez v2, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->isReference()Z

    move-result v2

    if-nez v2, :cond_1

    .line 158
    :cond_0
    :goto_0
    return-void

    .line 144
    :cond_1
    iget-object v2, p0, Lorg/apache/tools/ant/types/DataType;->ref:Lorg/apache/tools/ant/types/Reference;

    invoke-virtual {v2, p2}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v1

    .line 146
    .local v1, "o":Ljava/lang/Object;
    instance-of v2, v1, Lorg/apache/tools/ant/types/DataType;

    if-eqz v2, :cond_3

    .line 147
    invoke-static {p1}, Lorg/apache/tools/ant/util/IdentityStack;->getInstance(Ljava/util/Stack;)Lorg/apache/tools/ant/util/IdentityStack;

    move-result-object v0

    .line 149
    .local v0, "id":Lorg/apache/tools/ant/util/IdentityStack;
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/IdentityStack;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 150
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->circularReference()Lorg/apache/tools/ant/BuildException;

    move-result-object v2

    throw v2

    .line 152
    :cond_2
    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/util/IdentityStack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    check-cast v1, Lorg/apache/tools/ant/types/DataType;

    .end local v1    # "o":Ljava/lang/Object;
    invoke-virtual {v1, v0, p2}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    .line 154
    invoke-virtual {v0}, Lorg/apache/tools/ant/util/IdentityStack;->pop()Ljava/lang/Object;

    .line 157
    .end local v0    # "id":Lorg/apache/tools/ant/util/IdentityStack;
    :cond_3
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/apache/tools/ant/types/DataType;->checked:Z

    goto :goto_0
.end method

.method protected dieOnCircularReference(Lorg/apache/tools/ant/Project;)V
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 112
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/DataType;->checked:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->isReference()Z

    move-result v0

    if-nez v0, :cond_1

    .line 116
    :cond_0
    :goto_0
    return-void

    .line 115
    :cond_1
    new-instance v0, Lorg/apache/tools/ant/util/IdentityStack;

    invoke-direct {v0, p0}, Lorg/apache/tools/ant/util/IdentityStack;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0, p1}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Ljava/util/Stack;Lorg/apache/tools/ant/Project;)V

    goto :goto_0
.end method

.method protected getCheckedRef()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 202
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/types/DataType;->getCheckedRef(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected getCheckedRef(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "requiredClass"    # Ljava/lang/Class;
    .param p2, "dataTypeName"    # Ljava/lang/String;

    .prologue
    .line 228
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/tools/ant/types/DataType;->getCheckedRef(Ljava/lang/Class;Ljava/lang/String;Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected getCheckedRef(Ljava/lang/Class;Ljava/lang/String;Lorg/apache/tools/ant/Project;)Ljava/lang/Object;
    .locals 4
    .param p1, "requiredClass"    # Ljava/lang/Class;
    .param p2, "dataTypeName"    # Ljava/lang/String;
    .param p3, "project"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 245
    if-nez p3, :cond_0

    .line 246
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v3, "No Project specified"

    invoke-direct {v2, v3}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 248
    :cond_0
    invoke-virtual {p0, p3}, Lorg/apache/tools/ant/types/DataType;->dieOnCircularReference(Lorg/apache/tools/ant/Project;)V

    .line 249
    iget-object v2, p0, Lorg/apache/tools/ant/types/DataType;->ref:Lorg/apache/tools/ant/types/Reference;

    invoke-virtual {v2, p3}, Lorg/apache/tools/ant/types/Reference;->getReferencedObject(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v1

    .line 250
    .local v1, "o":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 251
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " is not a subclass of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {p0, v2, v3}, Lorg/apache/tools/ant/types/DataType;->log(Ljava/lang/String;I)V

    .line 253
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v3, p0, Lorg/apache/tools/ant/types/DataType;->ref:Lorg/apache/tools/ant/types/Reference;

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/Reference;->getRefId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, " doesn\'t denote a "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 254
    .local v0, "msg":Ljava/lang/String;
    new-instance v2, Lorg/apache/tools/ant/BuildException;

    invoke-direct {v2, v0}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 256
    .end local v0    # "msg":Ljava/lang/String;
    :cond_1
    return-object v1
.end method

.method protected getCheckedRef(Lorg/apache/tools/ant/Project;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Lorg/apache/tools/ant/Project;

    .prologue
    .line 214
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->getDataTypeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1, p1}, Lorg/apache/tools/ant/types/DataType;->getCheckedRef(Ljava/lang/Class;Ljava/lang/String;Lorg/apache/tools/ant/Project;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected getDataTypeName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 95
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v0, p0, v1}, Lorg/apache/tools/ant/ComponentHelper;->getElementName(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRefid()Lorg/apache/tools/ant/types/Reference;
    .locals 1

    .prologue
    .line 310
    iget-object v0, p0, Lorg/apache/tools/ant/types/DataType;->ref:Lorg/apache/tools/ant/types/Reference;

    return-object v0
.end method

.method protected isChecked()Z
    .locals 1

    .prologue
    .line 294
    iget-boolean v0, p0, Lorg/apache/tools/ant/types/DataType;->checked:Z

    return v0
.end method

.method public isReference()Z
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/apache/tools/ant/types/DataType;->ref:Lorg/apache/tools/ant/types/Reference;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected noChildrenAllowed()Lorg/apache/tools/ant/BuildException;
    .locals 2

    .prologue
    .line 275
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "You must not specify nested elements when using refid"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method protected setChecked(Z)V
    .locals 0
    .param p1, "checked"    # Z

    .prologue
    .line 302
    iput-boolean p1, p0, Lorg/apache/tools/ant/types/DataType;->checked:Z

    .line 303
    return-void
.end method

.method public setRefid(Lorg/apache/tools/ant/types/Reference;)V
    .locals 1
    .param p1, "ref"    # Lorg/apache/tools/ant/types/Reference;

    .prologue
    .line 86
    iput-object p1, p0, Lorg/apache/tools/ant/types/DataType;->ref:Lorg/apache/tools/ant/types/Reference;

    .line 87
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/types/DataType;->checked:Z

    .line 88
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 340
    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->getDescription()Ljava/lang/String;

    move-result-object v0

    .line 341
    .local v0, "d":Ljava/lang/String;
    if-nez v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->getDataTypeName()Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/tools/ant/types/DataType;->getDataTypeName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method protected tooManyAttributes()Lorg/apache/tools/ant/BuildException;
    .locals 2

    .prologue
    .line 265
    new-instance v0, Lorg/apache/tools/ant/BuildException;

    const-string/jumbo v1, "You must not specify more than one attribute when using refid"

    invoke-direct {v0, v1}, Lorg/apache/tools/ant/BuildException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
