.class public Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;
.super Lorg/apache/tools/ant/types/EnumeratedAttribute;
.source "Tar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/tools/ant/taskdefs/Tar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TarLongFileMode"
.end annotation


# static fields
.field public static final FAIL:Ljava/lang/String; = "fail"

.field public static final GNU:Ljava/lang/String; = "gnu"

.field public static final OMIT:Ljava/lang/String; = "omit"

.field public static final TRUNCATE:Ljava/lang/String; = "truncate"

.field public static final WARN:Ljava/lang/String; = "warn"


# instance fields
.field private final validModes:[Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 859
    invoke-direct {p0}, Lorg/apache/tools/ant/types/EnumeratedAttribute;-><init>()V

    .line 855
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "warn"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "fail"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "truncate"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "gnu"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "omit"

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->validModes:[Ljava/lang/String;

    .line 860
    const-string/jumbo v0, "warn"

    invoke-virtual {p0, v0}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->setValue(Ljava/lang/String;)V

    .line 861
    return-void
.end method


# virtual methods
.method public getValues()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 867
    iget-object v0, p0, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->validModes:[Ljava/lang/String;

    return-object v0
.end method

.method public isFailMode()Z
    .locals 2

    .prologue
    .line 895
    const-string/jumbo v0, "fail"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isGnuMode()Z
    .locals 2

    .prologue
    .line 888
    const-string/jumbo v0, "gnu"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isOmitMode()Z
    .locals 2

    .prologue
    .line 902
    const-string/jumbo v0, "omit"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isTruncateMode()Z
    .locals 2

    .prologue
    .line 874
    const-string/jumbo v0, "truncate"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isWarnMode()Z
    .locals 2

    .prologue
    .line 881
    const-string/jumbo v0, "warn"

    invoke-virtual {p0}, Lorg/apache/tools/ant/taskdefs/Tar$TarLongFileMode;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
