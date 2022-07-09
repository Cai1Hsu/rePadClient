.class Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;
.super Lorg/apache/tools/ant/helper/ProjectHelperImpl$AbstractHandler;
.source "ProjectHelperImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/helper/ProjectHelperImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NestedElementHandler"
.end annotation


# instance fields
.field private child:Ljava/lang/Object;

.field private childWrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

.field private parent:Ljava/lang/Object;

.field private parentWrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

.field private target:Lorg/apache/tools/ant/Target;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;Ljava/lang/Object;Lorg/apache/tools/ant/RuntimeConfigurable;Lorg/apache/tools/ant/Target;)V
    .locals 1
    .param p1, "helperImpl"    # Lorg/apache/tools/ant/helper/ProjectHelperImpl;
    .param p2, "parentHandler"    # Lorg/xml/sax/DocumentHandler;
    .param p3, "parent"    # Ljava/lang/Object;
    .param p4, "parentWrapper"    # Lorg/apache/tools/ant/RuntimeConfigurable;
    .param p5, "target"    # Lorg/apache/tools/ant/Target;

    .prologue
    .line 830
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$AbstractHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;)V

    .line 804
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->childWrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    .line 832
    instance-of v0, p3, Lorg/apache/tools/ant/TypeAdapter;

    if-eqz v0, :cond_0

    .line 833
    check-cast p3, Lorg/apache/tools/ant/TypeAdapter;

    .end local p3    # "parent":Ljava/lang/Object;
    invoke-interface {p3}, Lorg/apache/tools/ant/TypeAdapter;->getProxy()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->parent:Ljava/lang/Object;

    .line 837
    :goto_0
    iput-object p4, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->parentWrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    .line 838
    iput-object p5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->target:Lorg/apache/tools/ant/Target;

    .line 839
    return-void

    .line 835
    .restart local p3    # "parent":Ljava/lang/Object;
    :cond_0
    iput-object p3, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->parent:Ljava/lang/Object;

    goto :goto_0
.end method


