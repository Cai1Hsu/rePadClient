.class public Lorg/apache/tools/ant/util/PropertyOutputStream;
.super Ljava/io/ByteArrayOutputStream;
.source "PropertyOutputStream.java"


# instance fields
.field private project:Lorg/apache/tools/ant/Project;

.field private property:Ljava/lang/String;

.field private trim:Z


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;)V
    .locals 1
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 42
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/apache/tools/ant/util/PropertyOutputStream;-><init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;Z)V

    .line 43
    return-void
.end method

.method public constructor <init>(Lorg/apache/tools/ant/Project;Ljava/lang/String;Z)V
    .locals 0
    .param p1, "p"    # Lorg/apache/tools/ant/Project;
    .param p2, "s"    # Ljava/lang/String;
    .param p3, "b"    # Z

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 53
    iput-object p1, p0, Lorg/apache/tools/ant/util/PropertyOutputStream;->project:Lorg/apache/tools/ant/Project;

    .line 54
    iput-object p2, p0, Lorg/apache/tools/ant/util/PropertyOutputStream;->property:Ljava/lang/String;

    .line 55
    iput-boolean p3, p0, Lorg/apache/tools/ant/util/PropertyOutputStream;->trim:Z

    .line 56
    return-void
.end method


# virtual methods
.method public close()V
    .locals 4

    .prologue
    .line 62
    iget-object v1, p0, Lorg/apache/tools/ant/util/PropertyOutputStream;->project:Lorg/apache/tools/ant/Project;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/tools/ant/util/PropertyOutputStream;->property:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 63
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/apache/tools/ant/util/PropertyOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    .line 64
    .local v0, "s":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/tools/ant/util/PropertyOutputStream;->project:Lorg/apache/tools/ant/Project;

    iget-object v2, p0, Lorg/apache/tools/ant/util/PropertyOutputStream;->property:Ljava/lang/String;

    iget-boolean v3, p0, Lorg/apache/tools/ant/util/PropertyOutputStream;->trim:Z

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .end local v0    # "s":Ljava/lang/String;
    :cond_0
    invoke-virtual {v1, v2, v0}, Lorg/apache/tools/ant/Project;->setNewProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    :cond_1
    return-void
.end method
