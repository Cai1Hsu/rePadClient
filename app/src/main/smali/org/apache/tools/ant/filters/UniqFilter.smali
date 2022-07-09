.class public Lorg/apache/tools/ant/filters/UniqFilter;
.super Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;
.source "UniqFilter.java"


# instance fields
.field private lastLine:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/apache/tools/ant/filters/TokenFilter$ChainableReaderFilter;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/tools/ant/filters/UniqFilter;->lastLine:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public filter(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 34
    iget-object v0, p0, Lorg/apache/tools/ant/filters/UniqFilter;->lastLine:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/tools/ant/filters/UniqFilter;->lastLine:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iput-object p1, p0, Lorg/apache/tools/ant/filters/UniqFilter;->lastLine:Ljava/lang/String;

    .end local p1    # "string":Ljava/lang/String;
    :goto_0
    return-object p1

    .restart local p1    # "string":Ljava/lang/String;
    :cond_1
    const/4 p1, 0x0

    goto :goto_0
.end method
