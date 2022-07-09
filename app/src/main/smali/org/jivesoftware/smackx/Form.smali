.class public Lorg/jivesoftware/smackx/Form;
.super Ljava/lang/Object;
.source "Form.java"


# static fields
.field public static final ELEMENT:Ljava/lang/String; = "x"

.field public static final NAMESPACE:Ljava/lang/String; = "jabber:x:data"

.field public static final TYPE_CANCEL:Ljava/lang/String; = "cancel"

.field public static final TYPE_FORM:Ljava/lang/String; = "form"

.field public static final TYPE_RESULT:Ljava/lang/String; = "result"

.field public static final TYPE_SUBMIT:Ljava/lang/String; = "submit"


# instance fields
.field private dataForm:Lorg/jivesoftware/smackx/packet/DataForm;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 107
    new-instance v0, Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-direct {v0, p1}, Lorg/jivesoftware/smackx/packet/DataForm;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jivesoftware/smackx/Form;->dataForm:Lorg/jivesoftware/smackx/packet/DataForm;

    .line 108
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/packet/DataForm;)V
    .locals 0
    .param p1, "dataForm"    # Lorg/jivesoftware/smackx/packet/DataForm;

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Lorg/jivesoftware/smackx/Form;->dataForm:Lorg/jivesoftware/smackx/packet/DataForm;

    .line 90
    return-void
.end method

.method public static getFormFrom(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/Form;
    .locals 4
    .param p0, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 71
    const-string/jumbo v2, "x"

    const-string/jumbo v3, "jabber:x:data"

    invoke-virtual {p0, v2, v3}, Lorg/jivesoftware/smack/packet/Packet;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v1

    .line 72
    .local v1, "packetExtension":Lorg/jivesoftware/smack/packet/PacketExtension;
    if-eqz v1, :cond_0

    move-object v0, v1

    .line 74
    check-cast v0, Lorg/jivesoftware/smackx/packet/DataForm;

    .line 75
    .local v0, "dataForm":Lorg/jivesoftware/smackx/packet/DataForm;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DataForm;->getReportedData()Lorg/jivesoftware/smackx/packet/DataForm$ReportedData;

    move-result-object v2

    if-nez v2, :cond_0

    .line 76
    new-instance v2, Lorg/jivesoftware/smackx/Form;

    invoke-direct {v2, v0}, Lorg/jivesoftware/smackx/Form;-><init>(Lorg/jivesoftware/smackx/packet/DataForm;)V

    .line 79
    .end local v0    # "dataForm":Lorg/jivesoftware/smackx/packet/DataForm;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private isFormType()Z
    .locals 2

    .prologue
    .line 496
    const-string/jumbo v0, "form"

    iget-object v1, p0, Lorg/jivesoftware/smackx/Form;->dataForm:Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DataForm;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private isSubmitType()Z
    .locals 2

    .prologue
    .line 505
    const-string/jumbo v0, "submit"

    iget-object v1, p0, Lorg/jivesoftware/smackx/Form;->dataForm:Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DataForm;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private setAnswer(Lorg/jivesoftware/smackx/FormField;Ljava/lang/Object;)V
    .locals 2
    .param p1, "field"    # Lorg/jivesoftware/smackx/FormField;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 284
    invoke-direct {p0}, Lorg/jivesoftware/smackx/Form;->isSubmitType()Z

    move-result v0

    if-nez v0, :cond_0

    .line 285
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Cannot set an answer if the form is not of type \"submit\""

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 288
    :cond_0
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/FormField;->resetValues()V

    .line 289
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/jivesoftware/smackx/FormField;->addValue(Ljava/lang/String;)V

    .line 290
    return-void
.end method


# virtual methods
.method public addField(Lorg/jivesoftware/smackx/FormField;)V
    .locals 1
    .param p1, "field"    # Lorg/jivesoftware/smackx/FormField;

    .prologue
    .line 116
    iget-object v0, p0, Lorg/jivesoftware/smackx/Form;->dataForm:Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/packet/DataForm;->addField(Lorg/jivesoftware/smackx/FormField;)V

    .line 117
    return-void
.end method

.method public createAnswerForm()Lorg/jivesoftware/smackx/Form;
    .locals 8

    .prologue
    .line 523
    invoke-direct {p0}, Lorg/jivesoftware/smackx/Form;->isFormType()Z

    move-result v6

    if-nez v6, :cond_0

    .line 524
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string/jumbo v7, "Only forms of type \"form\" could be answered"

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 527
    :cond_0
    new-instance v2, Lorg/jivesoftware/smackx/Form;

    const-string/jumbo v6, "submit"

    invoke-direct {v2, v6}, Lorg/jivesoftware/smackx/Form;-><init>(Ljava/lang/String;)V

    .line 528
    .local v2, "form":Lorg/jivesoftware/smackx/Form;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/Form;->getFields()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "fields":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 529
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/FormField;

    .line 532
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getVariable()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 533
    new-instance v4, Lorg/jivesoftware/smackx/FormField;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getVariable()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v6}, Lorg/jivesoftware/smackx/FormField;-><init>(Ljava/lang/String;)V

    .line 534
    .local v4, "newField":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/jivesoftware/smackx/FormField;->setType(Ljava/lang/String;)V

    .line 535
    invoke-virtual {v2, v4}, Lorg/jivesoftware/smackx/Form;->addField(Lorg/jivesoftware/smackx/FormField;)V

    .line 537
    const-string/jumbo v6, "hidden"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 540
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 541
    .local v5, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getValues()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 542
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 544
    :cond_2
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getVariable()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6, v5}, Lorg/jivesoftware/smackx/Form;->setAnswer(Ljava/lang/String;Ljava/util/List;)V

    goto :goto_0

    .line 548
    .end local v0    # "field":Lorg/jivesoftware/smackx/FormField;
    .end local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4    # "newField":Lorg/jivesoftware/smackx/FormField;
    .end local v5    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    return-object v2
