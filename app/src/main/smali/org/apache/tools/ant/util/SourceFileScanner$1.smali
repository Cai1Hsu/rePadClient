.class Lorg/apache/tools/ant/util/SourceFileScanner$1;
.super Lorg/apache/tools/ant/types/resources/FileResource;
.source "SourceFileScanner.java"


# instance fields
.field private final this$0:Lorg/apache/tools/ant/util/SourceFileScanner;

.field private final val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/util/SourceFileScanner;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/util/SourceFileScanner;
    .param p2, "x0"    # Ljava/io/File;
    .param p3, "x1"    # Ljava/lang/String;
    .param p4, "val$name"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lorg/apache/tools/ant/util/SourceFileScanner$1;->this$0:Lorg/apache/tools/ant/util/SourceFileScanner;

    iput-object p4, p0, Lorg/apache/tools/ant/util/SourceFileScanner$1;->val$name:Ljava/lang/String;

    invoke-direct {p0, p2, p3}, Lorg/apache/tools/ant/types/resources/FileResource;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lorg/apache/tools/ant/util/SourceFileScanner$1;->val$name:Ljava/lang/String;

    return-object v0
.end method
