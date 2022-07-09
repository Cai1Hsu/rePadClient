.class Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$2;
.super Ljava/lang/Object;
.source "EchoProperties.java"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field private final this$1:Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;)V
    .locals 0
    .param p1, "this$1"    # Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;

    .prologue
    .line 398
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$2;->this$1:Lorg/apache/tools/ant/taskdefs/optional/EchoProperties$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 3
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 399
    check-cast p1, Ljava/util/Map$Entry;

    .end local p1    # "o1":Ljava/lang/Object;
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 400
    .local v0, "key1":Ljava/lang/String;
    check-cast p2, Ljava/util/Map$Entry;

    .end local p2    # "o2":Ljava/lang/Object;
    invoke-interface {p2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 401
    .local v1, "key2":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    return v2
.end method
