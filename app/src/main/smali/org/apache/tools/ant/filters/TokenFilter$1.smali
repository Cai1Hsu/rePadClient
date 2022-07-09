.class Lorg/apache/tools/ant/filters/TokenFilter$1;
.super Lorg/apache/tools/ant/filters/BaseFilterReader;
.source "TokenFilter.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;Ljava/io/Reader;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;
    .param p2, "x0"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 648
    iput-object p1, p0, Lorg/apache/tools/ant/filters/TokenFilter$1;->this$0:Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;

    invoke-direct {p0, p2}, Lorg/apache/tools/ant/filters/BaseFilterReader;-><init>(Ljava/io/Reader;)V

    return-void
.end method


# virtual methods
.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 651
    :cond_0
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$1;->in:Ljava/io/Reader;

    invoke-virtual {v1}, Ljava/io/Reader;->read()I

    move-result v0

    .line 652
    .local v0, "c":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 656
    :goto_0
    return v0

    .line 655
    :cond_1
    iget-object v1, p0, Lorg/apache/tools/ant/filters/TokenFilter$1;->this$0:Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;

    int-to-char v2, v0

    invoke-static {v1, v2}, Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;->access$000(Lorg/apache/tools/ant/filters/TokenFilter$DeleteCharacters;C)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0
.end method
