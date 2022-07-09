.class public Lorg/jivesoftware/smackx/pubsub/ConfigureForm;
.super Lorg/jivesoftware/smackx/Form;
.source "ConfigureForm.java"


# direct methods
.method public constructor <init>(Lorg/jivesoftware/smackx/Form;)V
    .locals 1
    .param p1, "nodeConfigForm"    # Lorg/jivesoftware/smackx/Form;

    .prologue
    .line 56
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/Form;->getDataFormToSend()Lorg/jivesoftware/smackx/packet/DataForm;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/Form;-><init>(Lorg/jivesoftware/smackx/packet/DataForm;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/packet/DataForm;)V
    .locals 0
    .param p1, "configDataForm"    # Lorg/jivesoftware/smackx/packet/DataForm;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/Form;-><init>(Lorg/jivesoftware/smackx/packet/DataForm;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Lorg/jivesoftware/smackx/pubsub/FormType;)V
    .locals 1
    .param p1, "formType"    # Lorg/jivesoftware/smackx/pubsub/FormType;

    .prologue
    .line 68
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/pubsub/FormType;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/Form;-><init>(Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method private addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V
    .locals 3
    .param p1, "nodeField"    # Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 692
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v1

    .line 694
    .local v1, "fieldName":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v2

    if-nez v2, :cond_0

    .line 696
    new-instance v0, Lorg/jivesoftware/smackx/FormField;

    invoke-direct {v0, v1}, Lorg/jivesoftware/smackx/FormField;-><init>(Ljava/lang/String;)V

    .line 697
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v0, p2}, Lorg/jivesoftware/smackx/FormField;->setType(Ljava/lang/String;)V

    .line 698
    invoke-virtual {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/FormField;)V

    .line 700
    .end local v0    # "field":Lorg/jivesoftware/smackx/FormField;
    :cond_0
    return-void
.end method

