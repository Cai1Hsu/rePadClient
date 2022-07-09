.class public Lorg/apache/tools/ant/util/UnicodeUtil;
.super Ljava/lang/Object;
.source "UnicodeUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static EscapeUnicode(C)Ljava/lang/StringBuffer;
    .locals 5
    .param p0, "ch"    # C

    .prologue
    .line 32
    new-instance v2, Ljava/lang/StringBuffer;

    const-string/jumbo v3, "u0000"

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 33
    .local v2, "unicodeBuf":Ljava/lang/StringBuffer;
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    .line 35
    .local v1, "s":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    add-int/2addr v3, v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuffer;->setCharAt(IC)V

    .line 35
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 40
    :cond_0
    return-object v2
.end method
