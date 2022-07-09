.class Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream$1;
.super Ljava/lang/Object;
.source "DumpArchiveInputStream.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;-><init>(Ljava/io/InputStream;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;


# direct methods
.method constructor <init>(Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;)V
    .locals 0

    .prologue
    .line 108
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream$1;->this$0:Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 108
    check-cast p1, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream$1;->compare(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;)I
    .locals 2
    .param p1, "p"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;
    .param p2, "q"    # Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;

    .prologue
    .line 110
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getOriginalName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getOriginalName()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 111
    :cond_0
    const v0, 0x7fffffff

    .line 114
    :goto_0
    return v0

    :cond_1
    invoke-virtual {p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getOriginalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveEntry;->getOriginalName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method
