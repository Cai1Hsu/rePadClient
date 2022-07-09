.class public Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Checksum.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Checksum;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FormatElement"
.end annotation


# static fields
.field private static final CHECKSUM:Ljava/lang/String; = "CHECKSUM"

.field private static final MD5SUM:Ljava/lang/String; = "MD5SUM"

.field private static final SVF:Ljava/lang/String; = "SVF"

.field private static formatMap:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 680
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;->formatMap:Ljava/util/HashMap;

    .line 686
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;->formatMap:Ljava/util/HashMap;

    const-string/jumbo v1, "CHECKSUM"

    new-instance v2, Ljava/text/MessageFormat;

    const-string/jumbo v3, "{0}"

    invoke-direct {v2, v3}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 687
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;->formatMap:Ljava/util/HashMap;

    const-string/jumbo v1, "MD5SUM"

    new-instance v2, Ljava/text/MessageFormat;

    const-string/jumbo v3, "{0} *{1}"

    invoke-direct {v2, v3}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 688
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;->formatMap:Ljava/util/HashMap;

    const-string/jumbo v1, "SVF"

    new-instance v2, Ljava/text/MessageFormat;

    const-string/jumbo v3, "MD5 ({1}) = {0}"

    invoke-direct {v2, v3}, Ljava/text/MessageFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 689
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 693
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 694
    return-void
.end method

.method public static getDefault()Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;
    .locals 2

    .prologue
    .line 701
    new-instance v0, Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;

    invoke-direct {v0}, Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;-><init>()V

    .line 702
    .local v0, "e":Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;
    const-string/jumbo v1, "CHECKSUM"

    invoke-virtual {v0, v1}, Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;->setValue(Ljava/lang/String;)V

    .line 703
    return-object v0
.end method


# virtual methods
.method public getFormat()Ljava/text/MessageFormat;
    .locals 2

    .prologue
    .line 711
    sget-object v0, Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;->formatMap:Ljava/util/HashMap;

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Checksum$FormatElement;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/MessageFormat;

    return-object v0
.end method

.method public getValues()[Ljava/lang/String;
    .locals 3

    .prologue
    .line 719
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "CHECKSUM"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "MD5SUM"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "SVF"

    aput-object v2, v0, v1

    return-object v0
.end method
