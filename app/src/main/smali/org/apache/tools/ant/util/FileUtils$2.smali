.class Lorg/apache/tools/ant/util/FileUtils$2;
.super Ljava/io/InputStream;
.source "FileUtils.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/util/FileUtils;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/util/FileUtils;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/util/FileUtils;

    .prologue
    .line 1711
    iput-object p1, p0, Lorg/apache/tools/ant/util/FileUtils$2;->this$0:Lorg/apache/tools/ant/util/FileUtils;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public read()I
    .locals 1

    .prologue
    .line 1712
    const/4 v0, -0x1

    return v0
.end method
