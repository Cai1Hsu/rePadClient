.class Lcom/mongodb/BSONWriterSettings;
.super Ljava/lang/Object;
.source "BSONWriterSettings.java"


# instance fields
.field private final maxSerializationDepth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    const/16 v0, 0x400

    invoke-direct {p0, v0}, Lcom/mongodb/BSONWriterSettings;-><init>(I)V

    .line 28
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0
    .param p1, "maxSerializationDepth"    # I

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput p1, p0, Lcom/mongodb/BSONWriterSettings;->maxSerializationDepth:I

    .line 24
    return-void
.end method


# virtual methods
.method public getMaxSerializationDepth()I
    .locals 1

    .prologue
    .line 31
    iget v0, p0, Lcom/mongodb/BSONWriterSettings;->maxSerializationDepth:I

    return v0
.end method
