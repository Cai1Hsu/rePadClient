.class Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;
.super Ljava/lang/Object;
.source "XMLCatalog.java"

# interfaces
.implements Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/XMLCatalog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InternalResolver"
.end annotation


# instance fields
.field private final this$0:Lorg/apache/tools/ant/types/XMLCatalog;


# direct methods
.method public constructor <init>(Lorg/apache/tools/ant/types/XMLCatalog;)V
    .locals 2
    .param p1, "this$0"    # Lorg/apache/tools/ant/types/XMLCatalog;

    .prologue
    .line 815
    iput-object p1, p0, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 816
    const-string/jumbo v0, "Apache resolver library not found, internal resolver will be used"

    const/4 v1, 0x3

    invoke-virtual {p1, v0, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 818
    return-void
.end method


# virtual methods
.method public resolve(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/transform/Source;
    .locals 9
    .param p1, "href"    # Ljava/lang/String;
    .param p2, "base"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation

    .prologue
    .line 848
    const/4 v4, 0x0

    .line 849
    .local v4, "result":Ljavax/xml/transform/sax/SAXSource;
    const/4 v5, 0x0

    .line 851
    .local v5, "source":Lorg/xml/sax/InputSource;
    iget-object v6, p0, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v6, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->access$000(Lorg/apache/tools/ant/types/XMLCatalog;Ljava/lang/String;)Lorg/apache/tools/ant/types/ResourceLocation;

    move-result-object v3

    .line 853
    .local v3, "matchingEntry":Lorg/apache/tools/ant/types/ResourceLocation;
    if-eqz v3, :cond_3

    .line 855
    iget-object v6, p0, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v8, "Matching catalog entry found for uri: \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/ResourceLocation;->getPublicId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "\' location: \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v3}, Lorg/apache/tools/ant/types/ResourceLocation;->getLocation()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    const-string/jumbo v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x4

    invoke-virtual {v6, v7, v8}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 870
    move-object v1, v3

    .line 871
    .local v1, "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    if-eqz p2, :cond_0

    .line 873
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 874
    .local v0, "baseURL":Ljava/net/URL;
    new-instance v2, Lorg/apache/tools/ant/types/ResourceLocation;

    invoke-direct {v2}, Lorg/apache/tools/ant/types/ResourceLocation;-><init>()V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 875
    .end local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    .local v2, "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    :try_start_1
    invoke-virtual {v2, v0}, Lorg/apache/tools/ant/types/ResourceLocation;->setBase(Ljava/net/URL;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v1, v2

    .line 880
    .end local v0    # "baseURL":Ljava/net/URL;
    .end local v2    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    .restart local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    :cond_0
    :goto_0
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/ResourceLocation;->getPublicId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/apache/tools/ant/types/ResourceLocation;->setPublicId(Ljava/lang/String;)V

    .line 881
    invoke-virtual {v3}, Lorg/apache/tools/ant/types/ResourceLocation;->getLocation()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Lorg/apache/tools/ant/types/ResourceLocation;->setLocation(Ljava/lang/String;)V

    .line 883
    iget-object v6, p0, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v6, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->access$100(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v5

    .line 885
    if-nez v5, :cond_1

    .line 886
    iget-object v6, p0, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v6, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->access$200(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v5

    .line 889
    :cond_1
    if-nez v5, :cond_2

    .line 890
    iget-object v6, p0, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v6, v1}, Lorg/apache/tools/ant/types/XMLCatalog;->access$300(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v5

    .line 893
    :cond_2
    if-eqz v5, :cond_3

    .line 894
    new-instance v4, Ljavax/xml/transform/sax/SAXSource;

    .end local v4    # "result":Ljavax/xml/transform/sax/SAXSource;
    invoke-direct {v4, v5}, Ljavax/xml/transform/sax/SAXSource;-><init>(Lorg/xml/sax/InputSource;)V

    .line 897
    .end local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    .restart local v4    # "result":Ljavax/xml/transform/sax/SAXSource;
    :cond_3
    return-object v4

    .line 876
    .restart local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    :catch_0
    move-exception v6

    goto :goto_0

    .end local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    .restart local v0    # "baseURL":Ljava/net/URL;
    .restart local v2    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    :catch_1
    move-exception v6

    move-object v1, v2

    .end local v2    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    .restart local v1    # "entryCopy":Lorg/apache/tools/ant/types/ResourceLocation;
    goto :goto_0
.end method

.method public resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
    .locals 5
    .param p1, "publicId"    # Ljava/lang/String;
    .param p2, "systemId"    # Ljava/lang/String;

    .prologue
    .line 822
    const/4 v1, 0x0

    .line 823
    .local v1, "result":Lorg/xml/sax/InputSource;
    iget-object v2, p0, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v2, p1}, Lorg/apache/tools/ant/types/XMLCatalog;->access$000(Lorg/apache/tools/ant/types/XMLCatalog;Ljava/lang/String;)Lorg/apache/tools/ant/types/ResourceLocation;

    move-result-object v0

    .line 825
    .local v0, "matchingEntry":Lorg/apache/tools/ant/types/ResourceLocation;
    if-eqz v0, :cond_1

    .line 827
    iget-object v2, p0, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v4, "Matching catalog entry found for publicId: \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/ResourceLocation;->getPublicId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\' location: \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v0}, Lorg/apache/tools/ant/types/ResourceLocation;->getLocation()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string/jumbo v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-virtual {v2, v3, v4}, Lorg/apache/tools/ant/types/XMLCatalog;->log(Ljava/lang/String;I)V

    .line 832
    iget-object v2, p0, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v2, v0}, Lorg/apache/tools/ant/types/XMLCatalog;->access$100(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v1

    .line 834
    if-nez v1, :cond_0

    .line 835
    iget-object v2, p0, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v2, v0}, Lorg/apache/tools/ant/types/XMLCatalog;->access$200(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v1

    .line 838
    :cond_0
    if-nez v1, :cond_1

    .line 839
    iget-object v2, p0, Lorg/apache/tools/ant/types/XMLCatalog$InternalResolver;->this$0:Lorg/apache/tools/ant/types/XMLCatalog;

    invoke-static {v2, v0}, Lorg/apache/tools/ant/types/XMLCatalog;->access$300(Lorg/apache/tools/ant/types/XMLCatalog;Lorg/apache/tools/ant/types/ResourceLocation;)Lorg/xml/sax/InputSource;

    move-result-object v1

    .line 842
    :cond_1
    return-object v1
.end method
