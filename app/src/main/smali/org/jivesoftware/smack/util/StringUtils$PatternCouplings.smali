.class Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;
.super Ljava/lang/Object;
.source "StringUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jivesoftware/smack/util/StringUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PatternCouplings"
.end annotation


# instance fields
.field formatter:Ljava/text/DateFormat;

.field needToConvertTimeZone:Z

.field pattern:Ljava/util/regex/Pattern;


# direct methods
.method public constructor <init>(Ljava/util/regex/Pattern;Ljava/text/DateFormat;)V
    .locals 1
    .param p1, "datePattern"    # Ljava/util/regex/Pattern;
    .param p2, "dateFormat"    # Ljava/text/DateFormat;

    .prologue
    .line 775
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 773
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;->needToConvertTimeZone:Z

    .line 776
    iput-object p1, p0, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;->pattern:Ljava/util/regex/Pattern;

    .line 777
    iput-object p2, p0, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;->formatter:Ljava/text/DateFormat;

    .line 778
    return-void
.end method

.method public constructor <init>(Ljava/util/regex/Pattern;Ljava/text/DateFormat;Z)V
    .locals 1
    .param p1, "datePattern"    # Ljava/util/regex/Pattern;
    .param p2, "dateFormat"    # Ljava/text/DateFormat;
    .param p3, "shouldConvertToRFC822"    # Z

    .prologue
    .line 780
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 773
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;->needToConvertTimeZone:Z

    .line 781
    iput-object p1, p0, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;->pattern:Ljava/util/regex/Pattern;

    .line 782
    iput-object p2, p0, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;->formatter:Ljava/text/DateFormat;

    .line 783
    iput-boolean p3, p0, Lorg/jivesoftware/smack/util/StringUtils$PatternCouplings;->needToConvertTimeZone:Z

    .line 784
    return-void
.end method


# virtual methods
.method public convertTime(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "dateString"    # Ljava/lang/String;

    .prologue
    .line 787
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5a

    if-ne v0, v1, :cond_0

    .line 788
    const-string/jumbo v0, "Z"

    const-string/jumbo v1, "+0000"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 795
    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "([\\+\\-]\\d\\d):(\\d\\d)"

    const-string/jumbo v1, "$1$2"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
