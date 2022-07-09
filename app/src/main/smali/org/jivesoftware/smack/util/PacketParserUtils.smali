.class public Lorg/jivesoftware/smack/util/PacketParserUtils;
.super Ljava/lang/Object;
.source "PacketParserUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jivesoftware/smack/util/PacketParserUtils$UnparsedResultIQ;
    }
.end annotation


# static fields
.field private static final PROPERTIES_NAMESPACE:Ljava/lang/String; = "http://www.jivesoftware.com/xmlns/xmpp/properties"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 909
    return-void
.end method

.method private static decode(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 878
    .local p0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "java.lang.String"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 899
    .end local p1    # "value":Ljava/lang/String;
    :goto_0
    return-object p1

    .line 881
    .restart local p1    # "value":Ljava/lang/String;
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "boolean"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 882
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    goto :goto_0

    .line 884
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "int"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 885
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_0

    .line 887
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "long"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 888
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    goto :goto_0

    .line 890
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "float"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 891
    invoke-static {p1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    goto :goto_0

    .line 893
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "double"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 894
    invoke-static {p1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p1

    goto :goto_0

    .line 896
    :cond_5
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "java.lang.Class"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 897
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    goto :goto_0

    .line 899
    :cond_6
    const/4 p1, 0x0

    goto :goto_0
.end method

.method private static getLanguageAttribute(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .locals 4
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;

    .prologue
    .line 829
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 830
    invoke-interface {p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v0

    .line 831
    .local v0, "attributeName":Ljava/lang/String;
    const-string/jumbo v2, "xml:lang"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "lang"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v2, "xml"

    invoke-interface {p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributePrefix(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 834
    :cond_0
    invoke-interface {p0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v2

    .line 837
    .end local v0    # "attributeName":Ljava/lang/String;
    :goto_1
    return-object v2

    .line 829
    .restart local v0    # "attributeName":Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 837
    .end local v0    # "attributeName":Ljava/lang/String;
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private static parseAuthentication(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Authentication;
    .locals 5
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 385
    new-instance v0, Lorg/jivesoftware/smack/packet/Authentication;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/Authentication;-><init>()V

    .line 386
    .local v0, "authentication":Lorg/jivesoftware/smack/packet/Authentication;
    const/4 v1, 0x0

    .line 387
    .local v1, "done":Z
    :cond_0
    :goto_0
    if-nez v1, :cond_5

    .line 388
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 389
    .local v2, "eventType":I
    const/4 v3, 0x2

    if-ne v2, v3, :cond_4

    .line 390
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "username"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 391
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Authentication;->setUsername(Ljava/lang/String;)V

    goto :goto_0

    .line 393
    :cond_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "password"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 394
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Authentication;->setPassword(Ljava/lang/String;)V

    goto :goto_0

    .line 396
    :cond_2
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "digest"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 397
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Authentication;->setDigest(Ljava/lang/String;)V

    goto :goto_0

    .line 399
    :cond_3
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "resource"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 400
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Authentication;->setResource(Ljava/lang/String;)V

    goto :goto_0

    .line 403
    :cond_4
    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 404
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "query"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 405
    const/4 v1, 0x1

    goto :goto_0

    .line 409
    .end local v2    # "eventType":I
    :cond_5
    return-object v0
.end method

.method public static parseCompressionMethods(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Collection;
    .locals 6
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 558
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 559
    .local v3, "methods":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 560
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 561
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 563
    .local v2, "eventType":I
    const/4 v4, 0x2

    if-ne v2, v4, :cond_1

    .line 564
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 565
    .local v1, "elementName":Ljava/lang/String;
    const-string/jumbo v4, "method"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 566
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 569
    .end local v1    # "elementName":Ljava/lang/String;
    :cond_1
    const/4 v4, 0x3

    if-ne v2, v4, :cond_0

    .line 570
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "compression"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 571
    const/4 v0, 0x1

    goto :goto_0

    .line 575
    .end local v2    # "eventType":I
    :cond_2
    return-object v3
.end method

.method private static parseContent(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;
    .locals 4
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 174
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 175
    .local v0, "content":Ljava/lang/StringBuffer;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v1

    .line 176
    .local v1, "parserDepth":I
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v2

    if-eq v2, v1, :cond_1

    .line 178
    :cond_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 180
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;
    .locals 15
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 720
    const-string/jumbo v9, "urn:ietf:params:xml:ns:xmpp-stanzas"

    .line 721
    .local v9, "errorNamespace":Ljava/lang/String;
    const-string/jumbo v8, "-1"

    .line 722
    .local v8, "errorCode":Ljava/lang/String;
    const/4 v14, 0x0

    .line 723
    .local v14, "type":Ljava/lang/String;
    const/4 v4, 0x0

    .line 724
    .local v4, "message":Ljava/lang/String;
    const/4 v3, 0x0

    .line 725
    .local v3, "condition":Ljava/lang/String;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 728
    .local v5, "extensions":Ljava/util/List;, "Ljava/util/List<Lorg/jivesoftware/smack/packet/PacketExtension;>;"
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v0

    if-ge v11, v0, :cond_2

    .line 729
    invoke-interface {p0, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "code"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 730
    const-string/jumbo v0, ""

    const-string/jumbo v1, "code"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 732
    :cond_0
    invoke-interface {p0, v11}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "type"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 733
    const-string/jumbo v0, ""

    const-string/jumbo v1, "type"

    invoke-interface {p0, v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 728
    :cond_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 736
    :cond_2
    const/4 v6, 0x0

    .line 738
    .local v6, "done":Z
    :cond_3
    :goto_1
    if-nez v6, :cond_7

    .line 739
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v10

    .line 740
    .local v10, "eventType":I
    const/4 v0, 0x2

    if-ne v10, v0, :cond_6

    .line 741
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "text"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 742
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 746
    :cond_4
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v7

    .line 747
    .local v7, "elementName":Ljava/lang/String;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v13

    .line 748
    .local v13, "namespace":Ljava/lang/String;
    const-string/jumbo v0, "urn:ietf:params:xml:ns:xmpp-stanzas"

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 749
    move-object v3, v7

    goto :goto_1

    .line 752
    :cond_5
    invoke-static {v7, v13, p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v0

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 756
    .end local v7    # "elementName":Ljava/lang/String;
    .end local v13    # "namespace":Ljava/lang/String;
    :cond_6
    const/4 v0, 0x3

    if-ne v10, v0, :cond_3

    .line 757
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "error"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 758
    const/4 v6, 0x1

    goto :goto_1

    .line 763
    .end local v10    # "eventType":I
    :cond_7
    sget-object v2, Lorg/jivesoftware/smack/packet/XMPPError$Type;->CANCEL:Lorg/jivesoftware/smack/packet/XMPPError$Type;

    .line 765
    .local v2, "errorType":Lorg/jivesoftware/smack/packet/XMPPError$Type;
    if-eqz v14, :cond_8

    .line 766
    :try_start_0
    invoke-virtual {v14}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jivesoftware/smack/packet/XMPPError$Type;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/XMPPError$Type;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 773
    :cond_8
    :goto_2
    new-instance v0, Lorg/jivesoftware/smack/packet/XMPPError;

    invoke-static {v8}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-direct/range {v0 .. v5}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(ILorg/jivesoftware/smack/packet/XMPPError$Type;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object v0

    .line 769
    :catch_0
    move-exception v12

    .line 771
    .local v12, "iae":Ljava/lang/IllegalArgumentException;
    invoke-virtual {v12}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_2
.end method

.method public static parseIQ(Lorg/xmlpull/v1/XmlPullParser;Lorg/jivesoftware/smack/Connection;)Lorg/jivesoftware/smack/packet/IQ;
    .locals 13
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p1, "connection"    # Lorg/jivesoftware/smack/Connection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 284
    const/4 v6, 0x0

    .line 286
    .local v6, "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    const-string/jumbo v11, ""

    const-string/jumbo v12, "id"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 287
    .local v5, "id":Ljava/lang/String;
    const-string/jumbo v11, ""

    const-string/jumbo v12, "to"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 288
    .local v9, "to":Ljava/lang/String;
    const-string/jumbo v11, ""

    const-string/jumbo v12, "from"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 289
    .local v4, "from":Ljava/lang/String;
    const-string/jumbo v11, ""

    const-string/jumbo v12, "type"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lorg/jivesoftware/smack/packet/IQ$Type;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/IQ$Type;

    move-result-object v10

    .line 290
    .local v10, "type":Lorg/jivesoftware/smack/packet/IQ$Type;
    const/4 v2, 0x0

    .line 292
    .local v2, "error":Lorg/jivesoftware/smack/packet/XMPPError;
    const/4 v0, 0x0

    .line 293
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_9

    .line 294
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v3

    .line 296
    .local v3, "eventType":I
    const/4 v11, 0x2

    if-ne v3, v11, :cond_8

    .line 297
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 298
    .local v1, "elementName":Ljava/lang/String;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v7

    .line 299
    .local v7, "namespace":Ljava/lang/String;
    const-string/jumbo v11, "error"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 300
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v2

    goto :goto_0

    .line 302
    :cond_1
    const-string/jumbo v11, "query"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    const-string/jumbo v11, "jabber:iq:auth"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 303
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseAuthentication(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Authentication;

    move-result-object v6

    goto :goto_0

    .line 305
    :cond_2
    const-string/jumbo v11, "query"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    const-string/jumbo v11, "jabber:iq:roster"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 306
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseRoster(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/RosterPacket;

    move-result-object v6

    goto :goto_0

    .line 308
    :cond_3
    const-string/jumbo v11, "query"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    const-string/jumbo v11, "jabber:iq:register"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 309
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseRegistration(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Registration;

    move-result-object v6

    goto :goto_0

    .line 311
    :cond_4
    const-string/jumbo v11, "bind"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    const-string/jumbo v11, "urn:ietf:params:xml:ns:xmpp-bind"

    invoke-virtual {v7, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 313
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseResourceBinding(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Bind;

    move-result-object v6

    goto :goto_0

    .line 318
    :cond_5
    invoke-static {}, Lorg/jivesoftware/smack/provider/ProviderManager;->getInstance()Lorg/jivesoftware/smack/provider/ProviderManager;

    move-result-object v11

    invoke-virtual {v11, v1, v7}, Lorg/jivesoftware/smack/provider/ProviderManager;->getIQProvider(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    .line 319
    .local v8, "provider":Ljava/lang/Object;
    if-eqz v8, :cond_7

    .line 320
    instance-of v11, v8, Lorg/jivesoftware/smack/provider/IQProvider;

    if-eqz v11, :cond_6

    .line 321
    check-cast v8, Lorg/jivesoftware/smack/provider/IQProvider;

    .end local v8    # "provider":Ljava/lang/Object;
    invoke-interface {v8, p0}, Lorg/jivesoftware/smack/provider/IQProvider;->parseIQ(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/IQ;

    move-result-object v6

    goto/16 :goto_0

    .line 323
    .restart local v8    # "provider":Ljava/lang/Object;
    :cond_6
    instance-of v11, v8, Ljava/lang/Class;

    if-eqz v11, :cond_0

    .line 324
    check-cast v8, Ljava/lang/Class;

    .end local v8    # "provider":Ljava/lang/Object;
    invoke-static {v1, v8, p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseWithIntrospection(Ljava/lang/String;Ljava/lang/Class;Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    check-cast v6, Lorg/jivesoftware/smack/packet/IQ;

    .restart local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    goto/16 :goto_0

    .line 330
    .restart local v8    # "provider":Ljava/lang/Object;
    :cond_7
    sget-object v11, Lorg/jivesoftware/smack/packet/IQ$Type;->RESULT:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v11, v10, :cond_0

    .line 333
    new-instance v6, Lorg/jivesoftware/smack/util/PacketParserUtils$UnparsedResultIQ;

    .end local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-static {p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseContent(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v6, v11}, Lorg/jivesoftware/smack/util/PacketParserUtils$UnparsedResultIQ;-><init>(Ljava/lang/String;)V

    .restart local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    goto/16 :goto_0

    .line 337
    .end local v1    # "elementName":Ljava/lang/String;
    .end local v7    # "namespace":Ljava/lang/String;
    .end local v8    # "provider":Ljava/lang/Object;
    :cond_8
    const/4 v11, 0x3

    if-ne v3, v11, :cond_0

    .line 338
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "iq"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 339
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 344
    .end local v3    # "eventType":I
    :cond_9
    if-nez v6, :cond_c

    .line 345
    sget-object v11, Lorg/jivesoftware/smack/packet/IQ$Type;->GET:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-eq v11, v10, :cond_a

    sget-object v11, Lorg/jivesoftware/smack/packet/IQ$Type;->SET:Lorg/jivesoftware/smack/packet/IQ$Type;

    if-ne v11, v10, :cond_b

    .line 349
    :cond_a
    new-instance v6, Lorg/jivesoftware/smack/util/PacketParserUtils$1;

    .end local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-direct {v6}, Lorg/jivesoftware/smack/util/PacketParserUtils$1;-><init>()V

    .line 355
    .restart local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-virtual {v6, v5}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 356
    invoke-virtual {v6, v4}, Lorg/jivesoftware/smack/packet/IQ;->setTo(Ljava/lang/String;)V

    .line 357
    invoke-virtual {v6, v9}, Lorg/jivesoftware/smack/packet/IQ;->setFrom(Ljava/lang/String;)V

    .line 358
    sget-object v11, Lorg/jivesoftware/smack/packet/IQ$Type;->ERROR:Lorg/jivesoftware/smack/packet/IQ$Type;

    invoke-virtual {v6, v11}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 359
    new-instance v11, Lorg/jivesoftware/smack/packet/XMPPError;

    sget-object v12, Lorg/jivesoftware/smack/packet/XMPPError$Condition;->feature_not_implemented:Lorg/jivesoftware/smack/packet/XMPPError$Condition;

    invoke-direct {v11, v12}, Lorg/jivesoftware/smack/packet/XMPPError;-><init>(Lorg/jivesoftware/smack/packet/XMPPError$Condition;)V

    invoke-virtual {v6, v11}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    .line 360
    invoke-virtual {p1, v6}, Lorg/jivesoftware/smack/Connection;->sendPacket(Lorg/jivesoftware/smack/packet/Packet;)V

    .line 361
    const/4 v11, 0x0

    .line 381
    :goto_1
    return-object v11

    .line 365
    :cond_b
    new-instance v6, Lorg/jivesoftware/smack/util/PacketParserUtils$2;

    .end local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    invoke-direct {v6}, Lorg/jivesoftware/smack/util/PacketParserUtils$2;-><init>()V

    .line 375
    .restart local v6    # "iqPacket":Lorg/jivesoftware/smack/packet/IQ;
    :cond_c
    invoke-virtual {v6, v5}, Lorg/jivesoftware/smack/packet/IQ;->setPacketID(Ljava/lang/String;)V

    .line 376
    invoke-virtual {v6, v9}, Lorg/jivesoftware/smack/packet/IQ;->setTo(Ljava/lang/String;)V

    .line 377
    invoke-virtual {v6, v4}, Lorg/jivesoftware/smack/packet/IQ;->setFrom(Ljava/lang/String;)V

    .line 378
    invoke-virtual {v6, v10}, Lorg/jivesoftware/smack/packet/IQ;->setType(Lorg/jivesoftware/smack/packet/IQ$Type;)V

    .line 379
    invoke-virtual {v6, v2}, Lorg/jivesoftware/smack/packet/IQ;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    move-object v11, v6

    .line 381
    goto :goto_1
.end method

.method public static parseMechanisms(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Collection;
    .locals 6
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 529
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 530
    .local v3, "mechanisms":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 531
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 532
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 534
    .local v2, "eventType":I
    const/4 v4, 0x2

    if-ne v2, v4, :cond_1

    .line 535
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    .line 536
    .local v1, "elementName":Ljava/lang/String;
    const-string/jumbo v4, "mechanism"

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 537
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 540
    .end local v1    # "elementName":Ljava/lang/String;
    :cond_1
    const/4 v4, 0x3

    if-ne v2, v4, :cond_0

    .line 541
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "mechanisms"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 542
    const/4 v0, 0x1

    goto :goto_0

    .line 546
    .end local v2    # "eventType":I
    :cond_2
    return-object v3
.end method

.method public static parseMessage(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Packet;
    .locals 20
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 75
    new-instance v11, Lorg/jivesoftware/smack/packet/Message;

    invoke-direct {v11}, Lorg/jivesoftware/smack/packet/Message;-><init>()V

    .line 76
    .local v11, "message":Lorg/jivesoftware/smack/packet/Message;
    const-string/jumbo v18, ""

    const-string/jumbo v19, "id"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 77
    .local v9, "id":Ljava/lang/String;
    if-nez v9, :cond_0

    const-string/jumbo v9, "ID_NOT_AVAILABLE"

    .end local v9    # "id":Ljava/lang/String;
    :cond_0
    invoke-virtual {v11, v9}, Lorg/jivesoftware/smack/packet/Message;->setPacketID(Ljava/lang/String;)V

    .line 78
    const-string/jumbo v18, ""

    const-string/jumbo v19, "to"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->setTo(Ljava/lang/String;)V

    .line 79
    const-string/jumbo v18, ""

    const-string/jumbo v19, "from"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->setFrom(Ljava/lang/String;)V

    .line 80
    const-string/jumbo v18, ""

    const-string/jumbo v19, "type"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move-object/from16 v2, v19

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lorg/jivesoftware/smack/packet/Message$Type;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Type;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->setType(Lorg/jivesoftware/smack/packet/Message$Type;)V

    .line 81
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getLanguageAttribute(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v10

    .line 84
    .local v10, "language":Ljava/lang/String;
    const/4 v4, 0x0

    .line 85
    .local v4, "defaultLanguage":Ljava/lang/String;
    if-eqz v10, :cond_3

    const-string/jumbo v18, ""

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_3

    .line 86
    invoke-virtual {v11, v10}, Lorg/jivesoftware/smack/packet/Message;->setLanguage(Ljava/lang/String;)V

    .line 87
    move-object v4, v10

    .line 96
    :goto_0
    const/4 v5, 0x0

    .line 97
    .local v5, "done":Z
    const/16 v16, 0x0

    .line 98
    .local v16, "thread":Ljava/lang/String;
    const/4 v14, 0x0

    .line 99
    .local v14, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    :goto_1
    if-nez v5, :cond_b

    .line 100
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v7

    .line 101
    .local v7, "eventType":I
    const/16 v18, 0x2

    move/from16 v0, v18

    if-ne v7, v0, :cond_a

    .line 102
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    .line 103
    .local v6, "elementName":Ljava/lang/String;
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v13

    .line 104
    .local v13, "namespace":Ljava/lang/String;
    const-string/jumbo v18, "subject"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 105
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getLanguageAttribute(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v17

    .line 106
    .local v17, "xmlLang":Ljava/lang/String;
    if-nez v17, :cond_2

    .line 107
    move-object/from16 v17, v4

    .line 110
    :cond_2
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseContent(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v15

    .line 112
    .local v15, "subject":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->getSubject(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    if-nez v18, :cond_1

    .line 113
    move-object/from16 v0, v17

    invoke-virtual {v11, v0, v15}, Lorg/jivesoftware/smack/packet/Message;->addSubject(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Subject;

    goto :goto_1

    .line 90
    .end local v5    # "done":Z
    .end local v6    # "elementName":Ljava/lang/String;
    .end local v7    # "eventType":I
    .end local v13    # "namespace":Ljava/lang/String;
    .end local v14    # "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v15    # "subject":Ljava/lang/String;
    .end local v16    # "thread":Ljava/lang/String;
    .end local v17    # "xmlLang":Ljava/lang/String;
    :cond_3
    invoke-static {}, Lorg/jivesoftware/smack/packet/Packet;->getDefaultLanguage()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 116
    .restart local v5    # "done":Z
    .restart local v6    # "elementName":Ljava/lang/String;
    .restart local v7    # "eventType":I
    .restart local v13    # "namespace":Ljava/lang/String;
    .restart local v14    # "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    .restart local v16    # "thread":Ljava/lang/String;
    :cond_4
    const-string/jumbo v18, "body"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_6

    .line 117
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getLanguageAttribute(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v17

    .line 118
    .restart local v17    # "xmlLang":Ljava/lang/String;
    if-nez v17, :cond_5

    .line 119
    move-object/from16 v17, v4

    .line 122
    :cond_5
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseContent(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v3

    .line 124
    .local v3, "body":Ljava/lang/String;
    move-object/from16 v0, v17

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->getBody(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    if-nez v18, :cond_1

    .line 125
    move-object/from16 v0, v17

    invoke-virtual {v11, v0, v3}, Lorg/jivesoftware/smack/packet/Message;->addBody(Ljava/lang/String;Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Message$Body;

    goto :goto_1

    .line 128
    .end local v3    # "body":Ljava/lang/String;
    .end local v17    # "xmlLang":Ljava/lang/String;
    :cond_6
    const-string/jumbo v18, "thread"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_7

    .line 129
    if-nez v16, :cond_1

    .line 130
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v16

    goto :goto_1

    .line 133
    :cond_7
    const-string/jumbo v18, "error"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_8

    .line 134
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    goto/16 :goto_1

    .line 136
    :cond_8
    const-string/jumbo v18, "properties"

    move-object/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_9

    const-string/jumbo v18, "http://www.jivesoftware.com/xmlns/xmpp/properties"

    move-object/from16 v0, v18

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_9

    .line 139
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseProperties(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Map;

    move-result-object v14

    goto/16 :goto_1

    .line 143
    :cond_9
    move-object/from16 v0, p0

    invoke-static {v6, v13, v0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto/16 :goto_1

    .line 147
    .end local v6    # "elementName":Ljava/lang/String;
    .end local v13    # "namespace":Ljava/lang/String;
    :cond_a
    const/16 v18, 0x3

    move/from16 v0, v18

    if-ne v7, v0, :cond_1

    .line 148
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v18

    const-string/jumbo v19, "message"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1

    .line 149
    const/4 v5, 0x1

    goto/16 :goto_1

    .line 154
    .end local v7    # "eventType":I
    :cond_b
    move-object/from16 v0, v16

    invoke-virtual {v11, v0}, Lorg/jivesoftware/smack/packet/Message;->setThread(Ljava/lang/String;)V

    .line 156
    if-eqz v14, :cond_c

    .line 157
    invoke-interface {v14}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_c

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 158
    .local v12, "name":Ljava/lang/String;
    invoke-interface {v14, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v11, v12, v0}, Lorg/jivesoftware/smack/packet/Message;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    .line 161
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v12    # "name":Ljava/lang/String;
    :cond_c
    return-object v11
.end method

.method public static parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;
    .locals 7
    .param p0, "elementName"    # Ljava/lang/String;
    .param p1, "namespace"    # Ljava/lang/String;
    .param p2, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 789
    invoke-static {}, Lorg/jivesoftware/smack/provider/ProviderManager;->getInstance()Lorg/jivesoftware/smack/provider/ProviderManager;

    move-result-object v6

    invoke-virtual {v6, p0, p1}, Lorg/jivesoftware/smack/provider/ProviderManager;->getExtensionProvider(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    .line 790
    .local v4, "provider":Ljava/lang/Object;
    if-eqz v4, :cond_1

    .line 791
    instance-of v6, v4, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    if-eqz v6, :cond_0

    .line 792
    check-cast v4, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;

    .end local v4    # "provider":Ljava/lang/Object;
    invoke-interface {v4, p2}, Lorg/jivesoftware/smack/provider/PacketExtensionProvider;->parseExtension(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v6

    .line 825
    :goto_0
    return-object v6

    .line 794
    .restart local v4    # "provider":Ljava/lang/Object;
    :cond_0
    instance-of v6, v4, Ljava/lang/Class;

    if-eqz v6, :cond_1

    .line 795
    check-cast v4, Ljava/lang/Class;

    .end local v4    # "provider":Ljava/lang/Object;
    invoke-static {p0, v4, p2}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseWithIntrospection(Ljava/lang/String;Ljava/lang/Class;Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/jivesoftware/smack/packet/PacketExtension;

    goto :goto_0

    .line 800
    .restart local v4    # "provider":Ljava/lang/Object;
    :cond_1
    new-instance v2, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;

    invoke-direct {v2, p0, p1}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 801
    .local v2, "extension":Lorg/jivesoftware/smack/packet/DefaultPacketExtension;
    const/4 v0, 0x0

    .line 802
    .local v0, "done":Z
    :cond_2
    :goto_1
    if-nez v0, :cond_5

    .line 803
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 804
    .local v1, "eventType":I
    const/4 v6, 0x2

    if-ne v1, v6, :cond_4

    .line 805
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 807
    .local v3, "name":Ljava/lang/String;
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->isEmptyElementTag()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 808
    const-string/jumbo v6, ""

    invoke-virtual {v2, v3, v6}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 812
    :cond_3
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 813
    const/4 v6, 0x4

    if-ne v1, v6, :cond_2

    .line 814
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v5

    .line 815
    .local v5, "value":Ljava/lang/String;
    invoke-virtual {v2, v3, v5}, Lorg/jivesoftware/smack/packet/DefaultPacketExtension;->setValue(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 819
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_4
    const/4 v6, 0x3

    if-ne v1, v6, :cond_2

    .line 820
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 821
    const/4 v0, 0x1

    goto :goto_1

    .end local v1    # "eventType":I
    :cond_5
    move-object v6, v2

    .line 825
    goto :goto_0
.end method

.method public static parsePresence(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Presence;
    .locals 22
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 191
    sget-object v17, Lorg/jivesoftware/smack/packet/Presence$Type;->available:Lorg/jivesoftware/smack/packet/Presence$Type;

    .line 192
    .local v17, "type":Lorg/jivesoftware/smack/packet/Presence$Type;
    const-string/jumbo v19, ""

    const-string/jumbo v20, "type"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 193
    .local v18, "typeString":Ljava/lang/String;
    if-eqz v18, :cond_0

    const-string/jumbo v19, ""

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_0

    .line 195
    :try_start_0
    invoke-static/range {v18 .. v18}, Lorg/jivesoftware/smack/packet/Presence$Type;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence$Type;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v17

    .line 201
    :cond_0
    :goto_0
    new-instance v14, Lorg/jivesoftware/smack/packet/Presence;

    move-object/from16 v0, v17

    invoke-direct {v14, v0}, Lorg/jivesoftware/smack/packet/Presence;-><init>(Lorg/jivesoftware/smack/packet/Presence$Type;)V

    .line 202
    .local v14, "presence":Lorg/jivesoftware/smack/packet/Presence;
    const-string/jumbo v19, ""

    const-string/jumbo v20, "to"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Lorg/jivesoftware/smack/packet/Presence;->setTo(Ljava/lang/String;)V

    .line 203
    const-string/jumbo v19, ""

    const-string/jumbo v20, "from"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Lorg/jivesoftware/smack/packet/Presence;->setFrom(Ljava/lang/String;)V

    .line 204
    const-string/jumbo v19, ""

    const-string/jumbo v20, "id"

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-interface {v0, v1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 205
    .local v9, "id":Ljava/lang/String;
    if-nez v9, :cond_4

    const-string/jumbo v19, "ID_NOT_AVAILABLE"

    :goto_1
    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Lorg/jivesoftware/smack/packet/Presence;->setPacketID(Ljava/lang/String;)V

    .line 207
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->getLanguageAttribute(Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/String;

    move-result-object v10

    .line 208
    .local v10, "language":Ljava/lang/String;
    if-eqz v10, :cond_1

    const-string/jumbo v19, ""

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_1

    .line 209
    invoke-virtual {v14, v10}, Lorg/jivesoftware/smack/packet/Presence;->setLanguage(Ljava/lang/String;)V

    .line 211
    :cond_1
    if-nez v9, :cond_2

    const-string/jumbo v9, "ID_NOT_AVAILABLE"

    .end local v9    # "id":Ljava/lang/String;
    :cond_2
    invoke-virtual {v14, v9}, Lorg/jivesoftware/smack/packet/Presence;->setPacketID(Ljava/lang/String;)V

    .line 214
    const/4 v3, 0x0

    .line 215
    .local v3, "done":Z
    :cond_3
    :goto_2
    if-nez v3, :cond_b

    .line 216
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    .line 217
    .local v6, "eventType":I
    const/16 v19, 0x2

    move/from16 v0, v19

    if-ne v6, v0, :cond_a

    .line 218
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v5

    .line 219
    .local v5, "elementName":Ljava/lang/String;
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v13

    .line 220
    .local v13, "namespace":Ljava/lang/String;
    const-string/jumbo v19, "status"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_5

    .line 221
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Lorg/jivesoftware/smack/packet/Presence;->setStatus(Ljava/lang/String;)V

    goto :goto_2

    .line 197
    .end local v3    # "done":Z
    .end local v5    # "elementName":Ljava/lang/String;
    .end local v6    # "eventType":I
    .end local v10    # "language":Ljava/lang/String;
    .end local v13    # "namespace":Ljava/lang/String;
    .end local v14    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :catch_0
    move-exception v8

    .line 198
    .local v8, "iae":Ljava/lang/IllegalArgumentException;
    sget-object v19, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "Found invalid presence type "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_0

    .end local v8    # "iae":Ljava/lang/IllegalArgumentException;
    .restart local v9    # "id":Ljava/lang/String;
    .restart local v14    # "presence":Lorg/jivesoftware/smack/packet/Presence;
    :cond_4
    move-object/from16 v19, v9

    .line 205
    goto :goto_1

    .line 223
    .end local v9    # "id":Ljava/lang/String;
    .restart local v3    # "done":Z
    .restart local v5    # "elementName":Ljava/lang/String;
    .restart local v6    # "eventType":I
    .restart local v10    # "language":Ljava/lang/String;
    .restart local v13    # "namespace":Ljava/lang/String;
    :cond_5
    const-string/jumbo v19, "priority"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 225
    :try_start_1
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    .line 226
    .local v15, "priority":I
    invoke-virtual {v14, v15}, Lorg/jivesoftware/smack/packet/Presence;->setPriority(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_2

    .line 228
    .end local v15    # "priority":I
    :catch_1
    move-exception v19

    goto :goto_2

    .line 231
    :catch_2
    move-exception v8

    .line 233
    .restart local v8    # "iae":Ljava/lang/IllegalArgumentException;
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v14, v0}, Lorg/jivesoftware/smack/packet/Presence;->setPriority(I)V

    goto :goto_2

    .line 236
    .end local v8    # "iae":Ljava/lang/IllegalArgumentException;
    :cond_6
    const-string/jumbo v19, "show"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_7

    .line 237
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v11

    .line 239
    .local v11, "modeText":Ljava/lang/String;
    :try_start_2
    invoke-static {v11}, Lorg/jivesoftware/smack/packet/Presence$Mode;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/Presence$Mode;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Lorg/jivesoftware/smack/packet/Presence;->setMode(Lorg/jivesoftware/smack/packet/Presence$Mode;)V
    :try_end_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_3

    goto/16 :goto_2

    .line 241
    :catch_3
    move-exception v8

    .line 242
    .restart local v8    # "iae":Ljava/lang/IllegalArgumentException;
    sget-object v19, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "Found invalid presence mode "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 245
    .end local v8    # "iae":Ljava/lang/IllegalArgumentException;
    .end local v11    # "modeText":Ljava/lang/String;
    :cond_7
    const-string/jumbo v19, "error"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_8

    .line 246
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/XMPPError;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Lorg/jivesoftware/smack/packet/Presence;->setError(Lorg/jivesoftware/smack/packet/XMPPError;)V

    goto/16 :goto_2

    .line 248
    :cond_8
    const-string/jumbo v19, "properties"

    move-object/from16 v0, v19

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_9

    const-string/jumbo v19, "http://www.jivesoftware.com/xmlns/xmpp/properties"

    move-object/from16 v0, v19

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_9

    .line 251
    invoke-static/range {p0 .. p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parseProperties(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Map;

    move-result-object v16

    .line 253
    .local v16, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface/range {v16 .. v16}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 254
    .local v12, "name":Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-interface {v0, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v14, v12, v0}, Lorg/jivesoftware/smack/packet/Presence;->setProperty(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    .line 260
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v12    # "name":Ljava/lang/String;
    .end local v16    # "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_9
    :try_start_3
    move-object/from16 v0, p0

    invoke-static {v5, v13, v0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Lorg/jivesoftware/smack/packet/Presence;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    goto/16 :goto_2

    .line 262
    :catch_4
    move-exception v4

    .line 263
    .local v4, "e":Ljava/lang/Exception;
    sget-object v19, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const-string/jumbo v20, "Failed to parse extension packet in Presence packet."

    invoke-virtual/range {v19 .. v20}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 267
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "elementName":Ljava/lang/String;
    .end local v13    # "namespace":Ljava/lang/String;
    :cond_a
    const/16 v19, 0x3

    move/from16 v0, v19

    if-ne v6, v0, :cond_3

    .line 268
    invoke-interface/range {p0 .. p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v19

    const-string/jumbo v20, "presence"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 269
    const/4 v3, 0x1

    goto/16 :goto_2

    .line 273
    .end local v6    # "eventType":I
    :cond_b
    return-object v14
.end method

.method public static parseProperties(Lorg/xmlpull/v1/XmlPullParser;)Ljava/util/Map;
    .locals 15
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v14, 0x3

    const/4 v13, 0x2

    .line 590
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 592
    .local v7, "properties":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    .line 593
    .local v4, "eventType":I
    if-ne v4, v13, :cond_c

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "property"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_c

    .line 595
    const/4 v1, 0x0

    .line 596
    .local v1, "done":Z
    const/4 v6, 0x0

    .line 597
    .local v6, "name":Ljava/lang/String;
    const/4 v8, 0x0

    .line 598
    .local v8, "type":Ljava/lang/String;
    const/4 v10, 0x0

    .line 599
    .local v10, "valueText":Ljava/lang/String;
    const/4 v9, 0x0

    .line 600
    :cond_1
    :goto_0
    if-nez v1, :cond_0

    .line 601
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4

    .line 602
    if-ne v4, v13, :cond_3

    .line 603
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 604
    .local v3, "elementName":Ljava/lang/String;
    const-string/jumbo v11, "name"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 605
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 607
    :cond_2
    const-string/jumbo v11, "value"

    invoke-virtual {v3, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 608
    const-string/jumbo v11, ""

    const-string/jumbo v12, "type"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 609
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v10

    goto :goto_0

    .line 612
    .end local v3    # "elementName":Ljava/lang/String;
    :cond_3
    if-ne v4, v14, :cond_1

    .line 613
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "property"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 614
    const-string/jumbo v11, "integer"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 615
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    .line 642
    :cond_4
    :goto_1
    if-eqz v6, :cond_5

    if-eqz v9, :cond_5

    .line 643
    invoke-interface {v7, v6, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 645
    :cond_5
    const/4 v1, 0x1

    goto :goto_0

    .line 617
    :cond_6
    const-string/jumbo v11, "long"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 618
    invoke-static {v10}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v9

    .local v9, "value":Ljava/lang/Long;
    goto :goto_1

    .line 620
    .end local v9    # "value":Ljava/lang/Long;
    :cond_7
    const-string/jumbo v11, "float"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_8

    .line 621
    invoke-static {v10}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v9

    .local v9, "value":Ljava/lang/Float;
    goto :goto_1

    .line 623
    .end local v9    # "value":Ljava/lang/Float;
    :cond_8
    const-string/jumbo v11, "double"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9

    .line 624
    invoke-static {v10}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v9

    .local v9, "value":Ljava/lang/Double;
    goto :goto_1

    .line 626
    .end local v9    # "value":Ljava/lang/Double;
    :cond_9
    const-string/jumbo v11, "boolean"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_a

    .line 627
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v9

    .local v9, "value":Ljava/lang/Boolean;
    goto :goto_1

    .line 629
    .end local v9    # "value":Ljava/lang/Boolean;
    :cond_a
    const-string/jumbo v11, "string"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_b

    .line 630
    move-object v9, v10

    .local v9, "value":Ljava/lang/String;
    goto :goto_1

    .line 632
    .end local v9    # "value":Ljava/lang/String;
    :cond_b
    const-string/jumbo v11, "java-object"

    invoke-virtual {v11, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 634
    :try_start_0
    invoke-static {v10}, Lorg/jivesoftware/smack/util/StringUtils;->decodeBase64(Ljava/lang/String;)[B

    move-result-object v0

    .line 635
    .local v0, "bytes":[B
    new-instance v5, Ljava/io/ObjectInputStream;

    new-instance v11, Ljava/io/ByteArrayInputStream;

    invoke-direct {v11, v0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v5, v11}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 636
    .local v5, "in":Ljava/io/ObjectInputStream;
    invoke-virtual {v5}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    .local v9, "value":Ljava/lang/Object;
    goto :goto_1

    .line 638
    .end local v0    # "bytes":[B
    .end local v5    # "in":Ljava/io/ObjectInputStream;
    .end local v9    # "value":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 639
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 650
    .end local v1    # "done":Z
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v6    # "name":Ljava/lang/String;
    .end local v8    # "type":Ljava/lang/String;
    .end local v10    # "valueText":Ljava/lang/String;
    :cond_c
    if-ne v4, v14, :cond_0

    .line 651
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "properties"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 656
    return-object v7
.end method

.method private static parseRegistration(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Registration;
    .locals 8
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 453
    new-instance v4, Lorg/jivesoftware/smack/packet/Registration;

    invoke-direct {v4}, Lorg/jivesoftware/smack/packet/Registration;-><init>()V

    .line 454
    .local v4, "registration":Lorg/jivesoftware/smack/packet/Registration;
    const/4 v2, 0x0

    .line 455
    .local v2, "fields":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 456
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_6

    .line 457
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 458
    .local v1, "eventType":I
    const/4 v6, 0x2

    if-ne v1, v6, :cond_5

    .line 461
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "jabber:iq:register"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 462
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 463
    .local v3, "name":Ljava/lang/String;
    const-string/jumbo v5, ""

    .line 464
    .local v5, "value":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 465
    new-instance v2, Ljava/util/HashMap;

    .end local v2    # "fields":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 468
    .restart local v2    # "fields":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v6

    const/4 v7, 0x4

    if-ne v6, v7, :cond_2

    .line 469
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    move-result-object v5

    .line 472
    :cond_2
    const-string/jumbo v6, "instructions"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 473
    invoke-interface {v2, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 476
    :cond_3
    invoke-virtual {v4, v5}, Lorg/jivesoftware/smack/packet/Registration;->setInstructions(Ljava/lang/String;)V

    goto :goto_0

    .line 481
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "value":Ljava/lang/String;
    :cond_4
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getNamespace()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, p0}, Lorg/jivesoftware/smack/util/PacketParserUtils;->parsePacketExtension(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/PacketExtension;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/jivesoftware/smack/packet/Registration;->addExtension(Lorg/jivesoftware/smack/packet/PacketExtension;)V

    goto :goto_0

    .line 488
    :cond_5
    const/4 v6, 0x3

    if-ne v1, v6, :cond_0

    .line 489
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "query"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 490
    const/4 v0, 0x1

    goto :goto_0

    .line 494
    .end local v1    # "eventType":I
    :cond_6
    invoke-virtual {v4, v2}, Lorg/jivesoftware/smack/packet/Registration;->setAttributes(Ljava/util/Map;)V

    .line 495
    return-object v4
.end method

.method private static parseResourceBinding(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/Bind;
    .locals 5
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 500
    new-instance v0, Lorg/jivesoftware/smack/packet/Bind;

    invoke-direct {v0}, Lorg/jivesoftware/smack/packet/Bind;-><init>()V

    .line 501
    .local v0, "bind":Lorg/jivesoftware/smack/packet/Bind;
    const/4 v1, 0x0

    .line 502
    .local v1, "done":Z
    :cond_0
    :goto_0
    if-nez v1, :cond_3

    .line 503
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 504
    .local v2, "eventType":I
    const/4 v3, 0x2

    if-ne v2, v3, :cond_2

    .line 505
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "resource"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 506
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Bind;->setResource(Ljava/lang/String;)V

    goto :goto_0

    .line 508
    :cond_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "jid"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 509
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/jivesoftware/smack/packet/Bind;->setJid(Ljava/lang/String;)V

    goto :goto_0

    .line 511
    :cond_2
    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 512
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "bind"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 513
    const/4 v1, 0x1

    goto :goto_0

    .line 518
    .end local v2    # "eventType":I
    :cond_3
    return-object v0
.end method

.method private static parseRoster(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/RosterPacket;
    .locals 13
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 413
    new-instance v7, Lorg/jivesoftware/smack/packet/RosterPacket;

    invoke-direct {v7}, Lorg/jivesoftware/smack/packet/RosterPacket;-><init>()V

    .line 414
    .local v7, "roster":Lorg/jivesoftware/smack/packet/RosterPacket;
    const/4 v1, 0x0

    .line 415
    .local v1, "done":Z
    const/4 v4, 0x0

    .line 416
    .local v4, "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    :cond_0
    :goto_0
    if-nez v1, :cond_5

    .line 417
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 418
    .local v2, "eventType":I
    const/4 v11, 0x2

    if-ne v2, v11, :cond_3

    .line 419
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "item"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_1

    .line 420
    const-string/jumbo v11, ""

    const-string/jumbo v12, "jid"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 421
    .local v5, "jid":Ljava/lang/String;
    const-string/jumbo v11, ""

    const-string/jumbo v12, "name"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 423
    .local v6, "name":Ljava/lang/String;
    new-instance v4, Lorg/jivesoftware/smack/packet/RosterPacket$Item;

    .end local v4    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    invoke-direct {v4, v5, v6}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 425
    .restart local v4    # "item":Lorg/jivesoftware/smack/packet/RosterPacket$Item;
    const-string/jumbo v11, ""

    const-string/jumbo v12, "ask"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 426
    .local v0, "ask":Ljava/lang/String;
    invoke-static {v0}, Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;->fromString(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;

    move-result-object v8

    .line 427
    .local v8, "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    invoke-virtual {v4, v8}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemStatus(Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;)V

    .line 429
    const-string/jumbo v11, ""

    const-string/jumbo v12, "subscription"

    invoke-interface {p0, v11, v12}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 430
    .local v9, "subscription":Ljava/lang/String;
    if-eqz v9, :cond_2

    .end local v9    # "subscription":Ljava/lang/String;
    :goto_1
    invoke-static {v9}, Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;->valueOf(Ljava/lang/String;)Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;

    move-result-object v10

    .line 431
    .local v10, "type":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    invoke-virtual {v4, v10}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->setItemType(Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;)V

    .line 433
    .end local v0    # "ask":Ljava/lang/String;
    .end local v5    # "jid":Ljava/lang/String;
    .end local v6    # "name":Ljava/lang/String;
    .end local v8    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .end local v10    # "type":Lorg/jivesoftware/smack/packet/RosterPacket$ItemType;
    :cond_1
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "group"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    if-eqz v4, :cond_0

    .line 434
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v3

    .line 435
    .local v3, "groupName":Ljava/lang/String;
    if-eqz v3, :cond_0

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_0

    .line 436
    invoke-virtual {v4, v3}, Lorg/jivesoftware/smack/packet/RosterPacket$Item;->addGroupName(Ljava/lang/String;)V

    goto :goto_0

    .line 430
    .end local v3    # "groupName":Ljava/lang/String;
    .restart local v0    # "ask":Ljava/lang/String;
    .restart local v5    # "jid":Ljava/lang/String;
    .restart local v6    # "name":Ljava/lang/String;
    .restart local v8    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .restart local v9    # "subscription":Ljava/lang/String;
    :cond_2
    const-string/jumbo v9, "none"

    goto :goto_1

    .line 440
    .end local v0    # "ask":Ljava/lang/String;
    .end local v5    # "jid":Ljava/lang/String;
    .end local v6    # "name":Ljava/lang/String;
    .end local v8    # "status":Lorg/jivesoftware/smack/packet/RosterPacket$ItemStatus;
    .end local v9    # "subscription":Ljava/lang/String;
    :cond_3
    const/4 v11, 0x3

    if-ne v2, v11, :cond_0

    .line 441
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "item"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 442
    invoke-virtual {v7, v4}, Lorg/jivesoftware/smack/packet/RosterPacket;->addRosterItem(Lorg/jivesoftware/smack/packet/RosterPacket$Item;)V

    .line 444
    :cond_4
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v11

    const-string/jumbo v12, "query"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 445
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 449
    .end local v2    # "eventType":I
    :cond_5
    return-object v7
.end method

.method public static parseSASLFailure(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/sasl/SASLMechanism$Failure;
    .locals 5
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 667
    const/4 v0, 0x0

    .line 668
    .local v0, "condition":Ljava/lang/String;
    const/4 v1, 0x0

    .line 669
    .local v1, "done":Z
    :cond_0
    :goto_0
    if-nez v1, :cond_2

    .line 670
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 672
    .local v2, "eventType":I
    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 673
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "failure"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 674
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 677
    :cond_1
    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 678
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "failure"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 679
    const/4 v1, 0x1

    goto :goto_0

    .line 683
    .end local v2    # "eventType":I
    :cond_2
    new-instance v3, Lorg/jivesoftware/smack/sasl/SASLMechanism$Failure;

    invoke-direct {v3, v0}, Lorg/jivesoftware/smack/sasl/SASLMechanism$Failure;-><init>(Ljava/lang/String;)V

    return-object v3
.end method

.method public static parseStreamError(Lorg/xmlpull/v1/XmlPullParser;)Lorg/jivesoftware/smack/packet/StreamError;
    .locals 5
    .param p0, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    .prologue
    .line 695
    const/4 v2, 0x0

    .line 696
    .local v2, "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    const/4 v0, 0x0

    .line 697
    .local v0, "done":Z
    :cond_0
    :goto_0
    if-nez v0, :cond_2

    .line 698
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    .line 700
    .local v1, "eventType":I
    const/4 v3, 0x2

    if-ne v1, v3, :cond_1

    .line 701
    new-instance v2, Lorg/jivesoftware/smack/packet/StreamError;

    .end local v2    # "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/jivesoftware/smack/packet/StreamError;-><init>(Ljava/lang/String;)V

    .restart local v2    # "streamError":Lorg/jivesoftware/smack/packet/StreamError;
    goto :goto_0

    .line 703
    :cond_1
    const/4 v3, 0x3

    if-ne v1, v3, :cond_0

    .line 704
    invoke-interface {p0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "error"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 705
    const/4 v0, 0x1

    goto :goto_0

    .line 709
    .end local v1    # "eventType":I
    :cond_2
    return-object v2
.end method

.method public static parseWithIntrospection(Ljava/lang/String;Ljava/lang/Class;Lorg/xmlpull/v1/XmlPullParser;)Ljava/lang/Object;
    .locals 11
    .param p0, "elementName"    # Ljava/lang/String;
    .param p2, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/xmlpull/v1/XmlPullParser;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 843
    .local p1, "objectClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .line 844
    .local v1, "done":Z
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    .line 845
    .local v4, "object":Ljava/lang/Object;
    :cond_0
    :goto_0
    if-nez v1, :cond_2

    .line 846
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    .line 847
    .local v2, "eventType":I
    const/4 v8, 0x2

    if-ne v2, v8, :cond_1

    .line 848
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v3

    .line 849
    .local v3, "name":Ljava/lang/String;
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->nextText()Ljava/lang/String;

    move-result-object v6

    .line 850
    .local v6, "stringValue":Ljava/lang/String;
    new-instance v0, Ljava/beans/PropertyDescriptor;

    invoke-direct {v0, v3, p1}, Ljava/beans/PropertyDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    .line 852
    .local v0, "descriptor":Ljava/beans/PropertyDescriptor;
    invoke-virtual {v0}, Ljava/beans/PropertyDescriptor;->getPropertyType()Ljava/lang/Class;

    move-result-object v5

    .line 855
    .local v5, "propertyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-static {v5, v6}, Lorg/jivesoftware/smack/util/PacketParserUtils;->decode(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    .line 857
    .local v7, "value":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/beans/PropertyDescriptor;->getWriteMethod()Ljava/lang/reflect/Method;

    move-result-object v8

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v7, v9, v10

    invoke-virtual {v8, v4, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 859
    .end local v0    # "descriptor":Ljava/beans/PropertyDescriptor;
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "propertyType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v6    # "stringValue":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/Object;
    :cond_1
    const/4 v8, 0x3

    if-ne v2, v8, :cond_0

    .line 860
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 861
    const/4 v1, 0x1

    goto :goto_0

    .line 865
    .end local v2    # "eventType":I
    :cond_2
    return-object v4
.end method
