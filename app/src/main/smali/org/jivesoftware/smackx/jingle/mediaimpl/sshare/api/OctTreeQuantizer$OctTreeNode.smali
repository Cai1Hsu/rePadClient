.class Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;
.super Ljava/lang/Object;
.source "OctTreeQuantizer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "OctTreeNode"
.end annotation


# instance fields
.field children:I

.field count:I

.field index:I

.field isLeaf:Z

.field leaf:[Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

.field level:I

.field parent:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

.field final synthetic this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;

.field totalBlue:I

.field totalGreen:I

.field totalRed:I


# direct methods
.method constructor <init>(Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;)V
    .locals 1

    .prologue
    .line 41
    iput-object p1, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->this$0:Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const/16 v0, 0x8

    new-array v0, v0, [Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    iput-object v0, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->leaf:[Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    return-void
.end method


# virtual methods
.method public list(Ljava/io/PrintStream;I)V
    .locals 6
    .param p1, "s"    # Ljava/io/PrintStream;
    .param p2, "level"    # I

    .prologue
    .line 57
    const-string/jumbo v1, ""

    .line 58
    .local v1, "indentStr":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p2, :cond_0

    .line 59
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 58
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 60
    :cond_0
    iget v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    if-nez v2, :cond_2

    .line 61
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->access$000()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->index:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ": count="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    .line 64
    :goto_1
    const/4 v0, 0x0

    :goto_2
    const/16 v2, 0x8

    if-ge v0, v2, :cond_3

    .line 65
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->leaf:[Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    aget-object v2, v2, v0

    if-eqz v2, :cond_1

    .line 66
    iget-object v2, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->leaf:[Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;

    aget-object v2, v2, v0

    add-int/lit8 v3, p2, 0x2

    invoke-virtual {v2, p1, v3}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->list(Ljava/io/PrintStream;I)V

    .line 64
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 63
    :cond_2
    invoke-static {}, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer;->access$000()Lorg/jivesoftware/smackx/jingle/SmackLogger;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->index:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ": count="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " red="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalRed:I

    iget v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    div-int/2addr v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " green="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalGreen:I

    iget v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    div-int/2addr v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " blue="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->totalBlue:I

    iget v5, p0, Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/OctTreeQuantizer$OctTreeNode;->count:I

    div-int/2addr v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/jivesoftware/smackx/jingle/SmackLogger;->debug(Ljava/lang/String;)V

    goto :goto_1

    .line 67
    :cond_3
    return-void
.end method
