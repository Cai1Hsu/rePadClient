.class Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
.super Ljava/lang/Object;
.source "Cache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/util/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LinkedListNode"
.end annotation


# instance fields
.field public next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

.field public object:Ljava/lang/Object;

.field public previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

.field public timestamp:J


# direct methods
.method public constructor <init>(Ljava/lang/Object;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;Lorg/jivesoftware/smack/util/Cache$LinkedListNode;)V
    .locals 0
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "next"    # Lorg/jivesoftware/smack/util/Cache$LinkedListNode;
    .param p3, "previous"    # Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .prologue
    .line 654
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 655
    iput-object p1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->object:Ljava/lang/Object;

    .line 656
    iput-object p2, p0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 657
    iput-object p3, p0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 658
    return-void
.end method


# virtual methods
.method public remove()V
    .locals 2

    .prologue
    .line 664
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 665
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->next:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iget-object v1, p0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    iput-object v1, v0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->previous:Lorg/jivesoftware/smack/util/Cache$LinkedListNode;

    .line 666
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 675
    iget-object v0, p0, Lorg/jivesoftware/smack/util/Cache$LinkedListNode;->object:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
