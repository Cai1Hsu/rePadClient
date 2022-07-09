.class Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;
.super Ljava/lang/Object;
.source "VCardProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/provider/VCardProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "VCardReader"
.end annotation


# instance fields
.field private final document:Lorg/w3c/dom/Document;

.field private final vCard:Lorg/jivesoftware/smackx/packet/VCard;


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/packet/VCard;Lorg/w3c/dom/Document;)V
    .locals 0
    .param p1, "vCard"    # Lorg/jivesoftware/smackx/packet/VCard;
    .param p2, "document"    # Lorg/w3c/dom/Document;

    .prologue
    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    iput-object p1, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    .line 110
    iput-object p2, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->document:Lorg/w3c/dom/Document;

    .line 111
    return-void
.end method

.method private appendText(Ljava/lang/StringBuilder;Lorg/w3c/dom/Node;)V
    .locals 5
    .param p1, "result"    # Ljava/lang/StringBuilder;
    .param p2, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 282
    invoke-interface {p2}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 283
    .local v0, "childNodes":Lorg/w3c/dom/NodeList;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v4

    if-ge v1, v4, :cond_1

    .line 284
    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v2

    .line 285
    .local v2, "nd":Lorg/w3c/dom/Node;
    invoke-interface {v2}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    .line 286
    .local v3, "nodeValue":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 287
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    :cond_0
    invoke-direct {p0, p1, v2}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->appendText(Ljava/lang/StringBuilder;Lorg/w3c/dom/Node;)V

    .line 283
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 291
    .end local v2    # "nd":Lorg/w3c/dom/Node;
    .end local v3    # "nodeValue":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private getTagContents(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 249
    iget-object v1, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->document:Lorg/w3c/dom/Document;

    invoke-interface {v1, p1}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 250
    .local v0, "nodes":Lorg/w3c/dom/NodeList;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 251
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->getTextContent(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v1

    .line 253
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private getTextContent(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 2
    .param p1, "node"    # Lorg/w3c/dom/Node;

    .prologue
    .line 276
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 277
    .local v0, "result":Ljava/lang/StringBuilder;
    invoke-direct {p0, v0, p1}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->appendText(Ljava/lang/StringBuilder;Lorg/w3c/dom/Node;)V

    .line 278
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private isWorkHome(Ljava/lang/String;)Z
    .locals 1
    .param p1, "nodeName"    # Ljava/lang/String;

    .prologue
    .line 212
    const-string/jumbo v0, "HOME"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string/jumbo v0, "WORK"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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

.method private setupAddresses()V
    .locals 13

    .prologue
    .line 216
    iget-object v10, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->document:Lorg/w3c/dom/Document;

    const-string/jumbo v11, "ADR"

    invoke-interface {v10, v11}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 217
    .local v1, "allAddresses":Lorg/w3c/dom/NodeList;
    if-nez v1, :cond_1

    .line 246
    :cond_0
    return-void

    .line 218
    :cond_1
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10

    if-ge v4, v10, :cond_0

    .line 219
    invoke-interface {v1, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 221
    .local v0, "addressNode":Lorg/w3c/dom/Element;
    const/4 v8, 0x0

    .line 222
    .local v8, "type":Ljava/lang/String;
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 223
    .local v3, "code":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 224
    .local v9, "value":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 225
    .local v2, "childNodes":Lorg/w3c/dom/NodeList;
    const/4 v5, 0x0

    .local v5, "j":I
    :goto_1
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v10

    if-ge v5, v10, :cond_4

    .line 226
    invoke-interface {v2, v5}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v6

    .line 227
    .local v6, "node":Lorg/w3c/dom/Node;
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v10

    const/4 v11, 0x1

    if-eq v10, v11, :cond_2

    .line 225
    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 228
    :cond_2
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    .line 229
    .local v7, "nodeName":Ljava/lang/String;
    invoke-direct {p0, v7}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->isWorkHome(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 230
    move-object v8, v7

    goto :goto_2

    .line 233
    :cond_3
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 234
    invoke-direct {p0, v6}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->getTextContent(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 237
    .end local v6    # "node":Lorg/w3c/dom/Node;
    .end local v7    # "nodeName":Ljava/lang/String;
    :cond_4
    const/4 v5, 0x0

    :goto_3
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v10

    if-ge v5, v10, :cond_6

    .line 238
    const-string/jumbo v10, "HOME"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 239
    iget-object v12, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v12, v10, v11}, Lorg/jivesoftware/smackx/packet/VCard;->setAddressFieldHome(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    :goto_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 242
    :cond_5
    iget-object v12, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-interface {v9, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-virtual {v12, v10, v11}, Lorg/jivesoftware/smackx/packet/VCard;->setAddressFieldWork(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 218
    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method private setupEmails()V
    .locals 5

    .prologue
    .line 166
    iget-object v3, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->document:Lorg/w3c/dom/Document;

    const-string/jumbo v4, "USERID"

    invoke-interface {v3, v4}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 167
    .local v2, "nodes":Lorg/w3c/dom/NodeList;
    if-nez v2, :cond_1

    .line 177
    :cond_0
    return-void

    .line 168
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-ge v1, v3, :cond_0

    .line 169
    invoke-interface {v2, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    check-cast v0, Lorg/w3c/dom/Element;

    .line 170
    .local v0, "element":Lorg/w3c/dom/Element;
    const-string/jumbo v3, "WORK"

    invoke-interface {v0}, Lorg/w3c/dom/Element;->getParentNode()Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v4

    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 171
    iget-object v3, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->getTextContent(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/VCard;->setEmailWork(Ljava/lang/String;)V

    .line 168
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 174
    :cond_2
    iget-object v3, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    invoke-direct {p0, v0}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->getTextContent(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jivesoftware/smackx/packet/VCard;->setEmailHome(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private setupPhones()V
    .locals 11

    .prologue
    .line 180
    iget-object v9, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->document:Lorg/w3c/dom/Document;

    const-string/jumbo v10, "TEL"

    invoke-interface {v9, v10}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 181
    .local v0, "allPhones":Lorg/w3c/dom/NodeList;
    if-nez v0, :cond_1

    .line 209
    :cond_0
    return-void

    .line 182
    :cond_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v9

    if-ge v2, v9, :cond_0

    .line 183
    invoke-interface {v0, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v9

    invoke-interface {v9}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v6

    .line 184
    .local v6, "nodes":Lorg/w3c/dom/NodeList;
    const/4 v7, 0x0

    .line 185
    .local v7, "type":Ljava/lang/String;
    const/4 v1, 0x0

    .line 186
    .local v1, "code":Ljava/lang/String;
    const/4 v8, 0x0

    .line 187
    .local v8, "value":Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    invoke-interface {v6}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v9

    if-ge v3, v9, :cond_5

    .line 188
    invoke-interface {v6, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 189
    .local v4, "node":Lorg/w3c/dom/Node;
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v9

    const/4 v10, 0x1

    if-eq v9, v10, :cond_2

    .line 187
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 190
    :cond_2
    invoke-interface {v4}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    .line 191
    .local v5, "nodeName":Ljava/lang/String;
    const-string/jumbo v9, "NUMBER"

    invoke-virtual {v9, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 192
    invoke-direct {p0, v4}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->getTextContent(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v8

    goto :goto_2

    .line 194
    :cond_3
    invoke-direct {p0, v5}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->isWorkHome(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 195
    move-object v7, v5

    goto :goto_2

    .line 198
    :cond_4
    move-object v1, v5

    goto :goto_2

    .line 201
    .end local v4    # "node":Lorg/w3c/dom/Node;
    .end local v5    # "nodeName":Ljava/lang/String;
    :cond_5
    if-eqz v1, :cond_6

    if-nez v8, :cond_7

    .line 182
    :cond_6
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 202
    :cond_7
    const-string/jumbo v9, "HOME"

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 203
    iget-object v9, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    invoke-virtual {v9, v1, v8}, Lorg/jivesoftware/smackx/packet/VCard;->setPhoneHome(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 206
    :cond_8
    iget-object v9, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    invoke-virtual {v9, v1, v8}, Lorg/jivesoftware/smackx/packet/VCard;->setPhoneWork(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3
.end method

.method private setupPhoto()V
    .locals 14

    .prologue
    .line 131
    const/4 v0, 0x0

    .line 132
    .local v0, "binval":Ljava/lang/String;
    const/4 v5, 0x0

    .line 134
    .local v5, "mimetype":Ljava/lang/String;
    iget-object v12, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->document:Lorg/w3c/dom/Document;

    const-string/jumbo v13, "PHOTO"

    invoke-interface {v12, v13}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v9

    .line 135
    .local v9, "photo":Lorg/w3c/dom/NodeList;
    invoke-interface {v9}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v12

    const/4 v13, 0x1

    if-eq v12, v13, :cond_1

    .line 163
    :cond_0
    :goto_0
    return-void

    .line 138
    :cond_1
    const/4 v12, 0x0

    invoke-interface {v9, v12}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v10

    .line 139
    .local v10, "photoNode":Lorg/w3c/dom/Node;
    invoke-interface {v10}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 141
    .local v2, "childNodes":Lorg/w3c/dom/NodeList;
    invoke-interface {v2}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v1

    .line 142
    .local v1, "childNodeCount":I
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 143
    .local v8, "nodes":Ljava/util/List;, "Ljava/util/List<Lorg/w3c/dom/Node;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    if-ge v3, v1, :cond_2

    .line 144
    invoke-interface {v2, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v12

    invoke-interface {v8, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 146
    :cond_2
    const/4 v7, 0x0

    .line 147
    .local v7, "name":Ljava/lang/String;
    const/4 v11, 0x0

    .line 148
    .local v11, "value":Ljava/lang/String;
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_3
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/w3c/dom/Node;

    .line 149
    .local v6, "n":Lorg/w3c/dom/Node;
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v7

    .line 150
    invoke-interface {v6}, Lorg/w3c/dom/Node;->getTextContent()Ljava/lang/String;

    move-result-object v11

    .line 151
    const-string/jumbo v12, "BINVAL"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    .line 152
    move-object v0, v11

    goto :goto_2

    .line 154
    :cond_4
    const-string/jumbo v12, "TYPE"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 155
    move-object v5, v11

    goto :goto_2

    .line 159
    .end local v6    # "n":Lorg/w3c/dom/Node;
    :cond_5
    if-eqz v0, :cond_0

    if-eqz v5, :cond_0

    .line 162
    iget-object v12, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    invoke-virtual {v12, v0, v5}, Lorg/jivesoftware/smackx/packet/VCard;->setAvatar(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private setupSimpleFields()V
    .locals 7

    .prologue
    .line 257
    iget-object v5, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->document:Lorg/w3c/dom/Document;

    invoke-interface {v5}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v0

    .line 258
    .local v0, "childNodes":Lorg/w3c/dom/NodeList;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    invoke-interface {v0}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-ge v3, v5, :cond_2

    .line 259
    invoke-interface {v0, v3}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v4

    .line 260
    .local v4, "node":Lorg/w3c/dom/Node;
    instance-of v5, v4, Lorg/w3c/dom/Element;

    if-eqz v5, :cond_0

    move-object v1, v4

    .line 261
    check-cast v1, Lorg/w3c/dom/Element;

    .line 263
    .local v1, "element":Lorg/w3c/dom/Element;
    invoke-interface {v1}, Lorg/w3c/dom/Element;->getNodeName()Ljava/lang/String;

    move-result-object v2

    .line 264
    .local v2, "field":Ljava/lang/String;
    invoke-interface {v1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    if-nez v5, :cond_1

    .line 265
    iget-object v5, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    const-string/jumbo v6, ""

    invoke-virtual {v5, v2, v6}, Lorg/jivesoftware/smackx/packet/VCard;->setField(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    .end local v1    # "element":Lorg/w3c/dom/Element;
    .end local v2    # "field":Ljava/lang/String;
    :cond_0
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 267
    .restart local v1    # "element":Lorg/w3c/dom/Element;
    .restart local v2    # "field":Ljava/lang/String;
    :cond_1
    invoke-interface {v1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    invoke-interface {v5}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    invoke-interface {v1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v5

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v5

    instance-of v5, v5, Lorg/w3c/dom/Text;

    if-eqz v5, :cond_0

    .line 269
    iget-object v5, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->getTextContent(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v2, v6}, Lorg/jivesoftware/smackx/packet/VCard;->setField(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 273
    .end local v1    # "element":Lorg/w3c/dom/Element;
    .end local v2    # "field":Ljava/lang/String;
    .end local v4    # "node":Lorg/w3c/dom/Node;
    :cond_2
    return-void
.end method


# virtual methods
.method public initializeFields()V
    .locals 2

    .prologue
    .line 114
    iget-object v0, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    const-string/jumbo v1, "GIVEN"

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->getTagContents(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/VCard;->setFirstName(Ljava/lang/String;)V

    .line 115
    iget-object v0, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    const-string/jumbo v1, "FAMILY"

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->getTagContents(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/VCard;->setLastName(Ljava/lang/String;)V

    .line 116
    iget-object v0, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    const-string/jumbo v1, "MIDDLE"

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->getTagContents(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/VCard;->setMiddleName(Ljava/lang/String;)V

    .line 117
    invoke-direct {p0}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->setupPhoto()V

    .line 119
    invoke-direct {p0}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->setupEmails()V

    .line 121
    iget-object v0, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    const-string/jumbo v1, "ORGNAME"

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->getTagContents(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/VCard;->setOrganization(Ljava/lang/String;)V

    .line 122
    iget-object v0, p0, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->vCard:Lorg/jivesoftware/smackx/packet/VCard;

    const-string/jumbo v1, "ORGUNIT"

    invoke-direct {p0, v1}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->getTagContents(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/jivesoftware/smackx/packet/VCard;->setOrganizationUnit(Ljava/lang/String;)V

    .line 124
    invoke-direct {p0}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->setupSimpleFields()V

    .line 126
    invoke-direct {p0}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->setupPhones()V

    .line 127
    invoke-direct {p0}, Lorg/jivesoftware/smackx/provider/VCardProvider$VCardReader;->setupAddresses()V

    .line 128
    return-void
.end method
