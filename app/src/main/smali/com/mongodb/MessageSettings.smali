.class final Lcom/mongodb/MessageSettings;
.super Ljava/lang/Object;
.source "MessageSettings.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mongodb/MessageSettings$Builder;
    }
.end annotation

.annotation runtime Lorg/bson/util/annotations/Immutable;
.end annotation


# static fields
.field private static final DEFAULT_MAX_DOCUMENT_SIZE:I = 0x1000000

.field private static final DEFAULT_MAX_MESSAGE_SIZE:I = 0x2000000

.field private static final DEFAULT_MAX_WRITE_BATCH_SIZE:I = 0x3e8


# instance fields
.field private final maxDocumentSize:I

.field private final maxMessageSize:I

.field private final maxWriteBatchSize:I


# direct methods
.method constructor <init>(Lcom/mongodb/MessageSettings$Builder;)V
    .locals 1
    .param p1, "builder"    # Lcom/mongodb/MessageSettings$Builder;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    invoke-static {p1}, Lcom/mongodb/MessageSettings$Builder;->access$000(Lcom/mongodb/MessageSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MessageSettings;->maxDocumentSize:I

    .line 77
    invoke-static {p1}, Lcom/mongodb/MessageSettings$Builder;->access$100(Lcom/mongodb/MessageSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MessageSettings;->maxMessageSize:I

    .line 78
    invoke-static {p1}, Lcom/mongodb/MessageSettings$Builder;->access$200(Lcom/mongodb/MessageSettings$Builder;)I

    move-result v0

    iput v0, p0, Lcom/mongodb/MessageSettings;->maxWriteBatchSize:I

    .line 79
    return-void
.end method

.method public static builder()Lcom/mongodb/MessageSettings$Builder;
    .locals 1

    .prologue
    .line 32
    new-instance v0, Lcom/mongodb/MessageSettings$Builder;

    invoke-direct {v0}, Lcom/mongodb/MessageSettings$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method public getMaxDocumentSize()I
    .locals 1

    .prologue
    .line 64
    iget v0, p0, Lcom/mongodb/MessageSettings;->maxDocumentSize:I

    return v0
.end method

.method public getMaxMessageSize()I
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lcom/mongodb/MessageSettings;->maxMessageSize:I

    return v0
.end method

.method public getMaxWriteBatchSize()I
    .locals 1

    .prologue
    .line 72
    iget v0, p0, Lcom/mongodb/MessageSettings;->maxWriteBatchSize:I

    return v0
.end method
