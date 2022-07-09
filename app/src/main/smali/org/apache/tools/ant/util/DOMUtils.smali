.class public Lorg/apache/tools/ant/util/DOMUtils;
.super Ljava/lang/Object;
.source "DOMUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static appendCDATA(Lorg/w3c/dom/Element;Ljava/lang/String;)V
    .locals 2
    .param p0, "parent"    # Lorg/w3c/dom/Element;
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 113
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v1

    .line 114
    .local v1, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v1, p1}, Lorg/w3c/dom/Document;->createCDATASection(Ljava/lang/String;)Lorg/w3c/dom/CDATASection;

    move-result-object v0

    .line 115
    .local v0, "c":Lorg/w3c/dom/CDATASection;
    invoke-interface {p0, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 116
    return-void
.end method

.method public static appendCDATAElement(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "parent"    # Lorg/w3c/dom/Element;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;

    .prologue
    .line 165
    invoke-static {p0, p1}, Lorg/apache/tools/ant/util/DOMUtils;->createChildElement(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 166
    .local v0, "e":Lorg/w3c/dom/Element;
    invoke-static {v0, p2}, Lorg/apache/tools/ant/util/DOMUtils;->appendCDATA(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    .line 167
    return-void
.end method

.method public static appendText(Lorg/w3c/dom/Element;Ljava/lang/String;)V
    .locals 2
    .param p0, "parent"    # Lorg/w3c/dom/Element;
    .param p1, "content"    # Ljava/lang/String;

    .prologue
    .line 91
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    .line 92
    .local v0, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v0, p1}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v1

    .line 93
    .local v1, "t":Lorg/w3c/dom/Text;
    invoke-interface {p0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 94
    return-void
.end method

.method public static appendTextElement(Lorg/w3c/dom/Element;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "parent"    # Lorg/w3c/dom/Element;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "content"    # Ljava/lang/String;

    .prologue
    .line 139
    invoke-static {p0, p1}, Lorg/apache/tools/ant/util/DOMUtils;->createChildElement(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 140
    .local v0, "e":Lorg/w3c/dom/Element;
    invoke-static {v0, p2}, Lorg/apache/tools/ant/util/DOMUtils;->appendText(Lorg/w3c/dom/Element;Ljava/lang/String;)V

    .line 141
    return-void
.end method

.method public static createChildElement(Lorg/w3c/dom/Element;Ljava/lang/String;)Lorg/w3c/dom/Element;
    .locals 2
    .param p0, "parent"    # Lorg/w3c/dom/Element;
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-interface {p0}, Lorg/w3c/dom/Element;->getOwnerDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    .line 69
    .local v0, "doc":Lorg/w3c/dom/Document;
    invoke-interface {v0, p1}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v1

    .line 70
    .local v1, "e":Lorg/w3c/dom/Element;
    invoke-interface {p0, v1}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 71
    return-object v1
.end method

.method public static newDocument()Lorg/w3c/dom/Document;
    .locals 1

    .prologue
    .line 44
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    return-object v0
.end method
