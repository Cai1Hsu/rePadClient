.class public Lcom/mongodb/LazyWriteableDBDecoder;
.super Lcom/mongodb/LazyDBDecoder;
.source "LazyWriteableDBDecoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/LazyWriteableDBDecoder$LazyDBDecoderFactory;
    }
.end annotation


# static fields
.field public static FACTORY:Lcom/mongodb/DBDecoderFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    new-instance v0, Lcom/mongodb/LazyWriteableDBDecoder$LazyDBDecoderFactory;

    invoke-direct {v0}, Lcom/mongodb/LazyWriteableDBDecoder$LazyDBDecoderFactory;-><init>()V

    sput-object v0, Lcom/mongodb/LazyWriteableDBDecoder;->FACTORY:Lcom/mongodb/DBDecoderFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/mongodb/LazyDBDecoder;-><init>()V

    .line 24
    return-void
.end method


# virtual methods
.method public getDBCallback(Lcom/mongodb/DBCollection;)Lcom/mongodb/DBCallback;
    .locals 1
    .param p1, "collection"    # Lcom/mongodb/DBCollection;

    .prologue
    .line 34
    new-instance v0, Lcom/mongodb/LazyWriteableDBCallback;

    invoke-direct {v0, p1}, Lcom/mongodb/LazyWriteableDBCallback;-><init>(Lcom/mongodb/DBCollection;)V

    return-object v0
.end method
