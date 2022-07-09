.class Lorg/apache/tools/ant/filters/ExpandProperties$1;
.super Ljava/lang/Object;
.source "ExpandProperties.java"

# interfaces
.implements Lorg/apache/tools/ant/property/GetProperty;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/filters/ExpandProperties;

.field private final val$props:Ljava/util/Properties;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/filters/ExpandProperties;Ljava/util/Properties;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/filters/ExpandProperties;
    .param p2, "val$props"    # Ljava/util/Properties;

    .prologue
    .line 105
    iput-object p1, p0, Lorg/apache/tools/ant/filters/ExpandProperties$1;->this$0:Lorg/apache/tools/ant/filters/ExpandProperties;

    iput-object p2, p0, Lorg/apache/tools/ant/filters/ExpandProperties$1;->val$props:Ljava/util/Properties;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getProperty(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 106
    iget-object v0, p0, Lorg/apache/tools/ant/filters/ExpandProperties$1;->val$props:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
