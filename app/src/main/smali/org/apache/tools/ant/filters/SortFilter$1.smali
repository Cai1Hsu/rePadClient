.class Lorg/apache/tools/ant/filters/SortFilter$1;
.super Ljava/lang/Object;
.source "SortFilter.java"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/filters/SortFilter;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/filters/SortFilter;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/filters/SortFilter;

    .prologue
    .line 362
    iput-object p1, p0, Lorg/apache/tools/ant/filters/SortFilter$1;->this$0:Lorg/apache/tools/ant/filters/SortFilter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 3
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 363
    move-object v0, p1

    check-cast v0, Ljava/lang/String;

    .local v0, "s1":Ljava/lang/String;
    move-object v1, p2

    .line 364
    check-cast v1, Ljava/lang/String;

    .line 365
    .local v1, "s2":Ljava/lang/String;
    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    neg-int v2, v2

    return v2
.end method
