.class public Lorg/apache/tools/ant/util/FileTokenizer;
.super Lorg/apache/tools/ant/ProjectComponent;
.source "FileTokenizer.java"

# interfaces
.implements Lorg/apache/tools/ant/util/Tokenizer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lorg/apache/tools/ant/ProjectComponent;-><init>()V

    return-void
.end method


# virtual methods
.method public getPostToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 45
    const-string/jumbo v0, ""

    return-object v0
.end method

.method public getToken(Ljava/io/Reader;)Ljava/lang/String;
    .locals 1
    .param p1, "in"    # Ljava/io/Reader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 37
    invoke-static {p1}, Lorg/apache/tools/ant/util/FileUtils;->readFully(Ljava/io/Reader;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
