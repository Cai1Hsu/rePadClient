.class public Lorg/jivesoftware/smackx/ReportedData;
.super Ljava/lang/Object;
.source "ReportedData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smackx/ReportedData$Field;,
        Lorg/jivesoftware/smackx/ReportedData$Row;,
        Lorg/jivesoftware/smackx/ReportedData$Column;
    }
.end annotation


# instance fields
.field private columns:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/ReportedData$Column;",
            ">;"
        }
    .end annotation
.end field

.field private rows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jivesoftware/smackx/ReportedData$Row;",
            ">;"
        }
    .end annotation
.end field

.field private title:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/ReportedData;->columns:Ljava/util/List;

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jivesoftware/smackx/ReportedData;->rows:Ljava/util/List;

    .line 43
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/jivesoftware/smackx/ReportedData;->title:Ljava/lang/String;

    .line 102
    return-void
.end method

.method private constructor <init>(Lorg/jivesoftware/smackx/packet/DataForm;)V
    .locals 12
    .param p1, "dataForm"    # Lorg/jivesoftware/smackx/packet/DataForm;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lorg/jivesoftware/smackx/ReportedData;->columns:Ljava/util/List;

    .line 42
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iput-object v7, p0, Lorg/jivesoftware/smackx/ReportedData;->rows:Ljava/util/List;

    .line 43
    const-string/jumbo v7, ""

    iput-object v7, p0, Lorg/jivesoftware/smackx/ReportedData;->title:Ljava/lang/String;

    .line 73
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/DataForm;->getReportedData()Lorg/jivesoftware/smackx/packet/DataForm$ReportedData;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jivesoftware/smackx/packet/DataForm$ReportedData;->getFields()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "fields":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/FormField;>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 74
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/FormField;

    .line 75
    .local v0, "field":Lorg/jivesoftware/smackx/FormField;
    iget-object v7, p0, Lorg/jivesoftware/smackx/ReportedData;->columns:Ljava/util/List;

    new-instance v8, Lorg/jivesoftware/smackx/ReportedData$Column;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getLabel()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getVariable()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getType()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v8, v9, v10, v11}, Lorg/jivesoftware/smackx/ReportedData$Column;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 79
    .end local v0    # "field":Lorg/jivesoftware/smackx/FormField;
    :cond_0
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/DataForm;->getItems()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "items":Ljava/util/Iterator;, "Ljava/util/Iterator<Lorg/jivesoftware/smackx/packet/DataForm$Item;>;"
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 80
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jivesoftware/smackx/packet/DataForm$Item;

    .line 81
    .local v4, "item":Lorg/jivesoftware/smackx/packet/DataForm$Item;
    new-instance v1, Ljava/util/ArrayList;

    iget-object v7, p0, Lorg/jivesoftware/smackx/ReportedData;->columns:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    invoke-direct {v1, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 83
    .local v1, "fieldList":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/ReportedData$Field;>;"
    invoke-virtual {v4}, Lorg/jivesoftware/smackx/packet/DataForm$Item;->getFields()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 84
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jivesoftware/smackx/FormField;

    .line 86
    .restart local v0    # "field":Lorg/jivesoftware/smackx/FormField;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .local v6, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getValues()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 88
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 90
    :cond_1
    new-instance v7, Lorg/jivesoftware/smackx/ReportedData$Field;

    invoke-virtual {v0}, Lorg/jivesoftware/smackx/FormField;->getVariable()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v6}, Lorg/jivesoftware/smackx/ReportedData$Field;-><init>(Ljava/lang/String;Ljava/util/List;)V

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 92
    .end local v0    # "field":Lorg/jivesoftware/smackx/FormField;
    .end local v3    # "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v6    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    iget-object v7, p0, Lorg/jivesoftware/smackx/ReportedData;->rows:Ljava/util/List;

    new-instance v8, Lorg/jivesoftware/smackx/ReportedData$Row;

    invoke-direct {v8, v1}, Lorg/jivesoftware/smackx/ReportedData$Row;-><init>(Ljava/util/List;)V

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 96
    .end local v1    # "fieldList":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smackx/ReportedData$Field;>;"
    .end local v4    # "item":Lorg/jivesoftware/smackx/packet/DataForm$Item;
    :cond_3
    invoke-virtual {p1}, Lorg/jivesoftware/smackx/packet/DataForm;->getTitle()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lorg/jivesoftware/smackx/ReportedData;->title:Ljava/lang/String;

    .line 97
    return-void
.end method

.method public static getReportedDataFrom(Lorg/jivesoftware/smack/packet/Packet;)Lorg/jivesoftware/smackx/ReportedData;
    .locals 4
    .param p0, "packet"    # Lorg/jivesoftware/smack/packet/Packet;

    .prologue
    .line 53
    const-string/jumbo v2, "x"

    const-string/jumbo v3, "jabber:x:data"

    invoke-virtual {p0, v2, v3}, Lorg/jivesoftware/smack/packet/Packet;->getExtension(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v1

    .line 54
    .local v1, "packetExtension":Lorg/jivesoftware/smack/packet/PacketExtension;
    if-eqz v1, :cond_0

    move-object v0, v1

    .line 56
    check-cast v0, Lorg/jivesoftware/smackx/packet/DataForm;

    .line 57
    .local v0, "dataForm":Lorg/jivesoftware/smackx/packet/DataForm;
    invoke-virtual {v0}, Lorg/jivesoftware/smackx/packet/DataForm;->getReportedData()Lorg/jivesoftware/smackx/packet/DataForm$ReportedData;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 58
    new-instance v2, Lorg/jivesoftware/smackx/ReportedData;

    invoke-direct {v2, v0}, Lorg/jivesoftware/smackx/ReportedData;-><init>(Lorg/jivesoftware/smackx/packet/DataForm;)V

    .line 61
    .end local v0    # "dataForm":Lorg/jivesoftware/smackx/packet/DataForm;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method


# virtual methods
.method public addColumn(Lorg/jivesoftware/smackx/ReportedData$Column;)V
    .locals 1
    .param p1, "column"    # Lorg/jivesoftware/smackx/ReportedData$Column;

    .prologue
    .line 117
    iget-object v0, p0, Lorg/jivesoftware/smackx/ReportedData;->columns:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    return-void
.end method

.method public addRow(Lorg/jivesoftware/smackx/ReportedData$Row;)V
    .locals 1
    .param p1, "row"    # Lorg/jivesoftware/smackx/ReportedData$Row;

    .prologue
    .line 109
    iget-object v0, p0, Lorg/jivesoftware/smackx/ReportedData;->rows:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    return-void
.end method

.method public getColumns()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/ReportedData$Column;",
            ">;"
        }
    .end annotation

    .prologue
    .line 136
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/jivesoftware/smackx/ReportedData;->columns:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getRows()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jivesoftware/smackx/ReportedData$Row;",
            ">;"
        }
    .end annotation

    .prologue
    .line 127
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/jivesoftware/smackx/ReportedData;->rows:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    iget-object v0, p0, Lorg/jivesoftware/smackx/ReportedData;->title:Ljava/lang/String;

    return-object v0
.end method
