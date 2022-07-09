.class Lorg/apache/tools/ant/util/SymbolicLinkUtils$1;
.super Ljava/lang/Object;
.source "SymbolicLinkUtils.java"

# interfaces
.implements Ljava/io/FilenameFilter;


# instance fields
.field private final this$0:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

.field private final val$localName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/tools/ant/util/SymbolicLinkUtils;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/util/SymbolicLinkUtils;
    .param p2, "val$localName"    # Ljava/lang/String;

    .prologue
    .line 178
    iput-object p1, p0, Lorg/apache/tools/ant/util/SymbolicLinkUtils$1;->this$0:Lorg/apache/tools/ant/util/SymbolicLinkUtils;

    iput-object p2, p0, Lorg/apache/tools/ant/util/SymbolicLinkUtils$1;->val$localName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 1
    .param p1, "d"    # Ljava/io/File;
    .param p2, "n"    # Ljava/lang/String;

    .prologue
    .line 179
    iget-object v0, p0, Lorg/apache/tools/ant/util/SymbolicLinkUtils$1;->val$localName:Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
