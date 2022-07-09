.class public Lorg/apache/tools/ant/util/XMLFragment;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "XMLFragment.java"

# interfaces
.implements Lorg/apache/tools/ant/DynamicElementNS;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/tools/ant/util/XMLFragment$Child;
    }
.end annotation


# instance fields
.field private doc:Lorg/w3c/dom/Document;

.field private fragment:Lorg/w3c/dom/DocumentFragment;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    .line 51
    invoke-static {}, Lorg/apache/tools/ant/util/JAXPUtils;->getDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljavax/xml/parsers/DocumentBuilder;->newDocument()Lorg/w3c/dom/Document;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/XMLFragment;->doc:Lorg/w3c/dom/Document;

    .line 52
    iget-object v0, p0, Lorg/apache/tools/ant/util/XMLFragment;->doc:Lorg/w3c/dom/Document;

    invoke-interface {v0}, Lorg/w3c/dom/Document;->createDocumentFragment()Lorg/w3c/dom/DocumentFragment;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/util/XMLFragment;->fragment:Lorg/w3c/dom/DocumentFragment;

    .line 53
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/util/XMLFragment;Lorg/w3c/dom/Node;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lorg/apache/tools/ant/util/XMLFragment;
    .param p1, "x1"    # Lorg/w3c/dom/Node;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/util/XMLFragment;->addText(Lorg/w3c/dom/Node;Ljava/lang/String;)V

    return-void
.end method

.method static access$100(Lorg/apache/tools/ant/util/XMLFragment;)Lorg/w3c/dom/Document;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/util/XMLFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lorg/apache/tools/ant/util/XMLFragment;->doc:Lorg/w3c/dom/Document;

    return-object v0
.end method

.method private addText(Lorg/w3c/dom/Node;Ljava/lang/String;)V
    .locals 3
    .param p1, "n"    # Lorg/w3c/dom/Node;
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 95
    invoke-virtual {p0}, Lorg/apache/tools/ant/util/XMLFragment;->getProject()Lorg/apache/tools/ant/Project;

    move-result-object v1

    invoke-virtual {v1, p2}, Lorg/apache/tools/ant/Project;->replaceProperties(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 97
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 98
    iget-object v1, p0, Lorg/apache/tools/ant/util/XMLFragment;->doc:Lorg/w3c/dom/Document;

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/w3c/dom/Document;->createTextNode(Ljava/lang/String;)Lorg/w3c/dom/Text;

    move-result-object v0

    .line 99
    .local v0, "t":Lorg/w3c/dom/Text;
    invoke-interface {p1, v0}, Lorg/w3c/dom/Node;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 101
    .end local v0    # "t":Lorg/w3c/dom/Text;
    :cond_0
    return-void
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 1
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 68
    iget-object v0, p0, Lorg/apache/tools/ant/util/XMLFragment;->fragment:Lorg/w3c/dom/DocumentFragment;

    invoke-direct {p0, v0, p1}, Lorg/apache/tools/ant/util/XMLFragment;->addText(Lorg/w3c/dom/Node;Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public createDynamicElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;

    .prologue
    .line 79
    const/4 v0, 0x0

    .line 80
    .local v0, "e":Lorg/w3c/dom/Element;
    const-string/jumbo v1, ""

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 81
    iget-object v1, p0, Lorg/apache/tools/ant/util/XMLFragment;->doc:Lorg/w3c/dom/Document;

    invoke-interface {v1, p2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 85
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/XMLFragment;->fragment:Lorg/w3c/dom/DocumentFragment;

    invoke-interface {v1, v0}, Lorg/w3c/dom/DocumentFragment;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 86
    new-instance v1, Lorg/apache/tools/ant/util/XMLFragment$Child;

    invoke-direct {v1, p0, v0}, Lorg/apache/tools/ant/util/XMLFragment$Child;-><init>(Lorg/apache/tools/ant/util/XMLFragment;Lorg/w3c/dom/Element;)V

    return-object v1

    .line 83
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/XMLFragment;->doc:Lorg/w3c/dom/Document;

    invoke-interface {v1, p1, p3}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    goto :goto_0
.end method

.method public getFragment()Lorg/w3c/dom/DocumentFragment;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/apache/tools/ant/util/XMLFragment;->fragment:Lorg/w3c/dom/DocumentFragment;

    return-object v0
.end method
