.class Lorg/apache/tools/ant/taskdefs/Touch$1;
.super Ljava/lang/Object;
.source "Touch.java"

# interfaces
.implements Lorg/apache/tools/ant/taskdefs/Touch$DateFormatFactory;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFallbackFormat()Ljava/text/DateFormat;
    .locals 3

    .prologue
    .line 79
    const/4 v0, 0x3

    const/4 v1, 0x2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v0, v1, v2}, Ljava/text/DateFormat;->getDateTimeInstance(IILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v0

    return-object v0
.end method

.method public getPrimaryFormat()Ljava/text/DateFormat;
    .locals 2

    .prologue
    const/4 v1, 0x3

    .line 75
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v1, v1, v0}, Ljava/text/DateFormat;->getDateTimeInstance(IILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v0

    return-object v0
.end method
