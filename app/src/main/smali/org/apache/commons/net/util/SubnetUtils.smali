.class public Lorg/apache/commons/net/util/SubnetUtils;
.super Ljava/lang/Object;
.source "SubnetUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/net/util/SubnetUtils$1;,
        Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;
    }
.end annotation


# static fields
.field private static final IP_ADDRESS:Ljava/lang/String; = "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})"

.field private static final NBITS:I = 0x20

.field private static final SLASH_FORMAT:Ljava/lang/String; = "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,3})"

.field private static final addressPattern:Ljava/util/regex/Pattern;

.field private static final cidrPattern:Ljava/util/regex/Pattern;


# instance fields
.field private address:I

.field private broadcast:I

.field private inclusiveHostCount:Z

.field private netmask:I

.field private network:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    const-string/jumbo v0, "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/net/util/SubnetUtils;->addressPattern:Ljava/util/regex/Pattern;

    .line 33
    const-string/jumbo v0, "(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})\\.(\\d{1,3})/(\\d{1,3})"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lorg/apache/commons/net/util/SubnetUtils;->cidrPattern:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "cidrNotation"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->netmask:I

    .line 37
    iput v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->address:I

    .line 38
    iput v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->network:I

    .line 39
    iput v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->broadcast:I

    .line 42
    iput-boolean v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->inclusiveHostCount:Z

    .line 52
    invoke-direct {p0, p1}, Lorg/apache/commons/net/util/SubnetUtils;->calculate(Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "address"    # Ljava/lang/String;
    .param p2, "mask"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->netmask:I

    .line 37
    iput v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->address:I

    .line 38
    iput v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->network:I

    .line 39
    iput v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->broadcast:I

    .line 42
    iput-boolean v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->inclusiveHostCount:Z

    .line 63
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/net/util/SubnetUtils;->toCidrNotation(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils;->calculate(Ljava/lang/String;)V

    .line 64
    return-void
.end method

.method static synthetic access$000(Lorg/apache/commons/net/util/SubnetUtils;)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/net/util/SubnetUtils;

    .prologue
    .line 28
    iget v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->netmask:I

    return v0
.end method

.method static synthetic access$100(Lorg/apache/commons/net/util/SubnetUtils;)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/net/util/SubnetUtils;

    .prologue
    .line 28
    iget v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->network:I

    return v0
.end method

.method static synthetic access$200(Lorg/apache/commons/net/util/SubnetUtils;)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/net/util/SubnetUtils;

    .prologue
    .line 28
    iget v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->address:I

    return v0
.end method

.method static synthetic access$300(Lorg/apache/commons/net/util/SubnetUtils;)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/net/util/SubnetUtils;

    .prologue
    .line 28
    iget v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->broadcast:I

    return v0
.end method

.method static synthetic access$400(Lorg/apache/commons/net/util/SubnetUtils;Ljava/lang/String;)I
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/net/util/SubnetUtils;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lorg/apache/commons/net/util/SubnetUtils;->toInteger(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lorg/apache/commons/net/util/SubnetUtils;I)[I
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/net/util/SubnetUtils;
    .param p1, "x1"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lorg/apache/commons/net/util/SubnetUtils;->toArray(I)[I

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lorg/apache/commons/net/util/SubnetUtils;[I)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/net/util/SubnetUtils;
    .param p1, "x1"    # [I

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lorg/apache/commons/net/util/SubnetUtils;->format([I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lorg/apache/commons/net/util/SubnetUtils;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lorg/apache/commons/net/util/SubnetUtils;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2}, Lorg/apache/commons/net/util/SubnetUtils;->toCidrNotation(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private calculate(Ljava/lang/String;)V
    .locals 6
    .param p1, "mask"    # Ljava/lang/String;

    .prologue
    .line 203
    sget-object v3, Lorg/apache/commons/net/util/SubnetUtils;->cidrPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 205
    .local v2, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 206
    invoke-direct {p0, v2}, Lorg/apache/commons/net/util/SubnetUtils;->matchAddress(Ljava/util/regex/Matcher;)I

    move-result v3

    iput v3, p0, Lorg/apache/commons/net/util/SubnetUtils;->address:I

    .line 209
    const/4 v3, 0x5

    invoke-virtual {v2, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    const/4 v4, 0x0

    const/16 v5, 0x20

    invoke-direct {p0, v3, v4, v5}, Lorg/apache/commons/net/util/SubnetUtils;->rangeCheck(III)I

    move-result v0

    .line 210
    .local v0, "cidrPart":I
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 211
    iget v3, p0, Lorg/apache/commons/net/util/SubnetUtils;->netmask:I

    const/4 v4, 0x1

    rsub-int/lit8 v5, v1, 0x1f

    shl-int/2addr v4, v5

    or-int/2addr v3, v4

    iput v3, p0, Lorg/apache/commons/net/util/SubnetUtils;->netmask:I

    .line 210
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 215
    :cond_0
    iget v3, p0, Lorg/apache/commons/net/util/SubnetUtils;->address:I

    iget v4, p0, Lorg/apache/commons/net/util/SubnetUtils;->netmask:I

    and-int/2addr v3, v4

    iput v3, p0, Lorg/apache/commons/net/util/SubnetUtils;->network:I

    .line 218
    iget v3, p0, Lorg/apache/commons/net/util/SubnetUtils;->network:I

    iget v4, p0, Lorg/apache/commons/net/util/SubnetUtils;->netmask:I

    xor-int/lit8 v4, v4, -0x1

    or-int/2addr v3, v4

    iput v3, p0, Lorg/apache/commons/net/util/SubnetUtils;->broadcast:I

    .line 222
    return-void

    .line 220
    .end local v0    # "cidrPart":I
    .end local v1    # "j":I
    :cond_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Could not parse ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private format([I)Ljava/lang/String;
    .locals 3
    .param p1, "octets"    # [I

    .prologue
    .line 264
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 265
    .local v1, "str":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_1

    .line 266
    aget v2, p1, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 267
    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    if-eq v0, v2, :cond_0

    .line 268
    const-string/jumbo v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 271
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private matchAddress(Ljava/util/regex/Matcher;)I
    .locals 6
    .param p1, "matcher"    # Ljava/util/regex/Matcher;

    .prologue
    .line 241
    const/4 v0, 0x0

    .line 242
    .local v0, "addr":I
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_0
    const/4 v3, 0x4

    if-gt v1, v3, :cond_0

    .line 243
    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    const/4 v4, -0x1

    const/16 v5, 0xff

    invoke-direct {p0, v3, v4, v5}, Lorg/apache/commons/net/util/SubnetUtils;->rangeCheck(III)I

    move-result v2

    .line 244
    .local v2, "n":I
    and-int/lit16 v3, v2, 0xff

    rsub-int/lit8 v4, v1, 0x4

    mul-int/lit8 v4, v4, 0x8

    shl-int/2addr v3, v4

    or-int/2addr v0, v3

    .line 242
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 246
    .end local v2    # "n":I
    :cond_0
    return v0
.end method

.method private rangeCheck(III)I
    .locals 3
    .param p1, "value"    # I
    .param p2, "begin"    # I
    .param p3, "end"    # I

    .prologue
    .line 280
    if-le p1, p2, :cond_0

    if-gt p1, p3, :cond_0

    .line 281
    return p1

    .line 284
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Value ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "] not in range ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private toArray(I)[I
    .locals 4
    .param p1, "val"    # I

    .prologue
    .line 253
    const/4 v2, 0x4

    new-array v1, v2, [I

    .line 254
    .local v1, "ret":[I
    const/4 v0, 0x3

    .local v0, "j":I
    :goto_0
    if-ltz v0, :cond_0

    .line 255
    aget v2, v1, v0

    rsub-int/lit8 v3, v0, 0x3

    mul-int/lit8 v3, v3, 0x8

    ushr-int v3, p1, v3

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v2, v3

    aput v2, v1, v0

    .line 254
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 257
    :cond_0
    return-object v1
.end method

.method private toCidrNotation(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "mask"    # Ljava/lang/String;

    .prologue
    .line 305
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-direct {p0, p2}, Lorg/apache/commons/net/util/SubnetUtils;->toInteger(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p0, v1}, Lorg/apache/commons/net/util/SubnetUtils;->pop(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private toInteger(Ljava/lang/String;)I
    .locals 4
    .param p1, "address"    # Ljava/lang/String;

    .prologue
    .line 228
    sget-object v1, Lorg/apache/commons/net/util/SubnetUtils;->addressPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 229
    .local v0, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 230
    invoke-direct {p0, v0}, Lorg/apache/commons/net/util/SubnetUtils;->matchAddress(Ljava/util/regex/Matcher;)I

    move-result v1

    return v1

    .line 232
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Could not parse ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public final getInfo()Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;
    .locals 2

    .prologue
    .line 197
    new-instance v0, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lorg/apache/commons/net/util/SubnetUtils$SubnetInfo;-><init>(Lorg/apache/commons/net/util/SubnetUtils;Lorg/apache/commons/net/util/SubnetUtils$1;)V

    return-object v0
.end method

.method public isInclusiveHostCount()Z
    .locals 1

    .prologue
    .line 73
    iget-boolean v0, p0, Lorg/apache/commons/net/util/SubnetUtils;->inclusiveHostCount:Z

    return v0
.end method

.method pop(I)I
    .locals 3
    .param p1, "x"    # I

    .prologue
    const v2, 0x33333333

    .line 292
    ushr-int/lit8 v0, p1, 0x1

    const v1, 0x55555555

    and-int/2addr v0, v1

    sub-int/2addr p1, v0

    .line 293
    and-int v0, p1, v2

    ushr-int/lit8 v1, p1, 0x2

    and-int/2addr v1, v2

    add-int p1, v0, v1

    .line 294
    ushr-int/lit8 v0, p1, 0x4

    add-int/2addr v0, p1

    const v1, 0xf0f0f0f

    and-int p1, v0, v1

    .line 295
    ushr-int/lit8 v0, p1, 0x8

    add-int/2addr p1, v0

    .line 296
    ushr-int/lit8 v0, p1, 0x10

    add-int/2addr p1, v0

    .line 297
    and-int/lit8 v0, p1, 0x3f

    return v0
.end method

.method public setInclusiveHostCount(Z)V
    .locals 0
    .param p1, "inclusiveHostCount"    # Z

    .prologue
    .line 83
    iput-boolean p1, p0, Lorg/apache/commons/net/util/SubnetUtils;->inclusiveHostCount:Z

    .line 84
    return-void
.end method