.end method

.method public getDataFormToSend()Lorg/jivesoftware/smackx/packet/DataForm;
    .locals 4

    .prologue
    .line 476
    invoke-direct {p0}, Lorg/jivesoftware/smackx/Form;->isSubmitType()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 478
    new-instance v0, Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/Form;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/jivesoftware/smackx/packet/DataForm;-><init>(Ljava/lang/String;)V

    .line 479
    .local v0, "dataFormToSend":Lorg/jivesoftware/smackx/packet/DataForm;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/Form;->getFields()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 480
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/FormField;

    .line 481
    .local v1, "field":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/FormField;->getValues()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 482
    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/DataForm;->addField(Lorg/jivesoftware/smackx/FormField;)V

    goto :goto_0

    .line 487
    .end local v0    # "dataFormToSend":Lorg/jivesoftware/smackx/packet/DataForm;
    .end local v1    # "field":Lorg/jivesoftware/smackx/FormField;
    .end local v2    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    :cond_1
    iget-object v0, p0, Lorg/jivesoftware/smackx/Form;->dataForm:Lorg/jivesoftware/smackx/packet/DataForm;

    :cond_2
    return-object v0
.end method

.method public getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;
    .locals 4
    .param p1, "variable"    # Ljava/lang/String;

    .prologue
    .line 376
    if-eqz p1, :cond_0

    const-string/jumbo v2, ""

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 377
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Variable must not be null or blank."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 381
    :cond_1
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/Form;->getFields()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 382
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/FormField;

    .line 383
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getVariable()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 387
    .end local v0    # "field":Lorg/jivesoftware/smackx/FormField;
    :goto_0
    return-object v0

    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getFields()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/FormField;",
            ">;"
        }
    .end annotation

    .prologue
    .line 364
    iget-object v0, p0, Lorg/jivesoftware/smackx/Form;->dataForm:Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DataForm;->getFields()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getInstructions()Ljava/lang/String;
    .locals 3

    .prologue
    .line 396
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 398
    .local v1, "sb":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lorg/jivesoftware/smackx/Form;->dataForm:Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-virtual {v2}, Lorg/jivesoftware/smackx/packet/DataForm;->getInstructions()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 399
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 402
    const-string/jumbo v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 405
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 416
    iget-object v0, p0, Lorg/jivesoftware/smackx/Form;->dataForm:Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DataForm;->getTitle()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 436
    iget-object v0, p0, Lorg/jivesoftware/smackx/Form;->dataForm:Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DataForm;->getType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setAnswer(Ljava/lang/String;D)V
    .locals 4
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "value"    # D

    .prologue
    .line 232
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/Form;->getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v0

    .line 233
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    if-nez v0, :cond_0

    .line 234
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Field not found for the specified variable name."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 236
    :cond_0
    const-string/jumbo v1, "text-multi"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "text-private"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "text-single"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 239
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "This field is not of type double."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 241
    :cond_1
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/Form;->setAnswer(Lorg/jivesoftware/smackx/FormField;Ljava/lang/Object;)V

    .line 242
    return-void
.end method

.method public setAnswer(Ljava/lang/String;F)V
    .locals 3
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "value"    # F

    .prologue
    .line 208
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/Form;->getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v0

    .line 209
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    if-nez v0, :cond_0

    .line 210
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Field not found for the specified variable name."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 212
    :cond_0
    const-string/jumbo v1, "text-multi"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "text-private"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "text-single"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 215
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "This field is not of type float."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 217
    :cond_1
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/Form;->setAnswer(Lorg/jivesoftware/smackx/FormField;Ljava/lang/Object;)V

    .line 218
    return-void
.end method

.method public setAnswer(Ljava/lang/String;I)V
    .locals 3
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 160
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/Form;->getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v0

    .line 161
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    if-nez v0, :cond_0

    .line 162
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Field not found for the specified variable name."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 164
    :cond_0
    const-string/jumbo v1, "text-multi"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "text-private"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "text-single"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 167
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "This field is not of type int."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 169
    :cond_1
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/Form;->setAnswer(Lorg/jivesoftware/smackx/FormField;Ljava/lang/Object;)V

    .line 170
    return-void