.method private getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;
    .locals 2
    .param p1, "field"    # Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    .prologue
    .line 678
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v0

    .line 680
    .local v0, "formField":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getValues()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getValues()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getFieldValues(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/util/Iterator;
    .locals 2
    .param p1, "field"    # Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;",
            ")",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 685
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getField(Ljava/lang/String;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v0

    .line 687
    .local v0, "formField":Lorg/jivesoftware/smackx/FormField;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getValues()Ljava/util/Iterator;

    move-result-object v1

    return-object v1
.end method

.method private getListSingle(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 704
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 705
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 706
    return-object v0
.end method

.method private static parseBoolean(Ljava/lang/String;)Z
    .locals 1
    .param p0, "fieldValue"    # Ljava/lang/String;

    .prologue
    .line 673
    const-string/jumbo v0, "1"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "true"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getAccessModel()Lorg/jivesoftware/smackx/pubsub/AccessModel;
    .locals 2

    .prologue
    .line 78
    sget-object v1, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->access_model:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    .line 80
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 81
    const/4 v1, 0x0

    .line 83
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lorg/jivesoftware/smackx/pubsub/AccessModel;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/AccessModel;

    move-result-object v1

    goto :goto_0
.end method

.method public getBodyXSLT()Ljava/lang/String;
    .locals 1

    .prologue
    .line 105
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->body_xslt:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getChildren()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 127
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->children:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValues(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getChildrenAssociationPolicy()Lorg/jivesoftware/smackx/pubsub/ChildrenAssociationPolicy;
    .locals 2

    .prologue
    .line 148
    sget-object v1, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->children_association_policy:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    .line 150
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 151
    const/4 v1, 0x0

    .line 153
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lorg/jivesoftware/smackx/pubsub/ChildrenAssociationPolicy;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/ChildrenAssociationPolicy;

    move-result-object v1

    goto :goto_0
.end method

.method public getChildrenAssociationWhitelist()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 178
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->children_association_whitelist:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValues(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getChildrenMax()I
    .locals 1

    .prologue
    .line 201
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->children_max:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getCollection()Ljava/lang/String;
    .locals 1

    .prologue
    .line 222
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->collection:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDataType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 623
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->type:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDataformXSLT()Ljava/lang/String;
    .locals 1

    .prologue
    .line 245
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->dataform_xslt:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItemReply()Lorg/jivesoftware/smackx/pubsub/ItemReply;
    .locals 2

    .prologue
    .line 289
    sget-object v1, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->itemreply:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    .line 291
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 292
    const/4 v1, 0x0

    .line 294
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lorg/jivesoftware/smackx/pubsub/ItemReply;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/ItemReply;

    move-result-object v1

    goto :goto_0
.end method

.method public getMaxItems()I
    .locals 1

    .prologue
    .line 316
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->max_items:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getMaxPayloadSize()I
    .locals 1

    .prologue
    .line 338
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->max_payload_size:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getNodeType()Lorg/jivesoftware/smackx/pubsub/NodeType;
    .locals 2

    .prologue
    .line 359
    sget-object v1, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->node_type:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    .line 361
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 362
    const/4 v1, 0x0

    .line 364
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lorg/jivesoftware/smackx/pubsub/NodeType;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/NodeType;

    move-result-object v1

    goto :goto_0
.end method

.method public getPublishModel()Lorg/jivesoftware/smackx/pubsub/PublishModel;
    .locals 2

    .prologue
    .line 492
    sget-object v1, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->publish_model:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    .line 494
    .local v0, "value":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 495
    const/4 v1, 0x0

    .line 497
    :goto_0
    return-object v1

    :cond_0
    invoke-static {v0}, Lorg/jivesoftware/smackx/pubsub/PublishModel;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smackx/pubsub/PublishModel;

    move-result-object v1

    goto :goto_0
.end method

.method public getReplyRoom()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 518
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->replyroom:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValues(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getReplyTo()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 539
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->replyto:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValues(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getRosterGroupsAllowed()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 560
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->roster_groups_allowed:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValues(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 602
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->title:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isDeliverPayloads()Z
    .locals 1

    .prologue
    .line 268
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->deliver_payloads:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isNotifyConfig()Z
    .locals 1

    .prologue
    .line 385
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->notify_config:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isNotifyDelete()Z
    .locals 1

    .prologue
    .line 406
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->notify_delete:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isNotifyRetract()Z
    .locals 1

    .prologue
    .line 428
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->notify_retract:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isPersistItems()Z
    .locals 1

    .prologue
    .line 450
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->persist_items:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isPresenceBasedDelivery()Z
    .locals 1

    .prologue
    .line 471
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->presence_based_delivery:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isSubscibe()Z
    .locals 1

    .prologue
    .line 581
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->subscribe:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFieldValue(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setAccessModel(Lorg/jivesoftware/smackx/pubsub/AccessModel;)V
    .locals 2
    .param p1, "accessModel"    # Lorg/jivesoftware/smackx/pubsub/AccessModel;

    .prologue
    .line 93
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->access_model:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "list-single"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 94
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->access_model:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/pubsub/AccessModel;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getListSingle(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/util/List;)V

    .line 95
    return-void
.end method

.method public setBodyXSLT(Ljava/lang/String;)V
    .locals 2
    .param p1, "bodyXslt"    # Ljava/lang/String;

    .prologue
    .line 116
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->body_xslt:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "text-single"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 117
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->body_xslt:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    return-void
.end method

.method public setChildren(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 137
    .local p1, "children":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->children:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "text-multi"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 138
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->children:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/util/List;)V

    .line 139
    return-void
.end method

.method public setChildrenAssociationPolicy(Lorg/jivesoftware/smackx/pubsub/ChildrenAssociationPolicy;)V
    .locals 3
    .param p1, "policy"    # Lorg/jivesoftware/smackx/pubsub/ChildrenAssociationPolicy;

    .prologue
    .line 163
    sget-object v1, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->children_association_policy:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v2, "list-single"

    invoke-direct {p0, v1, v2}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 164
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 165
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/pubsub/ChildrenAssociationPolicy;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 166
    sget-object v1, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->children_association_policy:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/util/List;)V

    .line 167
    return-void
.end method

.method public setChildrenAssociationWhitelist(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 190
    .local p1, "whitelist":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->children_association_whitelist:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "jid-multi"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 191
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->children_association_whitelist:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/util/List;)V

    .line 192
    return-void
.end method

.method public setChildrenMax(I)V
    .locals 2
    .param p1, "max"    # I

    .prologue
    .line 211
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->children_max:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "text-single"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 212
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->children_max:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;I)V

    .line 213
    return-void
.end method

.method public setCollection(Ljava/lang/String;)V
    .locals 2
    .param p1, "collection"    # Ljava/lang/String;

    .prologue
    .line 232
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->collection:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "text-single"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 233
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->collection:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    return-void
.end method

.method public setDataType(Ljava/lang/String;)V
    .locals 2
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 633
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->type:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "text-single"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 634
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->type:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/lang/String;)V

    .line 635
    return-void
.end method

.method public setDataformXSLT(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 257
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->dataform_xslt:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "text-single"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 258
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->dataform_xslt:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    return-void
.end method

.method public setDeliverPayloads(Z)V
    .locals 2
    .param p1, "deliver"    # Z

    .prologue
    .line 278
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->deliver_payloads:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "boolean"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 279
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->deliver_payloads:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Z)V

    .line 280
    return-void
.end method

.method public setItemReply(Lorg/jivesoftware/smackx/pubsub/ItemReply;)V
    .locals 2
    .param p1, "reply"    # Lorg/jivesoftware/smackx/pubsub/ItemReply;

    .prologue
    .line 304
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->itemreply:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "list-single"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 305
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->itemreply:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/pubsub/ItemReply;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getListSingle(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/util/List;)V

    .line 306
    return-void
.end method

.method public setMaxItems(I)V
    .locals 2
    .param p1, "max"    # I

    .prologue
    .line 327
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->max_items:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "text-single"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 328
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->max_items:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;I)V

    .line 329
    return-void
.end method

.method public setMaxPayloadSize(I)V
    .locals 2
    .param p1, "max"    # I

    .prologue
    .line 348
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->max_payload_size:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "text-single"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 349
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->max_payload_size:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;I)V

    .line 350
    return-void
.end method

.method public setNodeType(Lorg/jivesoftware/smackx/pubsub/NodeType;)V
    .locals 2
    .param p1, "type"    # Lorg/jivesoftware/smackx/pubsub/NodeType;

    .prologue
    .line 374
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->node_type:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "list-single"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 375
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->node_type:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/pubsub/NodeType;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getListSingle(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/util/List;)V

    .line 376
    return-void
.end method

.method public setNotifyConfig(Z)V
    .locals 2
    .param p1, "notify"    # Z

    .prologue
    .line 395
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->notify_config:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "boolean"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 396
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->notify_config:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Z)V

    .line 397
    return-void
.end method

.method public setNotifyDelete(Z)V
    .locals 2
    .param p1, "notify"    # Z

    .prologue
    .line 416
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->notify_delete:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "boolean"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 417
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->notify_delete:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Z)V

    .line 418
    return-void
.end method

.method public setNotifyRetract(Z)V
    .locals 2
    .param p1, "notify"    # Z

    .prologue
    .line 439
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->notify_retract:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "boolean"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 440
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->notify_retract:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Z)V

    .line 441
    return-void
.end method

.method public setPersistentItems(Z)V
    .locals 2
    .param p1, "persist"    # Z

    .prologue
    .line 460
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->persist_items:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "boolean"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 461
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->persist_items:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Z)V

    .line 462
    return-void
