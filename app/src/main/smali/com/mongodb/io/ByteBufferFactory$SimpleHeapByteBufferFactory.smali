.class public Lcom/mongodb/io/ByteBufferFactory$SimpleHeapByteBufferFactory;
.super Ljava/lang/Object;
.source "ByteBufferFactory.java"

# interfaces
.implements Lcom/mongodb/io/ByteBufferFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mongodb/io/ByteBufferFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimpleHeapByteBufferFactory"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field final _size:I


# direct methods
.method public constructor <init>(I)V
    .locals 0
    .param p1, "size"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput p1, p0, Lcom/mongodb/io/ByteBufferFactory$SimpleHeapByteBufferFactory;->_size:I

    .line 37
    return-void
.end method


# virtual methods
.method public get()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 40
    iget v0, p0, Lcom/mongodb/io/ByteBufferFactory$SimpleHeapByteBufferFactory;->_size:I

    new-array v0, v0, [B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method
