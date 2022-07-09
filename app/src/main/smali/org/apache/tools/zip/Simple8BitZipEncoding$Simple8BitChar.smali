.class final Lorg/apache/tools/zip/Simple8BitZipEncoding$Simple8BitChar;
.super Ljava/lang/Object;
.source "Simple8BitZipEncoding.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/zip/Simple8BitZipEncoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Simple8BitChar"
.end annotation


# instance fields
.field public final code:B

.field public final unicode:C


# direct methods
.method constructor <init>(BC)V
    .locals 0
    .param p1, "code"    # B
    .param p2, "unicode"    # C

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-byte p1, p0, Lorg/apache/tools/zip/Simple8BitZipEncoding$Simple8BitChar;->code:B

    .line 58
    iput-char p2, p0, Lorg/apache/tools/zip/Simple8BitZipEncoding$Simple8BitChar;->unicode:C

    .line 59
    return-void
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 62
    move-object v0, p1

    check-cast v0, Lorg/apache/tools/zip/Simple8BitZipEncoding$Simple8BitChar;

    .line 64
    .local v0, "a":Lorg/apache/tools/zip/Simple8BitZipEncoding$Simple8BitChar;
    iget-char v1, p0, Lorg/apache/tools/zip/Simple8BitZipEncoding$Simple8BitChar;->unicode:C

    iget-char v2, v0, Lorg/apache/tools/zip/Simple8BitZipEncoding$Simple8BitChar;->unicode:C

    sub-int/2addr v1, v2

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 68
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string/jumbo v1, "0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const v1, 0xffff

    iget-char v2, p0, Lorg/apache/tools/zip/Simple8BitZipEncoding$Simple8BitChar;->unicode:C

    and-int/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string/jumbo v1, "->0x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    iget-byte v1, p0, Lorg/apache/tools/zip/Simple8BitZipEncoding$Simple8BitChar;->code:B

    and-int/lit16 v1, v1, 0xff

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
