.class Lcom/mongodb/BSONBinaryWriterSettings;
.super Ljava/lang/Object;
.source "BSONBinaryWriterSettings.java"


# instance fields
.field private final maxDocumentSize:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    const/high16 v0, 0x1000000

    invoke-direct {p0, v0}, Lcom/mongodb/BSONBinaryWriterSettings;-><init>(I)V

    .line 28
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "maxDocumentSize"    # I

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput p1, p0, Lcom/mongodb/BSONBinaryWriterSettings;->maxDocumentSize:I

    .line 24
    return-void
.end method


# virtual methods
.method public getMaxDocumentSize()I
    .locals 1

    .prologue
    .line 31
    iget v0, p0, Lcom/mongodb/BSONBinaryWriterSettings;->maxDocumentSize:I

    return v0
.end method
