.class Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;
.super Ljava/util/Properties;
.source "EchoProperties.java"


# static fields
.field private static final serialVersionUID:J = 0x46a6a3b8a9ee4ef6L


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;

.field private final val$keyList:Ljava/util/List;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;Ljava/util/List;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;
    .param p2, "val$keyList"    # Ljava/util/List;

    .prologue
    .line 394
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;->this$0:Lorg/apache/tools/ant/taskdefs/optional/EchoProperties;

    iput-object p2, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;->val$keyList:Ljava/util/List;

    invoke-direct {p0}, Ljava/util/Properties;-><init>()V

    return-void
.end method


# virtual methods
.method public entrySet()Ljava/util/Set;
    .locals 3

    .prologue
    .line 395
    invoke-super {p0}, Ljava/util/Properties;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 396
    .local v0, "result":Ljava/util/Set;
    invoke-static {}, Lorg/apache/tools/ant/util/JavaEnvUtils;->isKaffe()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 397
    new-instance v1, Ljava/util/TreeSet;

    new-instance v2, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$2;

    invoke-direct {v2, p0}, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$2;-><init>(Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;)V

    invoke-direct {v1, v2}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    .line 404
    .local v1, "t":Ljava/util/TreeSet;
    invoke-virtual {v1, v0}, Ljava/util/TreeSet;->addAll(Ljava/util/Collection;)Z

    .line 405
    move-object v0, v1

    .line 407
    .end local v1    # "t":Ljava/util/TreeSet;
    :cond_0
    return-object v0
.end method

.method public keys()Ljava/util/Enumeration;
    .locals 1

    .prologue
    .line 392
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;->val$keyList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/tools/ant/util/CollectionUtils;->asEnumeration(Ljava/util/Iterator;)Ljava/util/Enumeration;

    move-result-object v0

    return-object v0
.end method