# virtual methods
.method public characters([CII)V
    .locals 1
    .param p1, "buf"    # [C
    .param p2, "start"    # I
    .param p3, "count"    # I

    .prologue
    .line 890
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->childWrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual {v0, p1, p2, p3}, Lorg/apache/tools/ant/RuntimeConfigurable;->addText([CII)V

    .line 891
    return-void
.end method

.method public init(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 8
    .param p1, "propType"    # Ljava/lang/String;
    .param p2, "attrs"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 858
    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->parent:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 859
    .local v3, "parentClass":Ljava/lang/Class;
    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v5}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-static {v5, v3}, Lorg/apache/tools/ant/IntrospectionHelper;->getHelper(Lorg/apache/tools/ant/Project;Ljava/lang/Class;)Lorg/apache/tools/ant/IntrospectionHelper;

    move-result-object v2

    .line 862
    .local v2, "ih":Lorg/apache/tools/ant/IntrospectionHelper;
    :try_start_0
    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 863
    .local v0, "elementName":Ljava/lang/String;
    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->parent:Ljava/lang/Object;

    instance-of v5, v5, Lorg/apache/tools/ant/UnknownElement;

    if-eqz v5, :cond_0

    .line 864
    new-instance v4, Lorg/apache/tools/ant/UnknownElement;

    invoke-direct {v4, v0}, Lorg/apache/tools/ant/UnknownElement;-><init>(Ljava/lang/String;)V

    .line 865
    .local v4, "uc":Lorg/apache/tools/ant/UnknownElement;
    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v5}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/apache/tools/ant/UnknownElement;->setProject(Lorg/apache/tools/ant/Project;)V

    .line 866
    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->parent:Ljava/lang/Object;

    check-cast v5, Lorg/apache/tools/ant/UnknownElement;

    invoke-virtual {v5, v4}, Lorg/apache/tools/ant/UnknownElement;->addChild(Lorg/apache/tools/ant/UnknownElement;)V

    .line 867
    iput-object v4, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->child:Ljava/lang/Object;

    .line 871
    .end local v4    # "uc":Lorg/apache/tools/ant/UnknownElement;
    :goto_0
    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    iget-object v6, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->child:Ljava/lang/Object;

    invoke-static {v5, v6, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$800(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Ljava/lang/Object;Lorg/xml/sax/AttributeList;)V

    .line 873
    new-instance v5, Lorg/apache/tools/ant/RuntimeConfigurable;

    iget-object v6, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->child:Ljava/lang/Object;

    invoke-direct {v5, v6, p1}, Lorg/apache/tools/ant/RuntimeConfigurable;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->childWrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    .line 874
    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->childWrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual {v5, p2}, Lorg/apache/tools/ant/RuntimeConfigurable;->setAttributes(Lorg/xml/sax/AttributeList;)V

    .line 875
    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->parentWrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    iget-object v6, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->childWrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    invoke-virtual {v5, v6}, Lorg/apache/tools/ant/RuntimeConfigurable;->addChild(Lorg/apache/tools/ant/RuntimeConfigurable;)V

    .line 879
    return-void

    .line 869
    :cond_0
    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v5}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$200(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/apache/tools/ant/Project;

    move-result-object v5

    iget-object v6, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->parent:Ljava/lang/Object;

    invoke-virtual {v2, v5, v6, v0}, Lorg/apache/tools/ant/IntrospectionHelper;->createElement(Lorg/apache/tools/ant/Project;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    iput-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->child:Ljava/lang/Object;
    :try_end_0
    .catch Lorg/apache/tools/ant/BuildException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 876
    .end local v0    # "elementName":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 877
    .local v1, "exc":Lorg/apache/tools/ant/BuildException;
    new-instance v5, Lorg/xml/sax/SAXParseException;

    invoke-virtual {v1}, Lorg/apache/tools/ant/BuildException;->getMessage()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    invoke-static {v7}, Lorg/apache/tools/ant/helper/ProjectHelperImpl;->access$100(Lorg/apache/tools/ant/helper/ProjectHelperImpl;)Lorg/xml/sax/Locator;

    move-result-object v7

    invoke-direct {v5, v6, v7, v1}, Lorg/xml/sax/SAXParseException;-><init>(Ljava/lang/String;Lorg/xml/sax/Locator;Ljava/lang/Exception;)V

    throw v5
.end method

.method public startElement(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "attrs"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXParseException;
        }
    .end annotation

    .prologue
    .line 907
    iget-object v0, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->child:Ljava/lang/Object;

    instance-of v0, v0, Lorg/apache/tools/ant/TaskContainer;

    if-eqz v0, :cond_0

    .line 910
    new-instance v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TaskHandler;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    iget-object v3, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->child:Ljava/lang/Object;

    check-cast v3, Lorg/apache/tools/ant/TaskContainer;

    iget-object v4, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->childWrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->target:Lorg/apache/tools/ant/Target;

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TaskHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;Lorg/apache/tools/ant/TaskContainer;Lorg/apache/tools/ant/RuntimeConfigurable;Lorg/apache/tools/ant/Target;)V

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$TaskHandler;->init(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V

    .line 916
    :goto_0
    return-void

    .line 913
    :cond_0
    new-instance v0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;

    iget-object v1, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->helperImpl:Lorg/apache/tools/ant/helper/ProjectHelperImpl;

    iget-object v3, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->child:Ljava/lang/Object;

    iget-object v4, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->childWrapper:Lorg/apache/tools/ant/RuntimeConfigurable;

    iget-object v5, p0, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->target:Lorg/apache/tools/ant/Target;

    move-object v2, p0

    invoke-direct/range {v0 .. v5}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;-><init>(Lorg/apache/tools/ant/helper/ProjectHelperImpl;Lorg/xml/sax/DocumentHandler;Ljava/lang/Object;Lorg/apache/tools/ant/RuntimeConfigurable;Lorg/apache/tools/ant/Target;)V

    invoke-virtual {v0, p1, p2}, Lorg/apache/tools/ant/helper/ProjectHelperImpl$NestedElementHandler;->init(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V

    goto :goto_0
.end method
