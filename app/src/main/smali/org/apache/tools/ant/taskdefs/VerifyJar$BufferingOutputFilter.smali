.class Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;
.super Ljava/lang/Object;
.source "VerifyJar.java"

# interfaces
.implements Lorg/apache/tools/ant/filters/ChainableReader;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/VerifyJar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BufferingOutputFilter"
.end annotation


# instance fields
.field private buffer:Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lorg/apache/tools/ant/taskdefs/VerifyJar$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/apache/tools/ant/taskdefs/VerifyJar$1;

    .prologue
    .line 156
    invoke-direct {p0}, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;-><init>()V

    return-void
.end method


# virtual methods
.method public chain(Ljava/io/Reader;)Ljava/io/Reader;
    .locals 1
    .param p1, "rdr"    # Ljava/io/Reader;

    .prologue
    .line 161
    new-instance v0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;

    invoke-direct {v0, p1}, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;-><init>(Ljava/io/Reader;)V

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;->buffer:Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;

    .line 162
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;->buffer:Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;

    return-object v0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;->buffer:Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;->buffer:Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;->clear()V

    .line 173
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilter;->buffer:Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;

    invoke-virtual {v0}, Lorg/apache/tools/ant/taskdefs/VerifyJar$BufferingOutputFilterReader;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
