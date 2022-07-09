.class Lorg/apache/tools/ant/taskdefs/Zip$4;
.super Ljava/lang/Object;
.source "Zip.java"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/Zip;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/taskdefs/Zip;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/Zip;

    .prologue
    .line 1604
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/Zip$4;->this$0:Lorg/apache/tools/ant/taskdefs/Zip;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 4
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 1605
    move-object v0, p1

    check-cast v0, Lorg/apache/tools/ant/types/Resource;

    .local v0, "r1":Lorg/apache/tools/ant/types/Resource;
    move-object v1, p2

    .line 1606
    check-cast v1, Lorg/apache/tools/ant/types/Resource;

    .line 1607
    .local v1, "r2":Lorg/apache/tools/ant/types/Resource;
    invoke-virtual {v0}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lorg/apache/tools/ant/types/Resource;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    return v2
.end method
