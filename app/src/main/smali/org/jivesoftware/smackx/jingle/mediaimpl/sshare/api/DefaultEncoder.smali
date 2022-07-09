.class public Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/DefaultEncoder;
.super Ljava/lang/Object;
.source "DefaultEncoder.java"

# interfaces
.implements Lorg/jivesoftware/smackx/jingle/mediaimpl/sshare/api/ImageEncoder;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public encode(Ljava/awt/image/BufferedImage;)Ljava/io/ByteArrayOutputStream;
    .locals 3
    .param p1, "bufferedImage"    # Ljava/awt/image/BufferedImage;

    .prologue
    .line 31
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 33
    .local v0, "baos":Ljava/io/ByteArrayOutputStream;
    :try_start_0
    const-string/jumbo v2, "png"

    invoke-static {p1, v2, v0}, Ljavax/imageio/ImageIO;->write(Ljava/awt/image/RenderedImage;Ljava/lang/String;Ljava/io/OutputStream;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :goto_0
    return-object v0

    .line 35
    :catch_0
    move-exception v1

    .line 36
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 37
    const/4 v0, 0x0

    goto :goto_0
.end method
