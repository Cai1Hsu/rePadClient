.class Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;
.super Lorg/xml/sax/HandlerBase;
.source "IPlanetEjbc.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EjbcHandler"
.end annotation


# static fields
.field private static final DEFAULT_IAS60_DTD_LOCATION:Ljava/lang/String; = "IASEjb_jar_1_0.dtd"

.field private static final DEFAULT_IAS60_EJB11_DTD_LOCATION:Ljava/lang/String; = "ejb-jar_1_1.dtd"

.field private static final PUBLICID_EJB11:Ljava/lang/String; = "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN"

.field private static final PUBLICID_IPLANET_EJB_60:Ljava/lang/String; = "-//Sun Microsystems, Inc.//DTD iAS Enterprise JavaBeans 1.0//EN"


# instance fields
.field private currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

.field private currentLoc:Ljava/lang/String;

.field private currentText:Ljava/lang/String;

.field private ejbType:Ljava/lang/String;

.field private ejbs:Ljava/util/Map;

.field private fileDtds:Ljava/util/Map;

.field private iasDescriptor:Z

.field private resourceDtds:Ljava/util/Map;

.field private final this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;)V
    .locals 2
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    .prologue
    .line 644
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    invoke-direct {p0}, Lorg/xml/sax/HandlerBase;-><init>()V

    .line 628
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->resourceDtds:Ljava/util/Map;

    .line 629
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->fileDtds:Ljava/util/Map;

    .line 631
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->ejbs:Ljava/util/Map;

    .line 633
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->iasDescriptor:Z

    .line 635
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    .line 645
    const-string/jumbo v0, "-//Sun Microsystems, Inc.//DTD Enterprise JavaBeans 1.1//EN"

    const-string/jumbo v1, "ejb-jar_1_1.dtd"

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 646
    const-string/jumbo v0, "-//Sun Microsystems, Inc.//DTD iAS Enterprise JavaBeans 1.0//EN"

    const-string/jumbo v1, "IASEjb_jar_1_0.dtd"

    invoke-virtual {p0, v0, v1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->registerDTD(Ljava/lang/String;Ljava/lang/String;)V

    .line 647
    return-void
.end method

.method private iasCharacters(Ljava/lang/String;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 866
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "\\ias-ejb-jar\\enterprise-beans\\"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->ejbType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 868
    .local v0, "base":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\\ejb-name"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 869
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->ejbs:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    .line 870
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    if-nez v1, :cond_0

    .line 871
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    invoke-direct {v1, v2, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    .line 872
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->ejbs:Ljava/util/Map;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 882
    :cond_0
    :goto_0
    return-void

    .line 874
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\\iiop"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 875
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setIiop(Ljava/lang/String;)V

    goto :goto_0

    .line 876
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\\failover-required"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 877
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setHasession(Ljava/lang/String;)V

    goto :goto_0

    .line 878
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\\persistence-manager"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\\properties-file-location"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 880
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->addCmpDescriptor(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private stdCharacters(Ljava/lang/String;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 827
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    const-string/jumbo v2, "\\ejb-jar\\display-name"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 828
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    invoke-static {v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->access$102(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)Ljava/lang/String;

    .line 853
    :cond_0
    :goto_0
    return-void

    .line 832
    :cond_1
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v2, "\\ejb-jar\\enterprise-beans\\"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->ejbType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 834
    .local v0, "base":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\\ejb-name"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 835
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->ejbs:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    .line 836
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    if-nez v1, :cond_0

    .line 837
    new-instance v1, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    invoke-direct {v1, v2, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;-><init>(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    .line 838
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->ejbs:Ljava/util/Map;

    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 840
    :cond_2
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\\home"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 841
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setHome(Ljava/lang/String;)V

    goto :goto_0

    .line 842
    :cond_3
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\\remote"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 843
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setRemote(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 844
    :cond_4
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\\ejb-class"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 845
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setImplementation(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 846
    :cond_5
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\\prim-key-class"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 847
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setPrimaryKey(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 848
    :cond_6
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\\session-type"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 849
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setBeantype(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 850
    :cond_7
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string/jumbo v3, "\\persistence-type"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 851
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentEjb:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    invoke-virtual {v1, p1}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;->setCmp(Ljava/lang/String;)V

    goto/16 :goto_0
.end method


# virtual methods
.method public characters([CII)V
    .locals 3
    .param p1, "ch"    # [C
    .param p2, "start"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 783
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, p1}, Ljava/lang/String;-><init>([C)V

    add-int v2, p2, p3

    invoke-virtual {v1, p2, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentText:Ljava/lang/String;

    .line 784
    return-void
.end method

.method public endElement(Ljava/lang/String;)V
    .locals 5
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 800
    iget-boolean v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->iasDescriptor:Z

    if-eqz v2, :cond_0

    .line 801
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentText:Ljava/lang/String;

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->iasCharacters(Ljava/lang/String;)V

    .line 811
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v1, v2, 0x1

    .line 812
    .local v1, "nameLength":I
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v0

    .line 814
    .local v0, "locLength":I
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    const/4 v3, 0x0

    sub-int v4, v0, v1

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    .line 815
    return-void

    .line 803
    .end local v0    # "locLength":I
    .end local v1    # "nameLength":I
    :cond_0
    iget-object v2, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentText:Ljava/lang/String;

    invoke-direct {p0, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->stdCharacters(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 667
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    invoke-static {v0}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->access$100(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getEjbs()[Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;
    .locals 2

    .prologue
    .line 657
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->ejbs:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->ejbs:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbInfo;

    return-object v0
.end method

.method public registerDTD(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "publicID"    # Ljava/lang/String;
    .param p2, "location"    # Ljava/lang/String;

    .prologue
    .line 683
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Registering: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->access$200(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    .line 684
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 698
    :cond_0
    :goto_0
    return-void

    .line 688
    :cond_1
    invoke-static {p2}, Ljava/lang/ClassLoader;->getSystemResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 689
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Found resource: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->access$200(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    .line 690
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->resourceDtds:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 692
    :cond_2
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 693
    .local v0, "dtdFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 694
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->this$0:Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v3, "Found file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;->access$200(Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc;Ljava/lang/String;)V

    .line 695
    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->fileDtds:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .locals 5
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "systemId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 712
    const/4 v1, 0x0

    .line 719
    .local v1, "inputStream":Ljava/io/InputStream;
    :try_start_0
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->resourceDtds:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 720
    .local v3, "location":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 721
    invoke-static {v3}, Ljava/lang/ClassLoader;->getSystemResource(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v4

    invoke-virtual {v4}, Ljava/net/URL;->openStream()Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 733
    :cond_0
    :goto_0
    if-nez v1, :cond_2

    .line 734
    invoke-super {p0, p1, p2}, Lorg/xml/sax/HandlerBase;->resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;

    move-result-object v4

    .line 736
    .end local v3    # "location":Ljava/lang/String;
    :goto_1
    return-object v4

    .line 724
    .restart local v3    # "location":Ljava/lang/String;
    :cond_1
    :try_start_1
    iget-object v4, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->fileDtds:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .end local v3    # "location":Ljava/lang/String;
    check-cast v3, Ljava/lang/String;

    .line 725
    .restart local v3    # "location":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 726
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .end local v1    # "inputStream":Ljava/io/InputStream;
    .local v2, "inputStream":Ljava/io/InputStream;
    move-object v1, v2

    .end local v2    # "inputStream":Ljava/io/InputStream;
    .restart local v1    # "inputStream":Ljava/io/InputStream;
    goto :goto_0

    .line 729
    .end local v3    # "location":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 730
    .local v0, "e":Ljava/io/IOException;
    invoke-super {p0, p1, p2}, Lorg/xml/sax/HandlerBase;->resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;

    move-result-object v4

    goto :goto_1

    .line 736
    .end local v0    # "e":Ljava/io/IOException;
    .restart local v3    # "location":Ljava/lang/String;
    :cond_2
    new-instance v4, Lorg/xml/sax/InputSource;

    invoke-direct {v4, v1}, Lorg/xml/sax/InputSource;-><init>(Ljava/io/InputStream;)V

    goto :goto_1
.end method

.method public startElement(Ljava/lang/String;Lorg/xml/sax/AttributeList;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "atts"    # Lorg/xml/sax/AttributeList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    .prologue
    .line 755
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "\\"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    .line 758
    const-string/jumbo v0, ""

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentText:Ljava/lang/String;

    .line 760
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    const-string/jumbo v1, "\\ejb-jar"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 761
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->iasDescriptor:Z

    .line 766
    :cond_0
    :goto_0
    const-string/jumbo v0, "session"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "entity"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 767
    :cond_1
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->ejbType:Ljava/lang/String;

    .line 769
    :cond_2
    return-void

    .line 762
    :cond_3
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->currentLoc:Ljava/lang/String;

    const-string/jumbo v1, "\\ias-ejb-jar"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 763
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/apache/tools/ant/taskdefs/optional/ejb/IPlanetEjbc$EjbcHandler;->iasDescriptor:Z

    goto :goto_0
.end method
