.class public Lorg/jivesoftware/smackx/packet/HeadersExtension;
.super Ljava/lang/Object;
.source "HeadersExtension.java"

# interfaces
.implements Lorg/jivesoftware/smack/packet/PacketExtension;


# static fields
.field public static final NAMESPACE:Ljava/lang/String; = "http://jabber.org/protocol/shim"


# instance fields
.field private headers:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/packet/Header;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/packet/Header;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 36
    .local p1, "headerList":Ljava/util/Collection;, "Ljava/util/Collection<Lorg/jivesoftware/smackx/packet/Header;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lorg/jivesoftware/smackx/packet/HeadersExtension;->headers:Ljava/util/Collection;

    .line 37
    if-eqz p1, :cond_0

    .line 38
    iput-object p1, p0, Lorg/jivesoftware/smackx/packet/HeadersExtension;->headers:Ljava/util/Collection;

    .line 39
    :cond_0
    return-void
.end method


# virtual methods
.method public getElementName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 48
    const-string/jumbo v0, "headers"

    return-object v0
.end method

.method public getHeaders()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lorg/jivesoftware/smackx/packet/Header;",
            ">;"
        }
    .end annotation

    .prologue
    .line 43
    iget-object v0, p0, Lorg/jivesoftware/smackx/packet/HeadersExtension;->headers:Ljava/util/Collection;

    return-object v0
.end method

.method public getNamespace()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    const-string/jumbo v0, "http://jabber.org/protocol/shim"

    return-object v0
.end method

.method public toXML()Ljava/lang/String;
    .locals 5

    .prologue
    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "<"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/HeadersExtension;->getElementName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " xmlns=\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/HeadersExtension;->getNamespace()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "\'>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lorg/jivesoftware/smackx/packet/HeadersExtension;->headers:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jivesoftware/smackx/packet/Header;

    .line 62
    .local v1, "header":Lorg/jivesoftware/smackx/packet/Header;
    invoke-virtual {v1}, Lorg/jivesoftware/smackx/packet/Header;->toXML()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 64
    .end local v1    # "header":Lorg/jivesoftware/smackx/packet/Header;
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "</"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lorg/jivesoftware/smackx/packet/HeadersExtension;->getElementName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x3e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method
