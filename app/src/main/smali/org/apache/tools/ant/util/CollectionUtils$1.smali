.class Lorg/apache/tools/ant/util/CollectionUtils$1;
.super Ljava/lang/Object;
.source "CollectionUtils.java"

# interfaces
.implements Ljava/util/Enumeration;


# instance fields
.field private final val$iter:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Ljava/util/Iterator;)V
    .locals 0
    .param p1, "val$iter"    # Ljava/util/Iterator;

    .prologue
    .line 186
    iput-object p1, p0, Lorg/apache/tools/ant/util/CollectionUtils$1;->val$iter:Ljava/util/Iterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasMoreElements()Z
    .locals 1

    .prologue
    .line 184
    iget-object v0, p0, Lorg/apache/tools/ant/util/CollectionUtils$1;->val$iter:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 187
    iget-object v0, p0, Lorg/apache/tools/ant/util/CollectionUtils$1;->val$iter:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
