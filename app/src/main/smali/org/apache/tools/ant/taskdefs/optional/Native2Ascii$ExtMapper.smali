.class Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii$ExtMapper;
.super Ljava/lang/Object;
.source "Native2Ascii.java"

# interfaces
.implements Lorg/apache/tools/ant/util/FileNameMapper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExtMapper"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;


# direct methods
.method private constructor <init>(Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;

    .prologue
    .line 309
    iput-object p1, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii$ExtMapper;->this$0:Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;
    .param p2, "x1"    # Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii$1;

    .prologue
    .line 309
    invoke-direct {p0, p1}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii$ExtMapper;-><init>(Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;)V

    return-void
.end method


# virtual methods
.method public mapFileName(Ljava/lang/String;)[Ljava/lang/String;
    .locals 5
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    const/4 v4, 0x0

    .line 317
    const/16 v1, 0x2e

    invoke-virtual {p1, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 318
    .local v0, "lastDot":I
    if-ltz v0, :cond_0

    .line 319
    new-array v1, v2, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p1, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii$ExtMapper;->this$0:Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->access$100(Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    .line 322
    :goto_0
    return-object v1

    :cond_0
    new-array v1, v2, [Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii$ExtMapper;->this$0:Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;

    invoke-static {v3}, Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;->access$100(Lorg/apache/tools/ant/taskdefs/optional/Native2Ascii;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    goto :goto_0
.end method

.method public setFrom(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 312
    return-void
.end method

.method public setTo(Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 314
    return-void
.end method
