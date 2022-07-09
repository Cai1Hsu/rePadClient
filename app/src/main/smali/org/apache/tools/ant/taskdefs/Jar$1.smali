.class Lorg/apache/tools/ant/taskdefs/Jar$1;
.super Ljava/lang/Object;
.source "Jar.java"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1096
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 2
    .param p1, "o1"    # Ljava/lang/Object;
    .param p2, "o2"    # Ljava/lang/Object;

    .prologue
    .line 1097
    instance-of v0, p1, Ljava/lang/String;

    if-eqz v0, :cond_0

    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1098
    check-cast p2, Ljava/lang/String;

    .end local p2    # "o2":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v0

    check-cast p1, Ljava/lang/String;

    .end local p1    # "o1":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v0, v1

    .line 1101
    :goto_0
    return v0

    .restart local p1    # "o1":Ljava/lang/Object;
    .restart local p2    # "o2":Ljava/lang/Object;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
