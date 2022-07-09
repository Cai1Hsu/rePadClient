.class public Lorg/apache/tools/ant/util/DOMElementWriter;
.super Ljava/lang/Object;
.source "DOMElementWriter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;
    }
.end annotation


# static fields
.field private static final HEX:I = 0x10

.field private static final NS:Ljava/lang/String; = "ns"

.field private static final WS_ENTITIES:[Ljava/lang/String;

.field private static lSep:Ljava/lang/String;


# instance fields
.field protected knownEntities:[Ljava/lang/String;

.field private namespacePolicy:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

.field private nextPrefix:I

.field private nsPrefixMap:Ljava/util/HashMap;

.field private nsURIByElement:Ljava/util/HashMap;

.field private xmlDeclaration:Z


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 48
    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/String;

    sput-object v1, Lorg/apache/tools/ant/util/DOMElementWriter;->WS_ENTITIES:[Ljava/lang/String;

    .line 50
    const/16 v0, 0x9

    .local v0, "i":I
    :goto_0
    const/16 v1, 0xe

    if-ge v0, v1, :cond_0

    .line 51
    sget-object v1, Lorg/apache/tools/ant/util/DOMElementWriter;->WS_ENTITIES:[Ljava/lang/String;

    add-int/lit8 v2, v0, -0x9

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "&#x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, ";"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 50
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 151
    :cond_0
    const-string/jumbo v1, "line.separator"

    invoke-static {v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lorg/apache/tools/ant/util/DOMElementWriter;->lSep:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-boolean v3, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->xmlDeclaration:Z

    .line 64
    sget-object v0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->IGNORE:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    iput-object v0, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->namespacePolicy:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsPrefixMap:Ljava/util/HashMap;

    .line 74
    iput v2, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nextPrefix:I

    .line 79
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsURIByElement:Ljava/util/HashMap;

    .line 158
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "gt"

    aput-object v1, v0, v2

    const-string/jumbo v1, "amp"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string/jumbo v2, "lt"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "apos"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "quot"

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->knownEntities:[Ljava/lang/String;

    .line 124
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "xmlDeclaration"    # Z

    .prologue
    .line 134
    sget-object v0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->IGNORE:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/util/DOMElementWriter;-><init>(ZLorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;)V

    .line 135
    return-void
.end method

.method public constructor <init>(ZLorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;)V
    .locals 4
    .param p1, "xmlDeclaration"    # Z
    .param p2, "namespacePolicy"    # Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-boolean v3, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->xmlDeclaration:Z

    .line 64
    sget-object v0, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->IGNORE:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    iput-object v0, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->namespacePolicy:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsPrefixMap:Ljava/util/HashMap;

    .line 74
    iput v2, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nextPrefix:I

    .line 79
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsURIByElement:Ljava/util/HashMap;

    .line 158
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "gt"

    aput-object v1, v0, v2

    const-string/jumbo v1, "amp"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string/jumbo v2, "lt"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "apos"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "quot"

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->knownEntities:[Ljava/lang/String;

    .line 147
    iput-boolean p1, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->xmlDeclaration:Z

    .line 148
    iput-object p2, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->namespacePolicy:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    .line 149
    return-void
.end method

.method private addNSDefinition(Lorg/w3c/dom/Element;Ljava/lang/String;)V
    .locals 2
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .param p2, "uri"    # Ljava/lang/String;

    .prologue
    .line 582
    iget-object v1, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsURIByElement:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 583
    .local v0, "al":Ljava/util/ArrayList;
    if-nez v0, :cond_0

    .line 584
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "al":Ljava/util/ArrayList;
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 585
    .restart local v0    # "al":Ljava/util/ArrayList;
    iget-object v1, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsURIByElement:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 587
    :cond_0
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 588
    return-void
.end method

.method private encode(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 6
    .param p1, "value"    # Ljava/lang/String;
    .param p2, "encodeWhitespace"    # Z

    .prologue
    .line 436
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 437
    .local v2, "len":I
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 438
    .local v3, "sb":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_2

    .line 439
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 440
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_0

    .line 466
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/DOMElementWriter;->isLegalCharacter(C)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 467
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 438
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 442
    :sswitch_0
    const-string/jumbo v4, "&lt;"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 445
    :sswitch_1
    const-string/jumbo v4, "&gt;"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 448
    :sswitch_2
    const-string/jumbo v4, "&apos;"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 451
    :sswitch_3
    const-string/jumbo v4, "&quot;"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 454
    :sswitch_4
    const-string/jumbo v4, "&amp;"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 459
    :sswitch_5
    if-eqz p2, :cond_1

    .line 460
    sget-object v4, Lorg/apache/tools/ant/util/DOMElementWriter;->WS_ENTITIES:[Ljava/lang/String;

    add-int/lit8 v5, v0, -0x9

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 462
    :cond_1
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 472
    .end local v0    # "c":C
    :cond_2
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->substring(I)Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 440
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_5
        0xa -> :sswitch_5
        0xd -> :sswitch_5
        0x22 -> :sswitch_3
        0x26 -> :sswitch_4
        0x27 -> :sswitch_2
        0x3c -> :sswitch_0
        0x3e -> :sswitch_1
    .end sparse-switch
.end method

.method private static getNamespaceURI(Lorg/w3c/dom/Node;)Ljava/lang/String;
    .locals 1
    .param p0, "n"    # Lorg/w3c/dom/Node;

    .prologue
    .line 591
    invoke-interface {p0}, Lorg/w3c/dom/Node;->getNamespaceURI()Ljava/lang/String;

    move-result-object v0

    .line 592
    .local v0, "uri":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 594
    const-string/jumbo v0, ""

    .line 596
    :cond_0
    return-object v0
.end method

.method private removeNSDefinitions(Lorg/w3c/dom/Element;)V
    .locals 4
    .param p1, "element"    # Lorg/w3c/dom/Element;

    .prologue
    .line 571
    iget-object v2, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsURIByElement:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 572
    .local v0, "al":Ljava/util/ArrayList;
    if-eqz v0, :cond_1

    .line 573
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 574
    .local v1, "iter":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 575
    iget-object v2, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsPrefixMap:Ljava/util/HashMap;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 577
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsURIByElement:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 579
    .end local v1    # "iter":Ljava/util/Iterator;
    :cond_1
    return-void
.end method


# virtual methods
.method public closeElement(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;Z)V
    .locals 4
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .param p2, "out"    # Ljava/io/Writer;
    .param p3, "indent"    # I
    .param p4, "indentWith"    # Ljava/lang/String;
    .param p5, "hasChildren"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 391
    if-eqz p5, :cond_0

    .line 392
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_0

    .line 393
    invoke-virtual {p2, p4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 392
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 398
    .end local v0    # "i":I
    :cond_0
    const-string/jumbo v3, "</"

    invoke-virtual {p2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 399
    iget-object v3, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->namespacePolicy:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    invoke-static {v3}, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->access$000(Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 400
    invoke-static {p1}, Lorg/apache/tools/ant/util/DOMElementWriter;->getNamespaceURI(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v2

    .line 401
    .local v2, "uri":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsPrefixMap:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 402
    .local v1, "prefix":Ljava/lang/String;
    if-eqz v1, :cond_1

    const-string/jumbo v3, ""

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 403
    invoke-virtual {p2, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 404
    const-string/jumbo v3, ":"

    invoke-virtual {p2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 406
    :cond_1
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/DOMElementWriter;->removeNSDefinitions(Lorg/w3c/dom/Element;)V

    .line 408
    .end local v1    # "prefix":Ljava/lang/String;
    .end local v2    # "uri":Ljava/lang/String;
    :cond_2
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 409
    const-string/jumbo v3, ">"

    invoke-virtual {p2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 410
    sget-object v3, Lorg/apache/tools/ant/util/DOMElementWriter;->lSep:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 411
    invoke-virtual {p2}, Ljava/io/Writer;->flush()V

    .line 412
    return-void
.end method

.method public encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 421
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/util/DOMElementWriter;->encode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encodeAttributeValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 432
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/apache/tools/ant/util/DOMElementWriter;->encode(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public encodedata(Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 492
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 493
    .local v2, "len":I
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3, v2}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 494
    .local v3, "sb":Ljava/lang/StringBuffer;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 495
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 496
    .local v0, "c":C
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/DOMElementWriter;->isLegalCharacter(C)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 497
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 494
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 501
    .end local v0    # "c":C
    :cond_1
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->substring(I)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "]]>"

    const-string/jumbo v6, "]]]]><![CDATA[>"

    invoke-static {v4, v5, v6}, Lorg/apache/tools/ant/util/StringUtils;->replace(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public isLegalCharacter(C)Z
    .locals 3
    .param p1, "c"    # C

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 555
    const/16 v2, 0x9

    if-eq p1, v2, :cond_0

    const/16 v2, 0xa

    if-eq p1, v2, :cond_0

    const/16 v2, 0xd

    if-ne p1, v2, :cond_2

    :cond_0
    move v0, v1

    .line 567
    :cond_1
    :goto_0
    return v0

    .line 557
    :cond_2
    const/16 v2, 0x20

    if-lt p1, v2, :cond_1

    .line 559
    const v2, 0xd7ff

    if-gt p1, v2, :cond_3

    move v0, v1

    .line 560
    goto :goto_0

    .line 561
    :cond_3
    const v2, 0xe000

    if-lt p1, v2, :cond_1

    .line 563
    const v2, 0xfffd

    if-gt p1, v2, :cond_1

    move v0, v1

    .line 564
    goto :goto_0
.end method

.method public isReference(Ljava/lang/String;)Z
    .locals 8
    .param p1, "ent"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 510
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x26

    if-ne v5, v6, :cond_0

    const-string/jumbo v5, ";"

    invoke-virtual {p1, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    :cond_0
    move v3, v4

    .line 540
    :cond_1
    :goto_0
    return v3

    .line 514
    :cond_2
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x23

    if-ne v5, v6, :cond_4

    .line 515
    invoke-virtual {p1, v7}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x78

    if-ne v5, v6, :cond_3

    .line 518
    const/4 v5, 0x3

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {p1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x10

    invoke-static {v5, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 521
    :catch_0
    move-exception v2

    .local v2, "nfe":Ljava/lang/NumberFormatException;
    move v3, v4

    .line 522
    goto :goto_0

    .line 526
    .end local v2    # "nfe":Ljava/lang/NumberFormatException;
    :cond_3
    const/4 v5, 0x2

    :try_start_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {p1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 528
    :catch_1
    move-exception v2

    .restart local v2    # "nfe":Ljava/lang/NumberFormatException;
    move v3, v4

    .line 529
    goto :goto_0

    .line 534
    .end local v2    # "nfe":Ljava/lang/NumberFormatException;
    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {p1, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 535
    .local v1, "name":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v5, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->knownEntities:[Ljava/lang/String;

    array-length v5, v5

    if-ge v0, v5, :cond_5

    .line 536
    iget-object v5, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->knownEntities:[Ljava/lang/String;

    aget-object v5, v5, v0

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 535
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_5
    move v3, v4

    .line 540
    goto :goto_0
.end method

.method public openElement(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;)V
    .locals 6
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .param p2, "out"    # Ljava/io/Writer;
    .param p3, "indent"    # I
    .param p4, "indentWith"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 278
    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lorg/apache/tools/ant/util/DOMElementWriter;->openElement(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;Z)V

    .line 279
    return-void
.end method

.method public openElement(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;Z)V
    .locals 10
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .param p2, "out"    # Ljava/io/Writer;
    .param p3, "indent"    # I
    .param p4, "indentWith"    # Ljava/lang/String;
    .param p5, "hasChildren"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 298
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, p3, :cond_0

    .line 299
    invoke-virtual {p2, p4}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 298
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 303
    :cond_0
    const-string/jumbo v7, "<"

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 304
    iget-object v7, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->namespacePolicy:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    invoke-static {v7}, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->access$000(Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 305
    invoke-static {p1}, Lorg/apache/tools/ant/util/DOMElementWriter;->getNamespaceURI(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    .line 306
    .local v6, "uri":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsPrefixMap:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 307
    .local v5, "prefix":Ljava/lang/String;
    if-nez v5, :cond_1

    .line 308
    iget-object v7, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsPrefixMap:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 310
    const-string/jumbo v5, ""

    .line 314
    :goto_1
    iget-object v7, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsPrefixMap:Ljava/util/HashMap;

    invoke-virtual {v7, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    invoke-direct {p0, p1, v6}, Lorg/apache/tools/ant/util/DOMElementWriter;->addNSDefinition(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    .line 317
    :cond_1
    const-string/jumbo v7, ""

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 318
    invoke-virtual {p2, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 319
    const-string/jumbo v7, ":"

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 322
    .end local v5    # "prefix":Ljava/lang/String;
    .end local v6    # "uri":Ljava/lang/String;
    :cond_2
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getTagName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 325
    invoke-interface {p1}, Lorg/w3c/dom/Element;->getAttributes()Lorg/w3c/dom/NamedNodeMap;

    move-result-object v2

    .line 326
    .local v2, "attrs":Lorg/w3c/dom/NamedNodeMap;
    const/4 v3, 0x0

    :goto_2
    invoke-interface {v2}, Lorg/w3c/dom/NamedNodeMap;->getLength()I

    move-result v7

    if-ge v3, v7, :cond_6

    .line 327
    invoke-interface {v2, v3}, Lorg/w3c/dom/NamedNodeMap;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Attr;

    .line 328
    .local v1, "attr":Lorg/w3c/dom/Attr;
    const-string/jumbo v7, " "

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 329
    iget-object v7, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->namespacePolicy:Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;

    invoke-static {v7}, Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;->access$100(Lorg/apache/tools/ant/util/DOMElementWriter$XmlNamespacePolicy;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 330
    invoke-static {v1}, Lorg/apache/tools/ant/util/DOMElementWriter;->getNamespaceURI(Lorg/w3c/dom/Node;)Ljava/lang/String;

    move-result-object v6

    .line 331
    .restart local v6    # "uri":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsPrefixMap:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 332
    .restart local v5    # "prefix":Ljava/lang/String;
    if-nez v5, :cond_3

    .line 333
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "ns"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget v8, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nextPrefix:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nextPrefix:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    .line 334
    iget-object v7, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsPrefixMap:Ljava/util/HashMap;

    invoke-virtual {v7, v6, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 335
    invoke-direct {p0, p1, v6}, Lorg/apache/tools/ant/util/DOMElementWriter;->addNSDefinition(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    .line 337
    :cond_3
    invoke-virtual {p2, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 338
    const-string/jumbo v7, ":"

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 340
    .end local v5    # "prefix":Ljava/lang/String;
    .end local v6    # "uri":Ljava/lang/String;
    :cond_4
    invoke-interface {v1}, Lorg/w3c/dom/Attr;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 341
    const-string/jumbo v7, "=\""

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 342
    invoke-interface {v1}, Lorg/w3c/dom/Attr;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lorg/apache/tools/ant/util/DOMElementWriter;->encodeAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 343
    const-string/jumbo v7, "\""

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 326
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 312
    .end local v1    # "attr":Lorg/w3c/dom/Attr;
    .end local v2    # "attrs":Lorg/w3c/dom/NamedNodeMap;
    .restart local v5    # "prefix":Ljava/lang/String;
    .restart local v6    # "uri":Ljava/lang/String;
    :cond_5
    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "ns"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    iget v8, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nextPrefix:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nextPrefix:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_1

    .line 347
    .end local v5    # "prefix":Ljava/lang/String;
    .end local v6    # "uri":Ljava/lang/String;
    .restart local v2    # "attrs":Lorg/w3c/dom/NamedNodeMap;
    :cond_6
    iget-object v7, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsURIByElement:Ljava/util/HashMap;

    invoke-virtual {v7, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 348
    .local v0, "al":Ljava/util/ArrayList;
    if-eqz v0, :cond_8

    .line 349
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .line 350
    .local v4, "iter":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_8

    .line 351
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 352
    .restart local v6    # "uri":Ljava/lang/String;
    iget-object v7, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->nsPrefixMap:Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 353
    .restart local v5    # "prefix":Ljava/lang/String;
    const-string/jumbo v7, " xmlns"

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 354
    const-string/jumbo v7, ""

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_7

    .line 355
    const-string/jumbo v7, ":"

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 356
    invoke-virtual {p2, v5}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 358
    :cond_7
    const-string/jumbo v7, "=\""

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 359
    invoke-virtual {p2, v6}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 360
    const-string/jumbo v7, "\""

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_3

    .line 364
    .end local v4    # "iter":Ljava/util/Iterator;
    .end local v5    # "prefix":Ljava/lang/String;
    .end local v6    # "uri":Ljava/lang/String;
    :cond_8
    if-eqz p5, :cond_9

    .line 365
    const-string/jumbo v7, ">"

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 372
    :goto_4
    return-void

    .line 367
    :cond_9
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/util/DOMElementWriter;->removeNSDefinitions(Lorg/w3c/dom/Element;)V

    .line 368
    const-string/jumbo v7, " />"

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 369
    sget-object v7, Lorg/apache/tools/ant/util/DOMElementWriter;->lSep:Ljava/lang/String;

    invoke-virtual {p2, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 370
    invoke-virtual {p2}, Ljava/io/Writer;->flush()V

    goto :goto_4
.end method

.method public write(Lorg/w3c/dom/Element;Ljava/io/OutputStream;)V
    .locals 3
    .param p1, "root"    # Lorg/w3c/dom/Element;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    new-instance v0, Ljava/io/OutputStreamWriter;

    const-string/jumbo v1, "UTF8"

    invoke-direct {v0, p2, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    .line 173
    .local v0, "wri":Ljava/io/Writer;
    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/util/DOMElementWriter;->writeXMLDeclaration(Ljava/io/Writer;)V

    .line 174
    const/4 v1, 0x0

    const-string/jumbo v2, "  "

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/apache/tools/ant/util/DOMElementWriter;->write(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;)V

    .line 175
    invoke-virtual {v0}, Ljava/io/Writer;->flush()V

    .line 176
    return-void
.end method

.method public write(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;)V
    .locals 19
    .param p1, "element"    # Lorg/w3c/dom/Element;
    .param p2, "out"    # Ljava/io/Writer;
    .param p3, "indent"    # I
    .param p4, "indentWith"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 205
    invoke-interface/range {p1 .. p1}, Lorg/w3c/dom/Element;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v16

    .line 206
    .local v16, "children":Lorg/w3c/dom/NodeList;
    invoke-interface/range {v16 .. v16}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    if-lez v3, :cond_0

    const/4 v8, 0x1

    .line 207
    .local v8, "hasChildren":Z
    :goto_0
    const/4 v14, 0x0

    .local v14, "hasChildElements":Z
    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move/from16 v6, p3

    move-object/from16 v7, p4

    .line 208
    invoke-virtual/range {v3 .. v8}, Lorg/apache/tools/ant/util/DOMElementWriter;->openElement(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;Z)V

    .line 210
    if-eqz v8, :cond_4

    .line 211
    const/16 v18, 0x0

    .local v18, "i":I
    :goto_1
    invoke-interface/range {v16 .. v16}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    move/from16 v0, v18

    if-ge v0, v3, :cond_3

    .line 212
    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-interface {v0, v1}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v15

    .line 214
    .local v15, "child":Lorg/w3c/dom/Node;
    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeType()S

    move-result v3

    packed-switch v3, :pswitch_data_0

    .line 211
    .end local v15    # "child":Lorg/w3c/dom/Node;
    :goto_2
    :pswitch_0
    add-int/lit8 v18, v18, 0x1

    goto :goto_1

    .line 206
    .end local v8    # "hasChildren":Z
    .end local v14    # "hasChildElements":Z
    .end local v18    # "i":I
    :cond_0
    const/4 v8, 0x0

    goto :goto_0

    .line 217
    .restart local v8    # "hasChildren":Z
    .restart local v14    # "hasChildElements":Z
    .restart local v15    # "child":Lorg/w3c/dom/Node;
    .restart local v18    # "i":I
    :pswitch_1
    const/4 v14, 0x1

    .line 218
    if-nez v18, :cond_1

    .line 219
    sget-object v3, Lorg/apache/tools/ant/util/DOMElementWriter;->lSep:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 221
    :cond_1
    check-cast v15, Lorg/w3c/dom/Element;

    .end local v15    # "child":Lorg/w3c/dom/Node;
    add-int/lit8 v3, p3, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    invoke-virtual {v0, v15, v1, v3, v2}, Lorg/apache/tools/ant/util/DOMElementWriter;->write(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;)V

    goto :goto_2

    .line 225
    .restart local v15    # "child":Lorg/w3c/dom/Node;
    :pswitch_2
    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/util/DOMElementWriter;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_2

    .line 229
    :pswitch_3
    const-string/jumbo v3, "<!--"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 230
    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/util/DOMElementWriter;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 231
    const-string/jumbo v3, "-->"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_2

    .line 235
    :pswitch_4
    const-string/jumbo v3, "<![CDATA["

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 236
    check-cast v15, Lorg/w3c/dom/Text;

    .end local v15    # "child":Lorg/w3c/dom/Node;
    invoke-interface {v15}, Lorg/w3c/dom/Text;->getData()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lorg/apache/tools/ant/util/DOMElementWriter;->encodedata(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 237
    const-string/jumbo v3, "]]>"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_2

    .line 241
    .restart local v15    # "child":Lorg/w3c/dom/Node;
    :pswitch_5
    const/16 v3, 0x26

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(I)V

    .line 242
    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 243
    const/16 v3, 0x3b

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(I)V

    goto/16 :goto_2

    .line 247
    :pswitch_6
    const-string/jumbo v3, "<?"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 248
    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 249
    invoke-interface {v15}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v17

    .line 250
    .local v17, "data":Ljava/lang/String;
    if-eqz v17, :cond_2

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_2

    .line 251
    const/16 v3, 0x20

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(I)V

    .line 252
    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 254
    :cond_2
    const-string/jumbo v3, "?>"

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto/16 :goto_2

    .end local v15    # "child":Lorg/w3c/dom/Node;
    .end local v17    # "data":Ljava/lang/String;
    :cond_3
    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    move/from16 v12, p3

    move-object/from16 v13, p4

    .line 260
    invoke-virtual/range {v9 .. v14}, Lorg/apache/tools/ant/util/DOMElementWriter;->closeElement(Lorg/w3c/dom/Element;Ljava/io/Writer;ILjava/lang/String;Z)V

    .line 262
    .end local v18    # "i":I
    :cond_4
    return-void

    .line 214
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_6
        :pswitch_3
    .end packed-switch
.end method

.method public writeXMLDeclaration(Ljava/io/Writer;)V
    .locals 1
    .param p1, "wri"    # Ljava/io/Writer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 185
    iget-boolean v0, p0, Lorg/apache/tools/ant/util/DOMElementWriter;->xmlDeclaration:Z

    if-eqz v0, :cond_0

    .line 186
    const-string/jumbo v0, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 188
    :cond_0
    return-void
.end method
