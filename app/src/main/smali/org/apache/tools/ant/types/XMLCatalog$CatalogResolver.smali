.class interface abstract Lorg/apache/tools/ant/types/XMLCatalog$CatalogResolver;
.super Ljava/lang/Object;
.source "XMLCatalog.java"

# interfaces
.implements Ljavax/xml/transform/URIResolver;
.implements Lorg/xml/sax/EntityResolver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/types/XMLCatalog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x60a
    name = "CatalogResolver"
.end annotation


# virtual methods
.method public abstract resolve(Ljava/lang/String;Ljava/lang/String;)Ljavax/xml/transform/Source;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/transform/TransformerException;
        }
    .end annotation
.end method

.method public abstract resolveEntity(Ljava/lang/String;Ljava/lang/String;)Lorg/xml/sax/InputSource;
.end method
