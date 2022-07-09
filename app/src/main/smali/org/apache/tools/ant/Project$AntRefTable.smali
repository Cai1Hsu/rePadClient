.class Lorg/apache/tools/ant/Project$AntRefTable;
.super Ljava/util/Hashtable;
.source "Project.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/Project;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AntRefTable"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 2403
    invoke-direct {p0}, Ljava/util/Hashtable;-><init>()V

    .line 2404
    return-void
.end method

.method static access$000(Lorg/apache/tools/ant/Project$AntRefTable;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lorg/apache/tools/ant/Project$AntRefTable;
    .param p1, "x1"    # Ljava/lang/Object;

    .prologue
    .line 2400
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/Project$AntRefTable;->getReal(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private getReal(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 2414
    invoke-super {p0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 2430
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/Project$AntRefTable;->getReal(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 2431
    .local v0, "o":Ljava/lang/Object;
    instance-of v2, v0, Lorg/apache/tools/ant/UnknownElement;

    if-eqz v2, :cond_0

    move-object v1, v0

    .line 2433
    check-cast v1, Lorg/apache/tools/ant/UnknownElement;

    .line 2434
    .local v1, "ue":Lorg/apache/tools/ant/UnknownElement;
    invoke-virtual {v1}, Lorg/apache/tools/ant/UnknownElement;->maybeConfigure()V

    .line 2435
    invoke-virtual {v1}, Lorg/apache/tools/ant/UnknownElement;->getRealThing()Ljava/lang/Object;

    move-result-object v0

    .line 2437
    .end local v1    # "ue":Lorg/apache/tools/ant/UnknownElement;
    :cond_0
    return-object v0
.end method
