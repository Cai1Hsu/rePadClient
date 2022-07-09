.class Lorg/bson/io/OutputBuffer$1;
.super Ljava/io/OutputStream;
.source "OutputBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/bson/io/OutputBuffer;->hex()Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/bson/io/OutputBuffer;

.field final synthetic val$buf:Ljava/lang/StringBuilder;


# direct methods
.method constructor <init>(Lorg/bson/io/OutputBuffer;Ljava/lang/StringBuilder;)V
    .locals 0

    .prologue
    .line 105
    iput-object p1, p0, Lorg/bson/io/OutputBuffer$1;->this$0:Lorg/bson/io/OutputBuffer;

    iput-object p2, p0, Lorg/bson/io/OutputBuffer$1;->val$buf:Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 3
    .param p1, "b"    # I

    .prologue
    .line 107
    and-int/lit16 v1, p1, 0xff

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, "s":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    .line 110
    iget-object v1, p0, Lorg/bson/io/OutputBuffer$1;->val$buf:Ljava/lang/StringBuilder;

    const-string/jumbo v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    :cond_0
    iget-object v1, p0, Lorg/bson/io/OutputBuffer$1;->val$buf:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    return-void
.end method
