.class Lorg/bson/io/OutputBuffer$2;
.super Ljava/io/OutputStream;
.source "OutputBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/bson/io/OutputBuffer;->md5()Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/bson/io/OutputBuffer;

.field final synthetic val$md5:Ljava/security/MessageDigest;


# direct methods
.method constructor <init>(Lorg/bson/io/OutputBuffer;Ljava/security/MessageDigest;)V
    .locals 0

    .prologue
    .line 138
    iput-object p1, p0, Lorg/bson/io/OutputBuffer$2;->this$0:Lorg/bson/io/OutputBuffer;

    iput-object p2, p0, Lorg/bson/io/OutputBuffer$2;->val$md5:Ljava/security/MessageDigest;

    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    return-void
.end method


# virtual methods
.method public write(I)V
    .locals 2
    .param p1, "b"    # I

    .prologue
    .line 144
    iget-object v0, p0, Lorg/bson/io/OutputBuffer$2;->val$md5:Ljava/security/MessageDigest;

    and-int/lit16 v1, p1, 0xff

    int-to-byte v1, v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update(B)V

    .line 145
    return-void
.end method

.method public write([BII)V
    .locals 1
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I

    .prologue
    .line 140
    iget-object v0, p0, Lorg/bson/io/OutputBuffer$2;->val$md5:Ljava/security/MessageDigest;

    invoke-virtual {v0, p1, p2, p3}, Ljava/security/MessageDigest;->update([BII)V

    .line 141
    return-void
.end method
