.class public Lorg/apache/commons/compress/archivers/ArchiveStreamFactory;
.super Ljava/lang/Object;
.source "ArchiveStreamFactory.java"


# static fields
.field public static final AR:Ljava/lang/String; = "ar"

.field public static final CPIO:Ljava/lang/String; = "cpio"

.field public static final DUMP:Ljava/lang/String; = "dump"

.field public static final JAR:Ljava/lang/String; = "jar"

.field public static final TAR:Ljava/lang/String; = "tar"

.field public static final ZIP:Ljava/lang/String; = "zip"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createArchiveInputStream(Ljava/io/InputStream;)Lorg/apache/commons/compress/archivers/ArchiveInputStream;
    .locals 8
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/archivers/ArchiveException;
        }
    .end annotation

    .prologue
    const/16 v7, 0x200

    .line 199
    if-nez p1, :cond_0

    .line 200
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v7, "Stream must not be null."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 203
    :cond_0
    invoke-virtual {p1}, Ljava/io/InputStream;->markSupported()Z

    move-result v6

    if-nez v6, :cond_1

    .line 204
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v7, "Mark is not supported."

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 207
    :cond_1
    const/16 v6, 0xc

    new-array v2, v6, [B

    .line 208
    .local v2, "signature":[B
    array-length v6, v2

    invoke-virtual {p1, v6}, Ljava/io/InputStream;->mark(I)V

    .line 210
    :try_start_0
    invoke-virtual {p1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 211
    .local v3, "signatureLength":I
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V

    .line 212
    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;->matches([BI)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 213
    new-instance v6, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;

    invoke-direct {v6, p1}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    .line 244
    :goto_0
    return-object v6

    .line 214
    :cond_2
    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;->matches([BI)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 215
    new-instance v6, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;

    invoke-direct {v6, p1}, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 252
    .end local v3    # "signatureLength":I
    :catch_0
    move-exception v1

    .line 253
    .local v1, "e":Ljava/io/IOException;
    new-instance v6, Lorg/apache/commons/compress/archivers/ArchiveException;

    const-string/jumbo v7, "Could not use reset and mark operations."

    invoke-direct {v6, v7, v1}, Lorg/apache/commons/compress/archivers/ArchiveException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v6

    .line 216
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v3    # "signatureLength":I
    :cond_3
    :try_start_1
    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;->matches([BI)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 217
    new-instance v6, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;

    invoke-direct {v6, p1}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_0

    .line 218
    :cond_4
    invoke-static {v2, v3}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;->matches([BI)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 219
    new-instance v6, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;

    invoke-direct {v6, p1}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_0

    .line 223
    :cond_5
    const/16 v6, 0x20

    new-array v0, v6, [B

    .line 224
    .local v0, "dumpsig":[B
    array-length v6, v0

    invoke-virtual {p1, v6}, Ljava/io/InputStream;->mark(I)V

    .line 225
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 226
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V

    .line 227
    invoke-static {v0, v3}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;->matches([BI)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 228
    new-instance v6, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;

    invoke-direct {v6, p1}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_0

    .line 232
    :cond_6
    const/16 v6, 0x200

    new-array v5, v6, [B

    .line 233
    .local v5, "tarheader":[B
    array-length v6, v5

    invoke-virtual {p1, v6}, Ljava/io/InputStream;->mark(I)V

    .line 234
    invoke-virtual {p1, v5}, Ljava/io/InputStream;->read([B)I

    move-result v3

    .line 235
    invoke-virtual {p1}, Ljava/io/InputStream;->reset()V

    .line 236
    invoke-static {v5, v3}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->matches([BI)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 237
    new-instance v6, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    invoke-direct {v6, p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 240
    :cond_7
    if-lt v3, v7, :cond_8

    .line 242
    :try_start_2
    new-instance v4, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    new-instance v6, Ljava/io/ByteArrayInputStream;

    invoke-direct {v6, v5}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v4, v6}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    .line 243
    .local v4, "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    invoke-virtual {v4}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;->getNextEntry()Lorg/apache/commons/compress/archivers/ArchiveEntry;

    .line 244
    new-instance v6, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    invoke-direct {v6, p1}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 245
    .end local v4    # "tais":Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;
    :catch_1
    move-exception v6

    .line 256
    :cond_8
    new-instance v6, Lorg/apache/commons/compress/archivers/ArchiveException;

    const-string/jumbo v7, "No Archiver found for the stream signature"

    invoke-direct {v6, v7}, Lorg/apache/commons/compress/archivers/ArchiveException;-><init>(Ljava/lang/String;)V

    throw v6
.end method

.method public createArchiveInputStream(Ljava/lang/String;Ljava/io/InputStream;)Lorg/apache/commons/compress/archivers/ArchiveInputStream;
    .locals 3
    .param p1, "archiverName"    # Ljava/lang/String;
    .param p2, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/archivers/ArchiveException;
        }
    .end annotation

    .prologue
    .line 120
    if-nez p1, :cond_0

    .line 121
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Archivername must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 124
    :cond_0
    if-nez p2, :cond_1

    .line 125
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "InputStream must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 128
    :cond_1
    const-string/jumbo v0, "ar"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 129
    new-instance v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/ar/ArArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    .line 144
    :goto_0
    return-object v0

    .line 131
    :cond_2
    const-string/jumbo v0, "zip"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 132
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_0

    .line 134
    :cond_3
    const-string/jumbo v0, "tar"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 135
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_0

    .line 137
    :cond_4
    const-string/jumbo v0, "jar"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 138
    new-instance v0, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/jar/JarArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_0

    .line 140
    :cond_5
    const-string/jumbo v0, "cpio"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 141
    new-instance v0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_0

    .line 143
    :cond_6
    const-string/jumbo v0, "dump"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 144
    new-instance v0, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/dump/DumpArchiveInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_0

    .line 147
    :cond_7
    new-instance v0, Lorg/apache/commons/compress/archivers/ArchiveException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Archiver: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " not found."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/ArchiveException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createArchiveOutputStream(Ljava/lang/String;Ljava/io/OutputStream;)Lorg/apache/commons/compress/archivers/ArchiveOutputStream;
    .locals 3
    .param p1, "archiverName"    # Ljava/lang/String;
    .param p2, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/compress/archivers/ArchiveException;
        }
    .end annotation

    .prologue
    .line 162
    if-nez p1, :cond_0

    .line 163
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Archivername must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 165
    :cond_0
    if-nez p2, :cond_1

    .line 166
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "OutputStream must not be null."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 169
    :cond_1
    const-string/jumbo v0, "ar"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 170
    new-instance v0, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/ar/ArArchiveOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 182
    :goto_0
    return-object v0

    .line 172
    :cond_2
    const-string/jumbo v0, "zip"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 173
    new-instance v0, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/zip/ZipArchiveOutputStream;-><init>(Ljava/io/OutputStream;)V

    goto :goto_0

    .line 175
    :cond_3
    const-string/jumbo v0, "tar"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 176
    new-instance v0, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/tar/TarArchiveOutputStream;-><init>(Ljava/io/OutputStream;)V

    goto :goto_0

    .line 178
    :cond_4
    const-string/jumbo v0, "jar"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 179
    new-instance v0, Lorg/apache/commons/compress/archivers/jar/JarArchiveOutputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/jar/JarArchiveOutputStream;-><init>(Ljava/io/OutputStream;)V

    goto :goto_0

    .line 181
    :cond_5
    const-string/jumbo v0, "cpio"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 182
    new-instance v0, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveOutputStream;

    invoke-direct {v0, p2}, Lorg/apache/commons/compress/archivers/cpio/CpioArchiveOutputStream;-><init>(Ljava/io/OutputStream;)V

    goto :goto_0

    .line 184
    :cond_6
    new-instance v0, Lorg/apache/commons/compress/archivers/ArchiveException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Archiver: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " not found."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/compress/archivers/ArchiveException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
