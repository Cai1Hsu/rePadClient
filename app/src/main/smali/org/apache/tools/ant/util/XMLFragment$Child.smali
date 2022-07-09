.class public Lorg/apache/tools/ant/util/XMLFragment$Child;
.super Ljava/lang/Object;
.source "XMLFragment.java"

# interfaces
.implements Lorg/apache/tools/ant/DynamicConfiguratorNS;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/util/XMLFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Child"
.end annotation


# instance fields
.field private e:Lorg/w3c/dom/Element;

.field private final this$0:Lorg/apache/tools/ant/util/XMLFragment;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/util/XMLFragment;Lorg/w3c/dom/Element;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/util/XMLFragment;
    .param p2, "e"    # Lorg/w3c/dom/Element;

    .prologue
    .line 109
    iput-object p1, p0, Lorg/apache/tools/ant/util/XMLFragment$Child;->this$0:Lorg/apache/tools/ant/util/XMLFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    iput-object p2, p0, Lorg/apache/tools/ant/util/XMLFragment$Child;->e:Lorg/w3c/dom/Element;

    .line 111
    return-void
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 118
    iget-object v0, p0, Lorg/apache/tools/ant/util/XMLFragment$Child;->this$0:Lorg/apache/tools/ant/util/XMLFragment;

    iget-object v1, p0, Lorg/apache/tools/ant/util/XMLFragment$Child;->e:Lorg/w3c/dom/Element;

    invoke-static {v0, v1, p1}, Lorg/apache/tools/ant/util/XMLFragment;->access$000(Lorg/apache/tools/ant/util/XMLFragment;Lorg/w3c/dom/Node;Ljava/lang/String;)V

    .line 119
    return-void
.end method

.method public createDynamicElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;

    .prologue
    .line 145
    const/4 v0, 0x0

    .line 146
    .local v0, "e2":Lorg/w3c/dom/Element;
    const-string/jumbo v1, ""

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 147
    iget-object v1, p0, Lorg/apache/tools/ant/util/XMLFragment$Child;->this$0:Lorg/apache/tools/ant/util/XMLFragment;

    invoke-static {v1}, Lorg/apache/tools/ant/util/XMLFragment;->access$100(Lorg/apache/tools/ant/util/XMLFragment;)Lorg/w3c/dom/Document;

    move-result-object v1

    invoke-interface {v1, p2}, Lorg/w3c/dom/Document;->createElement(Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    .line 151
    :goto_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/XMLFragment$Child;->e:Lorg/w3c/dom/Element;

    invoke-interface {v1, v0}, Lorg/w3c/dom/Element;->appendChild(Lorg/w3c/dom/Node;)Lorg/w3c/dom/Node;

    .line 152
    new-instance v1, Lorg/apache/tools/ant/util/XMLFragment$Child;

    iget-object v2, p0, Lorg/apache/tools/ant/util/XMLFragment$Child;->this$0:Lorg/apache/tools/ant/util/XMLFragment;

    invoke-direct {v1, v2, v0}, Lorg/apache/tools/ant/util/XMLFragment$Child;-><init>(Lorg/apache/tools/ant/util/XMLFragment;Lorg/w3c/dom/Element;)V

    return-object v1

    .line 149
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/util/XMLFragment$Child;->this$0:Lorg/apache/tools/ant/util/XMLFragment;

    invoke-static {v1}, Lorg/apache/tools/ant/util/XMLFragment;->access$100(Lorg/apache/tools/ant/util/XMLFragment;)Lorg/w3c/dom/Document;

    move-result-object v1

    invoke-interface {v1, p1, p3}, Lorg/w3c/dom/Document;->createElementNS(Ljava/lang/String;Ljava/lang/String;)Lorg/w3c/dom/Element;

    move-result-object v0

    goto :goto_0
.end method

.method public setDynamicAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "qName"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;

    .prologue
    .line 130
    const-string/jumbo v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 131
    iget-object v0, p0, Lorg/apache/tools/ant/util/XMLFragment$Child;->e:Lorg/w3c/dom/Element;

    invoke-interface {v0, p2, p4}, Lorg/w3c/dom/Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    :goto_0
    return-void

    .line 133
    :cond_0
    iget-object v0, p0, Lorg/apache/tools/ant/util/XMLFragment$Child;->e:Lorg/w3c/dom/Element;

    invoke-interface {v0, p1, p3, p4}, Lorg/w3c/dom/Element;->setAttributeNS(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
