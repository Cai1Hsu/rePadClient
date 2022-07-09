.class Lorg/bson/LazyBSONObject$ElementRecord;
.super Ljava/lang/Object;
.source "LazyBSONObject.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/bson/LazyBSONObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ElementRecord"
.end annotation


# instance fields
.field final fieldNameSize:I

.field final name:Ljava/lang/String;

.field final offset:I

.field final synthetic this$0:Lorg/bson/LazyBSONObject;

.field final type:B

.field final valueOffset:I


# direct methods
.method constructor <init>(Lorg/bson/LazyBSONObject;Ljava/lang/String;I)V
    .locals 1
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "offset"    # I

    .prologue
    .line 70
    iput-object p1, p0, Lorg/bson/LazyBSONObject$ElementRecord;->this$0:Lorg/bson/LazyBSONObject;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    iput-object p2, p0, Lorg/bson/LazyBSONObject$ElementRecord;->name:Ljava/lang/String;

    .line 72
    iput p3, p0, Lorg/bson/LazyBSONObject$ElementRecord;->offset:I

    .line 73
    add-int/lit8 v0, p3, -0x1

    invoke-virtual {p1, v0}, Lorg/bson/LazyBSONObject;->getElementType(I)B

    move-result v0

    iput-byte v0, p0, Lorg/bson/LazyBSONObject$ElementRecord;->type:B

    .line 74
    invoke-virtual {p1, p3}, Lorg/bson/LazyBSONObject;->sizeCString(I)I

    move-result v0

    iput v0, p0, Lorg/bson/LazyBSONObject$ElementRecord;->fieldNameSize:I

    .line 75
    iget v0, p0, Lorg/bson/LazyBSONObject$ElementRecord;->fieldNameSize:I

    add-int/2addr v0, p3

    iput v0, p0, Lorg/bson/LazyBSONObject$ElementRecord;->valueOffset:I

    .line 76
    return-void
.end method