.end method

.method public setAnswer(Ljava/lang/String;J)V
    .locals 4
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "value"    # J

    .prologue
    .line 184
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/Form;->getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v0

    .line 185
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    if-nez v0, :cond_0

    .line 186
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Field not found for the specified variable name."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 188
    :cond_0
    const-string/jumbo v1, "text-multi"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "text-private"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "text-single"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 191
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "This field is not of type long."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 193
    :cond_1
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/Form;->setAnswer(Lorg/jivesoftware/smackx/FormField;Ljava/lang/Object;)V

    .line 194
    return-void
.end method

.method public setAnswer(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 134
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/Form;->getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v0

    .line 135
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    if-nez v0, :cond_0

    .line 136
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Field not found for the specified variable name."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 138
    :cond_0
    const-string/jumbo v1, "text-multi"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "text-private"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "text-single"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "jid-single"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "hidden"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 143
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "This field is not of type String."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 145
    :cond_1
    invoke-direct {p0, v0, p2}, Lorg/jivesoftware/smackx/Form;->setAnswer(Lorg/jivesoftware/smackx/FormField;Ljava/lang/Object;)V

    .line 146
    return-void
.end method

.method public setAnswer(Ljava/lang/String;Ljava/util/List;)V
    .locals 3
    .param p1, "variable"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 306
    .local p2, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Lorg/jivesoftware/smackx/Form;->isSubmitType()Z

    move-result v1

    if-nez v1, :cond_0

    .line 307
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string/jumbo v2, "Cannot set an answer if the form is not of type \"submit\""

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 310
    :cond_0
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/Form;->getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v0

    .line 311
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    if-eqz v0, :cond_2

    .line 313
    const-string/jumbo v1, "jid-multi"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "list-multi"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "list-single"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "text-multi"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "hidden"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 318
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "This field only accept list of values."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 321
    :cond_1
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->resetValues()V

    .line 323
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/FormField;->addValues(Ljava/util/List;)V

    .line 328
    return-void

    .line 326
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Couldn\'t find a field for the specified variable."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setAnswer(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "variable"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    .line 256
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/Form;->getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v0

    .line 257
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    if-nez v0, :cond_0

    .line 258
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "Field not found for the specified variable name."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 260
    :cond_0
    const-string/jumbo v1, "boolean"

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 261
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v2, "This field is not of type boolean."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 263
    :cond_1
    if-eqz p2, :cond_2

    const-string/jumbo v1, "1"

    :goto_0
    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/Form;->setAnswer(Lorg/jivesoftware/smackx/FormField;Ljava/lang/Object;)V

    .line 264
    return-void

    .line 263
    :cond_2
    const-string/jumbo v1, "0"

    goto :goto_0
.end method

.method public setDefaultAnswer(Ljava/lang/String;)V
    .locals 4
    .param p1, "variable"    # Ljava/lang/String;

    .prologue
    .line 340
    invoke-direct {p0}, Lorg/jivesoftware/smackx/Form;->isSubmitType()Z

    move-result v2

    if-nez v2, :cond_0

    .line 341
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string/jumbo v3, "Cannot set an answer if the form is not of type \"submit\""

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 344
    :cond_0
    invoke-virtual {p0, p1}, Lorg/jivesoftware/smackx/Form;->getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v0

    .line 345
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    if-eqz v0, :cond_1

    .line 347
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->resetValues()V

    .line 349
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getValues()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 350
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Lorg/jivesoftware/smackx/FormField;->addValue(Ljava/lang/String;)V

    goto :goto_0

    .line 354
    .end local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v3, "Couldn\'t find a field for the specified variable."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 356
    .restart local v1    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_2
    return-void
.end method

.method public setInstructions(Ljava/lang/String;)V
    .locals 3
    .param p1, "instructions"    # Ljava/lang/String;

    .prologue
    .line 447
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 448
    .local v0, "instructionsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/StringTokenizer;

    const-string/jumbo v2, "\n"

    invoke-direct {v1, p1, v2}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 449
    .local v1, "st":Ljava/util/StringTokenizer;
    :goto_0
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 450
    invoke-virtual {v1}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 453
    :cond_0
    iget-object v2, p0, Lorg/jivesoftware/smackx/Form;->dataForm:Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-virtual {v2, v0}, Lorg/jivesoftware/smackx/packet/DataForm;->setInstructions(Ljava/util/List;)V

    .line 455
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 465
    iget-object v0, p0, Lorg/jivesoftware/smackx/Form;->dataForm:Lorg/jivesoftware/smackx/packet/DataForm;

    invoke-virtual {v0, p1}, Lorg/jivesoftware/smackx/packet/DataForm;->setTitle(Ljava/lang/String;)V

    .line 466
    return-void
.end method
