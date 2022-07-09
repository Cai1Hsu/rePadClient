.class final Lcom/mongodb/MessageSettings$Builder;
.super Ljava/lang/Object;
.source "MessageSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/MessageSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Builder"
.end annotation


# instance fields
.field private maxDocumentSize:I

.field private maxMessageSize:I

.field private maxWriteBatchSize:I


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const/high16 v0, 0x1000000

    iput v0, p0, Lcom/mongodb/MessageSettings$Builder;->maxDocumentSize:I

    .line 37
    const/high16 v0, 0x2000000

    iput v0, p0, Lcom/mongodb/MessageSettings$Builder;->maxMessageSize:I

    .line 38
    const/16 v0, 0x3e8

    iput v0, p0, Lcom/mongodb/MessageSettings$Builder;->maxWriteBatchSize:I

    return-void
.end method

.method static synthetic access$000(Lcom/mongodb/MessageSettings$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MessageSettings$Builder;

    .prologue
    .line 35
    iget v0, p0, Lcom/mongodb/MessageSettings$Builder;->maxDocumentSize:I

    return v0
.end method

.method static synthetic access$100(Lcom/mongodb/MessageSettings$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MessageSettings$Builder;

    .prologue
    .line 35
    iget v0, p0, Lcom/mongodb/MessageSettings$Builder;->maxMessageSize:I

    return v0
.end method

.method static synthetic access$200(Lcom/mongodb/MessageSettings$Builder;)I
    .locals 1
    .param p0, "x0"    # Lcom/mongodb/MessageSettings$Builder;

    .prologue
    .line 35
    iget v0, p0, Lcom/mongodb/MessageSettings$Builder;->maxWriteBatchSize:I

    return v0
.end method


# virtual methods
.method public build()Lcom/mongodb/MessageSettings;
    .locals 1

    .prologue
    .line 41
    new-instance v0, Lcom/mongodb/MessageSettings;

    invoke-direct {v0, p0}, Lcom/mongodb/MessageSettings;-><init>(Lcom/mongodb/MessageSettings$Builder;)V

    return-object v0
.end method

.method public maxDocumentSize(I)Lcom/mongodb/MessageSettings$Builder;
    .locals 0
    .param p1, "maxDocumentSize"    # I

    .prologue
    .line 46
    iput p1, p0, Lcom/mongodb/MessageSettings$Builder;->maxDocumentSize:I

    .line 47
    return-object p0
.end method

.method public maxMessageSize(I)Lcom/mongodb/MessageSettings$Builder;
    .locals 0
    .param p1, "maxMessageSize"    # I

    .prologue
    .line 51
    iput p1, p0, Lcom/mongodb/MessageSettings$Builder;->maxMessageSize:I

    .line 52
    return-object p0
.end method

.method public maxWriteBatchSize(I)Lcom/mongodb/MessageSettings$Builder;
    .locals 0
    .param p1, "maxWriteBatchSize"    # I

    .prologue
    .line 56
    iput p1, p0, Lcom/mongodb/MessageSettings$Builder;->maxWriteBatchSize:I

    .line 57
    return-object p0
.end method
