.class public Lorg/jivesoftware/smackx/provider/DataFormProvider;
.super Ljava/lang/Object;
.source "DataFormProvider.java"

# interfaces
.implements Lorg/jivesoftware/smack/provider/PacketExtensionProvider;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method private parseField(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/FormField;
    .locals 5
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 78
    const/4 v0, 0x0

    .line 79
    .local v0, "done":Z
    new-instance v2, Lorg/jivesoftware/smackx/FormField;

    const-string/jumbo v3, ""

    const-string/jumbo v4, "var"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smackx/FormField;-><init>(Ljava/lang/String;)V

    .line 80
    .local v2, "formField":Lorg/jivesoftware/smackx/FormField;
    const-string/jumbo v3, ""

    const-string/jumbo v4, "label"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/FormField;->setLabel(Ljava/lang/String;)V

    .line 81
    const-string/jumbo v3, ""

    const-string/jumbo v4, "type"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/FormField;->setType(Ljava/lang/String;)V

    .line 82
    :cond_0
    :goto_0
    if-nez v0, :cond_5

    .line 83
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 84
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_4

    .line 85
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "desc"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 86
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/FormField;->setDescription(Ljava/lang/String;)V

    goto :goto_0

    .line 88
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "value"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 89
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/FormField;->addValue(Ljava/lang/String;)V

    goto :goto_0

    .line 91
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "required"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 92
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/FormField;->setRequired(Z)V

    goto :goto_0

    .line 94
    :cond_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "option"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 95
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/provider/DataFormProvider;->parseOption(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/FormField$Option;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/FormField;->addOption(Lorg/jivesoftware/smackx/FormField$Option;)V

    goto :goto_0

    .line 97
    :cond_4
    const/4 v3, 0x3

    if-ne v1, v3, :cond_0

    .line 98
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "field"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 99
    const/4 v0, 0x1

    goto :goto_0

    .line 103
    .end local v1    # "eventType":I
    :cond_5
    return-object v2
.end method

.method private parseItem(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/DataForm$Item;
    .locals 5
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 107
    const/4 v0, 0x0

    .line 108
    .local v0, "done":Z
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .local v2, "fields":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/FormField;>;"
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 110
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 111
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_1

    .line 112
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "field"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 113
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/provider/DataFormProvider;->parseField(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 115
    :cond_1
    const/4 v3, 0x3

    if-ne v1, v3, :cond_0

    .line 116
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "item"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 117
    const/4 v0, 0x1

    goto :goto_0

    .line 121
    .end local v1    # "eventType":I
    :cond_2
    new-instance v3, Lorg/jivesoftware/smackx/packet/DataForm$Item;

    invoke-direct {v3, v2}, Lorg/jivesoftware/smackx/packet/DataForm$Item;-><init>(Ljava/util/List;)V

    return-object v3
.end method

.method private parseOption(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/FormField$Option;
    .locals 6
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 143
    const/4 v0, 0x0

    .line 144
    .local v0, "done":Z
    const/4 v3, 0x0

    .line 145
    .local v3, "option":Lorg/jivesoftware/smackx/FormField$Option;
    const-string/jumbo v4, ""

    const-string/jumbo v5, "label"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 146
    .local v2, "label":Ljava/lang/String;
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 147
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 148
    .local v1, "eventType":I
    const/4 v4, 0x2

    if-ne v1, v4, :cond_1

    .line 149
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "value"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 150
    new-instance v3, Lorg/jivesoftware/smackx/FormField$Option;

    .end local v3    # "option":Lorg/jivesoftware/smackx/FormField$Option;
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v2, v4}, Lorg/jivesoftware/smackx/FormField$Option;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v3    # "option":Lorg/jivesoftware/smackx/FormField$Option;
    goto :goto_0

    .line 152
    :cond_1
    const/4 v4, 0x3

    if-ne v1, v4, :cond_0

    .line 153
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "option"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 154
    const/4 v0, 0x1

    goto :goto_0

    .line 158
    .end local v1    # "eventType":I
    :cond_2
    return-object v3
.end method

.method private parseReported(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/DataForm$ReportedData;
    .locals 5
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 125
    const/4 v0, 0x0

    .line 126
    .local v0, "done":Z
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .local v2, "fields":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/FormField;>;"
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 128
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 129
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_1

    .line 130
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "field"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 131
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/provider/DataFormProvider;->parseField(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 133
    :cond_1
    const/4 v3, 0x3

    if-ne v1, v3, :cond_0

    .line 134
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "reported"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 135
    const/4 v0, 0x1

    goto :goto_0

    .line 139
    .end local v1    # "eventType":I
    :cond_2
    new-instance v3, Lorg/jivesoftware/smackx/packet/DataForm$ReportedData;

    invoke-direct {v3, v2}, Lorg/jivesoftware/smackx/packet/DataForm$ReportedData;-><init>(Ljava/util/List;)V

    return-object v3
.end method


# virtual methods
.method public parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 6
    .param p1, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 47
    const/4 v2, 0x0

    .line 48
    .local v2, "done":Z
    const/4 v0, 0x0

    .line 49
    .local v0, "buffer":Ljava/lang/StringBuilder;
    new-instance v1, Lorg/jivesoftware/smackx/packet/DataForm;

    const-string/jumbo v4, ""

    const-string/jumbo v5, "type"

    invoke-interface {p1, v4, v5}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Lorg/jivesoftware/smackx/packet/DataForm;-><init>(Ljava/lang/String;)V

    .line 50
    .local v1, "dataForm":Lorg/jivesoftware/smackx/packet/DataForm;
    :cond_0
    :goto_0
    if-nez v2, :cond_6

    .line 51
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 52
    .local v3, "eventType":I
    const/4 v4, 0x2

    if-ne v3, v4, :cond_5

    .line 53
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "instructions"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 54
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/DataForm;->addInstruction(Ljava/lang/String;)V

    goto :goto_0

    .line 56
    :cond_1
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "title"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 57
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/DataForm;->setTitle(Ljava/lang/String;)V

    goto :goto_0

    .line 59
    :cond_2
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "field"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 60
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/provider/DataFormProvider;->parseField(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/FormField;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/DataForm;->addField(Lorg/jivesoftware/smackx/FormField;)V

    goto :goto_0

    .line 62
    :cond_3
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "item"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 63
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/provider/DataFormProvider;->parseItem(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/DataForm$Item;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/DataForm;->addItem(Lorg/jivesoftware/smackx/packet/DataForm$Item;)V

    goto :goto_0

    .line 65
    :cond_4
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "reported"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 66
    invoke-direct {p0, p1}, Lorg/jivesoftware/smackx/provider/DataFormProvider;->parseReported(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smackx/packet/DataForm$ReportedData;

    move-result-object v4

    invoke-virtual {v1, v4}, Lorg/jivesoftware/smackx/packet/DataForm;->setReportedData(Lorg/jivesoftware/smackx/packet/DataForm$ReportedData;)V

    goto :goto_0

    .line 68
    :cond_5
    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    .line 69
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/DataForm;->getElementName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 70
    const/4 v2, 0x1

    goto/16 :goto_0

    .line 74
    .end local v3    # "eventType":I
    :cond_6
    return-object v1
.end method
