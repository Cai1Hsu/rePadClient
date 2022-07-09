.class public Lorg/apache/tools/zip/UnicodePathExtraField;
.super Lorg/apache/tools/zip/AbstractUnicodeExtraField;
.source "UnicodePathExtraField.java"


# static fields
.field public static final UPATH_ID:Lorg/apache/tools/zip/ZipShort;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 39
    new-instance v0, Lorg/apache/tools/zip/ZipShort;

    const/16 v1, 0x7075

    invoke-direct {v0, v1}, Lorg/apache/tools/zip/ZipShort;-><init>(I)V

    sput-object v0, Lorg/apache/tools/zip/UnicodePathExtraField;->UPATH_ID:Lorg/apache/tools/zip/ZipShort;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Lorg/apache/tools/zip/AbstractUnicodeExtraField;-><init>()V

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "bytes"    # [B

    .prologue
    .line 66
    invoke-direct {p0, p1, p2}, Lorg/apache/tools/zip/AbstractUnicodeExtraField;-><init>(Ljava/lang/String;[B)V

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[BII)V
    .locals 0
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "bytes"    # [B
    .param p3, "off"    # I
    .param p4, "len"    # I

    .prologue
    .line 55
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/apache/tools/zip/AbstractUnicodeExtraField;-><init>(Ljava/lang/String;[BII)V

    .line 56
    return-void
.end method


# virtual methods
.method public getHeaderId()Lorg/apache/tools/zip/ZipShort;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lorg/apache/tools/zip/UnicodePathExtraField;->UPATH_ID:Lorg/apache/tools/zip/ZipShort;

    return-object v0
.end method
