.class public Lorg/apache/tools/ant/filters/StripLineComments$Comment;
.super Ljava/lang/Object;
.source "StripLineComments.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/filters/StripLineComments;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Comment"
.end annotation


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 199
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public addText(Ljava/lang/String;)V
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 233
    invoke-virtual {p0, p1}, Lorg/apache/tools/ant/filters/StripLineComments$Comment;->setValue(Ljava/lang/String;)V

    .line 234
    return-void
.end method

.method public final getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lorg/apache/tools/ant/filters/StripLineComments$Comment;->value:Ljava/lang/String;

    return-object v0
.end method

.method public final setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "comment"    # Ljava/lang/String;

    .prologue
    .line 211
    iget-object v0, p0, Lorg/apache/tools/ant/filters/StripLineComments$Comment;->value:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 212
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Comment value already set."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 214
    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/filters/StripLineComments$Comment;->value:Ljava/lang/String;

    .line 215
    return-void
.end method
