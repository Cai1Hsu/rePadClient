.class Lorg/apache/commons/compress/archivers/zip/ZipFile$2;
.super Ljava/lang/Object;
.source "ZipFile.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/compress/archivers/zip/ZipFile;
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
        "Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/commons/compress/archivers/zip/ZipFile;


# direct methods
.method constructor <init>(Lorg/apache/commons/compress/archivers/zip/ZipFile;)V
    .locals 0

    .prologue
    .line 954
    iput-object p1, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$2;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipFile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 954
    check-cast p1, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lorg/apache/commons/compress/archivers/zip/ZipFile$2;->compare(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)I

    move-result v0

    return v0
.end method

.method public compare(Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;)I
    .locals 8
    .param p1, "e1"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;
    .param p2, "e2"    # Lorg/apache/commons/compress/archivers/zip/ZipArchiveEntry;

    .prologue
    .line 956
    if-ne p1, p2, :cond_0

    .line 957
    const/4 v4, 0x0

    .line 969
    :goto_0
    return v4

    .line 960
    :cond_0
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$2;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipFile;

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->access$700(Lorg/apache/commons/compress/archivers/zip/ZipFile;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;

    .line 961
    .local v0, "off1":Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;
    iget-object v4, p0, Lorg/apache/commons/compress/archivers/zip/ZipFile$2;->this$0:Lorg/apache/commons/compress/archivers/zip/ZipFile;

    invoke-static {v4}, Lorg/apache/commons/compress/archivers/zip/ZipFile;->access$700(Lorg/apache/commons/compress/archivers/zip/ZipFile;)Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;

    .line 962
    .local v1, "off2":Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;
    if-nez v0, :cond_1

    .line 963
    const/4 v4, 0x1

    goto :goto_0

    .line 965
    :cond_1
    if-nez v1, :cond_2

    .line 966
    const/4 v4, -0x1

    goto :goto_0

    .line 968
    :cond_2
    invoke-static {v0}, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;)J

    move-result-wide v4

    invoke-static {v1}, Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;->access$200(Lorg/apache/commons/compress/archivers/zip/ZipFile$OffsetEntry;)J

    move-result-wide v6

    sub-long v2, v4, v6

    .line 969
    .local v2, "val":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-nez v4, :cond_3

    const/4 v4, 0x0

    goto :goto_0

    :cond_3
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-gez v4, :cond_4

    const/4 v4, -0x1

    goto :goto_0

    :cond_4
    const/4 v4, 0x1

    goto :goto_0
.end method
