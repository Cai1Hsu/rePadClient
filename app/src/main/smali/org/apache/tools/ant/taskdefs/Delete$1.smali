.class Lorg/apache/tools/ant/taskdefs/Delete$1;
.super Ljava/lang/Object;
.source "Delete.java"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "foo"    # Ljava/lang/Object;
    .param p2, "bar"    # Ljava/lang/Object;

    .prologue
    .line 86
    check-cast p1, Ljava/lang/Comparable;

    .end local p1    # "foo":Ljava/lang/Object;
    invoke-interface {p1, p2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    mul-int/lit8 v0, v0, -0x1

    return v0
.end method