.end method

.method public setPresenceBasedDelivery(Z)V
    .locals 2
    .param p1, "presenceBased"    # Z

    .prologue
    .line 481
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->presence_based_delivery:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "boolean"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 482
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->presence_based_delivery:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Z)V

    .line 483
    return-void
.end method

.method public setPublishModel(Lorg/jivesoftware/smackx/pubsub/PublishModel;)V
    .locals 2
    .param p1, "publish"    # Lorg/jivesoftware/smackx/pubsub/PublishModel;

    .prologue
    .line 507
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->publish_model:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "list-single"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 508
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->publish_model:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lorg/jivesoftware/smackx/pubsub/PublishModel;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getListSingle(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/util/List;)V

    .line 509
    return-void
.end method

.method public setReplyRoom(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 528
    .local p1, "replyRooms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->replyroom:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "list-multi"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 529
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->replyroom:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/util/List;)V

    .line 530
    return-void
.end method

.method public setReplyTo(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 549
    .local p1, "replyTos":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->replyto:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "list-multi"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 550
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->replyto:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/util/List;)V

    .line 551
    return-void
.end method

.method public setRosterGroupsAllowed(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 570
    .local p1, "groups":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->roster_groups_allowed:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "list-multi"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 571
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->roster_groups_allowed:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/util/List;)V

    .line 572
    return-void
.end method

.method public setSubscribe(Z)V
    .locals 2
    .param p1, "subscribe"    # Z

    .prologue
    .line 591
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->subscribe:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "boolean"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 592
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->subscribe:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Z)V

    .line 593
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 2
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 612
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->title:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    const-string/jumbo v1, "text-single"

    invoke-direct {p0, v0, v1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->addField(Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;Ljava/lang/String;)V

    .line 613
    sget-object v0, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->title:Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/pubsub/ConfigureNodeFields;->getFieldName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->setAnswer(Ljava/lang/String;Ljava/lang/String;)V

    .line 614
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .prologue
    .line 640
    new-instance v2, Ljava/lang/StringBuilder;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, " Content ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 642
    .local v2, "result":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/jivesoftware/smackx/pubsub/ConfigureForm;->getFields()Ljava/util/Iterator;

    move-result-object v0

    .line 644
    .local v0, "fields":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 646
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/FormField;

    .line 647
    .local v1, "formField":Lorg/jivesoftware/smackx/FormField;
    const/16 v6, 0x28

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 648
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/FormField;->getVariable()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 649
    const/16 v6, 0x3a

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 651
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/FormField;->getValues()Ljava/util/Iterator;

    move-result-object v4

    .line 652
    .local v4, "values":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 654
    .local v5, "valuesBuilder":Ljava/lang/StringBuilder;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 656
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 657
    const/16 v6, 0x2c

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 658
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 659
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 662
    .end local v3    # "value":Ljava/lang/String;
    :cond_1
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-nez v6, :cond_2

    .line 663
    const-string/jumbo v6, "NOT SET"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 664
    :cond_2
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 665
    const/16 v6, 0x29

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 667
    .end local v1    # "formField":Lorg/jivesoftware/smackx/FormField;
    .end local v4    # "values":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v5    # "valuesBuilder":Ljava/lang/StringBuilder;
    :cond_3
    const/16 v6, 0x5d

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 668
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method
